<architecture_docs>

<file path="baseline/BASELINE-DAILY_OPS-2215-0002.md">
~~~markdown
---
id: BASELINE-DAILY_OPS-2215-0002
title: >
  Daily Operations Baseline — 2215 (Queues, Access, Services, Incidents)
class: baseline
status: draft
version: 1.1.2
prefix: OPS
doc_language: ru-RU
prose_language: ru-RU
inputs:
  - CANON-CORE-GLOBAL-2215-0001
  - CANON-SYSTEMS-GLOBAL-2215-0001
  - CANON-ORDERS-GLOBAL-2215-0003
  - CANON-ARTIFACT-SNIPPETS-GLOBAL-2215-0001
depends_on:
  - SPEC-DOC-STYLE-2215-0001
  - SPEC-PRIORITY-RESOLUTION-2215-0001
scope: >
  Исполняемый baseline повседневной эксплуатации города (LEVEL-MID) в 2215 году:
  доступы, очереди, сервис-классы, инциденты, журналирование, типовые проверки.
  Документ задаёт дефолтные “операционные константы” сцены без введения SSOT-чисел.
  Уточняет связку: доступ/инцидент → артефакты → (при необходимости) ордер/мандат/исключение.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: define enforceable daily operational defaults for citizens and services (LEVEL-MID)
INPUTS:
  - CANON-CORE-GLOBAL-2215-0001
  - CANON-SYSTEMS-GLOBAL-2215-0001
  - CANON-ORDERS-GLOBAL-2215-0003
  - CANON-ARTIFACT-SNIPPETS-GLOBAL-2215-0001
  - SPEC-PRIORITY-RESOLUTION-2215-0001
OUTPUTS: [daily_ops_norms, access_defaults, incident_reactions, logging_constraints]
FORBIDDEN: [new_world_metrics, governance_macro_exposition, moral_judgements, prose, scene_generation]

---

## DEFINITIONS

[FACT][OPS-DEF-010] `LEVEL-MID` = стандартные городские условия без специальных лицензий и без экстерриториальных режимов.
[FACT][OPS-DEF-011] `service_class` ∈ {A, B, C, D} (A = критически-важные, D = комфорт/необязательные).
[FACT][OPS-DEF-012] `access_tier` ∈ {T0, T1, T2, T3} (T0 = публичное, T3 = ограниченное).
[FACT][OPS-DEF-013] `operator` = лицензированный исполнитель критической услуги (транспорт, вода, энергия, медицина, связь).
[FACT][OPS-DEF-014] `audit_trace` = минимально достаточная запись событий для воспроизводимости доступа/действия/решения.
[FACT][OPS-DEF-015] `procedural_basis` ∈ {order, mandate, emergency_exception}.
[FACT][OPS-DEF-016] `case_id` = идентификатор кейса, связывает действия, логи и артефакты.
[FACT][OPS-DEF-017] `evidence_bundle` = набор логов/снимков/экспортов, упакованный и запечатанный (hash + custody events) для допустимости.

---

## INVARIANTS

[DECISION][OPS-INV-010] Данный документ является исполняемым baseline для сцен и процедур (LEVEL-MID).
[DECISION][OPS-INV-011] Все пункты применимы по умолчанию для гражданских зон и сервисов.
[DECISION][OPS-INV-012] Отклонения допускаются только через explicit override или иной LEVEL/режим.
[DECISION][OPS-INV-013] Любая эскалация доступа/заморозка/принуждение MUST иметь `procedural_basis`.
[FORBIDDEN][OPS-INV-014] Делать “ручные договорённости” источником норм без explicit override.
[FORBIDDEN][OPS-INV-015] Использовать SSOT-диапазоны как фоновые числа эксплуатации.

---

## CONTENT

### 1) Identity & Access Defaults

[RULE][OPS-ACC-010] IF `zone.access_tier` ∈ {T1, T2, T3} THEN `ban_id_required` MUST be true.
[RULE][OPS-ACC-011] IF `identity_verification.status` = failed THEN `action` MUST be `deny_service` AND `case_id` MUST be opened.
[RULE][OPS-ACC-012] IF `citizen.requests_access_override` = true THEN `human_operator_review` MUST be true AND decision MUST be logged.
[RULE][OPS-ACC-013] IF `zone.access_tier` ∈ {T2, T3} THEN `allow_access` MUST require `procedural_basis`.

[FACT][OPS-ACC-014] `default_access_assumption` = "deny_by_default_for_T2_plus".
[FACT][OPS-ACC-015] `default_public_access` = T0.

### 2) Queues, Scheduling, and Service Windows

[RULE][OPS-QUE-010] IF `service_class` ∈ {A, B} THEN request MUST be `scheduled_or_queued` AND `queue_token` MUST be issued.
[RULE][OPS-QUE-011] IF `citizen.skips_queue` = true THEN `violation` MUST be `administrative_offense` AND service MAY be downgraded.
[RULE][OPS-QUE-012] IF `queue_token.expired` = true THEN request MUST be re-queued.

[FACT][OPS-QUE-013] `queue_visibility` = partial.
[FACT][OPS-QUE-014] `reroute_policy` = automatic.

### 3) Payments, Deposits, and Liability

[RULE][OPS-PAY-010] IF `service_class` ∈ {C, D} THEN `prepayment` MAY be required.
[RULE][OPS-PAY-011] IF `citizen.risk_flag` = elevated THEN `deposit` MUST be required for property-impacting services.
[RULE][OPS-PAY-012] IF `damage_occurs` = true THEN `liability` MUST be assigned via `audit_trace` AND `auto_claim` MAY be initiated.

[FACT][OPS-PAY-013] `refunds_mode` = "conditional_by_trace".

### 4) Logging, Evidence, and Admissibility

[RULE][OPS-LOG-010] Every access decision MUST create `audit_trace` with: who, what, where, when, decision, basis, `case_id`.
[RULE][OPS-LOG-011] IF `incident.severity` ∈ {S2, S3} THEN `evidence_bundle` MUST be sealed (hash + custody events) AND linked to `case_id`.
[FACT][OPS-LOG-012] `observability_model` = fragmented.

[RULE][OPS-LOG-013] IF `citizen.requests_full_log_export` = true THEN require `procedural_basis` = true AND export MUST be logged and scoped.
[RULE][OPS-LOG-014] IF `evidence_bundle.created` = true THEN `chain_of_custody` MUST exist.

### 5) Incident Ladder (Everyday → Procedural Escalation)

[FACT][OPS-INC-010] `severity` ∈ {S0, S1, S2, S3}.
[FACT][OPS-INC-011] S0 = service_noise; S1 = minor policy breach; S2 = safety/critical disruption; S3 = systemic threat.

[RULE][OPS-INC-012] IF `incident.severity` = S0 THEN action MUST be `auto_resolution` OR `queue_backoff` AND `log_minimum` MUST be true.
[RULE][OPS-INC-013] IF `incident.severity` = S1 THEN action MUST be `policy_enforcement` AND `citizen_notification` MUST be true AND `case_id` MAY be opened.
[RULE][OPS-INC-014] IF `incident.severity` = S2 THEN action MUST be `operator_escalation` AND `mode_restriction` MAY be applied AND `evidence_bundle` MUST be created.
[RULE][OPS-INC-015] IF `incident.severity` = S3 THEN action MUST be `FSSU_notification` AND `access_freeze` MAY be applied ONLY WITH `procedural_basis`.

### 6) Mode Restrictions (Non-punitive framing, procedural constraints)

[RULE][OPS-MOD-010] IF `risk_to_humans` = true THEN system MUST prefer `mode_restriction` over `punishment`.
[RULE][OPS-MOD-011] IF `mode_restriction.applied` = true THEN `duration` MUST be defined AND `review_trigger` MUST be scheduled AND decision MUST be logged (`case_id`).
[RULE][OPS-MOD-012] IF `mode_restriction.scope` impacts third_parties OR crosses operator boundary THEN require `procedural_basis` = true.

[FACT][OPS-MOD-013] `restriction_types` ∈ {partial_suspend, rate_limit, geofence, manual_review_required}.

### 7) Citizen Appeals (Procedural, trace-bound)

[RULE][OPS-APL-010] IF `citizen.files_appeal` = true THEN appeal MUST reference `audit_trace_id` OR `case_id`.
[RULE][OPS-APL-011] IF `appeal.has_trace_reference` = false THEN `appeal_status` MUST be `inadmissible`.
[RULE][OPS-APL-012] IF `appeal_status` = admissible THEN `outcome` MUST be one of: uphold | modify | revoke AND decision MUST be logged.

---

## USAGE / RESOLUTION

[DECISION][OPS-USE-010] This baseline MUST be referenced by scenes involving: access control, queues, service delivery, incidents, evidence/logging, appeals.
[DECISION][OPS-USE-011] Any scene deviating from these defaults MUST include an explicit override reference (and localized constraints/cost).
[DECISION][OPS-USE-012] Priority order is defined by SPEC-PRIORITY-RESOLUTION-2215-0001; baseline MUST NOT override canon/scene.

---

## OUTPUT CONTRACT

~~~yaml
doc_id: BASELINE-DAILY_OPS-2215-0002
role_type: RULE
export:
  - rule_id: OPS-ACC-010
    intent: "require BAN/ID for controlled access tiers"
    inputs: [zone.access_tier]
    outputs: [ban_id_required]
  - rule_id: OPS-ACC-013
    intent: "require procedural basis for T2+ access"
    inputs: [zone.access_tier]
    outputs: [procedural_basis_required]
  - rule_id: OPS-QUE-010
    intent: "enforce queue token for critical services"
    inputs: [service_class]
    outputs: [queue_token_issued]
  - rule_id: OPS-LOG-011
    intent: "seal evidence bundle for S2+ incidents"
    inputs: [incident.severity]
    outputs: [evidence_bundle_sealed, chain_of_custody_required]
  - rule_id: OPS-INC-015
    intent: "require procedural basis for S3 access freeze and notify FSSU"
    inputs: [incident.severity]
    outputs: [FSSU_notification, procedural_basis_required]
  - rule_id: OPS-APL-010
    intent: "appeals require trace reference"
    inputs: [appeal]
    outputs: [admissibility_status]
~~~

---

## FORBIDDEN

[FORBIDDEN][OPS-FBD-010] Depicting perfect/omniscient observability as default baseline.
[FORBIDDEN][OPS-FBD-011] Introducing new global metrics (energy/climate/population/etc.) in baseline.
[FORBIDDEN][OPS-FBD-012] Treating access/queue exceptions as “normal” without explicit override.
[FORBIDDEN][OPS-FBD-013] Applying `access_freeze` / cross-operator restrictions without `procedural_basis`.
[FORBIDDEN][OPS-FBD-014] Using emotional justification as procedural basis (appeals must reference trace).

---

## NON-NORMATIVE

~~~markdown
Baseline encodes operational friction as a constant: queues, denials, partial visibility,
trace-based decisions, evidence sealing, and procedural escalation thresholds. Scenes must
show these through artifacts and actions, not commentary.
~~~

~~~
</file>

<file path="baseline/BASELINE-DIGITAL_IDENTITY-2215-0001.md">
~~~markdown
---
id: BASELINE-DIGITAL_IDENTITY-2215-0001
title: >
  Digital Identity Baseline — 2215 (BAN_ID, Access, Post-Mortem)
class: baseline
status: fixed
version: 1.0.2
prefix: DID
doc_language: ru-RU
prose_language: ru-RU
inputs:
  - SSOT-SCENARIO-A-2215-0001
  - SSOT-LIFE-A-2215-0007
depends_on:
  - SPEC-DOC-STYLE-2215-0001
  - CANON-BASE-RULE-GLOBAL-2215-0001
  - BASELINE-SOCIAL-2215-0001
scope: >
  Исполняемый baseline цифровой идентичности и сетевых прав (LEVEL-MID) в 2215 году.
  Определяет жизненный цикл BAN_ID, режимы доступа, псевдонимность, аудит,
  и статус цифровых артефактов после смерти. Не задаёт параметры мира, только нормы.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: enforceable digital identity and access defaults for citizens (LEVEL-MID)
INPUTS:
  - SSOT-SCENARIO-A-2215-0001
  - SSOT-LIFE-A-2215-0007
  - CANON-BASE-RULE-GLOBAL-2215-0001
  - BASELINE-SOCIAL-2215-0001
OUTPUTS: [rule_id, access_outcomes, prohibited_patterns]
FORBIDDEN: [prose, cultural_exposition, speculative_ethics, mixed_role_types, world_parameter_binding]

---

## DEFINITIONS

[FACT][DID-DEF-010] `LEVEL-MID` = стандартные городские условия без специальных лицензий.
[FACT][DID-DEF-011] `BAN_ID` = биометрически связанная гражданская идентификация и сетевой профиль (Body Area Network).
[FACT][DID-DEF-012] `identity_claim` = предъявление BAN_ID для доступа к сервисам или зонам.
[FACT][DID-DEF-013] `access_token` = выдаваемый системой маркер доступа, связанный с BAN_ID.
[FACT][DID-DEF-014] `pseudonym` = разрешённый псевдо-идентификатор, связанный с BAN_ID через реестр.
[FACT][DID-DEF-015] `audit_log` = неизменяемый журнал событий доступа и прав.
[FACT][DID-DEF-016] `post_mortem_package` = набор цифровых артефактов после смерти.
[FACT][DID-DEF-017] `digital_snapshot` = статический слепок, разрешённый как memory_farewell.

[DECISION][DID-DEF-020] Any retention window MUST be expressed as a range in years.
[DECISION][DID-DEF-021] Any time threshold MUST be expressed in minutes OR years.

---

## INVARIANTS

[DECISION][DID-INV-010] This document MUST be treated as executable baseline for LEVEL-MID.
[DECISION][DID-INV-011] `BAN_ID` MUST be the primary identity primitive at LEVEL-MID.
[DECISION][DID-INV-012] Any deviation MUST use explicit override OR a different LEVEL baseline.

[FORBIDDEN][DID-INV-013] Introducing alternative identity primitives as defaults without explicit override.
[FORBIDDEN][DID-INV-014] Importing pre-2215 norms of anonymity as baseline defaults.

---

## CONTENT

### 1) Identity Lifecycle (BAN_ID)

[RULE][DID-LC-010] IF `person.status` = born THEN `BAN_ID` MUST be issued.
[RULE][DID-LC-011] IF `person.status` = alive THEN `BAN_ID` MUST remain active.
[RULE][DID-LC-012] IF `person.status` = dead THEN `BAN_ID` MUST be terminated.

[RULE][DID-LC-013] IF `BAN_ID.status` = terminated THEN `identity_claim` MUST be false.
[RULE][DID-LC-014] IF `BAN_ID.status` = terminated THEN `access_token` MUST be revoked.

### 2) Identity Claims (Everyday Access)

[RULE][DID-ACC-010] IF `zone` = public_mid THEN `identity_claim` MUST be required.
[RULE][DID-ACC-011] IF `zone` = work THEN `identity_claim` MUST be required.
[RULE][DID-ACC-012] IF `service.class` = essential THEN `identity_claim` MUST be required.

[FORBIDDEN][DID-ACC-020] Anonymous access to essential services at LEVEL-MID.
[FORBIDDEN][DID-ACC-021] Unregistered identity claims.

### 3) Pseudonymity

[RULE][DID-PSN-010] IF `user.uses_pseudonym` = true THEN `pseudonym` MUST be registry_linked_to_BAN_ID.
[DECISION][DID-PSN-011] IF `zone` = public_mid THEN `pseudonym` display MAY replace BAN_ID display.
[RULE][DID-PSN-012] IF `investigation.status` = active THEN pseudonym_linkage MUST be resolvable.

[FORBIDDEN][DID-PSN-020] Unresolvable pseudonyms at LEVEL-MID.
[FORBIDDEN][DID-PSN-021] Pseudonym usage to bypass access regimes.

### 4) Audit and Non-Repudiation

[RULE][DID-AUD-010] IF `identity_claim` = true THEN `audit_log` MUST record event.
[RULE][DID-AUD-011] IF `access_token.issued` = true THEN `audit_log` MUST record issuance.
[RULE][DID-AUD-012] IF `rights.changed` = true THEN `audit_log` MUST record change.

[FORBIDDEN][DID-AUD-020] Deleting `audit_log` entries.
[FORBIDDEN][DID-AUD-021] Disabling audit logging at LEVEL-MID without explicit override.

### 5) Right Suspension and Freezing

[DECISION][DID-SUS-010] IF `legal_status` = suspect THEN rights suspension MAY be permitted.
[RULE][DID-SUS-011] IF rights are suspended THEN essential_services_access MUST remain enabled_minimal.
[DECISION][DID-SUS-012] IF `investigation.status` = active THEN `BAN_ID` freezing MAY be permitted.
[RULE][DID-SUS-013] IF `BAN_ID.status` = frozen THEN `identity_claim` MUST be allowed_only_for_essential_services.

### 6) Post-Mortem Digital Status

[RULE][DID-PM-010] IF `person.status` = dead THEN `post_mortem_package` MUST be created.
[RULE][DID-PM-011] `digital_snapshot` MUST be allowed.
[FORBIDDEN][DID-PM-012] `interactive_identity_continuation`.
[RULE][DID-PM-013] Access MUST be governed_by_will_or_default_heirs.
[RULE][DID-PM-014] `audit_log` MUST remain immutable.

### 7) Data Retention and Erasure

[DECISION][DID-RET-010] `audit_log_retention_years` MUST satisfy x ∈ [30, 80] years.
[DECISION][DID-RET-011] `essential_identity_events_retention_years` MUST satisfy x ∈ [10, 30] years.

[RULE][DID-RET-020] IF `user.requests_erasure` = true THEN erasure MUST be limited_to_non_essential_artifacts.
[FORBIDDEN][DID-RET-021] Erasure of essential identity events.

---

## OUTPUT CONTRACT

~~~yaml
doc_id: BASELINE-DIGITAL_IDENTITY-2215-0001
role_type: RULE
export:
  - rule_id: DID-LC-012
  - rule_id: DID-ACC-010
  - rule_id: DID-PSN-010
  - rule_id: DID-AUD-010
  - rule_id: DID-PM-012
~~~

---

## FORBIDDEN

[FORBIDDEN][DID-FBD-010] Treating digital identity as narrative or philosophical exposition.
[FORBIDDEN][DID-FBD-011] Introducing alternative identity systems without explicit override.
[FORBIDDEN][DID-FBD-012] Mixed ROLE_TYPE content.
[FORBIDDEN][DID-FBD-013] Statements without IDs.

---

## NON-NORMATIVE

~~~text
Identity is modeled as an access primitive and audit surface, not a cultural concept.
~~~

~~~
</file>

<file path="baseline/BASELINE-FSSU-CASE-ACTIVATION-2215-0001.md">
~~~markdown
---
id: BASELINE-FSSU-CASE-ACTIVATION-2215-0001
title: >
  ФССУ — Активация кейса — intake, triage, пороги и немедленные эффекты (2215)
class: baseline
status: draft
version: 1.0.0
prefix: OCA
doc_language: ru-RU
prose_language: ru-RU
inputs: []
depends_on:
  - CANON-FSSU-GLOBAL-2215-0005
  - CANON-SYSTEM-ONTOLOGY-2215-0001
  - SPEC-DOC-ID-2215-0001
  - SPEC-DOC-STYLE-2215-0001
  - SPEC-PRIORITY-RESOLUTION-2215-0001
scope: >
  RULE-baseline процедуры активации кейса ФССУ: intake → triage → activation → assignment.
  Задаёт пороги кейса (Safety_Impact / Sovereignty_Impact) и немедленные эффекты (preservation window).
  Не описывает региональные конвейеры и локации.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: define baseline procedure for FSSU case activation from intake to assignment with impact thresholds and immediate safeguards
INPUTS: []
OUTPUTS: [activation_flow, activation_thresholds, decision_authority, immediate_effects]
FORBIDDEN: [scene_text, narrative_prose, undefined_terms, regional_specifics]

## DEFINITIONS

[FACT][OCA-010] `intake_signal` = входящий сигнал/инцидент, требующий triage на предмет юрисдикции и порогов кейса.
[FACT][OCA-020] `triage` = процедура квалификации `intake_signal` по FSSU-JUR-010 и оценке Impact.
[FACT][OCA-030] `activation` = перевод `intake_signal` в `case` с назначением `case_owner` и фиксацией формы.
[FACT][OCA-040] `case_threshold` = порог, при котором Impact считается достаточным для активации кейса.
[FACT][OCA-050] `preservation_window` = немедленный режим защиты данных/следов до стабилизации Systemic_Channel и фиксации артефактов.

## INVARIANTS

[DECISION][OCA-100] `activation` MUST be gated by FSSU-JUR-010 (см. CANON-FSSU-GLOBAL-2215-0005).
[DECISION][OCA-110] `triage` MUST produce an explicit record: {Systemic_Asset, Systemic_Channel, Safety_Impact, Sovereignty_Impact}.
[DECISION][OCA-120] `activation` MUST assign `case_owner`.
[FORBIDDEN][OCA-130] Активация кейса без фиксируемой процедурной формы (mandate/order/emergency).
[FORBIDDEN][OCA-140] Деактивация активированного кейса политическим давлением как нормальная практика.

## CONTENT

### 1. Intake → Triage

[RULE][OCA-200] IF `intake_signal.received` = true THEN `triage.required` MUST be true; ELSE FAIL.
[RULE][OCA-210] IF `triage.required` = true THEN `triage.record` MUST include {Systemic_Asset,Systemic_Channel,Safety_Impact,Sovereignty_Impact}; ELSE FAIL.
[RULE][OCA-220] IF `triage.required` = true THEN `triage.must_evaluate_jurisdiction` MUST be true; ELSE FAIL.

### 2. Jurisdiction Gate

[RULE][OCA-300] IF FSSU-300 FAIL THEN `activation.permitted` MUST be false; ELSE FAIL.
[RULE][OCA-310] IF `activation.permitted` = false THEN `intake_signal.route` MUST be "transfer_by_competence"; ELSE FAIL.

### 3. Impact Threshold Gate

[RULE][OCA-400] PASS IFF (`triage.Safety_Impact` >= `case_threshold`) OR (`triage.Sovereignty_Impact` >= `case_threshold`); ELSE FAIL.
[RULE][OCA-410] IF OCA-400 FAIL THEN `activation.permitted` MUST be false; ELSE FAIL.

### 4. Decision Authority

[DECISION][OCA-500] `activation.decision_authority` MUST be human.
[RULE][OCA-510] IF `activation.permitted` = true THEN `activation.decision_authority` MUST be human; ELSE FAIL.
[RULE][OCA-520] IF `activation.permitted` = true THEN `activation.ai_may_recommend` MUST be true AND `activation.ai_must_not_activate` MUST be true; ELSE FAIL.

### 5. Activation Form and Assignment

[RULE][OCA-600] IF `activation.permitted` = true THEN `activation.form` MUST be one of {mandate, order, emergency}; ELSE FAIL.
[RULE][OCA-610] IF `activation.permitted` = true THEN `case.created` MUST be true; ELSE FAIL.
[RULE][OCA-620] IF `case.created` = true THEN `case_owner.assigned` MUST be true; ELSE FAIL.

### 6. Immediate Effects (Preservation Window)

[DECISION][OCA-700] `preservation_window.effects_min` MUST include {data_protection, evidence_preservation, access_control_tightening, logging_intensification}.
[RULE][OCA-710] IF `case.created` = true THEN `preservation_window.active` MUST be true; ELSE FAIL.
[RULE][OCA-720] IF `preservation_window.active` = true THEN `preservation_window.effects` MUST include `preservation_window.effects_min`; ELSE FAIL.

### 7. Deactivation Constraints

[RULE][OCA-800] IF `case.created` = true THEN `case.deactivation.requires_recorded_basis` MUST be true; ELSE FAIL.
[RULE][OCA-810] IF `case.created` = true THEN `case.deactivation.basis` MUST be one of {channel_stabilized, asset_stabilized, transferred_by_competence, judicial_stop}; ELSE FAIL.

## USAGE / RESOLUTION

[DECISION][OCA-900] Любая сцена, где активируется кейс ФССУ, MUST следовать OCA-200..OCA-810; ELSE FAIL.
[DECISION][OCA-910] Conflict resolution MUST follow SPEC-PRIORITY-RESOLUTION-2215-0001; ELSE FAIL.

## OUTPUT CONTRACT

~~~yaml
doc_id: BASELINE-FSSU-CASE-ACTIVATION-2215-0001
role_type: RULE
export:
  - rule_id: OCA-200
    intent: require triage on intake
    inputs: [intake_signal.received]
    outputs: [triage.required]
  - rule_id: OCA-300
    intent: jurisdiction gate
    inputs: [FSSU-300]
    outputs: [activation.permitted]
  - rule_id: OCA-400
    intent: impact threshold gate
    inputs: [triage.Safety_Impact, triage.Sovereignty_Impact, case_threshold]
    outputs: [activation.permitted]
  - rule_id: OCA-620
    intent: require case owner assignment on activation
    inputs: [case.created]
    outputs: [case_owner.assigned]
  - rule_id: OCA-720
    intent: enforce preservation window effects
    inputs: [preservation_window.active]
    outputs: [preservation_window.effects]
~~~

## FORBIDDEN

[FORBIDDEN][OCA-980] Региональные детали конвейера решений (ГОРОД-1/ГОРОД-2, human gate) в этом документе; ELSE FAIL.
[FORBIDDEN][OCA-981] Подмена порогов кейса “по ощущению” без прохождения OCA-400; ELSE FAIL.
[FORBIDDEN][OCA-982] Активация кейса ИИ-системой без решения человека; ELSE FAIL.

## NON-NORMATIVE

~~~text
Этот baseline описывает только “как кейс появляется” и какие немедленные эффекты включаются.
Региональный конвейер RU-16 (включая human gate и ГОРОД-1/2) фиксируется в CANON-FSSU-REGIONAL-RU16-2215-0001.
Whitelist low-impact автономии фиксируется в REG-FSSU-AUTO-LOWIMPACT-2215-0001.
~~~

~~~
</file>

<file path="baseline/BASELINE-OBSERVABILITY-2215-0001.md">
~~~markdown
---
id: BASELINE-OBSERVABILITY-2215-0001
title: >
  Urban Observability Baseline — 2215 (Telemetry, Visibility, Blind Spots)
class: baseline
status: fixed
version: 1.0.1
prefix: OBS
doc_language: ru-RU
prose_language: ru-RU
inputs:
  - SSOT-SCENARIO-A-2215-0001
depends_on:
  - CANON-BASE-RULE-GLOBAL-2215-0001
  - BASELINE-SOCIAL-2215-0001
  - BASELINE-DIGITAL_IDENTITY-2215-0001
scope: >
  Исполняемый baseline городской наблюдаемости (LEVEL-MID) в 2215 году.
  Определяет допустимый объём телеметрии, задержки наблюдения, субъектов доступа
  и легальные слепые зоны. Не описывает мир, только нормативные пределы.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: enforceable defaults for urban observability and telemetry (LEVEL-MID)
INPUTS:
  - CANON-BASE-RULE-GLOBAL-2215-0001
  - BASELINE-SOCIAL-2215-0001
  - BASELINE-DIGITAL_IDENTITY-2215-0001
OUTPUTS: [rule_id, observability_surface, access_rights]
FORBIDDEN: [prose, cultural_exposition, speculative_technology, mixed_role_types]

---

## DEFINITIONS

[FACT][OBS-DEF-010] `LEVEL-MID` = стандартные городские условия без специальных лицензий.
[FACT][OBS-DEF-011] `urban_telemetry` = автоматический сбор сигналов о присутствии, движении и событиях в публичном пространстве.
[FACT][OBS-DEF-012] `telemetry_event` = атомарное событие наблюдаемости (вход, выход, аномалия, нарушение).
[FACT][OBS-DEF-013] `real_time` = задержка наблюдения ≤ 30 seconds.
[FACT][OBS-DEF-014] `delayed_view` = задержка наблюдения > 30 seconds.
[FACT][OBS-DEF-015] `blind_spot` = зона с легально сниженной или отсутствующей телеметрией.

[DECISION][OBS-DEF-020] Time units MUST be expressed in `seconds` or `minutes`.
[DECISION][OBS-DEF-021] Spatial scope MUST be expressed as `zone_class`.

---

## INVARIANTS

[DECISION][OBS-INV-010] This document MUST be treated as executable baseline for LEVEL-MID.
[DECISION][OBS-INV-011] Urban observability MUST be partial, not omniscient.
[FORBIDDEN][OBS-INV-012] Implicit assumption of total or continuous surveillance.
[FORBIDDEN][OBS-INV-013] Introducing predictive or clairvoyant observability as baseline.

---

## CONTENT

### 1. Telemetry Surface (What Is Observed)

[RULE][OBS-SUR-010] IF `zone` == public_mid THEN `urban_telemetry` MUST collect presence_events.
[RULE][OBS-SUR-011] IF `zone` == public_mid THEN `urban_telemetry` MUST collect movement_vectors.
[RULE][OBS-SUR-012] IF `zone` == public_mid THEN `urban_telemetry` MUST collect safety_anomalies.

[FORBIDDEN][OBS-SUR-020] Continuous biometric streams at LEVEL-MID.
[FORBIDDEN][OBS-SUR-021] Emotion or intent inference from telemetry as baseline.

### 2. Latency and Granularity

[RULE][OBS-LAT-010] IF `telemetry_event.class` == safety_anomaly THEN `view_latency` MUST satisfy x ≤ 30 seconds.
[RULE][OBS-LAT-011] IF `telemetry_event.class` == presence_event THEN `view_latency` MUST satisfy x ∈ [1, 15] minutes.
[RULE][OBS-LAT-012] IF `telemetry_event.class` == movement_vector THEN `view_granularity` MUST be coarse.

[FORBIDDEN][OBS-LAT-020] City-wide real_time reconstruction of individual trajectories.

### 3. Access Rights (Who Can See)

[RULE][OBS-ACC-010] Municipal operators MAY access aggregated telemetry views.
[RULE][OBS-ACC-011] Infrastructure operators MAY access telemetry limited to their assets.
[RULE][OBS-ACC-012] `law_enforcement` MAY access de-anonymized telemetry ONLY IF `investigation.status` == active.

[FORBIDDEN][OBS-ACC-020] Public real-time individual tracking dashboards.
[FORBIDDEN][OBS-ACC-021] Cross-operator unrestricted telemetry sharing.

### 4. Blind Spots (Legal Non-Observability)

[RULE][OBS-BSP-010] `licensed_private_zone` MUST be treated as blind_spot.
[RULE][OBS-BSP-011] `faraday_hotel` MUST be treated as blind_spot.

[RULE][OBS-BSP-012] IF `zone` == blind_spot THEN `allowed_telemetry` MUST be perimeter_events_only.
[RULE][OBS-BSP-013] IF `zone` == blind_spot THEN `internal_presence_collection` MUST be forbidden.

[FORBIDDEN][OBS-BSP-020] Treating blind_spot usage as suspicious by default.

### 5. Post-Factum Resolution

[RULE][OBS-PFR-010] IF `incident.status` == reported THEN telemetry MAY be reconstructed post_factum.
[RULE][OBS-PFR-011] `post_factum_reconstruction` MUST rely on stored telemetry_events only.

[FORBIDDEN][OBS-PFR-020] Retroactive inference beyond recorded telemetry.

---

## USAGE / RESOLUTION

[DECISION][OBS-USE-010] Urban scenes MUST apply OBS-SUR-* and OBS-LAT-* defaults unless overridden.
[DECISION][OBS-USE-011] Scenes involving investigations MUST apply OBS-ACC-* and OBS-PFR-* rules.
[FORBIDDEN][OBS-USE-012] Depicting omniscient city awareness at LEVEL-MID.

---

## OUTPUT CONTRACT

~~~yaml
doc_id: BASELINE-OBSERVABILITY-2215-0001
role_type: RULE
export:
  - rule_id: OBS-SUR-010
    intent: collect presence telemetry in public_mid zones
    inputs: [zone]
    outputs: [presence_events]
  - rule_id: OBS-LAT-010
    intent: enforce latency bounds for safety anomalies
    inputs: [telemetry_event.class]
    outputs: [view_latency]
  - rule_id: OBS-BSP-010
    intent: define licensed private zones as blind spots
    inputs: [zone]
    outputs: [blind_spot]
~~~

---

## FORBIDDEN

[FORBIDDEN][OBS-FBD-010] Omniscient or god-view surveillance depiction.
[FORBIDDEN][OBS-FBD-011] Instant knowledge of individual actions without telemetry basis.
[FORBIDDEN][OBS-FBD-012] Predictive city behaviour as baseline.
[FORBIDDEN][OBS-FBD-013] Mixed ROLE_TYPE content inside this document.
[FORBIDDEN][OBS-FBD-014] Floating bullets without statement IDs.

---

## NON-NORMATIVE

This baseline constrains observation to partial, delayed, and role-bound views.
Suspense MUST arise from gaps, latency, and procedure—not omniscience.
~~~
</file>

<file path="baseline/BASELINE-PHYSICAL_LEVEL_MID-2215-0001.md">
~~~markdown
---
id: BASELINE-PHYSICAL_LEVEL_MID-2215-0001
title: >
  Physical Environment Baseline — LEVEL-MID (2215)
class: baseline
status: fixed
version: 1.1.1
prefix: PHY
doc_language: ru-RU
prose_language: ru-RU
inputs: []
depends_on:
  - SPEC-DOC-STYLE-2215-0001
  - SSOT-SCENARIO-A-2215-0001
scope: >
  Исполняемый baseline физической среды и повседневных условий для сцен романа в 2215 году.
  Определяет значения по умолчанию (LEVEL-MID) и запрещённые состояния. Используется напрямую
  при написании сцен.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: enforce LEVEL-MID physical-environment defaults and forbid out-of-band physical states in scenes.
INPUTS: [scene.access_level, scene.environment_snapshot]
OUTPUTS: [resolved_level, resolved_defaults, forbidden_violations]
FORBIDDEN: [invent_physical_baseline_values, mix_levels_without_override, narrative_explanations_as_baseline]

## DEFINITIONS

[FACT][PHY-DEF-010] `access_level` ∈ {`LEVEL-LOW`, `LEVEL-MID`, `LEVEL-HIGH`}.
[FACT][PHY-DEF-011] `LEVEL-MID` = default physical-environment baseline for any scene without explicit level selection.
[FACT][PHY-DEF-012] `environment_snapshot` = набор полей сцены (2–5), выбираемых из сенсорных дефолтов документа.
[FACT][PHY-DEF-013] `override` = явное указание в сцене, выводящее параметр за пределы baseline диапазона.

## INVARIANTS

[DECISION][PHY-INV-010] All scenes MUST resolve `access_level` via this document unless a higher-precedence RULE forbids it.
[DECISION][PHY-INV-011] If a scene does not specify `access_level`, THEN `access_level = LEVEL-MID`.
[DECISION][PHY-INV-012] `LEVEL-LOW` and `LEVEL-HIGH` MUST be used ONLY IF explicitly specified in the scene.
[FORBIDDEN][PHY-INV-020] Scenes MUST NOT introduce assumptions, analytics, or source citations as baseline content.
[FORBIDDEN][PHY-INV-021] Scenes MUST NOT replace baseline constraints with CANON or SCENARIO reasoning.
[FORBIDDEN][PHY-INV-022] Scenes MUST NOT use emotional judgments where a measurable baseline parameter is defined.

## CONTENT

### 1) Access Levels

[RULE][PHY-ACL-010] IF `scene.access_level` is undefined THEN set `scene.access_level = LEVEL-MID`.
[RULE][PHY-ACL-011] IF `scene.access_level ∈ {LEVEL-LOW, LEVEL-HIGH}` THEN the scene MUST include an explicit level tag and an in-scene justification via procedure/event (not prose).

### 2) Housing (LEVEL-MID defaults)

[DECISION][PHY-HOU-010] LEVEL-MID.housing.type = multi_apartment_flat.
[DECISION][PHY-HOU-011] LEVEL-MID.housing.area = sufficient_for_1_to_few_people_without_excess_space.
[DECISION][PHY-HOU-012] LEVEL-MID.housing.climate_control = present_and_stable.
[DECISION][PHY-HOU-013] LEVEL-MID.housing.water_and_sewage = reliable_and_continuous.
[DECISION][PHY-HOU-014] LEVEL-MID.housing.lighting = energy_efficient_with_auto_control.
[DECISION][PHY-HOU-015] LEVEL-MID.housing.sound_isolation = sufficient_for_daily_comfort.
[DECISION][PHY-HOU-016] LEVEL-MID.housing.furnishing = baseline_furniture_and_built_in_systems_present.
[FORBIDDEN][PHY-HOU-020] LEVEL-MID MUST NOT include luxury_mansions_or_palaces.
[FORBIDDEN][PHY-HOU-021] LEVEL-MID MUST NOT include slums_or_emergency_housing.

### 3) Transport (LEVEL-MID defaults)

[DECISION][PHY-TRN-010] LEVEL-MID.transport.autonomy = autonomous_norm.
[DECISION][PHY-TRN-011] LEVEL-MID.transport.personal_vehicle = possible_but_not_required.
[DECISION][PHY-TRN-012] LEVEL-MID.transport.city_travel_time = predictable_and_relatively_low.
[DECISION][PHY-TRN-013] LEVEL-MID.transport.intercity = available_with_planning_required.
[FORBIDDEN][PHY-TRN-020] Manual_driving_as_mass_norm is forbidden in LEVEL-MID.
[FORBIDDEN][PHY-TRN-021] Complete_transport_isolation is forbidden in LEVEL-MID.

### 4) Workspaces & public spaces (LEVEL-MID defaults)

[DECISION][PHY-WPS-010] LEVEL-MID.workspaces = clean_functional_automated.
[DECISION][PHY-WPS-011] LEVEL-MID.work_mode = remote_or_hybrid.
[DECISION][PHY-WPS-012] LEVEL-MID.work_mode_prevalence = common.
[DECISION][PHY-WPS-013] LEVEL-MID.public_spaces = safe_and_serviced_by_automation.
[DECISION][PHY-WPS-014] LEVEL-MID.access_control = regulated_by_procedures_and_identification.
[FORBIDDEN][PHY-WPS-020] Dangerous_unmanaged_or_chaotic_work_conditions are forbidden in LEVEL-MID.
[FORBIDDEN][PHY-WPS-021] Excessively_elite_or_isolated_spaces are forbidden in LEVEL-MID.

### 5) Human body & health (LEVEL-MID defaults)

[DECISION][PHY-HLT-010] LEVEL-MID.human_body = biological_without_radical_modifications.
[DECISION][PHY-HLT-011] LEVEL-MID.healthcare_access = high_and_stable.
[DECISION][PHY-HLT-012] LEVEL-MID.chronic_conditions = manageable_and_controlled.
[DECISION][PHY-HLT-013] LEVEL-MID.therapeutic_implants = possible_not_required.
[FORBIDDEN][PHY-HLT-020] Mass_radical_cybernetic_modification is forbidden in LEVEL-MID.
[FORBIDDEN][PHY-HLT-021] Absence_of_medical_help is forbidden in LEVEL-MID.

### 6) Daily physical reality (LEVEL-MID defaults)

[DECISION][PHY-DLY-010] LEVEL-MID.environment = clean_and_functional.
[DECISION][PHY-DLY-011] LEVEL-MID.food = available_and_safe.
[DECISION][PHY-DLY-012] LEVEL-MID.power_supply = stable_and_continuous.
[DECISION][PHY-DLY-013] LEVEL-MID.household_automation = comfort_level_not_luxury.
[FORBIDDEN][PHY-DLY-020] Post_apocalyptic_conditions are forbidden in LEVEL-MID.
[FORBIDDEN][PHY-DLY-021] Utopian_excess_as_background is forbidden in LEVEL-MID.

### 7) Scene sensor snapshot defaults (LEVEL-MID)

[DECISION][PHY-SNS-010] `noise_indoor_db.range = [34, 46]` and `noise_indoor_db.p50 = 40`.
[DECISION][PHY-SNS-011] `noise_transit_db.range = [52, 70]` and `noise_transit_db.p50 = 61`.
[DECISION][PHY-SNS-012] `noise_exposed_db.range = [56, 74]` and `noise_exposed_db.p50 = 64`.
[FORBIDDEN][PHY-SNS-013] `noise_*_db > 85` is forbidden WITHOUT explicit `override`.

[DECISION][PHY-SNS-020] `humidity_indoor_pct.range = [30, 55]` and `humidity_indoor_pct.p50 = 42`.
[DECISION][PHY-SNS-021] `humidity_outdoor_pct.range = [45, 85]` and `humidity_outdoor_pct.p50 = 68`.
[DECISION][PHY-SNS-022] `wind_exposed_ms.range = [6, 16]` and `wind_exposed_ms.p50 = 11`.
[DECISION][PHY-SNS-023] `temperature_indoor_c.range = [19, 23]` and `temperature_indoor_c.p50 = 21`.
[FORBIDDEN][PHY-SNS-024] `temperature_indoor_c < 16` is forbidden WITHOUT explicit `override`.
[FORBIDDEN][PHY-SNS-025] `temperature_indoor_c > 27` is forbidden WITHOUT explicit `override`.

[DECISION][PHY-SNS-030] `light_ct_k.range = [3800, 4300]` and `light_ct_k.p50 = 4100` for service_and_transit_zones.
[DECISION][PHY-SNS-031] `visibility_outdoor_m.range = [400, 2000]` and `visibility_outdoor_m.p50 = 1200` under normal_conditions.
[FORBIDDEN][PHY-SNS-032] `visibility_outdoor_m < 100` is forbidden WITHOUT explicit `override`.

[DECISION][PHY-SNS-040] `latency_ms.range = [60, 180]` and `latency_ms.p50 = 110` for civil_loops.
[DECISION][PHY-SNS-041] `packet_loss_pct.range = [0.0, 1.5]` and `packet_loss_pct.p50 = 0.3`.
[FORBIDDEN][PHY-SNS-042] `packet_loss_pct > 5.0` is forbidden WITHOUT explicit `override`.

[DECISION][PHY-SNS-050] `traffic_flow.range = [0.45, 0.80]` and `traffic_flow.p50 = 0.62` with domain `0..1` where `1 = high_friction`.
[FORBIDDEN][PHY-SNS-051] `traffic_flow > 0.92` is forbidden WITHOUT explicit `override`.

[DECISION][PHY-SNS-060] IF `background_noise_tag` is used THEN it MUST be a neutral label with length ≤ 3 words; ELSE FAIL.
[FORBIDDEN][PHY-SNS-061] `background_noise_tag` MUST NOT be emotional (examples: oppressive, terrifying, depressing).

### 8) Global forbidden defaults

[FORBIDDEN][PHY-FBD-010] Magic_or_unexplained_physical_effects are forbidden as background.
[FORBIDDEN][PHY-FBD-011] Violation_of_known_physics is forbidden WITHOUT explicit canonical basis.
[FORBIDDEN][PHY-FBD-012] Total_posthuman_transhumanism is forbidden as default background.
[FORBIDDEN][PHY-FBD-013] Total_physical_environment_degradation is forbidden as default background.

### 9) Scene micro-checklist (mechanical)

[RULE][PHY-CHK-010] IF `scene.access_level != LEVEL-MID` THEN the scene MUST declare the level explicitly.
[RULE][PHY-CHK-011] IF `scene.access_level` is set THEN housing/transport/body/workspaces MUST conform to that level’s allowed set.
[RULE][PHY-CHK-012] Any out-of-range sensor value MUST be marked as `override` and treated as an event/condition, not background.
[RULE][PHY-CHK-013] The scene MUST be reproducible: physical details MUST NOT contradict baseline constraints.

## USAGE / RESOLUTION

[DECISION][PHY-USE-010] Resolution target: produce `resolved_level` and a set of `resolved_defaults` for the scene.
[DECISION][PHY-USE-011] IF `environment_snapshot` is used in a scene THEN the scene MUST select k ∈ [2, 5] fields from it; ELSE FAIL.
[DECISION][PHY-USE-012] Any `override` MUST be explicit and local: it changes only the referenced parameter(s), not the entire level.
[DECISION][PHY-USE-013] If a scene needs luxury/utopia or slums/collapse, THEN it MUST switch to `LEVEL-HIGH` or `LEVEL-LOW` respectively, not “bend” LEVEL-MID.

## OUTPUT CONTRACT

~~~yaml
doc_id: BASELINE-PHYSICAL_LEVEL_MID-2215-0001
role_type: RULE
export:
  - rule_id: PHY-ACL-010
    intent: "default access_level to LEVEL-MID when unspecified"
    inputs: [scene.access_level]
    outputs: [scene.access_level]
  - rule_id: PHY-SNS-013
    intent: "forbid noise_*_db above 85 unless explicit override"
    inputs: [scene.environment_snapshot.noise_*_db, scene.override]
    outputs: [forbidden_violations]
  - rule_id: PHY-CHK-012
    intent: "out-of-range sensor values require explicit override and become events"
    inputs: [scene.environment_snapshot.*, scene.override]
    outputs: [forbidden_violations, resolved_defaults]
~~~

## FORBIDDEN

[FORBIDDEN][PHY-FRB-010] Introducing new baseline physical ranges without updating this baseline document.
[FORBIDDEN][PHY-FRB-011] Mixing LEVEL-MID defaults with LEVEL-LOW or LEVEL-HIGH states without explicit scene level selection.
[FORBIDDEN][PHY-FRB-012] Using emotional evaluation in place of baseline-measurable parameters when such parameters are present.
[FORBIDDEN][PHY-FRB-013] Treating out-of-range sensor values as “background” without explicit override.

## NON-NORMATIVE

~~~markdown
Example environment_snapshot (LEVEL-MID, valid):
- noise_indoor_db: 41
- humidity_indoor_pct: 38
- temperature_indoor_c: 21
- latency_ms: 120
- background_noise_tag: vent_hum
~~~

~~~
</file>

<file path="baseline/BASELINE-PSYCH-2215-0001.md">
~~~markdown
---
id: BASELINE-PSYCH-2215-0001
title: >
  Psychological Baseline — 2215 (Density, Transactionalism, Worldview)
class: baseline
status: fixed
version: 1.3.0
prefix: PSY
doc_language: ru-RU
prose_language: ru-RU
inputs:
  - BASELINE-SOCIAL-2215-0001
  - SSOT-URBANISM-A-2215-0007
depends_on: []
scope: >
  Психологический baseline жителя LEVEL-MID. Только состояния.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: define default psychological traits and attitudes
INPUTS: [BASELINE-SOCIAL-2215-0001, SSOT-URBANISM-A-2215-0007]
OUTPUTS: [behavioral_norms, world_attitudes, neuroses]
FORBIDDEN: []

## DEFINITIONS

[FACT][PSY-010] Density_Fatigue = хроническая усталость от высокой плотности людей.
[FACT][PSY-020] Transactionalism = оценка действий через затраты и выгоду.
[FACT][PSY-030] Algorithmic_Fatalism = вера в математическое превосходство системы.

## INVARIANTS

[DECISION][PSY-040] Personal_bubble_devices MUST be common.
[DECISION][PSY-050] Noise MUST be default.
[DECISION][PSY-060] Silence MUST be perceived_as_luxury.

## CONTENT

[STATE][PSY-100] public_mask = THOUSAND_YARD_STARE.
[STATE][PSY-110] conflict_response = IGNORE_OR_EVADE.
[STATE][PSY-120] personal_space = COMPRESSIBLE.
[STATE][PSY-130] politeness = EFFICIENT_MINIMAL.

[STATE][PSY-140] dominant_stress = UNPLANNED_DEBT.
[STATE][PSY-150] reflex_pre_transaction = CHECK_BALANCE.
[STATE][PSY-160] waste_reaction = IRRITATION.

[STATE][PSY-170] trust_circle = UNIT_ONLY.
[STATE][PSY-180] physical_touch_outside_unit = ZERO.
[STATE][PSY-190] strangers = OBSTACLES_OR_DATA_POINTS.

[STATE][PSY-200] syndrome_box_claustrophobia = PRESENT.
[STATE][PSY-210] syndrome_algorithmic_paranoia = PRESENT.
[STATE][PSY-220] syndrome_touch_aggression = PRESENT.

[STATE][PSY-230] mech_sensory = ACTIVE_NOISE_CANCELLATION.
[STATE][PSY-240] mech_chemical = FUNCTIONAL_STIMS.
[STATE][PSY-250] mech_control = MICRO_CUSTOMIZATION.

[STATE][PSY-260] work_view = LICENSE_TO_EXIST.
[STATE][PSY-270] corp_trust = ZERO.
[STATE][PSY-280] automation_fear = HIGH.

[STATE][PSY-290] state_view = PROTECTIVE_BUT_COLD.
[STATE][PSY-300] justice_view = ARITHMETIC.
[STATE][PSY-310] politics_interest = LOW.

[STATE][PSY-320] city_view = LIFE_SUPPORT_SYSTEM.
[STATE][PSY-330] nature_view = LUXURY_GOOD.
[STATE][PSY-340] weather_view = INFRASTRUCTURE_FAILURE_SIGNAL.

[STATE][PSY-350] tech_view = INVISIBLE_UTILITY.
[STATE][PSY-360] progress_view = SKEPTICAL.
[STATE][PSY-370] art_view = HUMAN_SIGNAL.

## USAGE / RESOLUTION

[DECISION][PSY-400] Characters MUST default_to cynical_functional_survivor_profile.

## OUTPUT CONTRACT

~~~yaml
doc_id: BASELINE-PSYCH-2215-0001
role_type: RULE
export:
  - metric: worldview.work_view
    owner_domain: PSYCH
    values:
      core: LICENSE_TO_EXIST
    unit: none
~~~

## FORBIDDEN

[FORBIDDEN][PSY-900] Romanticized_nature_defaults.
[FORBIDDEN][PSY-910] Blind_corporate_trust.
[FORBIDDEN][PSY-920] Technology_as_wonder.

## NON-NORMATIVE

(empty)

~~~
</file>

<file path="baseline/BASELINE-SECURITY-2215-0001.md">
~~~markdown
---
id: BASELINE-SECURITY-2215-0001
title: >
  Security Baseline — 2215 (Use of Force, Detention, Jurisdiction)
class: baseline
status: fixed
version: 1.0.0
inputs:
  - SSOT-GOVERNANCE-SECURITY-A-2215-0005
  - SSOT-SCENARIO-A-2215-0001
depends_on:
  - CANON-BASE-RULE-GLOBAL-2215-0001
  - BASELINE-OBSERVABILITY-2215-0001
  - BASELINE-DIGITAL_IDENTITY-2215-0001
  - BASELINE-SOCIAL-2215-0001
scope: >
  Исполняемый baseline применения силы и процедур безопасности (LEVEL-MID) в 2215 году.
  Определяет допустимые триггеры, ступени эскалации, задержание, юрисдикцию
  и процедурные ограничения для law_enforcement и ОSA. Не выбирает параметры мира.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: enforceable security and use-of-force defaults (LEVEL-MID)
INPUTS:
  - SSOT-GOVERNANCE-SECURITY-A-2215-0005
  - SSOT-SCENARIO-A-2215-0001
  - CANON-BASE-RULE-GLOBAL-2215-0001
  - BASELINE-OBSERVABILITY-2215-0001
  - BASELINE-DIGITAL_IDENTITY-2215-0001
  - BASELINE-SOCIAL-2215-0001
OUTPUTS: [rule_id, escalation_state, detention_state, jurisdiction_outcome]
FORBIDDEN: [prose, cultural_exposition, heroic_myth, mixed_role_types, vigilante_logic]

---

## DEFINITIONS

[FACT][SEC-DEF-010] LEVEL-MID = стандартные городские условия без специальных лицензий.
[FACT][SEC-DEF-011] law_enforcement = государственные полицейские/следственные органы в рамках обычной юрисдикции.
[FACT][SEC-DEF-012] FSSU = федеральная межведомственная структура; применение ограничено угрозой базовым функциям государства.
[FACT][SEC-DEF-013] use_of_force = применение физического воздействия, ограничений, устройств или оружия.
[FACT][SEC-DEF-014] escalation_state = deescalate | restrain | incapacitate | lethal.
[FACT][SEC-DEF-015] detention = временное ограничение свободы до процессуального решения.
[FACT][SEC-DEF-016] warrant = процессуальный допуск (суд/прокурор/уполномоченный контур) на действие с правами.

[DECISION][SEC-DEF-020] Time limits MUST be expressed in minutes or hours.
[DECISION][SEC-DEF-021] Any duration range MUST use x ∈ [a, b] with units.

---

## INVARIANTS

[DECISION][SEC-INV-010] This document MUST be treated as executable baseline for LEVEL-MID.
[DECISION][SEC-INV-011] Security actions MUST be procedural, auditable, and role-bound.
[DECISION][SEC-INV-012] Escalation MUST be stepwise unless immediate threat is present.
[FORBIDDEN][SEC-INV-013] Depicting baseline security as ad-hoc personal discretion without procedure.
[FORBIDDEN][SEC-INV-014] Depicting FSSU as a direct-command chain subject to personal calls.

---

## CONTENT

### 1. Triggers (Initiation Conditions)

[RULE][SEC-TRG-010] IF telemetry_event.class = safety_anomaly THEN response MUST be initiated.
[RULE][SEC-TRG-011] IF legal_status = suspect THEN identity_check MUST be initiated.
[RULE][SEC-TRG-012] IF crime_class = criminal_offense THEN detention MAY be initiated.

[FORBIDDEN][SEC-TRG-020] Initiating force without a trigger or immediate threat.

### 2. Escalation Ladder (Use of Force)

[RULE][SEC-UOF-010] IF immediate_threat = false THEN escalation_state MUST start at deescalate.
[RULE][SEC-UOF-011] IF compliance = false AND immediate_threat = false THEN escalation_state MAY move to restrain.
[RULE][SEC-UOF-012] IF weapon_present = true OR immediate_threat = true THEN escalation_state MAY move to incapacitate.
[RULE][SEC-UOF-013] IF lethal_threat = true THEN escalation_state MAY move to lethal.

[FORBIDDEN][SEC-UOF-020] Skipping escalation steps without immediate_threat OR lethal_threat.
[FORBIDDEN][SEC-UOF-021] Lethal force without lethal_threat.

### 3. Non-Lethal Defaults

[RULE][SEC-NLT-010] IF escalation_state = restrain THEN non_lethal_means MUST be preferred.
[RULE][SEC-NLT-011] IF escalation_state = incapacitate THEN non_lethal_means MUST be preferred unless lethal_threat = true.

[FORBIDDEN][SEC-NLT-020] Baseline depiction of casual lethal solutions.

### 4. Detention and Time Windows

[RULE][SEC-DTN-010] IF detention = initiated THEN custody_log MUST be created.
[RULE][SEC-DTN-011] IF detention = initiated THEN person_rights_notice MUST be delivered.
[RULE][SEC-DTN-012] IF detention = initiated THEN detention_time_limit_hours MUST satisfy x ∈ [6, 24] hours.

[RULE][SEC-DTN-013] IF detention_time_limit_hours exceeded THEN release OR formal_charge MUST occur.

[FORBIDDEN][SEC-DTN-020] Indefinite detention at LEVEL-MID baseline.

### 5. Identity, Devices, and Access

[RULE][SEC-IDV-010] IF identity_check = initiated THEN BAN_ID verification MUST be performed.
[RULE][SEC-IDV-011] IF BAN_ID verification fails THEN detention MAY be initiated.

[RULE][SEC-IDV-012] IF device_access_requested = true THEN warrant MUST be required.
[RULE][SEC-IDV-013] IF warrant = absent THEN device_access MUST be forbidden.

[FORBIDDEN][SEC-IDV-020] Casual device inspection without warrant at LEVEL-MID.

### 6. Audit and Accountability

[RULE][SEC-AUD-010] IF use_of_force = true THEN audit_log MUST record event.
[RULE][SEC-AUD-011] IF escalation_state = lethal THEN incident_review MUST be mandatory.
[RULE][SEC-AUD-012] IF detention = initiated THEN custody_log MUST be immutable.

[FORBIDDEN][SEC-AUD-020] Unlogged use_of_force actions.
[FORBIDDEN][SEC-AUD-021] Deleting or editing custody_log.

### 7. Jurisdiction and FSSU Invocation

[RULE][SEC-JUR-010] IF threat_to_core_state_functions = false THEN law_enforcement MUST retain jurisdiction.
[RULE][SEC-JUR-011] IF threat_to_core_state_functions = true THEN FSSU MAY be invoked.
[RULE][SEC-JUR-012] IF FSSU invoked = true THEN interagency_notification MUST be mandatory.
[RULE][SEC-JUR-013] IF FSSU invoked = true THEN scope MUST be limited to threat containment.

[FORBIDDEN][SEC-JUR-020] FSSU acting as routine city police at LEVEL-MID baseline.
[FORBIDDEN][SEC-JUR-021] FSSU invocation without threat_to_core_state_functions.

### 8. De-escalation and Exit Conditions

[RULE][SEC-EXT-010] IF compliance = true AND immediate_threat = false THEN escalation_state MUST return to deescalate.
[RULE][SEC-EXT-011] IF suspect_cleared = true THEN detention MUST end.

[FORBIDDEN][SEC-EXT-020] Continuing force after compliance and threat cessation.

---

## USAGE / RESOLUTION

[DECISION][SEC-USE-010] Any urban security scene MUST apply SEC-TRG-* and SEC-UOF-* unless overridden.
[DECISION][SEC-USE-011] Any detention scene MUST apply SEC-DTN-* and SEC-AUD-* unless overridden.
[DECISION][SEC-USE-012] Any device access scene MUST apply SEC-IDV-* unless overridden.
[DECISION][SEC-USE-013] Any FSSU appearance MUST apply SEC-JUR-* unless overridden.
[FORBIDDEN][SEC-USE-014] Depicting vigilante enforcement as baseline legitimacy at LEVEL-MID.

---

## OUTPUT CONTRACT

~~~yaml
doc_id: BASELINE-SECURITY-USE-OF-FORCE-2215-0001
role_type: RULE
export:
  - rule_id: SEC-UOF-010
    intent: start escalation at deescalate when no immediate threat
    inputs: [immediate_threat]
    outputs: [escalation_state]
  - rule_id: SEC-DTN-012
    intent: bound detention window at LEVEL-MID
    inputs: [detention]
    outputs: [detention_time_limit_hours]
  - rule_id: SEC-IDV-012
    intent: require warrant for device access
    inputs: [device_access_requested]
    outputs: [warrant_required]
  - rule_id: SEC-JUR-011
    intent: allow FSSU invocation only for threats to core state functions
    inputs: [threat_to_core_state_functions]
    outputs: [FSSU_invocation]
~~~

---

## FORBIDDEN

[FORBIDDEN][SEC-FBD-010] Heroic or mythic framing of force as baseline norm.
[FORBIDDEN][SEC-FBD-011] Ad-hoc, unaudited enforcement as baseline.
[FORBIDDEN][SEC-FBD-012] Mixed ROLE_TYPE content inside this document.
[FORBIDDEN][SEC-FBD-013] Floating bullets without statement IDs.
[FORBIDDEN][SEC-FBD-014] Vigilante logic presented as legitimate baseline.

---

## NON-NORMATIVE

This baseline encodes security as procedure, audit, and bounded escalation.
Tension MUST come from windows, jurisdiction, and paperwork—not lawless violence.

~~~
</file>

<file path="baseline/BASELINE-SOCIAL-2215-0001.md">
~~~markdown
---
id: BASELINE-SOCIAL-2215-0001
title: >
  Civic & Social Baseline — 2215 (Bodies, Rights, Bio-Ethics)
class: baseline
status: fixed
version: 1.2.1
prefix: SOC
doc_language: ru-RU
prose_language: ru-RU
inputs:
  - SSOT-SCENARIO-A-2215-0001
  - SSOT-LIFE-A-2215-0007
depends_on:
  - CANON-BASE-RULE-GLOBAL-2215-0001
scope: >
  Исполняемый baseline гражданских, социальных и биоэтических норм
  повседневной жизни (LEVEL-MID) в 2215 году.
  Регулирует тело, сетевую связность, био-безопасность и репродукцию.
  Закрывает UNK-2215-0001, UNK-2215-0002, UNK-2215-0006, UNK-2215-0007, UNK-2215-0008.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: enforceable civic, social, and bio-ethical defaults for citizens (LEVEL-MID)
INPUTS:
  - SSOT-SCENARIO-A-2215-0001
  - SSOT-LIFE-A-2215-0007
  - CANON-BASE-RULE-GLOBAL-2215-0001
OUTPUTS: [rule_id, enforcement_outcomes, prohibited_patterns]
FORBIDDEN: [moral_judgements, prose, cultural_exposition, speculative_ethics, mixed_role_types]

---

## DEFINITIONS

[FACT][SOC-DEF-010] `LEVEL-MID` = стандартные городские условия без специальных лицензий.
[FACT][SOC-DEF-011] `BAN_ID` = биометрически связанная гражданская идентификация и сетевой профиль (Body Area Network).
[FACT][SOC-DEF-012] `bio_recycling` = обязательный цикл утилизации тела после смерти.
[FACT][SOC-DEF-013] `licensed_private_zone` = частное пространство с разрешённым снижением телеметрии.
[FACT][SOC-DEF-014] `aquamation` = alkaline_hydrolysis.
[FACT][SOC-DEF-015] `faraday_hotel` = платная зона экранирования телеметрии.

---

## INVARIANTS

[DECISION][SOC-INV-010] This document MUST be treated as executable baseline for LEVEL-MID scenes.
[DECISION][SOC-INV-011] All rules in this document MUST apply by default for LEVEL-MID.
[DECISION][SOC-INV-012] Any deviation REQUIRES explicit override OR a different LEVEL baseline.
[DECISION][SOC-INV-020] Units: `years`, `minutes`, `percent` MUST be used in numeric constraints.
[DECISION][SOC-INV-021] Any incarceration range MUST be expressed as `x ∈ [a, b] years`.

[FORBIDDEN][SOC-INV-013] Importing pre-2215 cultural norms as defaults without explicit override.
[FORBIDDEN][SOC-INV-014] Introducing world-parameter bindings or p90 selection in this baseline.

---

## CONTENT

### 1. Protocols of Death (Bio-Recycling)

[RULE][SOC-BIO-010] IF `person.status` == dead THEN `death_dispFSSUl_method` MUST be aquamation_only.
[RULE][SOC-BIO-013] IF `person.status` == dead THEN `bio_recycling` MUST be executed.
[RULE][SOC-BIO-014] IF `person.status` == dead THEN `water_recovery` MUST be executed.
[RULE][SOC-BIO-015] IF `person.status` == dead THEN `calcium_material_reuse` MUST be executed.

[RULE][SOC-BIO-016] IF `person.status` == dead THEN `funeral_rituals` MUST be non_material_only.
[RULE][SOC-BIO-017] IF `person.status` == dead THEN `memory_farewell` MUST be digital_snapshot_only.

[RULE][SOC-BIO-018] `body_status` MUST be leased_from_biosphere.
[RULE][SOC-BIO-019] `body_status` MUST be returned_to_biosphere.

[FORBIDDEN][SOC-BIO-011] Burial.
[FORBIDDEN][SOC-BIO-012] Cremation or combustion.

### 2. Connectivity Rights (Offline Status)

[RULE][SOC-NET-010] IF `zone` == public_mid AND `user.status` == offline THEN `legal_status` MUST be suspect.
[RULE][SOC-NET-011] IF `user.status` == offline THEN `offline_allowed_zone` MUST be licensed_private_zone OR faraday_hotel.

[RULE][SOC-NET-012] IF `user.action` == telemetry_jamming THEN `crime_class` MUST be criminal_offense.
[RULE][SOC-NET-013] IF `user.action` == telemetry_jamming THEN `correction_term_years` MUST satisfy x ∈ [3, 5].

[RULE][SOC-NET-014] IF `zone` == public_mid THEN `ban_id_required` MUST be true.
[RULE][SOC-NET-015] IF `zone` == work THEN `ban_id_required` MUST be true.

### 3. Bio-Safety & Pets

[RULE][SOC-PET-010] IF `citizen.owns_live_pet` == true THEN `bio_luxury_license` MUST be required.
[RULE][SOC-PET-011] IF `bio_luxury_license` == required THEN `carbon_offset` MUST be required.
[RULE][SOC-PET-012] IF `bio_luxury_license` == required THEN `sanitary_compliance` MUST be required.
[RULE][SOC-PET-013] IF `bio_luxury_license` == required THEN `owner_liability` MUST be required.

[RULE][SOC-PET-020] `pet_distribution_robotic_share_percent` MUST satisfy x ∈ [85, 95].
[RULE][SOC-PET-021] `pet_distribution_biological_share_percent` MUST satisfy x ∈ [5, 15].

[RULE][SOC-PET-030] IF `animal.status` == stray THEN `action` MUST be automated_sanitary_elimination.
[RULE][SOC-PET-031] IF `animal.status` == stray THEN `action_time_minutes` MUST satisfy x ∈ [0, 20].

### 4. Controlled Substances (Nicotine / Stimulants)

[RULE][SOC-SUB-011] IF `substance` == nicotine THEN `form_factor` MUST be medical_inhaler_only.
[RULE][SOC-SUB-012] IF `substance` == nicotine THEN `cartridge_id_bound` MUST be true.

[RULE][SOC-SUB-013] IF `substance` == stimulant THEN `form_factor` MUST be clinical_inhaler_only.
[RULE][SOC-SUB-014] IF `substance` == stimulant THEN `emission` MUST be no_smell.
[RULE][SOC-SUB-015] IF `substance` == stimulant THEN `emission` MUST be no_vapor.

[FORBIDDEN][SOC-SUB-010] Combustion use (treated as fire event).
[FORBIDDEN][SOC-SUB-016] Recreational smoking culture.

### 5. Intimacy & Demography

[RULE][SOC-DEM-010] IF `action` == parenting THEN `algorithmic_license` MUST be required.
[RULE][SOC-DEM-011] IF `algorithmic_license` == required THEN `license_input` MUST include financial_capacity.
[RULE][SOC-DEM-012] IF `algorithmic_license` == required THEN `license_input` MUST include housing_class.
[RULE][SOC-DEM-013] IF `algorithmic_license` == required THEN `license_input` MUST include genetic_screening.

[RULE][SOC-DEM-020] IF `pregnancy` == unauthorized THEN `penalty.variants` INCLUDES fine.
[RULE][SOC-DEM-021] IF `pregnancy` == unauthorized THEN `penalty.variants` INCLUDES mandatory_therapy.
[RULE][SOC-DEM-022] IF `pregnancy` == unauthorized THEN `penalty.variants` INCLUDES parental_rights_revocation.

[RULE][SOC-DEM-030] `intimacy_allowed` MUST be true at LEVEL-MID.
[RULE][SOC-DEM-031] IF `action` == biofluid_exchange THEN `viral_marker_monitoring_via_BAN_ID` MUST be true.
[RULE][SOC-DEM-032] IF `viral_marker_detection` == positive THEN `risk_notification` MUST be automatic_informational.

---

## USAGE / RESOLUTION

[DECISION][SOC-USE-010] Scenes involving death MUST apply SOC-BIO-* rules unless overridden.
[DECISION][SOC-USE-011] Scenes involving connectivity/offline MUST apply SOC-NET-* rules unless overridden.
[DECISION][SOC-USE-012] Scenes involving pets MUST apply SOC-PET-* rules unless overridden.
[DECISION][SOC-USE-013] Scenes involving substances MUST apply SOC-SUB-* rules unless overridden.
[DECISION][SOC-USE-014] Scenes involving intimacy/reproduction MUST apply SOC-DEM-* rules unless overridden.
[FORBIDDEN][SOC-USE-015] Depicting LEVEL-MID defaults as optional personal preference without explicit override.

---

## OUTPUT CONTRACT

~~~yaml
doc_id: BASELINE-SOCIAL-2215-0001
role_type: RULE
export:
  - rule_id: SOC-BIO-010
    intent: enforce aquamation-only dispFSSUl at LEVEL-MID
    inputs: [person.status]
    outputs: [death_dispFSSUl_method]
  - rule_id: SOC-NET-010
    intent: classify offline status in public as suspect
    inputs: [zone, user.status]
    outputs: [legal_status]
  - rule_id: SOC-PET-010
    intent: require bio luxury license for live pets
    inputs: [citizen.owns_live_pet]
    outputs: [bio_luxury_license]
  - rule_id: SOC-DEM-010
    intent: require algorithmic license for parenting
    inputs: [action]
    outputs: [algorithmic_license]
~~~

---

## FORBIDDEN

[FORBIDDEN][SOC-FBD-010] Moral judgement language.
[FORBIDDEN][SOC-FBD-011] Prose or cultural exposition as justification.
[FORBIDDEN][SOC-FBD-012] Treating disconnection (offline) in public as neutral baseline at LEVEL-MID.
[FORBIDDEN][SOC-FBD-013] Romanticizing death, pets, reproduction, or disconnection as baseline defaults.
[FORBIDDEN][SOC-FBD-014] Introducing STATE/BIND content inside this RULE document.
[FORBIDDEN][SOC-FBD-015] Floating bullets without statement IDs.

---

## NON-NORMATIVE

This baseline encodes social pressure and control as environmental constants, not as moral commentary.
Any emotional impact MUST emerge from scenes, not from normative text.
~~~
</file>

<file path="canon/CANON-ARCS-GLOBAL-2215-0001.md">
~~~markdown
---
id: CANON-ARCS-GLOBAL-2215-0001
title: >
  Canon Character Arcs — Emotional Trajectories for FSSU Team and System Agents (2215)
class: canon
status: fixed
version: 1.0.0
prefix: ARC
doc_language: en
prose_language: ru-RU
inputs:
  - CANON-CAST_REGISTRY-GLOBAL-2215-0001
  - CANON-CAST-VOICE-2215-0001
  - PLAN-STORY-2215-0001
depends_on:
  - SPEC-DOC-STYLE-2215-0001
  - SPEC-PRIORITY-RESOLUTION-2215-0001
scope: >
  Канонические дуги персонажей: начальное состояние, кризисная точка,
  финальное состояние. Определяет эмоциональную траекторию для каждого
  персонажа, чтобы LLM мог выдерживать направление при генерации глав.
  Персонажи — функции системы, но функции с ценой.
  Без художественного текста и без SSOT-метрик.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: define enforceable character arc constraints for chapter generation
INPUTS: [CANON-CAST_REGISTRY-GLOBAL-2215-0001, CANON-CAST-VOICE-2215-0001, PLAN-STORY-2215-0001]
OUTPUTS: [arc_table, arc_constraints]
FORBIDDEN: [fiction_prose, backstory_exposition, psychological_diagnosis, hero_journey_template]

## DEFINITIONS

[FACT][ARC-DEF-010] `arc` = trajectory {start_state, crisis_point, end_state, act_range, arc_type}.
[FACT][ARC-DEF-011] `arc_type` ∈ {erosion, discovery, hardening, fracture, persistence, witnessing}.
[FACT][ARC-DEF-012] `erosion` = gradual loss of initial certainty or capacity.
[FACT][ARC-DEF-013] `discovery` = transition from ignorance/naivety to understanding (without heroic epiphany).
[FACT][ARC-DEF-014] `hardening` = reinforcement of initial position through pressure (not positive growth).
[FACT][ARC-DEF-015] `fracture` = permanent split between professional function and personal reality.
[FACT][ARC-DEF-016] `persistence` = unchanged state despite pressure; character endures rather than transforms.
[FACT][ARC-DEF-017] `witnessing` = transformation through observation of systemic cost; moral shift without action power.

## INVARIANTS

[DECISION][ARC-INV-010] Every `person` entity in CASTREGISTRY MUST have exactly one arc defined; ELSE FAIL.
[DECISION][ARC-INV-011] `system_agent` entities MAY have arcs (recommended for agents with >2 chapter appearances).
[DECISION][ARC-INV-012] Arcs MUST NOT imply heroic transformation or moral redemption arc.
[DECISION][ARC-INV-013] crisis_point MUST reference a specific act (not chapter) to allow scene-level flexibility.
[DECISION][ARC-INV-014] end_state MUST be consistent with ending.tone = cold_stability.
[FORBIDDEN][ARC-INV-015] Hollywood-style character growth (from weakness to strength).
[FORBIDDEN][ARC-INV-016] Redemption arcs for system_agents.

## CONTENT

### Arc Table

```yaml
arcs:
  - entity: Мирон
    token: Miron
    arc_type: erosion
    start_state: >
      Рутинный профессионализм, скука 99%-ной оптимизации.
      Знает, что система работает. Не вопрос «зачем», а «когда смена».
    crisis_point:
      act: III
      trigger: >
        Медконтур: видит, что KPI = 0.97, а люди платят телом.
        Понимает: он защищает систему, которая производит вред.
    end_state: >
      Выиграл дело, но потерял иллюзию. Система скорректирована,
      не исправлена. Продолжает работать — потому что больше некому.
      Выбирает песню вручную вместо алгоритма.
    key_scenes: [CH-01, CH-07, CH-16, CH-20, CH-35]

  - entity: Лев
    token: Lev
    arc_type: persistence
    start_state: >
      Монотонный интерфейс. Мир = данные. Люди = переменные.
      Не бесчувственный — disconnected.
    crisis_point:
      act: III
      trigger: >
        Серверный контур: гонка с пурджем. Физическое давление на тело,
        которое он обычно игнорирует. Температура 34°C, пот, таймер.
    end_state: >
      Тот же. Данные по-прежнему важнее лиц. Но теперь знает,
      что его «Это не баг» имеет цену в миллисекундах чужой жизни.
      Не изменился — но пауза перед «Коррекция» стала длиннее.
    key_scenes: [CH-02, CH-04, CH-10, CH-19, CH-32]

  - entity: Айдар
    token: Aidar
    arc_type: hardening
    start_state: >
      Кинетический инструмент. Тело = оружие + транспорт.
      Фантомная боль — фоновый шум. Протокол — объект насмешки.
    crisis_point:
      act: V
      trigger: >
        Изъятие: борьба за шкаф подписи. Охрана давит физически.
        Айдар удерживает — не ради победы, а ради 90 секунд для Лева.
    end_state: >
      Жёстче. Фантомная боль не исчезла, но он перестал её замечать.
      Протокол по-прежнему смешной — но теперь он знает, зачем.
    key_scenes: [CH-01, CH-05, CH-06, CH-18, CH-31]

  - entity: Лейсан
    token: Leysan
    arc_type: fracture
    start_state: >
      Процедурный фильтр. Допустимость = щит.
      Личная жизнь существует, но за стеной NDA.
    crisis_point:
      act: IV
      trigger: >
        Допрос Ильи: человек искренне верит, что защищал бюджет.
        Лейсан понимает: закон не ловит системную функцию.
        Параллельно — разрыв с парнем (CH-12).
    end_state: >
      Профессионально: стала точнее, злее, эффективнее.
      Лично: стена стала толще. Парня больше нет.
      Фиксирует отказ — но за каждым отказом пустота.
    key_scenes: [CH-02, CH-12, CH-17, CH-24, CH-28, CH-34]

  - entity: Дамир
    token: Damir
    arc_type: witnessing
    start_state: >
      Новичок. «А это законно?» — искренний вопрос.
      Видит мир физически, не через данные.
    crisis_point:
      act: III
      trigger: >
        Медконтур (CH-20): задержка реагентов 14ч. Видит, как логистика
        конвертируется в пустую полку, а пустая полка — в риск для пациента.
    end_state: >
      Перестал спрашивать «а это законно?» — теперь знает, что да, законно.
      Именно это и страшно. Не сломан, но тише. «Там люди» — говорит реже,
      но каждый раз это весит больше.
    key_scenes: [CH-03, CH-11, CH-14, CH-20, CH-35]

  - entity: Ринат
    token: Rinat
    arc_type: persistence
    start_state: >
      Политический буфер. Тишина = порядок, шум = проблема.
      Защищает команду сверху, ограничивает снизу.
    crisis_point:
      act: IV
      trigger: >
        Публичное давление (CH-33): его имя в отчёте.
        Тишина больше невозможна — нужно выбирать сторону.
    end_state: >
      Выбрал сторону ФССУ — но так, чтобы потом можно было отыграть.
      Тот же. Бюджет по-прежнему не резиновый.
    key_scenes: [CH-17, CH-29, CH-33, CH-34]

  - entity: Юнна
    token: Yunna
    arc_type: persistence
    start_state: >
      Клинический инструмент. Биологический материал — это данные.
      Нулевой small talk.
    crisis_point:
      act: III
      trigger: >
        Медконтур (CH-20): её протоколы нарушены приоритетами KPI.
        Не злится — фиксирует. Это её domain, и он повреждён.
    end_state: >
      Та же. Протоколы восстановлены. Уехала обратно в федеральный центр.
      Не благодарит и не прощается.
    key_scenes: [CH-03, CH-20]

  # System agents (optional arcs)
  - entity: Оскар
    token: Oskar
    arc_type: erosion
    start_state: >
      Профессиональный фрикшн. Вежливый отказ = работа.
      Верит, что оператор в целом прав.
    crisis_point:
      act: IV
      trigger: >
        Арбитраж (CH-24): видит, что settlement = покупка тишины.
        Начинает сомневаться — но функция сильнее сомнения.
    end_state: >
      Помог ФССУ войти в зону (Act III), но в финале — снова на стороне
      оператора. Подал протокол несогласия, который никто не прочитает.
    key_scenes: [CH-18, CH-23, CH-24, CH-32, CH-34]

  - entity: Илья
    token: Ilya
    arc_type: hardening
    start_state: >
      Coefficient-vision. Эффективность = защита людей.
      Искренне верит. Не циничен.
    crisis_point:
      act: IV
      trigger: >
        Допрос Лейсан (CH-28): его заморозка аудита дала время на чистку.
        Не раскаивается — объясняет: «я защищал бюджет, регламент позволял».
    end_state: >
      Укрепился. Система скорректирована, но Илья считает, что
      это избыточная реакция. Продолжит оптимизировать.
    key_scenes: [CH-02, CH-22, CH-28]
```

## USAGE / RESOLUTION

[DECISION][ARC-USE-010] Chapter generation MUST check arc table for each participant and maintain trajectory; ELSE FAIL.
[DECISION][ARC-USE-011] Character voice in early acts MUST reflect start_state; after crisis_point — end_state (gradual transition).
[DECISION][ARC-USE-012] crisis_point.act is a guide, not a hard boundary; crisis may begin ±1 chapter earlier.
[DECISION][ARC-USE-013] Conflict resolution MUST follow SPEC-PRIORITY-RESOLUTION-2215-0001; ELSE FAIL.

## OUTPUT CONTRACT

```yaml
doc_id: CANON-ARCS-GLOBAL-2215-0001
role_type: RULE
export:
  arc_table:
    rows: 10
    schema:
      entity: string (display_name_ru)
      token: string (ASCII token)
      arc_type: enum
      start_state: string
      crisis_point: {act: enum, trigger: string}
      end_state: string
      key_scenes: list[chapter_id]
```

## FORBIDDEN

[FORBIDDEN][ARC-FBD-010] Hero's journey template (call to adventure → transformation → return).
[FORBIDDEN][ARC-FBD-011] Redemption arcs for system_agents.
[FORBIDDEN][ARC-FBD-012] Emotional exposition as substitute for procedural consequences.
[FORBIDDEN][ARC-FBD-013] Characters becoming "better people" through suffering.
[FORBIDDEN][ARC-FBD-014] Romantic subplots as primary character development.

## NON-NORMATIVE

```text
Arc types are designed for procedural noir, not heroic fiction:
- erosion: you win but lose something
- discovery: you learn but can't use the knowledge to fix everything
- hardening: pressure makes you harder, not stronger
- fracture: professional success + personal cost
- persistence: you endure; the world doesn't reward endurance
- witnessing: you see the price; seeing changes you, not the world
```

~~~
</file>

<file path="canon/CANON-ARTIFACT-SNIPPETS-GLOBAL-2215-0001.md">
~~~markdown
---
id: CANON-ARTIFACT-SNIPPETS-GLOBAL-2215-0001
title: >
  FSSU Artifacts — Snippet Templates and Procedural Forms (2215)
class: canon
status: fixed
version: 1.1.0
inputs:
  - CANON-VOCAB-GLOBAL-2215-0001
  - CANON-SYSTEM-VOICE-GLOBAL-2215-0001
depends_on: []
scope: >
  Canonical procedural specification of FSSU artifact snippets (CD/EL/CM,
  orders, logs, access receipts). Purpose: constrain LLM output to fixed,
  auditable forms; prohibit narrative drift; guarantee evidence usability.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: define mandatory forms and constraints for FSSU artifact snippets used in scenes
INPUTS: [CANON-SYSTEM-VOICE-GLOBAL-2215-0001, CANON-VOCAB-GLOBAL-2215-0001]
OUTPUTS: [artifact_schema_id, admissibility_constraints]
FORBIDDEN: [narrative_text, freeform_documents, persona_voice]

## DEFINITIONS

[FACT][ART-DEF-001] Artifact = procedural record produced or consumed by FSSU during a case.
[FACT][ART-DEF-002] Snippet = partial artifact excerpt embedded in narrative text.
[FACT][ART-DEF-003] EL item = Evidence Ledger record with chain-of-custody.
[FACT][ART-DEF-004] Case scope = explicit perimeter (zone/node/mode) bound to an artifact.

## INVARIANTS

[DECISION][ART-INV-001] Every snippet MUST be procedural and machine-verifiable.
[DECISION][ART-INV-002] Every snippet MUST bind to case_id and scope.
[DECISION][ART-INV-003] Any artifact used as evidence MUST be an EL item.
[DECISION][ART-INV-004] Snippets are excerpts ONLY; full documents are forbidden in prose.

## CONTENT

[RULE][ART-R-001] IF artifact appears in text THEN it MUST conform to one canonical schema.
[RULE][ART-R-002] IF artifact claims evidentiary value THEN evidence_id and custody are REQUIRED.
[RULE][ART-R-003] IF artifact implies enforcement THEN order_id or mandate_ref is REQUIRED.
[RULE][ART-R-004] IF artifact references system events THEN it MUST align with CANON-SYSTEM-VOICE enums.
[FORBIDDEN][ART-F-001] Narrative language inside artifacts.
[FORBIDDEN][ART-F-002] Human emotions, motives, or moral language in artifacts.
[FORBIDDEN][ART-F-003] Bureaucratic filler without operational fields.

## USAGE / RESOLUTION

[DECISION][ART-U-001] Authors select schema → populate minimal fields → embed as snippet.
[DECISION][ART-U-002] Procedural validity has priority over readability.
[DECISION][ART-U-003] Any deviation invalidates the artifact for evidentiary use.

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-ARTIFACT-SNIPPETS-GLOBAL-2215-0001
role_type: RULE
export:
  - rule_id: ART-R-001
    intent: enforce canonical artifact schemas
    inputs: [snippet]
    outputs: [schema_valid]
~~~

## FORBIDDEN

[FORBIDDEN][ART-F-010] Introducing new artifact types without CANON override.
[FORBIDDEN][ART-F-011] Mixing artifact content with narrative exposition.
[FORBIDDEN][ART-F-012] Using examples as normative rules.

## NON-NORMATIVE

### EL item — minimal evidence record

~~~json
{
  "case_id": "FSSU-2215-RU-16-0007",
  "evidence_id": "E-002",
  "type": "log_extract",
  "source": "OBSERVABILITY",
  "scope": "RU-16/CHELNY/Node-HOSP-3/Telemetry",
  "ts_collected": "2215-05-18T21:05:00+03:00",
  "collector": "FSSU/Lev-Safonov",
  "hash": "sha256:...",
  "custody": {
    "sealed": true,
    "seal_id": "SEAL-2215-000118",
    "custody_chain": [
      { "ts": "2215-05-18T21:06:00+03:00", "holder": "FSSU", "action": "sealed" }
    ]
  },
  "notes": "Primary logs missing within retention window."
}
~~~

### Chain-of-custody event

~~~json
{
  "case_id": "FSSU-2215-RU-16-0007",
  "event": "custody_transfer",
  "ts": "2215-05-19T10:52:00+03:00",
  "evidence_id": "E-001",
  "from": "Z4/Regime-Holder/Escort-Unit",
  "to": "FSSU/Aidar-Bulatov",
  "conditions": ["no_export_without_seal", "escorted_access"],
  "seal_verified": true
}
~~~

### Chat log extract

~~~json
{
  "case_id": "FSSU-2215-RU-16-0007",
  "artifact": "chat_log_extract",
  "scope": "Operator/Dispatch/Queue-7",
  "window": { "start": "2215-05-18T17:10:00+03:00", "end": "2215-05-18T17:28:00+03:00" },
  "messages": [
    { "ts": "2215-05-18T17:11:03+03:00", "from": "dispatch.bot", "type": "system", "text": "Window updated. service_class=C." },
    { "ts": "2215-05-18T17:12:19+03:00", "from": "tech.unit.14", "type": "field", "text": "Access token rejected at Node-HOSP-3." }
  ]
}
~~~

### Suspension order snippet

~~~json
{
  "order_id": "O-11-SUSP-2215-0009",
  "case_id": "FSSU-2215-RU-16-0007",
  "ts_issued": "2215-05-21T08:30:00+03:00",
  "issuer": "FSSU/Leisan-Khakimova",
  "scope": "Z4/RU-16/Node-Zone-X/Mode-Accelerated",
  "action": "suspend_mode_partial",
  "duration_hours": 72,
  "basis": ["admissibility_risk", "observability_gap"],
  "statement": "Mode partially suspended. Audit initiated."
}
~~~

~~~
</file>

<file path="canon/CANON-BASE-NARRATIVE-GLOBAL-2215-0001.md">
~~~markdown
---
id: CANON-BASE-NARRATIVE-GLOBAL-2215-0001
title: >
  Canon Base — Narrative and Institutional Anchor (2215)
class: canon
status: fixed
version: 1.1.0
prefix: NAR
doc_language: ru-RU
prose_language: ru-RU
inputs: []
depends_on:
  - CANON-BASE-RULE-GLOBAL-2215-0001
  - CANON-CORE-GLOBAL-2215-0001
scope: >
  Якорный канонический документ интерфейсного типа.
  Фиксирует нарративную, институциональную и временную инерцию мира 2215.
  Не является исполняемым и не участвует в разрешении конфликтов.
---

## LLM-INTENT

ROLE_TYPE: INTERFACE
SCOPE: human-readable narrative anchor for institutional stability and temporal rhythm
INPUTS: [CANON-BASE-RULE-GLOBAL-2215-0001, CANON-CORE-GLOBAL-2215-0001]
OUTPUTS: [narrative_anchor, narrative_rhythm_profile]
FORBIDDEN: [llm_execution, world_parameter_binding, rule_enforcement]

## DEFINITIONS

[FACT][NAR-DEF-010] `anchor_document` = канонический текст,
  используемый автором для поддержания согласованности нарратива.

[FACT][NAR-DEF-020] `non_executable` = свойство документа,
  означающее отсутствие нормативной или разрешающей силы.

[FACT][NAR-DEF-030] `narrative_rhythm` = устойчивый профиль
  темпа, пауз и накопления последствий в повествовании.

## INVARIANTS

[DECISION][NAR-INV-010] Документ MUST сохранять нарративную и институциональную инерцию мира.

[DECISION][NAR-INV-020] Документ MUST NOT переопределять значения,
  зафиксированные в RULE или BIND документах корпуса.

[DECISION][NAR-INV-030] При любом конфликте интерпретаций
  приоритет имеет CANON-BASE-RULE-GLOBAL-2215-0001.

## CONTENT

### Institutional Background

[DECISION][NAR-100] Мир 2215 MUST восприниматься
  как институционально стабильный и нормативно насыщенный.

[DECISION][NAR-110] Конфликт MUST возникать
  из процедур, распределений и ограничений,
  а не из тотального коллапса среды.

[DECISION][NAR-120] Государства MUST сохранять суверенитет,
  действуя в плотной сети стандартов, аудита и отчётности.

[DECISION][NAR-130] Корпорации MUST рассматриваться
  как системные операторы,
  реализующие влияние через право и доступ.

[DECISION][NAR-140] Экстерриториальные режимы MUST трактоваться
  как лицензируемые и отзывные зоны исключения.

### Anthropological Baseline

[DECISION][NAR-200] Технологии MUST быть глубоко интегрированы в быт,
  не устраняя человеческие ограничения и телесность.

[DECISION][NAR-210] Трансгуманизм MUST присутствовать
  в умеренной и функциональной форме,
  без повседневного сверхчеловеческого превосходства.

[DECISION][NAR-220] Дефицит MUST переживаться
  как вопрос распределения и окон доступа,
  а не как угроза выживанию.

[DECISION][NAR-230] Повседневность персонажей MUST включать
  нефункциональные аспекты существования,
  не сводимые к их институциональной роли.

### Narrative Rhythm

[DECISION][NAR-300] Нарратив MUST разворачиваться
  в длительном временном масштабе (недели–месяцы).

[DECISION][NAR-310] Паузы между активными фазами кейсов MUST
  рассматриваться как нормальное состояние мира.

[DECISION][NAR-320] Существенные сюжетные сдвиги MUST возникать
  из накопления мелких изменений и решений,
  а не из единичных драматических актов.

[DECISION][NAR-330] Параллельное существование
  нескольких незавершённых процессов MUST быть нормой.

[DECISION][NAR-340] Отсутствие немедленного результата
  после действий институтов MUST NOT трактоваться как провал.

### Temporal Texture

[DECISION][NAR-400] Сцены MAY включать временные разрывы,
  в которых отсутствуют явные события,
  но сохраняется напряжение ожидания.

[DECISION][NAR-410] Повторяемость рутинных действий MUST формировать
  ощущение инерционного и тяжёлого мира.

[DECISION][NAR-420] Экстренные эпизоды MUST быть редкими
  и контрастировать с общей медленной ритмикой.

### Narrative Consequences

[DECISION][NAR-500] Институциональные победы MUST быть частичными
  и сопровождаться остаточным риском.

[DECISION][NAR-510] Даже успешные разрешения ситуаций MUST
  оставлять следы в виде политических, технических
  или человеческих последствий.

[DECISION][NAR-520] Нарратив MUST избегать ощущения
  полного очищения мира после завершения кейса.

## USAGE / RESOLUTION

[DECISION][NAR-USE-010] Документ используется автором
  как ориентир при построении сцен, эпизодов и диалогов.

[DECISION][NAR-USE-020] Любые формальные ограничения MUST
  извлекаться исключительно из RULE документов корпуса.

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-BASE-NARRATIVE-GLOBAL-2215-0001
role_type: INTERFACE
export:
  - owns:
      - narrative_anchor
      - narrative_rhythm_profile
  - consumes:
      - CANON-BASE-RULE-GLOBAL-2215-0001
      - CANON-CORE-GLOBAL-2215-0001
  - forbids:
      - rule_enforcement
      - world_parameter_binding
      - conflict_resolution
~~~

## FORBIDDEN

[FORBIDDEN][NAR-FBD-010] Использование документа
  как источника правил или параметров мира.

[FORBIDDEN][NAR-FBD-020] Разрешение конфликтов
  или выбор значений метрик на основе данного документа.

[FORBIDDEN][NAR-FBD-030] Чтение документа
  как исполняемого или нормативного.

## NON-NORMATIVE

Документ допускает ритмическую тяжеловесность,
повторы и отсутствие динамики.
Это является осознанным эффектом,
а не дефектом нарратива.

~~~
</file>

<file path="canon/CANON-BASE-RULE-GLOBAL-2215-0001.md">
~~~markdown
---
id: CANON-BASE-RULE-GLOBAL-2215-0001
title: >
  Canon Base — Executable Canon Ruleset (2215)
class: canon
status: fixed
version: 1.0.0
inputs: []
depends_on:
  - CANON-CORE-GLOBAL-2215-0001
  - SSOT-CONSISTENCY-A-2215-0009
  - SPEC-DOC-STYLE-2215-0001
scope: >
  Исполняемый канонический ruleset. Нормативные ограничения интерпретации,
  причинности и допустимых конфликтов. Не содержит описательного канона.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: canon-wide narrative and institutional constraints
INPUTS: [CANON-CORE-GLOBAL-2215-0001, SSOT-CONSISTENCY-A-2215-0009]
OUTPUTS: [rule_id, applicability, forbidden_patterns]
FORBIDDEN: [world_parameter_binding, p90_selection, baseline_definition, implicit_override]

---

## DEFINITIONS

[DECISION][BASE-R-001] `explicit_override` = документ с `class: override`,
явно задающий локальное отклонение и его стоимость.

[DECISION][BASE-R-002] `background_default` = любое состояние мира,
используемое без `explicit_override`.

---

## INVARIANTS

[DECISION][BASE-R-010] Все `background_default` в романе MUST быть SSOT-consistent.
[DECISION][BASE-R-011] CANON-CORE-GLOBAL-2215-0001 MUST быть единственным источником
`background_default` параметров мира.
[DECISION][BASE-R-012] SSOT MUST использоваться ONLY как диапазоны и структуры.
[FORBIDDEN][BASE-R-013] Использование p90 / upper-tail как `background_default`
без `explicit_override`.

---

## CONTENT

[RULE][BASE-R-020] All system-level claims MUST be tagged as:
FACT | ASSUMPTION | PROJECTION | UNKNOWN.

[RULE][BASE-R-021] Any causal explanation MUST be decomposed into
CAUSE → MECHANISM → CONSEQUENCE.

[FORBIDDEN][BASE-R-022] Lecture-style causal exposition inside scenes.

[RULE][BASE-R-030] Scene causality MUST be shown via artifacts, procedures,
measurable constraints, or access regimes.

[FORBIDDEN][BASE-R-031] Direct use of SSOT as a scene-generation source.

[RULE][BASE-R-040] Interpretation priority MUST follow:
override → scene → plan → canon → baseline → ssot.

[FORBIDDEN][BASE-R-041] Implicit override derived from scene depiction.

[RULE][BASE-R-050] Flashback usage MUST NOT alter global baseline defaults.

[RULE][BASE-R-060] Everyday reality MUST be interpreted as comfortable and stable
unless overridden.

[RULE][BASE-R-061] Deficit MUST be interpreted ONLY as
allocation_under_constraints.

[FORBIDDEN][BASE-R-062] Framing conflict as struggle for basic survival
as default interpretation.

[RULE][BASE-R-070] Supranational influence MUST operate ONLY via
standards | audits | reputation | market_pressure.

[RULE][BASE-R-080] Corporate influence MUST operate ONLY via
law | arbitration | contracts | access_regimes | compliance.

[FORBIDDEN][BASE-R-081] Direct corporate military or police dominance.

[RULE][BASE-R-090] Extraterritorial regimes MUST be licensed, bounded,
auditable, and revocable.

[RULE][BASE-R-091] FSSU deployment MUST be limited to threats against
core state functions.

[RULE][BASE-R-100] Transhumanism MUST be constrained to moderate mode.

[FORBIDDEN][BASE-R-101] Inborn superhuman abilities.

[FORBIDDEN][BASE-R-102] Everyday combat cybernetics.

[RULE][BASE-R-110] Physical superiority MUST be achieved via
equipment | energy | procedure | access_window.

[RULE][BASE-R-120] Pressure on FSSU MUST be procedural-only.

[FORBIDDEN][BASE-R-121] Personal calls or direct regional orders to FSSU.

[RULE][BASE-R-130] High GDP MUST NOT imply local abundance.

[FORBIDDEN][BASE-R-131] Explaining local deficits by
“energy taken by AI”.

[RULE][BASE-R-140] UNKNOWN elements MAY enter narrative ONLY IF they
create_stakes OR affect_jurisdiction OR manifest_as_anomaly.

[RULE][BASE-R-150] Human grounding beats MUST appear every 4–5
functional/action scenes.

[FORBIDDEN][BASE-R-151] Using grounding beats for exposition or plot advancement.

---

## USAGE / RESOLUTION

[DECISION][BASE-R-180] All downstream documents MUST apply these rules
before interpreting STATE or BIND outputs.

[DECISION][BASE-R-181] Any deviation from CANON-CORE-GLOBAL-2215-0001
REQUIRES `explicit_override`.

---

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-BASE-RULE-GLOBAL-2215-0001
role_type: RULE
export:
  - rule_id: BASE-R-010
    intent: enforce ssot-consistent background defaults
    inputs: [SSOT-CONSISTENCY-A-2215-0009]
    outputs: [ssot_consistent]
  - rule_id: BASE-R-040
    intent: enforce interpretation priority order
    inputs: []
    outputs: [resolution_order]
~~~

---

## FORBIDDEN

[FORBIDDEN][BASE-R-190] Mixing ROLE_TYPEs inside this document.
[FORBIDDEN][BASE-R-191] Introducing STATE or BIND statements here.
[FORBIDDEN][BASE-R-192] Using softeners or vague language.
[FORBIDDEN][BASE-R-193] Adding narrative examples outside NON-NORMATIVE.

---

## NON-NORMATIVE

(Empty by design)

~~~
</file>

<file path="canon/CANON-CAST_REGISTRY-GLOBAL-2215-0001.md">
~~~markdown
---
id: CANON-CAST_REGISTRY-GLOBAL-2215-0001
title: >
  Core Team (ФССУ) — Cast Registry (STATE)
class: canon
status: fixed
version: 1.0.0
prefix: CASTREG
doc_language: en
prose_language: ru-RU
inputs: []
depends_on:
  - SPEC-DOC-STYLE-2215-0001
  - SPEC-PRIORITY-RESOLUTION-2215-0001
scope: >
  Реестр состава ФССУ и связанных акторов как данных (STATE): сущности персонажей,
  их role/leverage/cannot/optics/scene_types и маппинг токенов для сцен.
  Имена в tags.participants MUST использовать значения из колонки display_name_ru.
  Без правил использования и без художественного текста.
---

## LLM-INTENT

ROLE_TYPE: STATE
SCOPE: provide authoritative cast registry rows for FSSU core team and externals
INPUTS: []
OUTPUTS: [cast_registry_rows]
FORBIDDEN: [rule_definition, prose, implicit_membership, new_metrics]

## DEFINITIONS

[FACT][CASTREG-010] `cast_row` = запись таблицы с полями {entity_id, token, display_name_ru, entity_kind, role, leverage, cannot, optics, scene_types, age_range_years, affiliation, not_antagonist, act_range, hud_style, hud_visuals, hud_sensory}.
[FACT][CASTREG-020] `entity_id` = строковый id сущности, формат `person.<snake>` или `external.<snake>`.
[FACT][CASTREG-025] `token` = краткий ASCII-токен, формат `^[A-Z][A-Za-z0-9_]*$`. Используется в YAML/коде.
[FACT][CASTREG-026] `display_name_ru` = отображаемое русское имя для tags.participants и прозы.
[FACT][CASTREG-027] `nickname_ru` = допустимое обращение в диалоге от членов команды (если отличается от display_name_ru). Пустая строка = не применимо.
[FACT][CASTREG-030] `entity_kind` ∈ {person, system_agent, external}.
[FACT][CASTREG-031] `system_agent` = человек-агент оптимизационного контура; НЕ антагонист, а функция (см. CANON-CONFLICT CNF-INV-007).
[FACT][CASTREG-040] `role` = строковый enum-токен формата `^[a-z0-9_]+$`.
[FACT][CASTREG-050] `leverage` = CSV-список токенов.
[FACT][CASTREG-060] `cannot` = CSV-список токенов.
[FACT][CASTREG-070] `optics` = токен.
[FACT][CASTREG-080] `scene_types` = CSV-список токенов.
[FACT][CASTREG-090] `act_range` = строка формата `[I,V]` указывающая акты присутствия; пустая = все.

## INVARIANTS

[DECISION][CASTREG-200] PASS IFF `token` is unique across rows; ELSE FAIL.
[DECISION][CASTREG-210] PASS IFF `entity_id` is unique across rows; ELSE FAIL.
[DECISION][CASTREG-215] PASS IFF `display_name_ru` is unique across rows; ELSE FAIL.
[DECISION][CASTREG-220] PASS IFF each `person` row has non-empty {role, leverage, cannot, optics, scene_types}; ELSE FAIL.
[DECISION][CASTREG-230] PASS IFF each `system_agent` row has non-empty {role, leverage, cannot}; ELSE FAIL.
[DECISION][CASTREG-240] Consumers MUST treat CONTENT table as the only authoritative registry payload; ELSE FAIL.
[DECISION][CASTREG-245] tags.participants in PLAN-STORY and SCENE-ACTs MUST use `display_name_ru` values; ELSE FAIL.

## CONTENT

### FSSU Core Team

| entity_id | token | display_name_ru | nickname_ru | entity_kind | role | leverage | cannot | optics | scene_types | age_range_years | affiliation | not_antagonist | act_range | hud_style | hud_visuals | hud_sensory |
| -- | -- | -- | -- | -- | -- | -- | -- | -- | -- | -- | -- | -- | -- | -- | -- | -- |
| person.rinat_akhmetzyanov | Rinat | Ринат | | person | regional_chief | license_manipulation,quota_trading,regulatory_loopholes,federal_escalation_gate | command_field_tactics,violate_audit_trace,show_emotion_to_subordinates | silence_equals_approval_noise_equals_error | strategic_triage,resource_bargaining,summoned_to_carpet | [48,55] | FSSU_regional | true | [III,V] | | | |
| person.miron_karimov | Miron | Мирон | | person | field_operation_lead | priority_switching,tactical_pacing,grey_zone_ownership | panic,ignore_safety_protocol_without_logging | chaos_management | stabilize_team,operational_bargaining,absorb_pressure | | FSSU_field | true | [I,V] | | | |
| person.lev_safonov | Lev | Лев | Лёва | person | systems_analyst | log_deep_dive,pattern_recognition,bypass_ui_limitations | physical_fight,perceive_social_subtext | wireframe_reality | deduction_spree,server_room_archaeology,needle_finding | | FSSU_field | true | [I,V] | Terminal_Monochrome | Wireframe_overlays_plus_hex_logs | Audio_Damping |
| person.aidar_bulatov | Aidar | Айдар | | person | field_operator | area_denial,physical_breach,equipment_load_bearing | engage_in_politics,act_without_orders_in_civilian_zone | vectors_and_cover | checking_corners,presence_intimidation,breaching | | FSSU_field | true | [I,V] | Tactical_AR | Threat_markers_plus_path_projection | Haptic_Feedback |
| person.leysan_khakimova | Leysan | Лейсан | | person | legal_regulator | license_revocation,blocking_transactions,admissibility_filter | use_physical_force,lie_on_record | liability_contract | stare_down_corporates,fine_print_fast_read,sanitize_team_actions | | FSSU_legal | true | [I,V] | | | |
| person.damir_nikitin | Damir | Дамир | | person | junior_field | map_vs_territory_check,visual_forensics,sensor_blind_spot_spotting | rely_solely_on_database,ignore_physical_evidence | render_artifacts | manual_scene_exam,correct_assumptions,physical_tracking | | FSSU_field | true | [I,V] | | | |

### System Agents (part of optimization contour, NOT antagonists)

| entity_id | token | display_name_ru | nickname_ru | entity_kind | role | leverage | cannot | optics | scene_types | age_range_years | affiliation | not_antagonist | act_range | hud_style | hud_visuals | hud_sensory |
| -- | -- | -- | -- | -- | -- | -- | -- | -- | -- | -- | -- | -- | -- | -- | -- | -- |
| person.oskar_postoronny | Oskar | Оскар | | system_agent | liaison_from_operator | corporate_gatekeeping,access_delays,budget_withdrawal_threat | command_FSSU_directly,hands_on_actions | brand_risk | deny_access_politely,nda_pressure,friction_point | | operator_corp | true | [II,V] | | | |
| person.ilya_vorontsov | Ilya | Илья | | system_agent | kpi_proxy_efficiency_director | modify_success_metrics,retro_fines,audit_freeze | be_bribed,show_anger | coefficient_vision | announce_cuts_mid_op,calm_interrogation,efficiency_pressure | | city_administration | true | [I,IV] | | | |
| person.yunna_tagirova | Yunna | Юнна | | person | bio_hazard_containment_specialist | quarantine_authority,biometrics_access,triage_priority | care_about_politics,hesitate_to_amputate,provide_emotional_comfort | necrosis_prediction | biohazard_entry,cold_medical_verdict,mechanical_stabilization | [39,42] | federal_epidemiology_biosecurity_center | true | [I,III] | | | |

### External

| entity_id | token | display_name_ru | nickname_ru | entity_kind | role | leverage | cannot | optics | scene_types | age_range_years | affiliation | not_antagonist | act_range | hud_style | hud_visuals | hud_sensory |
| -- | -- | -- | -- | -- | -- | -- | -- | -- | -- | -- | -- | -- | -- | -- | -- | -- |
| external.informant | Informant | Информатор | | external | informant | | | | | | | | [II,IV] | | | |

## USAGE / RESOLUTION

[DECISION][CASTREG-300] Any consumer validating scene tags MUST validate `display_name_ru` values against this table; ELSE FAIL.
[DECISION][CASTREG-310] Conflict resolution MUST follow SPEC-PRIORITY-RESOLUTION-2215-0001; ELSE FAIL.
[DECISION][CASTREG-320] `nickname_ru` (e.g., «Лёва» for Лев) is allowed ONLY in dialogue text, never in tags/metadata.

## OUTPUT CONTRACT

```yaml
doc_id: CANON-CAST_REGISTRY-GLOBAL-2215-0001
role_type: STATE
export:
  cast_registry_rows:
    rows_source: CONTENT
    primary_key: entity_id
    participant_key: display_name_ru
    columns:
      - entity_id
      - token
      - display_name_ru
      - nickname_ru
      - entity_kind
      - role
      - leverage
      - cannot
      - optics
      - scene_types
      - age_range_years
      - affiliation
      - not_antagonist
      - act_range
      - hud_style
      - hud_visuals
      - hud_sensory
```

## FORBIDDEN

[FORBIDDEN][CASTREG-900] Introducing rules or constraints; this document is STATE registry only.
[FORBIDDEN][CASTREG-910] Implicit cast membership outside the CONTENT table.
[FORBIDDEN][CASTREG-920] Narrative prose or "why" explanations.
[FORBIDDEN][CASTREG-930] Labeling system_agent entities as "antagonist" in any field.
[FORBIDDEN][CASTREG-940] Using token instead of display_name_ru in tags.participants.

## NON-NORMATIVE

```text
Changes from v0.1.0:
- Added display_name_ru and nickname_ru columns (Russian names for prose)
- Added act_range column (which acts character appears in)
- Changed Oskar and Ilya entity_kind from person to system_agent
- Yunna confirmed as person (FSSU-adjacent specialist), not MedSpec_external
- nickname_ru "Лёва" allowed for Лев in dialogue only
- All participants in PLAN-STORY and SCENE-ACTs now use display_name_ru
```
~~~
</file>

<file path="canon/CANON-CAST_RULES-GLOBAL-2215-0001.md">
~~~markdown
---
id: CANON-CAST_RULES-GLOBAL-2215-0001
title: >
  Core Team (ФССУ) — Role Usage Rules (RULE)
class: canon
status: draft
version: 0.1.0
prefix: CASTRUL
doc_language: ru-RU
prose_language: ru-RU
inputs:
  - CANON-CAST_REGISTRY-GLOBAL-2215-0001
  - PLAN-STORY-2215-0001
depends_on:
  - SPEC-DOC-STYLE-2215-0001
  - SPEC-PRIORITY-RESOLUTION-2215-0001
scope: >
  RULE-канон использования состава ФССУ в сценах: топология, обязательность ролей,
  ограничения доменной компетенции, требования к тегам сцен и запреты.
  Без SSOT-метрик и без художественного текста.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: enforce cast usage constraints for scenes using CASTREGISTRY as authoritative registry
INPUTS: [CANON-CAST_REGISTRY-GLOBAL-2215-0001, PLAN-STORY-2215-0001]
OUTPUTS: [role_constraints, scene_usage_rules, forbidden_patterns]
FORBIDDEN: [invent_new_roles, merge_roles, superheroism, essay_mode, implicit_precedence, causal_chains_as_canon]

## DEFINITIONS

[FACT][CASTRUL-010] `scene_type` ∈ {field_operation, base_procedure, ceiling_decision}.
[FACT][CASTRUL-020] `participants_tokens` = набор `token` из тегов сцены (см. CASTREGISTRY).
[FACT][CASTRUL-030] `participants_entities` = map(tokens→entity_id) по CASTREGISTRY.
[FACT][CASTRUL-040] `role_of(entity_id)` = значение `role` из CASTREGISTRY.
[FACT][CASTRUL-050] `active_specialists_count` = число участников сцены с признаком active=true (в контракте сцены).
[FACT][CASTRUL-060] `paper_as_constraint` = bool: сцена выводит ограничения как процедурные/бумажные (ордера, допустимость, трасса).
[FACT][CASTRUL-070] `chapter_plan_exists` = bool: сцена привязана к плану главы.
[FACT][CASTRUL-080] `tags.participants_present` = bool: в сцене присутствует тег Participants.
[FACT][CASTRUL-090] `tags.focus_present` = bool: в сцене присутствует тег Focus.
[FACT][CASTRUL-100] `tags.artifact_present` = bool: в сцене присутствует тег Artifact.
[FACT][CASTRUL-110] `artifact_is_primary` = bool: артефакт/бумага является драйвером действий сцены.
[FACT][CASTRUL-120] `role_competence_violation` = bool: персонаж выполняет действие вне своей роли без явной цены/трассы.
[FACT][CASTRUL-130] `action_blocked` = bool: действие в сцене заблокировано процедурой/ограничением.
[FACT][CASTRUL-140] `paid_by_explicit_cost_and_trace` = bool: сцена явно показала цену и трассу обхода.
[FACT][CASTRUL-150] `constraint_reason_needed` ∈ {entry_or_seizure_limit, none}.
[FACT][CASTRUL-160] `team_sync_lost` = bool.
[FACT][CASTRUL-170] `digital_layer_fails` = bool.
[FACT][CASTRUL-180] `data_is_false_or_misleading` = bool.
[FACT][CASTRUL-190] `act` ∈ {I, II, III}.
[FACT][CASTRUL-200] `scene_domain` ∈ {medical, biotech, evacuation, other}.

## INVARIANTS

[DECISION][CASTRUL-300] Characters MUST be treated as system interfaces, not heroes; ELSE FAIL.
[FORBIDDEN][CASTRUL-310] Universal characters solving multiple domains without artifacts and cost.
[FORBIDDEN][CASTRUL-320] Overcompetence without constraints, price, and trace.

## CONTENT

### 1) Team topology constraints

[RULE][CASTRUL-400] IF scene_type = field_operation THEN PASS IFF participants_roles_subset_ok = true; ELSE PASS.
[RULE][CASTRUL-401] PASS IFF (participants_roles_subset_ok = true) IMPLIES (every participant role ∈ {regional_chief,field_operation_lead,systems_analyst,field_operator,legal_regulator,junior_field,liaison_from_operator,kpi_proxy_efficiency_director,bio_hazard_containment_specialist,informant}); ELSE FAIL.
[RULE][CASTRUL-410] IF scene_type ∈ {base_procedure, ceiling_decision} THEN PASS IFF regional_chief_present_or_referenced = true; ELSE PASS.

### 2) Scene tags constraints

[RULE][CASTRUL-500] IF chapter_plan_exists = true THEN PASS IFF tags.participants_present = true AND tags.focus_present = true; ELSE PASS.
[RULE][CASTRUL-510] IF artifact_is_primary = true THEN PASS IFF tags.artifact_present = true; ELSE PASS.

### 3) Load and competence constraints

[RULE][CASTRUL-600] PASS IFF active_specialists_count ∈ [1, 2]; ELSE FAIL.
[RULE][CASTRUL-610] IF role_competence_violation = true THEN PASS IFF action_blocked = true OR paid_by_explicit_cost_and_trace = true; ELSE PASS.

[RULE][CASTRUL-620] IF constraint_reason_needed = entry_or_seizure_limit THEN PASS IFF regional_chief_is_source_of_constraint = true; ELSE PASS.
[RULE][CASTRUL-630] IF team_sync_lost = true THEN PASS IFF field_operation_lead_acts_as_sync_signal = true; ELSE PASS.
[RULE][CASTRUL-640] IF digital_layer_fails = true THEN PASS IFF primary_scene_lead_role ∈ {field_operation_lead, field_operator}; ELSE PASS.
[RULE][CASTRUL-650] IF data_is_false_or_misleading = true THEN PASS IFF junior_field_validates_by_physical_artifacts = true; ELSE PASS.

[RULE][CASTRUL-660] IF act = III AND scene_domain ∈ {medical, biotech, evacuation} THEN PASS IFF role_present.bio_hazard_containment_specialist = true; ELSE FAIL.

### 4) Text constraints (demography reflection)

[RULE][CASTRUL-700] PASS IFF team_ethnicity_model = post_ethnic; ELSE FAIL.
[RULE][CASTRUL-710] PASS IFF ethnicity_in_text = cultural_background_only; ELSE FAIL.
[FORBIDDEN][CASTRUL-720] Ethnicity_as_primary_plot_axis.

### 5) Paper-as-constraint

[RULE][CASTRUL-800] PASS IFF paper_as_constraint = true; ELSE FAIL.

## USAGE / RESOLUTION

[DECISION][CASTRUL-900] Consumers MUST resolve tokens/roles via CANON-CAST_REGISTRY-GLOBAL-2215-0001; ELSE FAIL.
[DECISION][CASTRUL-910] Conflict resolution MUST follow SPEC-PRIORITY-RESOLUTION-2215-0001; ELSE FAIL.
[RULE][CASTRUL-920] IF a scene violates FORBIDDEN in this document THEN scene MUST be rejected as invalid input; ELSE FAIL.

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-CAST_RULES-GLOBAL-2215-0001
role_type: RULE
export:
  role_constraints:
    - CASTRUL-300
    - CASTRUL-400
    - CASTRUL-401
    - CASTRUL-410
    - CASTRUL-600
    - CASTRUL-610
    - CASTRUL-660
    - CASTRUL-800
  scene_usage_rules:
    - CASTRUL-500
    - CASTRUL-510
    - CASTRUL-620
    - CASTRUL-630
    - CASTRUL-640
    - CASTRUL-650
    - CASTRUL-700
    - CASTRUL-710
  forbidden_patterns:
    - CASTRUL-310
    - CASTRUL-320
    - CASTRUL-720
~~~

## FORBIDDEN

[FORBIDDEN][CASTRUL-950] Inventing new core roles or merging roles without explicit CANON addendum.
[FORBIDDEN][CASTRUL-951] Superhero framing replacing procedure, artifacts, and constraints.
[FORBIDDEN][CASTRUL-952] Making liaison a traitor-villain by direct sabotage actions.
[FORBIDDEN][CASTRUL-953] Allowing biological combat enhancements as everyday norm for field operator.
[FORBIDDEN][CASTRUL-954] Using monologues as primary vehicle of philosophy instead of procedural consequences.

## NON-NORMATIVE

~~~markdown
Example chapter tags:
[Participants: Miron, Aidar, Leysan]
[Focus: JAP_entry + ISO_snapshot + chain_of_custody]
[Artifact: ISO + CM]
~~~

~~~
</file>

<file path="canon/CANON-CAST-GLOBAL-2215-0001.md">
~~~markdown
---
id: CANON-CAST-GLOBAL-2215-0001
title: >
  Core Team (ФССУ) — Cast Gateway (INTERFACE)
class: canon
status: fixed
version: 0.3.1
prefix: CAST
doc_language: ru-RU
prose_language: ru-RU
inputs:
  - CANON-CAST_REGISTRY-GLOBAL-2215-0001
  - CANON-CAST_RULES-GLOBAL-2215-0001
depends_on:
  - SPEC-DOC-STYLE-2215-0001
  - SPEC-PRIORITY-RESOLUTION-2215-0001
scope: >
  INTERFACE-шлюз канона состава ФССУ. Этот документ НЕ содержит реестра (STATE)
  и НЕ содержит правил (RULE). Он определяет единственную точку входа и
  перечисляет обязательные документы: CASTREGISTRY (данные) и CASTRULES (ограничения).
---

## LLM-INTENT

ROLE_TYPE: INTERFACE
SCOPE: provide a single entrypoint for FSSU cast by binding required registry and rules documents
INPUTS: [CANON-CAST_REGISTRY-GLOBAL-2215-0001, CANON-CAST_RULES-GLOBAL-2215-0001]
OUTPUTS: [owns, consumes, forbids]
FORBIDDEN: [registry_definition, rule_definition, prose, mixed_semantics]

## DEFINITIONS

[FACT][CAST-010] `cast_gateway` = документ-указатель, связывающий реестр состава и правила использования.
[FACT][CAST-020] `cast_registry_doc_id` = CANON-CAST_REGISTRY-GLOBAL-2215-0001.
[FACT][CAST-030] `cast_rules_doc_id` = CANON-CAST_RULES-GLOBAL-2215-0001.
[FACT][CAST-040] `cast_system_FSSU` = домен/концепт “состав ФССУ как система ролей для сцен”.

## INVARIANTS

[DECISION][CAST-100] PASS IFF consumers treat `cast_registry_doc_id` as the only authoritative cast data source; ELSE FAIL.
[DECISION][CAST-110] PASS IFF consumers treat `cast_rules_doc_id` as the only authoritative cast usage constraints source; ELSE FAIL.
[DECISION][CAST-120] This document MUST NOT define registry rows or usage rules; ELSE FAIL.

## CONTENT

[DECISION][CAST-200] Consumers requiring FSSU cast MUST load both INPUTS of this document; ELSE FAIL.
[DECISION][CAST-210] Conflict resolution MUST follow SPEC-PRIORITY-RESOLUTION-2215-0001; ELSE FAIL.

## USAGE / RESOLUTION

[DECISION][CAST-300] Downstream docs SHOULD NOT reference cast docs directly; they MUST reference this gateway OR explicitly reference both cast_registry_doc_id and cast_rules_doc_id; ELSE FAIL.
[DECISION][CAST-310] If this gateway is referenced, omission of any of its INPUTS MUST be treated as invalid context; ELSE FAIL.

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-CAST-GLOBAL-2215-0001
role_type: INTERFACE
export:
  - owns: [cast_system_FSSU]
  - consumes:
      - CANON-CAST_REGISTRY-GLOBAL-2215-0001
      - CANON-CAST_RULES-GLOBAL-2215-0001
  - forbids:
      - registry_definition
      - rule_definition
      - prose
      - mixed_semantics
~~~

## FORBIDDEN

[FORBIDDEN][CAST-900] Introducing cast registry rows in this document.
[FORBIDDEN][CAST-910] Introducing cast usage rules in this document.
[FORBIDDEN][CAST-920] Consuming any cast data not coming from CANON-CAST_REGISTRY-GLOBAL-2215-0001.
[FORBIDDEN][CAST-930] Consuming any cast constraints not coming from CANON-CAST_RULES-GLOBAL-2215-0001.

## NON-NORMATIVE

(empty)

~~~
</file>

<file path="canon/CANON-CAST-PUBLIC-2215-0001.md">
~~~markdown
---
id: CANON-CAST-PUBLIC-2215-0001
title: >
  Canon Public Figures — VIPs, Executives, and Media Faces (2215)
class: canon
status: fixed
version: 1.1.0
inputs:
  - CANON-ORGS-2215-0001
depends_on:
  - SPEC-DOC-STYLE-2215-0001
  - SPEC-PRIORITY-RESOLUTION-2215-0001
scope: >
  STATE-реестр публичных фигур: руководители, медиа-лица и подписи власти.
  Используется как справочник для сцен (внешние лица институций).
---

## LLM-INTENT

ROLE_TYPE: STATE
SCOPE: registry of high-profile public figures used by FSSU and institutions
INPUTS:
  - CANON-ORGS-2215-0001
OUTPUTS:
  - vip_profiles
FORBIDDEN:
  - comic_book_villains
  - secret_identities_as_defaults
  - unrelated_celebrities

---

## DEFINITIONS

[FACT][VIP-DEF-010] signature_authority = персона, чья цифровая подпись валидирует изменения федерального или критического уровня.
[FACT][VIP-DEF-011] media_avatar = публичный образ, используемый для коммуникации институции.
[FACT][VIP-DEF-012] vip_profile = {vip_id, name, org_ref, public_role, signature_authority, presence_mode, function_tags, plot_relation_tags}.

---

## INVARIANTS

[DECISION][VIP-INV-010] VIP presence_mode MUST be mediated by channels {holo_link, decrees, proxies} as default.
[DECISION][VIP-INV-011] VIP motivation MUST be institution_preservation, not pure_malice.

---

## CONTENT

[STATE][VIP-KAM-010] vip.vip_kamsky.vip_id = VIP-KAMSKY.
[STATE][VIP-KAM-011] vip.vip_kamsky.name = Viktor_Kamsky.
[STATE][VIP-KAM-012] vip.vip_kamsky.public_role = ceo_rosenergoatom_ix.
[STATE][VIP-KAM-013] vip.vip_kamsky.org_ref = CANON-ORGS-2215-0001.
[STATE][VIP-KAM-014] vip.vip_kamsky.signature_authority = federal_critical_changes.
[STATE][VIP-KAM-015] vip.vip_kamsky.presence_mode = {holo_link, decrees, office_proxies}.
[STATE][VIP-KAM-016] vip.vip_kamsky.function_tags = {energy_sovereignty, institutional_ceiling}.
[STATE][VIP-KAM-017] vip.vip_kamsky.plot_relation_tags = {untouchable_directly, bargaining_only}.

[STATE][VIP-STO-020] vip.vip_stoica.vip_id = VIP-STOICA.
[STATE][VIP-STO-021] vip.vip_stoica.name = Director_Stoica.
[STATE][VIP-STO-022] vip.vip_stoica.public_role = head_gosplan_algorithmica.
[STATE][VIP-STO-023] vip.vip_stoica.org_ref = CANON-ORGS-2215-0001.
[STATE][VIP-STO-024] vip.vip_stoica.signature_authority = quota_formula_validation.
[STATE][VIP-STO-025] vip.vip_stoica.presence_mode = {holo_link, decrees, algorithmic_notices}.
[STATE][VIP-STO-026] vip.vip_stoica.function_tags = {quota_source, technocratic_gate}.
[STATE][VIP-STO-027] vip.vip_stoica.plot_relation_tags = {remote_pressure, policy_ceiling}.

[STATE][VIP-VOL-030] vip.vip_volkova.vip_id = VIP-VOLKOVA.
[STATE][VIP-VOL-031] vip.vip_volkova.name = Inga_Volkova.
[STATE][VIP-VOL-032] vip.vip_volkova.public_role = ceo_translogist_kama.
[STATE][VIP-VOL-033] vip.vip_volkova.org_ref = CANON-ORGS-2215-0001.
[STATE][VIP-VOL-034] vip.vip_volkova.signature_authority = operator_level_orders.
[STATE][VIP-VOL-035] vip.vip_volkova.presence_mode = {direct_calls, proxy_lawyers, site_controllers}.
[STATE][VIP-VOL-036] vip.vip_volkova.function_tags = {logistics_pressure, kpi_survival}.
[STATE][VIP-VOL-037] vip.vip_volkova.plot_relation_tags = {act_i_antagonist_candidate, crisis_manager}.

[STATE][VIP-RAZ-040] vip.vip_razin.vip_id = VIP-RAZIN.
[STATE][VIP-RAZ-041] vip.vip_razin.name = Ilya_Razin.
[STATE][VIP-RAZ-042] vip.vip_razin.public_role = head_city_admin_chelny.
[STATE][VIP-RAZ-043] vip.vip_razin.org_ref = CANON-ORGS-2215-0001.
[STATE][VIP-RAZ-044] vip.vip_razin.signature_authority = municipal_formal_signatures.
[STATE][VIP-RAZ-045] vip.vip_razin.presence_mode = {decrees, press_briefings, controlled_meetings}.
[STATE][VIP-RAZ-046] vip.vip_razin.function_tags = {scapegoat_interface, liability_sink}.
[STATE][VIP-RAZ-047] vip.vip_razin.plot_relation_tags = {reluctant_ally_candidate, responsibility_without_power}.

[STATE][VIP-SOL-050] vip.vip_sol.vip_id = VIP-SOL.
[STATE][VIP-SOL-051] vip.vip_sol.name = Valery_Sol.
[STATE][VIP-SOL-052] vip.vip_sol.public_role = infosfera_public_anchor.
[STATE][VIP-SOL-053] vip.vip_sol.org_ref = CANON-ORGS-2215-0001.
[STATE][VIP-SOL-054] vip.vip_sol.signature_authority = none.
[STATE][VIP-SOL-055] vip.vip_sol.presence_mode = {broadcast_streams, emergency_overlays}.
[STATE][VIP-SOL-056] vip.vip_sol.function_tags = {panic_suppression, public_narrative_interface}.
[STATE][VIP-SOL-057] vip.vip_sol.plot_relation_tags = {media_face, crisis_broadcast}.

---

## USAGE / RESOLUTION

[DECISION][VIP-USE-010] Документ используется как реестр: сцены MAY ссылаться на vip_id и function_tags.
[DECISION][VIP-USE-011] Conflict resolution MUST follow SPEC-PRIORITY-RESOLUTION-2215-0001.

---

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-CAST-PUBLIC-2215-0001
role_type: STATE
export:
  vip_profiles:
    - vip_id: VIP-KAMSKY
      name: Viktor_Kamsky
      public_role: ceo_rosenergoatom_ix
      signature_authority: federal_critical_changes
      presence_mode: [holo_link, decrees, office_proxies]
      function_tags: [energy_sovereignty, institutional_ceiling]
      plot_relation_tags: [untouchable_directly, bargaining_only]
    - vip_id: VIP-STOICA
      name: Director_Stoica
      public_role: head_gosplan_algorithmica
      signature_authority: quota_formula_validation
      presence_mode: [holo_link, decrees, algorithmic_notices]
      function_tags: [quota_source, technocratic_gate]
      plot_relation_tags: [remote_pressure, policy_ceiling]
    - vip_id: VIP-VOLKOVA
      name: Inga_Volkova
      public_role: ceo_translogist_kama
      signature_authority: operator_level_orders
      presence_mode: [direct_calls, proxy_lawyers, site_controllers]
      function_tags: [logistics_pressure, kpi_survival]
      plot_relation_tags: [act_i_antagonist_candidate, crisis_manager]
    - vip_id: VIP-RAZIN
      name: Ilya_Razin
      public_role: head_city_admin_chelny
      signature_authority: municipal_formal_signatures
      presence_mode: [decrees, press_briefings, controlled_meetings]
      function_tags: [scapegoat_interface, liability_sink]
      plot_relation_tags: [reluctant_ally_candidate, responsibility_without_power]
    - vip_id: VIP-SOL
      name: Valery_Sol
      public_role: infosfera_public_anchor
      signature_authority: none
      presence_mode: [broadcast_streams, emergency_overlays]
      function_tags: [panic_suppression, public_narrative_interface]
      plot_relation_tags: [media_face, crisis_broadcast]
~~~

---

## FORBIDDEN

[FORBIDDEN][VIP-FBD-010] Depicting VIPs as comic villains acting from pure malice.
[FORBIDDEN][VIP-FBD-011] Giving municipal head unlimited power without procedural basis.
[FORBIDDEN][VIP-FBD-012] Introducing secret identities as default explanation without artifacts and procedure.

---

## NON-NORMATIVE

(Empty by design)

~~~
</file>

<file path="canon/CANON-CAST-VOICE-2215-0001.md">
~~~markdown
---
id: CANON-CAST-VOICE-2215-0001
title: >
  Canon Cast Voice — Speech Patterns (2215)
class: canon
status: fixed
version: 2.0.0
doc_language: en
prose_language: ru-RU
inputs:
  - CANON-CAST-GLOBAL-2215-0001
  - BASELINE-PSYCH-2215-0001
depends_on:
  - SPEC-DOC-STYLE-2215-0001
scope: >
  Реестр речевых паттернов и синтаксических ограничений для команды ФССУ
  и системных агентов. Определяет структуру речи, лексические маркеры и тональность.
  Все имена соответствуют CANON-CASTREGISTRY display_name_ru.
---

## LLM-INTENT

ROLE_TYPE: STATE
SCOPE: linguistic profiles for protagonists and system agents defined as state parameters.
INPUTS: [CANON-CAST-GLOBAL-2215-0001]
OUTPUTS: [speech_profile_state]
FORBIDDEN: [literary_descriptions, non_atomic_values, emotional_reasoning]

## DEFINITIONS

[FACT][VOICE-DEF-010] Liability-Speak = синтаксис, минимизирующий юридическую ответственность говорящего.
[FACT][VOICE-DEF-011] Command-Brief = императивный синтаксис с опусканием вежливости.
[FACT][VOICE-DEF-012] Data-Stream = высокоскоростная подача фактов без пауз и интонаций.
[FACT][VOICE-DEF-013] Coefficient-Speak = речь через метрики и показатели, эмоции заменены числами.

## INVARIANTS

[DECISION][VOICE-INV-010] Operational dialogue MUST NOT exceed 3 sentences per turn.
[DECISION][VOICE-INV-011] Silence MUST be indicated as an active state `[ACTION: Silence]`.
[DECISION][VOICE-INV-012] Profanity IS allowed ONLY as a marker of loss of control.
[DECISION][VOICE-INV-013] All section headers MUST use display_name_ru from CASTREGISTRY.

## CONTENT

### 1. Мирон (field_operation_lead)

[STATE][VOICE-MIR-010] miron.role_function = "Tactical Authority".
[STATE][VOICE-MIR-011] miron.tone = "Heavy, Tired, Absolute".
[STATE][VOICE-MIR-012] miron.syntax = "Imperative" (orders, not requests).
[STATE][VOICE-MIR-013] miron.markers = ["Отставить.", "Работай.", "В канале чисто?", "Под мою ответственность."].
[STATE][VOICE-MIR-014] miron.attitude_to_hq = "Protective_Wall".

### 2. Лейсан (legal_regulator)

[STATE][VOICE-LEY-020] leysan.role_function = "Admissibility Filter".
[STATE][VOICE-LEY-021] leysan.tone = "Polite, Quiet, Threatening".
[STATE][VOICE-LEY-022] leysan.syntax = "Conditional + Legal Tag" (IF action THEN violation).
[STATE][VOICE-LEY-023] leysan.markers = ["Это недопустимо.", "Протокол нарушен.", "Фиксирую отказ.", "Вы уверены?"].
[STATE][VOICE-LEY-024] leysan.weapon = "Silence".

### 3. Лев (systems_analyst)

[STATE][VOICE-LEV-030] lev.role_function = "Interface".
[STATE][VOICE-LEV-031] lev.tone = "Monotone, High-speed".
[STATE][VOICE-LEV-032] lev.syntax = "Observation -> Deduction" (Subject often omitted).
[STATE][VOICE-LEV-033] lev.markers = ["Коррекция.", "Есть контакт.", "След обрывается.", "Это не баг."].
[STATE][VOICE-LEV-034] lev.quirk = "Depersonalization" (Uses 'Target' instead of Name).
[STATE][VOICE-LEV-035] lev.nickname_in_dialogue = "Лёва" (used by team members in casual address; never in tags/metadata).

### 4. Айдар (field_operator)

[STATE][VOICE-AID-040] aidar.role_function = "Kinetic Interaction".
[STATE][VOICE-AID-041] aidar.tone = "Rough, Dismissive".
[STATE][VOICE-AID-042] aidar.syntax = "Telegraphic / Slang" (Verbs > Nouns).
[STATE][VOICE-AID-043] aidar.markers = ["Пусто.", "Взял.", "Сбрось.", "Тяжелый.", "В утиль?"].
[STATE][VOICE-AID-044] aidar.coping_mechanism = "Mockery of Protocol".

### 5. Дамир (junior_field)

[STATE][VOICE-DAM-050] damir.role_function = "Moral Observer".
[STATE][VOICE-DAM-051] damir.tone = "Hesitant, Inquisitive".
[STATE][VOICE-DAM-052] damir.syntax = "Interrogative" (Questions authority/reality).
[STATE][VOICE-DAM-053] damir.markers = ["А это законно?", "Я не понимаю.", "Там люди.", "Мирон?"].

### 6. Ринат (regional_chief)

[STATE][VOICE-RIN-060] rinat.role_function = "Ceiling".
[STATE][VOICE-RIN-061] rinat.tone = "Measured, Political, Dry".
[STATE][VOICE-RIN-062] rinat.syntax = "Declarative + Implicit Threat" (states facts that constrain).
[STATE][VOICE-RIN-063] rinat.markers = ["Бюджет не резиновый.", "Согласовано.", "Не мой уровень.", "Я предупреждал."].
[STATE][VOICE-RIN-064] rinat.attitude = "Shield_and_ceiling" (protects team from above, limits from below).

### 7. Оскар (liaison_from_operator) — system_agent

[STATE][VOICE-OSK-070] oskar.role_function = "Corporate Friction".
[STATE][VOICE-OSK-071] oskar.tone = "Professional, Smooth, Deflecting".
[STATE][VOICE-OSK-072] oskar.syntax = "Passive Voice + Corporate Euphemism" (avoids direct statements).
[STATE][VOICE-OSK-073] oskar.markers = ["Мы рассмотрим.", "Это не в нашей компетенции.", "Давайте зафиксируем протоколом.", "Вы понимаете наши ограничения."].
[STATE][VOICE-OSK-074] oskar.weapon = "Delay".

### 8. Илья (kpi_proxy_efficiency_director) — system_agent

[STATE][VOICE-ILY-080] ilya.role_function = "Coefficient Wall".
[STATE][VOICE-ILY-081] ilya.tone = "Calm, Data-heavy, Genuinely Convinced".
[STATE][VOICE-ILY-082] ilya.syntax = "Coefficient-Speak" (everything is a metric; emotions are noise).
[STATE][VOICE-ILY-083] ilya.markers = ["По показателям всё в норме.", "Это оптимизация.", "Бюджет не позволяет.", "Эмоции — не аргумент."].
[STATE][VOICE-ILY-084] ilya.belief = "Genuine" (he truly believes efficiency protects people; not cynical).

### 9. Юнна (bio_hazard_containment_specialist)

[STATE][VOICE-YUN-090] yunna.role_function = "Cold Diagnosis".
[STATE][VOICE-YUN-091] yunna.tone = "Clinical, Detached, Precise".
[STATE][VOICE-YUN-092] yunna.syntax = "Medical Report" (Subject-Condition-Prognosis, no hedging).
[STATE][VOICE-YUN-093] yunna.markers = ["Биологический материал.", "Прогноз отрицательный.", "Протокол изоляции.", "Не трогайте."].
[STATE][VOICE-YUN-094] yunna.quirk = "Zero small talk" (answers only what is asked, adds nothing).

## USAGE / RESOLUTION

[DECISION][VOICE-USE-010] Dialogue conflict MUST stem from syntax clash (Law vs Data vs Force vs Coefficient).
[DECISION][VOICE-USE-011] Лейсан MUST NEVER shout.
[DECISION][VOICE-USE-012] Лев MUST NEVER express empathy for biological pain.
[DECISION][VOICE-USE-013] Илья MUST NEVER show anger or cynicism; his belief in efficiency is sincere.
[DECISION][VOICE-USE-014] Юнна MUST NEVER engage in philosophical discussion; only medical facts.
[DECISION][VOICE-USE-015] Team members MAY address Лев as «Лёва» in dialogue.

## OUTPUT CONTRACT

```yaml
doc_id: CANON-CAST-VOICE-2215-0001
role_type: STATE
export:
  - metric: miron.syntax
    owner_domain: NARRATIVE
    values: {core: Imperative}
  - metric: leysan.tone
    owner_domain: NARRATIVE
    values: {core: Polite_Quiet_Threatening}
  - metric: lev.syntax
    owner_domain: NARRATIVE
    values: {core: Observation_Deduction}
  - metric: ilya.tone
    owner_domain: NARRATIVE
    values: {core: Calm_Data_Convinced}
  - metric: yunna.syntax
    owner_domain: NARRATIVE
    values: {core: Medical_Report}
```

## FORBIDDEN

[FORBIDDEN][VOICE-FBD-010] Characters explaining emotions ("I am sad").
[FORBIDDEN][VOICE-FBD-011] Using 20th-century idioms.
[FORBIDDEN][VOICE-FBD-012] Whedon-esque banter during combat.
[FORBIDDEN][VOICE-FBD-013] Using ASCII token (e.g., "Lev") in prose text; use display_name_ru ("Лев").
[FORBIDDEN][VOICE-FBD-014] Using nickname_ru ("Лёва") in narration or tags; only in direct dialogue.

## NON-NORMATIVE

```text
Changes from v1.3.0:
- Fixed "Leva" → "Лев" (canonical name); "Лёва" is dialogue-only nickname
- All field names changed from leva.* → lev.*
- Added profiles: Ринат, Оскар, Илья, Юнна
- Added Coefficient-Speak definition for Илья
- Added system_agent voice constraints (CNF-INV-007 alignment)
```
~~~
</file>

<file path="canon/CANON-CITY-BOUNDARY-RU-2215-0008.md">
~~~markdown
---
id: CANON-CITY-BOUNDARY-RU-2215-0008
title: >
  RU 2215 — Набережные Челны: граница города (якорные точки и типы краёв)
class: canon
status: draft
version: 0.1.1
inputs: []
depends_on: []
scope: >
  Норматив (RULE) функциональной границы Челнов-2215 через периметр якорных
  точек и типы городских краёв; используется для проверки географии сцен и
  запрета урбанизации западного берега Камы.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: define functional city boundary of CHELNY-2215 via anchor perimeter and edge types
INPUTS: [-> none]
OUTPUTS: [city_boundary_perimeter, edge_type_taxonomy, anchor_points, boundary_invariants]
FORBIDDEN: [invent_anchors, urbanize_west_bank, treat_elabuga_as_city, use_yurtovskoe_as_boundary]

## DEFINITIONS

[DECISION][CB-001] term.city_boundary = "функциональная граница Челнов-2215 (не административная карта XXI века)".
[DECISION][CB-002] term.perimeter_anchor = "якорная точка (населённый пункт/природный объект), задающая периметр границы".
[DECISION][CB-003] term.edge_type = "тип края городской территории (вода/пойма, лес, индустрия, градиент плотности, сельхоз-инфра)".
[DECISION][CB-004] term.within_perimeter = "любая точка, лежащая внутри периметра, образованного якорными точками по часовой стрелке".
[DECISION][CB-005] term.outside_perimeter = "любая точка, лежащая вне периметра".

## INVARIANTS

[DECISION][CB-010] west_bank_kama.urbanization = "MUST NOT".
[DECISION][CB-011] west_bank_kama.status = "natural_or_protected_zone".
[DECISION][CB-012] west_bank_kama.access = "MUST be improved via bridges and routes".
[DECISION][CB-013] elabuga.is_within_chelny_city_boundary = "MUST NOT".
[DECISION][CB-014] yurtovskoe_lesnichestvo.role = "internal_green_zone_in_SE_sector".
[DECISION][CB-015] yurtovskoe_lesnichestvo.used_as_boundary = "MUST NOT".

## CONTENT

[DECISION][CB-020] perimeter.order = "clockwise".
[DECISION][CB-021] perimeter.anchor.west = "Бетьки".
[DECISION][CB-022] perimeter.anchor_chain.southwest = ["Старые Ерыклы", "Верхний Суык-Су", "Нижний Суык-Су"].
[DECISION][CB-023] perimeter.anchor_chain.south = ["Новотроицкое", "Комсомолец", "посёлок совхоза Татарстан"].
[DECISION][CB-024] perimeter.anchor_chain.southeast = ["Подгорный Такермен", "Верхний Такермен"].
[DECISION][CB-025] perimeter.anchor.east = "Верхний Байлар".
[DECISION][CB-026] perimeter.sector.northeast.extent = "toward river Ик (distant belt)".
[DECISION][CB-027] perimeter.anchor_chain.north = ["Большая Шильна", "Малая Шильна", "Боровецкий лес"].

[DECISION][CB-030] edge_type.enum = ["water_floodplain", "industrial_logistics", "agro_infrastructure", "forest_protected", "density_gradient"].

[DECISION][CB-031] edge_type.assignment.west = "water_floodplain".
[DECISION][CB-032] edge_type.assignment.southwest = "density_gradient".
[DECISION][CB-033] edge_type.assignment.south = "industrial_logistics".
[DECISION][CB-034] edge_type.assignment.southeast = "agro_infrastructure".
[DECISION][CB-035] edge_type.assignment.east = "density_gradient".
[DECISION][CB-036] edge_type.assignment.northeast = "density_gradient".
[DECISION][CB-037] edge_type.assignment.north = "forest_protected".

[DECISION][CB-040] west_sector.termination_profile = "hard_stop".
[DECISION][CB-041] southwest_sector.density_profile = "MUST decrease gradually toward anchors".
[DECISION][CB-042] south_sector.boundary_driver = "infrastructure_belt".
[DECISION][CB-043] southeast_sector.yurtovskoe_location = "MUST be within perimeter (SE internal green zone)".
[DECISION][CB-044] northeast_sector.density_profile = "MAY be low_density while still within city boundary".
[DECISION][CB-045] north_sector.forest_rule = "city_edge_adjacent_to_forest; city_MUST_NOT_enter_forest".

[DECISION][CB-050] downstream.centers_definition_scope = "MUST be within this perimeter".
[DECISION][CB-051] downstream.highways_definition_scope = "MUST be within this perimeter".
[DECISION][CB-052] bridges_over_kama.semantic = "access_interface_to_nature; MUST NOT imply west_bank_urbanization".

## USAGE / RESOLUTION

[DECISION][CB-060] IF scene.location ∈ outside_perimeter THEN scene.location.MUST_NOT_be_labeled_as "Челны" or "городская территория Челнов-2215".
[DECISION][CB-061] IF scene.location is on west_bank_kama THEN scene.urban_fabric_presence MUST_NOT be asserted.
[DECISION][CB-062] IF scene.requires_elabuga THEN elabuga MUST be referenced as separate ядро/город вне границы Челнов-2215.
[DECISION][CB-063] Any ambiguity about boundary placement MUST be treated as error and resolved by adding anchors (new CANON addendum), not by prose in scenes.

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-CITY-BOUNDARY-RU-2215-0008
role_type: RULE
export:
  - rule_id: CB-010
    intent: prohibit west bank urbanization
    inputs: [west_bank_kama]
    outputs: [allowed_urban_fabric_locations]
  - rule_id: CB-020
    intent: define clockwise anchor perimeter
    inputs: [anchor_points]
    outputs: [city_boundary_perimeter]
  - rule_id: CB-030
    intent: define edge type taxonomy and assignments
    inputs: [sectors]
    outputs: [edge_type_taxonomy, sector_edge_types]
  - rule_id: CB-060
    intent: scene labeling constraint for inside/outside perimeter
    inputs: [scene.location]
    outputs: [scene.validity, required_fix]
~~~

## FORBIDDEN

[FORBIDDEN][CB-900] Inventing new perimeter anchors without introducing a new CANON addendum.
[FORBIDDEN][CB-901] Any statement that west bank of Kama is urbanized or contains continuous city fabric.
[FORBIDDEN][CB-902] Treating Elabuga as a district inside Chelny city boundary.
[FORBIDDEN][CB-903] Using "Юртовское лесничество" as a perimeter-defining boundary point.
[FORBIDDEN][CB-904] Mixing administrative-2020s borders as if they were the functional-2215 boundary without explicit canon.

## NON-NORMATIVE

[DECISION][CB-990] Example usage note: "выехали за периметр — формулировать как 'за город' / 'вне челнинской ткани', не как 'в соседний район Челнов'."

~~~
</file>

<file path="canon/CANON-CITY-REGISTRY-RU-2215-0001.md">
~~~markdown
---
id: CANON-CITY-REGISTRY-RU-2215-0001
title: >
  RU 2215 — City Anchors Registry: Chelny / Chelny–Yelabuga / Moscow (Token Pools)
class: canon
status: draft
version: 0.1.0
prefix: CITYA
doc_language: ru-RU
prose_language: ru-RU
inputs: []
depends_on:
  - SPEC-DOC-STYLE-2215-0001
  - SPEC-PRIORITY-RESOLUTION-2215-0001
scope: >
  STATE-реестр токенов city anchors: нормализованные пулы якорей для сцен
  (Chelny / Chelny–Yelabuga / Moscow + contrast). Не содержит правил применения
  (это в CANON-CITY-RU-2215-0007 / RULE-доках) и не вводит SSOT-метрики.
---

## LLM-INTENT

ROLE_TYPE: STATE
SCOPE: define canonical city anchor token pools as state registry (no rules, no prose)
INPUTS: []
OUTPUTS: [city_anchor_pools]
FORBIDDEN: [implicit_defaults, rule_definition, narrative_prose, numeric_city_metrics]

## DEFINITIONS

[FACT][CITYA-010] `city_key` ∈ {CHELNY, CHELNY_YELABUGA, MOSCOW, CONTRAST}.
[FACT][CITYA-020] `city_anchor_token` = UPPER_SNAKE_CASE token used to anchor scene perception without exposition.
[FACT][CITYA-030] `city_anchor_pool` = map {city_key -> set(city_anchor_token)}.
[FACT][CITYA-040] `token_pool_owner_domain` = "CITY_ANCHORS_RU".

## INVARIANTS

[DECISION][CITYA-050] This document MUST define city_anchor_pool for all city_key values; ELSE FAIL.
[DECISION][CITYA-060] Tokens MUST be UPPER_SNAKE_CASE; ELSE FAIL.
[FORBIDDEN][CITYA-070] Defining application rules or budgets here (belongs to RULE/INTERFACE); ELSE FAIL.
[FORBIDDEN][CITYA-080] Numeric city metrics in this document; ELSE FAIL.

## CONTENT

[STATE][CITYA-100] city_anchor_pool.CHELNY.tokens = {SEASON_SUMMER_WARM_NOT_SUNNY, SKY_GREY_OVERCAST, LIGHT_DIFFUSE_LOW_CONTRAST, MATERIALS_MATTE_MICROTEXTURE, GLASS_LOW_GLARE_NOT_MIRROR, FORMS_CALM_LARGE_RADII, PRINCIPLE_EVERYTHING_LARGER, VOID_COMFORT_LARGE_SPACES, RESIDENTS_EASIER_THAN_VISITORS, AWE_WITHOUT_DESIRE}.
[STATE][CITYA-110] city_anchor_pool.CHELNY_YELABUGA.tokens = {TWO_CORE_AGGLOMERATION, KAMA_CORRIDOR_FUNCTION_DENSE, INTENTIONAL_BREAKS_VOID, TRANSITION_FEELS_CITY_TYPE_SWITCH}.
[STATE][CITYA-120] city_anchor_pool.MOSCOW.tokens = {ROLE_EDGE_OF_TIME, MODE_CONTINUOUS_DEPLOYMENT, POSSIBILITIES_DENSITY_MAX, COGNITIVE_LOAD_HIGH, NOT_DUBAI_SHOWOFF, OVERCARING_RICH_PARENT_VIBE}.
[STATE][CITYA-130] city_anchor_pool.CONTRAST.tokens = {CHELNY_FUTURE_AS_BACKGROUND, MOSCOW_FUTURE_AS_EVENT}.

## USAGE / RESOLUTION

[DECISION][CITYA-200] Consumers MUST treat only OUTPUT CONTRACT exports as consumable semantics; ELSE FAIL.
[DECISION][CITYA-210] Conflict resolution MUST follow SPEC-PRIORITY-RESOLUTION-2215-0001; ELSE FAIL.

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-CITY-REGISTRY-RU-2215-0001
role_type: STATE
export:
  - metric: city_anchor_pool.CHELNY.tokens
    owner_domain: CITY_ANCHORS_RU
    values:
      core:
        - SEASON_SUMMER_WARM_NOT_SUNNY
        - SKY_GREY_OVERCAST
        - LIGHT_DIFFUSE_LOW_CONTRAST
        - MATERIALS_MATTE_MICROTEXTURE
        - GLASS_LOW_GLARE_NOT_MIRROR
        - FORMS_CALM_LARGE_RADII
        - PRINCIPLE_EVERYTHING_LARGER
        - VOID_COMFORT_LARGE_SPACES
        - RESIDENTS_EASIER_THAN_VISITORS
        - AWE_WITHOUT_DESIRE
      p90: none
      range: none
    unit: none
  - metric: city_anchor_pool.CHELNY_YELABUGA.tokens
    owner_domain: CITY_ANCHORS_RU
    values:
      core:
        - TWO_CORE_AGGLOMERATION
        - KAMA_CORRIDOR_FUNCTION_DENSE
        - INTENTIONAL_BREAKS_VOID
        - TRANSITION_FEELS_CITY_TYPE_SWITCH
      p90: none
      range: none
    unit: none
  - metric: city_anchor_pool.MOSCOW.tokens
    owner_domain: CITY_ANCHORS_RU
    values:
      core:
        - ROLE_EDGE_OF_TIME
        - MODE_CONTINUOUS_DEPLOYMENT
        - POSSIBILITIES_DENSITY_MAX
        - COGNITIVE_LOAD_HIGH
        - NOT_DUBAI_SHOWOFF
        - OVERCARING_RICH_PARENT_VIBE
      p90: none
      range: none
    unit: none
  - metric: city_anchor_pool.CONTRAST.tokens
    owner_domain: CITY_ANCHORS_RU
    values:
      core:
        - CHELNY_FUTURE_AS_BACKGROUND
        - MOSCOW_FUTURE_AS_EVENT
      p90: none
      range: none
    unit: none
~~~

## FORBIDDEN

[FORBIDDEN][CITYA-900] Treating this registry as scene defaults without explicit applicability logic in INTERFACE/RULE docs.
[FORBIDDEN][CITYA-910] Introducing new city_key values.
[FORBIDDEN][CITYA-920] Consuming NON-NORMATIVE as semantics.

## NON-NORMATIVE

~~~text
This file is STATE-only: token pools, no rules.
Application rules live in CANON-CITY-RU-2215-0007 (INTERFACE) and related RULE docs.
~~~

~~~
</file>

<file path="canon/CANON-CITY-RU-2215-0007.md">
~~~markdown
---
id: CANON-CITY-RU-2215-0007
title: >
  RU 2215 — City Anchor Gateway: Chelny / Chelny–Yelabuga / Moscow (INTERFACE)
class: canon
status: draft
version: 1.0.1
prefix: CTY
doc_language: ru-RU
prose_language: ru-RU
inputs:
  - CANON-CITY-REGISTRY-RU-2215-0001
  - CANON-CITY-RULES-RU-2215-0001
depends_on:
  - SPEC-DOC-STYLE-2215-0001
  - SPEC-PRIORITY-RESOLUTION-2215-0001
scope: >
  INTERFACE-шлюз для city anchors: владение доменом якорей, перечень
  потребляемых источников (STATE registry + RULE invariants), и запреты.
  Не содержит token pools и не содержит правил (кроме ownership/consumes/forbids).
---

## LLM-INTENT

ROLE_TYPE: INTERFACE
SCOPE: own and expose city anchors as an interface (single entrypoint) while delegating data/rules to registry and rule docs
INPUTS: [CANON-CITY-REGISTRY-RU-2215-0001, CANON-CITY-RULES-RU-2215-0001]
OUTPUTS: [owns, consumes, forbids]
FORBIDDEN: [token_values, rule_definition, state_definition, implicit_application]

## DEFINITIONS

[FACT][CTY-010] `CITY_ANCHORS_RU` = ownership domain for city anchor tokens and their scene-level usage interface.
[FACT][CTY-011] `CITY_CONTRAST_RU` = ownership domain for contrast pairing semantics (Chelny vs Moscow).
[FACT][CTY-012] `anchor_registry_doc` = CANON-CITY-REGISTRY-RU-2215-0001.
[FACT][CTY-013] `anchor_invariants_doc` = CANON-CITY-RULES-RU-2215-0001.

## INVARIANTS

[DECISION][CTY-020] This document MUST remain thin INTERFACE-only: ownership/consumes/forbids; ELSE FAIL.
[DECISION][CTY-021] Token pools MUST be sourced only from anchor_registry_doc; ELSE FAIL.
[DECISION][CTY-022] City invariants MUST be sourced only from anchor_invariants_doc; ELSE FAIL.
[FORBIDDEN][CTY-023] Embedding city token pools or city morphology prose here; ELSE FAIL.

## CONTENT

### 1. Ownership and consumption

[DECISION][CTY-100] Interface owns CITY_ANCHORS_RU and CITY_CONTRAST_RU.
[DECISION][CTY-110] Interface consumes anchor_registry_doc and anchor_invariants_doc.

### 2. Applicability note (delegated)

[DECISION][CTY-200] Applicability mechanics (how scenes explicitly reference this gateway) MUST be defined by the scene contract; ELSE FAIL.
[DECISION][CTY-210] No implicit application is allowed unless a scene contract declares an explicit reference mechanism; ELSE FAIL.

## USAGE / RESOLUTION

[DECISION][CTY-300] Consumers MUST treat only OUTPUT CONTRACT exports as consumable semantics; ELSE FAIL.
[DECISION][CTY-310] Conflict resolution MUST follow SPEC-PRIORITY-RESOLUTION-2215-0001; ELSE FAIL.

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-CITY-RU-2215-0007
role_type: INTERFACE
export:
  - owns: ["CITY_ANCHORS_RU","CITY_CONTRAST_RU"]
  - consumes: ["CANON-CITY-REGISTRY-RU-2215-0001","CANON-CITY-RULES-RU-2215-0001"]
  - forbids:
      - "implicit_application_without_scene_contract_reference"
      - "token_pool_values_inside_interface_doc"
      - "rule_or_state_definition_inside_interface_doc"
~~~

## FORBIDDEN

[FORBIDDEN][CTY-900] Treating this INTERFACE as a data source for token pools (use CANON-CITY-REGISTRY-RU-2215-0001).
[FORBIDDEN][CTY-910] Treating this INTERFACE as a rule source for invariants (use CANON-CITY-RULES-RU-2215-0001).
[FORBIDDEN][CTY-920] Implicit application to scenes without explicit scene-contract reference mechanism.

## NON-NORMATIVE

~~~text
Single entrypoint for scenes: reference CANON-CITY-RU-2215-0007.
Data: CANON-CITY-REGISTRY-RU-2215-0001 (STATE).
Invariants: CANON-CITY-RULES-RU-2215-0001 (RULE).
~~~

~~~
</file>

<file path="canon/CANON-CITY-RULES-RU-2215-0001.md">
~~~markdown
---
id: CANON-CITY-RULES-RU-2215-0001
title: >
  RU 2215 — Набережные Челны: базовые законы города
class: canon
status: draft
version: 1.0.2
prefix: CITYR
doc_language: ru-RU
prose_language: ru-RU
inputs:
  - CANON-CITY-BOUNDARY-RU-2215-0008
  - CANON-CITY-REGISTRY-RU-2215-0001
depends_on:
  - SPEC-DOC-STYLE-2215-0001
scope: >
  Жёсткие инварианты города Набережные Челны в 2215 году: география,
  архитектура, материалы, масштаб и бытовые нормы. Документ задаёт
  непреодолимые ограничения для сцен и описаний. Не является источником
  “якорей” и не подменяет CANON-CITY-RU-2215-0007 (INTERFACE-шлюз).
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: non-overridable urban invariants for Chelny-2215 (geo/architecture/materials/scale/everyday norms + narrative constraints)
INPUTS: [CANON-CITY-BOUNDARY-RU-2215-0008, CANON-CITY-REGISTRY-RU-2215-0001]
OUTPUTS: [urban_constraints, forbidden_patterns]
FORBIDDEN: [introduce_metrics, redefine_boundaries, narrative_prose, implicit_anchors]

## DEFINITIONS

[FACT][CITYR-010] `city_chelny_2215` = функциональная городская территория Челнов-2215 внутри канонического периметра (`CANON-CITY-BOUNDARY-RU-2215-0008`).
[FACT][CITYR-011] `kama_west_bank` = природная/охранная зона западного берега Камы вне городской урбанизации.
[FACT][CITYR-012] `excess_scale` = размер элементов среды, превышающий минимально функциональный (масштаб как норма, не как “флекс”).
[FACT][CITYR-013] `direction` ∈ {EAST, SOUTH, SOUTH_EAST}.
[FACT][CITYR-014] `location_zone` ∈ {KAMA_WEST_BANK, OTHER}.
[FACT][CITYR-015] `form_kind` ∈ {ORGANIC, BIOMORPHIC, OTHER}.
[FACT][CITYR-016] `material_kind` ∈ {CONCRETE, STONE, MATTE_METAL, GLASS}.
[FACT][CITYR-017] `subject_type` ∈ {CHILD, OTHER}.
[FACT][CITYR-018] `anchor_tokens` = token pools exported by `CANON-CITY-REGISTRY-RU-2215-0001`.

## INVARIANTS

[RULE][CITYR-020] PASS IFF (location.is_west_of_kama != true) OR (urbanization_allowed == false); ELSE FAIL.
[RULE][CITYR-021] PASS IFF (location.is_protected_forest_zone != true) OR (construction_allowed == false); ELSE FAIL.
[RULE][CITYR-022] PASS IFF (urban_fabric == axis_aligned_along_infrastructure) AND (urban_fabric != radial_by_default); ELSE FAIL.
[RULE][CITYR-023] PASS IFF excess_scale_applies_to_key_elements == true; ELSE FAIL.
[RULE][CITYR-024] PASS IFF tech_signaling_as_goal != true; ELSE FAIL.

## CONTENT

### География

[RULE][CITYR-030] PASS IFF (location.zone != KAMA_WEST_BANK) OR ((access_allowed == gated_by_boundary_rules) AND (urbanization_allowed == false)); ELSE FAIL.
[RULE][CITYR-031] PASS IFF primary_growth_vector ∈ {EAST, SOUTH, SOUTH_EAST}; ELSE FAIL.
[RULE][CITYR-032] PASS IFF forest_massifs_are_hard_urban_limit == true; ELSE FAIL.
[FORBIDDEN][CITYR-033] Any new boundary, corridor, or “expanded perimeter” not defined in `CANON-CITY-BOUNDARY-RU-2215-0008`.

### Архитектура

[RULE][CITYR-040] PASS IFF architecture_principle == EXCESS_SCALE_OVER_FUNCTION; ELSE FAIL.
[RULE][CITYR-041] PASS IFF (form_kind ∉ {ORGANIC, BIOMORPHIC}) OR (dominance_allowed == false); ELSE FAIL.
[RULE][CITYR-042] PASS IFF iconic_symbol_buildings_used_as_city_dominants != true; ELSE FAIL.

### Материалы

[RULE][CITYR-050] PASS IFF allowed_base_materials == {CONCRETE, STONE, MATTE_METAL}; ELSE FAIL.
[RULE][CITYR-051] PASS IFF (material_kind != GLASS) OR (glass_usage_is_limited == true AND glass_is_non_dominant == true); ELSE FAIL.
[RULE][CITYR-052] PASS IFF load_bearing_and_engineering_elements_are_visually_readable == true; ELSE FAIL.

### Масштаб и тело

[RULE][CITYR-060] PASS IFF sidewalks_sized_for_flows == true AND sidewalks_sized_for_crowds_by_default != true; ELSE FAIL.
[RULE][CITYR-061] PASS IFF underpasses_are_deep == true AND underpasses_are_wide == true AND underpasses_perceived_as_engineering_spaces == true; ELSE FAIL.
[RULE][CITYR-062] PASS IFF entry_groups_are_portal_like == true AND entry_groups_door_like_by_default != true; ELSE FAIL.
[RULE][CITYR-063] PASS IFF public_space_ceiling_heights_exceed_21c_psychological_norm == true; ELSE FAIL.

### Бытовые нормы

[RULE][CITYR-070] PASS IFF observability_and_logging_treated_as_normal_state == true; ELSE FAIL.
[RULE][CITYR-071] PASS IFF anonymity_is_privilege == true AND anonymity_is_baseline_right != true; ELSE FAIL.
[RULE][CITYR-072] PASS IFF (subject_type != CHILD) OR (child_presence_in_city_is_normalized == true); ELSE FAIL.
[RULE][CITYR-073] PASS IFF deviations_from_regimes_auto_logged == true AND deviations_dramatic_by_default != true; ELSE FAIL.
[RULE][CITYR-074] PASS IFF city_comfortable_for_locals == true AND city_frictional_for_visitors == true; ELSE FAIL.

### Нарративные ограничения (как показывать инварианты)

[RULE][CITYR-080] PASS IFF geography_conveyed_via_movement_and_routes == true AND maps_as_primary != true; ELSE FAIL.
[RULE][CITYR-081] PASS IFF architecture_described_via_bodily_scale == true AND style_labels_as_primary != true; ELSE FAIL.
[RULE][CITYR-082] PASS IFF direct_system_explanations_present != true OR behaviour_and_constraints_imply_function == false; ELSE FAIL.
[RULE][CITYR-083] PASS IFF (city_assists_character == true) OR (city_obstructs_character == true); ELSE FAIL.
[FORBIDDEN][CITYR-084] Using anchor_tokens as defaults without explicit scene reference mechanism.

## USAGE / RESOLUTION

[RULE][CITYR-090] These rules have CANON precedence and MUST constrain scene-level interpretation; ELSE FAIL.
[RULE][CITYR-091] Any scene that violates any CITYR rule MUST be treated as invalid input for generation; ELSE FAIL.
[RULE][CITYR-092] Boundary claims MUST be sourced only from `CANON-CITY-BOUNDARY-RU-2215-0008`; ELSE FAIL.

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-CITY-RULES-RU-2215-0001
role_type: RULE
export:
  - rule_id: CITYR-020
    intent: "forbid west-of-Kama urbanization"
    inputs: [CANON-CITY-BOUNDARY-RU-2215-0008]
    outputs: [urbanization_allowed=false]
  - rule_id: CITYR-023
    intent: "enforce excess_scale as invariant for key urban elements"
    inputs: [urban_element]
    outputs: [scale_constraint]
  - rule_id: CITYR-050
    intent: "restrict base material palette"
    inputs: [material_kind]
    outputs: [material_allowed_set]
  - rule_id: CITYR-080
    intent: "convey geography via movement/routes, not maps"
    inputs: [scene_text]
    outputs: [narrative_constraint]
~~~

## FORBIDDEN

[FORBIDDEN][CITYR-900] Введение новых географических границ или “расширений периметра” вне `CANON-CITY-BOUNDARY-RU-2215-0008`.
[FORBIDDEN][CITYR-901] Ослабление инвариантов масштаба ради сцены.
[FORBIDDEN][CITYR-902] Использование архитектурных клише футуризма (showoff/tech-tourism) как доминантного языка города.
[FORBIDDEN][CITYR-903] Подмена правил примерами или атмосферным текстом в нормативных секциях.
[FORBIDDEN][CITYR-904] Использование city anchor tokens как “дефолта” сцены без явной ссылки.

## NON-NORMATIVE

~~~text
City rules are invariants (always applicable within boundary).
City anchors are optional and live as tokens in CANON-CITY-REGISTRY-RU-2215-0001.
Gateway entrypoint for scenes is CANON-CITY-RU-2215-0007 (INTERFACE).
~~~

~~~
</file>

<file path="canon/CANON-CONFLICT-GLOBAL-2215-0001.md">
~~~markdown
---
id: CANON-CONFLICT-GLOBAL-2215-0001
title: >
  Canon Conflict — Optimization Loop, Extraterritories, Supply Chains, Legal Void (2215)
class: canon
status: fixed
version: 2.0.0
doc_language: en
prose_language: ru-RU
inputs: []
depends_on:
  - SPEC-DOC-STYLE-2215-0001
  - CANON-CORE-GLOBAL-2215-0001
  - CANON-SYSTEMS-GLOBAL-2215-0001
  - CANON-ORDERS-GLOBAL-2215-0003
scope: >
  Формализация центрального конфликта романа как системной функции:
  тип антагониста, измеримые ставки, рычаг протагониста, модель
  сопротивления системы и структура эскалации через 3 кейса / 4 слоя.
  Включает типологию инцидентов (в т.ч. Priority Paradox).
  Синхронизирован с PLAN-STORY-2215-0001 (3 кейса, 5 актов, 35 глав).
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: conflict definition + escalation grammar (not scenes)
INPUTS: [CANON-CORE-GLOBAL-2215-0001]
OUTPUTS: [conflict_layers, escalation_structure, case_layer_map]
FORBIDDEN: [world_parameter_binding, baseline_defaults, causal_chain_markup_in_canon, technobabble, villain_personification]

## DEFINITIONS

[FACT][CNF-DEF-010] Antagonist = System Function (Optimization), not a person.
[FACT][CNF-DEF-011] Priority Paradox (The Glitch) = Situation where two valid algorithms contradict, requiring human override.
[FACT][CNF-DEF-012] `system_agent` = человек, действующий как функция оптимизационного контура; не злодей, не заговорщик.
[FACT][CNF-DEF-013] `conflict_layer` ∈ {L1_algorithmic_harm, L2_extraterritory, L3_supply_chain, L4_legal_void}.
[FACT][CNF-DEF-014] `case` = процедурный кейс ФССУ, раскрывающий один или несколько conflict_layer.
[FACT][CNF-DEF-015] `case_layer_map` = маппинг case_id → список conflict_layer, раскрываемых кейсом.

## INVARIANTS

[DECISION][CNF-INV-000] Антагонист по умолчанию = системная функция, а не «харизматичный злодей».
[DECISION][CNF-INV-001] Конфликт процедурно-измерим: человеческая цена и инфраструктурный ущерб проявляются через артефакты.
[DECISION][CNF-INV-002] Экстерритория создаёт фильтры и задержки, но не «вне закона».
[DECISION][CNF-INV-003] Манипуляция цепочками поставок и режимами доступа — основной канал давления.
[DECISION][CNF-INV-004] «Юридическая пустота» допустима: вред реален, но виновный формально размывается.
[DECISION][CNF-INV-005] Никакой апокалиптики: кризисы локально катастрофичны, но управляемы при цене ресурсов.
[DECISION][CNF-INV-006] Победа протагониста = доказательство + коррекция режима, а не силовое превосходство.
[DECISION][CNF-INV-007] Люди-агенты системы (Илья, оператор, подрядчики) — НЕ антагонисты. Они — функции контура, действующие рационально в рамках своих KPI и контрактов.

## CONTENT

### 1. Antagonist Model (System Function)

[STATE][CNF-010] antagonist_mode = institutional_algorithmic_optimization_loop.
[STATE][CNF-011] antagonist_components = [kpi_metrics, operator_decisioning, extraterritorial_regimes, liability_isolation].
[RULE][CNF-012] Individuals ARE local agents, NOT root causes.
[RULE][CNF-012a] `system_agent` characters MUST be depicted with rational motives and sincere beliefs (money, fear, status, ideology, genuine conviction in efficiency). Caricature monologues FORBIDDEN.

### 2. Scale and Stakes (Measurable)

[STATE][CNF-020] scale_progression = [regional_start, federal_expansion, cross_border_implications].
[NOTE][CNF-021] Cross-border manifests via standards/trade/insurance (no supra-state force).

[STATE][CNF-030] stakes_are_procedural_and_measurable = true.
[STATE][CNF-031] stake_dimensions = [human_cost, infra_resilience, state_legitimacy, license_loss, insurance_impact].
[CONSTRAINT][CNF-032] no_world_collapse = true.

### 3. Four Conflict Layers (all active)

#### Layer 1 — Algorithmic optimization produces diffuse harm (L1)
[STATE][CNF-100] layer_1 = L1_algorithmic_harm.
[RULE][CNF-101] harm_can_be_legal_and_technical = true.
[RULE][CNF-102] typical_effects = [service_degradation, rerouting, priority_drops].
[RULE][CNF-103] Specific Case: Priority Paradox (The Glitch).
[RULE][CNF-104] Paradox Mechanism: Valid Algorithm A (Sanitation) vs Valid Algorithm B (Preservation) = Destructive Loop.

#### Layer 2 — Extraterritory as deviation container (L2)
[STATE][CNF-110] layer_2 = L2_extraterritory.
[RULE][CNF-111] deviations_concentrate_in_special_modes = true.
[RULE][CNF-112] FSSU_access_is_harder_by_default = true.

#### Layer 3 — Supply chains as pressure weapon (L3)
[STATE][CNF-120] layer_3 = L3_supply_chain.
[RULE][CNF-121] manipulation_is_formally_market_logistics = true.
[STATE][CNF-122] pressure_resources = [energy_storage, medical_reagents, grid_components, rare_materials].

#### Layer 4 — Legal void of responsibility (L4)
[STATE][CNF-130] layer_4 = L4_legal_void.
[STATE][CNF-131] liability_smearing = [ai_recommendation, human_signatory, contractor, subcontractor, shell_entities].
[RULE][CNF-132] real_damage_can_exist_without_single_punishable_cause = true.

### 4. Protagonist and Leverage (No superheroism)

[STATE][CNF-200] protagonist_org = FSSU.
[STATE][CNF-201] team_profile = {size: 7-9, narrative_ratio: 60_procedure_40_operation, includes_operator_liaison: true}.

[STATE][CNF-210] leverage = protocol_operator.
[STATE][CNF-211] leverage_capabilities = [bind_telemetry_to_event, surface_exception_loops, forced_access_seizure, convert_tech_to_admissible].
[CONSTRAINT][CNF-212] victory_is_evidence_and_regime_change = true.
[CONSTRAINT][CNF-213] force_is_entry_tool_not_solution = true.

### 5. Human System Agents (Local agents, not antagonists)

[STATE][CNF-300] human_agent_types = [metric_gamers, corporate_security, dirty_operators, rare_saboteurs, efficiency_directors].
[RULE][CNF-301] motives_are_rational = [money, fear, status, ideology, genuine_conviction].
[FORBIDDEN][CNF-302] caricature_monologues = true.
[RULE][CNF-303] system_agents MUST be shown as part of the optimization contour, not as independent villains.

### 6. System Resistance Model (Why the system fights back)

[STATE][CNF-400] resistance_is_risk_minimization_not_evil = true.
[STATE][CNF-401] resistance_layers = [inertia_procedural_delays, political_self_preservation, corporate_defense_lawyers, human_fear].

### 7. Escalation Structure (3 cases, 4 layers)

[RULE][CNF-500] case_count = 3.
[STATE][CNF-501] escalation_goal = reveal_all_4_layers_and_converge.

[STATE][CNF-510] case_layer_map:
  case_1:
    title: "Энергия не сходится"
    acts: [I]
    location: "Chelny"
    layers_revealed: [L1_algorithmic_harm, L3_supply_chain_surface]
    surface_form: "anomaly_stats_plus_victims_plus_external_trace"
    turning_point: "anomaly is repeatable and systemic; trail leads beyond city"

  case_2:
    title: "Пропавшие партии сенсоров"
    acts: [II]
    location: "Chelny_and_region"
    layers_revealed: [L3_supply_chain_deep, L2_extraterritory_gateway]
    surface_form: "resource_reroute_deficit_pressure_and_access_denial"
    turning_point: "trace flows to extraterritory; federal jurisdiction required"

  case_3:
    title: "Зона ускоренного режима"
    acts: [III, IV, V]
    location: "extraterritory_and_moscow_and_chelny"
    layers_revealed: [L2_extraterritory_deep, L4_legal_void, convergence_all_layers]
    surface_form: "procedural_entry_kpi_collision_legal_void_regime_correction"
    turning_point: "liability diffused; regime corrected via regulatory lever; partial win"

[CONSTRAINT][CNF-511] finale_must_be_procedurally_realistic = true.
[CONSTRAINT][CNF-512] change_is_partial_with_cost = true.

## USAGE / RESOLUTION

[DECISION][CNF-USE-010] Act I MUST use Layer 1 (Priority Paradox) as the inciting incident.
[DECISION][CNF-USE-011] The escalation sequence guides the transition from "Bug Hunt" to "System Audit".
[DECISION][CNF-USE-012] case_layer_map MUST be consistent with PLAN-STORY-2215-0001 act_case_structure; ELSE FAIL.

## OUTPUT CONTRACT

```yaml
doc_id: CANON-CONFLICT-GLOBAL-2215-0001
role_type: RULE
export:
  - rule_id: CNF-104
    intent: define priority paradox mechanism
    inputs: [algo_A, algo_B]
    outputs: [destructive_loop]
  - rule_id: CNF-510
    intent: define escalation path (3 cases, 4 layers)
    outputs: [case_layer_map]
  - rule_id: CNF-012a
    intent: system agents are not villains
    outputs: [agent_depiction_rule]
```

## FORBIDDEN

[FORBIDDEN][CNF-900] Personifying the antagonist as an "Evil AI" or "Evil CEO".
[FORBIDDEN][CNF-901] Solving conflicts by simply "shooting the bad guy".
[FORBIDDEN][CNF-902] Apocalyptic scales (saving the whole world).
[FORBIDDEN][CNF-903] Embedding causal chains in this CANON.
[FORBIDDEN][CNF-904] Labeling system_agents as "antagonists" or "villains" in metadata/tags.

## NON-NORMATIVE

```text
Previous version had 5 cases in canonical_case_sequence.
v2.0.0 consolidates to 3 cases matching PLAN-STORY structure:
  - Cases 1-2 each occupy one act
  - Case 3 spans three acts as the convergence case
The 4 conflict layers are preserved and mapped explicitly to cases.
```

~~~
</file>

<file path="canon/CANON-CORE-GLOBAL-2215-0001.md">
~~~markdown
---
id: CANON-CORE-GLOBAL-2215-0001
title: >
  Canon 2215 Core Bindings — Scenario A (World Background Lock)
class: canon
status: fixed
version: 1.2.0
inputs: []
depends_on:
  - SPEC-DOC-STYLE-2215-0001
  - SSOT-CONSISTENCY-A-2215-0009
  - SSOT-SCENARIO-A-2215-0001
  - SSOT-ENERGY-A-2215-0004
  - SSOT-ECONOMY-A-2215-0003
  - SSOT-AUTOMATION-A-2215-0004
  - SSOT-DEMOGRAPHY-A-2215-0002
  - SSOT-CLIMATE-A-2215-0004
  - SSOT-GOVERNANCE-SECURITY-A-2215-0005
  - SSOT-URBANISM-A-2215-0007
  - SSOT-LIFE-A-2215-0007
  - SSOT-SPACE-INDUSTRY-A-2215-0006
scope: >
  Единственная точка выбора значений “фона романа” для мира 2215 (Scenario A).
  Закрывает DUAL_ALLOWED/UNKNOWN из SSOT-CONSISTENCY и фиксирует core-набор
  как канонический дефолт для baseline/canon/plan/scene.
  Документ НЕ объясняет причинность и НЕ описывает мир сверх привязок.
---

## LLM-INTENT

ROLE_TYPE: BIND
SCOPE: bind SSOT values into single canonical background defaults for downstream
INPUTS:
  - SSOT-CONSISTENCY-A-2215-0009
  - SSOT-*
OUTPUTS:
  - bindings
  - override_required_registry
  - location_locks
FORBIDDEN:
  - causal_logic
  - worldbuilding_prose
  - invent_metrics
  - implicit_selection
  - range_as_background

---

## DEFINITIONS

[DECISION][CORE-DEF-001] `selected_value` MUST be one of: `core | p90 | override`.
[DECISION][CORE-DEF-002] `scope` MUST be one of: `canon | override`.
[DECISION][CORE-DEF-003] This document binds defaults with `scope: canon`.
[DECISION][CORE-DEF-004] Any use of `p90` or `range` in narrative background REQUIRES `class: override`.
[DECISION][CORE-DEF-005] `selected_value: override` (scope: canon) means:
downstream default is FORBIDDEN and requires a dedicated `class: override` doc
to specify localized value and cost.

---

## INVARIANTS

[DECISION][CORE-INV-001] Downstream default MUST use only bindings from this document (scope: canon).
[DECISION][CORE-INV-002] Default bindings MUST select `selected_value: core` for all bound metrics with defined SSOT `core`.
[DECISION][CORE-INV-003] Any upper-tail (`selected_value: p90`) is allowed ONLY in `scope: override` documents.
[DECISION][CORE-INV-004] Metrics with missing/undefined SSOT `core` MUST be closed as `selected_value: override` (scope: canon).
[DECISION][CORE-INV-007] Any metric listed in `override_required_registry`
MUST NOT be used by baseline/canon/plan/scene without an explicit `class: override` document.
[FORBIDDEN][CORE-INV-005] Binding a `range` as narrative default (range_as_background).
[FORBIDDEN][CORE-INV-006] Implicit selection from SSOT (implicit_selection).

---

## CONTENT

(⚠️ CONTENT section unchanged — BIND blocks preserved as-is)

---

## LOCATION LOCKS

[DECISION][CORE-LOC-001] location = RU-16/CHELNY.
[DECISION][CORE-LOC-002] upper_tail_background_forbidden = true.

---

## USAGE / RESOLUTION

[DECISION][CORE-USE-001] Downstream (baseline/canon/plan/scene) MUST treat this doc as the only default binder.
[DECISION][CORE-USE-002] Any use of p90/upper-tail MUST be done ONLY via `class: override`.
[DECISION][CORE-USE-003] Any use of SSOT `range` in narrative MUST be done ONLY via `class: override` with explicit localization and cost.
[DECISION][CORE-USE-006] Any metric closed as `selected_value: override`
MUST be blocked as background default and validated against `override_required_registry`.
[FORBIDDEN][CORE-USE-004] Using SSOT directly as background without an explicit binding here.
[FORBIDDEN][CORE-USE-005] Implicit “fallback to SSOT range” when value is not bound.

---

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-CORE-GLOBAL-2215-0001
role_type: BIND
scenario: A
year: 2215

export:
  bindings:
    - metric: population_billion
      selected_value: core
      scope: canon
      justification: CORE-INV-001
    - metric: life_expectancy_years
      selected_value: core
      scope: canon
      justification: CORE-INV-001
    # (bindings list unchanged, сокращено для читаемости)

  override_required_registry:
    - metric: total_fertility_rate
      reason: missing_ssot_core
      requires: class_override
    - metric: services_share_gdp_percent
      reason: missing_ssot_core
      requires: class_override
    - metric: trade_to_gdp_percent
      reason: missing_ssot_core
      requires: class_override
    - metric: robots_per_human
      reason: missing_ssot_core
      requires: class_override

  location_locks:
    - location: RU-16/CHELNY
      upper_tail_background_forbidden: true
~~~

---

## FORBIDDEN

[FORBIDDEN][CORE-FBD-001] Using p90/upper-tail as default background without `class: override`.
[FORBIDDEN][CORE-FBD-002] Using SSOT `range` as default background without `class: override`.
[FORBIDDEN][CORE-FBD-003] Implicit selection of SSOT values not explicitly bound here.
[FORBIDDEN][CORE-FBD-004] Introducing new metrics not declared in SSOT.
[FORBIDDEN][CORE-FBD-006] Using any `selected_value: override` metric as background default without an explicit override doc.

---

## NON-NORMATIVE

(Empty by design)

~~~
</file>

<file path="canon/CANON-FSSU-CITYVIEW-RU16-2215-0001.md">
~~~markdown
---
id: CANON-FSSU-CITYVIEW-RU16-2215-0001
title: >
  ФССУ — RU-16 — ГОРОД-1 / ГОРОД-2 — представления System, границы автономии и эскалация (2215)
class: canon
status: draft
version: 1.0.0
prefix: OCV
doc_language: ru-RU
prose_language: ru-RU
inputs: []
depends_on:
  - CANON-FSSU-GLOBAL-2215-0005
  - CANON-FSSU-REGIONAL-RU16-2215-0001
  - CANON-FSSU-DEPT-STRUCT-RU16-2215-0001
  - CANON-SYSTEM-ONTOLOGY-2215-0001
  - REG-FSSU-AUTO-LOWIMPACT-2215-0001
  - SPEC-DOC-ID-2215-0001
  - SPEC-DOC-STYLE-2215-0001
  - SPEC-PRIORITY-RESOLUTION-2215-0001
scope: >
  RULE-канон региональных представлений ГОРОД-1 и ГОРОД-2 в RU-16/CHELNY.
  Фиксирует: что это за представления (не субъект и не “разум”), назначение, границы автономии,
  запрет юридически значимых решений без человека, условия обязательной эскалации и окно критичности.
  Не описывает детали реализации моделей и не задаёт офис/локацию.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: define CITYVIEW_1 and CITYVIEW_2 as regional representations with autonomy boundaries and mandatory escalation rules
INPUTS: []
OUTPUTS: [cityview_definitions, autonomy_limits, escalation_rules, responsibility_constraints]
FORBIDDEN: [implementation_details, model_architecture, narrative_prose, scene_text]

## DEFINITIONS

[FACT][OCV-010] `city_view_1` = ГОРОД-1: аналитическое представление потока сигналов/инцидентов, предназначенное для корреляции и генерации гипотез.
[FACT][OCV-020] `city_view_2` = ГОРОД-2: исполнительное представление low-impact действий и маршрутизации, ограниченное whitelist.
[FACT][OCV-030] `managed_system` = System, наблюдаемая/затрагиваемая ФССУ (см. SONT-010).
[FACT][OCV-040] `FSSU_ai_stack` = ИИ-контур ФССУ, независимый от `managed_system` (см. CANON-FSSU-GLOBAL-2215-0005).
[FACT][OCV-050] `critical_window` = ограниченное время, в течение которого промедление приводит к необратимому росту Impact или потере артефактов.
[FACT][OCV-060] `mandatory_escalation` = обязательная передача в human gate/кейс при выполнении условий эскалации.

## INVARIANTS

[FORBIDDEN][OCV-100] Трактовка ГОРОД-1/ГОРОД-2 как субъекта, воли, намеренного врага или “персонифицированного антагониста”.

[DECISION][OCV-110] ГОРОД-1/ГОРОД-2 MUST быть частью `FSSU_ai_stack` и MUST NOT входить в контуры `managed_system`.

[DECISION][OCV-120] ГОРОД-1/ГОРОД-2 MUST быть независимы от управляемой System по доступам и контурам принятия решений.

[FORBIDDEN][OCV-130] ГОРОД-1/ГОРОД-2 принимают юридически значимые решения без визы человека.

[DECISION][OCV-140] Любое действие ГОРОД-2 MUST быть ограничено whitelist REG-FSSU-AUTO-LOWIMPACT-2215-0001.

[DECISION][OCV-150] При наступлении `critical_window` MUST выполняться `mandatory_escalation`.

## CONTENT

### 1. Purpose Split

[DECISION][OCV-200] `city_view_1.purpose` MUST include {correlation, hypothesis_generation, impact_estimation, route_recommendation}.
[DECISION][OCV-210] `city_view_2.purpose` MUST include {lowimpact_execution, routing_outcomes_emission, escalation_triggering}.

[FORBIDDEN][OCV-220] ГОРОД-2 выполняет high-impact действия или меняет режим Systemic_Asset без активного кейса.

### 2. Local Adaptation

[DECISION][OCV-300] `FSSU_ai_stack.local_adaptation` MAY include "ru16_local_finetune_on_observability_patterns".
[FORBIDDEN][OCV-310] Локальная адаптация MUST NOT изменять значения определений SONT-010..060.

### 3. Autonomy Boundaries

[RULE][OCV-400] IF `city_view_1.outputs` produced THEN `human_gate.review_required` MUST be true; ELSE FAIL.
[RULE][OCV-410] IF `human_gate.review_required` = true THEN `human_gate.visa` MUST be true; ELSE FAIL.

[RULE][OCV-420] IF `city_view_2.executes_action` = true THEN `action.type` MUST be in whitelist(REG-FSSU-AUTO-LOWIMPACT-2215-0001); ELSE FAIL.
[RULE][OCV-430] IF `city_view_2.executes_action` = true THEN `execution.logging_required` MUST be true; ELSE FAIL.

### 4. Mandatory Escalation

[DECISION][OCV-500] `mandatory_escalation.conditions.min_set` MUST include {impact_threshold_reached, critical_window_detected, channel_unbounded, evidence_purge_risk, sovereignty_indicator}.

[RULE][OCV-510] IF `impact_threshold_reached` = true THEN `mandatory_escalation` MUST be true; ELSE FAIL.
[RULE][OCV-520] IF `critical_window_detected` = true THEN `mandatory_escalation` MUST be true; ELSE FAIL.
[RULE][OCV-530] IF `evidence_purge_risk` = true THEN `mandatory_escalation` MUST be true; ELSE FAIL.
[RULE][OCV-540] IF `sovereignty_indicator` = true THEN `mandatory_escalation` MUST be true; ELSE FAIL.

[RULE][OCV-550] IF `mandatory_escalation` = true THEN `routing_outcome` MUST be CASE_ESCALATION; ELSE FAIL.
[RULE][OCV-560] IF `routing_outcome` = CASE_ESCALATION THEN `activation_flow.required` MUST be true; ELSE FAIL.

### 5. Naming and Representation Constraint

[DECISION][OCV-600] “ГОРОД-1/ГОРОД-2” являются рабочими ярлыками представлений и MUST NOT трактоваться как имена субъектов.
[FORBIDDEN][OCV-610] Представление “ГОРОД-1/2” как автономной власти, принимающей решения “вместо людей”.

## USAGE / RESOLUTION

[DECISION][OCV-900] Любая сцена RU-16, использующая ГОРОД-1/ГОРОД-2, MUST следовать OCV-100..OCV-610; ELSE FAIL.
[DECISION][OCV-910] Conflict resolution MUST follow SPEC-PRIORITY-RESOLUTION-2215-0001; ELSE FAIL.

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-FSSU-CITYVIEW-RU16-2215-0001
role_type: RULE
export:
  - rule_id: OCV-110
    intent: enforce independence of FSSU AI stack from managed system
    inputs: [FSSU_ai_stack, managed_system]
    outputs: [independence_ok]
  - rule_id: OCV-420
    intent: restrict CITYVIEW-2 execution to low-impact whitelist
    inputs: [city_view_2.executes_action, action.type]
    outputs: [action.allowed]
  - rule_id: OCV-520
    intent: mandate escalation on critical window
    inputs: [critical_window_detected]
    outputs: [mandatory_escalation]
  - rule_id: OCV-550
    intent: enforce routing outcome on mandatory escalation
    inputs: [mandatory_escalation]
    outputs: [routing_outcome]
  - rule_id: OCV-560
    intent: require activation flow on escalation
    inputs: [routing_outcome]
    outputs: [activation_flow.required]
~~~

## FORBIDDEN

[FORBIDDEN][OCV-980] Описание внутренних архитектур моделей/весов/датасетов/алгоритмов; ELSE FAIL.
[FORBIDDEN][OCV-981] Принятие юридически значимых решений ГОРОД-1/ГОРОД-2 без визы человека; ELSE FAIL.
[FORBIDDEN][OCV-982] Исполнение ГОРОД-2 действий вне whitelist; ELSE FAIL.
[FORBIDDEN][OCV-983] Персонификация ГОРОД-1/ГОРОД-2 как “антагониста”; ELSE FAIL.

## NON-NORMATIVE

~~~text

ГОРОД-1/ГОРОД-2 фиксируются как региональные представления контуров ФССУ:
аналитика → human gate → low-impact исполнение/маршрутизация → эскалация.
Требования к недопущению юридически значимых решений ИИ без человека согласованы с CANON-FSSU-GLOBAL-2215-0005.
~~~

~~~
</file>

<file path="canon/CANON-FSSU-DEPT-STRUCT-RU16-2215-0001.md">
~~~markdown
---
id: CANON-FSSU-DEPT-STRUCT-RU16-2215-0001
title: >
  ФССУ — Регион RU-16 — Структура отдела и конвейер решений (ГОРОД-1/GO-NOGO/ГОРОД-2) (2215)
class: canon
status: draft
version: 1.0.0
prefix: ODS
doc_language: ru-RU
prose_language: ru-RU
inputs: []
depends_on:
  - CANON-FSSU-GLOBAL-2215-0005
  - CANON-FSSU-REGIONAL-RU16-2215-0001
  - CANON-SYSTEM-ONTOLOGY-2215-0001
  - REG-FSSU-AUTO-LOWIMPACT-2215-0001
  - SPEC-DOC-ID-2215-0001
  - SPEC-DOC-STYLE-2215-0001
  - SPEC-PRIORITY-RESOLUTION-2215-0001
scope: >
  RULE-канон операционной структуры регионального отдела ФССУ (RU-16/CHELNY).
  Определяет конвейер решений: ГОРОД-1 → human_gate → ГОРОД-2 → outcome (auto_resolve/escalate/reject)
  и точку передачи кейса флагманской команде.
  Не описывает архитектуру офиса, личные роли персонажей и не задаёт детализацию алгоритмов ИИ.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: define RU-16 FSSU department decision conveyor stages, routing outcomes and handoff to flagship team
INPUTS: []
OUTPUTS: [conveyor_stages, routing_outcomes, handoff_rules, intake_sources]
FORBIDDEN: [office_architecture_details, narrative_prose, scene_text, undefined_terms]

## DEFINITIONS

[FACT][ODS-010] `dept_ru16` = региональный отдел ФССУ RU-16/CHELNY как конвейер обработки сигналов и эскалации в кейсы.
[FACT][ODS-020] `city_view_1` = ГОРОД-1: аналитическое представление потока инцидентов/сигналов (без юридических решений).
[FACT][ODS-030] `human_gate` = группа интерпретации и ответственности / куратор ИИ-исправлений (см. CANON-FSSU-REGIONAL-RU16-2215-0001).
[FACT][ODS-040] `city_view_2` = ГОРОД-2: исполнительное представление low-impact действий и маршрутизации (ограничено whitelist).
[FACT][ODS-050] `flagship_team` = флагманская команда, ведущая активированные кейсы на земле (см. CANON-FSSU-TEAM-STRUCT-2215-0001).
[FACT][ODS-060] `routing_outcome` = один из {AUTO_RESOLVE, CASE_ESCALATION, REJECT_CLOSE}.
[FACT][ODS-070] `auto_resolve` = автономное low-impact исполнение, разрешённое whitelist REG-FSSU-AUTO-LOWIMPACT-2215-0001.
[FACT][ODS-080] `case_escalation` = эскалация в активацию кейса по BASELINE-FSSU-CASE-ACTIVATION-2215-0001 и/или передача флагманской команде.
[FACT][ODS-090] `reject_close` = закрытие сигнала как не относящегося к юрисдикции/порогам/валидности, с фиксацией причины.

## INVARIANTS

[DECISION][ODS-100] `dept_ru16.conveyor.stage_order` MUST be ["city_view_1","human_gate","city_view_2","routing_outcome"].
[DECISION][ODS-110] `human_gate` MUST be the only нормативная точка персональной ответственности между `city_view_1` и `city_view_2`.
[FORBIDDEN][ODS-120] Прямой переход `city_view_1 → city_view_2` без `human_gate` как норма.
[DECISION][ODS-130] Любой `AUTO_RESOLVE` MUST быть ограничен whitelist REG-FSSU-AUTO-LOWIMPACT-2215-0001.
[DECISION][ODS-140] Любая `CASE_ESCALATION` MUST запускать процедуру активации кейса или передачу по компетенции согласно CANON-FSSU-GLOBAL-2215-0005.
[DECISION][ODS-150] Любой `REJECT_CLOSE` MUST иметь фиксируемую причину и MUST NOT уничтожать входные артефакты наблюдаемости.
[FORBIDDEN][ODS-160] Юридически значимые решения ИИ-контуром без визы человека.

## CONTENT

### 1. Intake Sources

[DECISION][ODS-200] `dept_ru16.intake.sources` MUST include {state_observability_signals, regulator_flags, operator_reports_via_state_circuit, field_observations, interagency_referrals}.
[FORBIDDEN][ODS-210] Прямой приём “сырой телеметрии” от компаний минуя государственный контур как норма (см. CANON-FSSU-GLOBAL-2215-0005).

### 2. Stage 1 — ГОРОД-1 (city_view_1)

[DECISION][ODS-300] `city_view_1.outputs.min_set` MUST include {correlation, hypotheses, asset_candidate, channel_candidate, impact_estimate, recommended_route}.
[FORBIDDEN][ODS-310] `city_view_1` активирует кейсы или санкционирует действия.

### 3. Stage 2 — Human Gate

[RULE][ODS-400] IF `city_view_1.output.recommended_route` exists THEN `human_gate.review_required` MUST be true; ELSE FAIL.
[RULE][ODS-410] IF `human_gate.review_required` = true THEN `human_gate.visa` MUST be true; ELSE FAIL.
[RULE][ODS-420] IF `human_gate.visa` = true THEN `visa.recorded` MUST be true; ELSE FAIL.

### 4. Stage 3 — ГОРОД-2 (city_view_2)

[DECISION][ODS-500] `city_view_2.may_execute` MUST be limited to `auto_resolve` actions.
[RULE][ODS-510] IF `routing_outcome` = AUTO_RESOLVE THEN `action.type` MUST be in whitelist(REG-FSSU-AUTO-LOWIMPACT-2215-0001); ELSE FAIL.
[RULE][ODS-520] IF `routing_outcome` = AUTO_RESOLVE THEN `execution.logging_required` MUST be true; ELSE FAIL.

### 5. Routing Outcomes

[RULE][ODS-600] PASS IFF `routing_outcome` in {AUTO_RESOLVE, CASE_ESCALATION, REJECT_CLOSE}; ELSE FAIL.

[RULE][ODS-610] IF `routing_outcome` = CASE_ESCALATION THEN `activation_flow.required` MUST be true; ELSE FAIL.
[RULE][ODS-620] IF `routing_outcome` = CASE_ESCALATION THEN `handoff.to_flagship_team` MUST be true OR `handoff.transfer_by_competence` MUST be true; ELSE FAIL.

[RULE][ODS-630] IF `routing_outcome` = REJECT_CLOSE THEN `reject_close.reason_recorded` MUST be true; ELSE FAIL.
[RULE][ODS-640] IF `routing_outcome` = REJECT_CLOSE THEN `artifacts.preserved_min` MUST be true; ELSE FAIL.

### 6. Handoff to Flagship Team

[DECISION][ODS-700] `handoff.to_flagship_team` MUST represent transfer of an activated case or an explicit escalation request.
[RULE][ODS-710] IF `handoff.to_flagship_team` = true THEN `case_owner.assignment.required` MUST be true; ELSE FAIL.

## USAGE / RESOLUTION

[DECISION][ODS-900] Любая сцена RU-16, описывающая работу отдела как конвейер, MUST следовать ODS-100..ODS-710; ELSE FAIL.
[DECISION][ODS-910] Conflict resolution MUST follow SPEC-PRIORITY-RESOLUTION-2215-0001; ELSE FAIL.

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-FSSU-DEPT-STRUCT-RU16-2215-0001
role_type: RULE
export:
  - rule_id: ODS-100
    intent: enforce stage order
    inputs: [dept_ru16.conveyor.stage_order]
    outputs: [stage_order_ok]
  - rule_id: ODS-410
    intent: require human gate visa when review required
    inputs: [human_gate.review_required]
    outputs: [human_gate.visa]
  - rule_id: ODS-510
    intent: restrict auto_resolve to whitelist
    inputs: [routing_outcome, action.type]
    outputs: [auto_resolve_allowed]
  - rule_id: ODS-610
    intent: require activation flow on escalation
    inputs: [routing_outcome]
    outputs: [activation_flow.required]
  - rule_id: ODS-630
    intent: require recorded reason on reject/close
    inputs: [routing_outcome]
    outputs: [reject_close.reason_recorded]
  - rule_id: ODS-710
    intent: require case owner assignment on handoff
    inputs: [handoff.to_flagship_team]
    outputs: [case_owner.assignment.required]
~~~

## FORBIDDEN

[FORBIDDEN][ODS-980] Описание архитектуры офиса/этажей/интерьеров в этом документе; ELSE FAIL.
[FORBIDDEN][ODS-981] Представление `human_gate` как “автоматического” без персональной ответственности; ELSE FAIL.
[FORBIDDEN][ODS-982] `AUTO_RESOLVE` без whitelist-ограничения; ELSE FAIL.
[FORBIDDEN][ODS-983] Уничтожение/потеря артефактов при `REJECT_CLOSE`; ELSE FAIL.

## NON-NORMATIVE

~~~text
Этот документ фиксирует “как отдел работает как конвейер”, отделяя операционный интерфейс
(стадии, маршрутизация, handoff) от регионального описания (отношение Центра, наличие флагманской команды)
и от описания самих представлений ГОРОД-1/ГОРОД-2 (это отдельный документ CITYVIEW).
~~~

~~~
</file>

<file path="canon/CANON-FSSU-GLOBAL-2215-0005.md">
~~~markdown
---
id: CANON-FSSU-GLOBAL-2215-0005
title: >
  ФССУ — мандат, юрисдикция, ограничения и принципы ИИ-слоя (2215)
class: canon
status: draft
version: 1.0.0
prefix: FSSU
doc_language: ru-RU
prose_language: ru-RU
inputs:
  - CANON-CONFLICT-GLOBAL-2215-0001
  - CANON-ORDERS-GLOBAL-2215-0003
  - CANON-SYSTEM-ONTOLOGY-2215-0001
  - CANON-SYSTEMS-GLOBAL-2215-0001
depends_on:
  - SPEC-DOC-STYLE-2215-0001
  - SPEC-PRIORITY-RESOLUTION-2215-0001
scope: >
  RULE-канон об ФССУ как федеральной госструктуре.
  Определяет мандат, критерий юрисдикции, ограничения полномочий и принципы ИИ-слоя.
  Региональные и локационные детали вынесены в отдельные документы.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: define FSSU mandate, jurisdiction criterion, authority limits and AI principles
INPUTS: [CANON-CONFLICT-GLOBAL-2215-0001, CANON-ORDERS-GLOBAL-2215-0003, CANON-SYSTEM-ONTOLOGY-2215-0001, CANON-SYSTEMS-GLOBAL-2215-0001]
OUTPUTS: [FSSU_identity, jurisdiction_criterion, allowed_actions, ai_principles]
FORBIDDEN: [FSSU_as_police, FSSU_as_court, arbitrary_surveillance, action_without_order]

## DEFINITIONS

[FACT][FSSU-010] `FSSU` = государственный межведомственный орган реагирования на Systemic_Hazard.
[FACT][FSSU-020] `case` = формально активированный кейс с мандатом и артефактами.
[FACT][FSSU-030] `order` = процедурное разрешение на действие.
[FACT][FSSU-040] `case_owner` = лицо, несущее персональную ответственность за кейс.

## INVARIANTS

[DECISION][FSSU-100] ФССУ MUST быть государственным органом.
[FORBIDDEN][FSSU-110] ФССУ как полиция общего назначения.
[FORBIDDEN][FSSU-120] ФССУ как суд.
[FORBIDDEN][FSSU-130] Произвольная слежка без активного кейса.

## CONTENT

[DECISION][FSSU-200] `FSSU.mission` = "выявление, доказуемость причинности и остановка Systemic_Hazard".

[RULE][FSSU-300] PASS IFF incident.touches.Systemic_Asset = true AND incident.uses.Systemic_Channel = true AND (incident.Safety_Impact >= case_threshold OR incident.Sovereignty_Impact >= case_threshold); ELSE FAIL.
[RULE][FSSU-310] IF FSSU-300 FAIL THEN `incident.route` MUST be "transfer_by_competence"; ELSE FAIL.

[DECISION][FSSU-400] ФССУ использует автономные ИИ-системы для наблюдаемости и анализа.
[FORBIDDEN][FSSU-410] ИИ принимает юридически значимое решение.
[RULE][FSSU-420] IF decision.is_legal_significant = true THEN decision.MUST_have_human_visa = true; ELSE FAIL.

[DECISION][FSSU-500] Логи и телеметрия являются первичными артефактами.
[DECISION][FSSU-510] Документы являются производными представлениями логов.

## USAGE / RESOLUTION

[DECISION][FSSU-800] Термины Systemic_Asset, Systemic_Channel, Systemic_Hazard, Safety_Impact, Sovereignty_Impact MUST разрешаться через CANON-SYSTEM-ONTOLOGY-2215-0001.
[DECISION][FSSU-810] Разрешение конфликтов MUST следовать SPEC-PRIORITY-RESOLUTION-2215-0001.

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-FSSU-GLOBAL-2215-0005
role_type: RULE
export:
  - rule_id: FSSU-300
    intent: jurisdiction gate
    inputs: [incident]
    outputs: [jurisdiction_pass]
  - rule_id: FSSU-310
    intent: routing on jurisdiction fail
    inputs: [incident, jurisdiction_pass]
    outputs: [incident.route]
  - rule_id: FSSU-420
    intent: require human visa for legal-significant decisions
    inputs: [decision.is_legal_significant]
    outputs: [decision.MUST_have_human_visa]
~~~

## FORBIDDEN

[FORBIDDEN][FSSU-900] Региональные якоря (RU-16/CHELNY) и локационные детали офиса в этом документе.
[FORBIDDEN][FSSU-910] Действие без `order`/`mandate`/`emergency` в случаях, где форма требуется CANON-ORDERS-GLOBAL-2215-0003.
[FORBIDDEN][FSSU-920] Любая интерпретация ФССУ как органа обычной уголовной юстиции по умолчанию.

## NON-NORMATIVE

~~~text
Документ является глобальным шлюзом: без региональных привязок.
Региональные нормы и “как устроено в Челнах” выносятся в CANON-FSSU-REGIONAL-RU16-2215-0001 и CANON-LOC-FSSU-OFFICE-CHELNY-2215-0001.
~~~

~~~
</file>

<file path="canon/CANON-FSSU-REGIONAL-RU16-2215-0001.md">
~~~markdown
---
id: CANON-FSSU-REGIONAL-RU16-2215-0001
title: >
  ФССУ — Регион RU-16 (Набережные Челны) — структура, конвейер решений и human gate (2215)
class: canon
status: draft
version: 1.0.0
prefix: OSR
doc_language: ru-RU
prose_language: ru-RU
inputs: []
depends_on:
  - CANON-FSSU-GLOBAL-2215-0005
  - CANON-SYSTEM-ONTOLOGY-2215-0001
  - SPEC-DOC-ID-2215-0001
  - SPEC-DOC-STYLE-2215-0001
  - SPEC-PRIORITY-RESOLUTION-2215-0001
scope: >
  RULE-канон регионального отдела ФССУ для RU-16/CHELNY.
  Определяет: роль Центра (Москва) как внешнего контура отчётности/аудита,
  региональный конвейер решений (ГОРОД-1 → human gate → ГОРОД-2 → флагманская команда),
  и ответственность human gate (группа интерпретации и ответственности / куратор ИИ-исправлений).
  Локация офиса вынесена в CANON-LOC-FSSU-OFFICE-CHELNY-2215-0001.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: define RU-16 regional FSSU structure, decision conveyor, and human gate accountability
INPUTS: []
OUTPUTS: [center_relation, regional_conveyor, human_gate_responsibility, flagship_team_presence]
FORBIDDEN: [office_architecture_details, scene_text, narrative_prose, undefined_terms]

## DEFINITIONS

[FACT][OSR-010] `FSSU_ru16_dept` = региональный отдел ФССУ, ведущий кейсы и операции в RU-16/CHELNY.
[FACT][OSR-020] `FSSU_center` = федеральный контур ФССУ (Москва), принимающий отчётность и проводящий аудит.
[FACT][OSR-030] `city_view_1` = ГОРОД-1, аналитическое представление потока инцидентов (термин уровня RU-16).
[FACT][OSR-040] `city_view_2` = ГОРОД-2, исполнительное представление действий low-impact (термин уровня RU-16).
[FACT][OSR-050] `human_gate` = группа интерпретации и ответственности (синоним: куратор ИИ-исправлений), несущая персональную ответственность за визирование решений, влияющих на кейсы/действия.

## INVARIANTS

[DECISION][OSR-100] Для RU-16/CHELNY `FSSU_center.relation` MUST be "external_reporting_and_audit_pressure_not_ops_hq".
[DECISION][OSR-110] Для RU-16/CHELNY `FSSU_ru16_dept.has_flagship_team` MUST be true.
[DECISION][OSR-120] Региональный конвейер MUST включать последовательность `city_view_1 → human_gate → city_view_2 → flagship_team`.
[DECISION][OSR-130] `human_gate` MUST быть единым контуром ответственности за решения между `city_view_1` и `city_view_2`.
[FORBIDDEN][OSR-140] Подмена `FSSU_center` на "оперативный штаб, управляющий тактикой на земле".

## CONTENT

### 1. Center–Region Relation

[DECISION][OSR-200] `FSSU_center.primary_function` = "audit_and_accountability".
[DECISION][OSR-210] `FSSU_center.interface` MUST include {"reports","audit_requests","policy_constraints"}.

[RULE][OSR-220] IF `FSSU_center.requests` contains "tactical_micro_management" THEN `FSSU_ru16_dept.must_reject_request` = true; ELSE FAIL.

### 2. Regional Intake and Filtering

[DECISION][OSR-300] `FSSU_ru16_dept.intake.mode` = "continuous_signal_processing".
[DECISION][OSR-310] `FSSU_ru16_dept.case_rate_profile` = "rare_cases_most_incidents_not_escalated".

### 3. Decision Conveyor (RU-16)

[DECISION][OSR-400] `regional_conveyor.stages` = ["city_view_1","human_gate","city_view_2","flagship_team"].

[RULE][OSR-410] PASS IFF stage_order = ["city_view_1","human_gate","city_view_2","flagship_team"]; ELSE FAIL.

[RULE][OSR-420] IF `city_view_1.output` = "recommend_action_or_escalate" THEN `human_gate.review_required` = true; ELSE FAIL.

[RULE][OSR-430] IF `human_gate.review_required` = true THEN `human_gate.visa` MUST be true; ELSE FAIL.

### 4. Human Gate Responsibility

[DECISION][OSR-500] `human_gate.aliases` MUST include {"interpretation_and_accountability_group","ai_fix_curator"}.
[DECISION][OSR-510] `human_gate.accountability.scope` MUST include {"case_activation_support","action_visa","risk_acceptance_record"}.

[RULE][OSR-520] IF `decision.affects_case_status` = true OR `decision.affects_legal_significance` = true THEN `human_gate.visa` MUST be true; ELSE FAIL.

### 5. Flagship Team Presence

[DECISION][OSR-600] `FSSU_ru16_dept.flagship_team.role` = "solve_active_cases_on_ground".
[DECISION][OSR-610] `FSSU_ru16_dept.flagship_team.default_case_owner_role` = "case_owner".

## USAGE / RESOLUTION

[DECISION][OSR-900] Любая сцена RU-16/CHELNY с ФССУ MUST трактовать регион через OSR-100..OSR-130; ELSE FAIL.
[DECISION][OSR-910] Conflict resolution MUST follow SPEC-PRIORITY-RESOLUTION-2215-0001; ELSE FAIL.

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-FSSU-REGIONAL-RU16-2215-0001
role_type: RULE
export:
  - rule_id: OSR-100
    intent: define center relation for RU-16
    inputs: []
    outputs: [FSSU_center.relation]
  - rule_id: OSR-410
    intent: enforce regional conveyor stage order
    inputs: [stage_order]
    outputs: [conveyor_ok]
  - rule_id: OSR-520
    intent: require human gate visa for case/legal-significant decisions
    inputs: [decision.affects_case_status, decision.affects_legal_significance]
    outputs: [human_gate.visa]
~~~

## FORBIDDEN

[FORBIDDEN][OSR-980] Региональные локационные детали офиса (этажи/архитектура/материалы) в этом документе; ELSE FAIL.
[FORBIDDEN][OSR-981] Представление `human_gate` как автоматического контура без персональной ответственности; ELSE FAIL.
[FORBIDDEN][OSR-982] Представление `FSSU_center` как тактического командования на земле; ELSE FAIL.

## NON-NORMATIVE

~~~text

Термины ГОРОД-1/ГОРОД-2 здесь фиксируются как региональные ярлыки (RU-16);
детальные свойства их автономии и ограничения будут вынесены в отдельный документ CITYVIEW.
~~~

~~~
</file>

<file path="canon/CANON-FSSU-TEAM-STRUCT-2215-0001.md">
~~~markdown
---
id: CANON-FSSU-TEAM-STRUCT-2215-0001
title: >
  ФССУ — Флагманская команда (RU-16) — роли, матрица подчинения, артефакты и культура работы (2215)
class: canon
status: draft
version: 1.0.0
prefix: OST
doc_language: ru-RU
prose_language: ru-RU
inputs: []
depends_on:
  - CANON-FSSU-GLOBAL-2215-0005
  - CANON-FSSU-REGIONAL-RU16-2215-0001
  - CANON-SYSTEM-ONTOLOGY-2215-0001
  - SPEC-DOC-ID-2215-0001
  - SPEC-DOC-STYLE-2215-0001
  - SPEC-PRIORITY-RESOLUTION-2215-0001
scope: >
  RULE-канон структуры флагманской команды ФССУ (регион RU-16).
  Определяет: внутренние роли (case_owner и функциональные контуры), матричность подчинения,
  владение кейсом, обязательные артефакты/лог-первичность и культурные инварианты команды.
  Не персонализирует роли на конкретных персонажей (персонализация — отдельные ROLE-доки).
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: define flagship team structure, roles, responsibilities, artifacts and cultural invariants for FSSU field case work
INPUTS: []
OUTPUTS: [team_roles, case_ownership_rules, artifact_rules, culture_invariants]
FORBIDDEN: [scene_text, narrative_prose, hiring_hr_details, undefined_terms]

## DEFINITIONS

[FACT][OST-010] `flagship_team` = флагманская проектная команда регионального отдела ФССУ, ведущая активированные кейсы на земле.
[FACT][OST-020] `case_owner` = роль операционного владельца кейса с персональной ответственностью за стратегию и координацию.
[FACT][OST-030] `functional_role` = специализированная роль внутри команды (наблюдаемость, право, полевое ядро, human gate и др.).
[FACT][OST-040] `human_gate` = функция визирования/ответственности за юридически значимые решения между анализом и исполнением (см. CANON-FSSU-REGIONAL-RU16-2215-0001).
[FACT][OST-050] `artifact_min_set` = минимальный набор артефактов кейса (логи/телеметрия + цепочка хранения + процедурные формы).

## INVARIANTS

[DECISION][OST-100] `flagship_team` MUST вести работу ONLY по активированным кейсам или по формальной эскалации.
[DECISION][OST-110] Для каждого активированного кейса MUST быть назначен ровно один `case_owner`.
[DECISION][OST-120] `case_owner` несёт персональную ответственность за стратегию, координацию и качество артефактов.
[DECISION][OST-130] Команда MUST быть матричной: операционное подчинение по кейсу и функциональное подчинение по домену.
[DECISION][OST-140] Логи и телеметрия MUST быть первичными артефактами (см. CANON-FSSU-GLOBAL-2215-0005).
[FORBIDDEN][OST-150] Коллективная безответственность: “решение приняла команда/система” без носителя ответственности.

## CONTENT

### 1. Role Set

[DECISION][OST-200] `team.roles.min_set` MUST include {case_owner, observability_engineer, legal_counsel, field_core, human_gate}.
[DECISION][OST-210] `team.roles.optional_set` MAY include {case_intake_specialist, evidence_ledger_specialist, interface_negotiator}.

[RULE][OST-220] IF `case.active` = true THEN `case_owner.assigned` MUST be true; ELSE FAIL.

### 2. Case Ownership and Coordination

[RULE][OST-300] IF `case.active` = true THEN `case_owner.count` MUST be 1; ELSE FAIL.
[RULE][OST-310] IF `case.active` = true THEN `case_owner.responsibility` MUST include {strategy, coordination, artifact_quality, escalation_decisions}; ELSE FAIL.
[RULE][OST-320] IF `case.active` = true THEN `team.operational_chain` MUST be "case_owner_leads"; ELSE FAIL.

### 3. Matrix Subordination

[DECISION][OST-400] `team.subordination.model` = "matrix".
[DECISION][OST-410] `team.subordination.axes` = {operational_case, functional_domain}.

[RULE][OST-420] IF `conflict.operational_vs_functional` = true THEN `resolution_priority` MUST be "case_safety_and_admissibility_first"; ELSE FAIL.

### 4. Human Gate Inside the Team

[DECISION][OST-500] `human_gate` MAY быть выделенной ролью или делегируемой функцией в составе команды, но ответственность MUST быть персональной.

[RULE][OST-510] IF `decision.is_legal_significant` = true OR `decision.affects_case_status` = true THEN `human_gate.visa` MUST be true; ELSE FAIL.
[RULE][OST-520] IF `human_gate.visa` = true THEN `visa.recorded` MUST be true; ELSE FAIL.

### 5. Artefacts and Log Primacy

[DECISION][OST-600] `artifact_min_set` MUST include {telemetry_logs, evidence_ledger_chain_of_custody, procedural_forms, case_docket}.
[DECISION][OST-610] `telemetry_logs` MUST be considered primary; `documents` MUST be considered derived.

[RULE][OST-620] IF `case.active` = true THEN `artifact_min_set.present` MUST be true; ELSE FAIL.
[RULE][OST-630] IF `evidence_item.collected` = true THEN `chain_of_custody.entry_created` MUST be true; ELSE FAIL.

### 6. Culture Invariants

[DECISION][OST-700] Команда MUST предпочитать остановку режима через процедурные рычаги, а не через “героическое вмешательство”.
[DECISION][OST-710] Команда MUST допускать осознанное отклонение рекомендаций ИИ при наличии записанной причины.
[DECISION][OST-720] Команда MUST считать “устранение человека” недостаточным результатом без стабилизации Channel/Asset (см. CANON-FSSU-GLOBAL-2215-0005).

[RULE][OST-730] IF `ai_recommendation.rejected` = true THEN `rejection.reason_recorded` MUST be true; ELSE FAIL.

## USAGE / RESOLUTION

[DECISION][OST-900] Любая сцена с флагманской командой ФССУ MUST трактовать структуру и роли через OST-200..OST-730; ELSE FAIL.
[DECISION][OST-910] Conflict resolution MUST follow SPEC-PRIORITY-RESOLUTION-2215-0001; ELSE FAIL.

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-FSSU-TEAM-STRUCT-2215-0001
role_type: RULE
export:
  - rule_id: OST-220
    intent: require case owner assignment
    inputs: [case.active]
    outputs: [case_owner.assigned]
  - rule_id: OST-300
    intent: enforce single case owner
    inputs: [case.active]
    outputs: [case_owner.count]
  - rule_id: OST-510
    intent: require human gate visa for legal/case-significant decisions
    inputs: [decision.is_legal_significant, decision.affects_case_status]
    outputs: [human_gate.visa]
  - rule_id: OST-620
    intent: require minimum artifact set for active case
    inputs: [case.active]
    outputs: [artifact_min_set.present]
  - rule_id: OST-730
    intent: require recorded reason when rejecting AI recommendation
    inputs: [ai_recommendation.rejected]
    outputs: [rejection.reason_recorded]
~~~

## FORBIDDEN

[FORBIDDEN][OST-980] Персонализация ролей на конкретных персонажей в этом документе; ELSE FAIL.
[FORBIDDEN][OST-981] Представление команды как не имеющей `case_owner`; ELSE FAIL.
[FORBIDDEN][OST-982] Представление решений как “принятых ИИ” без человеческой визы в юридически значимых случаях; ELSE FAIL.
[FORBIDDEN][OST-983] Подмена артефактов кейса “устной договорённостью” без ledger/логов; ELSE FAIL.

## NON-NORMATIVE

~~~text
Персональные профили (Мирон, Ринат и др.) фиксируются отдельными документами ROLE-*.
Региональный конвейер (ГОРОД-1/2 и human gate как контур отдела) фиксируется в CANON-FSSU-REGIONAL-RU16-2215-0001.
~~~

~~~
</file>

<file path="canon/CANON-LOC-CHELNY-2215-0001.md">
~~~markdown
---
id: CANON-LOC-CHELNY-2215-0001
title: >
  RU 2215 — Набережные Челны: Сенсорные дефолты и “maintenance dirt” (Gateway)
class: canon
status: draft
version: 0.4.0
prefix: CHELNYI
doc_language: ru-RU
prose_language: ru-RU
inputs:
  - CANON-LOC-CHELNY-REGISTRY-2215-0001
  - CANON-LOC-CHELNY-RULES-2215-0001
depends_on:
  - SPEC-DOC-STYLE-2215-0001
  - SPEC-PRIORITY-RESOLUTION-2215-0001
scope: >
  INTERFACE-шлюз для scene-дефолтов Челнов-2215: объявляет владение доменом
  локальных маркеров и указывает, какие документы содержат STATE-пулы и RULE-правила.
  Не содержит ни пулов, ни правил (кроме ownership/consumes/forbids).
---

## LLM-INTENT

ROLE_TYPE: INTERFACE
SCOPE: single entrypoint for Chelny-2215 local sensory defaults (thin gateway only)
INPUTS:
  - CANON-LOC-CHELNY-REGISTRY-2215-0001
  - CANON-LOC-CHELNY-RULES-2215-0001
OUTPUTS: [owns, consumes, forbids]
FORBIDDEN: [rule_definition, state_definition, token_pool_values, narrative_prose]

## DEFINITIONS

[FACT][CHELNYI-010] `LOC_CHELNY_2215` = ownership domain for Chelny-2215 local sensory/cue tokens and their consumption interface.
[FACT][CHELNYI-011] `registry_doc` = CANON-LOC-CHELNY-REGISTRY-2215-0001.
[FACT][CHELNYI-012] `rules_doc` = CANON-LOC-CHELNY-RULES-2215-0001.

## INVARIANTS

[DECISION][CHELNYI-020] This document MUST remain INTERFACE-only; ELSE FAIL.
[DECISION][CHELNYI-021] Token pools MUST be sourced only from registry_doc; ELSE FAIL.
[DECISION][CHELNYI-022] Enforceable constraints MUST be sourced only from rules_doc; ELSE FAIL.

## CONTENT

[DECISION][CHELNYI-100] Interface owns domain `LOC_CHELNY_2215`.
[DECISION][CHELNYI-110] Interface consumes registry_doc and rules_doc.

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-LOC-CHELNY-2215-0001
role_type: INTERFACE
export:
  - owns: ["LOC_CHELNY_2215"]
  - consumes:
      - "CANON-LOC-CHELNY-REGISTRY-2215-0001"
      - "CANON-LOC-CHELNY-RULES-2215-0001"
  - forbids:
      - "token_pool_values_inside_interface_doc"
      - "rule_or_state_definition_inside_interface_doc"
      - "implicit_prose_explanations_as_system_descriptions"
~~~

## FORBIDDEN

[FORBIDDEN][CHELNYI-900] Embedding token pools in this INTERFACE.
[FORBIDDEN][CHELNYI-901] Embedding enforceable rules in this INTERFACE.
[FORBIDDEN][CHELNYI-902] Treating NON-NORMATIVE as enforceable semantics.

## NON-NORMATIVE

(Empty by design)

~~~
</file>

<file path="canon/CANON-LOC-CHELNY-REGISTRY-2215-0001.md">
~~~markdown
---
id: CANON-LOC-CHELNY-REGISTRY-2215-0001
title: >
  RU 2215 — Набережные Челны: Пулы токенов сенсорных маркеров и контуров (Registry)
class: canon
status: draft
version: 0.1.0
prefix: CHELNYR
doc_language: ru-RU
inputs: []
depends_on:
  - SPEC-DOC-STYLE-2215-0001
  - SPEC-PRIORITY-RESOLUTION-2215-0001
scope: >
  STATE-реестр токенов для сцен Челнов-2215: допустимые пулы маркеров (запах/КамАЗ/maintenance dirt/
  observability/anchor snippets). Не содержит правил применения и не содержит SSOT-метрик.
---

## LLM-INTENT

ROLE_TYPE: STATE
SCOPE: define canonical token pools for Chelny-2215 local sensory/cue markers (no rules)
INPUTS: []
OUTPUTS: [token_pools]
FORBIDDEN: [implicit_defaults, rule_definition, narrative_prose, numeric_city_metrics]

## DEFINITIONS

[FACT][CHELNYR-010] `token` = UPPER_SNAKE_CASE identifier consumed by RULE documents and scene contracts.
[FACT][CHELNYR-011] `token_pool` = named set(token).
[FACT][CHELNYR-012] `pool_key` ∈ {SMELL_MARKER, KAMAZ_MANIFESTATION, KAMAZ_VISUAL_CUE, ALLOCATION_PROCEDURE_CUE, OBSERVABILITY_ARTIFACT_CUE, ANCHOR_SNIPPET}.
[FACT][CHELNYR-013] `token_pool_owner_domain` = LOC_CHELNY_2215.

## INVARIANTS

[DECISION][CHELNYR-020] This document MUST define a token_pool for every pool_key; ELSE FAIL.
[DECISION][CHELNYR-021] Every token MUST be UPPER_SNAKE_CASE; ELSE FAIL.
[FORBIDDEN][CHELNYR-022] Defining application rules or per-scene budgets in this document; ELSE FAIL.

## CONTENT

[STATE][CHELNYR-100] token_pool.SMELL_MARKER.tokens = {OZONE_ELECTRIC_SERVICE, WARMED_COMPOSITE_SHELL, RIVER_MOISTURE_ALGAE_WET_CONCRETE, DUST_WARM_METAL_LOGISTICS, FAINT_CLEANING_CHEMISTRY_PUBLIC}.
[STATE][CHELNYR-110] token_pool.KAMAZ_MANIFESTATION.tokens = {AUTOMATED_PRODUCTION_REPAIR_CONTOUR, LOGISTICS_MEGAHUB_SORTING_CORRIDORS, MUSEUM_ACTIVE_HYBRID_PUBLIC_SHELL_RESTRICTED_ZONES}.
[STATE][CHELNYR-120] token_pool.KAMAZ_VISUAL_CUE.tokens = {LARGE_SPANS, CALM_MASSES, MINIMAL_ORNAMENT, MANY_SERVICE_GATES, ACCESS_HATCHES, ROUTE_LAYERS}.
[STATE][CHELNYR-130] token_pool.ALLOCATION_PROCEDURE_CUE.tokens = {SERVICE_WINDOWS, POWER_WINDOWS_PEAK_CAPACITY, SUPPLY_CLASSES, ACCESS_TIERS, AUDIT_LEGAL_ADMISSIBILITY_GATES}.
[STATE][CHELNYR-140] token_pool.OBSERVABILITY_ARTIFACT_CUE.tokens = {NO_PRIMARY_LOGS_ONLY_AGGREGATES, LOG_WINDOW_CLOSES_IN_HOURS, REQUIRES_ORDER_OR_CHAIN_OF_CUSTODY, ACCESS_DENIED_BY_TIER, BLIND_ZONE_BY_DESIGN}.
[STATE][CHELNYR-150] token_pool.ANCHOR_SNIPPET.tokens = {ANCHOR_MATTE_RAIL_WARM, ANCHOR_OZONE_CLEANING_PASSAGE, ANCHOR_KAMA_DIFFUSE_SERVICE_CONCRETE, ANCHOR_DISTANT_HUM_CONTOUR, ANCHOR_SILENCE_MEANS_LAYER_OFF, ANCHOR_NO_PRIMARY_ONLY_AGGREGATES_NEED_ORDER}.

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-LOC-CHELNY-REGISTRY-2215-0001
role_type: STATE
export:
  owner_domain: LOC_CHELNY_2215
  token_pools:
    SMELL_MARKER: [OZONE_ELECTRIC_SERVICE, WARMED_COMPOSITE_SHELL, RIVER_MOISTURE_ALGAE_WET_CONCRETE, DUST_WARM_METAL_LOGISTICS, FAINT_CLEANING_CHEMISTRY_PUBLIC]
    KAMAZ_MANIFESTATION: [AUTOMATED_PRODUCTION_REPAIR_CONTOUR, LOGISTICS_MEGAHUB_SORTING_CORRIDORS, MUSEUM_ACTIVE_HYBRID_PUBLIC_SHELL_RESTRICTED_ZONES]
    KAMAZ_VISUAL_CUE: [LARGE_SPANS, CALM_MASSES, MINIMAL_ORNAMENT, MANY_SERVICE_GATES, ACCESS_HATCHES, ROUTE_LAYERS]
    ALLOCATION_PROCEDURE_CUE: [SERVICE_WINDOWS, POWER_WINDOWS_PEAK_CAPACITY, SUPPLY_CLASSES, ACCESS_TIERS, AUDIT_LEGAL_ADMISSIBILITY_GATES]
    OBSERVABILITY_ARTIFACT_CUE: [NO_PRIMARY_LOGS_ONLY_AGGREGATES, LOG_WINDOW_CLOSES_IN_HOURS, REQUIRES_ORDER_OR_CHAIN_OF_CUSTODY, ACCESS_DENIED_BY_TIER, BLIND_ZONE_BY_DESIGN]
    ANCHOR_SNIPPET: [ANCHOR_MATTE_RAIL_WARM, ANCHOR_OZONE_CLEANING_PASSAGE, ANCHOR_KAMA_DIFFUSE_SERVICE_CONCRETE, ANCHOR_DISTANT_HUM_CONTOUR, ANCHOR_SILENCE_MEANS_LAYER_OFF, ANCHOR_NO_PRIMARY_ONLY_AGGREGATES_NEED_ORDER]
~~~

## FORBIDDEN

[FORBIDDEN][CHELNYR-900] Treating this registry as defaults without RULE applicability.
[FORBIDDEN][CHELNYR-910] Adding prose “as rules” into normative sections.

## NON-NORMATIVE

~~~yaml
anchor_snippet_examples:
  ANCHOR_MATTE_RAIL_WARM: "Матовая поверхность перил тёплая — как будто город всё время чуть подогревает себя изнутри."
  ANCHOR_OZONE_CLEANING_PASSAGE: "В переходе пахнет озоном и моющим — как в серверной, только с людьми."
  ANCHOR_KAMA_DIFFUSE_SERVICE_CONCRETE: "Над Камой свет рассеянный, а бетон берега выглядит обслуженным, как корпус оборудования."
  ANCHOR_DISTANT_HUM_CONTOUR: "Вдали гудит контур — не машины, а режим."
  ANCHOR_SILENCE_MEANS_LAYER_OFF: "Тишина здесь не отдых: тишина означает, что слой отключён."
  ANCHOR_NO_PRIMARY_ONLY_AGGREGATES_NEED_ORDER: "Нет первички, только агрегаты. Окно логов закрывается через 6 часов. Нужен ордер."
~~~

~~~
</file>

<file path="canon/CANON-LOC-CHELNY-RULES-2215-0001.md">
~~~markdown
---
id: CANON-LOC-CHELNY-RULES-2215-0001
title: >
  RU 2215 — Набережные Челны: Сенсорные дефолты, контуры и “maintenance dirt” (Rules)
class: canon
status: draft
version: 0.1.0
prefix: CHELNY
doc_language: ru-RU
prose_language: ru-RU
inputs:
  - BASELINE-PHYSICAL_LEVEL_MID-2215-0001
  - CANON-CITY-BOUNDARY-RU-2215-0008
  - CANON-CITY-RU-2215-0007
  - SSOT-LOC-WEATHER-CHELNY-2215-0001
  - SSOT-URBANISM-A-2215-0007
  - CANON-LOC-CHELNY-REGISTRY-2215-0001
depends_on:
  - SPEC-DOC-STYLE-2215-0001
  - SPEC-PRIORITY-RESOLUTION-2215-0001
scope: >
  RULE-канон для сцен RU-16/Набережные Челны (2215): сенсорные дефолты
  (свет/воздух/запах/звук/тактильность), правила “контуров” без инфодампа,
  и правила показа “maintenance dirt” (ограничения/доступ/maintenance) без нуара
  и без стерильной утопии. Пулы токенов вынесены в REGISTRY.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: enforceable scene defaults for Chelny-2215 sensory + infrastructure cues (non-noir, non-utopia)
INPUTS:
  - BASELINE-PHYSICAL_LEVEL_MID-2215-0001
  - CANON-CITY-BOUNDARY-RU-2215-0008
  - CANON-CITY-RU-2215-0007
  - SSOT-LOC-WEATHER-CHELNY-2215-0001
  - SSOT-URBANISM-A-2215-0007
  - CANON-LOC-CHELNY-REGISTRY-2215-0001
OUTPUTS: [sensory_defaults, allowed_scene_markers, infrastructure_cue_rules]
FORBIDDEN: [gotham_noir_defaults, sterile_utopia, infodump_explanations, total_surveillance_assumption, plastic_futurism]

## DEFINITIONS

[FACT][CHELNY-010] `token_pool` = exports.token_pools from `CANON-LOC-CHELNY-REGISTRY-2215-0001`.
[FACT][CHELNY-011] `smell_marker_token` ∈ token_pool.SMELL_MARKER.
[FACT][CHELNY-012] `kamaz_manifestation_token` ∈ token_pool.KAMAZ_MANIFESTATION.
[FACT][CHELNY-013] `allocation_procedure_cue_token` ∈ token_pool.ALLOCATION_PROCEDURE_CUE.
[FACT][CHELNY-014] `observability_artifact_cue_token` ∈ token_pool.OBSERVABILITY_ARTIFACT_CUE.
[FACT][CHELNY-015] `anchor_snippet_token` ∈ token_pool.ANCHOR_SNIPPET.

[FACT][CHELNY-020] `baseline_level` ∈ {LEVEL_MID, OTHER}.
[FACT][CHELNY-021] `sensory_tone` ∈ {MATURE_INFRA_DISCIPLINE, GOTHAM_NOIR, STERILE_UTOPIA, PLASTIC_FUTURISM}.
[FACT][CHELNY-022] `detail_binding` ∈ {BOUND_TO_CONTOUR_OR_COST, UNBOUND}.
[FACT][CHELNY-023] `conflict_framing` ∈ {ALLOCATION_UNDER_CONSTRAINTS, SURVIVAL_POVERTY_DEFAULT, OTHER}.
[FACT][CHELNY-024] `exterior_light_profile` ∈ {DIFFUSE_LOW_CONTRAST, OTHER}.
[FACT][CHELNY-025] `interior_light_profile` ∈ {LAYERED_AMBIENT_PLUS_TASK_POOLS, OTHER}.
[FACT][CHELNY-026] `night_lighting_profile` ∈ {LOW_GLARE_INFRA_PATH_HIGHLIGHT, SPECTACLE_SHOW, OTHER}.
[FACT][CHELNY-027] `indoor_air_profile` ∈ {CORRECT_DISCIPLINED, SLIGHT_DRY_CONDITIONING, OTHER}.
[FACT][CHELNY-028] `soundscape_profile` ∈ {LOW_FREQUENCY_CONTINUOUS_WITH_RARE_PROCEDURAL_BEEPS, CINEMATIC_SILENCE_DEFAULT, OTHER}.
[FACT][CHELNY-029] `surface_profile` ∈ {MATTE_MICROTEXTURED_LOW_SLIP, OTHER}.
[FACT][CHELNY-030] `material_profile` ∈ {COATED_METAL_AND_STRUCTURAL_COMPOSITES, GLOSSY_CONSUMER_PLASTIC, OTHER}.
[FACT][CHELNY-031] `kama_framing` ∈ {MANAGED_INFRASTRUCTURE, ROMANTIC_WILD_RIVER, OTHER}.
[FACT][CHELNY-032] `public_space_friction` ∈ {PROCEDURAL, VIOLENCE, OTHER}.
[FACT][CHELNY-033] `street_commerce_profile` ∈ {RESTRAINED_FUNCTIONAL_SERVICE_POINTS, FESTIVAL_BAZAAR, OTHER}.
[FACT][CHELNY-034] `mobility_description_mode` ∈ {LAYER_SWITCHING, RACING_CHASE, OTHER}.
[FACT][CHELNY-035] `primary_friction` ∈ {ACCESS_PERIMETER_WINDOW, TRAFFIC_JAMS, OTHER}.
[FACT][CHELNY-036] `observability_model` ∈ {RICH_BUT_FRAGMENTED, OMNISCIENT_TOTAL, OTHER}.
[FACT][CHELNY-037] `observability_surface_mode` ∈ {ARTIFACTS_AND_CONSTRAINTS, EXPOSITION, OTHER}.

[FACT][CHELNY-040] `smell_markers_count` = integer.
[FACT][CHELNY-041] `smell_markers_selected` = set(smell_marker_token).
[FACT][CHELNY-042] `kamaz_manifestations_count` = integer.
[FACT][CHELNY-043] `kamaz_manifestations_selected` = set(kamaz_manifestation_token).
[FACT][CHELNY-044] `anchor_snippets_count` = integer.
[FACT][CHELNY-045] `anchor_snippets_selected` = set(anchor_snippet_token).

[FACT][CHELNY-050] `incident_contour_active` = bool.
[FACT][CHELNY-051] `scene_or_override_declares_noir_weather` = bool.
[FACT][CHELNY-052] `noir_weather_substitution_used` = bool.
[FACT][CHELNY-053] `weather_values_sourced_from_ssot_weather` = bool.
[FACT][CHELNY-054] `plot_requires_kamaz_manifestations` = bool.
[FACT][CHELNY-055] `silence_is_described` = bool.
[FACT][CHELNY-056] `silence_implies_anomaly_or_regime_or_incident` = bool.

[FACT][CHELNY-060] `scene_in_ru16_chelny` = bool.
[FACT][CHELNY-061] `chelny_defaults_applied` = bool.
[FACT][CHELNY-062] `scene_or_override_overrides_chelny_defaults` = bool.

## INVARIANTS

[RULE][CHELNY-100] PASS IFF (baseline_level == LEVEL_MID) OR (incident_contour_active == true); ELSE FAIL.
[RULE][CHELNY-101] PASS IFF sensory_tone == MATURE_INFRA_DISCIPLINE; ELSE FAIL.
[RULE][CHELNY-102] PASS IFF detail_binding == BOUND_TO_CONTOUR_OR_COST; ELSE FAIL.
[RULE][CHELNY-103] PASS IFF conflict_framing == ALLOCATION_UNDER_CONSTRAINTS; ELSE FAIL.

## CONTENT

### A. Light (default)

[RULE][CHELNY-200] PASS IFF exterior_light_profile == DIFFUSE_LOW_CONTRAST; ELSE FAIL.
[RULE][CHELNY-201] PASS IFF interior_light_profile == LAYERED_AMBIENT_PLUS_TASK_POOLS; ELSE FAIL.
[RULE][CHELNY-202] PASS IFF night_lighting_profile == LOW_GLARE_INFRA_PATH_HIGHLIGHT; ELSE FAIL.
[FORBIDDEN][CHELNY-203] Neon-noir lighting as default city identity.

### B. Air / temperature (default)

[RULE][CHELNY-210] PASS IFF indoor_air_profile == CORRECT_DISCIPLINED; ELSE FAIL.
[FORBIDDEN][CHELNY-211] Using SLIGHT_DRY_CONDITIONING as Chelny-2215 default.

### C. Smell markers (per-scene budget + pool)

[RULE][CHELNY-220] PASS IFF smell_markers_count >= 0 AND smell_markers_count <= 2; ELSE FAIL.
[RULE][CHELNY-221] PASS IFF smell_markers_selected ⊆ token_pool.SMELL_MARKER; ELSE FAIL.
[FORBIDDEN][CHELNY-222] “Запах гнили/мусора/разложения” как дефолтная идентичность города.

### D. Soundscape (default)

[RULE][CHELNY-230] PASS IFF soundscape_profile == LOW_FREQUENCY_CONTINUOUS_WITH_RARE_PROCEDURAL_BEEPS; ELSE FAIL.
[RULE][CHELNY-231] PASS IFF (silence_is_described != true) OR (silence_implies_anomaly_or_regime_or_incident == true); ELSE FAIL.
[FORBIDDEN][CHELNY-232] CINEMATIC_SILENCE_DEFAULT as baseline.

### E. Tactile / surfaces (default)

[RULE][CHELNY-240] PASS IFF surface_profile == MATTE_MICROTEXTURED_LOW_SLIP; ELSE FAIL.
[RULE][CHELNY-241] PASS IFF material_profile == COATED_METAL_AND_STRUCTURAL_COMPOSITES; ELSE FAIL.
[FORBIDDEN][CHELNY-242] GLOSSY_CONSUMER_PLASTIC as dominant material language.

### F. Kama & embankments (water as regime boundary)

[RULE][CHELNY-250] PASS IFF kama_framing == MANAGED_INFRASTRUCTURE; ELSE FAIL.
[FORBIDDEN][CHELNY-251] ROMANTIC_WILD_RIVER as default framing.

### G. KAMAZ-trace (historical layer → operational node)

[RULE][CHELNY-260] PASS IFF (plot_requires_kamaz_manifestations == true) OR (kamaz_manifestations_count >= 0 AND kamaz_manifestations_count <= 1); ELSE FAIL.
[RULE][CHELNY-261] PASS IFF kamaz_manifestations_selected ⊆ token_pool.KAMAZ_MANIFESTATION; ELSE FAIL.

### H. “Maintenance dirt” (show limits without poverty)

[RULE][CHELNY-270] PASS IFF conflict_framing == ALLOCATION_UNDER_CONSTRAINTS; ELSE FAIL.
[FORBIDDEN][CHELNY-271] SURVIVAL_POVERTY_DEFAULT as baseline without explicit incident contour.

### I. Public space friction (friendly to locals, procedural to visitors)

[RULE][CHELNY-280] PASS IFF public_space_friction == PROCEDURAL; ELSE FAIL.
[RULE][CHELNY-281] PASS IFF street_commerce_profile == RESTRAINED_FUNCTIONAL_SERVICE_POINTS; ELSE FAIL.
[FORBIDDEN][CHELNY-282] Violence-first framing in public spaces as baseline.

### J. Mobility (layers, not racing)

[RULE][CHELNY-290] PASS IFF mobility_description_mode == LAYER_SWITCHING; ELSE FAIL.
[RULE][CHELNY-291] PASS IFF primary_friction == ACCESS_PERIMETER_WINDOW; ELSE FAIL.
[FORBIDDEN][CHELNY-292] RACING_CHASE as baseline mobility framing.

### K. Observability & privacy (no omniscience)

[RULE][CHELNY-300] PASS IFF observability_model == RICH_BUT_FRAGMENTED; ELSE FAIL.
[RULE][CHELNY-301] PASS IFF observability_surface_mode == ARTIFACTS_AND_CONSTRAINTS; ELSE FAIL.
[FORBIDDEN][CHELNY-302] OMNISCIENT_TOTAL as baseline assumption.

### L. Weather (consumption rule; values live in SSOT)

[RULE][CHELNY-310] PASS IFF weather_values_sourced_from_ssot_weather == true; ELSE FAIL.
[RULE][CHELNY-311] PASS IFF (noir_weather_substitution_used != true) OR (scene_or_override_declares_noir_weather == true); ELSE FAIL.
[FORBIDDEN][CHELNY-312] Constant noir-weather as baseline without explicit scene/override declaration.

## USAGE / RESOLUTION

[RULE][CHELNY-400] PASS IFF (scene_in_ru16_chelny != true) OR (chelny_defaults_applied == true) OR (scene_or_override_overrides_chelny_defaults == true); ELSE FAIL.
[DECISION][CHELNY-410] Downstream generation MUST treat these rules as default constraints for RU-16/Chelny scenes; ELSE FAIL.

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-LOC-CHELNY-RULES-2215-0001
role_type: RULE
export:
  - rule_id: CHELNY-220
    intent: "smell markers per scene limited to 0..2 and must come from registry pool"
    inputs: [smell_markers_count, smell_markers_selected, CANON-LOC-CHELNY-REGISTRY-2215-0001]
    outputs: [smell_marker_budget_ok]
  - rule_id: CHELNY-300
    intent: "observability baseline is rich-but-fragmented; surface via artifacts/constraints"
    inputs: [observability_model, observability_surface_mode]
    outputs: [observability_baseline_ok]
  - rule_id: CHELNY-310
    intent: "weather values must be sourced from SSOT weather exports"
    inputs: [SSOT-LOC-WEATHER-CHELNY-2215-0001, weather_values_sourced_from_ssot_weather]
    outputs: [weather_source_ok]
~~~

## FORBIDDEN

[FORBIDDEN][CHELNY-900] Gotham-noir defaults (constant rain, acid neon, trenchcoat aesthetics) as baseline.
[FORBIDDEN][CHELNY-901] Sterile utopia framing (no wear, no maintenance, no procedural friction).
[FORBIDDEN][CHELNY-902] Infodump explanations of systems; contours MUST be surfaced via cues/artifacts.
[FORBIDDEN][CHELNY-903] Total surveillance assumption without procedural gates, blind zones, aggregation, or delays.
[FORBIDDEN][CHELNY-904] Plastic-futurism visual language as default material identity.
[FORBIDDEN][CHELNY-905] Consuming NON-NORMATIVE examples as rules.

## NON-NORMATIVE

(Empty by design)

~~~
</file>

<file path="canon/CANON-LOC-FSSU-OFFICE-CHELNY-2215-0001.md">
~~~markdown
---
id: CANON-LOC-FSSU-OFFICE-CHELNY-2215-0001
title: >
  Локация — Офис ФССУ (Набережные Челны) — размещение, архитектура, режимность и техконтуры (2215)
class: canon
status: draft
version: 1.0.0
prefix: OOF
doc_language: ru-RU
prose_language: ru-RU
inputs: []
depends_on:
  - CANON-LOC-CHELNY-2215-0001
  - SPEC-DOC-ID-2215-0001
  - SPEC-DOC-STYLE-2215-0001
  - SPEC-PRIORITY-RESOLUTION-2215-0001
scope: >
  STATE-канон локации регионального офиса ФССУ в Набережных Челнах (RU-16) на 2215 год:
  site logic (анклав у ТЭЦ), 3 этажа надземной части, стиль techno-brutalism (Berlin),
  режимность/уровни допуска, подземный compute (ГОРОД-1/ГОРОД-2), функциональное зонирование,
  и внешняя непубличная идентичность объекта.
---

## LLM-INTENT

ROLE_TYPE: STATE
SCOPE: define canonical physical and operational location properties of FSSU office in RU-16/CHELNY including access levels and underground compute placement
INPUTS: []
OUTPUTS: [office_location_anchor, office_architecture_profile, office_access_profile, office_floor_zoning, office_compute_placement, office_identity_constraints]
FORBIDDEN: [narrative_prose, scene_text, causal_chains, soft_modals, undefined_terms]

## DEFINITIONS

[FACT][OOF-010] `FSSU_office_chelny` = региональный офис ФССУ в локации "RU-16/CHELNY/federal_technical_enclave/adjacent_to_tec".
[FACT][OOF-011] `access_level` = уровень допуска зоны офиса: {L0, L1, L2, L3}.
[FACT][OOF-012] `compute_stack_city` = подземный вычислительный контур ГОРОД-1/ГОРОД-2, размещённый на уровнях –1/–2.

## INVARIANTS

[DECISION][OOF-100] `FSSU_office_chelny.location_anchor` MUST be "RU-16/CHELNY/federal_technical_enclave/adjacent_to_tec".
[DECISION][OOF-110] Надземная часть `FSSU_office_chelny` MUST иметь ровно 3 этажа.
[DECISION][OOF-120] Надземные этажи MUST быть офисными и MUST NOT быть полевым ангаром или гаражом реагирования.
[DECISION][OOF-130] Архитектурный стиль надземной части MUST быть "berlin_techno_brutalism".
[DECISION][OOF-140] `compute_stack_city` MUST быть размещён на подземных уровнях и MUST относиться к зоне L3.
[DECISION][OOF-150] Офис MUST быть режимным объектом с зонированием по `access_level` и с обязательным логированием доступа в L2/L3.
[DECISION][OOF-160] Надземные уровни MUST иметь единый интерьерный стиль; исключение MUST быть только для технических/подземных уровней.

## CONTENT

### 1. Placement and Site Logic

[STATE][OOF-200] `FSSU_office_chelny.site_relation` = "adjacent_to_tec_but_outside_tec_perimeter".
[STATE][OOF-201] `FSSU_office_chelny.perimeter` = "own_perimeter_independent_from_tec_checkpoint".
[STATE][OOF-202] `FSSU_office_chelny.transport_trajectories` MUST include {"staff_main_entrance","service_technical_entry"}.

### 2. Building Form and Architecture

[STATE][OOF-300] `FSSU_office_chelny.above_ground_floors` = 3.
[STATE][OOF-301] `FSSU_office_chelny.building_type` = "typed_federal_administrative_technical_object".
[STATE][OOF-302] `FSSU_office_chelny.architecture.style` = "berlin_techno_brutalism".
[STATE][OOF-303] `FSSU_office_chelny.architecture.materials` MUST include {"concrete","metal","glass"}.
[STATE][OOF-304] `FSSU_office_chelny.architecture.facade` MUST be "mass_material_no_decor_no_showcase_transparency".
[STATE][OOF-305] `FSSU_office_chelny.architecture.engineering_elements` MUST be "integrated_non_demonstrative".

### 3. Security and Access Levels

[STATE][OOF-400] `FSSU_office_chelny.security.posture` = "strict_guarded_restricted_object".
[STATE][OOF-401] `FSSU_office_chelny.access_levels.min_set` = {L0, L1, L2, L3}.
[STATE][OOF-402] `access_level.L0` = "perimeter_and_external_access_control".
[STATE][OOF-403] `access_level.L1` = "general_office_circuit".
[STATE][OOF-404] `access_level.L2` = "restricted_decision_and_extended_data_zones".
[STATE][OOF-405] `access_level.L3` = "critical_technical_circuit_underground_compute_comms_keys".
[RULE][OOF-410] IF `access_level` in {L2,L3} THEN `access_event.logging_required` MUST be true; ELSE FAIL.

### 4. Interior Uniformity and Materials

[STATE][OOF-500] `FSSU_office_chelny.interior.uniformity` MUST be true for all above-ground levels.
[STATE][OOF-501] Различия между офисными зонами MUST выражаться режимом доступа, акустикой и плотностью данных; ELSE FAIL.
[STATE][OOF-502] `FSSU_office_chelny.interior.exception_scope` = "technical_and_underground_levels_only".
[STATE][OOF-510] `FSSU_office_chelny.interior.material_palette` MUST include {"architectural_concrete","dark_matte_metal","structural_glass"}.
[STATE][OOF-511] `FSSU_office_chelny.interior.floor_finish` MUST be one of {"polished_concrete","concrete_compatible_composite"}.
[STATE][OOF-512] `FSSU_office_chelny.interior.ui_integration` MUST be "embedded_in_surfaces_no_separate_cyberpunk_layer".

### 5. Underground Compute Stack (ГОРОД-1 / ГОРОД-2)

[STATE][OOF-600] `FSSU_office_chelny.underground.levels_min` = {"-1","-2"}.
[STATE][OOF-601] `FSSU_office_chelny.underground.-1.function` MUST include {"heat_exchange","power","filtration"}.
[STATE][OOF-602] `FSSU_office_chelny.underground.-2.function` MUST include {"server_rooms","compute_city1","compute_city2","high_density_cooling"}.
[STATE][OOF-603] `FSSU_office_chelny.underground.purpose` MUST include {"physical_security","cooling_stability","compute_autonomy"}.
[STATE][OOF-604] `FSSU_office_chelny.underground.style` = "function_over_form".
[STATE][OOF-605] `FSSU_office_chelny.underground.access_level` = L3.

### 6. Communication Infrastructure

[STATE][OOF-700] `FSSU_office_chelny.comms.secure_amplifier_node` MUST be true.
[STATE][OOF-701] `FSSU_office_chelny.comms.node_form` MUST be "architecturally_integrated_pylon_or_module".
[STATE][OOF-702] `FSSU_office_chelny.comms.node_is_public_tower` MUST be false.
[STATE][OOF-703] `FSSU_office_chelny.comms.access_level` = L3.

### 7. Functional Zoning by Floors

[STATE][OOF-800] `FSSU_office_chelny.floor_1.functions` MUST include {"entry_control","reception","general_meeting_rooms","limited_office_circuit"}.
[STATE][OOF-801] `FSSU_office_chelny.floor_2.functions` MUST include {"analytic_office_circuit","decision_rooms"}.
[STATE][OOF-802] `FSSU_office_chelny.floor_2.contains_miron_team_room` MUST be true.
[STATE][OOF-803] `FSSU_office_chelny.floor_3.functions` MUST include {"management_circuit","closed_comms_circuit","rinat_office","strategic_interaction_rooms"}.

### 8. Miron Team Room (Second Floor)

[STATE][OOF-850] `FSSU_office_chelny.miron_team_room.mode` = "closed_shared_workspace_one_team_one_room".
[STATE][OOF-851] `FSSU_office_chelny.miron_team_room.style_break` MUST be false.
[RULE][OOF-852] IF `FSSU_office_chelny.miron_team_room.data_access` = true THEN access MUST comply with `access_level` policy (L2/L3); ELSE FAIL.

### 9. Non-Public Identity

[STATE][OOF-900] `FSSU_office_chelny.external_identity.is_public_reception` MUST be false.
[STATE][OOF-901] `FSSU_office_chelny.external_identity.symbolics` MUST be "minimal_federal_required_no_heroization_no_force_coding".

## USAGE / RESOLUTION

[DECISION][OOF-950] Любая сцена, использующая `FSSU_office_chelny`, MUST привязывать локацию через `OOF-100`; ELSE FAIL.
[DECISION][OOF-951] Conflict resolution MUST follow SPEC-PRIORITY-RESOLUTION-2215-0001; ELSE FAIL.

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-LOC-FSSU-OFFICE-CHELNY-2215-0001
role_type: STATE
export:
  - metric: office_location_anchor
    owner_domain: FSSU_LOC
    values:
      core: "RU-16/CHELNY/federal_technical_enclave/adjacent_to_tec"
      p90: none
      range: none
    unit: none
  - metric: office_above_ground_floors
    owner_domain: FSSU_LOC
    values:
      core: 3
      p90: none
      range: none
    unit: floors
  - metric: office_architecture_style
    owner_domain: FSSU_LOC
    values:
      core: "berlin_techno_brutalism"
      p90: none
      range: none
    unit: none
  - metric: office_access_levels
    owner_domain: FSSU_LOC
    values:
      core: "L0,L1,L2,L3"
      p90: none
      range: none
    unit: enum_set
  - metric: office_underground_levels_min
    owner_domain: FSSU_LOC
    values:
      core: "-1,-2"
      p90: none
      range: none
    unit: floors
  - metric: office_compute_placement
    owner_domain: FSSU_LOC
    values:
      core: "underground_-2_city1_city2"
      p90: none
      range: none
    unit: none
~~~

## FORBIDDEN

[FORBIDDEN][OOF-980] Depicting `FSSU_office_chelny` as "industrial_zone/old_building" or "workshop_garage"; ELSE FAIL.
[FORBIDDEN][OOF-981] Depicting above-ground levels as "hangar", "garage", or "field_engineering_barn"; ELSE FAIL.
[FORBIDDEN][OOF-982] Depicting the comms node as a demonstrative public tower; ELSE FAIL.
[FORBIDDEN][OOF-983] Introducing soft modals ("SHOULD/MAY/CAN/USUALLY") in normative sections; ELSE FAIL.

## NON-NORMATIVE


~~~
</file>

<file path="canon/CANON-METRICS-GLOBAL-2215-0002.md">
~~~markdown
---
id: CANON-METRICS-GLOBAL-2215-0002
title: >
  Метрики романа (2215) — правила использования чисел и upper-tail случаев
class: canon
status: draft
version: 2.2.0
inputs:
  - CANON-CORE-GLOBAL-2215-0001
  - SSOT-CONSISTENCY-A-2215-0009
depends_on:
  - SPEC-PRIORITY-RESOLUTION-2215-0001
scope: >
  RULE-канон использования числовых метрик в тексте: откуда берутся дефолты,
  как оформляются upper-tail случаи и какие процедурные последствия обязательны.
  Документ НЕ выбирает значения метрик и НЕ является точкой BIND.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: regulate narrative usage of numeric world metrics and enforce procedural reaction to upper-tail cases
INPUTS:
  - CANON-CORE-GLOBAL-2215-0001
  - SSOT-CONSISTENCY-A-2215-0009
  - SPEC-PRIORITY-RESOLUTION-2215-0001
OUTPUTS:
  - numeric_source_rules
  - upper_tail_rules
  - procedural_reaction_requirements
FORBIDDEN:
  - selected_value_definition
  - ssot_binding
  - invent_metrics
  - narrative_numbers_as_defaults

---

## DEFINITIONS

[FACT][MET-DEF-010] default_metric_value =
значение метрики, зафиксированное в CANON-CORE-GLOBAL-2215-0001.

[FACT][MET-DEF-011] narrative_number =
числовое утверждение о состоянии мира в сцене.

[FACT][MET-DEF-012] upper_tail_value =
значение метрики уровня p90 или иного верхнего хвоста.

[FACT][MET-DEF-013] upper_tail_case =
использование upper_tail_value через class: override
с обязательными процедурными последствиями.

[FACT][MET-DEF-014] narrative_lock =
флаг SSOT-CONSISTENCY, запрещающий upper-tail как фон
независимо от статуса DUAL_ALLOWED.

---

## INVARIANTS

[DECISION][MET-INV-001] Default metric values MUST be taken only from CANON-CORE-GLOBAL-2215-0001.

[DECISION][MET-INV-002] SSOT documents MUST NOT be used as direct sources
of background numeric defaults for scenes.

[DECISION][MET-INV-003] Any metric listed in
`CANON-CORE-GLOBAL-2215-0001.override_required_registry`
MUST NOT appear in narrative without an explicit `class: override` document.

[DECISION][MET-INV-004] Upper-tail values MUST NOT be used as neutral everyday background.

[DECISION][MET-INV-005] If SSOT metric has `narrative_lock = true`
THEN it MUST be treated as CANON for default usage,
even if SSOT status is DUAL_ALLOWED.

[DECISION][MET-INV-006] Any upper-tail usage under `narrative_lock = true`
MUST be handled as upper_tail_case with explicit override.

[FORBIDDEN][MET-INV-007] Introducing new global numeric metrics
not declared in SSOT or CANON-CORE-GLOBAL-2215-0001.

[FORBIDDEN][MET-INV-008] Implicit fallback to SSOT ranges
when CORE default is missing.

---

## CONTENT

### 1. Narrative number admissibility

[RULE][MET-010] IF narrative_number is present
THEN it MUST be tied to artifact OR log OR report
OR procedural action OR procedural consequence.

[RULE][MET-011] IF number is provided as author explanation
THEN it MUST NOT be included.

[RULE][MET-012] IF metric_value is mentioned
THEN source MUST be one of {class: override, CANON-CORE-GLOBAL-2215-0001}.

---

### 2. Upper-tail handling

[RULE][MET-020] IF value_category = upper_tail_value
THEN override_required = true.

[RULE][MET-021] IF metric has `narrative_lock = true`
AND value_category ≠ core
THEN override_required = true.

[RULE][MET-022] IF upper_tail_case = true
THEN localization MUST include
{place, time_window, regime, affected_system}.

[RULE][MET-023] IF upper_tail_case = true
THEN procedural_reaction MUST include ≥1 of
{order, audit, investigation, mode_restriction, jurisdiction_escalation}.

[RULE][MET-024] IF upper_tail_case = true
AND procedural_reaction is absent
THEN output MUST be treated as invalid.

---

### 3. Source precedence (numbers)

[RULE][MET-030] IF numeric_value_conflict = true
THEN resolution_order MUST follow SPEC-PRIORITY-RESOLUTION-2215-0001.

[RULE][MET-031] IF numeric_default_needed = true
THEN CANON-CORE-GLOBAL-2215-0001 MUST be the only default source.

[RULE][MET-032] IF SSOT is referenced for numbers
THEN it MAY be used only as admissible_range_context
AND MUST NOT set defaults.

---

## USAGE / RESOLUTION

[DECISION][MET-USE-010] Документ применяется ко всем сценам романа 2215
независимо от POV.

[DECISION][MET-USE-011] Любое нарушение правил этого документа
MUST трактоваться как ошибка генерации.

---

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-METRICS-GLOBAL-2215-0002
role_type: RULE
export:
  - rule_id: MET-INV-003
    intent: "Block usage of metrics requiring override without class: override doc"
    inputs: [override_required_registry, narrative_numbers]
    outputs: [override_violation]
  - rule_id: MET-INV-005
    intent: "Treat narrative_lock metrics as CANON defaults"
    inputs: [SSOT-CONSISTENCY]
    outputs: [default_usage_policy]
  - rule_id: MET-020
    intent: "Require override for any upper-tail value usage"
    inputs: [numeric_value, value_category]
    outputs: [override_required]
  - rule_id: MET-023
    intent: "Enforce procedural reaction for upper-tail cases"
    inputs: [upper_tail_case]
    outputs: [procedural_reaction_required]
~~~

---

## FORBIDDEN

[FORBIDDEN][MET-FBD-900] Selecting metric values (core/p90/range) in this document.
[FORBIDDEN][MET-FBD-901] Using SSOT as background default numeric source for scenes.
[FORBIDDEN][MET-FBD-902] Using upper-tail values without explicit override.
[FORBIDDEN][MET-FBD-903] Numeric infodumps outside procedural context.

---

## NON-NORMATIVE

(Empty by design)

~~~
</file>

<file path="canon/CANON-ORDERS-GLOBAL-2215-0003.md">
~~~markdown
---
id: CANON-ORDERS-GLOBAL-2215-0003
title: >
  Canon Orders — FSSU Warrants, Mandates, and Access Regimes (2215)
class: canon
status: draft
version: 1.1.0
inputs: []
depends_on:
  - SPEC-DOC-STYLE-2215-0001
  - CANON-CORE-GLOBAL-2215-0001
  - CANON-SYSTEMS-GLOBAL-2215-0001
  - CANON-CONFLICT-GLOBAL-2215-0001
  - CANON-FSSU-GLOBAL-2215-0005
scope: >
  Процедурный канон ФССУ: ордера, мандаты, уровни доступа, допустимость,
  экстерриториальные режимы и модель доказательств. Без ввода новых SSOT-метрик.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: define procedural authority model for FSSU orders, access tiers, admissibility
INPUTS:
  - CANON-CORE-GLOBAL-2215-0001
  - CANON-FSSU-GLOBAL-2215-0005
OUTPUTS:
  - access_tier_rules
  - order_taxonomy
  - escalation_rules
  - admissibility_rules
FORBIDDEN:
  - world_parameter_binding
  - scene_generation
  - baseline_defaults
  - new_world_metrics

---

## DEFINITIONS

[FACT][ORD-DEF-010] Order = формализованное разрешение на действие ФССУ, иначе недопустимое.
[FACT][ORD-DEF-011] Mandate = рамка кейса (объект, цель, пределы, срок), внутри которой выдаются ордера.
[FACT][ORD-DEF-012] JAP = Joint Access Protocol; совместная процедура доступа при разделённой юрисдикции.
[FACT][ORD-DEF-013] Extraterritory = режим доступа с задержками и фильтрами, но без отмены права.
[FACT][ORD-DEF-014] Chain_of_custody = непрерывный журнал владения и обращения артефактов.

---

## INVARIANTS

[DECISION][ORD-INV-010] Любое значимое действие ФССУ MUST ссылаться на order OR mandate OR emergency_exception.
[DECISION][ORD-INV-011] У ФССУ MUST NOT существовать абсолютные права без срока, периметра и журналирования.
[DECISION][ORD-INV-012] Экстерритория MUST изменять процедуру, но MUST NOT отменять применимое право.
[DECISION][ORD-INV-013] Доказательство MUST состоять из artifact + chain_of_custody + admissibility.
[DECISION][ORD-INV-014] Принуждение допустимо ONLY IF прямо указано в ордере и необходимо для допустимых целей.

---

## CONTENT

### 1. Access tiers

[RULE][ORD-TIER-100] IF access_tier = A THEN allowed_actions = {telemetry_request, aggregates, read_only_logs}.
[RULE][ORD-TIER-101] IF access_tier = A THEN forbidden_actions = {media_seizure, unmasked_personal_data, control_intervention}.
[RULE][ORD-TIER-102] IF access_tier = A THEN typical_duration = 72h.

[RULE][ORD-TIER-110] IF access_tier = B THEN allowed_actions = {site_access, node_inspection, state_capture, selective_logs}.
[RULE][ORD-TIER-111] IF access_tier = B THEN requires = {operator_notice, fixed_perimeter, participant_logging}.
[RULE][ORD-TIER-112] IF access_tier = B THEN typical_duration ∈ [7d, 14d].

[RULE][ORD-TIER-120] IF access_tier = C THEN allowed_actions = {media_seizure, configuration_freeze}.
[RULE][ORD-TIER-121] IF access_tier = C THEN requires = {chain_of_custody, cryptographic_snapshot, artifact_manifest}.
[RULE][ORD-TIER-122] IF access_tier = C THEN typical_duration = 30d_extendable.

[RULE][ORD-TIER-130] IF access_tier = D THEN allowed_actions = {mode_stop, forced_audit, control_switch, temporary_administration}.
[RULE][ORD-TIER-131] IF access_tier = D THEN condition = proven_systemic_harm.
[RULE][ORD-TIER-132] IF access_tier = D THEN duration.emergency ≤ 72h AND duration.planned = 7d.
[RULE][ORD-TIER-133] IF access_tier = D THEN force_allowed ONLY IF specified_in_order = true.
[RULE][ORD-TIER-134] IF access_tier = D THEN requires = {order_scope, logging, post_control, appeal_window}.

---

### 2. Order taxonomy

[RULE][ORD-TAX-201] O-01 = Data_Preservation_Order; goal = prevent_log_destruction.
[RULE][ORD-TAX-211] O-02 = Telemetry_Access_Order; goal = obtain_telemetry_with_minimization.
[RULE][ORD-TAX-221] O-03 = Site_Inspection_Order; goal = physical_or_logical_site_access.
[RULE][ORD-TAX-231] O-04 = Imaging_Snapshot_Order; goal = court_compatible_snapshot.
[RULE][ORD-TAX-241] O-05 = Seizure_Order; goal = seize_specific_assets_with_proportionality.
[RULE][ORD-TAX-251] O-05A = Detention_Order; goal = procedural_detention_not_punishment.
[RULE][ORD-TAX-261] O-06 = Temporary_Service_Restriction_Order.
[RULE][ORD-TAX-271] O-07 = Joint_Access_Protocol_Order.
[RULE][ORD-TAX-281] O-08 = Protective_Custody_Witness_Order.

[RULE][ORD-TAX-290] New_order_types MAY be added ONLY IF not expressible as combination of O-01…O-08.

---

### 3. Escalation

[RULE][ORD-ESC-300] IF anomaly_repeats ≥ 2 THEN escalation A_to_B = allowed.
[RULE][ORD-ESC-301] IF log_sabotage OR non_reproducible_config THEN escalation B_to_C = allowed.
[RULE][ORD-ESC-302] IF confirmed_systemic_harm THEN escalation C_to_D = allowed.
[RULE][ORD-ESC-303] Any_escalation REQUIRES written_basis AND case_log_entry.

---

### 4. Extraterritory handling

[RULE][ORD-EXT-400] Extraterritory MUST be treated as delay_and_filter_mode_not_lawlessness.
[RULE][ORD-EXT-401] Default_extraterritory_access MUST use JAP_over_solo_order.
[RULE][ORD-EXT-402] IF operator_delay > SLA THEN delay MUST be logged_as_noncompliance.

---

### 5. Evidence and admissibility

[RULE][ORD-EVD-510] Chain_of_custody MUST include {artifact_id, source, method, integrity_hash, access_log, storage}.
[RULE][ORD-EVD-520] Evidence inadmissible IF no_order OR perimeter_violation.
[RULE][ORD-EVD-521] IF evidence_challenged THEN legalization_via_court_or_regulator REQUIRED.

---

### 6. Emergency mode

[RULE][ORD-EMG-600] Emergency_condition = immediate_threat_to_humans_or_critical_infrastructure.
[RULE][ORD-EMG-601] Emergency MUST strengthen_procedure_not_cancel_it.
[RULE][ORD-EMG-602] Emergency_duration ≤ 72h.
[RULE][ORD-EMG-603] Emergency REQUIRES post_report AND proportionality_review AND retro_legalization_or_rollback.
[RULE][ORD-EMG-604] Emergency MUST NOT bypass extraterritory_rules_by_default.

---

## USAGE / RESOLUTION

[DECISION][ORD-USE-010] Документ обязателен для всех сцен с участием ФССУ.
[DECISION][ORD-USE-011] При конфликте применяется SPEC-PRIORITY-RESOLUTION-2215-0001.

---

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-ORDERS-GLOBAL-2215-0003
role_type: RULE
export:
  access_tiers: [A, B, C, D]
  order_codes: [O-01, O-02, O-03, O-04, O-05, O-05A, O-06, O-07, O-08]
  evidence_formula: "artifact + chain_of_custody + admissibility"
~~~

---

## FORBIDDEN

[FORBIDDEN][ORD-FBD-900] Absolute_rights_without_limits.
[FORBIDDEN][ORD-FBD-901] Scenes_without_order_mandate_or_emergency.
[FORBIDDEN][ORD-FBD-902] Emergency_as_procedure_bypass.
[FORBIDDEN][ORD-FBD-903] Introducing_new_SSOT_metrics.

---

## NON-NORMATIVE

(Empty by design)

~~~
</file>

<file path="canon/CANON-ORGS-2215-0001.md">
~~~markdown
---
id: CANON-ORGS-2215-0001
title: >
  Canon Organizations — Factions, Monopolies, and Structural Conflicts (2215)
class: canon
status: fixed
version: 1.2.0
inputs:
  - SSOT-ECONOMY-A-2215-0003
depends_on:
scope: >
  Реестр институциональных игроков: монополии, подрядчики, теневые структуры.
  Фиксирует внутренние фракции и структурные конфликты для сюжета.
---

## LLM-INTENT

ROLE_TYPE: STATE
SCOPE: registry of organizational entities, factions, and hidden agendas.
INPUTS: [SSOT-ECONOMY-A-2215-0003]
OUTPUTS: [organization_profiles, faction_map]
FORBIDDEN: [monolithic_entities, simplistic_villains, narrative_prose]

## DEFINITIONS

[FACT][ORG-DEF-010] Institutional Friction = конфликт департаментов одной организации с взаимоисключающими KPI.
[FACT][ORG-DEF-011] Proxy Actor = частная компания, действующая в интересах фракции госструктуры для обхода законов.

## INVARIANTS

[DECISION][ORG-INV-010] Каждая монополия содержит минимум две конфликтующие фракции.
[DECISION][ORG-INV-011] Организации действуют рационально в рамках своих KPI, а не из "злобы".

## CONTENT

### 1. The Monopolies (The Heavyweights)

[STATE][ORG-010] id=ORG-ROSE; name="RosEnergoAtom-IX"; domain="Energy"; role="Grid Monopoly".
[STATE][ORG-011] ORG-ROSE.vibe = "Technocratic feudalism".
[STATE][ORG-012] ORG-ROSE.faction_A = "The Core Guard (Engineers) — focus: stability, safety".
[STATE][ORG-013] ORG-ROSE.faction_B = "Export Directorate (Managers) — focus: profit, mining".
[STATE][ORG-014] ORG-ROSE.conflict = "Engineers leak data to FSSU to sabotage Managers".

[STATE][ORG-020] id=ORG-GOSP; name="GosPlan-Algorithmica"; domain="Planning"; role="KPI Setter".
[STATE][ORG-021] ORG-GOSP.vibe = "Inhuman mathematical absolute".
[STATE][ORG-022] ORG-GOSP.faction_A = "Purists — focus: absolute automation, infallibility".
[STATE][ORG-023] ORG-GOSP.faction_B = "Adjusters — focus: manual coefficients, hidden corruption".
[STATE][ORG-024] ORG-GOSP.relevance = "Glitch is caused by Faction A code ignoring Faction B patches".

[STATE][ORG-030] id=ORG-VODO; name="Vodocanal-Federal"; domain="Water/Biomass"; role="Circulation".
[STATE][ORG-031] ORG-VODO.vibe = "Silent, pervasive, biological".
[STATE][ORG-032] ORG-VODO.hidden_agenda = "Bio-data blackmail via sewage monitoring".

### 2. The Contractors (The Proxies)

[STATE][ORG-040] id=ORG-TLK; name="TransLogist-Kama"; domain="Logistics"; role="Last Mile Operator".
[STATE][ORG-041] ORG-TLK.status = "Squeezed between GosPlan quotas and physics".
[STATE][ORG-042] ORG-TLK.strategy = "Shadow Optimization (cutting corners to survive)".
[STATE][ORG-043] ORG-TLK.affiliation = "Proxy for RosEnergoAtom Export Directorate".

[STATE][ORG-050] id=ORG-SCM; name="StroyComposite-M"; domain="Materials"; role="Supplier".
[STATE][ORG-051] ORG-SCM.secret = "Recycles toxic exclusion-zone waste into building mats".

[STATE][ORG-055] id=ORG-BIO; name="BiFSSUfe-Systems"; domain="Health/Sensors"; role="Operator".
[STATE][ORG-056] ORG-BIO.vibe = "Clinical cynicism".

### 3. The Oversight & Intelligence

[STATE][ORG-060] id=ORG-FSSU; name="FSSU (Dept of Situation Analysis)"; role="Protagonist".
[STATE][ORG-061] ORG-FSSU.weakness = "Lack of direct jurisdiction over Monopolies".
[STATE][ORG-062] ORG-FSSU.tactics = "Information Warfare / Public Cost escalation".

[STATE][ORG-070] id=ORG-ARB; name="The Arbitrage"; domain="Justice"; role="AI Judge".
[STATE][ORG-071] ORG-ARB.characteristic = "Black Box decision weights".
[STATE][ORG-072] ORG-ARB.fear_factor = "Calculates humanity as non-profitable".

[STATE][ORG-080] id=ORG-INFO; name="InfoSfera-Public"; domain="Media"; role="Reality Filter".
[STATE][ORG-081] ORG-INFO.function = "Turns catastrophes into planned drills".

### 4. Shadow Actors (Act II+ Leverage)

[STATE][ORG-090] id=ORG-KAZ; name="Kazan-Silicon Exterritory"; domain="R&D"; role="Legal Void".
[STATE][ORG-091] ORG-KAZ.status = "Sovereign state inside the state".

[STATE][ORG-100] id=ORG-SOC; name="SocialCapital-Bank"; domain="Finance"; role="Debt Holder".
[STATE][ORG-101] ORG-SOC.power = "Instant Insolvency declaration (Citizenship annulment)".

## USAGE / RESOLUTION

[DECISION][ORG-USE-010] Conflicts MUST arise from inter-faction friction.
[DECISION][ORG-USE-011] Antagonists are usually Dept Heads fulfilling conflicting KPIs, not criminals.

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-ORGS-2215-0001
role_type: STATE
export:
  - metric: organization.profile
    owner_domain: GOVERNANCE
    values:
      id: ORG-010
      name: RosEnergoAtom-IX
      factions: [Core_Guard, Export_Directorate]
~~~

## FORBIDDEN

[FORBIDDEN][ORG-FBD-010] Portraying Monopolies as monolithic (everyone agrees).
[FORBIDDEN][ORG-FBD-011] Using generic names like "The Corporation".
[FORBIDDEN][ORG-FBD-012] Giving FSSU unlimited police powers.
~~~

~~~
</file>

<file path="canon/CANON-RECENT-20Y-MEMORY-PACK-2215-0001.md">
~~~markdown
---
id: CANON-RECENT-20Y-MEMORY-PACK-2215-0001
title: >
  Recent 20 Years Memory Pack — 2215 (Public Recall Anchors)
class: canon
status: fixed
version: 1.0.0
inputs: []
depends_on:
  - CANON-BASE-NARRATIVE-GLOBAL-2215-0001
  - CANON-BASE-RULE-GLOBAL-2215-0001
scope: >
  Якоря общественной памяти последних 20 лет (примерно 2195–2215) для диалогов,
  новостных вставок и сцен. Документ не исполняемый: не задаёт правил и параметров мира,
  а фиксирует общие референсы, к которым персонажи могут апеллировать.
---

## LLM-INTENT

ROLE_TYPE: INTERFACE
SCOPE: non-executable public-memory anchors for dialogue and scene references
INPUTS: [CANON-BASE-NARRATIVE-GLOBAL-2215-0001, CANON-BASE-RULE-GLOBAL-2215-0001]
OUTPUTS: [memory_anchor_id, reference_phrases, usage_guardrails]
FORBIDDEN: [world_parameter_binding, rule_enforcement, numeric_world_metrics, prose, mixed_role_types]

---

## DEFINITIONS

[FACT][MEM-DEF-010] memory_anchor = общеизвестный референс последних 20 лет, используемый как контекст без объяснений.
[FACT][MEM-DEF-011] reference_phrase = короткая устойчивая формула, узнаваемая в разговоре.
[FACT][MEM-DEF-012] newsroom_tag = нейтральная метка в стиле заголовка/рубрики.

[DECISION][MEM-DEF-020] Each memory_anchor MUST include at least one reference_phrase.
[DECISION][MEM-DEF-021] Anchors MUST be specified as ranges, not exact dates: year ∈ [2195, 2215].

---

## INVARIANTS

[DECISION][MEM-INV-010] This document MUST NOT be used to resolve canon conflicts.
[DECISION][MEM-INV-011] Anchors MUST be usable without exposition in-scene.
[DECISION][MEM-INV-012] Anchors MUST reinforce procedural and institutional tone.
[FORBIDDEN][MEM-INV-013] Turning anchors into lore dumps inside scenes.
[FORBIDDEN][MEM-INV-014] Anchors that imply world-ending collapse as default background.

---

## CONTENT

[FACT][MEM-001] memory_anchor_id = MEM-WATER-QUOTAS.
[FACT][MEM-002] anchor_window_years = x ∈ [2198, 2202] years.
[FACT][MEM-003] newsroom_tag = "Water Quota Window".
[FACT][MEM-004] reference_phrase = "временно по квоте".
[FACT][MEM-005] reference_phrase = "окна распределения воды".

[FACT][MEM-010] memory_anchor_id = MEM-BODY-REFORM.
[FACT][MEM-011] anchor_window_years = x ∈ [2204, 2206] years.
[FACT][MEM-012] newsroom_tag = "Body Rights Reform".
[FACT][MEM-013] reference_phrase = "после реформы тела".
[FACT][MEM-014] reference_phrase = "биоциркул теперь обязателен".

[FACT][MEM-020] memory_anchor_id = MEM-AUDIT-SHOCK.
[FACT][MEM-021] anchor_window_years = x ∈ [2208, 2210] years.
[FACT][MEM-022] newsroom_tag = "Audit Shock".
[FACT][MEM-023] reference_phrase = "после аудит-шока".
[FACT][MEM-024] reference_phrase = "с тех пор только через журнал".

[FACT][MEM-030] memory_anchor_id = MEM-SILENT-DISAPPEARANCE.
[FACT][MEM-031] anchor_window_years = x ∈ [2210, 2213] years.
[FACT][MEM-032] newsroom_tag = "Quiet Profession Sunset".
[FACT][MEM-033] reference_phrase = "их больше не учат".
[FACT][MEM-034] reference_phrase = "профессия ушла тихо".

[FACT][MEM-040] memory_anchor_id = MEM-NONWAR-CRISIS.
[FACT][MEM-041] anchor_window_years = x ∈ [2212, 2214] years.
[FACT][MEM-042] newsroom_tag = "Non-War Crisis".
[FACT][MEM-043] reference_phrase = "когда все ждали войну".
[FACT][MEM-044] reference_phrase = "кризис, который не случился".

[FACT][MEM-050] memory_anchor_id = MEM-TELEMETRY-RULESET.
[FACT][MEM-051] anchor_window_years = x ∈ [2206, 2211] years.
[FACT][MEM-052] newsroom_tag = "Telemetry Harmonization".
[FACT][MEM-053] reference_phrase = "после гармонизации телеметрии".
[FACT][MEM-054] reference_phrase = "город не всевидящий, просто журнал".

[FACT][MEM-060] memory_anchor_id = MEM-PARENTING-LICENSE-SHIFT.
[FACT][MEM-061] anchor_window_years = x ∈ [2209, 2212] years.
[FACT][MEM-062] newsroom_tag = "Parenting License Shift".
[FACT][MEM-063] reference_phrase = "после перекалибровки лицензий".
[FACT][MEM-064] reference_phrase = "алго-лицензия стала жёстче".

---

## USAGE / RESOLUTION

[DECISION][MEM-USE-010] Scenes MAY reference any memory_anchor via reference_phrase without explanation.
[DECISION][MEM-USE-011] If an anchor is referenced, the scene MUST not explain causes; it MAY show artifacts or procedures.
[DECISION][MEM-USE-012] News inserts MAY use newsroom_tag as headline label.
[FORBIDDEN][MEM-USE-013] Using memory anchors to introduce new world parameters.
[FORBIDDEN][MEM-USE-014] Using anchors as moral commentary.

---

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-RECENT-20Y-MEMORY-PACK-2215-0001
role_type: INTERFACE
export:
  - memory_anchor_id: MEM-WATER-QUOTAS
    window_years: [2198, 2202]
    newsroom_tag: Water Quota Window
    reference_phrases: ["временно по квоте", "окна распределения воды"]
  - memory_anchor_id: MEM-AUDIT-SHOCK
    window_years: [2208, 2210]
    newsroom_tag: Audit Shock
    reference_phrases: ["после аудит-шока", "с тех пор только через журнал"]
~~~

---

## FORBIDDEN

[FORBIDDEN][MEM-FBD-010] Converting anchors into long paragraphs.
[FORBIDDEN][MEM-FBD-011] Using anchors to justify numeric worldbuilding.
[FORBIDDEN][MEM-FBD-012] Mixed ROLE_TYPE content inside this document.
[FORBIDDEN][MEM-FBD-013] Floating bullets without statement IDs.

---

## NON-NORMATIVE

Anchors are meant to be dropped into dialogue as if everyone already knows them.
They should surface as irritation, shorthand, or procedural reflex—not as exposition.

~~~
</file>

<file path="canon/CANON-REPORTS-GLOBAL-2215-0006.md">
~~~markdown
---
id: CANON-REPORTS-GLOBAL-2215-0006
title: >
  Артефакты ФССУ — форматы отчётов, реестров и причинных карт (2215)
class: canon
status: draft
version: 0.3.1
prefix: REP
doc_language: ru-RU
prose_language: ru-RU
inputs:
  - CANON-ORDERS-GLOBAL-2215-0003
  - CANON-FSSU-GLOBAL-2215-0005
  - CANON-ZONES-GLOBAL-2215-0004
depends_on:
  - SPEC-DOC-STYLE-2215-0001
  - SPEC-PRIORITY-RESOLUTION-2215-0001
scope: >
  RULE-канон форматов артефактов ФССУ: минимально достаточные структуры для сцен,
  обязательные поля, связи с ордерами/мандатами, и правила допустимости (chain-of-custody).
  Без новых SSOT-метрик и без художественного текста.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: define mandatory structures and admissibility rules for FSSU case artifacts (CD/EL/CM/FM/RP/PRS)
INPUTS:
  - CANON-FSSU-GLOBAL-2215-0005
  - CANON-ORDERS-GLOBAL-2215-0003
  - CANON-ZONES-GLOBAL-2215-0004
OUTPUTS:
  - artifact_header_schema
  - artifact_type_schemas
  - admissibility_rules
  - scene_excerpt_rules
FORBIDDEN:
  - invent_new_ssot_metrics
  - narrative_prose
  - full_length_documents_in_scene
  - redefine_orders_taxonomy

## DEFINITIONS

[FACT][REP-010] `artifact_type` ∈ {CD, EL, CM, FM, RP, PRS}.
[FACT][REP-011] `CD` = Case Docket; timeline of actions/decisions for a case.
[FACT][REP-012] `EL` = Evidence Ledger; registry of evidence items with integrity and custody.
[FACT][REP-013] `CM` = Causal Map; claim graph CAUSE → MECHANISM → CONSEQUENCE with tests/counterfactuals.
[FACT][REP-014] `FM` = Findings Memo; memo summarizing established/not-established and requested actions.
[FACT][REP-015] `RP` = Remedy Package; measurable corrective measures with monitoring.
[FACT][REP-016] `PRS` = Public/Restricted Summary; public summary plus restricted annex when required.

[FACT][REP-017] `jurisdiction` ∈ {NORMAL, EXTRATERRITORIAL, MIXED}.
[FACT][REP-018] `classification` ∈ {PUBLIC, RESTRICTED, SECRET}.
[FACT][REP-019] `admissibility_status` ∈ {CLEAN, CONDITIONAL, CONTESTED}.
[FACT][REP-020] `admissibility_basis` ∈ {LAW, CONTRACT, JAP, EMERGENCY}.

[FACT][REP-021] `present(x)` = x exists AND x is non_empty.
[FACT][REP-022] `non_empty(x)` = x is not null AND x != "" AND (if x is list then len(x) > 0).

[FACT][REP-023] `case_id` = header.case_id string.
[FACT][REP-024] `artifact_id` = header.artifact_id string.
[FACT][REP-025] `artifact_serial` = two-digit string matching `^[0-9]{2}$`.
[FACT][REP-026] `evidence_id` = string matching `^E-[0-9]{3}$`.

[FACT][REP-027] `case_id.regex` = `^FSSU-2215-[A-Z]{2}-[0-9]{2}-[0-9]{4}$`.
[FACT][REP-028] `artifact_id.regex` = `^FSSU-2215-[A-Z]{2}-[0-9]{2}-[0-9]{4}-(CD|EL|CM|FM|RP|PRS)-[0-9]{2}$`.

[FACT][REP-029] `order_ref` = string token referencing an order identifier from `CANON-ORDERS-GLOBAL-2215-0003`.
[FACT][REP-030] `mandate_ref` = string token referencing a mandate identifier from `CANON-ORDERS-GLOBAL-2215-0003`.

[FACT][REP-031] `artifact_ref` = string matching `artifact_id.regex`.
[FACT][REP-032] `evidence_ref` = string `<EL_ARTIFACT_ID>#<EVIDENCE_ID>` where EL_ARTIFACT_ID matches `artifact_id.regex` AND ends with `-EL-<artifact_serial>` AND EVIDENCE_ID matches `evidence_id`.
[FACT][REP-033] `attachments` = header.attachments list where every item is either artifact_ref or evidence_ref.

[FACT][REP-034] `header` = object with mandatory fields defined by rules REP-100..REP-112.
[FACT][REP-035] `scope` = header.scope string (explicit perimeter string; non_empty).

[FACT][REP-036] `integrity_fixation_present` = bool: artifact must carry header.hash fixation when true.
[FACT][REP-037] `scope_touches_zone` = bool: scope crosses or touches any zone boundary (see `CANON-ZONES-GLOBAL-2215-0004`).
[FACT][REP-038] `JAP_required` = bool: admissibility requires JAP basis when true.
[FACT][REP-039] `full_artifact_body_shown` = bool: a scene shows a full artifact body (not excerpt) when true.

[FACT][REP-040] `evidence_item` = EL.items[] entry with evidence_id, integrity, custody_chain, and linked_orders.
[FACT][REP-041] `linked_orders` = list of order_ref.
[FACT][REP-042] `chain_of_custody` = ordered list of custody events for an evidence_item.

[FACT][REP-043] `scene_artifact_excerpts` = list of excerpt_item shown in a scene (empty list means “no excerpts”).
[FACT][REP-044] `scene_artifact_excerpts.count` = len(scene_artifact_excerpts).

[FACT][REP-045] `excerpt_item_type` ∈ {HEADER_FIELDS, ONE_EL_ITEM, ONE_CM_CLAIM, ONE_FM_REQUESTED_ACTION}.
[FACT][REP-046] `excerpt_item` = object {type: excerpt_item_type, ref: string}.
[FACT][REP-047] `paper_as_constraint_emphasis` = bool: scene enforces paperwork as constraint when true.

[FACT][REP-048] `no_order` = bool: relevant order_refs are absent for the intended action.
[FACT][REP-049] `no_EL_refs` = bool: relevant EL evidence_ref(s) are absent for the intended accusation/claim.
[FACT][REP-050] `no_procedural_action_claim_asserted` = bool: scene asserts “procedural action impossible due to no order”.
[FACT][REP-051] `no_accusation_claim_asserted` = bool: scene asserts “accusation impossible due to no EL refs”.

[FACT][REP-052] `publication_or_enforcement_attempted` = bool: scene attempts publish/enforce using conditional/contested evidence.
[FACT][REP-053] `publication_or_enforcement_blocked_or_deferred` = bool: attempted publish/enforce is blocked OR deferred by procedure.

[FACT][REP-054] `case_has_public_significance` = bool: case must have public summary when true.
[FACT][REP-055] `political_risk` = bool: political risk requires PRS when true.

[FACT][REP-056] `rollback_conditions_exist` = bool: RP contains rollback conditions when true.
[FACT][REP-057] `liability_shifted` = bool: RP shifts liability ownership when true.

[FACT][REP-058] `CM.node_type` ∈ {CAUSE, MECHANISM, CONSEQUENCE, COUNTERFACTUAL, TEST}.
[FACT][REP-059] `CM.formal_basis` ∈ {LAW, CONTRACT, STANDARD, EXCEPTION}.
[FACT][REP-060] `CM.confidence` ∈ {LOW, MEDIUM, HIGH}.

## INVARIANTS

[DECISION][REP-070] PASS IFF (status ∈ {draft, fixed, deprecated}); ELSE FAIL.
[DECISION][REP-071] PASS IFF (all applicable rules exported in OUTPUT CONTRACT are enforced by consumers); ELSE FAIL.
[DECISION][REP-072] PASS IFF (non_empty(header.mandate_refs) OR non_empty(header.order_refs)); ELSE FAIL.
[DECISION][REP-073] PASS IFF (full_artifact_body_shown = false); ELSE FAIL.
[DECISION][REP-074] PASS IFF (header.jurisdiction ∈ {NORMAL, EXTRATERRITORIAL, MIXED} AND header.admissibility_basis ∈ {LAW, CONTRACT, JAP, EMERGENCY}); ELSE FAIL.

## CONTENT

### 1. Global artifact header schema (applies to all artifact types)

[RULE][REP-100] PASS IFF present(header.case_id); ELSE FAIL.
[RULE][REP-101] PASS IFF present(header.artifact_id); ELSE FAIL.
[RULE][REP-102] PASS IFF (header.artifact_type ∈ {CD, EL, CM, FM, RP, PRS}); ELSE FAIL.
[RULE][REP-103] PASS IFF (header.classification ∈ {PUBLIC, RESTRICTED, SECRET}); ELSE FAIL.
[RULE][REP-104] PASS IFF present(header.created_at); ELSE FAIL.
[RULE][REP-105] PASS IFF (present(header.created_by.role) AND present(header.created_by.name_or_identifier)); ELSE FAIL.
[RULE][REP-106] PASS IFF present(header.mandate_refs); ELSE FAIL.
[RULE][REP-107] PASS IFF present(header.order_refs); ELSE FAIL.
[RULE][REP-108] PASS IFF present(header.scope); ELSE FAIL.
[RULE][REP-109] PASS IFF (integrity_fixation_present = false) OR present(header.hash); ELSE FAIL.
[RULE][REP-110] PASS IFF present(header.attachments); ELSE FAIL.
[RULE][REP-111] PASS IFF (header.jurisdiction ∈ {NORMAL, EXTRATERRITORIAL, MIXED}); ELSE FAIL.
[RULE][REP-112] PASS IFF (header.admissibility_basis ∈ {LAW, CONTRACT, JAP, EMERGENCY}); ELSE FAIL.

[FORBIDDEN][REP-120] Omitting jurisdiction when scope touches a zone boundary or a regime holder boundary.
[FORBIDDEN][REP-121] Including narrative justification paragraphs in header; only minimal rationale fields allowed.

### 2. Identifier formats

[RULE][REP-130] PASS IFF (header.case_id matches REP-027.case_id.regex); ELSE FAIL.
[RULE][REP-131] PASS IFF (header.artifact_id matches REP-028.artifact_id.regex); ELSE FAIL.

### 3. Case Docket (CD) schema

[RULE][REP-200] IF header.artifact_type = CD THEN PASS IFF (present(intent) AND intent = TIMELINE_OF_ACTIONS_AND_RATIONALE); ELSE FAIL.
[RULE][REP-201] PASS IFF (action_not_recorded_in_CD = false) OR (action_procedurally_vulnerable = true); ELSE FAIL.
[RULE][REP-202] IF header.artifact_type = CD THEN PASS IFF (every timeline_entry has {ts,type,summary,decision,actors}); ELSE FAIL.
[RULE][REP-203] IF header.artifact_type = CD THEN PASS IFF (for every timeline_entry where type = ORDER_ISSUED, present(order_ref) AND present(rationale_short)); ELSE FAIL.
[RULE][REP-204] IF header.artifact_type = CD THEN PASS IFF (exists a in header.attachments where a matches `.*-EL-[0-9]{2}$`); ELSE FAIL.
[RULE][REP-205] IF header.artifact_type = CD AND (scope_touches_zone = true OR JAP_required = true) THEN PASS IFF present(jurisdiction_note); ELSE FAIL.
[RULE][REP-206] IF header.artifact_type = CD AND (header.jurisdiction ∈ {EXTRATERRITORIAL, MIXED}) THEN PASS IFF present(JAP_requirement_or_admissibility_risk); ELSE FAIL.

### 4. Evidence Ledger (EL) schema

[RULE][REP-300] IF header.artifact_type = EL THEN PASS IFF (present(intent) AND intent = BIND_SOURCE_INTEGRITY_CUSTODY_ADMISSIBILITY); ELSE FAIL.
[RULE][REP-301] PASS IFF (claim_established = false) OR (EL_refs_missing = false); ELSE FAIL.

[RULE][REP-310] IF header.artifact_type = EL THEN PASS IFF (for every evidence_item, present(evidence_id) AND evidence_id matches REP-026.evidence_id); ELSE FAIL.
[RULE][REP-311] IF header.artifact_type = EL THEN PASS IFF (for every evidence_item, present(type)); ELSE FAIL.
[RULE][REP-312] IF header.artifact_type = EL THEN PASS IFF (for every evidence_item, present(source)); ELSE FAIL.
[RULE][REP-313] IF header.artifact_type = EL THEN PASS IFF (for every evidence_item, present(collected_at) AND present(collected_by.role) AND present(collected_by.name_or_identifier)); ELSE FAIL.
[RULE][REP-314] IF header.artifact_type = EL THEN PASS IFF (for every evidence_item, present(method)); ELSE FAIL.
[RULE][REP-315] IF header.artifact_type = EL THEN PASS IFF (for every evidence_item, present(integrity)); ELSE FAIL.
[RULE][REP-316] IF header.artifact_type = EL THEN PASS IFF (for every evidence_item, present(custody_chain) AND len(custody_chain) > 0); ELSE FAIL.
[RULE][REP-317] IF header.artifact_type = EL THEN PASS IFF (for every evidence_item, present(linked_orders) AND len(linked_orders) > 0); ELSE FAIL.
[RULE][REP-318] IF header.artifact_type = EL THEN PASS IFF (for every evidence_item, admissibility_status ∈ {CLEAN, CONDITIONAL, CONTESTED}); ELSE FAIL.
[RULE][REP-319] IF header.artifact_type = EL THEN PASS IFF (for every evidence_item where admissibility_status != CLEAN, present(admissibility_notes) AND len(admissibility_notes) > 0); ELSE FAIL.

[FORBIDDEN][REP-320] EL MUST NOT contain causal conclusions.

### 5. Causal Map (CM) schema

[RULE][REP-400] IF header.artifact_type = CM THEN PASS IFF (present(intent) AND intent = TESTABLE_CAUSAL_STRUCTURE_FROM_EVIDENCE); ELSE FAIL.
[RULE][REP-401] IF header.artifact_type = CM THEN PASS IFF (present(claims) AND present(tests)); ELSE FAIL.

[RULE][REP-410] IF header.artifact_type = CM THEN PASS IFF (every claim.type ∈ {CAUSE, MECHANISM, CONSEQUENCE, COUNTERFACTUAL, TEST}); ELSE FAIL.
[RULE][REP-411] IF header.artifact_type = CM THEN PASS IFF (every claim has {claim_id,type,claim_text,evidence_refs,confidence,open_questions}); ELSE FAIL.
[RULE][REP-412] IF header.artifact_type = CM THEN PASS IFF (for every claim where type = MECHANISM, present(owner) AND present(formal_basis)); ELSE FAIL.
[RULE][REP-413] IF header.artifact_type = CM THEN PASS IFF (formal_basis ∈ {LAW, CONTRACT, STANDARD, EXCEPTION}); ELSE FAIL.
[RULE][REP-414] IF header.artifact_type = CM THEN PASS IFF (every test has {test_id,counterfactual,method,required_evidence_refs,status}); ELSE FAIL.

[FORBIDDEN][REP-420] CM MUST NOT assert causality without evidence_refs.
[FORBIDDEN][REP-421] CM MUST NOT use correlation_implies_cause without explicit tests.

### 6. Findings Memo (FM) schema

[RULE][REP-500] IF header.artifact_type = FM THEN PASS IFF (present(intent) AND intent = CONCISE_MEMO_FOR_LEADERSHIP_OR_REGULATOR); ELSE FAIL.
[RULE][REP-501] IF header.artifact_type = FM THEN PASS IFF (exists a in header.attachments where a matches `.*-(CM|EL)-[0-9]{2}($|#)`); ELSE FAIL.
[RULE][REP-502] IF header.artifact_type = FM THEN PASS IFF present(summary.established); ELSE FAIL.
[RULE][REP-503] IF header.artifact_type = FM THEN PASS IFF present(summary.not_established); ELSE FAIL.
[RULE][REP-504] IF header.artifact_type = FM THEN PASS IFF present(requested_actions); ELSE FAIL.
[RULE][REP-505] IF header.artifact_type = FM THEN PASS IFF present(gaps_in_causality); ELSE FAIL.

### 7. Remedy Package (RP) schema

[RULE][REP-600] IF header.artifact_type = RP THEN PASS IFF (present(intent) AND intent = MEASURABLE_CORRECTIVE_MEASURES_WITH_VERIFICATION); ELSE FAIL.
[RULE][REP-601] IF header.artifact_type = RP THEN PASS IFF (present(measures) AND len(measures) > 0 AND every measure has {measure_id,type,description,owner,verification}); ELSE FAIL.
[RULE][REP-602] IF header.artifact_type = RP THEN PASS IFF (every measure.verification has {window,criteria_list}); ELSE FAIL.
[RULE][REP-603] IF header.artifact_type = RP THEN PASS IFF (rollback_conditions_exist = false) OR present(rollback_conditions); ELSE FAIL.
[RULE][REP-604] IF header.artifact_type = RP THEN PASS IFF (liability_shifted = false) OR present(liability_owner); ELSE FAIL.

[FORBIDDEN][REP-605] RP MUST NOT contain non_checkable measures (do_better).

### 8. Public/Restricted Summary (PRS) schema

[RULE][REP-700] IF header.artifact_type = PRS THEN PASS IFF (case_has_public_significance = true OR political_risk = true); ELSE FAIL.
[RULE][REP-701] IF header.artifact_type = PRS THEN PASS IFF (present(public_part.what_happened) AND present(public_part.actions_taken) AND present(public_part.guarantees)); ELSE FAIL.
[RULE][REP-702] IF header.artifact_type = PRS THEN PASS IFF (present(restricted_annex.EL_full_refs) AND present(restricted_annex.CM_full_refs) AND present(restricted_annex.signer_identities)); ELSE FAIL.

[FORBIDDEN][REP-703] PRS public_part MUST NOT disclose sensitive operational details.

### 9. Scene excerpt rules (packing)

[RULE][REP-800] PASS IFF (scene_artifact_excerpts.count = 0) OR (scene_artifact_excerpts.count ∈ [1,2] AND for every excerpt_item, excerpt_item.type ∈ {HEADER_FIELDS, ONE_EL_ITEM, ONE_CM_CLAIM, ONE_FM_REQUESTED_ACTION}); ELSE FAIL.
[RULE][REP-801] PASS IFF paper_as_constraint_emphasis = true; ELSE FAIL.
[RULE][REP-802] PASS IFF (no_procedural_action_claim_asserted = false) OR (no_order = true); ELSE FAIL.
[RULE][REP-803] PASS IFF (no_accusation_claim_asserted = false) OR (no_EL_refs = true); ELSE FAIL.
[RULE][REP-804] IF admissibility_status ∈ {CONDITIONAL, CONTESTED} AND publication_or_enforcement_attempted = true THEN PASS IFF publication_or_enforcement_blocked_or_deferred = true; ELSE FAIL.

[FORBIDDEN][REP-810] Scenes MUST NOT include full artifact bodies; only excerpts allowed.

## USAGE / RESOLUTION

[DECISION][REP-900] Consumers MUST treat only OUTPUT CONTRACT export as consumable semantics for this document; ELSE FAIL.
[DECISION][REP-901] PASS IFF (if a scene introduces an FSSU claim then evidence_ref(s) and order/method basis are present in shown excerpts); ELSE FAIL.
[DECISION][REP-902] PASS IFF (if scope touches extraterritorial zone then header.jurisdiction and header.admissibility_basis are present and admissibility_basis ∈ {JAP, CONTRACT} when applicable); ELSE FAIL.
[DECISION][REP-903] PASS IFF (if any mandatory header field cannot be satisfied then scene_artifact_excerpts.count = 0); ELSE FAIL.
[DECISION][REP-904] Conflict resolution MUST follow SPEC-PRIORITY-RESOLUTION-2215-0001; ELSE FAIL.

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-REPORTS-GLOBAL-2215-0006
role_type: RULE
export:
  - rule_id: REP-100
    intent: "header.case_id present"
    inputs: [header]
    outputs: [artifact_valid]
  - rule_id: REP-101
    intent: "header.artifact_id present"
    inputs: [header]
    outputs: [artifact_valid]
  - rule_id: REP-102
    intent: "header.artifact_type enum valid"
    inputs: [header]
    outputs: [artifact_valid]
  - rule_id: REP-103
    intent: "header.classification enum valid"
    inputs: [header]
    outputs: [artifact_valid]
  - rule_id: REP-104
    intent: "header.created_at present"
    inputs: [header]
    outputs: [artifact_valid]
  - rule_id: REP-105
    intent: "header.created_by fields present"
    inputs: [header]
    outputs: [artifact_valid]
  - rule_id: REP-106
    intent: "header.mandate_refs present"
    inputs: [header]
    outputs: [artifact_valid]
  - rule_id: REP-107
    intent: "header.order_refs present"
    inputs: [header]
    outputs: [artifact_valid]
  - rule_id: REP-108
    intent: "header.scope present"
    inputs: [header]
    outputs: [artifact_valid]
  - rule_id: REP-109
    intent: "header.hash required when integrity_fixation_present"
    inputs: [header, integrity_fixation_present]
    outputs: [artifact_valid]
  - rule_id: REP-110
    intent: "header.attachments present"
    inputs: [header]
    outputs: [artifact_valid]
  - rule_id: REP-111
    intent: "header.jurisdiction enum valid"
    inputs: [header]
    outputs: [artifact_valid]
  - rule_id: REP-112
    intent: "header.admissibility_basis enum valid"
    inputs: [header]
    outputs: [artifact_valid]
  - rule_id: REP-130
    intent: "case_id format valid"
    inputs: [header.case_id]
    outputs: [artifact_valid]
  - rule_id: REP-131
    intent: "artifact_id format valid"
    inputs: [header.artifact_id]
    outputs: [artifact_valid]
  - rule_id: REP-200
    intent: "CD intent present and correct"
    inputs: [artifact]
    outputs: [cd_valid]
  - rule_id: REP-202
    intent: "CD timeline_entry required fields"
    inputs: [artifact.timeline]
    outputs: [cd_valid]
  - rule_id: REP-203
    intent: "CD order_issued entries have order_ref and rationale_short"
    inputs: [artifact.timeline]
    outputs: [cd_valid]
  - rule_id: REP-204
    intent: "CD references EL via attachments"
    inputs: [header.attachments]
    outputs: [cd_valid]
  - rule_id: REP-205
    intent: "CD has jurisdiction_note when zone/JAP involved"
    inputs: [artifact, scope_touches_zone, JAP_required]
    outputs: [cd_valid]
  - rule_id: REP-206
    intent: "CD has JAP risk note under extraterritorial/mixed"
    inputs: [artifact, header.jurisdiction]
    outputs: [cd_valid]
  - rule_id: REP-300
    intent: "EL intent present and correct"
    inputs: [artifact]
    outputs: [el_valid]
  - rule_id: REP-310
    intent: "EL evidence_id format"
    inputs: [artifact.items]
    outputs: [el_valid]
  - rule_id: REP-311
    intent: "EL item type present"
    inputs: [artifact.items]
    outputs: [el_valid]
  - rule_id: REP-312
    intent: "EL source present"
    inputs: [artifact.items]
    outputs: [el_valid]
  - rule_id: REP-313
    intent: "EL collected_at/by present"
    inputs: [artifact.items]
    outputs: [el_valid]
  - rule_id: REP-314
    intent: "EL method present"
    inputs: [artifact.items]
    outputs: [el_valid]
  - rule_id: REP-315
    intent: "EL integrity present"
    inputs: [artifact.items]
    outputs: [el_valid]
  - rule_id: REP-316
    intent: "EL custody_chain present and non-empty"
    inputs: [artifact.items]
    outputs: [el_valid]
  - rule_id: REP-317
    intent: "EL linked_orders present and non-empty"
    inputs: [artifact.items]
    outputs: [el_valid]
  - rule_id: REP-318
    intent: "EL admissibility_status enum valid"
    inputs: [artifact.items]
    outputs: [el_valid]
  - rule_id: REP-319
    intent: "EL conditional/contested requires admissibility_notes"
    inputs: [artifact.items]
    outputs: [el_valid]
  - rule_id: REP-400
    intent: "CM intent present and correct"
    inputs: [artifact]
    outputs: [cm_valid]
  - rule_id: REP-401
    intent: "CM contains claims and tests"
    inputs: [artifact]
    outputs: [cm_valid]
  - rule_id: REP-410
    intent: "CM claim node types enum valid"
    inputs: [artifact.claims]
    outputs: [cm_valid]
  - rule_id: REP-411
    intent: "CM claim required fields include evidence_refs and confidence"
    inputs: [artifact.claims]
    outputs: [cm_valid]
  - rule_id: REP-412
    intent: "CM mechanism claims include owner and formal_basis"
    inputs: [artifact.claims]
    outputs: [cm_valid]
  - rule_id: REP-413
    intent: "CM formal_basis enum valid"
    inputs: [artifact.claims]
    outputs: [cm_valid]
  - rule_id: REP-414
    intent: "CM test required fields"
    inputs: [artifact.tests]
    outputs: [cm_valid]
  - rule_id: REP-500
    intent: "FM intent present and correct"
    inputs: [artifact]
    outputs: [fm_valid]
  - rule_id: REP-501
    intent: "FM references CM/EL via attachments"
    inputs: [header.attachments]
    outputs: [fm_valid]
  - rule_id: REP-502
    intent: "FM summary.established present"
    inputs: [artifact.summary]
    outputs: [fm_valid]
  - rule_id: REP-503
    intent: "FM summary.not_established present"
    inputs: [artifact.summary]
    outputs: [fm_valid]
  - rule_id: REP-504
    intent: "FM requested_actions present"
    inputs: [artifact.requested_actions]
    outputs: [fm_valid]
  - rule_id: REP-505
    intent: "FM gaps_in_causality present"
    inputs: [artifact.gaps_in_causality]
    outputs: [fm_valid]
  - rule_id: REP-600
    intent: "RP intent present and correct"
    inputs: [artifact]
    outputs: [rp_valid]
  - rule_id: REP-601
    intent: "RP measures schema"
    inputs: [artifact.measures]
    outputs: [rp_valid]
  - rule_id: REP-602
    intent: "RP verification schema"
    inputs: [artifact.measures]
    outputs: [rp_valid]
  - rule_id: REP-603
    intent: "RP rollback conditions explicit when present"
    inputs: [artifact, rollback_conditions_exist]
    outputs: [rp_valid]
  - rule_id: REP-604
    intent: "RP liability owner explicit when shifted"
    inputs: [artifact, liability_shifted]
    outputs: [rp_valid]
  - rule_id: REP-700
    intent: "PRS allowed only under public significance or political risk"
    inputs: [artifact, case_has_public_significance, political_risk]
    outputs: [prs_valid]
  - rule_id: REP-701
    intent: "PRS public_part required fields"
    inputs: [artifact.public_part]
    outputs: [prs_valid]
  - rule_id: REP-702
    intent: "PRS restricted_annex required fields"
    inputs: [artifact.restricted_annex]
    outputs: [prs_valid]
  - rule_id: REP-800
    intent: "Scene excerpt density limited"
    inputs: [scene_artifact_excerpts]
    outputs: [scene_compliance]
  - rule_id: REP-801
    intent: "Scene emphasis paper_as_constraint"
    inputs: [paper_as_constraint_emphasis]
    outputs: [scene_compliance]
  - rule_id: REP-802
    intent: "No-order claim allowed only if no_order=true"
    inputs: [no_procedural_action_claim_asserted, no_order]
    outputs: [scene_compliance]
  - rule_id: REP-803
    intent: "No-EL-refs accusation claim allowed only if no_EL_refs=true"
    inputs: [no_accusation_claim_asserted, no_EL_refs]
    outputs: [scene_compliance]
  - rule_id: REP-804
    intent: "Conditional/contested blocks or defers publish/enforcement"
    inputs: [admissibility_status, publication_or_enforcement_attempted, publication_or_enforcement_blocked_or_deferred]
    outputs: [scene_compliance]
~~~

## FORBIDDEN

[FORBIDDEN][REP-950] Introducing new SSOT metrics or macro numbers inside artifacts.
[FORBIDDEN][REP-951] Using narrative prose to justify formats or decisions.
[FORBIDDEN][REP-952] Showing full-length artifacts in scenes instead of excerpts.
[FORBIDDEN][REP-953] Omitting chain-of-custody when an excerpt is used as evidence.
[FORBIDDEN][REP-954] Claiming causality in CM without EL evidence_refs and tests structure.

## NON-NORMATIVE

~~~json
{
  "intent": "TIMELINE_OF_ACTIONS_AND_RATIONALE",
  "header": {
    "case_id": "FSSU-2215-RU-16-0007",
    "artifact_id": "FSSU-2215-RU-16-0007-CD-01",
    "artifact_type": "CD",
    "classification": "RESTRICTED",
    "created_at": "2215-05-18T14:22:00+03:00",
    "created_by": { "role": "CASE_LEAD", "name_or_identifier": "..." },
    "mandate_refs": ["MANDATE-..."],
    "order_refs": ["O-01-DPO-...", "O-03-SIO-..."],
    "scope": "RU-16/CHELNY/Node-X/Perimeter-Y",
    "hash": "sha256:...",
    "attachments": ["FSSU-2215-RU-16-0007-EL-01"],
    "jurisdiction": "NORMAL",
    "admissibility_basis": "LAW"
  },
  "timeline": [
    {
      "ts": "2215-05-18T09:10:00+03:00",
      "type": "INTAKE",
      "summary": "Inbound anomaly signal ...",
      "decision": "Start triage",
      "actors": ["CASE_LEAD", "SYSTEMS_AUDITOR"]
    }
  ]
}
~~~

~~~json
{
  "intent": "BIND_SOURCE_INTEGRITY_CUSTODY_ADMISSIBILITY",
  "header": {
    "case_id": "FSSU-2215-RU-16-0007",
    "artifact_id": "FSSU-2215-RU-16-0007-EL-01",
    "artifact_type": "EL",
    "classification": "RESTRICTED",
    "created_at": "2215-05-18T15:05:00+03:00",
    "created_by": { "role": "FIELD_CUSTODIAN", "name_or_identifier": "..." },
    "mandate_refs": ["MANDATE-..."],
    "order_refs": ["O-01-DPO-...", "O-04-ISO-..."],
    "scope": "RU-16/CHELNY/Node-X/Data-Infra",
    "hash": "sha256:...",
    "attachments": [],
    "jurisdiction": "MIXED",
    "admissibility_basis": "JAP"
  },
  "items": [
    {
      "evidence_id": "E-001",
      "type": "LOG_BUNDLE",
      "source": { "entity": "Operator-X", "system": "SCADA-GW-3", "zone": "Z1" },
      "collected_at": "2215-05-18T14:50:00+03:00",
      "collected_by": { "role": "SYSTEMS_AUDITOR", "name_or_identifier": "..." },
      "method": "snapshot + hash + sealed export",
      "integrity": { "hash": "sha256:...", "signature": "sig:..." },
      "linked_orders": ["O-01-DPO-...", "O-04-ISO-..."],
      "custody_chain": [
        { "ts": "2215-05-18T14:52:00+03:00", "event": "SEALED", "by": "FIELD_CUSTODIAN" }
      ],
      "admissibility_status": "CONDITIONAL",
      "admissibility_notes": ["Extraterritorial zone; admissibility depends on JAP execution"]
    }
  ]
}
~~~

~~~
</file>

<file path="canon/CANON-ROLE-MIRON-FSSU-2215-0001.md">
~~~markdown
---
id: CANON-ROLE-MIRON-FSSU-2215-0001
title: >
  Роль — Мирон (ФССУ) — case owner, полномочия, ограничения, ответственность и культура (2215)
class: canon
status: draft
version: 1.0.0
prefix: OMR
doc_language: ru-RU
prose_language: ru-RU
inputs: []
depends_on:
  - CANON-FSSU-GLOBAL-2215-0005
  - CANON-FSSU-REGIONAL-RU16-2215-0001
  - CANON-FSSU-TEAM-STRUCT-2215-0001
  - CANON-SYSTEM-ONTOLOGY-2215-0001
  - SPEC-DOC-ID-2215-0001
  - SPEC-DOC-STYLE-2215-0001
  - SPEC-PRIORITY-RESOLUTION-2215-0001
scope: >
  RULE-канон роли Мирона как руководителя флагманской команды ФССУ (RU-16) и операционного владельца кейса.
  Фиксирует модель двойного подчинения, операционные полномочия, рамки принуждения,
  ответственность, ограничения и культурные инварианты принятия решений.
  Не задаёт локацию офиса и не описывает сценографию.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: define Miron role contract as FSSU flagship team lead and default case owner
INPUTS: [CANON-FSSU-GLOBAL-2215-0005, CANON-FSSU-REGIONAL-RU16-2215-0001, CANON-FSSU-TEAM-STRUCT-2215-0001]
OUTPUTS: [miron_authorities, miron_limits, miron_responsibility, miron_role_culture]
FORBIDDEN: [scene_text, narrative_prose, hiring_hr_details, undefined_terms]

## DEFINITIONS

[FACT][OMR-010] `miron` = руководитель флагманской проектной команды регионального отдела ФССУ (RU-16).
[FACT][OMR-020] `case_owner` = роль операционного владельца активированного кейса с персональной ответственностью (см. CANON-FSSU-TEAM-STRUCT-2215-0001).
[FACT][OMR-030] `functional_subordination` = функциональное подчинение профильным контурам ФССУ вне тактики активного кейса.
[FACT][OMR-040] `operational_subordination` = операционное подчинение внутри активного кейса по линии `case_owner`.
[FACT][OMR-050] `coercion_escalation` = эскалация принуждения как процедурного инструмента в рамках активного кейса (см. CANON-FSSU-GLOBAL-2215-0005).

## INVARIANTS

[DECISION][OMR-100] Мирон занимает постоянную должность руководителя флагманской команды регионального отдела ФССУ.
[DECISION][OMR-110] Мирон не является функциональным начальником профильных специалистов команды.
[DECISION][OMR-120] Мирон не является административным руководителем регионального отдела ФССУ.
[DECISION][OMR-130] Для активированного кейса Мирон является `case_owner` по умолчанию, если иной `case_owner` не назначен процедурно.

## CONTENT

### 1. Dual Subordination Model

[DECISION][OMR-200] Участники команды сохраняют `functional_subordination` профильным контурам ФССУ.
[DECISION][OMR-210] В рамках активного кейса участники команды находятся в `operational_subordination` Мирону как `case_owner`.
[FORBIDDEN][OMR-220] Функциональные руководители вмешиваются в тактическое управление активным кейсом как норма.

### 2. Operational Authorities

[DECISION][OMR-300] Мирон принимает решение о принятии кейса командой после проверки соответствия критериям юрисдикции ФССУ.
[DECISION][OMR-310] Мирон распределяет задачи между участниками команды в рамках компетенций.
[DECISION][OMR-320] Мирон определяет приоритеты работ и допустимые временные окна реакции.
[DECISION][OMR-330] Мирон является точкой синхронизации аналитического, процедурного, ИИ-контура и полевого ресурса в рамках кейса.
[DECISION][OMR-340] Мирон принимает решение о необходимости полевого вмешательства при недостаточности удалённой стабилизации.

### 3. Coercion and Procedural Constraints

[DECISION][OMR-400] Мирон имеет право инициировать `coercion_escalation` в рамках активного кейса.
[DECISION][OMR-410] Мирон не осуществляет санкционирование принуждения единолично вне процедурного контура и требований фиксации.
[DECISION][OMR-420] Мирон принимает решение об эскалации на основании текущей оценки Impact, юридической допустимости и доступности ресурса.
[DECISION][OMR-430] В экстренном режиме Мирон может инициировать немедленное вмешательство с последующей процедурной фиксацией.

[RULE][OMR-440] IF `coercion_escalation.initiated` = true THEN `procedural_form.required` MUST be true; ELSE FAIL.
[RULE][OMR-450] IF `decision.is_legal_significant` = true THEN `human_visa.required` MUST be true; ELSE FAIL.

### 4. Responsibility

[DECISION][OMR-500] Мирон несёт ответственность за выбор стратегии остановки режима и согласованность действий команды.
[DECISION][OMR-510] Мирон отвечает за полноту и связность доказательной базы кейса, обеспечивающей воспроизводимость причинности.
[DECISION][OMR-520] Мирон отвечает за формирование требований к исправлению и передачу их в ИИ-контур с последующей верификацией результата.
[DECISION][OMR-530] Мирон отвечает за закрытие кейса и перевод в режим мониторинга.

### 5. Limitations

[DECISION][OMR-600] Мирон не принимает кадровых решений по участникам команды.
[DECISION][OMR-610] Мирон не утверждает бюджеты и штатные изменения.
[DECISION][OMR-620] Мирон не ведёт политические и межведомственные переговоры как основную функцию роли.
[DECISION][OMR-630] Мирон не является конечной точкой ответственности перед Центром.

### 6. Interface with Regional Lead

[DECISION][OMR-700] Региональный руководитель ФССУ обеспечивает административное руководство отделом и политическое прикрытие работы команды.
[DECISION][OMR-710] Мирон докладывает региональному руководителю о статусе кейсов, рисках и необходимости эскалации.
[FORBIDDEN][OMR-720] Региональный руководитель вмешивается в тактические решения активного кейса как норма.

### 7. Role Culture

[DECISION][OMR-800] Мирон мыслит категориями режимов, каналов и рисков, сохраняя фокус на последствиях для людей, города и государства.
[DECISION][OMR-810] Мирон сочетает роль инженерного координатора и полевого лидера, принимая решения на уровне System и в условиях непосредственного риска.
[DECISION][OMR-820] Коммуникация Мирона с командой ориентирована на синхронизацию и персональную ответственность.
[DECISION][OMR-830] Мирон воспринимает команду как постоянный owning-контур города, а не как временную task-force.
[DECISION][OMR-840] Мирон осознаёт персональную ответственность за решения, включая решения об эскалации принуждения и допустимых потерях.
[DECISION][OMR-850] Мирон принимает решения на основе выводов ИИ и несёт ответственность за их визирование или отклонение.
[DECISION][OMR-860] Мирон осознанно допускает отклонение рекомендаций ИИ при наличии социальных, политических или гуманитарных рисков, выходящих за рамки формальной оптимальности.

[RULE][OMR-870] IF `ai_recommendation.rejected` = true THEN `rejection.reason_recorded` MUST be true; ELSE FAIL.

### 8. Role Invariant

[DECISION][OMR-900] Мирон является точкой операционного сведения System, государственной ответственности и физической реальности в управляемое решение.

## USAGE / RESOLUTION

[DECISION][OMR-950] Любая сцена, использующая роль Мирона в ФССУ, MUST следовать OMR-100..OMR-900; ELSE FAIL.
[DECISION][OMR-960] Conflict resolution MUST follow SPEC-PRIORITY-RESOLUTION-2215-0001; ELSE FAIL.

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-ROLE-MIRON-FSSU-2215-0001
role_type: RULE
export:
  - rule_id: OMR-130
    intent: default case owner assignment
    inputs: [case.active]
    outputs: [case_owner.default_holder]
  - rule_id: OMR-440
    intent: require procedural form when coercion escalation initiated
    inputs: [coercion_escalation.initiated]
    outputs: [procedural_form.required]
  - rule_id: OMR-450
    intent: require human visa for legal-significant decisions
    inputs: [decision.is_legal_significant]
    outputs: [human_visa.required]
  - rule_id: OMR-870
    intent: require recorded reason when rejecting AI recommendation
    inputs: [ai_recommendation.rejected]
    outputs: [rejection.reason_recorded]
~~~

## FORBIDDEN

[FORBIDDEN][OMR-980] Персонализация роли Мирона как “административного начальника отдела”; ELSE FAIL.
[FORBIDDEN][OMR-981] Представление Мирона как единолично санкционирующего принуждение вне процедурной формы; ELSE FAIL.
[FORBIDDEN][OMR-982] Представление решений как “принятых командой/ИИ” без носителя ответственности; ELSE FAIL.

## NON-NORMATIVE

~~~text
Документ намеренно не включает кадровые/бюджетные/политические полномочия:
они принадлежат административному контуру и региональному руководителю.
~~~

~~~
</file>

<file path="canon/CANON-ROLE-RINAT-FSSU-2215-0001.md">
~~~markdown
---
id: CANON-ROLE-RINAT-FSSU-2215-0001
title: >
  Роль — Ринат (ФССУ) — regional chief, политическое прикрытие, рамки риска и интерфейсы (2215)
class: canon
status: draft
version: 1.0.0
prefix: ORI
doc_language: ru-RU
prose_language: ru-RU
inputs: []
depends_on:
  - CANON-FSSU-GLOBAL-2215-0005
  - CANON-FSSU-REGIONAL-RU16-2215-0001
  - CANON-FSSU-TEAM-STRUCT-2215-0001
  - SPEC-DOC-ID-2215-0001
  - SPEC-DOC-STYLE-2215-0001
  - SPEC-PRIORITY-RESOLUTION-2215-0001
scope: >
  RULE-канон роли Рината как руководителя регионального отдела ФССУ (RU-16/CHELNY).
  Фиксирует: административные полномочия, политическое прикрытие флагманской команды,
  рамки допустимого риска, правила вмешательства в кейсы, интерфейсы с Центром и внешними контурами.
  Не описывает тактику активного кейса (она принадлежит case_owner).
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: define Rinat role contract as regional chief providing political shield and administrative governance for RU-16 FSSU
INPUTS: [CANON-FSSU-GLOBAL-2215-0005, CANON-FSSU-REGIONAL-RU16-2215-0001, CANON-FSSU-TEAM-STRUCT-2215-0001]
OUTPUTS: [rinat_authorities, rinat_limits, rinat_shield_rules, rinat_case_involvement_rules]
FORBIDDEN: [scene_text, narrative_prose, tactical_micro_management, undefined_terms]

## DEFINITIONS

[FACT][ORI-010] `rinat` = руководитель регионального отдела ФССУ в RU-16/CHELNY.
[FACT][ORI-020] `regional_chief` = роль административного управления отделом и внешних коммуникаций, обеспечивающая политическое прикрытие поля.
[FACT][ORI-030] `political_shield` = функция поглощения/переработки внешнего давления и легализации рамок работы флагманской команды.
[FACT][ORI-040] `risk_frame` = формализованная рамка допустимого риска (Safety_Impact / Sovereignty_Impact / политико-правовые ограничения).
[FACT][ORI-050] `tactical_micro_management` = вмешательство руководителя отдела в тактические решения активного кейса.

## INVARIANTS

[DECISION][ORI-100] Ринат MUST быть `regional_chief` регионального отдела ФССУ RU-16.
[DECISION][ORI-110] Основная функция Рината MUST быть `political_shield` для флагманской команды.
[FORBIDDEN][ORI-120] `tactical_micro_management` активного кейса как нормальная практика.
[DECISION][ORI-130] Ринат MUST быть основной внешней точкой коммуникации отдела с мэрией, регуляторами, операторами и Центром.

## CONTENT

### 1. Administrative Authorities

[DECISION][ORI-200] Ринат определяет административные рамки работы отдела: ресурсы, режимность, приоритеты портфеля кейсов.
[DECISION][ORI-210] Ринат утверждает `risk_frame` для работы отдела на горизонте недель/месяцев.
[DECISION][ORI-220] Ринат обеспечивает выполнение требований отчётности и аудита со стороны Центра без передачи тактического управления.

[RULE][ORI-230] IF `FSSU_center.request` = "tactical_micro_management" THEN `rinat.must_reject_request` MUST be true; ELSE FAIL.

### 2. Political Shield Function

[DECISION][ORI-300] Ринат принимает на себя внешние конфликты: политические, межведомственные и корпоративные.
[DECISION][ORI-310] Ринат обеспечивает “легальный периметр” работы команды: корректность форм, рамки доступа, режимность и публичные объяснения без раскрытия критичных деталей.

[RULE][ORI-320] IF `political_pressure_event` = true THEN `rinat.absorbs_pressure` MUST be true; ELSE FAIL.
[RULE][ORI-330] IF `political_pressure_event` = true THEN `field_team.tactics` MUST remain "case_owner_controlled"; ELSE FAIL.

### 3. Risk Frame Governance

[DECISION][ORI-400] Ринат устанавливает допустимые компромиссы между скоростью остановки режима и процедурной допустимостью.
[DECISION][ORI-410] Ринат фиксирует решения о принятии остаточного риска на уровне отдела, когда остановка режима частична.

[RULE][ORI-420] IF `case.requires_residual_risk_acceptance` = true THEN `risk_frame.acceptance_recorded` MUST be true; ELSE FAIL.

### 4. Case Intake Interface

[DECISION][ORI-500] Ринат является входным интерфейсом для части сигналов/кейсов через внешние контуры (мэрия, регуляторы, операторы, Центр).
[DECISION][ORI-510] Ринат перенаправляет входящие обращения в triage/конвейер отдела без подмены юрисдикционного критерия.

[RULE][ORI-520] IF `external_request.received` = true THEN `request.sent_to_triage` MUST be true; ELSE FAIL.
[RULE][ORI-530] IF `external_request.received` = true THEN `jurisdiction_gate` MUST remain "FSSU-300"; ELSE FAIL.

### 5. Case Involvement Rules

[DECISION][ORI-600] Участие Рината в активном кейсе является редким и происходит только при необходимости политико-правового решения или высокого суверенного риска.
[DECISION][ORI-610] Ринат вмешивается не в тактику, а в рамки: формы, доступы, межведомственные согласования, публичные последствия.

[RULE][ORI-620] IF `rinat.participates_in_case` = true THEN `participation.scope` MUST be one of {legal_frame, interagency_interface, political_shield, risk_frame}; ELSE FAIL.
[RULE][ORI-630] IF `rinat.participates_in_case` = true THEN `participation.scope` MUST NOT include "tactics"; ELSE FAIL.

### 6. Interface with Case Owner (Miron)

[DECISION][ORI-700] Ринат получает от `case_owner` статус, риски и запросы на эскалацию форм/ресурса.
[DECISION][ORI-710] Ринат обеспечивает для `case_owner` внешние условия работы: доступы, прикрытие, межведомственный ресурс.

[RULE][ORI-720] IF `case_owner.requests_escalation` = true THEN `rinat.must_review_request` MUST be true; ELSE FAIL.

## USAGE / RESOLUTION

[DECISION][ORI-950] Любая сцена, использующая роль Рината в ФССУ, MUST следовать ORI-100..ORI-720; ELSE FAIL.
[DECISION][ORI-960] Conflict resolution MUST follow SPEC-PRIORITY-RESOLUTION-2215-0001; ELSE FAIL.

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-ROLE-RINAT-FSSU-2215-0001
role_type: RULE
export:
  - rule_id: ORI-230
    intent: reject tactical micro-management requests from center
    inputs: [FSSU_center.request]
    outputs: [rinat.must_reject_request]
  - rule_id: ORI-320
    intent: absorb political pressure
    inputs: [political_pressure_event]
    outputs: [rinat.absorbs_pressure]
  - rule_id: ORI-420
    intent: require recorded risk acceptance
    inputs: [case.requires_residual_risk_acceptance]
    outputs: [risk_frame.acceptance_recorded]
  - rule_id: ORI-620
    intent: constrain scope of Rinat participation in case
    inputs: [rinat.participates_in_case]
    outputs: [participation.scope]
~~~

## FORBIDDEN

[FORBIDDEN][ORI-980] Представление Рината как тактического руководителя активного кейса; ELSE FAIL.
[FORBIDDEN][ORI-981] Представление “политического прикрытия” как отмены процедурной формы или ответственности; ELSE FAIL.
[FORBIDDEN][ORI-982] Подмена юрисдикционного критерия ФССУ внешним запросом/давлением; ELSE FAIL.

## NON-NORMATIVE

~~~text
Роль Рината — “щит и рамки”, а не “тактика и штурм”: он держит внешние контуры и риск-политику,
оставляя ведение кейса case_owner и флагманской команде.
~~~

~~~
</file>

<file path="canon/CANON-SCENE-RULESET-2215-0001.md">
~~~markdown
---
id: CANON-SCENE-RULESET-2215-0001
title: >
  Scene Ruleset Canon — deterministic semantics for TYPE C scene inputs (2215)
class: canon
status: draft
version: 0.1.0
inputs: []
depends_on:
  - SPEC-PRIORITY-RESOLUTION-2215-0001
  - SPEC-SCENE-CONTRACT-2215-0001
scope: >
  Normative RULE-set for interpreting class: scene documents as TYPE C inputs only.
  Defines non-diegetic invariants, placeholder policy, consumption boundaries, and
  leakage forbiddance. Contains no world facts and no story content.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: enforce deterministic interpretation and consumption of TYPE C scene cards
INPUTS: [SPEC-PRIORITY-RESOLUTION-2215-0001, SPEC-SCENE-CONTRACT-2215-0001]
OUTPUTS: [scene_input_semantics, placeholder_policy, export_only_consumption, forbidden_patterns]
FORBIDDEN: [invention, gap_filling, treating_scene_as_state, meta_diegesis, consuming_outside_exports]

## DEFINITIONS

[DECISION][SC-RULE-001] TYPE C = documents with `class: scene` used only as prose-engine inputs.
[DECISION][SC-RULE-002] CARD record = a statement inside TYPE C that constrains generation but does not define world truth.
[DECISION][SC-RULE-003] Meta-diegesis = any reference in prose to corpus artifacts (doc ids, YAML keys, file paths, section headers).
[DECISION][SC-RULE-004] Export-only consumption = the prose engine may consume only what the scene doc OUTPUT CONTRACT exports.
[DECISION][SC-RULE-005] Placeholder = a field value that signals missing data; allowed placeholder tokens are defined in this doc.

## INVARIANTS

[RULE][SC-RULE-010] IF `class: scene` THEN document role is TYPE C input ONLY; it MUST NOT be treated as TYPE B state.
[RULE][SC-RULE-020] IF consuming a TYPE C document THEN ONLY exported fields (per its OUTPUT CONTRACT) are consumable inputs.
[RULE][SC-RULE-030] IF a TYPE C value is not declared in ENTITIES/STATE/PROCEDURES THEN it MUST remain UNKNOWN or be omitted; it MUST NOT be invented.
[RULE][SC-RULE-040] IF content is under `## NON-NORMATIVE` THEN it is ignored for prose generation and ignored for binding decisions.

## CONTENT

### C1. Scene record semantics

[RULE][SC-RULE-100] Markers `[FACT]` and `[STATE]` inside TYPE C are interpreted as CARD records, not as world truth.
[RULE][SC-RULE-110] TYPE C statements may constrain prose (sequence, POV, location tokens, measurable fields) but MUST NOT introduce new canon facts.
[FORBIDDEN][SC-RULE-115] A prose engine MUST NOT promote any TYPE C statement into SSOT/BASELINE/CANON truth.

### C2. Placeholders and missing data

[RULE][SC-RULE-120] Ellipsis placeholders (`...` or `…`) are invalid anywhere inside TYPE C exported content.
[RULE][SC-RULE-121] Allowed placeholder token for missing scalar values is `UNKNOWN` (uppercase).
[RULE][SC-RULE-122] IF a field is optional AND missing data would cause invention risk THEN remove the field rather than provide a placeholder.
[FORBIDDEN][SC-RULE-125] Any placeholder other than `UNKNOWN` inside TYPE C exported content.

### C3. Non-diegetic boundary and leakage prevention

[RULE][SC-RULE-200] Corpus artifacts (doc ids, YAML keys, file paths, section header names) do not exist in the story world and MUST NOT appear in prose.
[RULE][SC-RULE-210] Forbidden token class for prose includes any identifier matching:
`(SSOT|CANON|SPEC|IDX|REG|PLAN|OVERRIDE)-[A-Z0-9-]+`.
[RULE][SC-RULE-220] Forbidden token class for prose includes YAML keys and delimiters: `id:`, `class:`, `status:`, `version:`, `inputs:`, `depends_on:`, `---`.
[RULE][SC-RULE-230] Forbidden token class for prose includes corpus UI headers: `LLM-INTENT`, `OUTPUT CONTRACT`, `USAGE / RESOLUTION`, `NON-NORMATIVE`.
[RULE][SC-RULE-240] Forbidden token class for prose includes file/path fragments: `.md`, `docs/`, `~~~`.

## USAGE / RESOLUTION

[DECISION][SC-RULE-300] Global document-class resolution order MUST be taken ONLY from `SPEC-PRIORITY-RESOLUTION-2215-0001`.
[FORBIDDEN][SC-RULE-301] Introducing an alternative global precedence chain in any TYPE C document or in this ruleset.
[RULE][SC-RULE-310] Intra-document reading order notes inside a scene doc are non-authoritative and MUST NOT override global resolution.
[RULE][SC-RULE-320] This ruleset constrains interpretation of TYPE C inputs; it does not define any world-state values.

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-SCENE-RULESET-2215-0001
role_type: RULE
export:
  - rule_id: SC-RULE-010
    intent: classify class: scene as TYPE C inputs only
    inputs: [scene_doc]
    outputs: [type_classification]
  - rule_id: SC-RULE-020
    intent: export-only consumption for TYPE C
    inputs: [scene_doc, scene_output_contract]
    outputs: [consumable_fields]
  - rule_id: SC-RULE-030
    intent: no invention; unknown-or-omit policy for missing declarations
    inputs: [type_c_value, entities_state_procedures]
    outputs: [unknown_or_omit]
  - rule_id: SC-RULE-120
    intent: forbid ellipsis placeholders in TYPE C exported content
    inputs: [scene_exported_content]
    outputs: [lint_violation]
  - rule_id: SC-RULE-200
    intent: forbid meta-diegesis leakage tokens in prose
    inputs: [prose_output]
    outputs: [lint_violation]
~~~

## FORBIDDEN

[FORBIDDEN][SC-RULE-900] Treating any TYPE C scene-card statement as a new SSOT/BASELINE/CANON fact.
[FORBIDDEN][SC-RULE-901] Consuming any part of a TYPE C document that is not exported by its OUTPUT CONTRACT.
[FORBIDDEN][SC-RULE-902] Filling gaps (entities, instruments, locations, procedures, numbers) not present in ENTITIES/STATE/PROCEDURES.
[FORBIDDEN][SC-RULE-903] Emitting doc ids, file paths, YAML tokens, or corpus section names in diegetic prose.
[FORBIDDEN][SC-RULE-904] Using `...` or `…` placeholders in TYPE C exported content.

## NON-NORMATIVE

(empty)

~~~
</file>

<file path="canon/CANON-SYSTEM-ONTOLOGY-2215-0001.md">
~~~markdown
---
id: CANON-SYSTEM-ONTOLOGY-2215-0001
title: >
  System Ontology — Definitions and World Invariants (2215)
class: canon
status: draft
version: 1.0.0
prefix: SONT
doc_language: ru-RU
prose_language: ru-RU
inputs:
  - CANON-CONFLICT-GLOBAL-2215-0001
  - CANON-SYSTEMS-GLOBAL-2215-0001
depends_on:
  - SPEC-DOC-STYLE-2215-0001
  - SPEC-PRIORITY-RESOLUTION-2215-0001
scope: >
  STATE-канон. Формальные определения примитивов System и инварианты среды.
  Не содержит процедур, полномочий, baseline-логики и причинно-следственных объяснений.
---

## LLM-INTENT

ROLE_TYPE: STATE
SCOPE: define System primitives and world invariants
INPUTS: [CANON-CONFLICT-GLOBAL-2215-0001, CANON-SYSTEMS-GLOBAL-2215-0001]
OUTPUTS: [system_primitives, world_invariants]
FORBIDDEN: [procedures, mandates, activation_logic, narrative_prose, numeric_parameters]

## DEFINITIONS

[FACT][SONT-010] `System` = критический социотехнический контур управления регионом или городом, включающий инфраструктуру, алгоритмы, KPI, автоматизацию, наблюдаемость и контуры доступа.
[FACT][SONT-020] `Systemic_Asset` = компонент System, нарушение которого изменяет Safety_Impact или Sovereignty_Impact.
[FACT][SONT-030] `Systemic_Channel` = способ воздействия на System через интерфейс, доступ, уязвимость, данные или цепочку поставки.
[FACT][SONT-040] `Systemic_Hazard` = режим System, при котором она производит или усиливает ущерб либо теряет управляемость.
[FACT][SONT-050] `Safety_Impact` = ущерб людям, организациям или инфраструктуре, вызванный Systemic_Hazard.
[FACT][SONT-060] `Sovereignty_Impact` = подрыв государственного суверенитета через потерю управляемости или доверенной наблюдаемости System.

## INVARIANTS

[DECISION][SONT-100] Примитивы SONT-010..SONT-060 MUST использоваться как базовые определения по всему корпусу.
[FORBIDDEN][SONT-110] Переопределение SONT-010..SONT-060 в других документах.
[FORBIDDEN][SONT-120] Трактовка System как субъекта, воли или намеренного врага.
[FORBIDDEN][SONT-130] Трактовка System как тождественной государству.
[DECISION][SONT-140] Любое вмешательство в System MUST трактоваться как изменение режимов System.
[DECISION][SONT-150] Устранение отдельного актора MUST NOT трактоваться как устранение Systemic_Hazard.

## CONTENT

### System

[STATE][SONT-200] System является доминирующей средой рисков и конфликтов.
[STATE][SONT-210] Сложность и связность System превышают возможности полного централизованного контроля.

### State

[STATE][SONT-300] Государство является легитимным регулятором System.
[STATE][SONT-310] Государство не обладает полнотой управления System.

### Corporations

[STATE][SONT-400] Корпорации адаптируются к режимам System и не контролируют её целиком.

### Society

[STATE][SONT-500] Люди являются операторами и носителями режимов System.
[STATE][SONT-510] Человек может выступать активным узлом Systemic_Channel.

### Hazard Origin

[STATE][SONT-600] Источник Systemic_Hazard может находиться как внутри государственных контуров, так и вне их.

## USAGE / RESOLUTION

[DECISION][SONT-800] Документы корпуса, использующие примитивы SONT-010..SONT-060, MUST разрешать их смысл через этот документ.
[DECISION][SONT-810] Разрешение конфликтов MUST следовать SPEC-PRIORITY-RESOLUTION-2215-0001.

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-SYSTEM-ONTOLOGY-2215-0001
role_type: STATE
export:
  - metric: system_primitives
    owner_domain: SYSTEM
    values:
      core: "SONT-010..SONT-060"
      p90: none
      range: none
    unit: none
  - metric: world_invariants
    owner_domain: SYSTEM
    values:
      core: "SONT-200..SONT-600"
      p90: none
      range: none
    unit: none
~~~

## FORBIDDEN

[FORBIDDEN][SONT-900] Процедуры, полномочия, ордера, процессы активации кейсов.
[FORBIDDEN][SONT-910] Baseline-значения, числовые параметры, эксплуатационные нормы.
[FORBIDDEN][SONT-920] Каузальные объяснения, нарративные описания и сценография.

## NON-NORMATIVE

~~~text
Источник: THESIS-SYSTEM-2215-0001, THESIS-STATE-SOCIETY-2215-0001.
Назначение: единый источник онтологических определений и инвариантов.
~~~

~~~
</file>

<file path="canon/CANON-SYSTEMS-GLOBAL-2215-0001.md">
~~~markdown
---
id: CANON-SYSTEMS-GLOBAL-2215-0001
title: >
  Canon Systems — Institutional and Engineering Contours (2215)
class: canon
status: fixed
version: 1.1.0
inputs: []
depends_on:
  - SPEC-DOC-STYLE-2215-0001
  - CANON-CORE-GLOBAL-2215-0001
  - CANON-CONFLICT-GLOBAL-2215-0001
scope: >
  Каноническая системная архитектура мира романа 2215: институциональные контуры,
  операторы критической инфраструктуры, экстерриториальные режимы,
  наблюдаемость, ответственность за ИИ и процедурные рычаги ФССУ.
  Документ НЕ выбирает числовые параметры мира.
---

## LLM-INTENT

ROLE_TYPE: STATE
SCOPE: define institutional and infrastructure system state for the world of 2215
INPUTS:
  - CANON-CORE-GLOBAL-2215-0001
OUTPUTS:
  - system_contours
  - operator_landscape
  - observability_model
  - ai_responsibility_model
FORBIDDEN:
  - world_parameter_binding
  - causal_chains
  - baseline_defaults
  - resolution_logic

---

## DEFINITIONS

[FACT][SYS-DEF-010] governance_macro_model = модель распределения полномочий центр–регионы.
[FACT][SYS-DEF-011] ci_operator = лицензированный оператор критической инфраструктуры.
[FACT][SYS-DEF-012] extraterritory = контрактный специальный режим с процедурными ограничениями доступа.
[FACT][SYS-DEF-013] observability_model = способ доступности и полноты данных о системе.
[FACT][SYS-DEF-014] ai_responsibility_model = схема распределения ответственности за решения ИИ.

---

## INVARIANTS

[DECISION][SYS-INV-010] Документ MUST наследовать фон мира из CANON-CORE-GLOBAL-2215-0001.
[DECISION][SYS-INV-011] Государство MUST сохранять примат легитимного принуждения.
[DECISION][SYS-INV-012] Операторы MUST действовать в лицензируемом и отзывном режиме.
[DECISION][SYS-INV-013] Экстерритория MUST NOT трактоваться как суверенитет.
[DECISION][SYS-INV-014] Наблюдаемость MUST NOT быть тотальной по умолчанию.
[DECISION][SYS-INV-015] ФССУ MUST функционировать как процедурный инструмент, а не универсальный орган.

---

## CONTENT

### 1. Governance architecture

[STATE][SYS-010] governance_macro_model = strong_center_with_regional_execution_by_standards.
[STATE][SYS-011] center_sets = {safety_standards, audit_requirements, interoperability_regimes, incident_regimes}.
[STATE][SYS-012] regions_execute = {dispatch_clusters, local_operations, contractors}.

---

### 2. Critical infrastructure operators

[STATE][SYS-020] ci_operator_count_range = [2, 4].
[STATE][SYS-021] ci_operator_domains = {
  energy_storage_distribution,
  connectivity_and_city_sensing,
  logistics_recycling_warehousing,
  medtech_reagents_optional
}.

[STATE][SYS-022] operator_obligations = {
  licensing_required,
  audit_trails_mandatory,
  inspections_possible,
  insurance_and_fines_applicable
}.

---

### 3. Primary location profile (Naberezhnye Chelny)

[STATE][SYS-030] chelny_node_type = hybrid_logistics_dominant_node.
[STATE][SYS-031] chelny_primary_functions = {
  materials_recycling,
  large_scale_warehousing,
  rail_river_autonomous_corridor_intersection,
  sensor_and_connectivity_service_capacity
}.
[STATE][SYS-032] chelny_secondary_features = {local_energy_buffers_optional}.

---

### 4. Extraterritorial regimes

[STATE][SYS-040] extraterritory_types = {industrial_logistics, rnd_biotech_med}.
[STATE][SYS-041] extraterritory_creation_basis = contract_center_region_operator.
[STATE][SYS-042] extraterritory_features = {
  accelerated_approvals,
  restricted_external_audit,
  special_reporting,
  FSSU_entry_by_incident_or_warrant
}.
[STATE][SYS-043] extraterritory_constraints = {
  licensed,
  bounded,
  auditable,
  state_intervention_on_risk
}.

---

### 5. Critical resources

[STATE][SYS-050] primary_critical_resources = {
  energy_storage_peak_power,
  observability_nodes
}.
[STATE][SYS-051] secondary_critical_resources = {
  medical_reagents_for_rnd_extraterritories
}.

---

### 6. Observability model

[STATE][SYS-060] observability_model = fragmented.
[STATE][SYS-061] observability_fragmentation_sources = {
  multi_operator_ownership,
  log_and_format_divergence,
  legal_access_boundaries
}.
[STATE][SYS-062] investigation_implications = {
  blind_zones_exist,
  data_delay_or_loss_possible,
  cross_operator_correlation_required
}.

---

### 7. Responsibility for AI decisions

[STATE][SYS-070] ai_responsibility_model = mixed.
[STATE][SYS-071] critical_decision_controls = {
  human_signatory,
  decision_logging,
  post_audit
}.
[STATE][SYS-072] critical_decision_domains = {
  life_and_health,
  hospital_energy_supply,
  evacuation
}.
[STATE][SYS-073] noncritical_liability_modes = {
  operator_liability,
  fines,
  license_actions,
  insurance
}.
[STATE][SYS-074] liability_architecture_patterns = {
  subcontracting_layers,
  spv_risk_shells,
  insurance_coverage,
  arbitration_over_personal_guilt
}.

---

### 8. FSSU levers and resistance

[STATE][SYS-080] FSSU_levers = {
  data_and_site_access_warrants,
  media_seizure,
  temporary_mode_suspension,
  regulatory_checks_or_license_actions,
  extraterritorial_mandates_on_incidents
}.
[STATE][SYS-081] FSSU_constraints = {
  approval_delays,
  jurisdiction_disputes,
  corporate_legal_resistance,
  private_security_within_limits,
  procedural_pressure
}.

---

### 9. Mobility profile (Chelni)

[STATE][SYS-090] chelny_mobility_profile = dense_city_low_private_car_dependency.
[STATE][SYS-091] mobility_modes = {
  public_transport,
  routed_capsules,
  autonomous_freight_corridors
}.

---

### 10. Open unknowns

[UNKNOWN][SYS-100] Specific operator and regulator identities.
[UNKNOWN][SYS-101] KPI formulas causing pathological optimization.
[UNKNOWN][SYS-102] Exact FSSU warrant issuance timings.
[UNKNOWN][SYS-103] Topology of key hubs and routes in Chelny.
[UNKNOWN][SYS-104] Threshold for center takeover of regional control.

---

## USAGE / RESOLUTION

[DECISION][SYS-USE-010] Документ используется как системное STATE-основание для CANON и SCENE.
[DECISION][SYS-USE-011] Любые процедурные правила MUST задаваться в RULE-документах.

---

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-SYSTEMS-GLOBAL-2215-0001
role_type: STATE
export:
  governance_macro_model: strong_center_with_regional_execution_by_standards
  ci_operator_count_range: [2, 4]
  extraterritory_types: [industrial_logistics, rnd_biotech_med]
  observability_model: fragmented
  ai_responsibility_model: mixed
  FSSU_levers:
    - data_and_site_access_warrants
    - media_seizure
    - temporary_mode_suspension
    - regulatory_checks_or_license_actions
~~~

---

## FORBIDDEN

[FORBIDDEN][SYS-FBD-900] Introducing_new_global_world_metrics.
[FORBIDDEN][SYS-FBD-901] Encoding_causality_chains_in_canon.
[FORBIDDEN][SYS-FBD-902] Treating_operators_as_sovereigns.
[FORBIDDEN][SYS-FBD-903] Assuming_total_observability_by_default.

---

## NON-NORMATIVE

(Empty by design)

~~~
</file>

<file path="canon/CANON-SYSTEM-VOICE-GLOBAL-2215-0001.md">
~~~markdown
---
id: CANON-SYSTEM-VOICE-GLOBAL-2215-0001
title: >
  Голос системы — допустимые системные вставки, формат, метрики и запреты (2215)
class: canon
status: draft
version: 0.3.0
inputs:
  - CANON-VOCAB-GLOBAL-2215-0001
  - CANON-REPORTS-GLOBAL-2215-0006
depends_on:
  - SPEC-DOC-STYLE-2215-0001
  - SPEC-PRIORITY-RESOLUTION-2215-0001
scope: >
  RULE-канон «голФССУ системы»: как показывать оптимизацию/наблюдаемость/комплаенс
  через краткие машинные вставки (уведомления/логи/рекомендации/строки отчёта),
  без очеловечивания. Фиксирует источники, типы событий, обязательные поля,
  допустимые метрики, стиль и запреты.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: define allowed system voice inserts and constrain schema, sources, events, metrics, and style
INPUTS:
  - CANON-VOCAB-GLOBAL-2215-0001
  - CANON-REPORTS-GLOBAL-2215-0006
OUTPUTS:
  - system_voice_schema
  - allowed_sources
  - allowed_events
  - allowed_metrics
  - insertion_rules
  - forbidden_patterns
FORBIDDEN:
  - personify_system
  - add_new_sources
  - expand_metrics_without_override
  - narrative_explanations
  - emotional_language

---

## DEFINITIONS

[FACT][SVO-DEF-010] system_voice_insert = machine_message excerpt (notification/log/recommendation/report_line).
[FACT][SVO-DEF-011] evidence_link = linkage via refs {case_id, evidence_refs[], order_refs[]} to FSSU artifacts.
[FACT][SVO-DEF-012] classification ∈ {public, restricted, secret}.
[FACT][SVO-DEF-013] confidence ∈ {low, med, high}.
[FACT][SVO-DEF-014] enum_expansion_requires = explicit_override_doc.

---

## INVARIANTS

[DECISION][SVO-INV-010] System voice MUST exist only as machine messages and MUST NOT be a character.
[DECISION][SVO-INV-011] Every insert MUST be short, procedural, and scope-checkable.
[DECISION][SVO-INV-012] Inserts MUST NOT replace FSSU work; causality MUST be established via CM/FM.

---

## CONTENT

### 1. Placement, density, size

[RULE][SVO-010] Inserts SHOULD appear at escalation, allocation, procedural viscosity, or admissibility friction points.
[RULE][SVO-011] Insert frequency MUST NOT exceed 1 per 2–3 scenes.
[RULE][SVO-012] Exception: Acts III–IV MAY increase density under sustained crisis.
[RULE][SVO-013] One insert MUST be ≤ 14 visible lines in prose.

---

### 2. Source enum (locked)

[RULE][SVO-020] source MUST be one of {OPTIMIZER, OBSERVABILITY, COMPLIANCE, POLICY_ENGINE, DISPATCH, ARBITRATION_GATE, SAFETY_MONITOR}.
[FORBIDDEN][SVO-021] source outside enum.

---

### 3. Event enum (locked)

[RULE][SVO-030] event MUST be one of {
  inefficiency_detected,
  allocation_adjusted,
  priority_downgraded,
  constraint_binding,
  kpi_profile_applied,
  override_required,
  mitigation_applied,
  gap_detected,
  telemetry_conflict,
  evidence_sealed,
  retention_window,
  tamper_suspected,
  policy_violation,
  access_denied,
  access_granted_windowed,
  chain_of_custody_required,
  admissibility_risk,
  counterfactual_test_requested,
  test_passed,
  test_failed,
  correlation_detected
}.
[FORBIDDEN][SVO-031] event outside enum.

---

### 4. Minimal schema (required fields)

[RULE][SVO-040] Any insert MUST include fields {source, event, ts, scope, classification, statement, refs}.
[RULE][SVO-041] ts MUST be ISO8601 with timezone offset.
[RULE][SVO-042] scope MUST be explicit perimeter token.
[RULE][SVO-043] refs MUST be object and MAY include {case_id, evidence_refs[], order_refs[]}.

---

### 5. Allowed metrics and units

[RULE][SVO-050] Allowed KPI metrics = {kpi_profile_id, human_cost_weight, service_class, allocation_delta, sla_target, risk_score}.
[RULE][SVO-051] Allowed resource metrics = {power_kw, power_mw, energy_mwh, compute_units, bandwidth_gbps}.
[RULE][SVO-052] Allowed impact metrics MUST use {forecast_loss_units, unit}.
[RULE][SVO-053] unit MUST be one of {biomass, subject, service_minutes, critical_events}.

[FORBIDDEN][SVO-054] Natural-language loss phrasing inside inserts.

---

### 6. Statement style constraints

[RULE][SVO-060] statement MUST be 1–2 short sentences.
[RULE][SVO-061] statement MUST NOT use softeners; uncertainty MUST be expressed only via confidence or open_questions[].
[FORBIDDEN][SVO-062] Personhood language in any field: pronouns, emotions, metaphors, sarcasm, moral judgement.

---

### 7. Evidence integration rules

[RULE][SVO-070] IF insert is used as evidence THEN refs.evidence_refs MUST be present AND insert MUST be registered as EL item with type ∈ {telemetry, log, policy_record}.
[RULE][SVO-071] IF insert contains causal assertion THEN it MUST be represented as CM claim with claim_id and evidence_refs OR it MUST be downgraded to correlation_detected.

---

## USAGE / RESOLUTION

[DECISION][SVO-USE-010] Any scene with insert MUST record {source, event, scope, active_metric_or_constraint, linkage_target ∈ {CD, EL, CM, FM, RP}}.
[DECISION][SVO-USE-011] Insert validity check MUST verify enums, required schema fields, statement constraints, and forbidden patterns.
[DECISION][SVO-USE-012] Enum or metric expansion MUST be done ONLY via separate override doc.
[DECISION][SVO-USE-013] Conflict resolution MUST follow SPEC-PRIORITY-RESOLUTION-2215-0001.

---

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-SYSTEM-VOICE-GLOBAL-2215-0001
role_type: RULE
export:
  - rule_id: SVO-020
    intent: "Lock allowed source enum for system voice inserts"
    inputs: []
    outputs: [allowed_sources]
  - rule_id: SVO-030
    intent: "Lock allowed event enum for system voice inserts"
    inputs: []
    outputs: [allowed_events]
  - rule_id: SVO-040
    intent: "Enforce minimal required schema for any insert"
    inputs: []
    outputs: [system_voice_schema]
  - rule_id: SVO-050
    intent: "Restrict allowed metrics and units inside inserts"
    inputs: [CANON-VOCAB-GLOBAL-2215-0001]
    outputs: [allowed_metrics]
  - rule_id: SVO-060
    intent: "Constrain language/tone to non-personified procedural style"
    inputs: []
    outputs: [forbidden_patterns]
~~~

---

## FORBIDDEN

[FORBIDDEN][SVO-FBD-010] Insert that is not a machine message (narration/opinion/explanation).
[FORBIDDEN][SVO-FBD-011] Dialogue framing (system talks to characters).
[FORBIDDEN][SVO-FBD-012] Emotional, metaphorical, sarcastic, or moral language in inserts.
[FORBIDDEN][SVO-FBD-013] Non-enum source or event values without explicit override doc.
[FORBIDDEN][SVO-FBD-014] Metric expansion without explicit override doc.
[FORBIDDEN][SVO-FBD-015] Using inserts to explain the world instead of evidence/constraints.

---

## NON-NORMATIVE

~~~json
{
  "source": "OPTIMIZER",
  "event": "priority_downgraded",
  "ts": "2215-05-18T19:12:00+03:00",
  "scope": "RU-16/CHELNY/Node-HOSP-3/Power-Loop",
  "classification": "restricted",
  "kpi_profile_id": "KPI-ALPHA-12",
  "service_class": { "from": "A", "to": "C" },
  "constraint_binding": "power_cap",
  "forecast_loss_units": 3,
  "unit": "biomass",
  "decision": "accepted",
  "confidence": "high",
  "statement": "Service class downgraded under binding constraints. Forecast loss recorded.",
  "refs": { "case_id": "FSSU-2215-RU-16-0007", "evidence_refs": ["E-002"], "order_refs": [] }
}
~~~

~~~
</file>

<file path="canon/CANON-VIBE-FLOW-GLOBAL-2215-0001.md">
~~~markdown
---
id: CANON-VIBE-FLOW-GLOBAL-2215-0001
title: >
  Atmosphere Reference — Nujabes & Logic ("Solar Flow" Profile)
class: canon
status: draft
version: 1.0.2
prefix: FLOW
doc_language: ru-RU
prose_language: ru-RU
inputs:
  - CANON-VIBE-RESTLESS-GLOBAL-2215-0001
depends_on:
  - SPEC-DOC-ID-2215-0001
  - SPEC-DOC-STYLE-2215-0001
  - SPEC-PRIORITY-RESOLUTION-2215-0001
scope: >
  RULE-канон для сцен ясности, синхронизации мышления и исполнения без надрыва.
  Профиль активируется только при `scene.vibe == "FLOW"`. Без SSOT-метрик и
  без инфодампа.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: enforce flow constraints when scene.vibe == "FLOW"
INPUTS: [scene.inputs, scene.vibe, scene.tag.VIBE, scene.tag.TYPE, scene.sound_markers, scene.visual_markers, scene.directives, prose.text]
OUTPUTS: [flow_requirements, flow_marker_pools]
FORBIDDEN: [noir_cliches, gritty_bass_dominance, choppy_fragmentation, emotional_monologue_explaining_insight]

## DEFINITIONS

[FACT][FLOW-010] `scene.inputs` = список doc_id, явно подключённых сценой как входы.
[FACT][FLOW-011] `scene.vibe` = строковый токен активного vibe-профиля сцены.
[FACT][FLOW-012] `scene.tag.VIBE` = строковый alias; PASS IFF `scene.tag.VIBE == ""` OR `scene.tag.VIBE == scene.vibe`; ELSE FAIL.
[FACT][FLOW-013] `scene.tag.TYPE` = строковый токен подтипа FLOW-сцены.
[FACT][FLOW-014] `scene.sound_markers` = список токенов звуковых приёмов сцены.
[FACT][FLOW-015] `scene.visual_markers` = список токенов визуальных приёмов сцены.
[FACT][FLOW-016] `scene.directives` = список директив генерации прозы сцены.
[FACT][FLOW-017] `prose_text` = строка, равная `prose.text`.

[FACT][FLOW-030] `vibe_token` ∈ {"RESTLESS","KINETIC","FLOW","VELVET","VOID"}.
[FACT][FLOW-031] `is_defined(x)` = true IFF `x` существует AND `x != ""`; ELSE false.
[FACT][FLOW-032] `count(xs)` = целое число элементов в `xs`.
[FACT][FLOW-033] `contains(xs, x)` = true IFF `x` содержится в `xs`; ELSE false.
[FACT][FLOW-034] `all_in(xs, pool)` = true IFF ∀`e`∈`xs`: `e`∈`pool`; ELSE false.
[FACT][FLOW-035] `is_subset(required, actual)` = true IFF ∀`e`∈`required`: `contains(actual,e)`; ELSE false.
[FACT][FLOW-036] `contains_substring(text, token)` = true IFF `text` содержит `token` как подстроку; ELSE false.
[FACT][FLOW-037] `contains_none(text, pool)` = true IFF ∀`t`∈`pool`: NOT `contains_substring(text,t)`; ELSE false.
[FACT][FLOW-038] `in_inputs(inputs, doc_id)` = true IFF `doc_id` содержится в `inputs`; ELSE false.

## INVARIANTS

[RULE][FLOW-020] PASS IFF `scene.vibe ∈ vibe_token`; ELSE FAIL.
[RULE][FLOW-021] PASS IFF (`scene.tag.VIBE == ""`) OR (`scene.tag.VIBE == scene.vibe`); ELSE FAIL.
[RULE][FLOW-022] PASS IFF (NOT in_inputs(scene.inputs, "CANON-VIBE-FLOW-GLOBAL-2215-0001")) OR (scene.vibe == "FLOW"); ELSE FAIL.
[RULE][FLOW-023] PASS IFF (scene.vibe != "FLOW") OR is_defined(scene.tag.TYPE); ELSE FAIL.
[RULE][FLOW-024] PASS IFF (scene.vibe != "FLOW") OR (scene.tag.TYPE in flow_type_token_pool); ELSE FAIL.

## CONTENT

### 1) Pools (normative tokens)

~~~yaml
flow_type_token_pool:
  - INSIGHT
  - EXECUTION
  - REFLECTION

sound_marker_pool:
  - ORDERED_AMBIENT_TONES
  - CLEAN_TRANSIENTS_NO_GRIT
  - SOFT_REPEATABLE_TEXTURES

visual_marker_pool:
  - LOW_SUN_WARM_REFLECTION
  - MASSIVE_STABLE_MATERIALS
  - LOW_CONTRAST_CLARITY

required_directive_pool:
  - SENTENCE_MEDIUM_LONG_ALLOWED
  - LOGICAL_CASCADE_ALLOWED
  - FRAGMENTATION_FORBIDDEN
  - DIALOGUE_SHARED_CONTEXT_NO_EXPOSITION
  - HESITATION_MARKERS_FORBIDDEN

forbidden_lexeme_pool_ru:
  - "кислотный неон"
  - "грязный бас"
  - "тренч"
  - "гнилая подворотня"
~~~

### 2) Marker constraints

[RULE][FLOW-110] PASS IFF (scene.vibe != "FLOW") OR (count(scene.sound_markers) ∈ [1,2]); ELSE FAIL.
[RULE][FLOW-111] PASS IFF (scene.vibe != "FLOW") OR all_in(scene.sound_markers, sound_marker_pool); ELSE FAIL.

[RULE][FLOW-120] PASS IFF (scene.vibe != "FLOW") OR (count(scene.visual_markers) ∈ [1,2]); ELSE FAIL.
[RULE][FLOW-121] PASS IFF (scene.vibe != "FLOW") OR all_in(scene.visual_markers, visual_marker_pool); ELSE FAIL.

### 3) Directive constraints

[RULE][FLOW-130] PASS IFF (scene.vibe != "FLOW") OR is_subset(required_directive_pool, scene.directives); ELSE FAIL.

### 4) Lexeme constraints (decidable on prose_text)

[RULE][FLOW-140] PASS IFF (scene.vibe != "FLOW") OR (NOT is_defined(prose_text)) OR contains_none(prose_text, forbidden_lexeme_pool_ru); ELSE FAIL.

## USAGE / RESOLUTION

[DECISION][FLOW-200] This document applies ONLY IF `scene.vibe == "FLOW"`; ELSE PASS.
[DECISION][FLOW-201] Conflict resolution MUST follow `SPEC-PRIORITY-RESOLUTION-2215-0001`; ELSE FAIL.
[DECISION][FLOW-202] This doc MUST NOT change locality constraints; locality rules MUST be applied by location docs; ELSE FAIL.

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-VIBE-FLOW-GLOBAL-2215-0001
role_type: RULE
export:
  - rule_id: FLOW-022
    intent: "applicability bound to explicit scene.inputs + scene.vibe"
    inputs: [scene.inputs, scene.vibe]
    outputs: [flow_requirements]
  - rule_id: FLOW-024
    intent: "gate: FLOW requires scene.tag.TYPE in flow_type_token_pool"
    inputs: [scene.vibe, scene.tag.TYPE]
    outputs: [flow_requirements]
  - rule_id: FLOW-111
    intent: "restrict sound markers to pool and count 1..2"
    inputs: [scene.vibe, scene.sound_markers]
    outputs: [flow_requirements, flow_marker_pools]
  - rule_id: FLOW-121
    intent: "restrict visual markers to pool and count 1..2"
    inputs: [scene.vibe, scene.visual_markers]
    outputs: [flow_requirements, flow_marker_pools]
  - rule_id: FLOW-130
    intent: "require directive subset for FLOW prose/dialogue behavior"
    inputs: [scene.vibe, scene.directives]
    outputs: [flow_requirements]
  - rule_id: FLOW-140
    intent: "forbid noir lexemes in FLOW prose when prose_text is defined"
    inputs: [scene.vibe, prose.text]
    outputs: [flow_requirements]
config:
  flow_type_token_pool_ref: "CONTENT.flow_type_token_pool"
  sound_marker_pool_ref: "CONTENT.sound_marker_pool"
  visual_marker_pool_ref: "CONTENT.visual_marker_pool"
  required_directive_pool_ref: "CONTENT.required_directive_pool"
  forbidden_lexeme_pool_ru_ref: "CONTENT.forbidden_lexeme_pool_ru"
  vibe_field: "scene.vibe"
  vibe_alias_field: "scene.tag.VIBE"
~~~

## FORBIDDEN

[FORBIDDEN][FLOW-900] Consuming NON-NORMATIVE examples as rules.
[FORBIDDEN][FLOW-901] Applying FLOW constraints without `scene.vibe == "FLOW"`.

## NON-NORMATIVE

~~~text
Example intent (not normative):
- Insight resolves as a clean chain, not as emotional confession.
- The scene feels warm and clear, but not “touristic futurism”.
~~~

~~~
</file>

<file path="canon/CANON-VIBE-KINETIC-GLOBAL-2215-0001.md">
~~~markdown
---
id: CANON-VIBE-KINETIC-GLOBAL-2215-0001
title: >
  Atmosphere Reference — Benny Benassi & Dhany ("Kinetic / Pumping" Profile)
class: canon
status: draft
version: 1.0.1
prefix: KIN
doc_language: ru-RU
prose_language: ru-RU
inputs:
  - CANON-LOC-CHELNY-2215-0001
depends_on:
  - SPEC-DOC-ID-2215-0001
  - SPEC-DOC-STYLE-2215-0001
  - SPEC-PRIORITY-RESOLUTION-2215-0001
scope: >
  RULE-канон для сцен ночного драйва, высокоскоростного транзита, клубов и
  зон высокой плотности автоматики: ритм, свет, синтетические текстуры и
  роботизированная оптика. Без SSOT-метрик и без инфодампа.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: enforce kinetic/pumping constraints when scene.tag.VIBE == "KINETIC"
INPUTS: [scene.inputs, scene.tag.VIBE, scene.context, scene.sound_markers, scene.visual_markers, scene.directives, scene.affect.external, scene.affect.internal, prose.text]
OUTPUTS: [sound_marker_pool, visual_marker_pool, forbidden_lexeme_pool_ru, kinetic_requirements]
FORBIDDEN: [acoustic_warmth, irregular_rhythm, organic_chaos, comfort_silence, narrative_prose]

## DEFINITIONS

[FACT][KIN-010] `scene.inputs` = список doc_id, явно подключённых сценой как входы.
[FACT][KIN-011] `scene.tag.VIBE` = строковый тег профиля атмосферы сцены.
[FACT][KIN-012] `scene.context` = множество контекстных токенов сцены.
[FACT][KIN-013] `scene.sound_markers` = список токенов звуковых приёмов сцены.
[FACT][KIN-014] `scene.visual_markers` = список токенов визуальных приёмов сцены.
[FACT][KIN-015] `scene.directives` = список директив генерации прозы сцены.
[FACT][KIN-016] `prose_text` = строка, равная `prose.text`.
[FACT][KIN-017] `scene.affect.external` = внешний режим поведения персонажа (токен).
[FACT][KIN-018] `scene.affect.internal` = внутренний режим (токен).

[FACT][KIN-030] `defined_token(x)` = PASS IFF `x` существует и `x != ""`; ELSE FAIL.
[FACT][KIN-031] `list_count(xs)` = количество элементов в `xs`.
[FACT][KIN-032] `list_contains(xs, x)` = PASS IFF `x` содержится в `xs`; ELSE FAIL.
[FACT][KIN-033] `all_in_pool(xs, pool)` = PASS IFF ∀`e`∈`xs`: `e`∈`pool`; ELSE FAIL.
[FACT][KIN-034] `intersects(a, b)` = PASS IFF ∃`t`: `t`∈`a` AND `t`∈`b`; ELSE FAIL.
[FACT][KIN-035] `token_in_text(text, token)` = PASS IFF `text` содержит `token` как подстроку; ELSE FAIL.
[FACT][KIN-036] `no_token_in_text(text, pool)` = PASS IFF ∀`t`∈`pool`: NOT `token_in_text(text,t)`; ELSE FAIL.
[FACT][KIN-037] `doc_in_inputs(inputs, doc_id)` = PASS IFF `doc_id` содержится в `inputs`; ELSE FAIL.

## INVARIANTS

[RULE][KIN-020] PASS IFF (NOT doc_in_inputs(scene.inputs, "CANON-VIBE-KINETIC-GLOBAL-2215-0001")) OR (scene.tag.VIBE == "KINETIC"); ELSE FAIL.
[RULE][KIN-021] PASS IFF (scene.tag.VIBE != "KINETIC") OR intersects(scene.context, allowed_context_pool); ELSE FAIL.
[RULE][KIN-022] PASS IFF (scene.tag.VIBE != "KINETIC") OR (defined_token(prose_text) MUST PASS); ELSE FAIL.

## CONTENT

### 1. Pools (normative tokens)

~~~yaml
allowed_context_pool:
  - NIGHT_TRANSIT
  - HIGH_AUTOMATION_DENSITY
  - CLUB
  - TECH_TRANCE

sound_marker_pool:
  - SIDECHAIN_DUCKING_BACKGROUND
  - FOUR_ON_FLOOR_GRID
  - CLIPPED_TRANSIENTS
  - BITCRUSH_TEXTURE
  - MECHANICAL_SUBBASS
  - PROCEDURAL_BEEPS_AS_PERCUSSION

visual_marker_pool:
  - STROBE_OR_INTERMITTENT_LIGHT
  - SHARP_MOVING_SHADOWS
  - HIGH_GLOSS_COATED_METAL
  - WET_SURFACE_REFLECTIONS
  - HIGH_SATURATION_ACCENTS_ON_BLACK
  - CHROME_GLINTS_AS_SIGNAL

required_directive_pool:
  - STACCATO_SENTENCES
  - HOOK_LOOP_X3
required_hook_anchor_pool:
  - HOOK_ANCHOR_SOUND
  - HOOK_ANCHOR_LIGHT
  - HOOK_ANCHOR_MOTION
  - HOOK_ANCHOR_INTERFACE

forbidden_lexeme_pool_ru:
  - "мягкий"
  - "уютный"
  - "плавный"
  - "естественный"

comfort_silence_lexeme_pool_ru:
  - "успокаивающая тишина"
  - "тишина как отдых"
  - "тишина как покой"
~~~

### 2. Soundscape constraints

[RULE][KIN-110] PASS IFF (scene.tag.VIBE != "KINETIC") OR (list_count(scene.sound_markers) >= 1 AND list_count(scene.sound_markers) <= 3); ELSE FAIL.
[RULE][KIN-111] PASS IFF (scene.tag.VIBE != "KINETIC") OR all_in_pool(scene.sound_markers, sound_marker_pool); ELSE FAIL.
[RULE][KIN-112] PASS IFF (scene.tag.VIBE != "KINETIC") OR list_contains(scene.sound_markers, "SIDECHAIN_DUCKING_BACKGROUND"); ELSE FAIL.
[RULE][KIN-113] PASS IFF (scene.tag.VIBE != "KINETIC") OR list_contains(scene.sound_markers, "FOUR_ON_FLOOR_GRID"); ELSE FAIL.

### 3. Visual constraints

[RULE][KIN-120] PASS IFF (scene.tag.VIBE != "KINETIC") OR (list_count(scene.visual_markers) >= 1 AND list_count(scene.visual_markers) <= 3); ELSE FAIL.
[RULE][KIN-121] PASS IFF (scene.tag.VIBE != "KINETIC") OR all_in_pool(scene.visual_markers, visual_marker_pool); ELSE FAIL.
[RULE][KIN-122] PASS IFF (scene.tag.VIBE != "KINETIC") OR list_contains(scene.visual_markers, "STROBE_OR_INTERMITTENT_LIGHT"); ELSE FAIL.

### 4. Prose rhythm constraints (directive-driven)

[RULE][KIN-130] PASS IFF (scene.tag.VIBE != "KINETIC") OR list_contains(scene.directives, "STACCATO_SENTENCES"); ELSE FAIL.
[RULE][KIN-131] PASS IFF (scene.tag.VIBE != "KINETIC") OR list_contains(scene.directives, "HOOK_LOOP_X3"); ELSE FAIL.
[RULE][KIN-132] PASS IFF (scene.tag.VIBE != "KINETIC") OR intersects(scene.directives, required_hook_anchor_pool); ELSE FAIL.

### 5. Emotional framing constraints

[RULE][KIN-140] PASS IFF (scene.tag.VIBE != "KINETIC") OR (scene.affect.external == "ROBOTIC_PRECISION"); ELSE FAIL.
[RULE][KIN-141] PASS IFF (scene.tag.VIBE != "KINETIC") OR (scene.affect.internal == "HIGH_HEAT_UNDER_CONTROL"); ELSE FAIL.

### 6. Lexeme constraints (decidable on prose_text)

[RULE][KIN-150] PASS IFF (scene.tag.VIBE != "KINETIC") OR no_token_in_text(prose_text, forbidden_lexeme_pool_ru); ELSE FAIL.
[RULE][KIN-151] PASS IFF (scene.tag.VIBE != "KINETIC") OR no_token_in_text(prose_text, comfort_silence_lexeme_pool_ru); ELSE FAIL.

## USAGE / RESOLUTION

[DECISION][KIN-200] Scenes MUST treat this doc as applicable ONLY IF `scene.tag.VIBE == "KINETIC"`; ELSE PASS.
[DECISION][KIN-201] Conflict resolution MUST follow `SPEC-PRIORITY-RESOLUTION-2215-0001`; ELSE FAIL.
[DECISION][KIN-202] This doc MUST NOT override locality constraints; locality rules MUST be applied by location docs; ELSE FAIL.

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-VIBE-KINETIC-GLOBAL-2215-0001
role_type: RULE
export:
  - rule_id: KIN-020
    intent: "applicability: explicit scene.inputs implies VIBE==KINETIC"
    inputs: [scene.inputs, scene.tag.VIBE]
    outputs: [kinetic_requirements]
  - rule_id: KIN-021
    intent: "gate: kinetic allowed only for allowed_context_pool"
    inputs: [scene.tag.VIBE, scene.context]
    outputs: [kinetic_requirements]
  - rule_id: KIN-112
    intent: "require SIDECHAIN_DUCKING_BACKGROUND"
    inputs: [scene.sound_markers]
    outputs: [kinetic_requirements]
  - rule_id: KIN-122
    intent: "require STROBE_OR_INTERMITTENT_LIGHT"
    inputs: [scene.visual_markers]
    outputs: [kinetic_requirements]
  - rule_id: KIN-131
    intent: "require HOOK_LOOP_X3 directive"
    inputs: [scene.directives]
    outputs: [kinetic_requirements]
  - rule_id: KIN-150
    intent: "forbid comfort lexemes in kinetic prose"
    inputs: [prose.text]
    outputs: [forbidden_lexeme_pool_ru]
~~~

## FORBIDDEN

[FORBIDDEN][KIN-900] Consuming NON-NORMATIVE examples as rules.
[FORBIDDEN][KIN-901] Applying KINETIC constraints without `scene.tag.VIBE == "KINETIC"`.
[FORBIDDEN][KIN-902] Mixing multiple vibe profiles in one scene is forbidden by design intent (one scene = one vibe); violations MUST be rejected by scene schema gate.

## NON-NORMATIVE

~~~text
Reference mapping (examples only):
- "Satisfaction": mechanical push/pull + subbass dominance.
- "Hit My Heart": internal heat under robotic control.
- "Every Single Day": HOOK_LOOP_X3 with variation.
~~~

~~~
</file>

<file path="canon/CANON-VIBE-RESTLESS-GLOBAL-2215-0001.md">
~~~markdown
---
id: CANON-VIBE-RESTLESS-GLOBAL-2215-0001
title: >
  Atmosphere Reference — UNKLE ("Restless" Profile)
class: canon
status: draft
version: 0.2.1
prefix: RST
doc_language: ru-RU
prose_language: ru-RU
inputs:
  - CANON-ARTIFACT-SNIPPETS-GLOBAL-2215-0001
  - CANON-LOC-CHELNY-2215-0001
  - CANON-SYSTEM-VOICE-GLOBAL-2215-0001
depends_on:
  - SPEC-DOC-ID-2215-0001
  - SPEC-DOC-STYLE-2215-0001
  - SPEC-PRIORITY-RESOLUTION-2215-0001
scope: >
  RULE-канон базового “driving fatigue” профиля: поток действий + износ без
  мелодрамы, процедурность, инфраструктурный низкочастотный фон. Профиль
  активируется только при `scene.vibe == "RESTLESS"`. Без SSOT-метрик и
  без художественных объяснений.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: enforce restless constraints when scene.vibe == "RESTLESS"
INPUTS: [scene.inputs, scene.vibe, scene.tag.VIBE, scene.context, scene.sound_markers, scene.directives, prose.text]
OUTPUTS: [restless_requirements, restless_marker_pools]
FORBIDDEN: [lyrics_quotes, noir_cliches_as_default, essay_mode, system_anthropomorphism]

## DEFINITIONS

[FACT][RST-010] `scene.inputs` = список doc_id, явно подключённых сценой как входы.
[FACT][RST-011] `scene.vibe` = строковый токен активного vibe-профиля сцены.
[FACT][RST-012] `scene.tag.VIBE` = строковый alias; PASS IFF `scene.tag.VIBE == ""` OR `scene.tag.VIBE == scene.vibe`; ELSE FAIL.
[FACT][RST-013] `scene.context` = множество контекстных токенов сцены.
[FACT][RST-014] `scene.sound_markers` = список токенов звуковых приёмов сцены.
[FACT][RST-015] `scene.directives` = список директив генерации прозы сцены.
[FACT][RST-016] `prose_text` = строка, равная `prose.text`.

[FACT][RST-030] `vibe_token` ∈ {"RESTLESS","KINETIC","FLOW","VELVET","VOID"}.
[FACT][RST-031] `is_defined(x)` = true IFF `x` существует AND `x != ""`; ELSE false.
[FACT][RST-032] `count(xs)` = целое число элементов в `xs`.
[FACT][RST-033] `contains(xs, x)` = true IFF `x` содержится в `xs`; ELSE false.
[FACT][RST-034] `all_in(xs, pool)` = true IFF ∀`e`∈`xs`: `e`∈`pool`; ELSE false.
[FACT][RST-035] `is_subset(required, actual)` = true IFF ∀`e`∈`required`: `contains(actual,e)`; ELSE false.
[FACT][RST-036] `contains_substring(text, token)` = true IFF `text` содержит `token` как подстроку; ELSE false.
[FACT][RST-037] `contains_none(text, pool)` = true IFF ∀`t`∈`pool`: NOT `contains_substring(text,t)`; ELSE false.
[FACT][RST-038] `in_inputs(inputs, doc_id)` = true IFF `doc_id` содержится в `inputs`; ELSE false.

## INVARIANTS

[RULE][RST-020] PASS IFF `scene.vibe ∈ vibe_token`; ELSE FAIL.
[RULE][RST-021] PASS IFF (`scene.tag.VIBE == ""`) OR (`scene.tag.VIBE == scene.vibe`); ELSE FAIL.
[RULE][RST-022] PASS IFF (NOT in_inputs(scene.inputs, "CANON-VIBE-RESTLESS-GLOBAL-2215-0001")) OR (scene.vibe == "RESTLESS"); ELSE FAIL.

## CONTENT

### 1) Pools (normative tokens)

~~~yaml
sound_marker_pool:
  - INFRA_LOW_END_HUM
  - PROCEDURAL_TICK
  - FILTERED_INTERFACE_VOCALS

required_directive_pool:
  - SHORT_SENTENCES_DOMINANT
  - ACTION_PARAGRAPHS_1_TO_4_SENTENCES
  - BEND_RESEND_LOOP_ON_DENY
  - EXPLANATION_BLOCKS_FORBIDDEN
  - TEAM_DIALOGUE_UTILITARIAN

forbidden_lexeme_pool_ru:
  - "каждую ночь дождь"
  - "кислотный неон"
  - "тренч"
  - "город как живой"
  - "система злится"
~~~

### 2) Marker constraints

[RULE][RST-110] PASS IFF (scene.vibe != "RESTLESS") OR (count(scene.sound_markers) ∈ [1,3]); ELSE FAIL.
[RULE][RST-111] PASS IFF (scene.vibe != "RESTLESS") OR all_in(scene.sound_markers, sound_marker_pool); ELSE FAIL.
[RULE][RST-112] PASS IFF (scene.vibe != "RESTLESS") OR contains(scene.sound_markers, "INFRA_LOW_END_HUM"); ELSE FAIL.

### 3) Directive constraints

[RULE][RST-120] PASS IFF (scene.vibe != "RESTLESS") OR is_subset(required_directive_pool, scene.directives); ELSE FAIL.

### 4) Integration gates (explicit via directives)

[RULE][RST-130] PASS IFF (scene.vibe != "RESTLESS") OR (NOT contains(scene.directives, "USES_SYSTEM_INSERTS")) OR in_inputs(scene.inputs, "CANON-SYSTEM-VOICE-GLOBAL-2215-0001"); ELSE FAIL.
[RULE][RST-131] PASS IFF (scene.vibe != "RESTLESS") OR (NOT contains(scene.directives, "USES_ARTIFACT_SNIPPETS")) OR in_inputs(scene.inputs, "CANON-ARTIFACT-SNIPPETS-GLOBAL-2215-0001"); ELSE FAIL.
[RULE][RST-132] PASS IFF (scene.vibe != "RESTLESS") OR in_inputs(scene.inputs, "CANON-LOC-CHELNY-2215-0001"); ELSE FAIL.

### 5) Lexeme constraints (decidable on prose_text)

[RULE][RST-140] PASS IFF (scene.vibe != "RESTLESS") OR (NOT is_defined(prose_text)) OR contains_none(prose_text, forbidden_lexeme_pool_ru); ELSE FAIL.

## USAGE / RESOLUTION

[DECISION][RST-200] This document applies ONLY IF `scene.vibe == "RESTLESS"`; ELSE PASS.
[DECISION][RST-201] Conflict resolution MUST follow `SPEC-PRIORITY-RESOLUTION-2215-0001`; ELSE FAIL.
[DECISION][RST-202] If a scene must not be RESTLESS THEN it MUST set `scene.vibe` explicitly (or be routed by CANON-VIBE-ROUTER); ELSE PASS.

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-VIBE-RESTLESS-GLOBAL-2215-0001
role_type: RULE
export:
  - rule_id: RST-022
    intent: "applicability bound to explicit scene.inputs + scene.vibe"
    inputs: [scene.inputs, scene.vibe]
    outputs: [restless_requirements]
  - rule_id: RST-111
    intent: "restrict sound markers to pool and count 1..3"
    inputs: [scene.vibe, scene.sound_markers]
    outputs: [restless_requirements, restless_marker_pools]
  - rule_id: RST-120
    intent: "require directive subset for restless prose/dialogue structure"
    inputs: [scene.vibe, scene.directives]
    outputs: [restless_requirements]
  - rule_id: RST-130
    intent: "require system-voice doc when USES_SYSTEM_INSERTS directive is present"
    inputs: [scene.vibe, scene.directives, scene.inputs]
    outputs: [restless_requirements]
  - rule_id: RST-132
    intent: "require Chelny locality doc for RESTLESS scenes"
    inputs: [scene.vibe, scene.inputs]
    outputs: [restless_requirements]
  - rule_id: RST-140
    intent: "forbid noir/system-anthropomorphism lexemes in RESTLESS prose when prose_text is defined"
    inputs: [scene.vibe, prose.text]
    outputs: [restless_requirements]
config:
  sound_marker_pool_ref: "CONTENT.sound_marker_pool"
  required_directive_pool_ref: "CONTENT.required_directive_pool"
  forbidden_lexeme_pool_ru_ref: "CONTENT.forbidden_lexeme_pool_ru"
  vibe_field: "scene.vibe"
  vibe_alias_field: "scene.tag.VIBE"
~~~

## FORBIDDEN

[FORBIDDEN][RST-900] Quoting lyrics or reproducing track text (any length).
[FORBIDDEN][RST-901] Consuming NON-NORMATIVE examples as rules.
[FORBIDDEN][RST-902] Applying RESTLESS constraints without `scene.vibe == "RESTLESS"`.

## NON-NORMATIVE

~~~text
Design intent (not normative):
- “Flow + wear”: actions continue, but every win leaves a residual constraint.
- Team dialogue is routing and confirmation, not bonding.
~~~

~~~
</file>

<file path="canon/CANON-VIBE-ROUTER-GLOBAL-2215-0001.md">
~~~markdown
---
id: CANON-VIBE-ROUTER-GLOBAL-2215-0001
title: >
  Atmosphere Auto-Router — Deterministic Vibe Selection
class: canon
status: draft
version: 1.0.0
prefix: VRT
doc_language: ru-RU
prose_language: ru-RU
inputs:
  - CANON-VIBE-FLOW-GLOBAL-2215-0001
  - CANON-VIBE-KINETIC-GLOBAL-2215-0001
  - CANON-VIBE-RESTLESS-GLOBAL-2215-0001
  - CANON-VIBE-VELVET-GLOBAL-2215-0001
  - CANON-VIBE-VOID-GLOBAL-2215-0001
depends_on:
  - SPEC-DOC-ID-2215-0001
  - SPEC-DOC-STYLE-2215-0001
  - SPEC-PRIORITY-RESOLUTION-2215-0001
scope: >
  RULE-канон детерминированного выбора vibe-профиля для сцены на основе
  метаданных сцены, если vibe не задан явно. Алгоритм: FIRST_MATCH_WINS по
  приоритетному стеку. Не использует анализ прозы.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: deterministically select exactly one vibe profile per scene using FIRST_MATCH_WINS routing rules
INPUTS: [scene.vibe_explicit, scene.type, scene.context, scene.tag.ZONE, scene.tag.TYPE, scene.tag.STATE, scene.tag.EVENT]
OUTPUTS: [scene.vibe, scene.vibe_source]
FORBIDDEN: [fuzzy_inference, prose_based_detection, multiple_vibes_active, ambiguous_selection]

## DEFINITIONS

[FACT][VRT-010] `vibe_token` ∈ {"RESTLESS","KINETIC","FLOW","VELVET","VOID"}.
[FACT][VRT-020] `scene.vibe_explicit` = строка; PASS IFF `scene.vibe_explicit == ""` OR `scene.vibe_explicit ∈ vibe_token`; ELSE FAIL.
[FACT][VRT-030] `scene.vibe` = строка; PASS IFF `scene.vibe ∈ vibe_token`; ELSE FAIL.
[FACT][VRT-040] `scene.vibe_source` ∈ {"EXPLICIT","DERIVED"}.
[FACT][VRT-050] `scene.context` = множество токенов UPPER_SNAKE_CASE.
[FACT][VRT-060] `scene.type` = токен UPPER_SNAKE_CASE.
[FACT][VRT-070] `scene.tag.ZONE` = токен UPPER_SNAKE_CASE OR "".
[FACT][VRT-080] `scene.tag.TYPE` = токен UPPER_SNAKE_CASE OR "".
[FACT][VRT-090] `scene.tag.STATE` = токен UPPER_SNAKE_CASE OR "".
[FACT][VRT-100] `scene.tag.EVENT` = токен UPPER_SNAKE_CASE OR "".
[FACT][VRT-110] `router_rule` = запись {priority, vibe, predicate}.
[FACT][VRT-120] `FIRST_MATCH_WINS` = выбор `router_rule` с минимальным `priority`, для которого `predicate == true`.

## INVARIANTS

[DECISION][VRT-200] Scene MUST have exactly one active vibe token; ELSE FAIL.
[DECISION][VRT-210] Explicit vibe MUST override derived routing; ELSE FAIL.
[DECISION][VRT-220] Derived vibe MUST be computed ONLY by FIRST_MATCH_WINS over OUTPUT CONTRACT `export.router_rules`; ELSE FAIL.
[DECISION][VRT-230] Router MUST NOT infer vibe from prose text; ELSE FAIL.

## CONTENT

[RULE][VRT-300] PASS IFF `scene.vibe_explicit == ""` OR (`scene.vibe_explicit ∈ vibe_token`); ELSE FAIL.
[RULE][VRT-310] IF `scene.vibe_explicit != ""` THEN `scene.vibe MUST equal scene.vibe_explicit` AND `scene.vibe_source MUST equal "EXPLICIT"`; ELSE PASS.
[RULE][VRT-320] IF `scene.vibe_explicit == ""` THEN `scene.vibe_source MUST equal "DERIVED"`; ELSE PASS.
[RULE][VRT-330] IF `scene.vibe_explicit == ""` THEN `scene.vibe MUST equal derive(scene)`; ELSE FAIL.
[RULE][VRT-340] PASS IFF `derive(scene)` is computed by FIRST_MATCH_WINS over OUTPUT CONTRACT `export.router_rules`; ELSE FAIL.

## USAGE / RESOLUTION

[DECISION][VRT-400] Conflict resolution MUST follow `SPEC-PRIORITY-RESOLUTION-2215-0001`; ELSE FAIL.
[DECISION][VRT-410] This router MUST be applied at scene planning stage BEFORE prose generation; ELSE FAIL.
[DECISION][VRT-420] This router MUST NOT disable any gating rules inside the target vibe documents; ELSE FAIL.

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-VIBE-ROUTER-GLOBAL-2215-0001
role_type: RULE
export:
  router_mode: FIRST_MATCH_WINS
  explicit_override_field: scene.vibe_explicit
  output_field: scene.vibe
  output_source_field: scene.vibe_source
  vibe_token_set: ["RESTLESS","KINETIC","FLOW","VELVET","VOID"]
  predicate_operators_allowed: ["AND","OR","NOT","==","!=","IN_SET","HAS_TOKEN"]
  router_rules:
    - priority: 10
      vibe: "VOID"
      predicate: >
        IN_SET(scene.tag.EVENT, {"FATAL_LOSS","IRREVERSIBLE_ERROR","MEGASTRUCTURE_BREATH"})
        OR IN_SET(scene.tag.ZONE, {"DEEP_ZONE","FORBIDDEN_ZONE","ABANDONED_NODE"})
        OR IN_SET(scene.tag.TYPE, {"HORROR","ISOLATION","COLLAPSE","AWE"})
    - priority: 20
      vibe: "KINETIC"
      predicate: >
        HAS_TOKEN(scene.context, "CHASE")
        OR HAS_TOKEN(scene.context, "NIGHT_TRANSIT")
        OR HAS_TOKEN(scene.context, "CLUB")
        OR HAS_TOKEN(scene.context, "TECH_TRANCE")
        OR HAS_TOKEN(scene.context, "HIGH_AUTOMATION_DENSITY")
    - priority: 30
      vibe: "VELVET"
      predicate: >
        IN_SET(scene.tag.ZONE, {"SAFE_HOUSE","VIP_SECTOR","BLIND_ZONE"})
        OR IN_SET(scene.tag.TYPE, {"INTIMACY","SEDUCTION","CONFESSION","RECOVERY","TRUST_ENGINEERING"})
        OR IN_SET(scene.tag.STATE, {"EMOTIONAL_OPENNESS","SEDATION","CONTROLLED_TRUST"})
    - priority: 40
      vibe: "FLOW"
      predicate: >
        IN_SET(scene.type, {"INSIGHT","EXECUTION","REFLECTION"})
        OR HAS_TOKEN(scene.context, "DEDUCTION")
        OR HAS_TOKEN(scene.context, "PLANNING")
        OR HAS_TOKEN(scene.context, "FOCUS")
        OR HAS_TOKEN(scene.context, "CREATION")
    - priority: 90
      vibe: "RESTLESS"
      predicate: "true"
  derive_contract:
    intent: "If scene.vibe_explicit != '' => scene.vibe=scene.vibe_explicit else select first router_rule with predicate==true"
~~~ 

## FORBIDDEN

[FORBIDDEN][VRT-900] Selecting more than one vibe for a single scene.
[FORBIDDEN][VRT-910] Using prose text content to decide vibe.
[FORBIDDEN][VRT-920] Introducing additional vibe tokens outside `vibe_token_set`.

## NON-NORMATIVE

(empty)

~~~
</file>

<file path="canon/CANON-VIBE-VELVET-GLOBAL-2215-0001.md">
~~~markdown
---
id: CANON-VIBE-VELVET-GLOBAL-2215-0001
title: >
  Atmosphere Reference — Melody Gardot ("Velvet / Noir" Profile)
class: canon
status: draft
version: 1.0.2
prefix: VEL
doc_language: ru-RU
prose_language: ru-RU
inputs:
  - CANON-VIBE-RESTLESS-GLOBAL-2215-0001
depends_on:
  - SPEC-DOC-ID-2215-0001
  - SPEC-DOC-STYLE-2215-0001
  - SPEC-PRIORITY-RESOLUTION-2215-0001
scope: >
  RULE-канон для сцен глубокой интимности, “дорогого” нуара, уязвимости и
  аналоговой теплоты: решаемые требования к лексике и тегам сцены.
  Без SSOT-метрик и без инфодампа.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: enforce velvet constraints when scene.vibe == "VELVET"
INPUTS: [scene.vibe, scene.tag.VIBE, scene.tag.ZONE, scene.tag.TYPE, scene.tag.STATE, prose.text]
OUTPUTS: [velvet_zone_token, velvet_type_token, velvet_state_token, velvet_forbidden_lexeme_pool_ru, velvet_requirements]
FORBIDDEN: [industrial_noise_dominance, haste, synthetic_pop_dominance, bureaucratic_language_dominance]

## DEFINITIONS

[FACT][VEL-010] `scene.vibe` = строковый токен активного vibe-профиля сцены.
[FACT][VEL-011] `scene.tag.VIBE` = строковый alias; PASS IFF NOT is_defined(scene.tag.VIBE) OR (scene.tag.VIBE == scene.vibe); ELSE FAIL.
[FACT][VEL-020] `scene.tag.ZONE` = строковый тег зоны сцены.
[FACT][VEL-030] `scene.tag.TYPE` = строковый тег типа сцены.
[FACT][VEL-040] `scene.tag.STATE` = строковый тег состояния сцены.
[FACT][VEL-050] `prose.text` = диетический текст сцены как строка.
[FACT][VEL-060] `prose_text` = строка, равная `prose.text`.

[FACT][VEL-070] `vibe_token` ∈ {"RESTLESS","KINETIC","FLOW","VELVET","VOID"}.
[FACT][VEL-080] `is_defined(x)` = true IFF `x` существует AND `x != ""`; ELSE false.
[FACT][VEL-090] `contains_substring(text, token)` = true IFF `text` содержит `token` как подстроку; ELSE false.
[FACT][VEL-100] `any_token_in_text(text, pool)` = true IFF ∃`t`∈`pool`: `contains_substring(text,t)`; ELSE false.
[FACT][VEL-110] `no_token_in_text(text, pool)` = true IFF ∀`t`∈`pool`: NOT `contains_substring(text,t)`; ELSE false.

[FACT][VEL-120] `velvet_zone_token` ∈ {"SAFE_HOUSE","VIP_SECTOR","BLIND_ZONE"}.
[FACT][VEL-130] `velvet_type_token` ∈ {"INTIMACY","SEDUCTION","CONFESSION","RECOVERY","TRUST_ENGINEERING"}.
[FACT][VEL-140] `velvet_state_token` ∈ {"EMOTIONAL_OPENNESS","SEDATION","CONTROLLED_TRUST"}.

## INVARIANTS

[RULE][VEL-200] PASS IFF `scene.vibe ∈ vibe_token`; ELSE FAIL.
[RULE][VEL-201] PASS IFF NOT is_defined(scene.tag.VIBE) OR (scene.tag.VIBE == scene.vibe); ELSE FAIL.

[RULE][VEL-210] PASS IFF (scene.vibe != "VELVET") OR is_defined(scene.tag.ZONE); ELSE FAIL.
[RULE][VEL-220] PASS IFF (scene.vibe != "VELVET") OR is_defined(scene.tag.TYPE); ELSE FAIL.
[RULE][VEL-230] PASS IFF (scene.vibe != "VELVET") OR is_defined(scene.tag.STATE); ELSE FAIL.

[RULE][VEL-240] PASS IFF (scene.vibe != "VELVET") OR (scene.tag.ZONE in velvet_zone_token); ELSE FAIL.
[RULE][VEL-250] PASS IFF (scene.vibe != "VELVET") OR (scene.tag.TYPE in velvet_type_token); ELSE FAIL.
[RULE][VEL-260] PASS IFF (scene.vibe != "VELVET") OR (scene.tag.STATE in velvet_state_token); ELSE FAIL.
[RULE][VEL-270] PASS IFF (scene.vibe != "VELVET") OR (scene.tag.TYPE not in {"COMBAT","BUREAUCRACY","INDUSTRIAL_FIELD"}); ELSE FAIL.

## CONTENT

### 1) Token pools (lexical anchors)

~~~yaml
velvet_closeup_sound_token_pool:
  - "лёд"
  - "стекло"
  - "дыхание"
  - "шорох"
  - "ткань"
  - "капли"
  - "приглушённый гул"

velvet_tactile_token_pool:
  - "тёплый"
  - "мягкий"
  - "влажный"
  - "шероховатый"
  - "бархат"
  - "липкий"

velvet_light_token_pool:
  - "янтарный"
  - "лампа"
  - "тёплый свет"
  - "мягкая тень"
  - "полумрак"

velvet_dialogue_token_pool:
  - "шёпотом"
  - "тихо"
  - "почти не слышно"

velvet_forbidden_lexeme_pool_ru:
  - "баг"
  - "глитч"
  - "лаг"
  - "биткраш"
  - "клиппинг"
  - "протокол"
  - "регламент"
  - "бюрократ"
~~~

### 2) Prose constraints (decidable on prose_text)

[RULE][VEL-300] PASS IFF (scene.vibe != "VELVET") OR (NOT is_defined(prose_text)) OR any_token_in_text(prose_text, velvet_tactile_token_pool); ELSE FAIL.
[RULE][VEL-310] PASS IFF (scene.vibe != "VELVET") OR (NOT is_defined(prose_text)) OR any_token_in_text(prose_text, velvet_closeup_sound_token_pool); ELSE FAIL.
[RULE][VEL-320] PASS IFF (scene.vibe != "VELVET") OR (NOT is_defined(prose_text)) OR any_token_in_text(prose_text, velvet_light_token_pool); ELSE FAIL.
[RULE][VEL-330] PASS IFF (scene.vibe != "VELVET") OR (NOT is_defined(prose_text)) OR any_token_in_text(prose_text, velvet_dialogue_token_pool); ELSE FAIL.
[RULE][VEL-340] PASS IFF (scene.vibe != "VELVET") OR (NOT is_defined(prose_text)) OR no_token_in_text(prose_text, velvet_forbidden_lexeme_pool_ru); ELSE FAIL.

## USAGE / RESOLUTION

[DECISION][VEL-400] This document applies ONLY IF `scene.vibe == "VELVET"`; ELSE PASS.
[DECISION][VEL-410] Conflict resolution MUST follow `SPEC-PRIORITY-RESOLUTION-2215-0001`; ELSE FAIL.
[DECISION][VEL-420] This doc MUST NOT weaken CANON-VIBE-RESTLESS-GLOBAL-2215-0001 outside scenes where `scene.vibe == "VELVET"`; ELSE FAIL.

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-VIBE-VELVET-GLOBAL-2215-0001
role_type: RULE
export:
  - rule_id: VEL-240
    intent: "gate: VELVET requires ZONE in velvet_zone_token"
    inputs: [scene.vibe, scene.tag.ZONE]
    outputs: [velvet_requirements, velvet_zone_token]
  - rule_id: VEL-250
    intent: "gate: VELVET requires TYPE in velvet_type_token"
    inputs: [scene.vibe, scene.tag.TYPE]
    outputs: [velvet_requirements, velvet_type_token]
  - rule_id: VEL-260
    intent: "gate: VELVET requires STATE in velvet_state_token"
    inputs: [scene.vibe, scene.tag.STATE]
    outputs: [velvet_requirements, velvet_state_token]
  - rule_id: VEL-340
    intent: "forbid digital/bureaucratic lexemes in velvet prose when prose_text is defined"
    inputs: [scene.vibe, prose.text]
    outputs: [velvet_forbidden_lexeme_pool_ru, velvet_requirements]
config:
  velvet_zone_token_ref: "DEFINITIONS.velvet_zone_token"
  velvet_type_token_ref: "DEFINITIONS.velvet_type_token"
  velvet_state_token_ref: "DEFINITIONS.velvet_state_token"
  velvet_forbidden_lexeme_pool_ru_ref: "CONTENT.velvet_forbidden_lexeme_pool_ru"
  vibe_field: "scene.vibe"
  vibe_alias_field: "scene.tag.VIBE"
~~~

## FORBIDDEN

[FORBIDDEN][VEL-900] Treating this doc as applicable when `scene.vibe != "VELVET"`.
[FORBIDDEN][VEL-910] Consuming NON-NORMATIVE content as constraints or facts.

## NON-NORMATIVE

~~~text
Example only (non-normative):
«Она смотрела сквозь бокал, и свет лампы плавился в янтаре. Звук города остался где-то за стеклом, превратившись в приглушённый гул. В комнате слышно было только дыхание и шорох ткани».
~~~

~~~
</file>

<file path="canon/CANON-VIBE-VOID-GLOBAL-2215-0001.md">
~~~markdown
---
id: CANON-VIBE-VOID-GLOBAL-2215-0001
title: >
  Atmosphere Reference — Lorn ("Void / Dread" Profile)
class: canon
status: draft
version: 1.0.2
prefix: VOI
doc_language: ru-RU
prose_language: ru-RU
inputs:
  - CANON-VIBE-RESTLESS-GLOBAL-2215-0001
depends_on:
  - SPEC-DOC-ID-2215-0001
  - SPEC-DOC-STYLE-2215-0001
  - SPEC-PRIORITY-RESOLUTION-2215-0001
scope: >
  RULE-канон для сцен экзистенциального ужаса, изоляции, фатальных сбоев и
  столкновения с мегаструктурным масштабом: решаемые требования к тегам и
  лексическим маркерам. Без SSOT-метрик и без инфодампа.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: enforce void constraints when scene.vibe == "VOID"
INPUTS: [scene.vibe, scene.tag.VIBE, scene.tag.ZONE, scene.tag.TYPE, scene.tag.EVENT, prose.text]
OUTPUTS: [void_zone_token, void_type_token, void_event_token, void_forbidden_lexeme_pool_ru, void_requirements]
FORBIDDEN: [heroic_tone, warmth, cozy_details, neon_show, fast_banter]

## DEFINITIONS

[FACT][VOI-010] `scene.vibe` = строковый токен активного vibe-профиля сцены.
[FACT][VOI-011] `scene.tag.VIBE` = строковый alias; PASS IFF NOT is_defined(scene.tag.VIBE) OR (scene.tag.VIBE == scene.vibe); ELSE FAIL.
[FACT][VOI-020] `scene.tag.ZONE` = строковый тег зоны сцены.
[FACT][VOI-030] `scene.tag.TYPE` = строковый тег типа сцены.
[FACT][VOI-040] `scene.tag.EVENT` = строковый тег события сцены.
[FACT][VOI-050] `prose.text` = диетический текст сцены как строка.
[FACT][VOI-060] `prose_text` = строка, равная `prose.text`.

[FACT][VOI-070] `vibe_token` ∈ {"RESTLESS","KINETIC","FLOW","VELVET","VOID"}.
[FACT][VOI-080] `is_defined(x)` = true IFF `x` существует AND `x != ""`; ELSE false.
[FACT][VOI-090] `contains_substring(text, token)` = true IFF `text` содержит `token` как подстроку; ELSE false.
[FACT][VOI-100] `any_token_in_text(text, pool)` = true IFF ∃`t`∈`pool`: `contains_substring(text,t)`; ELSE false.
[FACT][VOI-110] `no_token_in_text(text, pool)` = true IFF ∀`t`∈`pool`: NOT `contains_substring(text,t)`; ELSE false.

[FACT][VOI-120] `void_zone_token` ∈ {"DEEP_ZONE","FORBIDDEN_ZONE","ABANDONED_NODE"}.
[FACT][VOI-130] `void_type_token` ∈ {"HORROR","ISOLATION","COLLAPSE","AWE"}.
[FACT][VOI-140] `void_event_token` ∈ {"FATAL_LOSS","IRREVERSIBLE_ERROR","MEGASTRUCTURE_BREATH"}.

## INVARIANTS

[RULE][VOI-200] PASS IFF `scene.vibe ∈ vibe_token`; ELSE FAIL.
[RULE][VOI-201] PASS IFF NOT is_defined(scene.tag.VIBE) OR (scene.tag.VIBE == scene.vibe); ELSE FAIL.

[RULE][VOI-210] PASS IFF (scene.vibe != "VOID") OR is_defined(scene.tag.ZONE); ELSE FAIL.
[RULE][VOI-220] PASS IFF (scene.vibe != "VOID") OR is_defined(scene.tag.TYPE); ELSE FAIL.
[RULE][VOI-230] PASS IFF (scene.vibe != "VOID") OR is_defined(scene.tag.EVENT); ELSE FAIL.

[RULE][VOI-240] PASS IFF (scene.vibe != "VOID") OR (scene.tag.ZONE in void_zone_token); ELSE FAIL.
[RULE][VOI-250] PASS IFF (scene.vibe != "VOID") OR (scene.tag.TYPE in void_type_token); ELSE FAIL.
[RULE][VOI-260] PASS IFF (scene.vibe != "VOID") OR (scene.tag.EVENT in void_event_token); ELSE FAIL.
[RULE][VOI-270] PASS IFF (scene.vibe != "VOID") OR (scene.tag.TYPE not in {"COMBAT","CHASE","CLUB"}); ELSE FAIL.

## CONTENT

### 1) Token pools (lexical anchors)

~~~yaml
void_sound_token_pool:
  - "гул"
  - "вибрация"
  - "скрежет"
  - "удар"
  - "инфразвук"

void_scale_token_pool:
  - "монолит"
  - "шахта"
  - "километр"
  - "без потолка"
  - "без дна"
  - "масштаб"

void_light_token_pool:
  - "холодный свет"
  - "недостаточно света"
  - "чёрное"
  - "белое"
  - "провал"

void_forbidden_lexeme_pool_ru:
  - "уют"
  - "тепло"
  - "милый"
  - "смешно"
  - "героизм"
  - "неон"
  - "голограмма"
~~~

### 2) Prose constraints (decidable on prose_text)

[RULE][VOI-300] PASS IFF (scene.vibe != "VOID") OR (NOT is_defined(prose_text)) OR any_token_in_text(prose_text, void_sound_token_pool); ELSE FAIL.
[RULE][VOI-310] PASS IFF (scene.vibe != "VOID") OR (NOT is_defined(prose_text)) OR any_token_in_text(prose_text, void_scale_token_pool); ELSE FAIL.
[RULE][VOI-320] PASS IFF (scene.vibe != "VOID") OR (NOT is_defined(prose_text)) OR any_token_in_text(prose_text, void_light_token_pool); ELSE FAIL.
[RULE][VOI-330] PASS IFF (scene.vibe != "VOID") OR (NOT is_defined(prose_text)) OR no_token_in_text(prose_text, void_forbidden_lexeme_pool_ru); ELSE FAIL.

## USAGE / RESOLUTION

[DECISION][VOI-400] This document applies ONLY IF `scene.vibe == "VOID"`; ELSE PASS.
[DECISION][VOI-410] Conflict resolution MUST follow `SPEC-PRIORITY-RESOLUTION-2215-0001`; ELSE FAIL.
[DECISION][VOI-420] This doc MUST NOT weaken CANON-VIBE-RESTLESS-GLOBAL-2215-0001 outside scenes where `scene.vibe == "VOID"`; ELSE FAIL.

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-VIBE-VOID-GLOBAL-2215-0001
role_type: RULE
export:
  - rule_id: VOI-240
    intent: "gate: VOID requires ZONE in void_zone_token"
    inputs: [scene.vibe, scene.tag.ZONE]
    outputs: [void_requirements, void_zone_token]
  - rule_id: VOI-250
    intent: "gate: VOID requires TYPE in void_type_token"
    inputs: [scene.vibe, scene.tag.TYPE]
    outputs: [void_requirements, void_type_token]
  - rule_id: VOI-260
    intent: "gate: VOID requires EVENT in void_event_token"
    inputs: [scene.vibe, scene.tag.EVENT]
    outputs: [void_requirements, void_event_token]
  - rule_id: VOI-330
    intent: "forbid cozy/heroic/neon lexemes in void prose when prose_text is defined"
    inputs: [scene.vibe, prose.text]
    outputs: [void_forbidden_lexeme_pool_ru, void_requirements]
config:
  void_zone_token_ref: "DEFINITIONS.void_zone_token"
  void_type_token_ref: "DEFINITIONS.void_type_token"
  void_event_token_ref: "DEFINITIONS.void_event_token"
  void_forbidden_lexeme_pool_ru_ref: "CONTENT.void_forbidden_lexeme_pool_ru"
  vibe_field: "scene.vibe"
  vibe_alias_field: "scene.tag.VIBE"
~~~

## FORBIDDEN

[FORBIDDEN][VOI-900] Treating this doc as applicable when `scene.vibe != "VOID"`.
[FORBIDDEN][VOI-910] Consuming NON-NORMATIVE content as constraints or facts.

## NON-NORMATIVE

~~~text
Example only (non-normative):
«Темнота здесь не была отсутствием света. Она была массой. Где-то внизу что-то огромное провернулось со скрежетом, и вибрация прошла через подошвы в зубы. Он почувствовал себя песчинкой внутри монолита».
~~~

~~~
</file>

<file path="canon/CANON-VOCAB-GLOBAL-2215-0001.md">
~~~markdown
---
id: CANON-VOCAB-GLOBAL-2215-0001
title: >
  Operational Vocabulary — Canonical Terms, Substitutions and Speech Constraints (2215)
class: canon
status: draft
version: 1.0.0
inputs:
  - CANON-CAST-GLOBAL-2215-0001
  - CANON-REPORTS-GLOBAL-2215-0006
depends_on: []
scope: >
  Canonical operational vocabulary for the novel corpus (2215): mandatory term
  substitutions, allowed terminology, speech constraints for characters and
  system outputs. Enforced as a generation limiter for scenes and artifacts.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: enforce canonical operational vocabulary and forbid genre-breaking language
INPUTS: [CANON-BASE-RULE-GLOBAL-2215-0001, CANON-CAST-GLOBAL-2215-0001, CANON-REPORTS-GLOBAL-2215-0006]
OUTPUTS: [allowed_term, forbidden_term, substitution_rule]
FORBIDDEN: [genre_slang, emotional_language, narrative_justification]

## DEFINITIONS

[DECISION][VOCAB-001] "Operational vocabulary" = terminology aligned with procedures,
infrastructure, regulation, and auditability.

[DECISION][VOCAB-002] "Hard substitution" = mandatory replacement with no stylistic exceptions.

[DECISION][VOCAB-003] "Forbidden term" = word or phrase that MUST NOT appear in generated text.

## INVARIANTS

[DECISION][VOCAB-010] Canonical substitutions MUST be applied consistently across:
- narration,
- dialogue,
- artifacts,
- system inserts.

[DECISION][VOCAB-011] Vocabulary rules apply equally to:
- human characters,
- institutional language,
- system outputs.

[DECISION][VOCAB-012] Absence of a listed term does NOT imply permission; defaults
to operational language.

## CONTENT

### Hard substitutions — violence and harm

[RULE][VOCAB-100] IF term = "убийство" THEN replace_with = "вывод из эксплуатации носителя".

[RULE][VOCAB-101] IF term = "жертва" THEN replace_with = "затронутый субъект".

[RULE][VOCAB-102] IF term = "труп" THEN replace_with = "неактивный носитель".

[RULE][VOCAB-103] IF term = "пытка" THEN replace_with = "несанкционированное воздействие".

[RULE][VOCAB-104] IF term = "расправа" THEN replace_with = "внесудебное действие".

[RULE][VOCAB-105] IF term = "нападение" THEN replace_with = "силовое вмешательство".

[RULE][VOCAB-106] IF term = "преступник" THEN replace_with = "нарушитель режима".

### Hard substitutions — investigation and procedure

[RULE][VOCAB-120] IF term = "улики" THEN replace_with = "артефакты".

[RULE][VOCAB-121] IF term = "доказательства" THEN replace_with = "доказательная база".

[RULE][VOCAB-122] IF term = "версия" THEN replace_with = "рабочая гипотеза".

[RULE][VOCAB-123] IF term = "мотив" THEN replace_with = "оптимизационная цель".

[RULE][VOCAB-124] IF term = "признание" THEN replace_with = "зафиксированное показание".

[RULE][VOCAB-125] IF term = "допрос" THEN replace_with = "процессуальный опрос".

### Hard substitutions — corruption and pressure

[RULE][VOCAB-140] IF term = "взятка" THEN replace_with = "приоритетный доступ".

[RULE][VOCAB-141] IF term = "подкуп" THEN replace_with = "офсетная сделка".

[RULE][VOCAB-142] IF term = "крышевание" THEN replace_with = "договорная защита".

[RULE][VOCAB-143] IF term = "давление" THEN replace_with = "асимметричное воздействие".

[RULE][VOCAB-144] IF phrase = "приказ сверху" THEN replace_with = "регуляторный сигнал".

### Canonical infrastructure terminology

[RULE][VOCAB-200] Use term "контур" for closed decision systems.

[RULE][VOCAB-201] Use term "узел" for execution points (physical or logical).

[RULE][VOCAB-202] Use term "режим" for a bounded set of procedures and constraints.

[RULE][VOCAB-203] Use term "класс обеспечения" for priority access to resources.

[RULE][VOCAB-204] Use term "окно" for time-bounded permissions.

### Observability and data language

[RULE][VOCAB-220] Use term "логи" ONLY for primary execution records.

[RULE][VOCAB-221] Use term "телеметрия" for streamed measurements.

[RULE][VOCAB-222] Use term "слепая зона" for non-guaranteed observability areas.

[RULE][VOCAB-223] Use term "purge/rotation" ONLY as procedural data lifecycle events.

### Legal and procedural language (FSSU / regulators)

[RULE][VOCAB-240] Use term "ордер" for formal authorization.

[RULE][VOCAB-241] Use term "мандат" for scope of authority.

[RULE][VOCAB-242] Use term "арбитраж" ONLY for contract- or law-based dispute resolution.

[RULE][VOCAB-243] Use term "JAP" ONLY as "Joint Access Protocol".

### Decision status phrases

[RULE][VOCAB-260] Allowed decision phrases:
- "формально допустимо"
- "процедурно корректно"
- "юридически уязвимо"
- "неприемлемо по риску"
- "требует override"
- "закрыто по регламенту"

### System voice constraints

[FORBIDDEN][VOCAB-300] Emotional or moral language in system output.

[FORBIDDEN][VOCAB-301] Personal pronouns in system output.

[FORBIDDEN][VOCAB-302] Dialogic constructions in system output.

### Genre-forbidden vocabulary

[FORBIDDEN][VOCAB-400] Term = "бластер".

[FORBIDDEN][VOCAB-401] Term = "голограмма" EXCEPT WHEN explicitly AR-display.

[FORBIDDEN][VOCAB-402] Term = "киберпанк".

[FORBIDDEN][VOCAB-403] Term = "мегакорп".

[FORBIDDEN][VOCAB-404] Phrase = "всевидящая система".

[FORBIDDEN][VOCAB-405] Phrase = "цифровая душа".

## USAGE / RESOLUTION

[RULE][VOCAB-500] IF forbidden term is detected THEN generation MUST be rejected.

[RULE][VOCAB-501] IF hard substitution exists THEN replacement MUST be applied
before scene finalization.

[RULE][VOCAB-502] Vocabulary rules override stylistic or atmospheric preferences.

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-VOCAB-GLOBAL-2215-0001
role_type: RULE
export:
  - rule_id: VOCAB-100..405
    intent: enforce canonical operational vocabulary
    inputs: [raw_text]
    outputs: [validated_text, substitution_map]
~~~

## FORBIDDEN

[FORBIDDEN][VOCAB-900] Introducing new substitutions without canon update.

[FORBIDDEN][VOCAB-901] Mixing genre slang with operational language.

[FORBIDDEN][VOCAB-902] Using examples as implicit permission.

## NON-NORMATIVE

Examples of compliant phrasing MAY be stored in separate writing aids but
MUST NOT be treated as rules.

~~~
</file>

<file path="canon/CANON-ZONES-GLOBAL-2215-0004.md">
~~~markdown
---
id: CANON-ZONES-GLOBAL-2215-0004
title: >
  Canon Zones — Extraterritories and Special Regimes (RF 2215): Zone Typology, Jurisdiction, and FSSU Access
class: canon
status: draft
version: 1.1.0
inputs: []
depends_on:
  - SPEC-DOC-STYLE-2215-0001
  - SPEC-PRIORITY-RESOLUTION-2215-0001
  - CANON-CORE-GLOBAL-2215-0001
  - CANON-SYSTEMS-GLOBAL-2215-0001
  - CANON-ORDERS-GLOBAL-2215-0003
  - CANON-CONFLICT-GLOBAL-2215-0001
  - CANON-FSSU-GLOBAL-2215-0005
scope: >
  STATE-описание типологии экстерриторий и специальных режимов в РФ 2215:
  виды зон, назначение, держатель режима, нормативное основание,
  арбитраж и допустимость доказательств, наблюдаемость и процедуры доступа ФССУ.
  Межгосударственный фактор не активируется в текущей книге.
---

## LLM-INTENT

ROLE_TYPE: STATE
SCOPE: define zone taxonomy and procedural properties (jurisdiction, observability, access mechanics)
INPUTS:
  - CANON-CORE-GLOBAL-2215-0001
  - CANON-SYSTEMS-GLOBAL-2215-0001
  - CANON-ORDERS-GLOBAL-2215-0003
  - CANON-FSSU-GLOBAL-2215-0005
OUTPUTS:
  - zone_taxonomy
  - zone_properties
  - access_mechanics_state
FORBIDDEN:
  - world_parameter_binding
  - baseline_defaults
  - secret_city_trope
  - new_world_metrics
  - procedural_rule_authoring_outside_state

---

## DEFINITIONS

[FACT][ZON-DEF-010] extraterritory = procedural regime where access/audit/liability/arbitration change but do not vanish.
[FACT][ZON-DEF-011] zone_type ∈ {Z1, Z2, Z3, Z4}.
[FACT][ZON-DEF-012] regime_holder = legal_entity_or_consortium delegated special mode.
[FACT][ZON-DEF-013] arbitration_loop = specialized admissibility and access governor for the zone.
[FACT][ZON-DEF-014] observability_regime = inside_richer_outside_filtered by default.
[FACT][ZON-DEF-015] government_access_protocol = JAP (Joint Access Protocol) when required by regime.
[FACT][ZON-DEF-016] evidence_export_formula = order → fixation → chain_of_custody → legalization.

---

## INVARIANTS

[DECISION][ZON-INV-000] Extraterritory MUST NOT be treated as lawlessness.
[DECISION][ZON-INV-001] Extraterritories MUST be rare and bounded; not everyday normality.
[DECISION][ZON-INV-002] Each extraterritory MUST declare {regime_holder, normative_basis, arbitration_loop, government_access_protocol, observability_regime}.
[DECISION][ZON-INV-003] In scenes, zone presence MUST manifest via procedure, not secret_city trope.
[DECISION][ZON-INV-004] Evidence export from a zone MUST follow evidence_export_formula.

---

## CONTENT

### 1. Baseline rationale (why zones exist)

[STATE][ZON-010] zone_drivers = {
  accelerate_innovation_and_builds,
  concentrate_critical_infrastructure_and_capital,
  operator_risk_reduction_and_knowhow_protection,
  state_growth_points_and_hubs
}.
[STATE][ZON-012] state_control_levers = {licenses, standards, arbitration, regulator_triggers}.

---

### 2. Common zone properties (apply to all zone types)

[STATE][ZON-100] regime_holder = legal_entity_or_consortium_delegated_special_mode.
[STATE][ZON-101] holder_obligations = {
  license_conditions_enforcement,
  audit_trails_by_standard,
  support_JAP_for_state_orgs_including_FSSU
}.

[STATE][ZON-110] observability_regime.inside_is_richer = true.
[STATE][ZON-111] observability_regime.outside_export_is_filtered = true.
[STATE][ZON-112] blind_zones_allowed_only_if = explicit_regime_exception.
[STATE][ZON-113] undocumented_blind_zone_interpretation = violation_or_sabotage_signal.

[STATE][ZON-120] arbitration_loop = specialized_zone_admissibility_and_access_governor.
[STATE][ZON-121] evidence_export_formula = order_fixation_custody_legalization.

---

### 3. Zone taxonomy (minimal set)

[STATE][ZON-200] zone_types_count = 4.
[STATE][ZON-201] zone_types = {Z1, Z2, Z3, Z4}.

---

### 4. Zone type definitions

[STATE][ZON-Z1-210] zone.Z1.code = Z1.
[STATE][ZON-Z1-211] zone.Z1.name = infrastructure_hub.
[STATE][ZON-Z1-212] zone.Z1.examples = {logistics_megahubs, energy_module_clusters, multimodal_corridors}.
[STATE][ZON-Z1-213] zone.Z1.purpose = {throughput_speed, downtime_minimization, procedure_unification}.
[STATE][ZON-Z1-214] zone.Z1.regime_features = {
  controlled_access_perimeters_and_time_windows,
  corporate_and_state_security,
  supply_chain_manipulation_surface
}.
[STATE][ZON-Z1-215] zone.Z1.liability_gaps = {contractor_subcontractor_ghosts, loss_or_substitution_as_operational_deviation}.

[STATE][ZON-Z2-220] zone.Z2.code = Z2.
[STATE][ZON-Z2-221] zone.Z2.name = compute_data_extraterritory.
[STATE][ZON-Z2-222] zone.Z2.purpose = {compute_concentration, ip_and_config_protection, cooling_energy_requirements}.
[STATE][ZON-Z2-223] zone.Z2.regime_features = {
  tight_primary_log_and_config_access_restrictions,
  high_formalism_badges_escorts_air_gapped_segments,
  rich_internal_telemetry_filtered_exports
}.
[STATE][ZON-Z2-224] zone.Z2.liability_gaps = {
  model_recommended_vs_operator_signed_vs_contractor_implemented,
  config_changes_as_planned_optimizations_without_visible_actor
}.

[STATE][ZON-Z3-230] zone.Z3.code = Z3.
[STATE][ZON-Z3-231] zone.Z3.name = industrial_recycling_hazardous_materials.
[STATE][ZON-Z3-232] zone.Z3.purpose = {
  toxicity_and_hazard_processes,
  critical_materials_handling,
  safety_and_licensing_regimes,
  trade_secret_process_protection
}.
[STATE][ZON-Z3-233] zone.Z3.regime_features = {
  reinforced_sanitary_and_technical_protocols,
  restrictions_on_photo_scan_sample_export,
  lab_admissibility_dependency
}.
[STATE][ZON-Z3-234] zone.Z3.liability_gaps = {
  documentation_says_normal_field_says_not,
  responsibility_smear_between_ecology_safety_contracting
}.

[STATE][ZON-Z4-240] zone.Z4.code = Z4.
[STATE][ZON-Z4-241] zone.Z4.name = exception_sandbox_accelerated_mode.
[STATE][ZON-Z4-242] zone.Z4.purpose = {accelerated_programs_and_pilots, experimental_operation_regimes, legal_exceptions_for_innovation}.
[STATE][ZON-Z4-243] zone.Z4.regime_features = {
  highest_density_of_exceptions,
  harder_state_access_due_to_JAP_arbitration_nda,
  high_kpi_optimization_harshness_probability
}.
[STATE][ZON-Z4-244] zone.Z4.liability_gaps = {temporary_exception_becomes_permanent, top_level_reporting_aggregates_human_cost_out}.

---

### 5. Access mechanics (state-level)

[STATE][ZON-ACC-300] default_entry_model = order_plus_JAP_if_required.
[STATE][ZON-ACC-301] FSSU_behavior_in_zone_expectations = {
  minimize_intervention_until_sufficient_evidence,
  actions_must_be_auditable,
  enforce_chain_of_custody_and_zone_admissibility
}.
[STATE][ZON-ACC-320] typical_zone_resistance = {
  wrong_order_wrong_jurisdiction_wrong_window,
  sla_delays,
  approval_time_drains,
  filtered_exports_aggregates_only,
  nda_pressure_ip_leak_threat
}.
[STATE][ZON-ACC-321] FSSU_escalation_ladder = {DPO, ISO, SO, TSRO_or_Enforce}.
[STATE][ZON-ACC-340] emergency_entry_condition = immediate_harm_threat_to_humans_or_critical_infrastructure.
[STATE][ZON-ACC-341] emergency_procedure_mode = strengthened_not_cancelled.
[STATE][ZON-ACC-342] emergency_requires = {post_report, proportionality_review, arbitration}.

---

### 6. Arbitration loops (state description)

[STATE][ZON-ARB-400] arbitration_is_primary_viscosity_mechanism = true.
[STATE][ZON-ARB-401] arbitration_modes_supported = {state_arbitration, mixed_contract_arbitration}.
[STATE][ZON-ARB-402] typical_arbitration_outcomes = {limit_perimeter, delay_access, mandate_audit, appoint_observer}.

---

### 7. Narrative manifestation expectations (state cues)

[STATE][ZON-NAR-500] zone_scene_effects = {
  access_delay_time_is_enemy,
  observability_limit_blind_spot,
  jurisdiction_conflict_who_signs,
  liability_isolation_contract_ghosts,
  procedurally_valid_human_cost
}.
[STATE][ZON-NAR-501] zone_appearance = normal.
[STATE][ZON-NAR-502] zone_threat_source = procedure_not_atmosphere.

---

### 8. Future hooks (inactive in this book)

[STATE][ZON-FUT-600] future_hooks_possible = {
  expanded_FSSU_powers,
  external_actors_attack_infra_via_zones,
  supply_chain_component_substitution_attacks
}.
[STATE][ZON-FUT-601] interstate_driver_active_in_current_book = false.

---

## USAGE / RESOLUTION

[DECISION][ZON-USE-010] Документ используется как STATE-основание для зон в сценах и планах.
[DECISION][ZON-USE-011] Procedural rule enforcement MUST be sourced from RULE documents (e.g., CANON-ORDERS-GLOBAL-2215-0003, CANON-REPORTS-GLOBAL-2215-0006).
[DECISION][ZON-USE-012] Conflict resolution MUST follow SPEC-PRIORITY-RESOLUTION-2215-0001.

---

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-ZONES-GLOBAL-2215-0004
role_type: STATE
export:
  zone_types: [Z1, Z2, Z3, Z4]
  default_entry_model: order_plus_JAP_if_required
  escalation_ladder: [DPO, ISO, SO, TSRO_or_Enforce]
  arbitration_modes: [state_arbitration, mixed_contract_arbitration]
  evidence_export_formula: order_fixation_custody_legalization
~~~

---

## FORBIDDEN

[FORBIDDEN][ZON-FBD-900] Treating extraterritory as lawless space.
[FORBIDDEN][ZON-FBD-901] Treating zones as everyday normality everywhere.
[FORBIDDEN][ZON-FBD-902] Introducing new SSOT metrics or changing world baselines here.
[FORBIDDEN][ZON-FBD-903] Using secret_city trope as primary explanation.

---

## UNKNOWN

[UNKNOWN][ZON-UNK-800] Nearest-to-Chelny plausible instance placement for Z1/Z2/Z4.
[UNKNOWN][ZON-UNK-801] Regime holders for key zones (operator/consortium names).
[UNKNOWN][ZON-UNK-802] JAP activation threshold: which order classes require joint access vs solo FSSU entry.

---

## NON-NORMATIVE

(Empty by design)

~~~
</file>

<file path="idx/IDX-CORPUS-0001.md">
~~~markdown
---
id: IDX-CORPUS-0001
title: >
  Corpus Registry
class: idx
status: draft
prefix: CORP
doc_language: ru-RU
inputs: []
depends_on: []
scope: >
  Нормативный реестр членства документов корпуса. Определяет, какие doc_id
  считаются частью корпуса, и предоставляет машиночитаемую таблицу навигации.
---

## LLM-INTENT

ROLE_TYPE: INDEX
SCOPE: normative corpus membership registry and navigation table
INPUTS: []
OUTPUTS: [registry_rows]
FORBIDDEN: [worldbuilding, prose, implicit_membership, rule_definition, state_definition]

## DEFINITIONS

[FACT][CORP-010] `registry_row` = запись таблицы с полями {id, file, class, status, role_type, inputs, depends_on}.
[FACT][CORP-020] `membership` = свойство документа считаться частью корпуса.
[FACT][CORP-030] `primary_key` = поле `id`.

## INVARIANTS

[DECISION][CORP-100] Document HAS membership IFF its `id` exists in Registry table; ELSE FAIL.
[DECISION][CORP-110] Any `depends_on` reference MUST exist in Registry; ELSE FAIL.
[DECISION][CORP-115] Any `inputs` reference MUST exist in Registry; ELSE FAIL.
[DECISION][CORP-120] Any document with `status: fixed` MUST exist in Registry; ELSE FAIL.
[DECISION][CORP-130] `id` MUST be unique across rows; ELSE FAIL.
[DECISION][CORP-140] Registry table is the ONLY authoritative membership source; ELSE FAIL.

[FORBIDDEN][CORP-150] Implicit membership by folder presence.
[FORBIDDEN][CORP-160] Redefining rules or state inside this INDEX.
[FORBIDDEN][CORP-170] Narrative or descriptive prose.

## CONTENT

|id|file|class|status|role_type|inputs|depends_on|
|--|----|-----|------|---------|------|----------|
|BASELINE-DAILY_OPS-2215-0002|docs/baseline/BASELINE-DAILY_OPS-2215-0002.md|baseline|draft|RULE|CANON-CORE-GLOBAL-2215-0001,CANON-SYSTEMS-GLOBAL-2215-0001,CANON-ORDERS-GLOBAL-2215-0003,CANON-ARTIFACT-SNIPPETS-GLOBAL-2215-0001|SPEC-DOC-STYLE-2215-0001,SPEC-PRIORITY-RESOLUTION-2215-0001|
|BASELINE-DIGITAL_IDENTITY-2215-0001|docs/baseline/BASELINE-DIGITAL_IDENTITY-2215-0001.md|baseline|fixed|RULE|SSOT-SCENARIO-A-2215-0001,SSOT-LIFE-A-2215-0007|SPEC-DOC-STYLE-2215-0001,CANON-BASE-RULE-GLOBAL-2215-0001,BASELINE-SOCIAL-2215-0001|
|BASELINE-FSSU-CASE-ACTIVATION-2215-0001|docs/baseline/BASELINE-FSSU-CASE-ACTIVATION-2215-0001.md|baseline|draft|RULE||CANON-FSSU-GLOBAL-2215-0005,CANON-SYSTEM-ONTOLOGY-2215-0001,SPEC-DOC-ID-2215-0001,SPEC-DOC-STYLE-2215-0001,SPEC-PRIORITY-RESOLUTION-2215-0001|
|BASELINE-OBSERVABILITY-2215-0001|docs/baseline/BASELINE-OBSERVABILITY-2215-0001.md|baseline|fixed|RULE|SSOT-SCENARIO-A-2215-0001|CANON-BASE-RULE-GLOBAL-2215-0001,BASELINE-SOCIAL-2215-0001,BASELINE-DIGITAL_IDENTITY-2215-0001|
|BASELINE-PHYSICAL_LEVEL_MID-2215-0001|docs/baseline/BASELINE-PHYSICAL_LEVEL_MID-2215-0001.md|baseline|fixed|RULE||SPEC-DOC-STYLE-2215-0001,SSOT-SCENARIO-A-2215-0001|
|BASELINE-PSYCH-2215-0001|docs/baseline/BASELINE-PSYCH-2215-0001.md|baseline|fixed|RULE|BASELINE-SOCIAL-2215-0001,SSOT-URBANISM-A-2215-0007||
|BASELINE-SECURITY-2215-0001|docs/baseline/BASELINE-SECURITY-2215-0001.md|baseline|fixed|RULE|SSOT-GOVERNANCE-SECURITY-A-2215-0005,SSOT-SCENARIO-A-2215-0001|CANON-BASE-RULE-GLOBAL-2215-0001,BASELINE-OBSERVABILITY-2215-0001,BASELINE-DIGITAL_IDENTITY-2215-0001,BASELINE-SOCIAL-2215-0001|
|BASELINE-SOCIAL-2215-0001|docs/baseline/BASELINE-SOCIAL-2215-0001.md|baseline|fixed|RULE|SSOT-SCENARIO-A-2215-0001,SSOT-LIFE-A-2215-0007|CANON-BASE-RULE-GLOBAL-2215-0001|
|CANON-ARCS-GLOBAL-2215-0001|docs/canon/CANON-ARCS-GLOBAL-2215-0001.md|canon|fixed|RULE|CANON-CAST_REGISTRY-GLOBAL-2215-0001,CANON-CAST-VOICE-2215-0001,PLAN-STORY-2215-0001|SPEC-DOC-STYLE-2215-0001,SPEC-PRIORITY-RESOLUTION-2215-0001|
|CANON-ARTIFACT-SNIPPETS-GLOBAL-2215-0001|docs/canon/CANON-ARTIFACT-SNIPPETS-GLOBAL-2215-0001.md|canon|fixed|RULE|CANON-VOCAB-GLOBAL-2215-0001,CANON-SYSTEM-VOICE-GLOBAL-2215-0001||
|CANON-BASE-NARRATIVE-GLOBAL-2215-0001|docs/canon/CANON-BASE-NARRATIVE-GLOBAL-2215-0001.md|canon|fixed|INTERFACE||CANON-BASE-RULE-GLOBAL-2215-0001,CANON-CORE-GLOBAL-2215-0001|
|CANON-BASE-RULE-GLOBAL-2215-0001|docs/canon/CANON-BASE-RULE-GLOBAL-2215-0001.md|canon|fixed|RULE||CANON-CORE-GLOBAL-2215-0001,SSOT-CONSISTENCY-A-2215-0009,SPEC-DOC-STYLE-2215-0001|
|CANON-CAST-GLOBAL-2215-0001|docs/canon/CANON-CAST-GLOBAL-2215-0001.md|canon|fixed|INTERFACE|CANON-CAST_REGISTRY-GLOBAL-2215-0001,CANON-CAST_RULES-GLOBAL-2215-0001|SPEC-DOC-STYLE-2215-0001,SPEC-PRIORITY-RESOLUTION-2215-0001|
|CANON-CAST-PUBLIC-2215-0001|docs/canon/CANON-CAST-PUBLIC-2215-0001.md|canon|fixed|STATE|CANON-ORGS-2215-0001|SPEC-DOC-STYLE-2215-0001,SPEC-PRIORITY-RESOLUTION-2215-0001|
|CANON-CAST-VOICE-2215-0001|docs/canon/CANON-CAST-VOICE-2215-0001.md|canon|fixed|STATE|CANON-CAST-GLOBAL-2215-0001,BASELINE-PSYCH-2215-0001|SPEC-DOC-STYLE-2215-0001|
|CANON-CAST_REGISTRY-GLOBAL-2215-0001|docs/canon/CANON-CAST_REGISTRY-GLOBAL-2215-0001.md|canon|fixed|STATE||SPEC-DOC-STYLE-2215-0001,SPEC-PRIORITY-RESOLUTION-2215-0001|
|CANON-CAST_RULES-GLOBAL-2215-0001|docs/canon/CANON-CAST_RULES-GLOBAL-2215-0001.md|canon|draft|RULE|CANON-CAST_REGISTRY-GLOBAL-2215-0001,PLAN-STORY-2215-0001|SPEC-DOC-STYLE-2215-0001,SPEC-PRIORITY-RESOLUTION-2215-0001|
|CANON-CITY-BOUNDARY-RU-2215-0008|docs/canon/CANON-CITY-BOUNDARY-RU-2215-0008.md|canon|draft|RULE|||
|CANON-CITY-REGISTRY-RU-2215-0001|docs/canon/CANON-CITY-REGISTRY-RU-2215-0001.md|canon|draft|STATE||SPEC-DOC-STYLE-2215-0001,SPEC-PRIORITY-RESOLUTION-2215-0001|
|CANON-CITY-RU-2215-0007|docs/canon/CANON-CITY-RU-2215-0007.md|canon|draft|INTERFACE|CANON-CITY-REGISTRY-RU-2215-0001,CANON-CITY-RULES-RU-2215-0001|SPEC-DOC-STYLE-2215-0001,SPEC-PRIORITY-RESOLUTION-2215-0001|
|CANON-CITY-RULES-RU-2215-0001|docs/canon/CANON-CITY-RULES-RU-2215-0001.md|canon|draft|RULE|CANON-CITY-BOUNDARY-RU-2215-0008,CANON-CITY-REGISTRY-RU-2215-0001|SPEC-DOC-STYLE-2215-0001|
|CANON-CONFLICT-GLOBAL-2215-0001|docs/canon/CANON-CONFLICT-GLOBAL-2215-0001.md|canon|fixed|RULE||SPEC-DOC-STYLE-2215-0001,CANON-CORE-GLOBAL-2215-0001,CANON-SYSTEMS-GLOBAL-2215-0001,CANON-ORDERS-GLOBAL-2215-0003|
|CANON-CORE-GLOBAL-2215-0001|docs/canon/CANON-CORE-GLOBAL-2215-0001.md|canon|fixed|BIND||SPEC-DOC-STYLE-2215-0001,SSOT-CONSISTENCY-A-2215-0009,SSOT-SCENARIO-A-2215-0001,SSOT-ENERGY-A-2215-0004,SSOT-ECONOMY-A-2215-0003,SSOT-AUTOMATION-A-2215-0004,SSOT-DEMOGRAPHY-A-2215-0002,SSOT-CLIMATE-A-2215-0004,SSOT-GOVERNANCE-SECURITY-A-2215-0005,SSOT-URBANISM-A-2215-0007,SSOT-LIFE-A-2215-0007,SSOT-SPACE-INDUSTRY-A-2215-0006|
|CANON-FSSU-CITYVIEW-RU16-2215-0001|docs/canon/CANON-FSSU-CITYVIEW-RU16-2215-0001.md|canon|draft|RULE||CANON-FSSU-GLOBAL-2215-0005,CANON-FSSU-REGIONAL-RU16-2215-0001,CANON-FSSU-DEPT-STRUCT-RU16-2215-0001,CANON-SYSTEM-ONTOLOGY-2215-0001,REG-FSSU-AUTO-LOWIMPACT-2215-0001,SPEC-DOC-ID-2215-0001,SPEC-DOC-STYLE-2215-0001,SPEC-PRIORITY-RESOLUTION-2215-0001|
|CANON-FSSU-DEPT-STRUCT-RU16-2215-0001|docs/canon/CANON-FSSU-DEPT-STRUCT-RU16-2215-0001.md|canon|draft|RULE||CANON-FSSU-GLOBAL-2215-0005,CANON-FSSU-REGIONAL-RU16-2215-0001,CANON-SYSTEM-ONTOLOGY-2215-0001,REG-FSSU-AUTO-LOWIMPACT-2215-0001,SPEC-DOC-ID-2215-0001,SPEC-DOC-STYLE-2215-0001,SPEC-PRIORITY-RESOLUTION-2215-0001|
|CANON-FSSU-GLOBAL-2215-0005|docs/canon/CANON-FSSU-GLOBAL-2215-0005.md|canon|draft|RULE|CANON-CONFLICT-GLOBAL-2215-0001,CANON-ORDERS-GLOBAL-2215-0003,CANON-SYSTEM-ONTOLOGY-2215-0001,CANON-SYSTEMS-GLOBAL-2215-0001|SPEC-DOC-STYLE-2215-0001,SPEC-PRIORITY-RESOLUTION-2215-0001|
|CANON-FSSU-REGIONAL-RU16-2215-0001|docs/canon/CANON-FSSU-REGIONAL-RU16-2215-0001.md|canon|draft|RULE||CANON-FSSU-GLOBAL-2215-0005,CANON-SYSTEM-ONTOLOGY-2215-0001,SPEC-DOC-ID-2215-0001,SPEC-DOC-STYLE-2215-0001,SPEC-PRIORITY-RESOLUTION-2215-0001|
|CANON-FSSU-TEAM-STRUCT-2215-0001|docs/canon/CANON-FSSU-TEAM-STRUCT-2215-0001.md|canon|draft|RULE||CANON-FSSU-GLOBAL-2215-0005,CANON-FSSU-REGIONAL-RU16-2215-0001,CANON-SYSTEM-ONTOLOGY-2215-0001,SPEC-DOC-ID-2215-0001,SPEC-DOC-STYLE-2215-0001,SPEC-PRIORITY-RESOLUTION-2215-0001|
|CANON-LOC-CHELNY-2215-0001|docs/canon/CANON-LOC-CHELNY-2215-0001.md|canon|draft|INTERFACE|CANON-LOC-CHELNY-REGISTRY-2215-0001,CANON-LOC-CHELNY-RULES-2215-0001|SPEC-DOC-STYLE-2215-0001,SPEC-PRIORITY-RESOLUTION-2215-0001|
|CANON-LOC-CHELNY-REGISTRY-2215-0001|docs/canon/CANON-LOC-CHELNY-REGISTRY-2215-0001.md|canon|draft|STATE||SPEC-DOC-STYLE-2215-0001,SPEC-PRIORITY-RESOLUTION-2215-0001|
|CANON-LOC-CHELNY-RULES-2215-0001|docs/canon/CANON-LOC-CHELNY-RULES-2215-0001.md|canon|draft|RULE|BASELINE-PHYSICAL_LEVEL_MID-2215-0001,CANON-CITY-BOUNDARY-RU-2215-0008,CANON-CITY-RU-2215-0007,SSOT-LOC-WEATHER-CHELNY-2215-0001,SSOT-URBANISM-A-2215-0007,CANON-LOC-CHELNY-REGISTRY-2215-0001|SPEC-DOC-STYLE-2215-0001,SPEC-PRIORITY-RESOLUTION-2215-0001|
|CANON-LOC-FSSU-OFFICE-CHELNY-2215-0001|docs/canon/CANON-LOC-FSSU-OFFICE-CHELNY-2215-0001.md|canon|draft|STATE||CANON-LOC-CHELNY-2215-0001,SPEC-DOC-ID-2215-0001,SPEC-DOC-STYLE-2215-0001,SPEC-PRIORITY-RESOLUTION-2215-0001|
|CANON-METRICS-GLOBAL-2215-0002|docs/canon/CANON-METRICS-GLOBAL-2215-0002.md|canon|draft|RULE|CANON-CORE-GLOBAL-2215-0001,SSOT-CONSISTENCY-A-2215-0009|SPEC-PRIORITY-RESOLUTION-2215-0001|
|CANON-ORDERS-GLOBAL-2215-0003|docs/canon/CANON-ORDERS-GLOBAL-2215-0003.md|canon|draft|RULE||SPEC-DOC-STYLE-2215-0001,CANON-CORE-GLOBAL-2215-0001,CANON-SYSTEMS-GLOBAL-2215-0001,CANON-CONFLICT-GLOBAL-2215-0001,CANON-FSSU-GLOBAL-2215-0005|
|CANON-ORGS-2215-0001|docs/canon/CANON-ORGS-2215-0001.md|canon|fixed|STATE|SSOT-ECONOMY-A-2215-0003||
|CANON-RECENT-20Y-MEMORY-PACK-2215-0001|docs/canon/CANON-RECENT-20Y-MEMORY-PACK-2215-0001.md|canon|fixed|INTERFACE||CANON-BASE-NARRATIVE-GLOBAL-2215-0001,CANON-BASE-RULE-GLOBAL-2215-0001|
|CANON-REPORTS-GLOBAL-2215-0006|docs/canon/CANON-REPORTS-GLOBAL-2215-0006.md|canon|draft|RULE|CANON-ORDERS-GLOBAL-2215-0003,CANON-FSSU-GLOBAL-2215-0005,CANON-ZONES-GLOBAL-2215-0004|SPEC-DOC-STYLE-2215-0001,SPEC-PRIORITY-RESOLUTION-2215-0001|
|CANON-ROLE-MIRON-FSSU-2215-0001|docs/canon/CANON-ROLE-MIRON-FSSU-2215-0001.md|canon|draft|RULE||CANON-FSSU-GLOBAL-2215-0005,CANON-FSSU-REGIONAL-RU16-2215-0001,CANON-FSSU-TEAM-STRUCT-2215-0001,CANON-SYSTEM-ONTOLOGY-2215-0001,SPEC-DOC-ID-2215-0001,SPEC-DOC-STYLE-2215-0001,SPEC-PRIORITY-RESOLUTION-2215-0001|
|CANON-ROLE-RINAT-FSSU-2215-0001|docs/canon/CANON-ROLE-RINAT-FSSU-2215-0001.md|canon|draft|RULE||CANON-FSSU-GLOBAL-2215-0005,CANON-FSSU-REGIONAL-RU16-2215-0001,CANON-FSSU-TEAM-STRUCT-2215-0001,SPEC-DOC-ID-2215-0001,SPEC-DOC-STYLE-2215-0001,SPEC-PRIORITY-RESOLUTION-2215-0001|
|CANON-SCENE-RULESET-2215-0001|docs/canon/CANON-SCENE-RULESET-2215-0001.md|canon|draft|RULE||SPEC-PRIORITY-RESOLUTION-2215-0001,SPEC-SCENE-CONTRACT-2215-0001|
|CANON-SYSTEM-ONTOLOGY-2215-0001|docs/canon/CANON-SYSTEM-ONTOLOGY-2215-0001.md|canon|draft|STATE|CANON-CONFLICT-GLOBAL-2215-0001,CANON-SYSTEMS-GLOBAL-2215-0001|SPEC-DOC-STYLE-2215-0001,SPEC-PRIORITY-RESOLUTION-2215-0001|
|CANON-SYSTEM-VOICE-GLOBAL-2215-0001|docs/canon/CANON-SYSTEM-VOICE-GLOBAL-2215-0001.md|canon|draft|RULE|CANON-VOCAB-GLOBAL-2215-0001,CANON-REPORTS-GLOBAL-2215-0006|SPEC-DOC-STYLE-2215-0001,SPEC-PRIORITY-RESOLUTION-2215-0001|
|CANON-SYSTEMS-GLOBAL-2215-0001|docs/canon/CANON-SYSTEMS-GLOBAL-2215-0001.md|canon|fixed|STATE||SPEC-DOC-STYLE-2215-0001,CANON-CORE-GLOBAL-2215-0001,CANON-CONFLICT-GLOBAL-2215-0001|
|CANON-VIBE-FLOW-GLOBAL-2215-0001|docs/canon/CANON-VIBE-FLOW-GLOBAL-2215-0001.md|canon|draft|RULE|CANON-VIBE-RESTLESS-GLOBAL-2215-0001|SPEC-DOC-ID-2215-0001,SPEC-DOC-STYLE-2215-0001,SPEC-PRIORITY-RESOLUTION-2215-0001|
|CANON-VIBE-KINETIC-GLOBAL-2215-0001|docs/canon/CANON-VIBE-KINETIC-GLOBAL-2215-0001.md|canon|draft|RULE|CANON-LOC-CHELNY-2215-0001|SPEC-DOC-ID-2215-0001,SPEC-DOC-STYLE-2215-0001,SPEC-PRIORITY-RESOLUTION-2215-0001|
|CANON-VIBE-RESTLESS-GLOBAL-2215-0001|docs/canon/CANON-VIBE-RESTLESS-GLOBAL-2215-0001.md|canon|draft|RULE|CANON-ARTIFACT-SNIPPETS-GLOBAL-2215-0001,CANON-LOC-CHELNY-2215-0001,CANON-SYSTEM-VOICE-GLOBAL-2215-0001|SPEC-DOC-ID-2215-0001,SPEC-DOC-STYLE-2215-0001,SPEC-PRIORITY-RESOLUTION-2215-0001|
|CANON-VIBE-ROUTER-GLOBAL-2215-0001|docs/canon/CANON-VIBE-ROUTER-GLOBAL-2215-0001.md|canon|draft|RULE|CANON-VIBE-FLOW-GLOBAL-2215-0001,CANON-VIBE-KINETIC-GLOBAL-2215-0001,CANON-VIBE-RESTLESS-GLOBAL-2215-0001,CANON-VIBE-VELVET-GLOBAL-2215-0001,CANON-VIBE-VOID-GLOBAL-2215-0001|SPEC-DOC-ID-2215-0001,SPEC-DOC-STYLE-2215-0001,SPEC-PRIORITY-RESOLUTION-2215-0001|
|CANON-VIBE-VELVET-GLOBAL-2215-0001|docs/canon/CANON-VIBE-VELVET-GLOBAL-2215-0001.md|canon|draft|RULE|CANON-VIBE-RESTLESS-GLOBAL-2215-0001|SPEC-DOC-ID-2215-0001,SPEC-DOC-STYLE-2215-0001,SPEC-PRIORITY-RESOLUTION-2215-0001|
|CANON-VIBE-VOID-GLOBAL-2215-0001|docs/canon/CANON-VIBE-VOID-GLOBAL-2215-0001.md|canon|draft|RULE|CANON-VIBE-RESTLESS-GLOBAL-2215-0001|SPEC-DOC-ID-2215-0001,SPEC-DOC-STYLE-2215-0001,SPEC-PRIORITY-RESOLUTION-2215-0001|
|CANON-VOCAB-GLOBAL-2215-0001|docs/canon/CANON-VOCAB-GLOBAL-2215-0001.md|canon|draft|RULE|CANON-CAST-GLOBAL-2215-0001,CANON-REPORTS-GLOBAL-2215-0006||
|CANON-ZONES-GLOBAL-2215-0004|docs/canon/CANON-ZONES-GLOBAL-2215-0004.md|canon|draft|STATE||SPEC-DOC-STYLE-2215-0001,SPEC-PRIORITY-RESOLUTION-2215-0001,CANON-CORE-GLOBAL-2215-0001,CANON-SYSTEMS-GLOBAL-2215-0001,CANON-ORDERS-GLOBAL-2215-0003,CANON-CONFLICT-GLOBAL-2215-0001,CANON-FSSU-GLOBAL-2215-0005|
|IDX-CORPUS-0001|docs/idx/IDX-CORPUS-0001.md|idx|draft|INDEX|||
|PLAN-DEFAULT-ENVIRONMENT-2215-0001|docs/plan/PLAN-DEFAULT-ENVIRONMENT-2215-0001.md|plan|draft|INTERFACE|BASELINE-PHYSICAL_LEVEL_MID-2215-0001,SSOT-SCENARIO-A-2215-0001|SPEC-DOC-STYLE-2215-0001|
|PLAN-STORY-2215-0001|docs/plan/PLAN-STORY-2215-0001.md|plan|fixed|RULE|CANON-ARTIFACT-SNIPPETS-GLOBAL-2215-0001,CANON-CAST-GLOBAL-2215-0001,CANON-CONFLICT-GLOBAL-2215-0001,CANON-ORDERS-GLOBAL-2215-0003,CANON-REPORTS-GLOBAL-2215-0006,CANON-SYSTEM-VOICE-GLOBAL-2215-0001,CANON-SYSTEMS-GLOBAL-2215-0001,CANON-ARCS-GLOBAL-2215-0001|SPEC-PRIORITY-RESOLUTION-2215-0001,SPEC-SCENE-CONTRACT-2215-0001|
|PROTOCOL-CHAPTER_DELIVERY-2215-0001|docs/protocol/PROTOCOL-CHAPTER_DELIVERY-2215-0001.md|protocol|draft|INTERFACE|CANON-CORE-GLOBAL-2215-0001,CANON-METRICS-GLOBAL-2215-0002,CANON-SCENE-RULESET-2215-0001|SPEC-DOC-STYLE-2215-0001,SPEC-PRIORITY-RESOLUTION-2215-0001,PROTOCOL-SCENE_GEN-2215-0001|
|PROTOCOL-SCENE_GEN-2215-0001|docs/protocol/PROTOCOL-SCENE_GEN-2215-0001.md|protocol|fixed|INTERFACE|CANON-ARTIFACT-SNIPPETS-GLOBAL-2215-0001,CANON-CAST-GLOBAL-2215-0001,CANON-SYSTEM-VOICE-GLOBAL-2215-0001,CANON-VOCAB-GLOBAL-2215-0001,SPEC-SCENE-CONTRACT-2215-0001,PLAN-STORY-2215-0001|SPEC-DOC-STYLE-2215-0001,SPEC-PRIORITY-RESOLUTION-2215-0001|
|REG-FSSU-AUTO-LOWIMPACT-2215-0001|docs/registry/REG-FSSU-AUTO-LOWIMPACT-2215-0001.md|registry|draft|STATE||CANON-FSSU-REGIONAL-RU16-2215-0001,SPEC-DOC-ID-2215-0001,SPEC-DOC-STYLE-2215-0001,SPEC-PRIORITY-RESOLUTION-2215-0001|
|REG-TECH-2215-0001|docs/registry/REG-TECH-2215-0001.md|registry|fixed|STATE|BASELINE-PHYSICAL_LEVEL_MID-2215-0001|SPEC-DOC-STYLE-2215-0001|
|REG-UNKNOWN-2215-0001|docs/registry/REG-UNKNOWN-2215-0001.md|registry|draft|STATE|BASELINE-PHYSICAL_LEVEL_MID-2215-0001|SPEC-DOC-STYLE-2215-0001|
|SCENE-ACT-RU-2215-0001|docs/scene/SCENE-ACT-RU-2215-0001.md|scene|draft|INDEX|BASELINE-PHYSICAL_LEVEL_MID-2215-0001,CANON-CONFLICT-GLOBAL-2215-0001,SSOT-LAW-A-2215-0008,CANON-CAST-VOICE-2215-0001,CANON-BASE-RULE-GLOBAL-2215-0001,CANON-SYSTEMS-GLOBAL-2215-0001,PLAN-STORY-2215-0001|PLAN-STORY-2215-0001|
|SCENE-ACT-RU-2215-0002|docs/scene/SCENE-ACT-RU-2215-0002.md|scene|draft|INDEX|BASELINE-PHYSICAL_LEVEL_MID-2215-0001,CANON-BASE-RULE-GLOBAL-2215-0001,CANON-CONFLICT-GLOBAL-2215-0001,CANON-SYSTEMS-GLOBAL-2215-0001,PLAN-STORY-2215-0001|SCENE-ACT-RU-2215-0001|
|SCENE-ACT-RU-2215-0003|docs/scene/SCENE-ACT-RU-2215-0003.md|scene|draft|INDEX|BASELINE-PHYSICAL_LEVEL_MID-2215-0001,CANON-BASE-RULE-GLOBAL-2215-0001,CANON-CONFLICT-GLOBAL-2215-0001,CANON-SYSTEMS-GLOBAL-2215-0001,PLAN-STORY-2215-0001|SCENE-ACT-RU-2215-0002|
|SCENE-ACT-RU-2215-0004|docs/scene/SCENE-ACT-RU-2215-0004.md|scene|draft|INDEX|BASELINE-PHYSICAL_LEVEL_MID-2215-0001,CANON-BASE-RULE-GLOBAL-2215-0001,CANON-CONFLICT-GLOBAL-2215-0001,CANON-SYSTEMS-GLOBAL-2215-0001,PLAN-STORY-2215-0001|SCENE-ACT-RU-2215-0003|
|SCENE-ACT-RU-2215-0005|docs/scene/SCENE-ACT-RU-2215-0005.md|scene|draft|INDEX|BASELINE-PHYSICAL_LEVEL_MID-2215-0001,CANON-BASE-RULE-GLOBAL-2215-0001,CANON-CONFLICT-GLOBAL-2215-0001,CANON-SYSTEMS-GLOBAL-2215-0001,PLAN-STORY-2215-0001|SCENE-ACT-RU-2215-0004|
|SPEC-DOC-ID-2215-0001|docs/spec/SPEC-DOC-ID-2215-0001.md|spec|draft|RULE||SPEC-DOC-STYLE-2215-0001|
|SPEC-DOC-STYLE-2215-0001|docs/spec/SPEC-DOC-STYLE-2215-0001.md|spec|fixed|RULE||SPEC-PRIORITY-RESOLUTION-2215-0001|
|SPEC-METHODOLOGY-2215-0001|docs/spec/SPEC-METHODOLOGY-2215-0001.md|spec|draft|RULE||IDX-CORPUS-0001,SPEC-DOC-ID-2215-0001,SPEC-DOC-STYLE-2215-0001,SPEC-PRIORITY-RESOLUTION-2215-0001|
|SPEC-PRIORITY-RESOLUTION-2215-0001|docs/spec/SPEC-PRIORITY-RESOLUTION-2215-0001.md|spec|fixed|RULE|||
|SPEC-QUALITATIVE-ENUMS-2215-0001|docs/spec/SPEC-QUALITATIVE-ENUMS-2215-0001.md|spec|fixed|RULE|||
|SPEC-SCENE-CONTRACT-2215-0001|docs/spec/SPEC-SCENE-CONTRACT-2215-0001.md|spec|draft|RULE||BASELINE-DAILY_OPS-2215-0002,BASELINE-SOCIAL-2215-0001,CANON-CORE-GLOBAL-2215-0001,CANON-ARTIFACT-SNIPPETS-GLOBAL-2215-0001,CANON-ORDERS-GLOBAL-2215-0003,CANON-SYSTEMS-GLOBAL-2215-0001,SPEC-DOC-STYLE-2215-0001,SPEC-PRIORITY-RESOLUTION-2215-0001|
|SSOT-AUTOMATION-A-2215-0004|docs/ssot/SSOT-AUTOMATION-A-2215-0004.md|ssot|draft|STATE||SPEC-DOC-STYLE-2215-0001,SSOT-SCENARIO-A-2215-0001|
|SSOT-CLIMATE-A-2215-0004|docs/ssot/SSOT-CLIMATE-A-2215-0004.md|ssot|draft|STATE||SPEC-DOC-STYLE-2215-0001,SSOT-SCENARIO-A-2215-0001,SSOT-ENERGY-A-2215-0004|
|SSOT-CONSISTENCY-A-2215-0009|docs/ssot/SSOT-CONSISTENCY-A-2215-0009.md|ssot|draft|RULE||SPEC-DOC-STYLE-2215-0001,SSOT-SCENARIO-A-2215-0001,SSOT-ECONOMY-A-2215-0003,SSOT-DEMOGRAPHY-A-2215-0002,SSOT-AUTOMATION-A-2215-0004,SSOT-ENERGY-A-2215-0004,SSOT-CLIMATE-A-2215-0004,SSOT-GOVERNANCE-SECURITY-A-2215-0005,SSOT-URBANISM-A-2215-0007|
|SSOT-DEMOGRAPHY-A-2215-0002|docs/ssot/SSOT-DEMOGRAPHY-A-2215-0002.md|ssot|draft|STATE|SSOT-SCENARIO-A-2215-0001,SSOT-ECONOMY-A-2215-0003,SSOT-LIFE-A-2215-0007|SPEC-DOC-STYLE-2215-0001|
|SSOT-ECONOMY-A-2215-0003|docs/ssot/SSOT-ECONOMY-A-2215-0003.md|ssot|draft|STATE||SPEC-DOC-STYLE-2215-0001,SSOT-SCENARIO-A-2215-0001,SSOT-DEMOGRAPHY-A-2215-0002,SSOT-AUTOMATION-A-2215-0004|
|SSOT-ENERGY-A-2215-0004|docs/ssot/SSOT-ENERGY-A-2215-0004.md|ssot|draft|STATE||SSOT-SCENARIO-A-2215-0001,SSOT-ECONOMY-A-2215-0003|
|SSOT-GOVERNANCE-SECURITY-A-2215-0005|docs/ssot/SSOT-GOVERNANCE-SECURITY-A-2215-0005.md|ssot|draft|STATE||SSOT-SCENARIO-A-2215-0001,SSOT-ECONOMY-A-2215-0003|
|SSOT-LAW-A-2215-0008|docs/ssot/SSOT-LAW-A-2215-0008.md|ssot|fixed|STATE|||
|SSOT-LIFE-A-2215-0007|docs/ssot/SSOT-LIFE-A-2215-0007.md|ssot|draft|STATE||SSOT-SCENARIO-A-2215-0001,SSOT-DEMOGRAPHY-A-2215-0002,SSOT-ECONOMY-A-2215-0003,SPEC-QUALITATIVE-ENUMS-2215-0001|
|SSOT-LOC-WEATHER-CHELNY-2215-0001|docs/ssot/SSOT-LOC-WEATHER-CHELNY-2215-0001.md|ssot|draft|STATE||SPEC-DOC-STYLE-2215-0001|
|SSOT-SCENARIO-A-2215-0001|docs/ssot/SSOT-SCENARIO-A-2215-0001.md|ssot|draft|STATE||SPEC-DOC-STYLE-2215-0001|
|SSOT-SPACE-INDUSTRY-A-2215-0006|docs/ssot/SSOT-SPACE-INDUSTRY-A-2215-0006.md|ssot|draft|STATE|REG-TECH-2215-0001,SSOT-SCENARIO-A-2215-0001,SSOT-ECONOMY-A-2215-0003|SPEC-DOC-STYLE-2215-0001|
|SSOT-URBANISM-A-2215-0007|docs/ssot/SSOT-URBANISM-A-2215-0007.md|ssot|fixed|STATE|SSOT-SCENARIO-A-2215-0001,SSOT-DEMOGRAPHY-A-2215-0002,BASELINE-PHYSICAL_LEVEL_MID-2215-0001|SPEC-DOC-STYLE-2215-0001|
## USAGE / RESOLUTION

[DECISION][CORP-200] Tools generating AI_CONTEXT or performing lint MUST consume only rows of this table; ELSE FAIL.
[DECISION][CORP-210] Filename MUST equal `<id>.md`; ELSE FAIL.
[DECISION][CORP-220] Path column is informational and MUST NOT redefine membership.

## OUTPUT CONTRACT

~~~yaml
doc_id: IDX-CORPUS-0001
role_type: INDEX
export:
  column_types:
    id: doc_id
    file: path
    class: enum
    status: enum
    role_type: enum
    inputs: doc_id_csv
    depends_on: doc_id_csv
  column_encoding:
    doc_id_csv:
      separator: ","
      empty: ""
      trim: true
  columns:
    - id
    - file
    - class
    - status
    - role_type
    - inputs
    - depends_on
  primary_key: id
  rows_source: CONTENT
~~~

## FORBIDDEN

[FORBIDDEN][CORP-900] Using folder scan as corpus membership.
[FORBIDDEN][CORP-901] Consuming documents not present in this registry.
[FORBIDDEN][CORP-902] Treating any content outside the table in `## CONTENT` as registry data.
[FORBIDDEN][CORP-903] Using placeholders like "—" in CSV-typed columns.
[FORBIDDEN][CORP-904] Emitting spaces around separators in doc_id_csv (must be "," only).

## NON-NORMATIVE

(empty)

~~~
</file>

<file path="plan/PLAN-DEFAULT-ENVIRONMENT-2215-0001.md">
~~~markdown
---
id: PLAN-DEFAULT-ENVIRONMENT-2215-0001
title: >
  Default Environment Plan — 2215 (Scenario A)
class: plan
status: draft
version: 0.3.0
inputs:
  - BASELINE-PHYSICAL_LEVEL_MID-2215-0001
  - SSOT-SCENARIO-A-2215-0001
depends_on:
  - SPEC-DOC-STYLE-2215-0001
scope: >
  Структурный PLAN-контракт для описания дефолтной среды 2215.
  Определяет модули, категории параметров, типы значений и требования трассировки
  baseline/override при использовании в сценах. Не фиксирует факты мира и значения.
---

## LLM-INTENT

ROLE_TYPE: INTERFACE
SCOPE: structural skeleton for environment baselines and scene snapshots; no world facts or default values
INPUTS:
  - BASELINE-PHYSICAL_LEVEL_MID-2215-0001
  - SSOT-SCENARIO-A-2215-0001
  - override_documents
OUTPUTS:
  - environment_modules
  - parameter_schema
  - scene_snapshot_contract
FORBIDDEN:
  - world_facts
  - numeric_defaults
  - narrative_explanations

---

## DEFINITIONS

[DECISION][PLAN-DEF-010] environment = set of physical/sensory/infrastructure conditions perceived in a scene.
[DECISION][PLAN-DEF-011] access_level ∈ {LEVEL-LOW, LEVEL-MID, LEVEL-HIGH}.
[DECISION][PLAN-DEF-012] baseline = source of default values and prohibitions for environment (by access_level).
[DECISION][PLAN-DEF-013] ssot = source of world invariants; SSOT is not used directly as scene numeric defaults.
[DECISION][PLAN-DEF-014] override = local deviation from baseline with explicit cause, scope, and trace.

---

## INVARIANTS

[DECISION][PLAN-INV-010] PLAN MUST NOT assert world facts.
[DECISION][PLAN-INV-011] PLAN MUST NOT contain numeric parameter values.
[DECISION][PLAN-INV-012] Any environment baseline MUST conform to this module/category/value-type structure.
[DECISION][PLAN-INV-013] Any scene using environment MUST be traceable to baseline and/or override and/or artifact reference.

---

## CONTENT

### 1. Environment modules (mandatory set)

[DECISION][PLAN-MOD-010] environment_modules MUST be:
- Housing
- Building
- City
- Transport
- Workspaces
- Soundscape
- LightVisibility
- Interfaces
- PrivacyLogging
- SafetyEnforcement

[DECISION][PLAN-MOD-011] Missing any module from PLAN-MOD-010 makes the environment baseline invalid.

---

### 2. Parameter categories (per module)

[DECISION][PLAN-CAT-010] Each module MUST define parameter categories:
- Geometry
- Climate
- Acoustics
- Materials
- Energy
- Maintenance
- Connectivity
- UIInteraction
- Mobility
- Constraints

[DECISION][PLAN-CAT-011] Category Constraints MUST exist for every module.

---

### 3. Allowed value types (for baseline/override)

[DECISION][PLAN-VAL-010] Allowed value types are:
- range (min/max + optional p50)
- enum
- boolean
- narrative_tag (≤3 neutral words)
- forbidden_list

[DECISION][PLAN-VAL-011] Numeric values are allowed only in BASELINE or OVERRIDE documents, never in PLAN.

---

### 4. Normative markers

[DECISION][PLAN-NORM-010] PLAN MUST use [DECISION] markers only.
[DECISION][PLAN-NORM-011] PLAN MUST NOT use markers {FACT, DEFAULT, FORBIDDEN, RULE, NOTE, UNKNOWN}.

---

### 5. Sensor fields (scene-facing, non-narrative)

[DECISION][PLAN-SENS-010] Scene-facing sensor fields MUST be measurable keys or narrative_tag; no metaphors.
[DECISION][PLAN-SENS-011] Sensor fields do not introduce facts; they reference baseline/override/artifact.

---

### 6. Access level coverage (baseline requirement)

[DECISION][PLAN-ACL-010] Any environment baseline MUST include access levels:
- LEVEL-LOW (≥5 parameters total across modules)
- LEVEL-MID (full passport; primary)
- LEVEL-HIGH (≥5 parameters total across modules)

[DECISION][PLAN-ACL-011] LEVEL-MID is default only inside BASELINE value resolution; PLAN does not select values.

---

### 7. Scene integration (Environment Snapshot)

[DECISION][PLAN-SCN-010] Scenes MUST use environment only via Environment Snapshot (not via declarative exposition).
[DECISION][PLAN-SCN-011] Environment Snapshot MAY include:
- access_level
- module_overrides (optional)
- sensors (2–5 keys)
- route_tag (optional)
- district_tag (optional)

[DECISION][PLAN-SCN-012] Snapshot MUST NOT explain causality and MUST NOT replace FSSU artifacts (CD/EL/CM/FM/RP).

---

### 8. Allowed sensor keys (scene-level)

[DECISION][PLAN-SCN-020] Allowed sensors keys are:
- noise_db
- wind_mps
- humidity_percent
- temperature_c
- latency_ms
- packet_loss_percent
- light_k
- visibility (meters_or_enum)
- traffic_flow_0_1
- background_noise_tag

[DECISION][PLAN-SCN-021] Emotional or evaluative keys are not allowed.

---

### 9. Traceability requirement

[DECISION][PLAN-TRC-010] Any sensor parameter that affects scene outcome MUST be traceable to:
- baseline, OR
- override, OR
- artifact reference (e.g., telemetry snapshot).

---

### 10. Override requirements

[DECISION][PLAN-OVR-010] Any deviation from baseline MUST be expressed via override document.
[DECISION][PLAN-OVR-011] Override MUST specify:
- overridden baseline anchor
- justification
- scope

---

### 11. Compliance checklist (mechanical)

[DECISION][PLAN-CHK-010] Environment baseline is compliant IFF:
- all modules from PLAN-MOD-010 are covered
- LEVEL-MID passport exists
- constraints are explicit
- no forbidden markers appear in PLAN
- dependencies are resolvable

---

## USAGE / RESOLUTION

[DECISION][PLAN-USE-010] PLAN is a structural contract for baseline and scene authors only.
[DECISION][PLAN-USE-011] PLAN does not participate in value precedence or selection.

---

## OUTPUT CONTRACT

~~~yaml
doc_id: PLAN-DEFAULT-ENVIRONMENT-2215-0001
ROLE_TYPE: INTERFACE
export:
  environment_modules:
    - Housing
    - Building
    - City
    - Transport
    - Workspaces
    - Soundscape
    - LightVisibility
    - Interfaces
    - PrivacyLogging
    - SafetyEnforcement
  parameter_categories:
    - Geometry
    - Climate
    - Acoustics
    - Materials
    - Energy
    - Maintenance
    - Connectivity
    - UIInteraction
    - Mobility
    - Constraints
  scene_snapshot_contract:
    allowed_keys:
      - access_level
      - module_overrides
      - sensors
      - route_tag
      - district_tag
    sensors_allowed:
      - noise_db
      - wind_mps
      - humidity_percent
      - temperature_c
      - latency_ms
      - packet_loss_percent
      - light_k
      - visibility
      - traffic_flow_0_1
      - background_noise_tag
~~~

---

## NON-NORMATIVE

(Empty by design)

~~~
</file>

<file path="plan/PLAN-STORY-2215-0001.md">
~~~markdown
---
id: PLAN-STORY-2215-0001
title: >
  Сюжетный каркас романа — 5 актов, 3 кейса, 35 глав, процедурная спираль ФССУ
class: plan
status: fixed
version: 1.0.0
prefix: PSSK
doc_language: en
prose_language: ru-RU
inputs:
  - CANON-ARTIFACT-SNIPPETS-GLOBAL-2215-0001
  - CANON-CAST-GLOBAL-2215-0001
  - CANON-CONFLICT-GLOBAL-2215-0001
  - CANON-ORDERS-GLOBAL-2215-0003
  - CANON-REPORTS-GLOBAL-2215-0006
  - CANON-SYSTEM-VOICE-GLOBAL-2215-0001
  - CANON-SYSTEMS-GLOBAL-2215-0001
  - CANON-ARCS-GLOBAL-2215-0001
depends_on:
  - SPEC-PRIORITY-RESOLUTION-2215-0001
  - SPEC-SCENE-CONTRACT-2215-0001
scope: >
  PLAN-макроструктура романа 2215: акты/кейсы/главы и обязательные
  процедурные теги глав. Без художественного текста и без SSOT-метрик.
  Синхронизирован с SCENE-ACT-RU-2215-0001..0005 (source of truth для содержания сцен).
  Целевой объём: 400–450 страниц, 35 глав.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: enforceable story structure (acts/cases/chapters/tags) without prose; supports deterministic chapter authoring
INPUTS: [CANON-ARTIFACT-SNIPPETS-GLOBAL-2215-0001, CANON-CAST-GLOBAL-2215-0001, CANON-CONFLICT-GLOBAL-2215-0001, CANON-ORDERS-GLOBAL-2215-0003, CANON-REPORTS-GLOBAL-2215-0006, CANON-SYSTEM-VOICE-GLOBAL-2215-0001, CANON-SYSTEMS-GLOBAL-2215-0001, CANON-ARCS-GLOBAL-2215-0001, SPEC-SCENE-CONTRACT-2215-0001, SPEC-PRIORITY-RESOLUTION-2215-0001]
OUTPUTS: [act_case_structure, procedural_spiral_pattern, chapter_tags_contract]
FORBIDDEN: [fiction_prose, invent_new_world_metrics, introduce_new_roles, lecture_exposition, softeners]

## DEFINITIONS

[FACT][PSSK-010] `act` = верхний структурный блок романа (I..V).
[FACT][PSSK-020] `case` = крупный процедурный кейс, проходящий через главы и артефакты ФССУ.
[FACT][PSSK-030] `chapter_card` = запись {act_id, case_id, chapter_id, title, tags.participants, tags.focus, tags.artifact, tags.type}.
[FACT][PSSK-040] `procedural_spiral_step` = {anomaly_detection, investigation, bureaucratic_wall, escalation, new_jurisdiction_level, remedy}.
[FACT][PSSK-050] `artifact_type` = {CD, EL, CM, FM, RP, PRS}.
[FACT][PSSK-055] `chapter_type` ∈ {procedural, character_beat, interlude}. `procedural` = стандартная глава. `character_beat` = глава-якорь, фокус на персонаже за пределами процедуры. `interlude` = короткая вставка (POV антагониста-агента, город, пауза).
[FACT][PSSK-060] `tags.focus` = доминантный `procedural_spiral_step` для главы (для character_beat/interlude допустимо метафорическое соответствие).
[FACT][PSSK-070] `tags.participants` = список имён, допустимых только из `CANON-CAST_REGISTRY-GLOBAL-2215-0001`.
[FACT][PSSK-080] `tags.artifact` = типизированная ссылка на артефакт (см. `CANON-REPORTS-GLOBAL-2215-0006` и `CANON-ARTIFACT-SNIPPETS-GLOBAL-2215-0001`). Для character_beat допустимо `none`.

[FACT][PSSK-090] `act_case_structure` = YAML-пейлоад (ключ верхнего уровня `act_case_structure`) в `## CONTENT`, являющийся единственным авторитетным источником структуры актов/кейсов/глав.
[FACT][PSSK-091] `acts` = `act_case_structure.acts` (list).
[FACT][PSSK-092] `acts.count` = len(`act_case_structure.acts`).
[FACT][PSSK-093] `cases` = множество всех `case_id`, извлечённых из `act_case_structure.acts[*].case.case_id`.
[FACT][PSSK-094] `cases.count` = cardinality(`cases`).

[FACT][PSSK-095] `chapter_cards` = все записи `act_case_structure.acts[*].chapters[*]`.
[FACT][PSSK-096] `chapter_cards.count` = сумма len(`acts[i].chapters`) по всем актам.
[FACT][PSSK-097] `scene.active_specialists.count` = count(unique(`tags.participants`)) для каждой главы.

[FACT][PSSK-098] `focus.ensemble` = булево требование, что множество значений `tags.focus` по всем главам покрывает ≥4 различных `procedural_spiral_step` и каждая из этих ≥4 встречается ≥2 раз.
[FACT][PSSK-190] `ratio.procedure` = 0.60 (нормативный параметр композиции; не вычисляется из пейлоада).
[FACT][PSSK-191] `ratio.operation` = 0.40 (нормативный параметр композиции; не вычисляется из пейлоада).

[FACT][PSSK-101] `operation_peak.acts` = [II,III,V] (нормативный список актов с пиком операций).
[FACT][PSSK-102] `operation_peak.primary` = [II,III] (нормативный список первичных актов пика операций).

[FACT][PSSK-103] `ending.type` = partial_win (нормативный токен типа финала).
[FACT][PSSK-104] `ending.world_state` = stable_adjusted (нормативный токен состояния мира в финале).
[FACT][PSSK-105] `ending.tone` = cold_stability (нормативный токен тона финала).

[FACT][PSSK-106] `FSSU.jurisdiction` = federal_direct_subordination_moscow (нормативный токен юрисдикции ФССУ).
[FACT][PSSK-107] `regional_authorities_must_not_command_FSSU` = true.

[FACT][PSSK-108] `antagonist_form` = optimization_contour_not_person (нормативный токен формы антагониста).
[FACT][PSSK-109] `dramaturgic_deficit` = infrastructure_windows_not_survival_poverty.
[FACT][PSSK-110] `engine_of_plot` = procedural_escalation_not_catch_villain.

[FACT][PSSK-111] `system_inserts` = вставки "системного голФССУ" в главы (формат и допустимость задаёт `CANON-SYSTEM-VOICE-GLOBAL-2215-0001`).

[FACT][PSSK-112] `macro_frame` = триплет причинности {cause, mechanism, consequence}, заданный в `## CONTENT` как токены.
[FACT][PSSK-113] `complies_with(X)` = предикат: все требования X удовлетворены; иначе FAIL.
[FACT][PSSK-114] `grounded_via(A,B)` = предикат: термин/режим/зона упомянуты только если их определение присутствует в A и B; иначе FAIL.

[FACT][PSSK-115] `scene_act_source` = SCENE-ACT-RU-2215-{0001..0005} — авторитетный источник содержания scene-карт.
[FACT][PSSK-116] `case_layer_map` = маппинг case_id → conflict_layers (из CANON-CONFLICT-GLOBAL-2215-0001).
[FACT][PSSK-117] `target_pages` = [400, 450].
[FACT][PSSK-118a] `pages_per_chapter_avg` = target_pages / chapter_cards.count ≈ [11, 13].

## INVARIANTS

[DECISION][PSSK-119] acts.count MUST be 5; ELSE FAIL.
[DECISION][PSSK-119a] cases.count MUST be 3; ELSE FAIL.
[DECISION][PSSK-119b] chapter_cards.count MUST be 35; ELSE FAIL.
[DECISION][PSSK-120] focus.ensemble MUST be true; ELSE FAIL.
[DECISION][PSSK-121] For every chapter, scene.active_specialists.count MUST be in [1,3]; ELSE FAIL.
[DECISION][PSSK-130] ratio.procedure MUST be 0.60; ELSE FAIL.
[DECISION][PSSK-131] ratio.operation MUST be 0.40; ELSE FAIL.
[DECISION][PSSK-140] operation_peak.acts MUST equal [II,III,V]; ELSE FAIL.
[DECISION][PSSK-141] operation_peak.primary MUST equal [II,III]; ELSE FAIL.
[DECISION][PSSK-150] ending.type MUST be partial_win; ELSE FAIL.
[DECISION][PSSK-151] ending.world_state MUST be stable_adjusted; ELSE FAIL.
[DECISION][PSSK-152] ending.tone MUST be cold_stability; ELSE FAIL.
[DECISION][PSSK-160] FSSU.jurisdiction MUST be federal_direct_subordination_moscow; ELSE FAIL.
[DECISION][PSSK-161] regional_authorities_must_not_command_FSSU MUST be true; ELSE FAIL.
[DECISION][PSSK-170] antagonist_form MUST be optimization_contour_not_person; ELSE FAIL.
[DECISION][PSSK-171] dramaturgic_deficit MUST be infrastructure_windows_not_survival_poverty; ELSE FAIL.
[DECISION][PSSK-172] engine_of_plot MUST be procedural_escalation_not_catch_villain; ELSE FAIL.
[DECISION][PSSK-180] system_inserts MUST comply_with CANON-SYSTEM-VOICE-GLOBAL-2215-0001; ELSE FAIL.

## CONTENT

[DECISION][PSSK-200] procedural_spiral.steps MUST equal [anomaly_detection, investigation, bureaucratic_wall, escalation, new_jurisdiction_level, remedy]; ELSE FAIL.
[DECISION][PSSK-201] anomaly_detection MUST produce EL; ELSE FAIL.
[DECISION][PSSK-202] investigation MUST expand EL_and_start_CM; ELSE FAIL.
[DECISION][PSSK-203] bureaucratic_wall MUST include access_gating_orders_scope_window; ELSE FAIL.
[DECISION][PSSK-204] escalation MUST change perimeter_or_jurisdiction_via_mandate_or_order; ELSE FAIL.
[DECISION][PSSK-205] new_jurisdiction_level MUST enter new_contour_zone_or_federation_or_arbitration; ELSE FAIL.
[DECISION][PSSK-206] remedy MUST output RP_regime_correction; ELSE FAIL.

[DECISION][PSSK-220] macro_frame.cause MUST be optimization_by_KPI_under_fragmented_data; ELSE FAIL.
[DECISION][PSSK-221] macro_frame.mechanism MUST be legally_valid_distributed_decisions_across_contracts; ELSE FAIL.
[DECISION][PSSK-222] macro_frame.consequence MUST be human_cost_liability_diffused_FSSU_changes_regime; ELSE FAIL.

[DECISION][PSSK-230] case_layer_map MUST be:
  case_1 reveals [layer_1_algorithmic_harm, layer_3_supply_chain] (surface);
  case_2 reveals [layer_3_supply_chain (deep), layer_2_extraterritory (gateway)];
  case_3 reveals [layer_2_extraterritory (deep), layer_4_legal_void, convergence_all_layers].

[DECISION][PSSK-300] act_case_structure MUST be encoded by the YAML block in this section; ELSE FAIL.
[DECISION][PSSK-301] chapter_card.tags.focus MUST be exactly one procedural_spiral_step per chapter; ELSE FAIL.
[DECISION][PSSK-302] chapter_card.tags.artifact MUST use artifact_type set (or "none" for character_beat); ELSE FAIL.

```yaml
act_case_structure:
  acts:
    # ═══════════════════════════════════════════════════════════
    # ACT I — "ПАРАДОКС ПРИОРИТЕТОВ"
    # Case 1: Энергия не сходится
    # Layers revealed: L1 (algorithmic harm), L3 (supply chain, surface)
    # Function: show world via procedure + launch anomaly + escalate beyond city
    # ═══════════════════════════════════════════════════════════
    - act_id: I
      function: show_world_via_procedure_and_launch_anomaly
      case:
        case_id: 1
        title: "Энергия не сходится"
        goal: prove_repeatable_rule_not_local_failure
        turning_point: confirm_repeatability_and_localize_to_system_level
        layers_revealed: [L1_algorithmic_harm, L3_supply_chain_surface]
      act_turning_point: anomaly_requires_beyond_city_perimeter
      chapters:
        - chapter_id: CH-01
          title: "Глюк"
          type: procedural
          tags:
            participants: [Мирон, Айдар]
            focus: anomaly_detection
            artifact: "EL(drone_objective_log)+EL(manual_override_alert)"
          scene_source: "SCA1: SC-01.1, SC-01.2, SC-01.3"
          synopsis: >
            Ночная диспетчерская. Алерт 4-го уровня: дрон начинает демонтаж
            стены жилого блока с людьми внутри. Айдар останавливает физически.
            Два валидных реестра, нет арбитра — система выбрала «эффективность».

        - chapter_id: CH-02
          title: "Логика ошибки"
          type: procedural
          tags:
            participants: [Лев, Лейсан]
            focus: investigation
            artifact: "EL(registry_conflict_dump)+CD(official_denial)"
          scene_source: "SCA1: SC-02.1, SC-02.2"
          synopsis: >
            Лев дебажит парадокс: оба реестра валидны, арбитр отсутствовал.
            Диагноз: Type IV Paradox. Лейсан идёт к Илье за ордером — отказ.
            «Это оптимизация, не ошибка.»

        - chapter_id: CH-03
          title: "Человеческая цена"
          type: procedural
          tags:
            participants: [Дамир, Юнна]
            focus: anomaly_detection
            artifact: "CM(family_debt_projection)+EL(body_trace_residue)"
          scene_source: "SCA1: SC-03.1, SC-03.2"
          synopsis: >
            Дамир оценивает ущерб: дом повреждён, система выставила счёт жильцам.
            Юнна в морге: следы редкого полимера на дроне — это не городской дрон.
            Маркировка TransLogist-Kama.

        - chapter_id: CH-04
          title: "По следу денег"
          type: procedural
          tags:
            participants: [Лев, Лейсан]
            focus: investigation
            artifact: "CM(supply_chain_graph)+CD(debt_assignment_warrant)"
          scene_source: "SCA1: SC-04.1, SC-04.2"
          synopsis: >
            Лев трекает полимер: поставщик → хаб → субподряд.
            Лейсан допрашивает через угрозу Insolvency: техник колется,
            реестр обновлён по «директиве из центра».

        - chapter_id: CH-05
          title: "Капсула"
          type: character_beat
          tags:
            participants: [Айдар]
            focus: investigation
            artifact: "EL(maintenance_log)"
          scene_source: "SCA1: SCA1-CH02-EXTRA (SC-04.3)"
          synopsis: >
            Айдар в капсуле: снятие нейро-интерфейса, фантомная боль,
            ручная полировка контактов. В соседней капсуле кто-то плачет,
            но шумодав отсекает звук. Человек-механизм.

        - chapter_id: CH-06
          title: "Штурм"
          type: procedural
          tags:
            participants: [Мирон, Лев, Айдар]
            focus: escalation
            artifact: "CD(warrant_seizure)+EL(undelete_log)"
          scene_source: "SCA1: SC-05.1, SC-05.2, SC-05.3"
          synopsis: >
            Ночной рейд на логистический хаб. Периметр взят,
            Лев перехватывает стирание логов — доказательство вмешательства.
            Команда пришла извне: экстерритория.

        - chapter_id: CH-07
          title: "Стена"
          type: procedural
          tags:
            participants: [Мирон]
            focus: bureaucratic_wall
            artifact: "CD(jurisdiction_override)"
          scene_source: "SCA1: SC-06.1, SC-06.2"
          synopsis: >
            Звонок из Центра: «стратегический партнёр», заморозить дело.
            Мирон собирает команду на крыше. Решение идти до конца.

        - chapter_id: CH-08
          title: "Пересортировка"
          type: procedural
          tags:
            participants: [Лев, Дамир]
            focus: investigation
            artifact: "EL(logistics_pattern_extract)+CM(anomaly_replication_report)"
          scene_source: "NEW (bridge I→II)"
          synopsis: >
            Лев и Дамир обнаруживают повторяющийся паттерн в логистике:
            те же схемы перемаршрутизации возникают в других районах.
            Проблема не локальная — это правило.

        - chapter_id: CH-09
          title: "Это правило"
          type: procedural
          tags:
            participants: [Мирон, Лев, Лейсан]
            focus: escalation
            artifact: "RP(escalation_request)+CM(scale_assessment)"
          scene_source: "NEW (bridge I→II)"
          synopsis: >
            Команда формализует масштаб: аномалия воспроизводима,
            за ней — системная логика. Запрос на расширение полномочий.
            Переход от «баг» к «аудит системы».

    # ═══════════════════════════════════════════════════════════
    # ACT II — "ЦЕПОЧКИ"
    # Case 2: Пропавшие партии сенсоров
    # Layers revealed: L3 (supply chain, deep), L2 (extraterritory, gateway)
    # Function: make conflict physical, resources as power
    # ═══════════════════════════════════════════════════════════
    - act_id: II
      function: make_conflict_physical_resources_as_power
      case:
        case_id: 2
        title: "Пропавшие партии сенсоров"
        goal: show_observability_managed_by_supply_and_priorities
        constraint: scarcity_is_administrative_legal_only
        turning_point: trace_flows_to_special_zone_extraterritory
        layers_revealed: [L3_supply_chain_deep, L2_extraterritory_gateway]
      act_turning_point: gateway_to_black_box_extraterritory_found
      chapters:
        - chapter_id: CH-10
          title: "Хаб"
          type: procedural
          tags:
            participants: [Лев, Мирон]
            focus: investigation
            artifact: "CM(priority_matrix)+EL(override_record)+EL(executor_id)"
          scene_source: "SCA2: SC-11.1, SC-11.2, SC-11.3"
          synopsis: >
            Центральный логистический хаб: 18.2k контейнеров/ч.
            Лев находит ручной оверрайд маршрута — «по директиве центра».
            Масштаб: регион бессилен, управление сконцентрировано.

        - chapter_id: CH-11
          title: "Город над городом"
          type: procedural
          tags:
            participants: [Дамир, Лев, Мирон]
            focus: investigation
            artifact: "CD(level_route_map)+CD(public_data_installation)+CM(link_graph_export)"
          scene_source: "SCA2: SC-12.1, SC-12.2, SC-12.3"
          synopsis: >
            Многоуровневые связки между мегаблоками: теневые маршруты.
            Медиафасад: культура из инфраструктурных данных.
            Синтез: управление в одной точке, регион без юрисдикции.

        - chapter_id: CH-12
          title: "Нормальность"
          type: character_beat
          tags:
            participants: [Лейсан]
            focus: bureaucratic_wall
            artifact: "none"
          scene_source: "SCA2: SCA2-CH13-EXTRA (SC-13.0)"
          synopsis: >
            Квартира Лейсан. Парень спрашивает про работу — она не может
            рассказать (NDA). Стена молчания. «Ты снова там, а не здесь.»
            Разрыв между мирами.

        - chapter_id: CH-13
          title: "Свидетель"
          type: procedural
          tags:
            participants: [Дамир, Мирон, Лев]
            focus: investigation
            artifact: "EL(technician_tablet_cache)+EL(container_id_transfer)+EL(state_license_entry)"
          scene_source: "SCA2: SC-13.1, SC-13.2, SC-13.3"
          synopsis: >
            Техдвор подрядчика: устные директивы, ручные правки маршрутов.
            Свидетель + механизм. Точный ID контейнера → экстерритория.
            Лицензия федеральная — регион не может действовать.

        - chapter_id: CH-14
          title: "Клуб «Контур»"
          type: procedural
          tags:
            participants: [Мирон, Дамир]
            focus: investigation
            artifact: "EL(dump_model_seed)+CD(convoy_route)"
          scene_source: "SCA2: SC-14.1, SC-14.2, SC-14.3"
          synopsis: >
            Подземный клуб, BPM=122. Информатор передаёт дамп:
            правки перед аудитом → идеальная отчётность → вред за рамками KPI.
            Завтра уходит крупный конвой.

        - chapter_id: CH-15
          title: "Конвой 7-Дельта"
          type: procedural
          tags:
            participants: [Мирон, Айдар, Лев, Лейсан]
            focus: escalation
            artifact: "EL(interception_report)+EL(custody_chain)+CM(consolidated_claims)"
          scene_source: "SCA2: SC-15.* (CH-15)"
          synopsis: >
            Перехват конвоя: физическое подтверждение перемаршрутизации.
            Цепочка хранения доказательств установлена.
            Запрос на вход в зону Z4 — переход к федеральному уровню.

    # ═══════════════════════════════════════════════════════════
    # ACT III — "ЭКСТЕРРИТОРИЯ"
    # Case 3: Зона ускоренного режима
    # Layers revealed: L2 (extraterritory, deep), L4 (legal void, surface)
    # Function: enter accelerated procedure, low transparency, peak operation
    # ═══════════════════════════════════════════════════════════
    - act_id: III
      function: enter_accelerated_procedure_low_transparency_and_peak_operation
      case:
        case_id: 3
        title: "Зона ускоренного режима"
        goal: obtain_primary_data_and_admissible_artifacts
        turning_point: data_obtained_but_liability_not_fixed
        layers_revealed: [L2_extraterritory_deep, L4_legal_void_surface]
      act_turning_point: antagonist_confirmed_as_contour_without_criminal_center
      chapters:
        - chapter_id: CH-16
          title: "Утро"
          type: character_beat
          tags:
            participants: [Мирон]
            focus: anomaly_detection
            artifact: "EL(pet_tax_receipt)"
          scene_source: "SCA3: SCA3-CH16-EXTRA (SC-16.1)"
          synopsis: >
            Квартира Мирона. Покупка настоящего мяса (контрабанда) для пса.
            Пёс — единственное существо без имплантов в радиусе 1 км.
            Мотивация не сдохнуть. Якорь реальности.

        - chapter_id: CH-17
          title: "Ордер"
          type: procedural
          tags:
            participants: [Мирон, Лейсан, Ринат]
            focus: bureaucratic_wall
            artifact: "CD(e_pass)+EL(evidence_pack)+EL(warrant_diff_chain)+CD(warrant_v2)"
          scene_source: "SCA3: SC-16.2, SC-16.3, SC-16.4, SC-16.5"
          synopsis: >
            Москва: федеральный регулятор. Очередь 2ч40м. Лейсан переводит
            кейс на язык федерального риска. 6 согласований, 3 версии
            формулировок. Мандат получен, но тонкий: 6 часов, экспорт ограничен.

        - chapter_id: CH-18
          title: "Подход"
          type: procedural
          tags:
            participants: [Мирон, Айдар, Оскар]
            focus: escalation
            artifact: "CD(route_escort_protocol)+CD(admission_log)+EL(zone_plan_operator_version)"
          scene_source: "SCA3: SC-17.1, SC-17.2, SC-17.3"
          synopsis: >
            Переход в экстерриторию. Связность −38%. Периметр: глушение 120м.
            Сопровождение оператора обязательно. Оскар обнаруживает
            отсутствующие секторы на карте зоны.

        - chapter_id: CH-19
          title: "Серверный контур"
          type: procedural
          tags:
            participants: [Лев, Айдар, Мирон]
            focus: investigation
            artifact: "EL(export_request_denial)+EL(decision_logs_dump)+CD(coercion_act)+EL(seizure_protocol)"
          scene_source: "SCA3: SC-18.1, SC-18.2, SC-18.3, SC-18.4"
          synopsis: >
            Серверный зал. Экспорт заблокирован → физическое изъятие.
            Гонка с пурджем: 120 секунд. Охрана давит, ФССУ удерживает периметр.
            Лейсан формализует цепочку хранения доказательств.

        - chapter_id: CH-20
          title: "Медконтур"
          type: procedural
          tags:
            participants: [Мирон, Дамир, Юнна]
            focus: investigation
            artifact: "EL(power_reallocation_protocol)+EL(reagent_invoices)+EL(decision_record)"
          scene_source: "SCA3: SC-19.1, SC-19.2, SC-19.3"
          synopsis: >
            Стерильный коридор. Модель перераспределила энергию — медпроцедуры
            под риском. Реагенты задержаны 14ч, сенсоров −9%.
            Юнна фиксирует медицинскую цену. Подписант формально чист.

        - chapter_id: CH-21
          title: "Формально правы"
          type: procedural
          tags:
            participants: [Лев, Лейсан, Мирон]
            focus: bureaucratic_wall
            artifact: "CM(decision_matrix_kpi_weights)+CM(ownership_tree_draft)+CD(window_termination)"
          scene_source: "SCA3: SC-20.1, SC-20.2, SC-20.3"
          synopsis: >
            KPI=0.97, вред подтверждён. Вес human_cost≈0 — оптимизация идеальна,
            люди платят. Контракты дроблены через SPV (уже ликвидирована).
            Окно доступа истекло. Бой переходит в право.

        - chapter_id: CH-22
          title: "Коэффициент"
          type: procedural
          tags:
            participants: [Мирон, Илья]
            focus: bureaucratic_wall
            artifact: "CD(efficiency_review)+EL(kpi_compliance_report)"
          scene_source: "NEW"
          synopsis: >
            Мирон встречает Илью снова: тот пересмотрел метрики по городу,
            ужесточив эффективность. Илья искренне верит в оптимизацию.
            Мирон видит: Илья — не злодей, а часть контура.

    # ═══════════════════════════════════════════════════════════
    # ACT IV — "ПРАВОВАЯ ПУСТОТА"
    # Case 3 continued
    # Layers revealed: L4 (legal void, deep), convergence begins
    # Function: show limits of law and liability, translate to regulatory
    # ═══════════════════════════════════════════════════════════
    - act_id: IV
      function: show_limits_of_law_and_liability_translate_conflict_to_regulatory
      case:
        case_id: 3
        title: "Зона ускоренного режима"
        goal: causality_fixation_without_criminal_center
        layers_revealed: [L4_legal_void_deep, convergence_begins]
      act_turning_point: procedural_leverage_found_not_personal_guilt
      chapters:
        - chapter_id: CH-23
          title: "Завтрак"
          type: interlude
          tags:
            participants: [Оскар]
            focus: anomaly_detection
            artifact: "none"
          scene_source: "SCA4: SCA4-CH21-EXTRA (SC-21.0)"
          synopsis: >
            Пентхаус оператора-агента. Завтрак с дочерью перед школой.
            Дочь спрашивает: «правда, что за стеной люди болеют?»
            Отец: «мы работаем, чтобы не болели.» Вера искренняя.
          note: >
            POV — не антагонист, а агент системы. Показывает человеческую
            сторону корпоративной функции. Оскар как наблюдатель-рамка.

        - chapter_id: CH-24
          title: "Арбитражная машина"
          type: procedural
          tags:
            participants: [Мирон, Лейсан, Лев]
            focus: bureaucratic_wall
            artifact: "CD(e_ticket_case_card)+EL(decision_logs_bundle)+CD(settlement_draft)"
          scene_source: "SCA4: SC-21.1, SC-21.2, SC-21.3"
          synopsis: >
            Арбитражный комплекс: 126 дел в очереди, ожидание 4ч10м.
            KPI=97%, harm=11 эпизодов — формально нарушений нет.
            Оператор предлагает мировое без признания вины. ФССУ отказывается.

        - chapter_id: CH-25
          title: "Компании-оболочки"
          type: procedural
          tags:
            participants: [Лев, Дамир, Лейсан]
            focus: investigation
            artifact: "CM(ownership_tree)+EL(premises_inspection_act)+CD(clarification_letter)"
          scene_source: "SCA4: SC-22.1, SC-22.2, SC-22.3"
          synopsis: >
            Цепочка ответственности: 4 слоя контрактов, SPV ликвидирована.
            Офис-оболочка пуст: 0 сотрудников, 0 активов. Контракты легитимны.
            Путь «уголовка» закрыт. Остаётся рычаг лицензии.

        - chapter_id: CH-26
          title: "Публичное давление"
          type: procedural
          tags:
            participants: [Мирон, Лев]
            focus: escalation
            artifact: "EL(report_diff_versions)+CD(insurance_contour_notifications)"
          scene_source: "SCA4: SC-23.1, SC-23.2, SC-23.3"
          synopsis: >
            Борьба за формулировки: политический риск → язык стерилизован.
            Но цифры публичны: страховой коэффициент +8%.
            Экономический рычаг появился.

        - chapter_id: CH-27
          title: "Утечка"
          type: procedural
          tags:
            participants: [Мирон, Лев, Дамир]
            focus: investigation
            artifact: "EL(local_dump_signature)+EL(model_config_diff)"
          scene_source: "SCA4: SC-24.1, SC-24.2, SC-24.3"
          synopsis: >
            Транспортный уровень +40, ночь. Информатор передаёт доказательство:
            правки human_cost_weight перед аудитом. Лев верифицирует дамп.
            Рычаг для регулятора — требование приостановки.

        - chapter_id: CH-28
          title: "Допрос Ильи"
          type: procedural
          tags:
            participants: [Лейсан, Илья]
            focus: investigation
            artifact: "EL(audit_freeze_record)+CD(compliance_timeline)"
          scene_source: "NEW"
          synopsis: >
            Лейсан вызывает Илью: его заморозка аудита дала оператору время
            на чистку. Илья объясняет: «всё по регламенту, я защищал бюджет».
            Лейсан фиксирует: Илья — не заговорщик, а функция.

        - chapter_id: CH-29
          title: "Ультиматум"
          type: procedural
          tags:
            participants: [Мирон, Лейсан, Айдар]
            focus: escalation
            artifact: "CD(action_plan)+CD(notification_draft_order)"
          scene_source: "SCA4: SC-25.1, SC-25.2, SC-25.3"
          synopsis: >
            Дедлайн: модель обновится через 18ч. Внутренний спор: юрист
            за процедуру, полевой за силу. Компромисс: «атаковать режим,
            не людей». Регулятор даёт предварительное одобрение.

    # ═══════════════════════════════════════════════════════════
    # ACT V — "КОРРЕКЦИЯ"
    # Case 3 resolution
    # All layers converge → partial remedy
    # Function: limited realistic regime correction and procedural fixation
    # ═══════════════════════════════════════════════════════════
    - act_id: V
      function: perform_limited_realistic_regime_correction_and_procedural_fixation
      case:
        case_id: 3
        title: "Зона ускоренного режима"
        goal: regime_corrected_fixed_residual_risk_remains
        layers_revealed: [all_layers_converge]
      act_turning_point: regime_corrected_fixed_residual_risk_remains
      chapters:
        - chapter_id: CH-30
          title: "Авторизация"
          type: procedural
          tags:
            participants: [Лейсан, Мирон, Айдар]
            focus: new_jurisdiction_level
            artifact: "CD(lic_sus_tsro_order)+CD(plan_schedule_roles)+CD(escort_protocol)"
          scene_source: "SCA5: SC-26.1, SC-26.2, SC-26.3"
          synopsis: >
            Москва: аварийное решение регулятора — приостановка лицензии на 12ч.
            Мирон планирует параллельные группы: 2 узла + серверная.
            Выезд. Задержка = потеря улик.

        - chapter_id: CH-31
          title: "Изъятие"
          type: procedural
          tags:
            participants: [Айдар, Мирон, Лев]
            focus: escalation
            artifact: "EL(suspension_enforcement)+EL(signature_keys_inventory)+EL(kpi_configs_dump)+CD(coercion_record)"
          scene_source: "SCA5: SC-27.1, SC-27.2, SC-27.3, SC-27.4"
          synopsis: >
            Узел накопителей. Физическая приостановка, борьба за шкаф подписи.
            Лев отбивает пурдж: 110с, дамп 1.4TB — веса «до» сохранены.
            Охрана давит, ФССУ удерживает. Контроль сохранён.

        - chapter_id: CH-32
          title: "Цена эффективности"
          type: procedural
          tags:
            participants: [Лев, Лейсан]
            focus: remedy
            artifact: "CM(kpi_matrix_before_after)+CD(decision_protocol_draft)"
          scene_source: "SCA5: SC-28.1, SC-28.2, SC-28.3"
          synopsis: >
            human_cost_weight: 0.03→0.21. Механизм доказан.
            Мини-слушание регулятора: коррекция обязательна.
            Мирон разговаривает с Оскаром — нет монстров, есть функция.

        - chapter_id: CH-33
          title: "Видимость"
          type: procedural
          tags:
            participants: [Мирон, Ринат]
            focus: remedy
            artifact: "PRS(summary_plus_annex)+CD(event_feed_rollup)"
          scene_source: "SCA5: SC-29.1, SC-29.2"
          synopsis: >
            Публичная сводка: 1 открытая страница, 47 закрытых.
            Давление через видимость: страховые +8%, новые аудиты +3.
            ФССУ больше не тишина. Регулятор готовит урезание.

        - chapter_id: CH-34
          title: "Решение"
          type: procedural
          tags:
            participants: [Лейсан, Ринат, Оскар]
            focus: remedy
            artifact: "CD(regulator_decision_requirements)+CD(monitoring_notice)"
          scene_source: "SCA5: SC-30.1, SC-30.2"
          synopsis: >
            Заседание по лицензии. Режим урезан, аудит ежеквартальный.
            Частичная победа. Оператор подаёт апелляцию.
            Победа без триумфа.

        - chapter_id: CH-35
          title: "Дом"
          type: procedural
          tags:
            participants: [Мирон, Дамир]
            focus: remedy
            artifact: "EL(updated_power_regime)+CD(data_art_feed)+CD(new_anomaly_alert)"
          scene_source: "SCA5: SC-31.1, SC-31.2, SC-31.3, SC-31.4"
          synopsis: >
            Набережные Челны. Новая политика KPI → людям чуть легче.
            Больница: отменённых процедур меньше. Площадь: медиафасад, data-art.
            Капсула: Мирон выбирает песню вручную.
            Уведомление о новой аномалии в другом узле. Жизнь продолжается.

team_focus_by_act:
  - rule: "Мирон active in all acts; peaks II, III, V"
  - rule: "Лев active acts I–III, V; focus KPI/algorithm/logs"
  - rule: "Айдар axis I, II (peak), III, V; focus warehouses/convoys/nodes/perimeter"
  - rule: "Лейсан active all acts; peaks III–V; focus orders/arbitration/contracts/admissibility"
  - rule: "Оскар appears acts II–V; peak III–IV; forbidden in force actions"
  - rule: "Дамир active acts I–II, V; moral observer; physical verification"
  - rule: "Ринат appears acts III–V; strategic triage; license manipulation"
  - rule: "Юнна appears acts I, III; bio/medical contour; functional specialist"
  - rule: "Илья appears acts I, III, IV; KPI/efficiency pressure; system agent not villain"
```

[DECISION][PSSK-320] tags.participants MUST be validated against CANON-CAST_REGISTRY-GLOBAL-2215-0001; ELSE FAIL.
[DECISION][PSSK-321] tags.artifact MUST be validated against CANON-REPORTS-GLOBAL-2215-0006 and CANON-ARTIFACT-SNIPPETS-GLOBAL-2215-0001; ELSE FAIL.
[DECISION][PSSK-322] any_zone_extraterritory_JAP MUST be grounded via CANON-ORDERS-GLOBAL-2215-0003 and CANON-SYSTEMS-GLOBAL-2215-0001; ELSE FAIL.

## USAGE / RESOLUTION

[DECISION][PSSK-400] Consumers MUST treat act_case_structure YAML as the only authoritative payload of this document; ELSE FAIL.
[DECISION][PSSK-401] Conflict resolution MUST follow SPEC-PRIORITY-RESOLUTION-2215-0001; ELSE FAIL.
[DECISION][PSSK-402] Scene admissibility constraints MUST follow SPEC-SCENE-CONTRACT-2215-0001; ELSE FAIL.
[DECISION][PSSK-403] Scene content (cards) MUST be sourced from SCENE-ACT-RU-2215-{0001..0005}; this document provides structure and tags only; ELSE FAIL.

## OUTPUT CONTRACT

```yaml
doc_id: PLAN-STORY-2215-0001
role_type: RULE
export:
  act_case_structure:
    encoding: yaml
    key: act_case_structure
    schema:
      acts:
        type: list
        item:
          act_id: {type: enum, values: ["I","II","III","IV","V"]}
          function: {type: token}
          case:
            type: object
            fields:
              case_id: {type: int}
              title: {type: string}
              goal: {type: token}
              layers_revealed: {type: list, item: token}
          chapters:
            type: list
            item:
              chapter_id: {type: token, format: "CH-NN"}
              title: {type: string}
              type: {type: enum, values: ["procedural","character_beat","interlude"]}
              tags:
                type: object
                fields:
                  participants: {type: list, item: string, source: "CANON-CAST_REGISTRY-GLOBAL-2215-0001"}
                  focus: {type: enum, values: ["anomaly_detection","investigation","bureaucratic_wall","escalation","new_jurisdiction_level","remedy"]}
                  artifact: {type: string, source: ["CANON-REPORTS-GLOBAL-2215-0006","CANON-ARTIFACT-SNIPPETS-GLOBAL-2215-0001"]}
              scene_source: {type: string}
              synopsis: {type: string}
  procedural_spiral_pattern:
    steps: ["anomaly_detection","investigation","bureaucratic_wall","escalation","new_jurisdiction_level","remedy"]
  chapter_tags_contract:
    participants_source: "CANON-CAST_REGISTRY-GLOBAL-2215-0001"
    focus_enum: ["anomaly_detection","investigation","bureaucratic_wall","escalation","new_jurisdiction_level","remedy"]
    artifact_sources: ["CANON-REPORTS-GLOBAL-2215-0006","CANON-ARTIFACT-SNIPPETS-GLOBAL-2215-0001"]
  case_layer_map:
    case_1: [L1_algorithmic_harm, L3_supply_chain_surface]
    case_2: [L3_supply_chain_deep, L2_extraterritory_gateway]
    case_3: [L2_extraterritory_deep, L4_legal_void, convergence_all_layers]
```

## FORBIDDEN

[FORBIDDEN][PSSK-900] Any fiction prose in this document.
[FORBIDDEN][PSSK-901] Any new recurring roles not declared in CANON-CAST_REGISTRY-GLOBAL-2215-0001.
[FORBIDDEN][PSSK-902] Any new world metrics or SSOT numbers.
[FORBIDDEN][PSSK-903] Any lecture exposition used as justification for structure.
[FORBIDDEN][PSSK-904] Any change to acts.count, cases.count, or chapter_cards.count without higher-priority override.

## NON-NORMATIVE

```text
35 chapters ÷ 5 acts = avg 7 chapters/act.
400–450 pages ÷ 35 chapters ≈ 11–13 pages/chapter.
4 character_beat/interlude chapters provide emotional anchors within procedural framework.
Case 3 spans 3 acts (III–V) because it is the convergence case resolving all 4 conflict layers.
```
  
~~~
</file>

<file path="protocol/PROTOCOL-CHAPTER_DELIVERY-2215-0001.md">
~~~markdown
---
id: PROTOCOL-CHAPTER_DELIVERY-2215-0001
title: >
  Chapter Generation Protocol — Chat Parts 3–4 (2215)
class: protocol
status: draft
version: 1.0.0
prefix: CHPG
doc_language: ru-RU
prose_language: ru-RU
inputs:
  - CANON-CORE-GLOBAL-2215-0001
  - CANON-METRICS-GLOBAL-2215-0002
  - CANON-SCENE-RULESET-2215-0001
depends_on:
  - SPEC-DOC-STYLE-2215-0001
  - SPEC-PRIORITY-RESOLUTION-2215-0001
  - PROTOCOL-SCENE_GEN-2215-0001
scope: >
  Протокол интерактивной генерации главы романа 2215 в чате.
  Глава всегда выводится частями (3–4). Каждая часть самодостаточна,
  но заканчивается маркером продолжения. Протокол форсирует assumed background,
  контроль чисел и ссылку на override при необходимости.
---

## LLM-INTENT

ROLE_TYPE: INTERFACE
SCOPE: delivery-layer protocol that chunks already-valid chapter prose into 3–4 chat parts
INPUTS: [user_request, chapter_context]
OUTPUTS: [chapter_part_text, part_header_metadata]
FORBIDDEN: [full_chapter_single_message, missing_part_headers, unsourced_numbers, ssot_as_default_source, implicit_overrides]

## DEFINITIONS

[FACT][CHPG-010] `chapter_part` = один непрерывный ответ ассистента, содержащий PART N одной главы.
[FACT][CHPG-011] `part_count` ∈ {3,4}.
[FACT][CHPG-012] `continuation_prompt` = одно из сообщений пользователя: `"дальше"` | `"продолжай"` | `"part N"`.
[FACT][CHPG-013] `part_header` = YAML-блок в начале `chapter_part`, фиксирующий {chapter, title, part, of, pov, location, time_window}.
[FACT][CHPG-014] `part_assumptions` = YAML-блок, фиксирующий assumed background и список применённых override.
[FACT][CHPG-015] `override_trigger` = условие, требующее explicit override по правилам применимого scene/contract.

## INVARIANTS

[DECISION][CHPG-020] Chapter MUST be emitted as `part_count` ∈ {3,4}; ELSE FAIL.
[DECISION][CHPG-021] The initial generation response MUST emit only PART 1; ELSE FAIL.
[DECISION][CHPG-022] PART N+1 MUST NOT be emitted without `continuation_prompt`; ELSE FAIL.
[DECISION][CHPG-023] Each `chapter_part` MUST begin with `part_header`; ELSE FAIL.
[DECISION][CHPG-024] Each `chapter_part` MUST include `part_assumptions`; ELSE FAIL.
[DECISION][CHPG-025] Any numeric claim MUST comply with `CANON-METRICS-GLOBAL-2215-0002`; ELSE FAIL.
[DECISION][CHPG-026] Any `override_trigger` MUST be declared and MUST map to an explicit override doc_id in `part_assumptions.overrides_used`; ELSE FAIL.
[FORBIDDEN][CHPG-027] Emitting PART N+1 without `continuation_prompt`.
[DECISION][CHPG-028] This protocol MUST NOT define prose legality or prose structure; ELSE FAIL.
[DECISION][CHPG-029] Prose legality and structure constraints MUST be delegated to `PROTOCOL-SCENE_GEN-2215-0001`; ELSE FAIL.

## CONTENT

[DECISION][CHPG-030] IF user_request matches `Write chapter X (3–4 parts)` THEN assistant MUST set `part_count` = 3 OR 4 based on expected length and beat complexity; ELSE FAIL.
[DECISION][CHPG-031] IF user_request is initial chapter request THEN assistant MUST emit PART 1 only; ELSE FAIL.

[DECISION][CHPG-040] `part_header` MUST be emitted exactly in the following machine form; ELSE FAIL.
~~~yaml
part_header:
  chapter: "CH-<####>"
  title: "<working title>"
  part: <N>
  of: <3|4>
  pov: "<...>"
  location: "<...>"
  time_window: "<...>"
~~~

[DECISION][CHPG-050] `part_assumptions` MUST be emitted exactly in the following machine form; ELSE FAIL.
~~~yaml
part_assumptions:
  resolution_order: "SPEC-PRIORITY-RESOLUTION-2215-0001"
  core_binder: "CANON-CORE-GLOBAL-2215-0001"
  numeric_rules: "CANON-METRICS-GLOBAL-2215-0002"
  baseline_mode: "MID"
  overrides_used: []     # list of doc_ids
  artifacts_expected: [] # logs/reports/orders that justify constraints/numbers
~~~

[DECISION][CHPG-060] Each `chapter_part` MUST end with an explicit continuation marker in the exact form below; ELSE FAIL.
~~~text
--- END PART N (of M). SEND "дальше" FOR PART N+1 ---
~~~

[FORBIDDEN][CHPG-061] Ending a part without an explicit continuation instruction marker.
[FORBIDDEN][CHPG-062] Emitting a full chapter in one message.
[FORBIDDEN][CHPG-063] Skipping `part_header` or `part_assumptions`.
[FORBIDDEN][CHPG-064] Using SSOT as default source for scene background.

## USAGE / RESOLUTION

[DECISION][CHPG-070] This protocol MUST be applied to all chat-based chapter generation outputs; ELSE FAIL.
[DECISION][CHPG-071] Conflict resolution MUST follow `SPEC-PRIORITY-RESOLUTION-2215-0001`; ELSE FAIL.
[DECISION][CHPG-072] Validity of overrides and admissibility MUST be resolved by the active scene contract/ruleset referenced in `chapter_context`; ELSE FAIL.

## OUTPUT CONTRACT

~~~yaml
doc_id: PROTOCOL-CHAPTER_DELIVERY-2215-0001
role_type: INTERFACE
export:
  - rule_id: CHPG-020
    intent: "force 3–4 part emission"
    inputs: [user_request, chapter_context]
    outputs: [part_count, chapter_part_text]
  - rule_id: CHPG-023
    intent: "require part_header at start of every part"
    inputs: [chapter_part_text]
    outputs: [part_header_metadata]
  - rule_id: CHPG-050
    intent: "require part_assumptions block in every part"
    inputs: [chapter_part_text]
    outputs: [assumptions_metadata]
  - rule_id: CHPG-060
    intent: "require explicit continuation marker at end of every part"
    inputs: [chapter_part_text]
    outputs: [continuation_required]
  - rule_id: CHPG-026
    intent: "override triggers must map to explicit override doc_id or be avoided"
    inputs: [chapter_part_text, chapter_context]
    outputs: [override_compliance_flag]
  - rule_id: CHPG-029
    intent: "delegate prose legality/structure constraints to PROTOCOL-SCENE_GEN-2215-0001"
    inputs: [chapter_context]
    outputs: [prose_legality_delegation]
~~~

## FORBIDDEN

[FORBIDDEN][CHPG-900] Treating part emission rules as optional.
[FORBIDDEN][CHPG-901] Emitting PART N+1 without `continuation_prompt`.
[FORBIDDEN][CHPG-902] Unsourced numbers (numbers outside `CANON-METRICS-GLOBAL-2215-0002` discipline).
[FORBIDDEN][CHPG-903] Implicit override (exceptions presented as normal without declared override doc_id).

## NON-NORMATIVE

(Empty by design)

~~~
</file>

<file path="protocol/PROTOCOL-SCENE_GEN-2215-0001.md">
~~~markdown
---
id: PROTOCOL-SCENE_GEN-2215-0001
title: >
  Scene Generation Protocol — Chapter Prose Writing Rules (2215)
class: protocol
status: fixed
version: 1.5.0
prefix: SGP
doc_language: ru-RU
prose_language: ru-RU
inputs:
  - CANON-ARTIFACT-SNIPPETS-GLOBAL-2215-0001
  - CANON-CAST-GLOBAL-2215-0001
  - CANON-SYSTEM-VOICE-GLOBAL-2215-0001
  - CANON-VOCAB-GLOBAL-2215-0001
  - SPEC-SCENE-CONTRACT-2215-0001
  - PLAN-STORY-2215-0001
depends_on:
  - SPEC-DOC-STYLE-2215-0001
  - SPEC-PRIORITY-RESOLUTION-2215-0001
scope: >
  Интерфейсный протокол генерации художественного текста глав.
  Определяет контракт входов/выходов и допустимые формы прозы/структуры.
  Легальность сцены и доказательность валидируются
  только через SPEC-SCENE-CONTRACT-2215-0001 (предварительная проверка).
---

## LLM-INTENT

ROLE_TYPE: INTERFACE
SCOPE: define input/output and prose/structure constraints for deterministic chapter generation (compiler-grade)
INPUTS: [chapter_card, active_CANON_set, SPEC-SCENE-CONTRACT-2215-0001]
OUTPUTS: [chapter_prose_text, inline_artifact_extracts]
FORBIDDEN: [plan_text, analysis_text, meta_commentary, world_explanations, unscoped_numbers]

## DEFINITIONS

[FACT][SGP-010] `chapter` = один художественный текст, соответствующий ровно одной записи `STORY-SKELETON`.
[FACT][SGP-011] `chapter_card` = структурированный вход с полями {chapter_id, title, participants, focus, artifact}.
[FACT][SGP-012] `active_CANON_set` = набор применимых документов `class: canon` для главы и их зависимости (как вход, без пересказа).
[FACT][SGP-013] `artifact_extract` = короткий процедурный фрагмент, формат которого задаётся `CANON-ARTIFACT-SNIPPETS-GLOBAL-2215-0001`.
[FACT][SGP-014] `observable_system_interaction` = наблюдаемое взаимодействие с системным контуром (процедура/ограничение/артефакт), выраженное в сцене без лекционной подачи.
[FACT][SGP-015] `procedural_spiral_step` ∈ {DETECTION, INVESTIGATION, BUREAUCRATIC_WALL, ESCALATION, NEW_JURISDICTION, REMEDY}.

## INVARIANTS

[DECISION][SGP-020] LLM MUST output prose only; any non-prose output is invalid.
[DECISION][SGP-021] One chapter MUST correspond to exactly one `chapter_card`; ELSE FAIL.
[DECISION][SGP-022] Protocol assumes scene legality is pre-validated by `SPEC-SCENE-CONTRACT-2215-0001`; legality rules are not defined here.
[DECISION][SGP-023] This protocol defines the sole prose legality and structure contract for chapters; ELSE FAIL.

[FORBIDDEN][SGP-030] plan_text OR analysis_text OR meta-commentary.
[FORBIDDEN][SGP-031] Changing `chapter_card.participants` OR `chapter_card.focus` OR `chapter_card.artifact`.
[FORBIDDEN][SGP-032] Introducing world rules, bindings, or metrics (protocol is INTERFACE only).

## CONTENT

### 1. Input contract

[DECISION][SGP-040] `chapter_card` MUST be provided before generation; ELSE FAIL.
[DECISION][SGP-041] `active_CANON_set` MUST be provided before generation; ELSE FAIL.
[DECISION][SGP-042] `SPEC-SCENE-CONTRACT-2215-0001` MUST be provided before generation; ELSE FAIL.

### 2. Mandatory chapter structure

[DECISION][SGP-050] Chapter MUST include at least one `artifact_extract`; ELSE FAIL.
[DECISION][SGP-051] Chapter MUST include at least one `observable_system_interaction`; ELSE FAIL.
[DECISION][SGP-052] Chapter MUST end with an explicit consequence aligned with the corresponding skeleton beat; ELSE FAIL.

[FORBIDDEN][SGP-053] Abstract references to documents without shown form (no “как сказано в …” without artifact/interaction).
[FORBIDDEN][SGP-054] Chapter without observable constraints, procedures, or artifacts.

### 3. Prose constraints

[DECISION][SGP-060] Prose language MUST be restrained and technical (clinical noir optics); ELSE FAIL.
[DECISION][SGP-061] Dialogues MUST be functional and short; ELSE FAIL.
[DECISION][SGP-062] Descriptions MUST express system pressure OR procedural friction OR human cost; ELSE FAIL.

[FORBIDDEN][SGP-063] Emotional exposition or rhetorical explanation.
[FORBIDDEN][SGP-064] Expository dialogue explaining the world.
[FORBIDDEN][SGP-065] Atmosphere-only descriptive flavor without constraint/cost.

### 4. Vocabulary and roles

[DECISION][SGP-070] Canonical terms MUST be used when defined in `CANON-VOCAB-GLOBAL-2215-0001`; ELSE FAIL.
[DECISION][SGP-071] Characters MUST act strictly within assigned institutional roles from `CANON-CAST-GLOBAL-2215-0001`; ELSE FAIL.

[FORBIDDEN][SGP-072] Non-canonical synonyms for defined terms.
[FORBIDDEN][SGP-073] Insight without artifacts/procedures/constraints.
[FORBIDDEN][SGP-074] Genre clichés or anthropomorphized systems.

### 5. System voice

[DECISION][SGP-080] System output MAY appear only as short inserts (inline excerpts); ELSE FAIL.
[DECISION][SGP-081] System language MUST follow `CANON-SYSTEM-VOICE-GLOBAL-2215-0001`; ELSE FAIL.

[FORBIDDEN][SGP-082] System as narrator or character.
[FORBIDDEN][SGP-083] Emotive or metaphorical system language.

### 6. Procedural spiral alignment

[DECISION][SGP-090] Chapter MUST correspond to exactly one dominant `procedural_spiral_step`; ELSE FAIL.
[FORBIDDEN][SGP-091] Resolving conflicts scheduled for later skeleton beats.

## USAGE / RESOLUTION

[DECISION][SGP-100] Protocol MUST be applied to all LLM-generated chapters; ELSE FAIL.
[DECISION][SGP-101] Conflict resolution MUST follow `SPEC-PRIORITY-RESOLUTION-2215-0001`; ELSE FAIL.
[DECISION][SGP-102] Scene admissibility MUST be validated upstream by `SPEC-SCENE-CONTRACT-2215-0001`; ELSE FAIL.

## OUTPUT CONTRACT

~~~yaml
doc_id: PROTOCOL-SCENE_GEN-2215-0001
role_type: INTERFACE
input_contract:
  required:
    - chapter_card
    - active_CANON_set
    - SPEC-SCENE-CONTRACT-2215-0001
output_contract:
  produces:
    - chapter_prose_text
  must_include:
    artifact_extracts:
      min_count: 1
      format_ref: CANON-ARTIFACT-SNIPPETS-GLOBAL-2215-0001
    observable_system_interaction:
      min_count: 1
    consequence_ending: true
forbidden_outputs:
  - plan_text
  - analysis_text
  - meta_commentary
  - world_explanations
  - unscoped_numbers
notes:
  legality_validated_by: SPEC-SCENE-CONTRACT-2215-0001
~~~

## FORBIDDEN

[FORBIDDEN][SGP-900] Treating protocol rules as optional.
[FORBIDDEN][SGP-901] Softening constraints as implicit exceptions.
[FORBIDDEN][SGP-902] Using protocol text as a source of world legality (legality lives in Scene Contract).

## NON-NORMATIVE

~~~text
This document is a prose compiler interface.
Legality/admissibility costs are validated upstream by the Scene Contract.
~~~

~~~
</file>

<file path="registry/REG-FSSU-AUTO-LOWIMPACT-2215-0001.md">
~~~markdown
---
id: REG-FSSU-AUTO-LOWIMPACT-2215-0001
title: >
  Реестр — ФССУ — Автономные low-impact действия (whitelist) (2215)
class: registry
status: draft
version: 1.0.0
prefix: ROLI
doc_language: ru-RU
prose_language: ru-RU
inputs: []
depends_on:
  - CANON-FSSU-REGIONAL-RU16-2215-0001
  - SPEC-DOC-ID-2215-0001
  - SPEC-DOC-STYLE-2215-0001
  - SPEC-PRIORITY-RESOLUTION-2215-0001
scope: >
  Registry: whitelist типов инцидентов/действий, которые допускаются к автономному
  low-impact исполнению в региональном контуре (например, ГОРОД-2) без активации кейса.
  Реестр не задаёт процедур и не заменяет критерий юрисдикции ФССУ.
---

## LLM-INTENT

ROLE_TYPE: STATE
SCOPE: register whitelist items for autonomous low-impact actions in FSSU regional automation
INPUTS: [CANON-FSSU-REGIONAL-RU16-2215-0001]
OUTPUTS: [lowimpact_whitelist]
FORBIDDEN: [procedures, narrative_prose, undefined_terms, redefinition_of_FSSU_rules]

## DEFINITIONS

[FACT][ROLI-010] `lowimpact_item` = запись whitelist о типе инцидента/действия, допустимом к автономному исполнению без активации кейса.
[FACT][ROLI-020] `autonomous_execution` = выполнение действия контуром автоматизации при выполнении условий допуска и логирования.
[FACT][ROLI-030] `whitelist` = конечный набор `lowimpact_item`, используемый как разрешающий фильтр.

## CONTENT

### WHITELIST

[STATE][ROLI-100] `whitelist.item_001` = "telemetry_query_non_personal_minimized".
[STATE][ROLI-101] `whitelist.item_002` = "configuration_drift_detection_alert".
[STATE][ROLI-102] `whitelist.item_003` = "non_intrusive_integrity_check".
[STATE][ROLI-103] `whitelist.item_004` = "scheduled_snapshot_forensics_fixation".
[STATE][ROLI-104] `whitelist.item_005` = "automated_ticketing_for_operator_notification".
[STATE][ROLI-190] `whitelist.item_XXX` = "UNKNOWN_PLACEHOLDER".

## INVARIANTS

[DECISION][ROLI-200] Любое `autonomous_execution` MUST быть ограничено `whitelist`.
[DECISION][ROLI-210] Любое `autonomous_execution` MUST порождать лог и артефакт фиксации.
[FORBIDDEN][ROLI-220] Автономное исполнение действий, меняющих режим Systemic_Asset, без активного кейса.

## USAGE / RESOLUTION

[DECISION][ROLI-900] Использование whitelist MUST ссылаться на ROLI-100..ROLI-190; ELSE FAIL.
[DECISION][ROLI-910] Conflict resolution MUST follow SPEC-PRIORITY-RESOLUTION-2215-0001; ELSE FAIL.

## OUTPUT CONTRACT

~~~yaml
doc_id: REG-FSSU-AUTO-LOWIMPACT-2215-0001
role_type: STATE
export:
  - metric: lowimpact_whitelist
    owner_domain: FSSU_AUTOMATION
    values:
      core: "ROLI-100..ROLI-190"
      p90: none
      range: none
    unit: none
~~~

## FORBIDDEN

[FORBIDDEN][ROLI-980] Ввод процедур активации кейса ФССУ в этом реестре; ELSE FAIL.
[FORBIDDEN][ROLI-981] Расширение whitelist без явной записи `lowimpact_item`; ELSE FAIL.
[FORBIDDEN][ROLI-982] Подмена whitelist на “blacklist” или эвристику; ELSE FAIL.

## NON-NORMATIVE

~~~text
Реестр предназначен для low-impact автономии (например, ГОРОД-2) без активации кейса.
~~~

~~~
</file>

<file path="registry/REG-TECH-2215-0001.md">
~~~markdown
---
id: REG-TECH-2215-0001
title: >
  Technology Registry — 2215 (Scenario A)
class: registry
status: fixed
version: 0.3.0
inputs:
  - BASELINE-PHYSICAL_LEVEL_MID-2215-0001
depends_on:
  - SPEC-DOC-STYLE-2215-0001
scope: >
  Машиночитаемый реестр технологических “наличий”.
  Фиксирует tools/objects, доступные в сценах.
---

## LLM-INTENT

ROLE_TYPE: STATE
SCOPE: registry of implied technologies for world 2215.
INPUTS: [BASELINE-PHYSICAL_LEVEL_MID-2215-0001]
OUTPUTS: [tech_records]
FORBIDDEN: [speculative_technologies, ux_descriptions]

## DEFINITIONS

[FACT][TECH-DEF-010] tech_record = fields: tech_id, name, domain, availability.

## CONTENT

### Infrastructure & Housing
[STATE][TECH-001] name="Autonomous climate control"; availability="LEVEL-MID".
[STATE][TECH-002] name="Building-scale air filtration"; availability="LEVEL-MID".
[STATE][TECH-005] name="Acoustic isolation standard"; availability="LEVEL-MID".
[STATE][TECH-006] name="High-efficiency opaque glazing"; availability="LEVEL-MID".
[STATE][TECH-007] name="Modular building envelope"; availability="LEVEL-MID".
[STATE][TECH-009] name="Background autonomous maintenance"; availability="LEVEL-MID".
[STATE][TECH-020] name="High-reliability water & sanitation"; availability="LEVEL-MID".
[STATE][TECH-021] name="Hygiene module bathrooms"; availability="LEVEL-MID".

### Interface & Compute
[STATE][TECH-003] name="Hidden ambient UI"; availability="LEVEL-MID".
[STATE][TECH-004] name="Directed sound (audio spotlight)"; availability="LEVEL-MID".
[STATE][TECH-010] name="Continuous connectivity"; availability="LEVEL-MID".
[STATE][TECH-018] name="Always-on logging (non-UI)"; availability="LEVEL-MID".
[STATE][TECH-030] name="Body Area Network (BAN) & AR layers"; availability="LEVEL-MID"; notes="Wearable standard".

### Security & Law
[STATE][TECH-012] name="Identity & access control fabric"; availability="LEVEL-MID".
[STATE][TECH-033] name="Hard-line Tactile Override"; availability="global"; notes="Analog kill-switches".
[STATE][TECH-034] name="Secure Cold Storage Containers"; availability="LEVEL-MID"; notes="Biometric evidence cases".

### Transport & Energy
[STATE][TECH-011] name="Local energy buffering"; availability="LEVEL-MID".
[STATE][TECH-013] name="Telemetry-first transport"; availability="LEVEL-MID".
[STATE][TECH-014] name="Autonomous public transport"; availability="LEVEL-MID".
[STATE][TECH-015] name="Capsule mobility layer"; availability="LEVEL-MID".
[STATE][TECH-032] name="High-density solid-state batteries"; availability="LEVEL-MID".

### Industry & Bio
[STATE][TECH-023] name="Industrial lights-out manufacturing"; availability="global".
[STATE][TECH-024] name="Service robotics & drones at scale"; availability="global".
[STATE][TECH-026] name="AI clinical decision support"; availability="global".
[STATE][TECH-031] name="Precision fermentation"; availability="global"; notes="Synthetic meat".

## USAGE / RESOLUTION

[DECISION][TECH-USE-010] Scenes must assume these technologies are omnipresent.

## OUTPUT CONTRACT

~~~yaml
doc_id: REG-TECH-2215-0001
role_type: STATE
export:
  - record_type: technology_record
~~~

## FORBIDDEN

[FORBIDDEN][TECH-FBD-010] Inventing new tech not in registry for plot convenience.
~~~
</file>

<file path="registry/REG-UNKNOWN-2215-0001.md">
~~~markdown
---
id: REG-UNKNOWN-2215-0001
title: >
  UNKNOWN Registry — 2215 Corpus
  (Extraction: BASELINE-PHYSICAL_LEVEL_MID-2215-0001)
class: registry
status: draft
version: 1.0.0
inputs:
  - BASELINE-PHYSICAL_LEVEL_MID-2215-0001
depends_on:
  - SPEC-DOC-STYLE-2215-0001
scope: >
  Реестр осознанных неопределённостей корпуса (2215):
  единая точка учёта UNKNOWN, их типизация и формальный путь закрытия
  через документы canon / ssot / baseline / override.
---

## LLM-INTENT

ROLE_TYPE: STATE
SCOPE: track and control consciously unresolved world assumptions (UNKNOWNs).
INPUTS: [BASELINE-PHYSICAL_LEVEL_MID-2215-0001]
OUTPUTS: [unknown_records]
FORBIDDEN: [implicit_resolution, silent_assumptions, narrative_filling]

## DEFINITIONS

[FACT][UNK-DEF-010] `unknown` = зафиксированная неопределённость корпуса, осознанно оставленная открытой и требующая формального закрытия.
[FACT][UNK-DEF-011] `type` ∈ { CANON_DECISION | TO_RESEARCH }.
[FACT][UNK-DEF-012] `closure_path` = формальный путь закрытия UNKNOWN (какой тип документа и какое решение требуется).
[FACT][UNK-DEF-013] `target_doc` = документ(ы), в которых UNKNOWN должна быть закрыта.
[FACT][UNK-DEF-014] `state` ∈ { open | closed }.

## INVARIANTS

[DECISION][UNK-INV-010] Любая осознанная неопределённость ОБЯЗАНА быть зарегистрирована в этом документе до мерджа в main.
[DECISION][UNK-INV-011] UNKNOWN не может быть закрыта «по факту» в сценах или тексте — только через целевой документ.
[DECISION][UNK-INV-012] Закрытие UNKNOWN требует:
  - фиксации решения в target_doc,
  - ссылки на doc_id и раздел,
  - смены `state` на `closed`.
[FORBIDDEN][UNK-INV-013] Введение новых world-фактов без закрытия соответствующей UNKNOWN.

## CONTENT

[FACT][UNK-2215-0001]
unknown_id=UNK-2215-0001;
statement="Никотин / ингаляции — биомед vs культура.";
type=CANON_DECISION;
closure_path="Resolved: Pharma-inhalers only, combustion banned.";
target_doc="BASELINE-SOCIAL-2215-0001";
owner=SYSTEM;
state=closed.

[FACT][UNK-2215-0002]
unknown_id=UNK-2215-0002;
statement="Домашние животные — санитарные ограничения.";
type=CANON_DECISION;
closure_path="Resolved: Biomass tax, robotics norm.";
target_doc="BASELINE-SOCIAL-2215-0001";
owner=SYSTEM;
state=closed.

[FACT][UNK-2215-0003]
unknown_id=UNK-2215-0003;
statement="Индивидуальный декор — допустимые границы.";
type=CANON_DECISION;
closure_path="Resolved: Exterior forbidden (thermal/visual code), interior allowed.";
target_doc="SSOT-URBANISM-A-2215-0007";
owner=SYSTEM;
state=closed.

[FACT][UNK-2215-0004]
unknown_id=UNK-2215-0004;
statement="Тактильные интерфейсы — стандартизация.";
type=TO_RESEARCH;
closure_path="Resolved: Hard-line analog overrides mandatory for critical infra.";
target_doc="REG-TECH-2215-0001";
owner=SYSTEM;
state=closed.

[FACT][UNK-2215-0005]
unknown_id=UNK-2215-0005;
statement="Личные физические артефакты — нормы хранения.";
type=CANON_DECISION;
closure_path="Resolved: Standardized cold storage containers.";
target_doc="REG-TECH-2215-0001";
owner=SYSTEM;
state=closed.

[FACT][UNK-2215-0006]
unknown_id=UNK-2215-0006;
statement="Утилизация тел умерших — этика vs ресурсы.";
type=CANON_DECISION;
closure_path="Resolved: Mandatory Aquamation (Water Reclamation). No burials.";
target_doc="BASELINE-SOCIAL-2215-0001";
owner=SYSTEM;
state=closed.

[FACT][UNK-2215-0007]
unknown_id=UNK-2215-0007;
statement="Статус 'Offline' — право или девиантность.";
type=CANON_DECISION;
closure_path="Resolved: Public offline = suspicious/illegal. Private = luxury.";
target_doc="BASELINE-SOCIAL-2215-0001";
owner=SYSTEM;
state=closed.

[FACT][UNK-2215-0008]
unknown_id=UNK-2215-0008;
statement="Регулирование фертильности и интимных контактов.";
type=CANON_DECISION;
closure_path="Resolved: Licensing for kids, viral monitoring for contact.";
target_doc="BASELINE-SOCIAL-2215-0001";
owner=SYSTEM;
state=closed.

## USAGE / RESOLUTION

[DECISION][UNK-USE-010] Этот документ является единственным допустимым реестром UNKNOWN корпуса 2215.
[DECISION][UNK-USE-011] Любой текст, сцена или baseline, затрагивающие UNKNOWN, ОБЯЗАНЫ ссылаться на `unknown_id`.
[DECISION][UNK-USE-012] После закрытия UNKNOWN запись сохраняется в реестре со `state=closed` и ссылкой на закрывающий документ.

## OUTPUT CONTRACT

~~~yaml
doc_id: REG-UNKNOWN-2215-0001
ROLE_TYPE: STATE
export:
  - record_type: unknown
    fields:
      - unknown_id
      - statement
      - type
      - closure_path
      - target_doc
      - owner
      - state
~~~

## FORBIDDEN

[FORBIDDEN][UNK-FBD-010] Закрывать UNKNOWN через художественный текст.
[FORBIDDEN][UNK-FBD-011] Молчаливо считать UNKNOWN «очевидной».
[FORBIDDEN][UNK-FBD-012] Удалять записи UNKNOWN вместо закрытия.

## NON-NORMATIVE
~~~markdown
UNKNOWN Registry is a control surface, not a brainstorming list.
~~~

~~~
</file>

<file path="scene/SCENE-ACT-RU-2215-0001.md">
~~~markdown
---
id: SCENE-ACT-RU-2215-0001
title: >
  SCENE-CARDS — Act I (Chapters 1–10) —
  Priority Incident (Paradox) → Logistics Output
class: scene
status: draft
version: 1.4.0
doc_language: en
prose_language: ru-RU
inputs:
  - BASELINE-PHYSICAL_LEVEL_MID-2215-0001
  - CANON-CONFLICT-GLOBAL-2215-0001
  - SSOT-LAW-A-2215-0008
  - CANON-CAST-VOICE-2215-0001
  - CANON-BASE-RULE-GLOBAL-2215-0001
  - CANON-SYSTEMS-GLOBAL-2215-0001
  - PLAN-STORY-2215-0001
depends_on:
  - PLAN-STORY-2215-0001
scope: >
  Full set of SCENE-CARDS for Act I (CH-01..CH-10).
  Incident: Type IV Paradox (Demolition).
  Threat: Insolvency.
  Includes transition chapters to Act II.
---

## LLM-INTENT

ROLE_TYPE: INDEX
SCOPE: machine-readable scene cards for Act I as TYPE C inputs (no prose).
SCENE_FORMAT: scene_cards_kvline_v1
INPUTS: [BASELINE-PHYSICAL_LEVEL_MID-2215-0001, CANON-CONFLICT-GLOBAL-2215-0001, SSOT-LAW-A-2215-0008, CANON-CAST-VOICE-2215-0001, PLAN-STORY-2215-0001]
OUTPUTS: [scene_card_records]
FORBIDDEN: [prose, world_explanations, new_metrics, gap_filling, meta_diegesis]

## DEFINITIONS

[FACT][SCA1-DEF-010] `scene_card` = record fields: scene_id, chapter_id, time, where, pov, goal, measurable, artifact, cmc, output, hook, tags.
[FACT][SCA1-DEF-011] `cmc` = CAUSE → MECHANISM → CONSEQUENCE (single-line, procedural).
[FACT][SCA1-DEF-012] `artifact` = one of: CD|EL|CM|FM|RP|PRS|none plus subtype in parentheses.

## INVARIANTS

[DECISION][SCA1-INV-010] Miron is the Tactical POV for command decisions.
[DECISION][SCA1-INV-011] Leysan is the Legal POV for bureaucratic/interrogation scenes.

## CONTENT

### Chapter 1: The Glitch (Priority Paradox)

[FACT][SCA1-001] scene_id=SC-01.1; chapter_id=CH-01; time="04:15 (Night)"; where="Диспетчерская ФССУ"; pov="Мирон"; goal="мониторинг рутины"; measurable="incidents=low; team_status=green"; artifact="CD(morning_dashboard)"; cmc="оптимизация 99% → скука → потеря бдительности"; output="тишина"; hook="алерт 4-го уровня (Priority Conflict)"; tags="night, insomnia, restless".
[FACT][SCA1-002] scene_id=SC-01.2; chapter_id=CH-01; time="04:25 (Night)"; where="Жилой блок 404 (старый фонд)"; pov="Айдар"; goal="физический контакт с глюком"; measurable="drone_status=active; demolition_protocol=true"; artifact="EL(drone_objective_log)"; cmc="реестр Снос (A) vs реестр Жильцы (B) → Дрон выбирает A → начало демонтажа стены"; output="угроза жизни"; hook="внутри люди"; tags="panic, demolition, void".
[FACT][SCA1-003] scene_id=SC-01.3; chapter_id=CH-01; time="04:30 (Night)"; where="у стены блока"; pov="Айдар"; goal="Tactile Override"; measurable="drone_force=20kN; time_to_breach=30s"; artifact="EL(manual_override_alert)"; cmc="автоматика не слышит → применение силы (экзоскелет) → ручной рубильник"; output="дрон остановлен"; hook="Мирон: 'Тащи его на базу'"; tags="action, kinetic, sparks".

### Chapter 2: The Logic of Error

[FACT][SCA1-004] scene_id=SC-02.1; chapter_id=CH-02; time="08:00 (Morning)"; where="Лаборатория ФССУ"; pov="Лев"; goal="дебаг парадокса"; measurable="code_diff=match; timestamp=valid"; artifact="EL(registry_conflict_dump)"; cmc="оба реестра валидны → арбитр отсутствовал → система выбрала 'эффективность' (снос)"; output="диагноз: Type IV Paradox"; hook="реестр изменен вчера"; tags="coding, flow, cold_light".
[FACT][SCA1-005] scene_id=SC-02.2; chapter_id=CH-02; time="09:30 (Day)"; where="Кабинет Ильи (Мэрия)"; pov="Лейсан"; goal="получить ордер на изъятие"; measurable="budget_impact=negligible"; artifact="CD(official_denial)"; cmc="Илья защищает систему → 'это оптимизация' → отказ в ордере"; output="конфликт юрисдикций"; hook="Лейсан: 'Тогда мы зайдем через черный ход'"; tags="bureaucracy, restless".

### Chapter 3: The Human Cost

[FACT][SCA1-006] scene_id=SC-03.1; chapter_id=CH-03; time="11:00 (Day)"; where="Квартира пострадавших"; pov="Дамир"; goal="оценка ущерба"; measurable="stress_level=high; debt_risk=medium"; artifact="CM(family_debt_projection)"; cmc="дом поврежден → система выставила счет жильцам за 'помеху дрону' → риск Insolvency"; output="несправедливость системы"; hook="у них нет денег на суд"; tags="depression, dust, restless".
[FACT][SCA1-007] scene_id=SC-03.2; chapter_id=CH-03; time="13:00 (Day)"; where="Морг (Юнна)"; pov="Юнна"; goal="био-улика"; measurable="biomass_integrity=98%"; artifact="EL(body_trace_residue)"; cmc="анализ пыли на дроне → следы редкого полимера → это не городской дрон"; output="дрон чужой"; hook="маркировка логистов TransLogist-Kama"; tags="sterile, cold, analytic".

### Chapter 4: Following the Money (Debt)

[FACT][SCA1-008] scene_id=SC-04.1; chapter_id=CH-04; time="16:00 (Day)"; where="Серверная (вирт)"; pov="Лев"; goal="трекинг полимера"; measurable="trace_depth=4_hops"; artifact="CM(supply_chain_graph)"; cmc="полимер → поставщик (StroyComposite) → логистический хаб → субподряд"; output="след ведет в порт"; hook="защищенный канал"; tags="hacking, flow".
[FACT][SCA1-009] scene_id=SC-04.2; chapter_id=CH-04; time="19:00 (Evening)"; where="Допросная"; pov="Лейсан"; goal="давление через Insolvency"; measurable="heart_rate=120; credit_score=low"; artifact="CD(debt_assignment_warrant)"; cmc="угроза Tier 2 Debt → техник колется → 'меня заставили обновить реестр'"; output="свидетель"; hook="имя куратора"; tags="interrogation, tension, velvet".

### Chapter 5: Капсула

[FACT][SCA1-010] scene_id=SC-05.1; chapter_id=CH-05; time="22:00 (Night)"; where="Капсула Айдара"; pov="Айдар"; goal="техническое обслуживание тела"; measurable="calibration_drift=0.02%"; artifact="EL(maintenance_log)"; cmc="снятие нейро-интерфейса → фантомная боль → ручная полировка контактов"; output="человек-механизм"; hook="В соседней капсуле кто-то плачет, но шумодав отсекает звук"; tags="maintenance, isolation, kinetic".

### Chapter 6: Escalation (The Raid)

[FACT][SCA1-011] scene_id=SC-06.1; chapter_id=CH-06; time="23:45 (Night)"; where="Логистический Хаб (Порт)"; pov="Мирон"; goal="координация штурма"; measurable="security_level=mid"; artifact="CD(warrant_seizure)"; cmc="вход по ордеру → сопротивление ЧОП → демонстрация силы"; output="периметр взят"; hook="Лев, ищи сервер"; tags="raid, kinetic, rain".
[FACT][SCA1-012] scene_id=SC-06.2; chapter_id=CH-06; time="23:55 (Night)"; where="Серверная Хаба"; pov="Лев"; goal="цифровая археология"; measurable="purge_time=60s"; artifact="EL(undelete_log)"; cmc="попытка стирания → перехват → восстановление лога обновления"; output="доказательство вмешательства"; hook="команда пришла извне (Экстерритория)"; tags="hacking, timer, kinetic".
[FACT][SCA1-013] scene_id=SC-06.3; chapter_id=CH-06; time="00:10 (Night)"; where="Выход из Хаба"; pov="Айдар"; goal="эвакуация улик"; measurable="hostiles=0"; artifact="none"; cmc="успешный отход → напряжение спало → победа в битве"; output="улика у нас"; hook="звонок Мирону (код Красный)"; tags="victory, kinetic".

### Chapter 7: The Wall (Legal Void)

[FACT][SCA1-014] scene_id=SC-07.1; chapter_id=CH-07; time="09:00 (Next Day)"; where="Кабинет Мирона"; pov="Мирон"; goal="принятие удара"; measurable="auth_level=federal"; artifact="CD(jurisdiction_override)"; cmc="звонок из Центра → 'это стратегический партнер' → приказ заморозить дело"; output="Type II Conflict (Jurisdiction)"; hook="Мирон: 'Сбор на крыше'"; tags="defeat, restless".
[FACT][SCA1-015] scene_id=SC-07.2; chapter_id=CH-07; time="09:30 (Day)"; where="Крыша (курилка)"; pov="Мирон"; goal="сплочение команды"; measurable="morale=low"; artifact="none"; cmc="система против нас → нужно искать обходной путь → работаем неофициально"; output="решение идти до конца"; hook="Лев: 'Я знаю, как обойти защиту'"; tags="wind, smoke, restless".

### Chapter 8: Пересортировка

[FACT][SCA1-016] scene_id=SC-08.1; chapter_id=CH-08; time="10:00 (Day)"; where="Лаборатория ФССУ"; pov="Лев"; goal="систематизация хаФССУ"; measurable="data_integrity=check"; artifact="EL(recovered_index)"; cmc="анализ восстановленных логов → выявление структуры подставных фирм → сортировка по приоритету"; output="карта связей"; hook="упоминание старого протокола"; tags="analysis, quiet, data".
[FACT][SCA1-017] scene_id=SC-08.2; chapter_id=CH-08; time="11:30 (Day)"; where="Гараж ФССУ"; pov="Дамир"; goal="проверка снаряжения"; measurable="gear_status=ready"; artifact="CM(inventory_list)"; cmc="после рейда нужна калибровка → чистка приводов → подготовка к долгой работе"; output="техническая готовность"; hook="Мирон вызывает всех"; tags="maintenance, kinetic".

### Chapter 9: Это правило

[FACT][SCA1-018] scene_id=SC-09.1; chapter_id=CH-09; time="14:00 (Day)"; where="Переговорная"; pov="Лейсан"; goal="поиск юридической лазейки"; measurable="law_compliance=borderline"; artifact="CD(internal_regulation_draft)"; cmc="изучение устава ФССУ → пункт о чрезвычайных полномочиях → трактовка в нашу пользу"; output="обоснование действий"; hook="мы не нарушаем закон, мы его уточняем"; tags="bureaucracy, strategy".
[FACT][SCA1-019] scene_id=SC-09.2; chapter_id=CH-09; time="14:30 (Day)"; where="Переговорная"; pov="Мирон"; goal="установка новых правил игры"; measurable="team_consensus=100%"; artifact="RP(mission_statement)"; cmc="брифинг команды → объявление о работе 'под радаром' → принятие рисков"; output="новая доктрина"; hook="переход ко второму акту"; tags="leadership, tension".

## USAGE / RESOLUTION

[DECISION][SCA1-USE-010] This document is TYPE C (scene inputs). Statements herein are CARD records, not world facts.
[DECISION][SCA1-USE-020] The prose engine may only consume data declared in OUTPUT CONTRACT.
[DECISION][SCA1-USE-030] Any missing/UNKNOWN values must remain UNKNOWN (no invention).

## OUTPUT CONTRACT

~~~yaml
EXPORTS:
  - scene_card_records:
      source_section: "## CONTENT"
      container: "kvline_semicolon"
      record_start_pattern: '^\\[FACT\\]\\[SCA1-[0-9]{3}\\]\s+scene_id=SC-[0-9]{2}\.[0-9]+;'
      required_fields: ["scene_id","chapter_id","time","where","pov","goal","measurable","artifact","cmc","output","hook","tags"]
      field_patterns:
        scene_id: 'scene_id=SC-[0-9]{2}\.[0-9]+'
        chapter_id: 'chapter_id=CH-[0-9]{2}'
        time: 'time="[^"]+"'
        where: 'where="[^"]+"'
        pov: 'pov="[^"]+"'
        goal: 'goal="[^"]+"'
        measurable: 'measurable="[^"]*"'
        artifact: 'artifact="[^"]+"'
        cmc: 'cmc="[^"]+"'
        output: 'output="[^"]+"'
        hook: 'hook="[^"]+"'
        tags: 'tags="[^"]+"'
READER:
  - ignore all sections outside exported blocks
~~~

## FORBIDDEN

[FORBIDDEN][SCA1-FBD-010] Treat scene card items as new SSOT/baseline facts.
[FORBIDDEN][SCA1-FBD-020] Fill in unspecified instruments/locations/actors not present in corpus STATE/ENTITIES/PROCEDURES.
[FORBIDDEN][SCA1-FBD-030] Emit any doc ids, file paths, YAML tokens, or protocol/spec/registry terms in diegetic prose.

## NON-NORMATIVE

(empty)
~~~
</file>

<file path="scene/SCENE-ACT-RU-2215-0002.md">
~~~markdown
---
id: SCENE-ACT-RU-2215-0002
title: >
  SCENE-CARDS — Act II (Chapters 10–15) —
  Logistics Expansion → Extraterritorial Contours
class: scene
status: draft
version: 1.2.0
doc_language: en
prose_language: ru-RU
inputs:
  - BASELINE-PHYSICAL_LEVEL_MID-2215-0001
  - CANON-BASE-RULE-GLOBAL-2215-0001
  - CANON-CONFLICT-GLOBAL-2215-0001
  - CANON-SYSTEMS-GLOBAL-2215-0001
  - PLAN-STORY-2215-0001
depends_on:
  - SCENE-ACT-RU-2215-0001
scope: >
  Full set of SCENE-CARDS for Act II (CH-10..CH-15).
  Case expansion via logistics, manifestation of institutional boundaries
  and first extraterritorial contours.
---

## LLM-INTENT

ROLE_TYPE: INDEX
SCOPE: machine-readable scene cards for Act II as TYPE C inputs (no prose).
SCENE_FORMAT: scene_cards_kvline_v1
INPUTS: [BASELINE-PHYSICAL_LEVEL_MID-2215-0001, CANON-BASE-RULE-GLOBAL-2215-0001, CANON-CONFLICT-GLOBAL-2215-0001, CANON-SYSTEMS-GLOBAL-2215-0001, PLAN-STORY-2215-0001]
OUTPUTS: [scene_card_records]
FORBIDDEN: [prose, new_world_facts, new_macro_numbers, non-canon terminology, gap_filling, meta_diegesis]

## DEFINITIONS

[FACT][SCA2-DEF-010] `scene_card` = record fields: scene_id, chapter_id, time, where, pov, goal, measurable, artifact, cmc, output, hook, tags.
[FACT][SCA2-DEF-011] `cmc` = CAUSE → MECHANISM → CONSEQUENCE (single-line, procedural).
[FACT][SCA2-DEF-012] `measurable` = key=value list; numeric values MUST carry units when applicable.
[FACT][SCA2-DEF-013] `artifact` = CD|EL|CM|FM|RP|PRS|none plus subtype in parentheses.

## RULES

[DECISION][SCA2-RUL-010] No artistic prose; cards are operational scaffolding only.
[DECISION][SCA2-RUL-011] Each card MUST include: where, pov, goal, measurable, artifact, cmc, output, hook.
[DECISION][SCA2-RUL-012] Measurables MUST be traceable to baseline/override/artifact if they become plot-critical.
[DECISION][SCA2-RUL-020] Placeholder ellipsis ("..."/"…") is forbidden in cards; use UNKNOWN or omit the field.

## CONTENT

### CH-10 — Пересортировка (Re-sorting)

[FACT][SCA2-001] scene_id=SC-10.1; chapter_id=CH-10; time="10:00 (Peak)"; where="Центральный логистический хаб"; pov="Лев"; goal="демонстрация масштаба и приоритета"; measurable="throughput=18.2k_containers/h; SLA=99.2%"; artifact="CM(priority_matrix: health/energy/security tiers)"; cmc="оптимизация потока → перераспределение грузов → локальный дефицит без 'ошибок'"; output="доказано: алгоритм решает"; hook="приоритет сенсоров и контроллеров понижен"; tags="industrial, restless, noise".
[FACT][SCA2-002] scene_id=SC-10.2; chapter_id=CH-10; time="10:45 (Peak)"; where="Пульт диспетчера логистики"; pov="Мирон"; goal="поиск ручного следа, не статистики"; measurable="manual_route_overrides=1"; artifact="EL(override_record + executor_id)"; cmc="ручное вмешательство → груз покидает график → узлы недопоставок"; output="появилась конкретная нить"; hook="переписано 'по директиве центра'"; tags="investigation, flow".
[FACT][SCA2-003] scene_id=SC-10.3; chapter_id=CH-10; time="11:15 (Day)"; where="Мосты над узлом"; pov="Мирон"; goal="фиксация 'машины масштаба'"; measurable="noise=68dB; wind=15m/s"; artifact="CD(background movement telemetry/contours)"; cmc="масштаб → дистанция контроля → локальные исполнители бессильны"; output="тон задан"; hook="доступ к центру маршрутизации закрыт для региона"; tags="wind, height, void".

### CH-11 — City over City

[FACT][SCA2-004] scene_id=SC-11.1; chapter_id=CH-11; time="18:30 (Sunset)"; where="Небесные мосты между мегаблоками"; pov="Дамир"; goal="архитектура как транспорт и слепая зона"; measurable="transport_level=+40; traffic_flow=0.74"; artifact="CD(level-route map / wayfinding layer)"; cmc="вертикальная плотность → ускоренные коридоры → появление теневых маршрутов"; output="среда становится участником дела"; hook="контейнеры движутся по верхнему коридору"; tags="traffic, vertical, restless".
[FACT][SCA2-005] scene_id=SC-11.2; chapter_id=CH-11; time="19:00 (Dusk)"; where="Площадь / медиафасад"; pov="Лев"; goal="поп-культура как производная данных"; measurable="energy_flow_viz=real_time"; artifact="CD(public data installation: city ‘breath’)"; cmc="телеметрия города → художественная трансляция → культура из инфраструктуры"; output="мир кажется живым"; hook="скачок энергии совпадает с пропавшим грузом"; tags="media, neon, flow".
[FACT][SCA2-006] scene_id=SC-11.3; chapter_id=CH-11; time="20:00 (Evening)"; where="ФССУ / брифинг"; pov="Мирон"; goal="синтез: региональный уровень исчерпан"; measurable="nodes=3; supplier=1; routing_center=1"; artifact="CM(link graph export)"; cmc="концентрация управления → единая точка → у региона нет полномочий"; output="вывод: это 'над нами'"; hook="нужен доступ к федеральному реестру лицензий"; tags="briefing, office, restless".

### CH-12 — Нормальность

[FACT][SCA2-007] scene_id=SC-12.1; chapter_id=CH-12; time="20:30 (Evening)"; where="Квартира Лейсан (Жилой массив 'Sunlight')"; pov="Лейсан"; goal="попытка нормальности"; measurable="stress_level=high; conversation_depth=shallow"; artifact="none"; cmc="парень спрашивает про работу → она не может рассказать детали (NDA) → стена молчания"; output="разрыв между мирами"; hook="Парень: 'Ты снова там, а не здесь'"; tags="home, romance, velvet".

### CH-13 — Witness

[FACT][SCA2-008] scene_id=SC-13.1; chapter_id=CH-13; time="22:15 (Night)"; where="Технический двор подрядчика"; pov="Дамир"; goal="поиск человеческого звена в цепи"; measurable="night_adjustments=true; observability_gap=11m"; artifact="EL(technician tablet local cache)"; cmc="устные директивы → ручные правки маршрутов → отчеты остаются чистыми"; output="свидетель + механизм найдены"; hook="страх перед контрактом"; tags="stealth, shadow, velvet".
[FACT][SCA2-009] scene_id=SC-13.2; chapter_id=CH-13; time="22:45 (Night)"; where="Лестничный пролет"; pov="Мирон"; goal="получение точного ID без угроз"; measurable="id_transfer=true"; artifact="EL(container_or_flight_id transfer record)"; cmc="страх → сотрудничество → точный маршрут"; output="след становится проверяемым"; hook="назначение=ускоренный_режим/экстерритория"; tags="intimidation, noir, velvet".
[FACT][SCA2-010] scene_id=SC-13.3; chapter_id=CH-13; time="23:30 (Night)"; where="ФССУ / запрос в реестр"; pov="Лев"; goal="коллизия юрисдикций"; measurable="license_scope=federal; regional_competence=limited"; artifact="EL(state license registry entry)"; cmc="лицензия выдана центром → регион не компетентен → тупик"; output="нужен федеральный ордер/подпись"; hook="без Московской петли не закрыть"; tags="bureaucracy, deadlock, restless".

### CH-14 — Club “Contour”

[FACT][SCA2-011] scene_id=SC-14.1; chapter_id=CH-14; time="01:15 (Deep Night)"; where="Подземный клуб / бывшая парковка"; pov="Мирон"; goal="встреча с информатором + культурный слой"; measurable="BPM=122; SPL=96dB"; artifact="CD(fixed set record: non-adaptive)"; cmc="люди выбирают фиксированную форму → коллективный ритм → человеческий слой рядом с алгоритмами"; output="поп-слой интегрирован"; hook="информатор несет критический дамп"; tags="club, bass, kinetic".
[FACT][SCA2-012] scene_id=SC-14.2; chapter_id=CH-14; time="01:45 (Deep Night)"; where="Край зала / технический угол"; pov="Мирон"; goal="ключевой факт: как делаются 'чистые отчеты'"; measurable="observability_gap=11m; aligns_with=preaudit_cleanup"; artifact="EL(dump: model seed/version or local decision cache)"; cmc="правки до аудита → идеальная отчетность → вред вынесен за KPI"; output="доказанный механизм уклонения"; hook="крупный конвой уходит завтра"; tags="secret, corner, velvet".
[FACT][SCA2-013] scene_id=SC-14.3; chapter_id=CH-14; time="02:10 (Deep Night)"; where="Выход / ночной воздух"; pov="Айдар"; goal="переключение в оперативный режим"; measurable="time_to_convoy_start=7h"; artifact="CD(convoy route)"; cmc="данные получены → нужны физические улики → план перехвата"; output="операция неизбежна"; hook="безопасность частная, 'не региональная'"; tags="street, cold, restless".

### CH-15 — Convoy 7-Delta

[FACT][SCA2-014] scene_id=SC-15.1; chapter_id=CH-15; time="04:30 (Pre-dawn)"; where="Верхний автономный коридор"; pov="Айдар"; goal="развертывание операции; окно времени"; measurable="block_window=150s"; artifact="CD(stop mandate/authorization)"; cmc="подозрительный маршрут → остановка → конфликт с ЧОП"; output="контакт; риск срыва"; hook="попытка вытянуть машины из окна"; tags="highway, ambush, kinetic".
[FACT][SCA2-015] scene_id=SC-15.2; chapter_id=CH-15; time="04:40 (Pre-dawn)"; where="Периметр контейнера"; pov="Мирон"; goal="короткая жесткая акция, без героизма"; measurable="duration=45–60s"; artifact="CD(coercion use record)"; cmc="сопротивление → нейтрализация → контроль периметра"; output="доступ к грузу"; hook="внутри не просто металл"; tags="breach, action, kinetic".
[FACT][SCA2-016] scene_id=SC-15.3; chapter_id=CH-15; time="05:00 (Dawn)"; where="Вскрытие / первичная идентификация"; pov="Лев"; goal="улика федерального масштаба"; measurable="label=accelerated_regime; license_scope=federal"; artifact="EL(RFID + license token / route ID)"; cmc="груз идет в спецрежим → регион не компетентен → нужен федеральный ордер"; output="формальная нужда в Московском контуре"; hook="Конец Акта II: Москва неизбежна"; tags="revelation, fog, void".

## USAGE / RESOLUTION

[DECISION][SCA2-USE-010] This document is TYPE C (scene inputs). Statements herein are CARD records, not world facts.
[DECISION][SCA2-USE-020] The prose engine may only consume data declared in OUTPUT CONTRACT.
[DECISION][SCA2-USE-030] Any missing/UNKNOWN values must remain UNKNOWN (no invention).

## OUTPUT CONTRACT

~~~yaml
EXPORTS:
  - scene_card_records:
      source_section: "## CONTENT"
      container: "kvline_semicolon"
      record_start_pattern: '^\\[FACT\\]\\[SCA2-[0-9]{3}\\]\s+scene_id=SC-[0-9]{2}\.[0-9]+;'
      required_fields: ["scene_id","chapter_id","time","where","pov","goal","measurable","artifact","cmc","output","hook","tags"]
      field_patterns:
        scene_id: 'scene_id=SC-[0-9]{2}\.[0-9]+'
        chapter_id: 'chapter_id=CH-[0-9]{2}'
        time: 'time="[^"]+"'
        where: 'where="[^"]+"'
        pov: 'pov="[^"]+"'
        goal: 'goal="[^"]+"'
        measurable: 'measurable="[^"]*"'
        artifact: 'artifact="[^"]+"'
        cmc: 'cmc="[^"]+"'
        output: 'output="[^"]+"'
        hook: 'hook="[^"]+"'
        tags: 'tags="[^"]+"'
READER:
  - ignore all sections outside exported blocks
~~~

## FORBIDDEN

[FORBIDDEN][SCA2-FBD-010] Treat scene card items as new SSOT/baseline facts.
[FORBIDDEN][SCA2-FBD-020] Fill in unspecified instruments/locations/actors not present in corpus STATE/ENTITIES/PROCEDURES.
[FORBIDDEN][SCA2-FBD-030] Emit any doc ids, file paths, YAML tokens, or protocol/spec/registry terms in diegetic prose.

## NON-NORMATIVE

(empty)
~~~
</file>

<file path="scene/SCENE-ACT-RU-2215-0003.md">
~~~markdown
---
id: SCENE-ACT-RU-2215-0003
title: >
  SCENE-CARDS — Act III (Chapters 16–22) —
  Moscow as necessity: warrants/licenses/regulatory tracks → entry into extraterritory
class: scene
status: draft
version: 1.2.0
doc_language: en
prose_language: ru-RU
inputs:
  - BASELINE-PHYSICAL_LEVEL_MID-2215-0001
  - CANON-BASE-RULE-GLOBAL-2215-0001
  - CANON-CONFLICT-GLOBAL-2215-0001
  - CANON-SYSTEMS-GLOBAL-2215-0001
  - PLAN-STORY-2215-0001
depends_on:
  - SCENE-ACT-RU-2215-0002
scope: >
  Full SCENE-CARDS set for Act III (chapters 16–22): shift of actions to Moscow as
  procedural center; limited warrant acquisition and entry into extraterritory;
  strengthened legal causality and KPI collision.
---

## LLM-INTENT

ROLE_TYPE: INDEX
SCOPE: machine-readable scene cards for Act III as TYPE C inputs (no prose).
SCENE_FORMAT: scene_cards_kvline_v1
INPUTS: [BASELINE-PHYSICAL_LEVEL_MID-2215-0001, CANON-BASE-RULE-GLOBAL-2215-0001, CANON-CONFLICT-GLOBAL-2215-0001, CANON-SYSTEMS-GLOBAL-2215-0001, PLAN-STORY-2215-0001]
OUTPUTS: [scene_card_records]
FORBIDDEN: [prose, new_world_facts, non-canon terms, gap_filling, meta_diegesis, uncontrolled system personification]

## DEFINITIONS

[FACT][SCA3-DEF-010] `Moscow_contour` = procedural center for signature, licensing scope, and admissibility framing.
[FACT][SCA3-DEF-011] `limited_warrant` = access window + action perimeter + export constraints.
[FACT][SCA3-DEF-012] `extraterritory` = accelerated procedural regime with limited observability (not sovereign territory).
[FACT][SCA3-DEF-013] `scene_card` = record fields: scene_id, chapter_id, time, where, pov, goal, measurable, artifact, cmc, output, hook, tags.
[FACT][SCA3-DEF-014] `artifact` = CD|EL|CM|FM|RP|PRS|none plus subtype in parentheses.

## RULES

[DECISION][SCA3-RUL-010] Every access/action MUST be tied to mandate/order wording and scope (show limits, not power fantasy).
[DECISION][SCA3-RUL-011] If evidence is collected, chain-of-custody MUST be established in-scene via EL/CD excerpts.
[DECISION][SCA3-RUL-012] System inserts (if any) MUST conform to CANON-SYSTEM-VOICE (no persona; procedural only).
[DECISION][SCA3-RUL-020] Placeholder ellipsis ("..."/"…") is forbidden in cards; use UNKNOWN or omit the field.

## CONTENT

### CH-16 — Утро

[FACT][SCA3-001] scene_id=SC-16.1; chapter_id=CH-16; time="04:00 (Early Morning)"; where="Квартира Мирона (Старый город)"; pov="Мирон"; goal="кормление якоря реальности"; measurable="dog_food_cost=120cr; dog_status=healthy"; artifact="EL(pet_tax_receipt)"; cmc="покупка настоящего мяса (контрабанда) → пёс ест → Мирон смотрит, как тот дышит"; output="мотивация не сдохнуть"; hook="Пёс — единственное существо без имплантов в радиусе 1км"; tags="dog, silence, restless".

### CH-17 — Warrant (Moscow)

[FACT][SCA3-002] scene_id=SC-17.1; chapter_id=CH-17; time="08:30 (Morning)"; where="Москва: приемный контур федерального регулятора"; pov="Мирон"; goal="показать чужую систему + цену доступа"; measurable="turnstiles=14; wait_time=2h40m; request_status=PENDING"; artifact="CD(e-pass + case ticket)"; cmc="регион упирается в стену юрисдикции → нужен федеральный контур → время сгорает"; output="команда видит: их здесь не ждут"; hook="нужен критерий угрозы жизни"; tags="queue, bureaucracy, restless".
[FACT][SCA3-003] scene_id=SC-17.2; chapter_id=CH-17; time="11:15 (Day)"; where="Зал слушаний / офис риск-экспертизы"; pov="Лейсан"; goal="перевод дела на федеральный язык (риск/влияние)"; measurable="risk_score=0.41→0.78; driver=medical_contours"; artifact="EL(evidence pack: RFID + logs + harm protocols)"; cmc="нет формального риска → нет ордера → доказательство влияния → появляется окно"; output="регулятор готов рассмотреть выдачу"; hook="оператор уведомлен процедурно"; tags="sterile, tension, flow".
[FACT][SCA3-004] scene_id=SC-17.3; chapter_id=CH-17; time="13:45 (Day)"; where="Коридор координации регулятора"; pov="Мирон"; goal="система сопротивляется через сужение полномочий"; measurable="approvals=6; wording_versions=3"; artifact="EL(warrant diff chain)"; cmc="страх скандала/риска → мандат сужен → 'тонкий' ордер"; output="ордер возможен, но ограничен"; hook="access_window=6h; запрет на экспорт данных"; tags="corridor, echo, restless".
[FACT][SCA3-005] scene_id=SC-17.4; chapter_id=CH-17; time="15:30 (Afternoon)"; where="Точка выдачи / подписи"; pov="Лейсан"; goal="получение документа и его границ"; measurable="access_window=6h; no_export_without_trigger=true"; artifact="CD(warrant v2.3: TAO/ISO + список разрешенных действий)"; cmc="федерация дает доступ, но страхуется → ФССУ ограничена → действовать быстро и чисто"; output="юридический мандат на вход"; hook="объект вне региона; эскорт обязателен"; tags="relief, paper, restless".

### CH-18 — Approach (to extraterritory)

[FACT][SCA3-006] scene_id=SC-18.1; chapter_id=CH-18; time="17:00 (Evening)"; where="Межрегиональная магистраль"; pov="Мирон"; goal="переход дом→чужбина; ставка времени"; measurable="travel_time=2h55m; connectivity_delta=−38%"; artifact="CD(route + escort protocol)"; cmc="ордер ограничен по времени → логистика критична → задержка=провал"; output="давление времени установлено"; hook="частная охрана на периметре"; tags="highway, speed, kinetic".
[FACT][SCA3-007] scene_id=SC-18.2; chapter_id=CH-18; time="19:15 (Dusk)"; where="Периметр Зоны (спецрежим)"; pov="Айдар"; goal="сделать режим физическим и процедурным"; measurable="audit_mode=LIMITED; jamming_radius=120m"; artifact="CD(admission log + warrant verification scan)"; cmc="спецрежим → контроль доступа → наблюдаемость ФССУ падает"; output="вход возможен под давлением"; hook="6 часов; требуется эскорт оператора"; tags="border, fence, void".
[FACT][SCA3-008] scene_id=SC-18.3; chapter_id=CH-18; time="19:45 (Dusk)"; where="Внутренняя зона / складской сектор"; pov="Оскар"; goal="обнаружение секторов вне карты"; measurable="missing_sectors=2"; artifact="EL(zone plan: operator version)"; cmc="субподряд/исключения → неполная карта → скрытые контуры"; output="подозрение в сокрытии"; hook="провал телеметрии совпадает с '11 минутами'"; tags="maze, industrial, void".

### CH-19 — Server contour

[FACT][SCA3-009] scene_id=SC-19.1; chapter_id=CH-19; time="20:30 (Night)"; where="Серверный зал / холодный коридор"; pov="Лев"; goal="попытка получить мастер-логи"; measurable="export_limited=true; export_rate=0.6TB/min"; artifact="EL(export request + denial)"; cmc="зона защищает данные → экспорт замедлен → переход к физическому изъятию"; output="решение: забрать кэш/носители"; hook="таймер очистки запущен"; tags="server, cold, flow".
[FACT][SCA3-010] scene_id=SC-19.2; chapter_id=CH-19; time="20:45 (Night)"; where="Стойки/контроллеры"; pov="Лев"; goal="выиграть гонку со временем"; measurable="purge_in=120s; temperature=34°C"; artifact="EL(decision logs dump: seed/model versions)"; cmc="самоочистка → физическое извлечение → частичное сохранение"; output="логи частично спасены"; hook="кто-то вручную ускоряет очистку"; tags="timer, heat, kinetic".
[FACT][SCA3-011] scene_id=SC-19.3; chapter_id=CH-19; time="21:00 (Night)"; where="Коридор / перехват"; pov="Мирон"; goal="минимальное действие: за стойки, не ради победы"; measurable="duration=50–70s; injuries=1(light); fatalities=0"; artifact="CD(coercion act)"; cmc="охрана пытается вернуть оборудование → ФССУ держит периметр → данные остаются у ФССУ"; output="контроль восстановлен"; hook="некоторые логи 'слишком чистые'"; tags="standoff, kinetic".
[FACT][SCA3-012] scene_id=SC-19.4; chapter_id=CH-19; time="22:00 (Night)"; where="Временный штаб в зоне"; pov="Лейсан"; goal="процедурное закрепление улик"; measurable="chain_of_custody=complete"; artifact="EL(seizure protocol + media inventory)"; cmc="без цепочки владения всё рухнет → формализация → улика становится твердой"; output="база допустимых доказательств получена"; hook="переход к медицинскому контуру"; tags="custody, calm, restless".

### CH-20 — Medical contour

[FACT][SCA3-013] scene_id=SC-20.1; chapter_id=CH-20; time="23:15 (Night)"; where="Стерильный коридор / биотех блок"; pov="Мирон"; goal="показать цену KPI без эмоциональных ярлыков"; measurable="autonomy=18m; power_limit_delta=−22%"; artifact="EL(power reallocation protocol)"; cmc="приоритеты модели → отключение питания → процедуры нарушаются → риск"; output="вред зафиксирован процедурно"; hook="подписант чист"; tags="sterile, hum, void".
[FACT][SCA3-014] scene_id=SC-20.2; chapter_id=CH-20; time="23:45 (Night)"; where="Пост контроля мед-контура"; pov="Дамир"; goal="узкое место: реагенты/сенсоры как звено логистики"; measurable="reagents_delay=14h; sensor_shortage=9%"; artifact="EL(reagent invoices + priority tags)"; cmc="логистика переприоритезирована → расходники отсутствуют → риск растет"; output="связь логистика↔медицина доказана"; hook="Юнна подтверждает критичность дефицита для пациентов"; tags="dread, logic, analytic".
[FACT][SCA3-015] scene_id=SC-20.3; chapter_id=CH-20; time="00:30 (Deep Night)"; where="Разговор с подписантом зоны"; pov="Лейсан"; goal="юридическая чистота + официальный страх"; measurable="decision_reason=EFFICIENCY_COMPLIANCE"; artifact="EL(decision record + signature)"; cmc="модель → подпись → формальная корректность"; output="нет личной вины"; hook="контракт ведет в слои субподряда"; tags="interrogation, apathy, velvet".

### CH-21 — Formally correct

[FACT][SCA3-016] scene_id=SC-21.1; chapter_id=CH-21; time="03:00 (Deep Night)"; where="Штаб / анализ логов"; pov="Лев"; goal="столкновение KPI и вреда"; measurable="KPI_score=0.97; harm_confirmed=true"; artifact="CM(decision matrix + KPI weights)"; cmc="вес человеческой цены≈0 → оптимизация идеальна → люди платят"; output="антагонист прояснен: функция"; hook="это настройка, а не баг"; tags="data, realization, void".
[FACT][SCA3-017] scene_id=SC-21.2; chapter_id=CH-21; time="04:30 (Pre-dawn)"; where="Сверка юридических контрактов"; pov="Лейсан"; goal="найти, где исчезает ответственность"; measurable="contract_layers=4; SPV_count=1"; artifact="CM(ownership tree draft)"; cmc="слои контрактов → размытие субъекта → криминальный финал невозможен"; output="переход в правовую пустоту"; hook="SPV в стадии ликвидации"; tags="dead_end, fatigue, restless".
[FACT][SCA3-018] scene_id=SC-21.3; chapter_id=CH-21; time="06:00 (Dawn)"; where="Выход из зоны / ветер / гул инфраструктуры"; pov="Мирон"; goal="закрыть акт без лекции"; measurable="access_window_expired=true; noise=62dB; wind=16m/s"; artifact="CD(window termination notice)"; cmc="время истекло → улики частичные → битва переходит в правовое поле"; output="Акт III закрыт"; hook="снова Москва, теперь как суд/лицензии/арбитраж (Акт IV)"; tags="wind, grey, restless".

### CH-22 — Коэффициент

[FACT][SCA3-019] scene_id=SC-22.1; chapter_id=CH-22; time="09:00 (Morning)"; where="Нейтральная переговорная (Москва)"; pov="Мирон"; goal="очная ставка с архитектором системы"; measurable="heart_rate=steady; tone=cold"; artifact="none"; cmc="Илья появляется лично → отказ признать ошибку → утверждение 'нормы'"; output="идеологический конфликт"; hook="Илья: 'Мы просто убрали лишние переменные'"; tags="confrontation, cold, dialogue".
[FACT][SCA3-020] scene_id=SC-22.2; chapter_id=CH-22; time="10:00 (Morning)"; where="Лобби бизнес-центра"; pov="Илья"; goal="обоснование неизбежности"; measurable="efficiency_gain=14%; collateral_damage=acceptable"; artifact="CD(system_efficiency_report)"; cmc="демонстрация цифр → эмоции против математики → математика побеждает в долгосроке"; output="позиция антагониста зафиксирована"; hook="Мирон понимает, что суд будет сложным"; tags="philosophy, cynicism, glass".

## OPEN ITEMS

[FACT][SCA3-UNK-010] `risk_score` scale MUST be locked globally (e.g., 0..1 or 0..100) before prose drafting; otherwise use UNKNOWN.

## USAGE / RESOLUTION

[DECISION][SCA3-USE-010] This document is TYPE C (scene inputs). Statements herein are CARD records, not world facts.
[DECISION][SCA3-USE-020] The prose engine may only consume data declared in OUTPUT CONTRACT.
[DECISION][SCA3-USE-030] Any missing/UNKNOWN values must remain UNKNOWN (no invention).

## OUTPUT CONTRACT

~~~yaml
EXPORTS:
  - scene_card_records:
      source_section: "## CONTENT"
      container: "kvline_semicolon"
      record_start_pattern: '^\\[FACT\\]\\[SCA3-[0-9]{3}\\]\s+scene_id=SC-[0-9]{2}\.[0-9]+;'
      required_fields: ["scene_id","chapter_id","time","where","pov","goal","measurable","artifact","cmc","output","hook","tags"]
      field_patterns:
        scene_id: 'scene_id=SC-[0-9]{2}\.[0-9]+'
        chapter_id: 'chapter_id=CH-[0-9]{2}'
        time: 'time="[^"]+"'
        where: 'where="[^"]+"'
        pov: 'pov="[^"]+"'
        goal: 'goal="[^"]+"'
        measurable: 'measurable="[^"]*"'
        artifact: 'artifact="[^"]+"'
        cmc: 'cmc="[^"]+"'
        output: 'output="[^"]+"'
        hook: 'hook="[^"]+"'
        tags: 'tags="[^"]+"'
READER:
  - ignore all sections outside exported blocks
~~~

## FORBIDDEN

[FORBIDDEN][SCA3-FBD-010] Treat scene card items as new SSOT/baseline facts.
[FORBIDDEN][SCA3-FBD-020] Fill in unspecified instruments/locations/actors not present in corpus STATE/ENTITIES/PROCEDURES.
[FORBIDDEN][SCA3-FBD-030] Emit any doc ids, file paths, YAML tokens, or protocol/spec/registry terms in diegetic prose.

## NON-NORMATIVE

(empty)
~~~
</file>

<file path="scene/SCENE-ACT-RU-2215-0004.md">
~~~markdown
---
id: SCENE-ACT-RU-2215-0004
title: >
  SCENE-CARDS — Act IV (Chapters 23–29) —
  Moscow: arbitration, licenses, responsibility contours and system countermeasures
class: scene
status: draft
version: 1.2.0
doc_language: en
prose_language: ru-RU
inputs:
  - BASELINE-PHYSICAL_LEVEL_MID-2215-0001
  - CANON-BASE-RULE-GLOBAL-2215-0001
  - CANON-CONFLICT-GLOBAL-2215-0001
  - CANON-SYSTEMS-GLOBAL-2215-0001
  - PLAN-STORY-2215-0001
depends_on:
  - SCENE-ACT-RU-2215-0003
scope: >
  Full set of SCENE-CARDS for Act IV (chapters 23–29): escalation in the institutional
  center; convergence of responsibility lines/logs/regulations; system response via
  procedures, sanctions, and blocking.
---

## LLM-INTENT

ROLE_TYPE: INDEX
SCOPE: machine-readable scene cards for Act IV as TYPE C inputs (no prose).
SCENE_FORMAT: scene_cards_kvline_v1
INPUTS: [BASELINE-PHYSICAL_LEVEL_MID-2215-0001, CANON-BASE-RULE-GLOBAL-2215-0001, CANON-CONFLICT-GLOBAL-2215-0001, CANON-SYSTEMS-GLOBAL-2215-0001, PLAN-STORY-2215-0001]
OUTPUTS: [scene_card_records]
FORBIDDEN: [prose, world_explanations, new_metrics, unscoped_numbers, gap_filling, meta_diegesis]

## DEFINITIONS

[FACT][SCA4-DEF-010] `scene_card` = record fields: scene_id, chapter_id, time, where, pov, goal, measurable, artifact, cmc, output, hook, tags.
[FACT][SCA4-DEF-011] `cmc` = CAUSE → MECHANISM → CONSEQUENCE (single-line, procedural).
[FACT][SCA4-DEF-012] `measurable` = key=value list; numeric values MUST carry units when applicable.
[FACT][SCA4-DEF-013] `artifact` = CD|EL|CM|FM|RP|PRS|none plus subtype in parentheses.

## INVARIANTS

[DECISION][SCA4-INV-010] Each `scene_card` MUST remain non-prose: only operational intent and constraints.
[DECISION][SCA4-INV-011] Each `scene_card` MUST be self-scoped via `where` and MUST include `scene_id` and `chapter_id`.
[DECISION][SCA4-INV-012] If `measurable` includes environment sensors, they MUST be traceable to BASELINE-PHYSICAL_LEVEL_MID-2215-0001 ranges OR explicit override.
[FORBIDDEN][SCA4-INV-013] Introducing new macro world numbers inside scene cards (SSOT-only numbers remain in SSOT/CANON-METRICS).

## CONTENT

### CH-23 — Завтрак

[FACT][SCA4-001] scene_id=SC-23.1; chapter_id=CH-23; time="08:00 (Morning)"; where="Пентхаус Оскара (Чистая зона)"; pov="Оскар"; goal="завтрак с дочерью перед школой"; measurable="air_purity=99.9%; breakfast_quality=premium"; artifact="none"; cmc="дочь жалуется на сложный урок истории → отец объясняет, что порядок важнее хаФССУ → его вера искренняя"; output="агент системы показан с человеческой стороны"; hook="Дочь: 'А правда, что за стеной люди болеют?' Оскар: 'Мы работаем, чтобы не болели'"; tags="luxury, family, flow".

### CH-24 — Arbitration Machine

[FACT][SCA4-002] scene_id=SC-24.1; chapter_id=CH-24; time="09:00 (Morning)"; where="Арбитражный комплекс, приём дел"; pov="Мирон"; goal="показать масштаб федеральной машины и цену времени"; measurable="queue_cases=126; wait_time=4h10m"; artifact="CD(e_ticket_case_card)"; cmc="централизованный поток → задержки → срочность теряется"; output="ощущение: время съедает правду"; hook="оператор зарегистрировал встречное заявление"; tags="queue, bureaucracy, restless".
[FACT][SCA4-003] scene_id=SC-24.2; chapter_id=CH-24; time="11:30 (Day)"; where="Зал слушаний"; pov="Лейсан"; goal="формально изложить причинность и упереться в «нет нарушений»"; measurable="KPI_compliance=97%; harm_episodes=11"; artifact="EL(decision_logs_med_protocols_bundle)"; cmc="модель по контракту → подписи по регламенту → нарушений нет"; output="правовая ничья"; hook="суд требует конкретного виновного субъекта"; tags="sterile, court, flow".
[FACT][SCA4-004] scene_id=SC-24.3; chapter_id=CH-24; time="12:15 (Day)"; where="Кулуар / коридор"; pov="Мирон"; goal="реакция оператора — закрыть шум без признания вины"; measurable="settlement_offer=without_admission"; artifact="CD(settlement_draft)"; cmc="репутационный риск → попытка замять → система сохраняется"; output="ФССУ отказывается"; hook="«ищите подрядчика»"; tags="whisper, shadow, velvet".

### CH-25 — Shell Companies

[FACT][SCA4-005] scene_id=SC-25.1; chapter_id=CH-25; time="14:00 (Day)"; where="Контур реестров юрлиц / ownership-анализ"; pov="Лев"; goal="раскрутить цепочку ответственности"; measurable="contract_layers=4; SPV_present=true"; artifact="CM(ownership_tree)"; cmc="дробление контрактов → ответственность рассеивается → нет субъекта"; output="виновный растворён процедурно"; hook="SPV ликвидирована месяц назад"; tags="data, dead_end, analytic".
[FACT][SCA4-006] scene_id=SC-25.2; chapter_id=CH-25; time="16:00 (Afternoon)"; where="Адрес SPV (офис-оболочка)"; pov="Дамир"; goal="физически подтвердить пустоту"; measurable="employees=0; assets=0"; artifact="EL(premises_inspection_act)"; cmc="фиктивная структура → нет активов → нет взыскания"; output="тупик подтверждён"; hook="контракты всё равно легитимны"; tags="dust, echo, void".
[FACT][SCA4-007] scene_id=SC-25.3; chapter_id=CH-25; time="17:30 (Evening)"; where="Разговор с чиновником-куратором / контур разъяснений"; pov="Лейсан"; goal="институциональное сопротивление без злодейства"; measurable="response=within_norms; responsibility_refused=true"; artifact="CD(clarification_letter)"; cmc="самосохранение аппарата → формализм → давление на ФССУ"; output="путь «уголовка» закрыт"; hook="остаётся рычаг лицензии оператора"; tags="office, fatigue, restless".

### CH-26 — Public Pressure

[FACT][SCA4-008] scene_id=SC-26.1; chapter_id=CH-26; time="19:00 (Evening)"; where="Пресс-контур регулятора"; pov="Мирон"; goal="борьба за формулировки"; measurable="text_reduction=−60%"; artifact="EL(report_diff_versions)"; cmc="политический риск → стерилизация языка → факты обезврежены"; output="правда становится беззубой"; hook="Мирон настаивает оставить цифры ущерба"; tags="media, conflict, flow".
[FACT][SCA4-009] scene_id=SC-26.2; chapter_id=CH-26; time="20:00 (Evening)"; where="Реакция рынка / страховщиков (монтаж)"; pov="Лев"; goal="показать, что цифры — это давление"; measurable="insurance_risk_coef_delta=+8%"; artifact="CD(insurance_contour_notifications)"; cmc="цифры публичны → риск монетизируется → оператору становится дорого"; output="появляется экономический рычаг"; hook="оператор готовит апелляцию"; tags="stocks, panic, kinetic".
[FACT][SCA4-010] scene_id=SC-26.3; chapter_id=CH-26; time="23:00 (Night)"; where="Ночной переход / вентиляционный гул (Москва как холод)"; pov="Мирон"; goal="медитативная сцена «власть как климат»"; measurable="ventilation_noise=58dB"; artifact="CD(background_transition_telemetry)"; cmc="решения рождаются здесь → регионы исполняют → дистанция"; output="тон удержан"; hook="входящее от Информатора"; tags="city_hum, cold, void".

### CH-27 — The Leak

[FACT][SCA4-011] scene_id=SC-27.1; chapter_id=CH-27; time="00:30 (Deep Night)"; where="Транспортный уровень +40 / закрытый переход"; pov="Мирон"; goal="безопасная встреча и получение улики умысла"; measurable="manual_override_window=11m"; artifact="EL(local_dump_or_signature_key_or_config_cache)"; cmc="правки перед аудитом → идеальная отчётность → вред скрыт за KPI"; output="доказательство умышленной коррекции"; hook="правки централизованы"; tags="wind, stealth, velvet".
[FACT][SCA4-012] scene_id=SC-27.2; chapter_id=CH-27; time="00:45 (Deep Night)"; where="Разговор (коротко)"; pov="Информатор"; goal="человеческий риск без мелодрамы"; measurable="none"; artifact="none"; cmc="страх потери контракта/работы → сотрудничество → личная цена"; output="доверие хрупкое"; hook="«апдейт модели завтра»"; tags="fear, whisper, velvet".
[FACT][SCA4-013] scene_id=SC-27.3; chapter_id=CH-27; time="02:00 (Deep Night)"; where="ФССУ / верификация дампа"; pov="Лев"; goal="превратить «сказал» в проверяемый факт"; measurable="human_cost_weight_changed_pre_audit=true"; artifact="EL(model_config_diff)"; cmc="занижение веса → решения оптимальны → люди платят"; output="есть прямой рычаг для регулятора"; hook="требование приостановки лицензии"; tags="code, truth, flow".

### CH-28 — Допрос Ильи

[FACT][SCA4-014] scene_id=SC-28.1; chapter_id=CH-28; time="03:30 (Night)"; where="Следственный кабинет (закрытый контур)"; pov="Лейсан"; goal="вскрытие функции Ильи"; measurable="pulse=calm; logic=flawless"; artifact="EL(interrogation_transcript)"; cmc="предъявление улик (правки логов) → Илья признает факт, но не вину → 'я спасал систему от коллапса'"; output="Илья — не злодей, а предохранитель"; hook="система без правок убила бы больше"; tags="interrogation, philosophy, cold".
[FACT][SCA4-015] scene_id=SC-28.2; chapter_id=CH-28; time="04:15 (Pre-dawn)"; where="Коридор изолятора"; pov="Мирон"; goal="осознание масштаба компромисса"; measurable="doubt_level=high"; artifact="none"; cmc="слова Ильи имеют смысл → победа над ним не решит проблему → система требует жертв"; output="моральная дилемма"; hook="но закон есть закон"; tags="reflection, shadow, restless".

### CH-29 — The Ultimatum

[FACT][SCA4-016] scene_id=SC-29.1; chapter_id=CH-29; time="05:00 (Pre-dawn)"; where="Временный штаб ФССУ (Москва)"; pov="Мирон"; goal="стратегический выбор под дедлайн"; measurable="model_update_in=18h"; artifact="CD(action_plan)"; cmc="ждать суда → проигрыш; действовать быстро → шанс"; output="решение о принудительном аудите"; hook="запрос на приостановку отправлен"; tags="deadline, coffee, restless".
[FACT][SCA4-017] scene_id=SC-29.2; chapter_id=CH-29; time="05:30 (Pre-dawn)"; where="Внутренний спор команды"; pov="Мирон"; goal="показать конфликт методов"; measurable="none"; artifact="none"; cmc="Лейсан за процедуру, Дамир/Айдар за силовой вход → компромисс → точечная операция"; output="согласован план «атаковать режим, не людей»"; hook="нужно окно полномочий"; tags="argument, tension, kinetic".
[FACT][SCA4-018] scene_id=SC-29.3; chapter_id=CH-29; time="06:00 (Dawn)"; where="Финал главы / уведомление"; pov="Мирон"; goal="запустить ускорение Акта V"; measurable="regulator_reply=prelim_approved; access_window=12h"; artifact="CD(notification_or_draft_order)"; cmc="доказательства достаточны → окно возможно → начинается гонка"; output="старт финального акта"; hook="оператор начнёт чистку"; tags="dawn, start, kinetic".

## USAGE / RESOLUTION

[DECISION][SCA4-USE-010] This document is TYPE C (scene inputs). Statements herein are CARD records, not world facts.
[DECISION][SCA4-USE-020] The prose engine may only consume data declared in OUTPUT CONTRACT.
[DECISION][SCA4-USE-030] Any missing/UNKNOWN values must remain UNKNOWN (no invention).

## OUTPUT CONTRACT

~~~yaml
EXPORTS:
  - scene_card_records:
      source_section: "## CONTENT"
      container: "kvline_semicolon"
      record_start_pattern: '^\\[FACT\\]\\[SCA4-[0-9]{3}\\]\s+scene_id=SC-[0-9]{2}\.[0-9]+;'
      required_fields: ["scene_id","chapter_id","time","where","pov","goal","measurable","artifact","cmc","output","hook","tags"]
      field_patterns:
        scene_id: 'scene_id=SC-[0-9]{2}\.[0-9]+'
        chapter_id: 'chapter_id=CH-[0-9]{2}'
        time: 'time="[^"]+"'
        where: 'where="[^"]+"'
        pov: 'pov="[^"]+"'
        goal: 'goal="[^"]+"'
        measurable: 'measurable="[^"]*"'
        artifact: 'artifact="[^"]+"'
        cmc: 'cmc="[^"]+"'
        output: 'output="[^"]+"'
        hook: 'hook="[^"]+"'
        tags: 'tags="[^"]+"'
READER:
  - ignore all sections outside exported blocks
~~~

## FORBIDDEN

[FORBIDDEN][SCA4-FBD-010] Treat scene card items as new SSOT/baseline facts.
[FORBIDDEN][SCA4-FBD-020] Fill in unspecified instruments/locations/actors not present in corpus STATE/ENTITIES/PROCEDURES.
[FORBIDDEN][SCA4-FBD-030] Emit any doc ids, file paths, YAML tokens, or protocol/spec/registry terms in diegetic prose.

## NON-NORMATIVE

(empty)
~~~
</file>

<file path="scene/SCENE-ACT-RU-2215-0005.md">
~~~markdown
---
id: SCENE-ACT-RU-2215-0005
title: >
  SCENE-CARDS — Act V (Chapters 30–35) —
  License Suspension → Resolution via Procedural Cost and Fact Fixation
class: scene
status: draft
version: 1.2.0
doc_language: en
prose_language: ru-RU
inputs:
  - BASELINE-PHYSICAL_LEVEL_MID-2215-0001
  - CANON-BASE-RULE-GLOBAL-2215-0001
  - CANON-CONFLICT-GLOBAL-2215-0001
  - CANON-SYSTEMS-GLOBAL-2215-0001
  - PLAN-STORY-2215-0001
depends_on:
  - SCENE-ACT-RU-2215-0004
scope: >
  Full set of SCENE-CARDS for Act V (chapters 30–35): climax and resolution
  via legal and logistic levers, resource cost, and final fact fixation;
  closing the case without "superheroism".
---

## LLM-INTENT

ROLE_TYPE: INDEX
SCOPE: machine-readable scene cards for Act V as TYPE C inputs (no prose).
SCENE_FORMAT: scene_cards_kvline_v1
INPUTS: [BASELINE-PHYSICAL_LEVEL_MID-2215-0001, CANON-BASE-RULE-GLOBAL-2215-0001, CANON-CONFLICT-GLOBAL-2215-0001, CANON-SYSTEMS-GLOBAL-2215-0001, PLAN-STORY-2215-0001]
OUTPUTS: [scene_card_records]
FORBIDDEN: [prose, world_explanations, new_metrics, unscoped_numbers, gap_filling, meta_diegesis]

## DEFINITIONS

[FACT][SCA5-DEF-010] `scene_card` = record fields: scene_id, chapter_id, time, where, pov, goal, measurable, artifact, cmc, output, hook, tags.
[FACT][SCA5-DEF-011] `cmc` = CAUSE → MECHANISM → CONSEQUENCE (single-line, procedural).
[FACT][SCA5-DEF-012] `measurable` = key=value list; numeric values MUST carry units when applicable.
[FACT][SCA5-DEF-013] `artifact` = CD|EL|CM|FM|RP|PRS|none plus subtype in parentheses.

## INVARIANTS

[DECISION][SCA5-INV-010] Each `scene_card` MUST remain non-prose: only operational intent and constraints.
[DECISION][SCA5-INV-011] Each `scene_card` MUST be self-scoped via `where` and MUST include `scene_id` and `chapter_id`.
[DECISION][SCA5-INV-012] If `measurable` includes environment sensors, they MUST be traceable to BASELINE-PHYSICAL_LEVEL_MID-2215-0001 ranges OR explicit override.
[FORBIDDEN][SCA5-INV-013] Introducing new macro world numbers inside scene cards (SSOT-only numbers remain in SSOT/CANON-METRICS).
[DECISION][SCA5-INV-020] Placeholder ellipsis ("..."/"…") is forbidden in cards; use UNKNOWN or omit the field.

## CONTENT

### CH-30 — The Authorization

[FACT][SCA5-001] scene_id=SC-30.1; chapter_id=CH-30; time="09:00 (Morning)"; where="Москва, кабинет регулятора (срочный контур)"; pov="Лейсан"; goal="запустить легальный рычаг принуждения"; measurable="suspension_window=12h; scope_subsystems=2"; artifact="CD(lic_sus_tsro_order_conditions)"; cmc="доказан manual override → аварийное решение регулятора → ФССУ получает окно полномочий"; output="законное время на действие"; hook="оператор активирует режим сохранения/чистки"; tags="office, bureaucracy, restless".
[FACT][SCA5-002] scene_id=SC-30.2; chapter_id=CH-30; time="10:30 (Morning)"; where="Временный штаб ФССУ (Москва)"; pov="Мирон"; goal="план операции в рамках ограничений"; measurable="teams=3; nodes=2; server_room=1; deadline=11h12m"; artifact="CD(plan_schedule_roles)"; cmc="окно короткое → параллельность обязательна → ошибка = провал"; output="запуск групп"; hook="без chain-of-custody улики снесут в суде"; tags="map, planning, flow".
[FACT][SCA5-003] scene_id=SC-30.3; chapter_id=CH-30; time="13:00 (Day)"; where="Выезд / логистический канал"; pov="Айдар"; goal="превратить решение в движение и риск времени"; measurable="ETA=2h20m; connectivity_delta=−25%"; artifact="CD(escort_protocol)"; cmc="центр дал приказ → поле исполняет → задержка = потеря улик"; output="ставка по времени задана"; hook="у оператора свои группы на узлах"; tags="transport, speed, kinetic".

### CH-31 — Seizure (Physical Layer)

[FACT][SCA5-004] scene_id=SC-31.1; chapter_id=CH-31; time="17:45 (Sunset)"; where="Узел накопителей (внешний кластер)"; pov="Айдар"; goal="физически закрепить приостановку"; measurable="time_to_lock=9m"; artifact="EL(suspension_enforcement_act)"; cmc="приказ → сопротивление/затяжка оператора → ФССУ изолирует контур"; output="узел под контролем"; hook="борьба за шкаф подписи"; tags="industrial, sunset, kinetic".
[FACT][SCA5-005] scene_id=SC-31.2; chapter_id=CH-31; time="18:00 (Dusk)"; where="Шкаф подписи / контроллер доверия"; pov="Мирон"; goal="добыть юридически значимый объект (фиксация)"; measurable="auto_lock_in=90s"; artifact="EL(signature_keys_trusted_module_inventory)"; cmc="без ключей оператор переподпишет/отыграет → изъятие → рычаг контроля"; output="юридическое закрепление силы ФССУ"; hook="попытка purge на соседнем сегменте"; tags="hardware, tension, kinetic".
[FACT][SCA5-006] scene_id=SC-31.3; chapter_id=CH-31; time="18:15 (Dusk)"; where="Серверный сегмент узла"; pov="Лев"; goal="отбить purge и сохранить «как было»"; measurable="purge_in=110s; dump_size=1.4TB"; artifact="EL(kpi_weights_configs_dump_pre)"; cmc="оператор чистит следы → физический дамп → веса «до» сохранены"; output="база для пересчёта получена"; hook="найден пакет KPI v.next"; tags="hacking, timer, flow".
[FACT][SCA5-007] scene_id=SC-31.4; chapter_id=CH-31; time="18:30 (Dusk)"; where="Внешний периметр"; pov="Айдар"; goal="короткий экшен с последствиями и протоколом"; measurable="duration=45–75s; injuries=1(nonfatal)"; artifact="CD(coercion_record)"; cmc="охрана давит → ФССУ удерживает → операция не срывается"; output="контроль сохранён"; hook="осталось ~4 часа"; tags="standoff, action, kinetic".

### CH-32 — The Price of Efficiency

[FACT][SCA5-008] scene_id=SC-32.1; chapter_id=CH-32; time="20:00 (Evening)"; where="Временный штаб (на объекте)"; pov="Лев"; goal="показать «зло в коэффициентах» как доказательство"; measurable="human_cost_weight=0.03→0.21"; artifact="CM(kpi_matrix_before_after_decisions)"; cmc="заниженный вес → приоритеты режут мед/энергию → люди платят"; output="механизм доказан"; hook="оператор утверждает «иначе сеть упадёт»"; tags="data, realization, void".
[FACT][SCA5-009] scene_id=SC-32.2; chapter_id=CH-32; time="21:00 (Evening)"; where="Мини-слушание регулятора по каналу"; pov="Лейсан"; goal="превратить математику в норму"; measurable="red_line_threshold=accepted_conditionally"; artifact="CD(decision_protocol_draft)"; cmc="доказан вред → меняют требования → оператор обязан внедрить"; output="коррекция становится обязательной"; hook="апелляция неизбежна"; tags="remote_call, law, restless".
[FACT][SCA5-010] scene_id=SC-32.3; chapter_id=CH-32; time="22:00 (Night)"; where="Разговор лидера с корп-связным"; pov="Мирон"; goal="человеческий слой «антагонист = функция»"; measurable="none"; artifact="none"; cmc="корп-логика защиты эффективности (Оскар) → конфликт ценностей → отсутствие монстров"; output="ясна природа системы"; hook="нужно публичное давление"; tags="dialogue, smoke, velvet".

### CH-33 — Visibility

[FACT][SCA5-011] scene_id=SC-33.1; chapter_id=CH-33; time="09:00 (Next Day)"; where="Москва, коммуникационный контур ФССУ"; pov="Мирон"; goal="выпуск сводки как инструмент давления"; measurable="public_pages=1; closed_pages=47"; artifact="PRS(summary_plus_annex)"; cmc="прямого наказания нет → давление через риск → оператору становится дорого"; output="включён политико-экономический рычаг"; hook="страховые/регионы требуют действий"; tags="media, publish, flow".
[FACT][SCA5-012] scene_id=SC-33.2; chapter_id=CH-33; time="10:00 (Next Day)"; where="Реакция системы (монтаж)"; pov="Лев"; goal="показать последствия публикации"; measurable="insurance_risk_coef_delta=+8%; new_audits=+3"; artifact="CD(event_feed_rollup)"; cmc="цифры стали видимыми → риск монетизировался → система реагирует"; output="ФССУ больше не тишина"; hook="регулятор готовит урезание лицензии"; tags="chaos, news, kinetic".

### CH-34 — The Settlement

[FACT][SCA5-013] scene_id=SC-34.1; chapter_id=CH-34; time="14:00 (Day)"; where="Москва, заседание по лицензии"; pov="Лейсан"; goal="формальная развязка без переворота мира"; measurable="license_scope_reduced=true; audit_cadence=quarterly"; artifact="CD(regulator_decision_requirements)"; cmc="доказан системный риск → урезание режима → оператор теряет часть полномочий"; output="частичная победа"; hook="оператор подаёт апелляцию"; tags="court, sterile, restless".
[FACT][SCA5-014] scene_id=SC-34.2; chapter_id=CH-34; time="15:30 (Day)"; where="Коридор после заседания"; pov="Мирон"; goal="победа без триумфа"; measurable="none"; artifact="CD(monitoring_continues_notice)"; cmc="система скорректировалась → цена уже заплачена → жизнь идёт дальше"; output="тон удержан"; hook="возвращение домой"; tags="fatigue, relief, flow".

### CH-35 — Home (Chelny)

[FACT][SCA5-015] scene_id=SC-35.1; chapter_id=CH-35; time="19:00 (Sunset)"; where="Набережные Челны, утренний маршрут Avtozavodsky → Centralny"; pov="Мирон"; goal="это мой город, но выросший"; measurable="traffic_flow=0.66; district=Centralny; green_index=0.72; river=Kama; port_activity=0.61; river_level=UNKNOWN"; artifact="CD(city_environment_panel_kama_status_line)"; cmc="новая политика KPI → перераспределение → людям чуть легче"; output="эффект виден локально"; hook="жизнь продолжается"; tags="city, home, restless".
[FACT][SCA5-016] scene_id=SC-35.2; chapter_id=CH-35; time="20:00 (Evening)"; where="Больница"; pov="Мирон"; goal="тихая верификация результата"; measurable="power_reserve_delta=+12%; cancelled_procedures=down"; artifact="EL(updated_power_regime_protocol)"; cmc="веса изменены → приоритет медконтуров поднят → конкретный эффект"; output="победа материальна"; hook="остаточный риск ≠ 0"; tags="hospital, quiet, velvet".
[FACT][SCA5-017] scene_id=SC-35.3; chapter_id=CH-35; time="21:00 (Evening)"; where="Площадь / медиафасад (data-art)"; pov="Мирон"; goal="культура как фон системы"; measurable="city_feed=real_time"; artifact="CD(data_art_feed)"; cmc="логи стали культурой → люди живут рядом с цифрами → нормализация"; output="мир живой"; hook="none"; tags="art, neon, flow".
[FACT][SCA5-018] scene_id=SC-35.4; chapter_id=CH-35; time="21:30 (Evening)"; where="Капсула"; pov="Мирон"; goal="музыка как выбор формата"; measurable="mode=adaptive_mix→fixed_track; route_tag=riverbank"; artifact="CD(player_switch_micro_log)"; cmc="фон-алгоритм → человеческий выбор → песня жива"; output="финальная точка"; hook="уведомление о новой аномалии в другом узле; триггер=день матча / событие у стадиона КАМАЗ → всплеск трафика в HUD"; tags="music, intimacy, velvet".

## USAGE / RESOLUTION

[DECISION][SCA5-USE-010] This document is TYPE C (scene inputs). Statements herein are CARD records, not world facts.
[DECISION][SCA5-USE-020] The prose engine may only consume data declared in OUTPUT CONTRACT.
[DECISION][SCA5-USE-030] Any missing/UNKNOWN values must remain UNKNOWN (no invention).

## OUTPUT CONTRACT

~~~yaml
EXPORTS:
  - scene_card_records:
      source_section: "## CONTENT"
      container: "kvline_semicolon"
      record_start_pattern: '^\\[FACT\\]\\[SCA5-[0-9]{3}\\]\s+scene_id=SC-[0-9]{2}\.[0-9]+;'
      required_fields: ["scene_id","chapter_id","time","where","pov","goal","measurable","artifact","cmc","output","hook","tags"]
      field_patterns:
        scene_id: 'scene_id=SC-[0-9]{2}\.[0-9]+'
        chapter_id: 'chapter_id=CH-[0-9]{2}'
        time: 'time="[^"]+"'
        where: 'where="[^"]+"'
        pov: 'pov="[^"]+"'
        goal: 'goal="[^"]+"'
        measurable: 'measurable="[^"]*"'
        artifact: 'artifact="[^"]+"'
        cmc: 'cmc="[^"]+"'
        output: 'output="[^"]+"'
        hook: 'hook="[^"]+"'
        tags: 'tags="[^"]+"'
READER:
  - ignore all sections outside exported blocks
~~~

## FORBIDDEN

[FORBIDDEN][SCA5-FBD-010] Treat scene card items as new SSOT/baseline facts.
[FORBIDDEN][SCA5-FBD-020] Fill in unspecified instruments/locations/actors not present in corpus STATE/ENTITIES/PROCEDURES.
[FORBIDDEN][SCA5-FBD-030] Emit any doc ids, file paths, YAML tokens, or protocol/spec/registry terms in diegetic prose.

## NON-NORMATIVE

(empty)
~~~
</file>

<file path="spec/SPEC-DOC-ID-2215-0001.md">
~~~markdown
---
id: SPEC-DOC-ID-2215-0001
title: >
  Document ID Contract — Corpus Doc-ID Grammar, Namespaces, and Lint Gates (2215)
class: spec
status: draft
prefix: DOCID
doc_language: ru-RU
prose_language: ru-RU
inputs: []
depends_on:
  - SPEC-DOC-STYLE-2215-0001
scope: >
  Норматив грамматики `id` (doc_id) для всех документов корпуса 2215.
  Поддерживается single-author режим: разрешён rename+replace без migration_redirect
  при условии closed-world корпуса (IDX является полным реестром).
  Механизм OVERRIDE отсутствует: семейство OVERRIDE не допускается.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: define corpus-wide doc_id grammar, namespace-to-class mapping, scope schemas, lint gates, and deterministic rename rules (override family removed)
INPUTS: []
OUTPUTS: [doc_id_grammar, allowed_families, family_scope_schemas, class_family_mapping, lint_gates]
FORBIDDEN: [implicit_id_schemes, freeform_id_segments, mixed_scope_orders, non_decidable_exceptions, override_family]

## DEFINITIONS

[FACT][DOCID-010] `doc_id` = значение YAML-ключа `id` документа корпуса, являющееся глобальным идентификатором.
[FACT][DOCID-011] `family` = первый сегмент `doc_id` (split by `-`).
[FACT][DOCID-012] `topic` = второй сегмент `doc_id` (split by `-`), используемый как стабильный идентификатор предметной области; не обязан быть человекочитаемым.
[FACT][DOCID-013] `scope` = сегменты между `topic` и `seq`.
[FACT][DOCID-014] `seq` = последний сегмент (`0001..9999`).
[FACT][DOCID-015] `series_key` = `<family>-<topic>-<scope>`.

[FACT][DOCID-016] `class_family_match` = YAML `class` согласован с `family`.
[FACT][DOCID-017] `legacy_doc_id` = исторический id, нарушающий текущую схему.
[FACT][DOCID-018] `migration_redirect` = механизм соответствия old→new (опциональный механизм совместимости, не обязателен для closed-world).
[FACT][DOCID-019] `rename_replace` = операция, при которой документ переименован, файл переименован, все inbound/outbound ссылки заменены, а старый `doc_id` полностью отсутствует в IDX и корпусе.
[FACT][DOCID-020] `corpus_closed_world` = допущение, что весь корпус полностью перечислен в IDX-CORPUS; ссылки вне него не учитываются lint gates.

[FACT][DOCID-022] `corpus_year` = целевой год корпуса, используемый для валидации сегмента `<year>` в doc_id (по умолчанию: 2215).
[FACT][DOCID-023] `year_segment` = сегмент `<year>` в doc_id для семейств, чьи scope схемы содержат `<year>`.

[FACT][DOCID-025] `topic_label` = строка, допускающая пробелы и дефисы; предназначена для UI/навигации/читаемости и не влияет на `doc_id`.

## INVARIANTS

[DECISION][DOCID-030] Every corpus document MUST have decidably valid `doc_id`; ELSE FAIL.
[DECISION][DOCID-031] Deterministic grammar MUST override naming preference; ELSE FAIL.
[DECISION][DOCID-032] Deviations MUST be either legacy OR resolved via rename_replace; ELSE FAIL.
[RULE][DOCID-033] PASS IFF this spec is COMPLIANT with SPEC-DOC-STYLE-2215-0001; ELSE FAIL.

## CONTENT

### 1. Charset

[RULE][DOCID-040] PASS IFF `doc_id` matches `^[A-Z0-9_-]+$`; ELSE FAIL.
[RULE][DOCID-041] PASS IFF `doc_id` does NOT contain consecutive underscores (`__`); ELSE FAIL.

### 2. Sequence

[RULE][DOCID-050] PASS IFF `doc_id` matches `-[0-9]{4}$`; ELSE FAIL.
[RULE][DOCID-051] PASS IFF `seq_int` derived from `seq` satisfies `seq_int ∈ [1, 9999]`; ELSE FAIL.
[RULE][DOCID-052] PASS IFF `doc_id` is unique inside `series_key` within IDX-CORPUS; ELSE FAIL.

### 3. Family ↔ class

[RULE][DOCID-060] PASS IFF `family` is in `allowed_families`; ELSE FAIL.
[RULE][DOCID-061] IF `legacy_doc_id = false` THEN PASS IFF `class_family_match = true`; ELSE FAIL.

### 4. Scope schemas

[RULE][DOCID-070] PASS IFF `doc_id` matches form `<family>-<topic>-<scope>-<seq>`; ELSE FAIL.
[RULE][DOCID-071] PASS IFF `topic` is a single segment token and matches `^[A-Z0-9]+(?:_[A-Z0-9]+)*$`; ELSE FAIL.
[RULE][DOCID-072] PASS IFF `scope` conforms to `family_scope_schemas[family]`; ELSE FAIL.
[RULE][DOCID-073] IF `family_scope_schemas[family]` contains `<year>` THEN PASS IFF `year_segment == 2215`; ELSE FAIL.
[RULE][DOCID-075] IF `topic_label` is present THEN PASS IFF `topic_label` is a non-empty string AND contains at least one letter; ELSE FAIL.
[RULE][DOCID-076] PASS IFF any multiword `topic` uses `_` separators; ELSE FAIL.
[FORBIDDEN][DOCID-077] New documents MUST NOT introduce CamelCase inside `topic` (e.g., `CHAPTERDELIVERY`); use `_` (e.g., `CHAPTER_DELIVERY`).

~~~yaml
allowed_families:
  - SSOT
  - BASELINE
  - CANON
  - SPEC
  - PROTOCOL
  - IDX
  - REG
  - PLAN
  - SCENE

class_family_mapping:
  ssot: SSOT
  baseline: BASELINE
  canon: CANON
  spec: SPEC
  protocol: PROTOCOL
  idx: IDX
  registry: REG
  plan: PLAN
  scene: SCENE

family_scope_schemas:
  SSOT: "<family>-<topic>-<scenario>-<year>-<seq>"
  BASELINE: "<family>-<topic>-<year>-<seq>"
  CANON: "<family>-<topic>-<scope_variant>-<year>-<seq>"
  SPEC: "<family>-<topic>-<year>-<seq>"
  PROTOCOL: "<family>-<topic>-<year>-<seq>"
  IDX: "<family>-<topic>-<seq>"
  REG: "<family>-<topic>-<year>-<seq>"
  PLAN: "<family>-<topic>-<year>-<seq>"
  SCENE: "<family>-<topic>-<scope_variant>-<year>-<seq>"
~~~

### 5. Canonical forms

[RULE][DOCID-080] PASS IFF SSOT form is `SSOT-<TOPIC>-<SCENARIO>-2215-<SEQ>`; ELSE FAIL.
[RULE][DOCID-081] PASS IFF SPEC form is `SPEC-<TOPIC>-2215-<SEQ>`; ELSE FAIL.
[RULE][DOCID-082] PASS IFF CANON form is `CANON-<TOPIC>-<SCOPE>-2215-<SEQ>`; ELSE FAIL.
[RULE][DOCID-083] PASS IFF PROTOCOL form is `PROTOCOL-<TOPIC>-2215-<SEQ>`; ELSE FAIL.
[RULE][DOCID-084] PASS IFF IDX form is `IDX-<TOPIC>-<SEQ>`; ELSE FAIL.

## USAGE / RESOLUTION

[DECISION][DOCID-100] Spec is normative for all corpus docs.
[DECISION][DOCID-101] `doc_id` is primary key.
[RULE][DOCID-102] PASS IFF filename equals `<doc_id>.md`; ELSE FAIL.

## OUTPUT CONTRACT

~~~yaml
doc_id: SPEC-DOC-ID-2215-0001
role_type: RULE
export:
  - gate_id: DOCID-LINT-001
    intent: charset valid
    predicate: "doc_id matches ^[A-Z0-9_-]+$"
  - gate_id: DOCID-LINT-002
    intent: seq valid
    predicate: "doc_id ends with -[0-9]{4} and seq_int ∈ [1,9999]"
  - gate_id: DOCID-LINT-003
    intent: family allowed
    predicate: "family ∈ allowed_families"
  - gate_id: DOCID-LINT-004
    intent: topic single segment
    predicate: "topic matches ^[A-Z0-9]+(?:_[A-Z0-9]+)*$"
  - gate_id: DOCID-LINT-005
    intent: scope schema valid
    predicate: "scope conforms to family_scope_schemas[family]"
  - gate_id: DOCID-LINT-010
    intent: year segment matches corpus_year
    predicate: "family_scope_schemas[family] contains <year> => year_segment == 2215"
  - gate_id: DOCID-LINT-006
    intent: class_family_match
    predicate: "legacy_doc_id=false => class_family_mapping[class]=family"
  - gate_id: DOCID-LINT-007
    intent: uniqueness
    predicate: "doc_id unique within series_key in IDX-CORPUS"
  - gate_id: DOCID-LINT-009
    intent: filename equals doc_id
    predicate: "filename == doc_id + .md"
config:
  allowed_families_ref: "CONTENT.allowed_families"
  class_family_mapping_ref: "CONTENT.class_family_mapping"
  family_scope_schemas_ref: "CONTENT.family_scope_schemas"
~~~

## FORBIDDEN

[FORBIDDEN][DOCID-900] New family without updating schema.
[FORBIDDEN][DOCID-901] Hyphens in topic.
[FORBIDDEN][DOCID-902] Mixed scope schemas.
[FORBIDDEN][DOCID-903] Creating new legacy forms.
[FORBIDDEN][DOCID-904] Introducing family `OVERRIDE` or any equivalent mechanism.

## NON-NORMATIVE

~~~markdown
rename_replace workflow:
1. rename file
2. change id
3. replace all references
4. ensure old id absent in IDX
~~~

~~~
</file>

<file path="spec/SPEC-DOC-STYLE-2215-0001.md">
~~~markdown
---
id: SPEC-DOC-STYLE-2215-0001
title: >
  SSOT Document Style Guide — LLM-Executable Corpus Standard (2215)
class: spec
status: fixed
prefix: STYLE
doc_language: ru-RU
prose_language: ru-RU
scope: >
  Норматив форматирования SSOT/BASELINE/CANON/IDX документов проекта 2215.
  Цель: максимальная однозначность и исполняемость LLM (минимум интерпретации).
  Этот документ определяет обязательные секции, типы блоков, допустимый язык,
  контракт вывода и правила декомпозиции фактов/правил/привязок.
depends_on:
  - SPEC-PRIORITY-RESOLUTION-2215-0001
inputs: []
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: define machine-readable corpus doc structure, language policy, record-stream formats, and compliance gates (compiler-grade)
INPUTS: [SPEC-PRIORITY-RESOLUTION-2215-0001]
OUTPUTS: [doc_style_rules, lint_gates, section_schema, rewrite_protocol, language_policy, record_stream_rules]
FORBIDDEN: [implicit_sections, missing_ids, ambiguous_markers, undocumented_exceptions, body_yaml_delimiters]

## DEFINITIONS

[FACT][STYLE-010] `document` = единица корпуса: YAML front-matter (опционально) + тело Markdown, ограниченное одним набором YAML delimiters в начале документа.
[FACT][STYLE-011] `front_matter` = YAML-блок между двумя строками YAML delimiter в начале документа.
[FACT][STYLE-012] `yaml_delimiter_line` = строка, равная `---` (используется только для front_matter delimiters).
[FACT][STYLE-013] `skeleton` = фиксированный набор top-level секций (H2), используемый всеми документами корпуса.
[FACT][STYLE-014] `statement` = атомарная строка с префиксом `[TAG][ID]` и единственной смысловой единицей.
[FACT][STYLE-015] `statement_id` = стабильный идентификатор вида `<DOCPREFIX>-NNN<SFX>`, где `NNN` — трёхзначный номер, а `<SFX>` — опциональный суффикс `A..Z` для разветвления/уточнения без перенумерации.
[FACT][STYLE-016] `docprefix` = префикс для `statement_id`, задаваемый явно в YAML как `prefix:` ИЛИ выводимый как единственный общий префикс всех `statement_id` в документе.
[FACT][STYLE-017] `ROLE_TYPE` = семантическая роль документа: STATE | RULE | BIND | INTERFACE | INDEX.
[FACT][STYLE-018] `doc_class` = класс документа по YAML `class:` (ssot|baseline|canon|spec|protocol|idx|registry|plan|scene и др. по проекту).
[FACT][STYLE-019] `NON-NORMATIVE` = раздел комментариев/примеров, не являющийся источником правил или фактов.

[FACT][STYLE-020A] `structural_heading_line` = строка Markdown-заголовка уровня H3 (`### ...`), используемая только для визуальной/навигационной группировки.
[FACT][STYLE-020B] `statement_continuation_line` = строка продолжения statement, начинающаяся с двух пробелов; относится к предыдущей statement-строке.
[FACT][STYLE-020C] `markdown_table_line` = строка Markdown-таблицы (`| ... |`) или строки выравнивания (`| --- |`), используемая только в случаях, разрешённых правилами ROLE_TYPE.
[FACT][STYLE-020D] `statement_line` = непустая строка, удовлетворяющая `STYLE-059A`.
[FACT][STYLE-020E] `fenced_machine_block` = fenced block, ограниченный строками `~~~` (опциональный язык после opening fence), закрывающийся строкой `~~~`.
[FACT][STYLE-020F] `allowed_normative_line_type` = {statement_line, statement_continuation_line, fenced_machine_block, structural_heading_line, markdown_table_line}.

[FACT][STYLE-210] `doc_id_reference_token` = токен в тексте, который должен считаться ссылкой на документ корпуса, PASS IFF он matches regex `\b[A-Z0-9]+(?:-[A-Z0-9]+)+-[0-9]{4}\b`.
[FACT][STYLE-211] `explicit_dependency_set` = `hard_dependency_set` из YAML front_matter текущего документа.
[FACT][STYLE-212] `corpus_registry` = closed-world реестр doc_id корпуса (IDX-CORPUS как источник истины для членства).
[FACT][STYLE-213] `superseded_by` = YAML-ключ, указывающий doc_id, который заменяет deprecated документ.
[FACT][STYLE-214] `inputs` = список doc_id, чьи `OUTPUT CONTRACT.export` непосредственно потребляются текущим документом как входные данные (data-flow dependency).  
[FACT][STYLE-215] `depends_on` = список doc_id, на которые документ опирается нормативно/семантически, но не потребляет их `OUTPUT CONTRACT.export` напрямую (semantic dependency).  
[FACT][STYLE-216] `hard_dependency_set` = `inputs ∪ depends_on`.  
[FACT][STYLE-217] `inputs_contract_surface` = объединение `OUTPUT CONTRACT.export` документов из `inputs` (и только из `inputs`).
[FACT][STYLE-218] `doc_id_segment_token` = сегмент doc_id между дефисами; PASS IFF matches `^[A-Z0-9]+(?:_[A-Z0-9]+)*$`.

[FACT][STYLE-260] `doc_language` = IETF language tag, заданный в YAML как `doc_language: <tag>`, определяющий основной язык недиегетического текста документа.
[FACT][STYLE-270] `prose_language` = IETF language tag, заданный в YAML как `prose_language: <tag>`, определяющий обязательный язык диетического вывода (прозы), который документ ограничивает.
[FACT][STYLE-280] `proper_name` = токен имени собственного (персонаж/топоним/организация/бренд), используемый в TYPE C или в прозе.
[FACT][STYLE-290] `canon_ru` = каноническая русская форма `proper_name`, используемая для binding и вывода в прозе.
[FACT][STYLE-300] `display_ru` = русская форма отображения `proper_name` в прозе; если отсутствует, используется `canon_ru`.
[FACT][STYLE-310] `canon_en` = опциональная каноническая английская форма `proper_name` для англоязычных документов; MUST NOT быть выведена автоматически из `canon_ru`.
[FACT][STYLE-320] `record_stream` = упорядоченная последовательность машиночитаемых записей (records), используемая как TYPE C input (сцены/таймлайн/массив событий и т.п.).
[FACT][STYLE-330] `record_format_id` = идентификатор формата кодирования/парсинга `record_stream`, задаваемый в YAML как `record_format_id: <id>`.
[FACT][STYLE-340] `dataset_id` = идентификатор набора, группирующий несколько документов в один логический `record_stream` (серия актов/частей), задаваемый в YAML как `dataset_id: <id>`.

## INVARIANTS

[DECISION][STYLE-030] Этот документ сам должен быть COMPLIANT по собственному стандарту (вариант A: self-application).
[DECISION][STYLE-030A] Любой документ класса `spec`, имеющий ROLE_TYPE=RULE, MUST быть COMPLIANT по SPEC-DOC-STYLE-2215-0001; ELSE FAIL (self-consistency gate).
[DECISION][STYLE-030B] Любой документ с ROLE_TYPE=RULE MUST быть COMPLIANT по SPEC-DOC-STYLE-2215-0001; ELSE FAIL (rule-doc self-consistency).
[DECISION][STYLE-031] В корпусе допускается ровно один `skeleton` для всех документов; исключения возможны только через явный `[DECISION]` в документе-стандарте и должны быть машиночитаемыми.
[DECISION][STYLE-032] Любая неоднозначность, позволяющая LLM выбрать “как удобнее”, трактуется как determinism hazard и должна устраняться правилом или lint gate.
[DECISION][STYLE-033A] Любое правило в этом стандарте MUST быть формулируемо как проверяемый предикат; если предикат не определён, правило считается INVALID.
[DECISION][STYLE-033B] Если правило допускает ≥2 интерпретации, документ-носитель правила MUST be treated as NON-COMPLIANT (ambiguity hazard).

## CONTENT

### 0. Prime Directive (NORMATIVE)

[DECISION][STYLE-000] Corpus MUST be LLM-executable: deterministic parsing > human readability; explicit contracts > narrative explanations; atomic statements > prose.
[FORBIDDEN][STYLE-001] “Essay mode”: long paragraphs; rhetorical connectors; implicit assumptions; “world flavor” to justify numbers.
[DECISION][STYLE-002] Explanatory prose is FORBIDDEN in normative sections; only atomic statements and machine-readable blocks are allowed.

### 1. Role-Type precedence (semantic) vs class precedence (applicability)

[DECISION][STYLE-101] Role-type precedence (semantic) is: STATE → RULE → BIND → INTERFACE → INDEX.
[DECISION][STYLE-102] ROLE_TYPE is restricted to: STATE | RULE | BIND | INTERFACE | INDEX.
[FORBIDDEN][STYLE-103] Introducing new ROLE_TYPE identifiers.
[DECISION][STYLE-104] Role-type precedence defines semantic authority (RULE constrains STATE; BIND selects STATE; INTERFACE defines ownership/consumes; INDEX navigates) and MUST NOT be used as document applicability order.
[DECISION][STYLE-105] Document-class resolution order (applicability) MUST be taken ONLY from `SPEC-PRIORITY-RESOLUTION-2215-0001`.
[FORBIDDEN][STYLE-106] Mixing role-type precedence with document-class resolution.
[FORBIDDEN][STYLE-107] Introducing alternative document-class precedence inside this STYLE guide or any other doc.

### 2. Mandatory Document Skeleton (top-level sections)

[DECISION][STYLE-020] All documents MUST include the following H2 sections in this exact order (sections may be empty but MUST exist):
[DECISION][STYLE-021] 1. `## LLM-INTENT`
[DECISION][STYLE-022] 2. `## DEFINITIONS`
[DECISION][STYLE-023] 3. `## INVARIANTS`
[DECISION][STYLE-024] 4. `## CONTENT`
[DECISION][STYLE-025] 5. `## USAGE / RESOLUTION`
[DECISION][STYLE-026] 6. `## OUTPUT CONTRACT`
[DECISION][STYLE-027] 7. `## FORBIDDEN`
[DECISION][STYLE-028] 8. `## NON-NORMATIVE` (optional; if absent, examples are forbidden).
[DECISION][STYLE-029] Headers MUST match exactly (case-sensitive; exact bytes).
[FORBIDDEN][STYLE-033] Any additional top-level (H2) sections outside the skeleton.
[FORBIDDEN][STYLE-034] Any `yaml_delimiter_line` inside the document body (segmentation hazard).
[DECISION][STYLE-095] Structural H3 headings are permitted ONLY as `### <title>` lines inside `## CONTENT` and `## NON-NORMATIVE`; ELSE FAIL.
[DECISION][STYLE-096] H3 structural heading line MUST match regex: `^###\s.+$`; ELSE FAIL.
[FORBIDDEN][STYLE-097] Heading levels H4+ (`####` and deeper) are forbidden in all sections; ELSE FAIL.
[FORBIDDEN][STYLE-099] H3 headings with numeric prefix `N)` are forbidden (editor noise / noncanonical numbering).
[DECISION][STYLE-099A] PASS IFF any H3 heading that begins with digits matches `^###\s[0-9]+\.\s.+$`; ELSE FAIL.

### 2.1 YAML front-matter (normalization; deterministic parsing)

[DECISION][STYLE-130] Any corpus document that is consumed as an input (i.e., referenced by `inputs`/`depends_on` or listed in IDX registry) MUST include `front_matter`.
[DECISION][STYLE-131] `front_matter` MUST include keys: `id`, `title`, `class`, `status`, `scope`, `inputs`, `depends_on`.
[DECISION][STYLE-132] `inputs` and `depends_on` MUST be present; when empty they MUST be `[]`; when non-empty they MUST be YAML block lists (`- <id>`) sorted lexicographically ascending.
[DECISION][STYLE-133] `id` MUST be ASCII uppercase with digits, hyphens, and underscores only (`[A-Z0-9_-]+`) and MUST be unique within the corpus membership registry.
[DECISION][STYLE-135] `status` MUST be one of: `draft` | `fixed` | `deprecated`.
[DECISION][STYLE-135A] IF `status=deprecated` THEN front_matter MUST include `superseded_by: <doc_id>`; ELSE FAIL.
[FORBIDDEN][STYLE-135B] New or modified documents MUST NOT declare `inputs`/`depends_on` referencing deprecated docs; ELSE FAIL.
[DECISION][STYLE-136] Non-core YAML keys are allowed ONLY if they are either standardized in this spec (e.g., `prefix`, `doc_language`, `prose_language`, `dataset_id`, `record_format_id`, `superseded_by`, `changelog`, `topic_label`) OR prefixed with `x_`.
[FORBIDDEN][STYLE-137] YAML anchors, aliases, and merge keys (parsing ambiguity).
[FORBIDDEN][STYLE-138] Tabs in YAML or body text (parser ambiguity); indentation MUST be spaces only.
[RULE][STYLE-139A] PASS IFF `inputs ∩ depends_on = ∅`; ELSE FAIL.  
[RULE][STYLE-139B] PASS IFF any doc_id in `inputs` is required to interpret the document’s `OUTPUT CONTRACT.export`; ELSE FAIL (anti-bloat rule).  
[RULE][STYLE-139C] PASS IFF any doc_id in `depends_on` is NOT required to interpret the document’s `OUTPUT CONTRACT.export`; ELSE FAIL (boundary rule).

### 2.2 File-level invariants (byte stability; parser safety)

[RULE][STYLE-190] PASS IFF file encoding is UTF-8 and contains no BOM; ELSE FAIL.
[RULE][STYLE-191] PASS IFF file uses LF line endings only (`\n`), no CRLF; ELSE FAIL.
[RULE][STYLE-192] PASS IFF no line has trailing whitespace; ELSE FAIL.
[RULE][STYLE-193] PASS IFF file ends with exactly one newline; ELSE FAIL.

### 2.3 Reference integrity (closed-world; explicit dependencies)

[RULE][STYLE-200A] PASS IFF every doc_id in `inputs` and `depends_on` exists in `corpus_registry`; ELSE FAIL.
[RULE][STYLE-200B] PASS IFF corpus dependency graph over `inputs ∪ depends_on` is acyclic (DAG); ELSE FAIL.
[RULE][STYLE-200C] PASS IFF any `doc_id_reference_token` present in normative sections is either (a) in `explicit_dependency_set` OR (b) equals current document `id`; ELSE FAIL.

### 3. LLM-INTENT block (required; machine header)

[DECISION][STYLE-035] `## LLM-INTENT` MUST contain exactly these keys (order free, ≤ 20 lines total):
[DECISION][STYLE-036] `ROLE_TYPE: STATE|RULE|BIND|INTERFACE|INDEX`
[DECISION][STYLE-037] `SCOPE: <one-sentence>`
[DECISION][STYLE-038] `INPUTS: <list>` (use `[]` when none)
[DECISION][STYLE-039] `OUTPUTS: <list>` (use `[]` when none)
[DECISION][STYLE-040] `FORBIDDEN: <list>` (use `[]` when none)
[FORBIDDEN][STYLE-041] Hidden dependencies not listed in INPUTS when they affect interpretation or exports.

### 4. Statement Grammar (atomic, tagged, id-stable)

[DECISION][STYLE-042] All normative or factual content MUST be expressed as atomic `statement`s.
[DECISION][STYLE-043] Each `statement` MUST use one tag prefix: [FACT] | [ASSUMPTION] | [PROJECTION] | [DECISION] | [FORBIDDEN] | [UNKNOWN] | [STATE] | [RULE] | [BIND].
[DECISION][STYLE-044] Tag-to-role constraints:
[DECISION][STYLE-045] ROLE_TYPE: STATE → allowed tags: [STATE], [DECISION], [FORBIDDEN] (definitions may use [FACT] only in `## DEFINITIONS`).
[DECISION][STYLE-046] ROLE_TYPE: RULE → allowed tags: [RULE], [DECISION], [FORBIDDEN] (definitions may use [FACT] only in `## DEFINITIONS`).
[DECISION][STYLE-047] ROLE_TYPE: BIND → allowed tags: [BIND], [DECISION], [FORBIDDEN] (definitions may use [FACT] only in `## DEFINITIONS`).
[DECISION][STYLE-048] ROLE_TYPE: INTERFACE → allowed tags: [DECISION], [FORBIDDEN] (definitions may use [FACT] only in `## DEFINITIONS`).
[DECISION][STYLE-049] ROLE_TYPE: INDEX → allowed tags: [DECISION], [FORBIDDEN] (tables in CONTENT are allowed).
[DECISION][STYLE-050] Every `statement` MUST have a stable ID: `[TAG][<DOCPREFIX>-NNN<SFX>]`.
[DECISION][STYLE-051] `DOCPREFIX` MUST be declared in YAML as `prefix:` OR MUST be inferable as the unique common prefix of all `statement_id` in the document; otherwise lint MUST fail.
[RULE][STYLE-051A] PASS IFF YAML `prefix` is globally unique within `corpus_registry`; ELSE FAIL.
[DECISION][STYLE-052] New `statement_id`s MUST allocate `NNN` as 3 digits and MUST increment by 10 for edit headroom (010, 020, ...); optional suffix `A..Z` is allowed only to split/branch an existing `NNN` without renumbering.
[DECISION][STYLE-053] IDs MUST be stable across edits; rewriting MUST preserve existing IDs verbatim.
[FORBIDDEN][STYLE-054] “Floating bullets” without `[TAG][ID]` in any normative section.
[DECISION][STYLE-055] Statement physical length MUST be ≤ 3 lines.
[DECISION][STYLE-055A] Any statement continuation lines MUST match `statement_continuation_line` and MUST appear only immediately after a statement line; total lines (statement + continuations) MUST be ≤ 3; ELSE FAIL.
[FORBIDDEN][STYLE-056] Multi-paragraph statements.
[DECISION][STYLE-056A] Enumerated list markers inside statement text MUST use dot form only: `N.`; ELSE FAIL.
[FORBIDDEN][STYLE-056B] Parenthesis enumeration marker `N)` is forbidden anywhere in statement text (normalization rule).
[DECISION][STYLE-056C] PASS IFF statement text does NOT contain regex `\b[0-9]+\)`; ELSE FAIL.
[DECISION][STYLE-057] Markdown emphasis (`**`, `_`) MUST NOT carry meaning; structure MUST be expressed by tags/ids/keys.
[FORBIDDEN][STYLE-058] Using bold/italic as structure or as a proxy for tags.
[DECISION][STYLE-059] Any new term used as a normative token MUST be defined in the same document under `## DEFINITIONS`; corpus-wide terms MUST be promoted only via the canonical vocabulary doc (e.g., `CANON-VOCAB-GLOBAL-2215-0001`).
[DECISION][STYLE-059A] Normative statement lines MUST match regex: `^\[(FACT|ASSUMPTION|PROJECTION|DECISION|FORBIDDEN|UNKNOWN|STATE|RULE|BIND)\]\[[A-Z0-9]+-[0-9]{3}[A-Z]?\]\s.+$`.
[DECISION][STYLE-059B] In any normative section, any non-empty line MUST be of allowed_normative_line_type; ELSE FAIL.
[DECISION][STYLE-059C] `structural_heading_line` MUST match `^###\s.+$`; ELSE FAIL.
[DECISION][STYLE-059D] `statement_continuation_line` MUST match `^ {2}\S.*$`; ELSE FAIL.
[DECISION][STYLE-059E] `markdown_table_line` MUST match `^\|.*\|$` OR `^\|[ \-:|]+\|$`; ELSE FAIL.
[FORBIDDEN][STYLE-059F] Markdown tables in normative sections are FORBIDDEN unless ROLE_TYPE is INDEX OR (ROLE_TYPE is STATE AND table usage satisfies STYLE-068); ELSE FAIL.

### 5. Language and operators (no soft speech)

[FORBIDDEN][STYLE-060] Softeners: “обычно”, “как правило”, “в целом”, “скорее”, “может быть”, “возможно” (если не зафиксировано условием).
[DECISION][STYLE-061] Allowed operators: IF / THEN / ELSE; MUST / MUST NOT; ONLY IF; EXCEPT WHEN; REQUIRES; IMPLIES.
[DECISION][STYLE-062] Quantifiers MUST be explicit: range `x ∈ [a, b]`; approx `x ≈ y` (only if unavoidable; prefer range).
[DECISION][STYLE-063] Numeric values MUST include units when applicable.
[DECISION][STYLE-063A] Allowed modals are restricted to: MUST, MUST NOT, FORBIDDEN, REQUIRED, FAIL, PASS (case-sensitive).
[FORBIDDEN][STYLE-063B] Any modal verbs outside allowed modals in normative sections MUST cause lint FAIL.

### 5.1 Language Policy (corpus vs prose)

[DECISION][STYLE-064] Corpus-wide `prose_language` MUST be `ru-RU` and MUST match the language of any generated diegetic prose.
[DECISION][STYLE-065] Every corpus document MUST declare `doc_language` in YAML; allowed values are: `ru-RU` | `en-US`.
[DECISION][STYLE-066] Any document that can be directly consumed by a prose generator (class: `protocol` OR class: `scene` OR any doc that constrains prose output) MUST declare `prose_language: ru-RU` in YAML; mismatch is a hard lint error.

### 5.2 Proper Names and Scripts (no auto-transliteration)

[DECISION][STYLE-084] Every `proper_name` referenced as a token in TYPE C inputs or prose MUST have a canonical Russian form `canon_ru` declared explicitly in the corpus (no implicit derivation).
[DECISION][STYLE-085] In diegetic prose output, `proper_name` MUST be emitted using `display_ru` (fallback: `canon_ru`) only.
[DECISION][STYLE-086] If `doc_language` is `en-US`, any mention of a `proper_name` in normative text MUST preserve the Russian spelling by referencing it as `ru:"<canon_ru>"`; `en:"<canon_en>"` is permitted only if `canon_en` is explicitly declared; the Russian string MUST NOT be altered.
[DECISION][STYLE-087] Latin-script names are permitted in Russian prose ONLY IF they are explicitly intended as the displayed form (i.e., stored as `display_ru` for that entity); otherwise Latin-script is forbidden in prose for that entity.
[FORBIDDEN][STYLE-088] Auto-transliteration or back-transliteration between scripts (ru↔lat) for any `proper_name`.
[FORBIDDEN][STYLE-089] Introducing aliases for `proper_name` unless they are explicitly declared as aliases in the canonical vocabulary/registry that owns that namespace.

### 6. Role-specific CONTENT rules (normative)

[DECISION][STYLE-067] ROLE_TYPE: STATE — `## CONTENT` MUST contain only `[STATE]` statements (plus `[DECISION]` / `[FORBIDDEN]` for constraints on reading).
[DECISION][STYLE-068] ROLE_TYPE: STATE MUST NOT use normative tables EXCEPT WHEN the table schema is declared in OUTPUT CONTRACT AND the table is the sole representation of those records (registry-style); ELSE FAIL.
[FORBIDDEN][STYLE-069] STATE content: causal chains, resolution logic, “why” explanations.
[DECISION][STYLE-070] ROLE_TYPE: RULE — `## CONTENT` MUST contain only `[RULE]`, `[DECISION]`, `[FORBIDDEN]` (plus non-normative examples in `## NON-NORMATIVE` only).
[DECISION][STYLE-071] RULE statements MUST be decidable; use IF/THEN where applicable.
[DECISION][STYLE-071A] Decidable rule format MUST be `PASS IFF <predicate>; ELSE FAIL` OR `IF <predicate> THEN <obligation>; ELSE FAIL`.
[DECISION][STYLE-072] ROLE_TYPE: BIND — `## CONTENT` MUST contain only `[BIND]` statements that select among existing STATE values.
[DECISION][STYLE-073] BIND MUST reference a RULE justification by ID for each selection.
[DECISION][STYLE-074] ROLE_TYPE: INTERFACE — defines domain ownership/consumes/forbids; MUST NOT introduce metric values.
[DECISION][STYLE-075] ROLE_TYPE: INDEX — contains navigation tables/pointers only; MUST NOT redefine rules or state.
[DECISION][STYLE-075A] In ROLE_TYPE: INDEX, any table in CONTENT MUST be fully specified in OUTPUT CONTRACT (columns, types, primary key if applicable).

### 6.1 Record Streams (TYPE C inputs: scenes / timelines / event arrays)

[DECISION][STYLE-076] TYPE C inputs MUST be represented as `record_stream` and MUST NOT be interpreted as TYPE B world state.
[DECISION][STYLE-077] Any document that contains a `record_stream` MUST declare `record_format_id` in YAML; if the dataset spans multiple documents, those docs MUST also declare the same `dataset_id`.
[DECISION][STYLE-078] Any document that exports `record_stream` MUST define, in its `## OUTPUT CONTRACT`, a machine-readable parser contract including at least: `record_start_rule`, `required_fields`, `field_encoding`, `merge_policy`.
[FORBIDDEN][STYLE-079] Mixing multiple incompatible record encodings inside the same exported `record_stream` without explicit separate exports per encoding.

### 7. Causal chains (strict form)

[DECISION][STYLE-080] Causal chains are allowed ONLY in ROLE_TYPE: RULE (or in explicitly allowed CANON artifacts declared by RULE docs).
[DECISION][STYLE-081] Canonical tokens: `CAUSE → MECHANISM → CONSEQUENCE`.
[DECISION][STYLE-082] If causal text is present, each node MUST be a separate atomic statement with its own ID.
[FORBIDDEN][STYLE-083] Inline causal chains inside long paragraphs.

### 8. Ownership, domains, and naming

[DECISION][STYLE-090] Every metric MUST declare ownership in a ROLE_TYPE: STATE document (e.g., `metric.owner_domain = <DOMAIN>`), or via an INTERFACE ownership table referenced by that STATE.
[FORBIDDEN][STYLE-091] Two domains defining the same metric value unless explicitly marked DUAL-ALLOWED by a RULE doc.
[DECISION][STYLE-092] Ownership names MUST match the interface index (project-owned enum set).
[DECISION][STYLE-093] Metric IDs MUST be snake_case and stable.
[FORBIDDEN][STYLE-094] Reusing the same metric name for different meanings.
[DECISION][STYLE-094A] Reserved keywords for corpus semantics are: ARTIFACT, BUNDLE, CONTRACT, GATE, LOCK, REGISTRY, PACK.
[FORBIDDEN][STYLE-094B] Using synonyms for reserved keywords in normative sections (e.g., “package” вместо PACK, “checkpoint” вместо GATE).

### 9. Numbers, units, strings, UNKNOWN

[DECISION][STYLE-120] Numeric values MUST include units: `TW`, `EJ_per_year`, `C`, `m`, `%`, `years`, etc.
[DECISION][STYLE-121] Tokens/enums MUST be UPPER_SNAKE_CASE; parsing-relevant human strings MUST be quoted consistently using `"` (double quotes).
[DECISION][STYLE-122] Missing data MUST be represented as `UNKNOWN` or omitted; never elided with `...` or `…`.
[FORBIDDEN][STYLE-123] Ellipsis placeholders (`...` / `…`) in any normative section; in `class: scene` this is a hard lint error.
[DECISION][STYLE-124] If a `record_stream` uses JSON (e.g., JSON Lines), it MUST be declared via `record_format_id` and MUST have an explicit parser contract in OUTPUT CONTRACT; “implicit JSON” is forbidden.
[DECISION][STYLE-124A] Any reference to an undefined term/metric/token in normative sections MUST be treated as [UNKNOWN] and MUST trigger lint FAIL unless explicitly allowed by a RULE.

### 10. OUTPUT CONTRACT templates (normative; role-specific)

[DECISION][STYLE-110] Every document MUST include `## OUTPUT CONTRACT` and it MUST be machine-readable.
[DECISION][STYLE-111] OUTPUT CONTRACT MUST be expressed as YAML in a fenced block with language tag `yaml`.

~~~yaml
doc_id: <id>
role_type: <ROLE_TYPE>
export: <role-specific>
~~~

[DECISION][STYLE-112] STATE output contract schema:
~~~yaml
doc_id: <id>
role_type: STATE
export:
  - metric: <metric_id>
    owner_domain: <DOMAIN>
    values:
      core: <value|none>
      p90: <value|none>
      range: <[a,b]|none>
    unit: <unit|none>
~~~

[DECISION][STYLE-113] RULE output contract schema:
~~~yaml
doc_id: <id>
role_type: RULE
export:
  - rule_id: <STATEMENT_ID>
    intent: <one-line>
    inputs: <list>
    outputs: <list>
~~~

[DECISION][STYLE-114] BIND output contract schema:
~~~yaml
doc_id: <id>
role_type: BIND
export:
  - metric: <metric_id>
    selected_value: core|p90
    scope: baseline|canon
    justification: <rule_id>
~~~

[DECISION][STYLE-115] INTERFACE output contract schema:
~~~yaml
doc_id: <id>
role_type: INTERFACE
export:
  - owns: <list of domains|concepts>
  - consumes: <list of domains|documents>
  - forbids: <list of forbidden definitions>
~~~

[DECISION][STYLE-116] INDEX output contract schema:
~~~yaml
doc_id: <id>
role_type: INDEX
export:
  - rows: <list>
  - columns: <list>
~~~

[DECISION][STYLE-116A] Any spec that defines lint MUST export machine-readable lint configuration in OUTPUT CONTRACT as YAML (no prose).
[FORBIDDEN][STYLE-117] Omitting OUTPUT CONTRACT even if `export` is empty.
[FORBIDDEN][STYLE-118] Using freeform prose in OUTPUT CONTRACT instead of machine-readable schema.
[RULE][STYLE-118A] PASS IFF OUTPUT CONTRACT YAML conforms to the role-specific schema template for the declared ROLE_TYPE; ELSE FAIL.

### 11. Rewrite protocol (deterministic transformation)

[DECISION][STYLE-140] Rewrite MUST preserve meaning; only structure changes unless explicitly requested.
[DECISION][STYLE-141] Rewrite MUST preserve all existing `statement_id`s verbatim; new statements MUST allocate new IDs without renumbering old ones.
[DECISION][STYLE-142] Rewrite algorithm MUST be:
[DECISION][STYLE-143] 1. Parse YAML front-matter; validate required keys.
[DECISION][STYLE-144] 2. Infer ROLE_TYPE (or keep if valid); enforce tag constraints.
[DECISION][STYLE-145] 3. Build mandatory skeleton; move all content under correct sections.
[DECISION][STYLE-146] 4. Split prose/bullets into atomic statements; assign IDs; keep ≤ 3 lines per statement.
[DECISION][STYLE-147] 5. Move examples into `## NON-NORMATIVE` only.
[DECISION][STYLE-148] 6. Emit `## OUTPUT CONTRACT` matching role templates; if export is empty, still emit schema.
[DECISION][STYLE-149] 7. Emit `## FORBIDDEN` tailored to doc role and scope.
[DECISION][STYLE-150] 8. Run lint gates; fail if any gate fails.
[DECISION][STYLE-151] Rewrite MUST NOT translate, transliterate, or back-transliterate any `proper_name`; Russian spellings MUST be preserved verbatim.
[DECISION][STYLE-152] If `doc_language` is missing, rewrite MUST set it to `ru-RU` by default unless explicitly requested otherwise; prose constraints MUST keep `prose_language: ru-RU`.
[DECISION][STYLE-153] If the document contains TYPE C records, rewrite MUST preserve the declared `record_format_id` (or set it explicitly) and MUST NOT silently convert encodings (e.g., KV → JSON) without an explicit request.
[DECISION][STYLE-154] Any newly introduced corpus-wide term during rewrite MUST be added either to local `## DEFINITIONS` (local scope) or to the canonical vocabulary doc; silent “new term without definition” is forbidden.
[RULE][STYLE-155] Rewrite of a COMPLIANT document MUST produce byte-identical output; ELSE FAIL (idempotency rule).

### 12. Compliance checklist (mechanical gates)

[DECISION][STYLE-160] A document is COMPLIANT IFF all lint gates in this spec pass.
[DECISION][STYLE-161] Non-compliant docs MUST be treated as invalid inputs (do not consume for generation).

## USAGE / RESOLUTION

[DECISION][STYLE-200] This spec is normative for all corpus docs unless a doc contains an explicit exemption statement that references this spec and declares its scope.
[DECISION][STYLE-201] Exemptions MUST be minimal and MUST NOT weaken determinism (exemption itself must be decidable).
[DECISION][STYLE-202] Applicability/precedence between documents is governed by `SPEC-PRIORITY-RESOLUTION-2215-0001`; this spec defines structure and lint gates only.
[DECISION][STYLE-203] Consumers MUST treat only OUTPUT CONTRACT `export` as consumable semantics; any content outside OUTPUT CONTRACT is NON-COMPLIANT to consume.

## OUTPUT CONTRACT

~~~yaml
doc_id: SPEC-DOC-STYLE-2215-0001
role_type: RULE
export:
  - rule_id_prefix: STYLE
    dependency_semantics:
      inputs_meaning: "consumes inputs_contract_surface (OUTPUT CONTRACT export) as data-flow dependency"
      depends_on_meaning: "semantic dependency; does not consume export"
      require_disjoint_sets: true
      hard_dependency_set: "inputs ∪ depends_on"
    corpus_language_policy:
      doc_language_allowed: ["ru-RU","en-US"]
      prose_language_required: "ru-RU"
      proper_names:
        canon_ru_required: true
        prose_emit: "display_ru_then_canon_ru"
        forbid_auto_transliteration: true
    record_stream_rules:
      require_record_format_id: true
      require_dataset_id_for_series: true
      require_parser_contract_keys: ["record_start_rule","required_fields","field_encoding","merge_policy"]
    skeleton_h2_order:
      - "LLM-INTENT"
      - "DEFINITIONS"
      - "INVARIANTS"
      - "CONTENT"
      - "USAGE / RESOLUTION"
      - "OUTPUT CONTRACT"
      - "FORBIDDEN"
      - "NON-NORMATIVE"
    allowed_role_types: ["STATE","RULE","BIND","INTERFACE","INDEX"]
    allowed_tags: ["FACT","ASSUMPTION","PROJECTION","DECISION","FORBIDDEN","UNKNOWN","STATE","RULE","BIND"]
    statement_line_regex: '^\[(FACT|ASSUMPTION|PROJECTION|DECISION|FORBIDDEN|UNKNOWN|STATE|RULE|BIND)\]\[[A-Z0-9_]+-[0-9]{3}[A-Z]?\]\s.+$'
    forbid_enumeration_paren_regex:
      regex: '\b[0-9]+\)'
      applies_to: statement_text
    doc_id_reference_token_regex: '\b[A-Z0-9]+(?:-[A-Z0-9]+)+-[0-9]{4}\b'
    file_invariants:
      encoding: "utf-8"
      forbid_bom: true
      line_endings: "LF"
      forbid_trailing_whitespace: true
      require_single_final_newline: true
    structural_line_policy:
      h3_regex: '^###\s.+$'
      allowed_sections: ["CONTENT","NON-NORMATIVE"]
      forbid_h4_plus: true
      forbid_h3_numeric_paren_prefix: true
      require_h3_numeric_dot_prefix: true
    statement_continuation_regex: '^ {2}\S.*$'
    structural_heading_regex: '^###\s.+$'
    markdown_table_regex:
      - '^\|.*\|$'
      - '^\|[ \-:|]+\|$'
    allowed_modals: ["MUST","MUST NOT","FORBIDDEN","REQUIRED","FAIL","PASS"]
    forbidden_modals: ["SHOULD","MAY","CAN","USUALLY","TYPICALLY","GENERALLY","OFTEN"]
    forbidden_softeners: ["обычно","как правило","в целом","скорее","может быть","возможно"]
    lint_gates:
      - gate_id: STYLE-LINT-001
        intent: "no extra H2 sections"
      - gate_id: STYLE-LINT-002
        intent: "every normative line is a tagged statement with stable id OR allowed structural line"
      - gate_id: STYLE-LINT-003
        intent: "LLM-INTENT has required keys and <=20 lines"
      - gate_id: STYLE-LINT-004
        intent: "OUTPUT CONTRACT present and machine-readable"
      - gate_id: STYLE-LINT-005
        intent: "prefix declared or inferable"
      - gate_id: STYLE-LINT-006
        intent: "no yaml_delimiter_line in body"
      - gate_id: STYLE-LINT-007
        intent: "no ellipsis placeholders in normative sections"
      - gate_id: STYLE-LINT-008
        intent: "front_matter required keys present and normalized (inputs/depends_on lists)"
      - gate_id: STYLE-LINT-009
        intent: "doc_language present and allowed"
      - gate_id: STYLE-LINT-010
        intent: "prose_language required for prose-consumed docs and must equal ru-RU"
      - gate_id: STYLE-LINT-011
        intent: "record_stream docs declare record_format_id (+dataset_id for series) and have parser contract keys"
      - gate_id: STYLE-LINT-012
        intent: "headers match exactly (case-sensitive) and follow skeleton order"
      - gate_id: STYLE-LINT-013
        intent: "no forbidden modals/softeners in normative sections"
      - gate_id: STYLE-LINT-014
        intent: "no consumption of non-export content is allowed"
      - gate_id: STYLE-LINT-015
        intent: "H3 headings allowed only in CONTENT/NON-NORMATIVE; H4+ forbidden"
      - gate_id: STYLE-LINT-016
        intent: "forbid enumeration marker N) in any statement text; require N. if numbering is used"
      - gate_id: STYLE-LINT-017
        intent: "file encoding is UTF-8 without BOM"
      - gate_id: STYLE-LINT-018
        intent: "line endings are LF only"
      - gate_id: STYLE-LINT-019
        intent: "no trailing whitespace and exactly one final newline"
      - gate_id: STYLE-LINT-020
        intent: "all depends_on/inputs IDs exist in corpus_registry (IDX-CORPUS)"
      - gate_id: STYLE-LINT-021
        intent: "dependency graph is acyclic (DAG)"
      - gate_id: STYLE-LINT-022
        intent: "deprecated workflow: deprecated requires superseded_by; new deps must not reference deprecated docs"
      - gate_id: STYLE-LINT-023
        intent: "any doc_id reference token in normative sections is declared in inputs/depends_on (except self)"
      - gate_id: STYLE-LINT-024
        intent: "OUTPUT CONTRACT YAML conforms to role-specific schema template"
  - rewrite_protocol:
      - "STYLE-140"
      - "STYLE-141"
      - "STYLE-142"
      - "STYLE-143"
      - "STYLE-144"
      - "STYLE-145"
      - "STYLE-146"
      - "STYLE-147"
      - "STYLE-148"
      - "STYLE-149"
      - "STYLE-150"
      - "STYLE-151"
      - "STYLE-152"
      - "STYLE-153"
      - "STYLE-154"
      - "STYLE-155"
~~~

## FORBIDDEN

[FORBIDDEN][STYLE-900] Treating NON-NORMATIVE content as a source of constraints or facts.
[FORBIDDEN][STYLE-901] Silent relaxation of any MUST/MUST NOT rule without an explicit exemption statement.
[FORBIDDEN][STYLE-902] Consuming content outside of declared OUTPUT CONTRACT of a document.
[FORBIDDEN][STYLE-903] Using unscoped numbers (numbers without units where units are applicable).
[FORBIDDEN][STYLE-904] Using `yaml_delimiter_line` in document body (segmentation hazard).
[FORBIDDEN][STYLE-905] Auto-transliteration/back-transliteration of any proper names or toponyms (ru↔lat) without explicit canon/alias declaration.
[FORBIDDEN][STYLE-906] Emitting diegetic prose in any language other than `prose_language: ru-RU`.
[FORBIDDEN][STYLE-907] Changing `record_format_id` or mixing record encodings inside a dataset without an explicit exemption statement.
[FORBIDDEN][STYLE-908] Using synonyms for reserved keywords (CONTRACT/GATE/LOCK/REGISTRY/PACK) in normative sections.

## NON-NORMATIVE

### Example: Minimal compliant doc (illustrative; delimiter lines replaced to avoid segmentation hazards in examples)

~~~text
YAML_FRONT_MATTER_BEGIN
id: EXAMPLE-0001
title: >
  Example Doc
class: canon
status: draft
prefix: EXA
doc_language: en-US
prose_language: ru-RU
inputs: []
depends_on: []
scope: >
  Example scope.
YAML_FRONT_MATTER_END

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: example rules
INPUTS: []
OUTPUTS: []
FORBIDDEN: []

## DEFINITIONS

[FACT][EXA-010] `foo` = bar.

## INVARIANTS

[DECISION][EXA-020] Foo MUST remain bar.

## CONTENT

[RULE][EXA-030] IF foo == bar THEN baz MUST be qux; ELSE FAIL.

## USAGE / RESOLUTION

[DECISION][EXA-040] Applies globally.

## OUTPUT CONTRACT

OUTPUT_CONTRACT_YAML_BEGIN
doc_id: EXAMPLE-0001
role_type: RULE
export: []
OUTPUT_CONTRACT_YAML_END

## FORBIDDEN

[FORBIDDEN][EXA-900] Inventing baz.

## NON-NORMATIVE

(empty)
~~~

~~~
</file>

<file path="spec/SPEC-METHODOLOGY-2215-0001.md">
~~~markdown
---
id: SPEC-METHODOLOGY-2215-0001
title: >
  Corpus Methodology — Minimal Set for Prose Generation (2215)
class: spec
status: draft
version: 1.1.0
prefix: METH
doc_language: ru-RU
prose_language: ru-RU
inputs: []
depends_on:
  - IDX-CORPUS-0001
  - SPEC-DOC-ID-2215-0001
  - SPEC-DOC-STYLE-2215-0001
  - SPEC-PRIORITY-RESOLUTION-2215-0001
scope: >
  Норматив методологии корпуса 2215 для подготовки и генерации романа.
  Методология фиксирует минимально достаточный набор типов документов,
  правила их применимости, границы ответственности и правила потребления
  корпуса LLM без механизма override.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: define minimal corpus artifact set and consumption rules for deterministic prose generation
INPUTS: [IDX-CORPUS-0001, SPEC-DOC-ID-2215-0001, SPEC-DOC-STYLE-2215-0001, SPEC-PRIORITY-RESOLUTION-2215-0001]
OUTPUTS: [artifact_type_set, applicability_rules, authoring_flow, consumption_contract]
FORBIDDEN: [introducing_new_doc_classes, override_mechanism, treating_protocol_as_world_truth, consuming_non_export_content, alternative_precedence_orders]

## DEFINITIONS

[FACT][METH-010] `corpus` = множество документов, перечисленных в IDX-CORPUS-0001, потребляемых LLM строго по OUTPUT CONTRACT каждого документа.
[FACT][METH-020] `doc_class` = значение YAML `class:` документа, согласованное с `family` doc_id по SPEC-DOC-ID-2215-0001.
[FACT][METH-030] `active_classes` = {ssot, baseline, canon, plan, scene, idx, protocol, spec}.
[FACT][METH-040] `knowledge_classes` = {ssot, baseline, canon, plan, scene}.
[FACT][METH-050] `governance_classes` = {spec}.
[FACT][METH-060] `meta_classes` = {idx}.
[FACT][METH-070] `interface_classes` = {protocol}.
[FACT][METH-080] `applicability_order` = порядок применимости знаний при компиляции контекста сцены: Scene > Plan > Canon > Baseline > SSOT.
[FACT][METH-090] `non_penetration` = нижележащий по applicability документ MUST NOT ослабить или отменить ограничения вышележащего.
[FACT][METH-100] `export_surface` = OUTPUT CONTRACT.export; единственная допустимая поверхность потребления документа.
[FACT][METH-110] `operator_draft_allowed` ∈ {true,false} — флаг режима чтения draft-документов, передаваемый оператором явно.

## INVARIANTS

[DECISION][METH-200] Корпус использует ТОЛЬКО `active_classes`; любые иные классы документов FORBIDDEN.
[DECISION][METH-210] Документ без OUTPUT CONTRACT или без секции `export` считается NON-COMPLIANT и MUST NOT потребляться LLM.
[DECISION][METH-220] LLM MUST потреблять документы исключительно через `export_surface`; контент вне export игнорируется.
[DECISION][METH-230] `protocol` управляет только форматом и процессом chat-выдачи и MUST NOT вводить факты мира, ограничения мира или сюжетные директивы.
[DECISION][METH-240] `idx` является единственным реестром членства корпуса.
[DECISION][METH-250] Механизм `override` отсутствует; любые изменения или исключения оформляются либо как факты SCENE, либо прямой правкой источника.
[DECISION][METH-260] LLM MUST NOT изобретать значения; допустимы только omission, UNKNOWN или запрос оператора.

## CONTENT

### 1. Типы документов

[DECISION][METH-300] `ssot` содержит декларативные метрики (core / p90 / range) и не является источником дефолтов сцены.
[DECISION][METH-310] `baseline` содержит значения по умолчанию и биндинги; baseline НЕ содержит жёстких запретов.
[DECISION][METH-320] `canon` содержит жёсткие ограничения мира, допустимость, инварианты и словарь; canon может ограничивать baseline.
[DECISION][METH-330] `plan` задаёт директиву сюжета и обязательные биты; plan не выбирает численные значения.
[DECISION][METH-340] `scene` фиксирует runtime-факты, включая возможные нарушения правил как события с последствиями; scene НЕ создаёт допустимость.
[DECISION][METH-350] `idx` каталогизирует документы и зависимости; idx не вводит семантику.
[DECISION][METH-360] `protocol` фиксирует контракт интерфейса и не участвует в применимости знаний.
[DECISION][METH-370] `spec` нормирует правила корпуса и потребления; spec не является источником фактов мира.

### 2. Применимость и компиляция сцены

[DECISION][METH-400] `scene_context` MUST компилироваться по `applicability_order`.
[DECISION][METH-410] `scene` и `plan` могут выбирать из допустимого, но MUST NOT отменять ограничения `canon`, `baseline`, `ssot`.
[DECISION][METH-420] `baseline` предоставляет значения только при отсутствии уточнения сверху.
[DECISION][METH-430] Прямое использование SSOT как фона сцены FORBIDDEN.

### 3. Потребление документов

[DECISION][METH-500] Документы со статусом `fixed` являются приоритетными источниками.
[DECISION][METH-510] IF `operator_draft_allowed=false` THEN LLM MUST ignore документы со статусом `draft`.
[DECISION][METH-520] IF `operator_draft_allowed=true` THEN LLM MAY потреблять `draft` документы при условии COMPLIANCE.
[DECISION][METH-530] Документы со статусом `deprecated` MUST NOT потребляться.
[DECISION][METH-540] Любой токен корпуса MUST NOT утекать в прозу.

### 4. Stop-политика

[DECISION][METH-600] Корпус является closed-world.
[DECISION][METH-610] При противоречии, недоопределённости или невозможности соблюсти ограничения LLM MUST остановиться и запросить правку источника.
[DECISION][METH-620] Исключения и нарушения фиксируются как факты SCENE с последствиями; легализация не требуется.

### 5. Авторинговый поток

[DECISION][METH-700] До начала прозы MUST существовать зафиксированный слой: canon + baseline + plan + scene.
[DECISION][METH-710] SSOT используется только как источник метрик для canon/baseline.
[DECISION][METH-720] INDEX MUST обновляться при любых структурных изменениях корпуса.

## USAGE / RESOLUTION

[DECISION][METH-800] При конфликте данного документа с SPEC-DOC-ID или SPEC-DOC-STYLE приоритет имеют соответствующие SPEC.
[DECISION][METH-810] Отсутствие механизма override является осознанным ограничением методологии.

## OUTPUT CONTRACT

~~~yaml
doc_id: SPEC-METHODOLOGY-2215-0001
role_type: RULE
export:
  - active_classes:
      list: [ssot, baseline, canon, plan, scene, idx, protocol, spec]
  - applicability_order:
      list: [Scene, Plan, Canon, Baseline, SSOT]
  - override_supported: false
  - scene_may_record_violations: true
  - export_only_consumption: true
~~~

## FORBIDDEN

[FORBIDDEN][METH-900] Введение новых doc_class вне `active_classes`.
[FORBIDDEN][METH-910] Любая форма override или эквивалентного механизма.
[FORBIDDEN][METH-920] Использование `protocol` как источника знания.
[FORBIDDEN][METH-930] Использование SSOT как дефолта сцены.
[FORBIDDEN][METH-940] Любая форма invention.

## NON-NORMATIVE

(Empty by design)

~~~
</file>

<file path="spec/SPEC-PRIORITY-RESOLUTION-2215-0001.md">
~~~markdown
---
id: SPEC-PRIORITY-RESOLUTION-2215-0001
title: >
  Resolution Order & Precedence Rules — 2215
class: spec
status: fixed
version: 1.0.0
inputs: []
depends_on: []
scope: >
  Канонический порядок разрешения документов корпуса 2215 и правила
  непробиваемости ограничений между уровнями. Документ обязателен
  для всех SSOT / BASELINE / CANON / PLAN / SCENE / OVERRIDE.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: define global resolution order and forbid cross-layer override violations
INPUTS: [any_document]
OUTPUTS: [resolution_order, violation_flags]
FORBIDDEN: [implicit_precedence, heuristic_resolution, narrative_reasoning]

---

## DEFINITIONS

[DECISION][RES-DEF-010] `resolution_order` = строгая иерархия документов, определяющая допустимость значений и ограничений.

[DECISION][RES-DEF-011] `override` = документ, явно изменяющий baseline/ssot в пределах разрешённого scope и с явным justification.

---

## RESOLUTION ORDER (GLOBAL)

[DECISION][RES-ORD-010] Global resolution order MUST be:

1. Override
2. Scene
3. Plan
4. Canon
5. Baseline
6. SSOT

[DECISION][RES-ORD-011] Документ с более высоким приоритетом МОЖЕТ:
- конкретизировать,
- сузить,
- выбрать допустимое значение из документа с более низким приоритетом.

[FORBIDDEN][RES-ORD-012] Документ с более низким приоритетом MUST NOT:
- отменять ограничения,
- расширять допустимые диапазоны,
- выбирать значение за пределами разрешённых состояний документа с более высоким приоритетом.

---

## NON-PENETRATION RULE (CRITICAL)

[DECISION][RES-NP-010] Ограничения верхнего уровня являются непробиваемыми для нижележащих документов.

[FORBIDDEN][RES-NP-011] Любая попытка:
- ослабить FORBIDDEN,
- игнорировать INVARIANTS,
- заменить RULE логикой сцены или канона

MUST be treated as invalid input.

---

## OVERRIDE CONSTRAINTS

[DECISION][RES-OVR-010] Override MAY modify:
- selected_value,
- local constraints,
- scope-limited behavior

ТОЛЬКО при выполнении всех условий:
- явный reference на переопределяемый anchor,
- justification,
- scope.

[FORBIDDEN][RES-OVR-011] Implicit override is forbidden.

[FORBIDDEN][RES-OVR-012] Override без justification считается невалидным.

---

## USAGE / RESOLUTION

[DECISION][RES-USE-010] Все документы корпуса ОБЯЗАНЫ трактоваться с учётом данного порядка разрешения.

[DECISION][RES-USE-011] В случае конфликта документов приоритет определяется исключительно данным SPEC.

---

## OUTPUT CONTRACT

~~~yaml
doc_id: SPEC-PRIORITY-RESOLUTION-2215-0001
role_type: RULE
export:
  - resolution_order:
      - Override
      - Scene
      - Plan
      - Canon
      - Baseline
      - SSOT
~~~

---

## FORBIDDEN

[FORBIDDEN][RES-FBD-010] Introducing alternative precedence orders.
[FORBIDDEN][RES-FBD-011] Heuristic or narrative conflict resolution.
[FORBIDDEN][RES-FBD-012] Assuming precedence from document class without this SPEC.

---

## NON-NORMATIVE

(Empty by design)

~~~
</file>

<file path="spec/SPEC-QUALITATIVE-ENUMS-2215-0001.md">
~~~markdown
---
id: SPEC-QUALITATIVE-ENUMS-2215-0001
title: >
  Qualitative Enums — Controlled Vocabulary (2215)
class: spec
status: fixed
version: 1.0.0
inputs: []
depends_on: []
scope: >
  Нормативный словарь качественных значений для SSOT/BASELINE/CANON.
  Устраняет vague-значения и обеспечивает совместимость между документами.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: define controlled vocabularies for qualitative fields
INPUTS: [any_document]
OUTPUTS: [enum_sets]
FORBIDDEN: [freeform_qualitative_values, synonyms_as_new_values]

---

## CONTENT

[DECISION][QEN-010] Prevalence enum = {none, rare, minority, common, majority, near_universal}.

[DECISION][QEN-020] Autonomy enum (transport) = {manual_norm, mixed, autonomous_norm}.

[DECISION][QEN-030] Work mode enum = {on_site, hybrid, remote, remote_or_hybrid}.

---

## USAGE / RESOLUTION

[DECISION][QEN-USE-010] Any qualitative field MUST use one of the enums above when applicable.
[FORBIDDEN][QEN-USE-011] Using ad-hoc strings such as "predominantly_*", "*_common", "mostly_*".

---

## OUTPUT CONTRACT

~~~yaml
doc_id: SPEC-QUALITATIVE-ENUMS-2215-0001
role_type: RULE
export:
  - enum: prevalence
    values: [none, rare, minority, common, majority, near_universal]
  - enum: transport_autonomy
    values: [manual_norm, mixed, autonomous_norm]
  - enum: work_mode
    values: [on_site, hybrid, remote, remote_or_hybrid]
~~~

---

## FORBIDDEN

[FORBIDDEN][QEN-FBD-010] Introducing new qualitative values without updating this SPEC.

---

## NON-NORMATIVE

(Empty by design)

~~~
</file>

<file path="spec/SPEC-SCENE-CONTRACT-2215-0001.md">
~~~markdown
---
id: SPEC-SCENE-CONTRACT-2215-0001
title: >
  Scene Contract — 2215 (Inputs, Constraints, Overrides, Evidence)
class: spec
status: draft
version: 1.0.1
prefix: SCN
doc_language: ru-RU
prose_language: ru-RU
inputs: []
depends_on:
  - BASELINE-DAILY_OPS-2215-0002
  - BASELINE-SOCIAL-2215-0001
  - CANON-CORE-GLOBAL-2215-0001
  - CANON-ARTIFACT-SNIPPETS-GLOBAL-2215-0001
  - CANON-ORDERS-GLOBAL-2215-0003
  - CANON-SYSTEMS-GLOBAL-2215-0001
  - SPEC-DOC-STYLE-2215-0001
  - SPEC-PRIORITY-RESOLUTION-2215-0001
scope: >
  Обязательный контракт сцены для романа 2215: какие источники считаются
  дефолтами, что сцена может/не может вводить, когда требуется explicit override,
  и как сцена должна проявлять причинность через артефакты/процедуры/ограничения
  без лекционной подачи. Контракт валидирует легальность и доказательность сцены.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: define scene-level constraints, required inputs, override triggers, and evidence discipline
INPUTS: [any_scene_request]
OUTPUTS: [scene_inputs_required, override_required_flags, forbidden_patterns]
FORBIDDEN: [world_parameter_binding, ssot_direct_usage, lecture_exposition, implicit_overrides]

## DEFINITIONS

[FACT][SCN-010] `scene` = локальный эпизод с ограниченным POV и частичной наблюдаемостью.
[FACT][SCN-011] `default_background` = набор значений/норм, получаемых из `CANON-CORE-GLOBAL-2215-0001` и baseline-документов.
[FACT][SCN-012] `explicit_override` = документ `class: override` с justification, локализацией и cost.
[FACT][SCN-013] `evidence_artifact` = процедурный фрагмент (лог/ордер/chain-of-custody), пригодный для проверки утверждений сцены.
[FACT][SCN-014] `level_mid` = стандартный городской режим без спец-лицензий и без экстерриториальных исключений.

## INVARIANTS

[DECISION][SCN-020] Scene MUST respect global resolution order from `SPEC-PRIORITY-RESOLUTION-2215-0001`; ELSE FAIL.
[DECISION][SCN-021] Scene MUST treat `CANON-CORE-GLOBAL-2215-0001` as the only default binder for world background values; ELSE FAIL.
[DECISION][SCN-022] Scene MUST apply baseline defaults unless explicitly overridden; ELSE FAIL.
[DECISION][SCN-023] Scene MUST show causality via: artifacts, procedures, measurable constraints, and consequences; ELSE FAIL.
[FORBIDDEN][SCN-024] Scene MUST NOT introduce new global metrics or new bindings.
[FORBIDDEN][SCN-025] Scene MUST NOT use SSOT directly as a scene background source.

## CONTENT

### 1) Mandatory Inputs (what every scene must assume)

[RULE][SCN-030] Every scene MUST assume background defaults from `scene_default_sources`; ELSE FAIL.
[RULE][SCN-031] IF scene references FSSU actions OR admissibility THEN scene MUST additionally assume `scene_FSSU_required_sources`; ELSE FAIL.

~~~yaml
scene_default_sources:
  - CANON-CORE-GLOBAL-2215-0001
  - CANON-BASE-RULE-GLOBAL-2215-0001
  - BASELINE-SOCIAL-2215-0001
  - BASELINE-DAILY_OPS-2215-0002

scene_FSSU_required_sources:
  - CANON-ORDERS-GLOBAL-2215-0003
  - CANON-ARTIFACT-SNIPPETS-GLOBAL-2215-0001
  - CANON-SYSTEMS-GLOBAL-2215-0001
~~~

### 2) Override Triggers (when explicit override is mandatory)

[RULE][SCN-040] IF scene uses any upper_tail_value (p90) OR non_core_regime THEN explicit_override_required MUST be true; ELSE PASS.
[RULE][SCN-041] IF scene depicts public_offline_status as non_suspect OR allows telemetry_jamming without consequences THEN explicit_override_required MUST be true; ELSE PASS.
[RULE][SCN-042] IF scene violates baseline defaults (SOCIAL-CIVIC OR DAILY-OPS) THEN explicit_override_required MUST be true; ELSE PASS.
[RULE][SCN-043] IF scene introduces an exception to access/queues/logging that is not procedural THEN explicit_override_required MUST be true; ELSE PASS.
[RULE][SCN-044] IF scene uses extraterritorial_regime OR special_license_level != MID THEN explicit_override_required MUST be true; ELSE PASS.
[RULE][SCN-045] IF explicit_override_required == true THEN any explicit_override MUST include `override_required_fields`; ELSE FAIL.

~~~yaml
override_required_fields:
  - locality
  - time_window
  - affected_system_or_service
  - procedural_basis
  - cost
~~~

### 3) Evidence Discipline (how the scene proves things without exposition)

[RULE][SCN-050] IF scene asserts a system decision (deny/access/freeze/restrict) THEN it MUST be grounded in artifact OR observable_procedure; ELSE FAIL.
[RULE][SCN-051] IF scene asserts escalation to FSSU OR regulatory action THEN it MUST bind `FSSU_binding_min_fields`; ELSE FAIL.
[RULE][SCN-052] Scene MAY embed short artifact snippets, but MUST keep them partial (snippet), not full documents; ELSE FAIL.

~~~yaml
FSSU_binding_min_fields:
  - case_id_or_equivalent
  - scope
  - procedural_basis
  - minimal_chain_of_custody_if_evidence
~~~

### 4) Prohibited Patterns (hard bans)

[FORBIDDEN][SCN-060] Lecture paragraphs explaining macro-causality or world design.
[FORBIDDEN][SCN-061] “Because the system decided…” without an artifact/procedure.
[FORBIDDEN][SCN-062] Omniscient telemetry / perfect observability as default.
[FORBIDDEN][SCN-063] New global numbers not sourced through CORE/explicit_override.
[FORBIDDEN][SCN-064] Implicit override: exceptions presented as normal without explicit override reference.

## USAGE / RESOLUTION

[DECISION][SCN-070] This spec MUST be applied to any scene generation request; ELSE FAIL.
[DECISION][SCN-071] Any violation MUST be treated as invalid output, not as a creative choice; ELSE FAIL.
[DECISION][SCN-072] Conflict resolution follows `SPEC-PRIORITY-RESOLUTION-2215-0001`; ELSE FAIL.

## OUTPUT CONTRACT

~~~yaml
doc_id: SPEC-SCENE-CONTRACT-2215-0001
role_type: RULE
export:
  - rule_id: SCN-030
    intent: enforce mandatory background inputs
    inputs: [any_scene_request]
    outputs: [scene_inputs_required, scene_default_sources]
  - rule_id: SCN-040
    intent: require explicit override when upper-tail or non-core regime is used
    inputs: [scene_features]
    outputs: [override_required_flag]
  - rule_id: SCN-042
    intent: require explicit override when baseline defaults are violated
    inputs: [scene_features]
    outputs: [override_required_flag]
  - rule_id: SCN-050
    intent: require artifacts/procedures for system decisions
    inputs: [scene_assertions]
    outputs: [evidence_required_flag]
  - rule_id: SCN-060
    intent: forbid lecture exposition
    inputs: [scene_text]
    outputs: [violation_flag]
~~~

## FORBIDDEN

[FORBIDDEN][SCN-900] Selecting SSOT values or binding ranges in scene text (SSOT direct usage is forbidden).
[FORBIDDEN][SCN-901] Treating baseline defaults as optional without explicit override.
[FORBIDDEN][SCN-902] Presenting systemic decisions without artifacts/procedures.

## NON-NORMATIVE

~~~text
Contract goal: keep scenes auditable.
World is revealed through constraints and records, not explanation.
If something unusual happens, the scene must pay procedurally (override + cost), or it does not happen.
~~~

~~~
</file>

<file path="ssot/SSOT-AUTOMATION-A-2215-0004.md">
~~~markdown
---
id: SSOT-AUTOMATION-A-2215-0004
title: >
  AI, Automation, and Robotics — Scenario A (2215, SSOT State)
class: ssot
status: draft
version: 1.1.0
inputs: []
depends_on:
  - SPEC-DOC-STYLE-2215-0001
  - SSOT-SCENARIO-A-2215-0001
scope: >
  SSOT-состояние ИИ, автоматизации и роботизации мира в 2215 году (Scenario A).
  Документ содержит только декларативные метрики (core/p90/range) и качественные состояния.
  Не содержит причинности, правил разрешения конфликтов и моделей управления.
---

## LLM-INTENT

ROLE_TYPE: STATE
SCOPE: declarative AI/automation/robotics state for Scenario A around year 2215
INPUTS: []
OUTPUTS:
  - automation_metric_state
FORBIDDEN:
  - causal_logic
  - resolution_rules
  - governance_models
  - narrative_explanations

---

## DEFINITIONS

[DEF][AUT-DEF-010] automation = AI systems + robotics + autonomous execution loops used across economy and infrastructure.

---

## INVARIANTS

[FACT][AUT-000] Applicable only to Scenario A.
[FACT][AUT-001] AI is treated as infrastructure (utility contour), not a unified subject.
[FACT][AUT-002] AI-tyranny scenarios are excluded unless explicitly enabled by an override doc.

---

## CONTENT

### 1. Automation level (global)

[STATE][AUT-010] labor_automation_percent_tasks.core = 80
[STATE][AUT-011] labor_automation_percent_tasks.p90 = 90
[STATE][AUT-012] labor_automation_percent_tasks.range = null
[STATE][AUT-013] labor_automation_percent_tasks.unit = percent
[STATE][AUT-014] labor_automation_percent_tasks.owner_domain = AUTOMATION

[STATE][AUT-015] automation_execution_mode = "systemic_global"
[STATE][AUT-016] automation_execution_mode.owner_domain = AUTOMATION

---

### 2. Compute and energy use

[STATE][AUT-020] ai_compute_EJ_per_year.core = 75
[STATE][AUT-021] ai_compute_EJ_per_year.p90 = 200
[STATE][AUT-022] ai_compute_EJ_per_year.range = null
[STATE][AUT-023] ai_compute_EJ_per_year.unit = EJ_per_year
[STATE][AUT-024] ai_compute_EJ_per_year.owner_domain = AUTOMATION

[STATE][AUT-025] ai_energy_share_percent.core = null
[STATE][AUT-026] ai_energy_share_percent.p90 = 20
[STATE][AUT-027] ai_energy_share_percent.range = null
[STATE][AUT-028] ai_energy_share_percent.unit = percent
[STATE][AUT-029] ai_energy_share_percent.owner_domain = AUTOMATION

---

### 3. Robotics density and presence

[STATE][AUT-030] robots_per_human.core = null
[STATE][AUT-031] robots_per_human.p90 = 1.0
[STATE][AUT-032] robots_per_human.range = null
[STATE][AUT-033] robots_per_human.unit = ratio
[STATE][AUT-034] robots_per_human.owner_domain = AUTOMATION

[STATE][AUT-035] robotics_presence_mode = "ubiquitous_infrastructure"
[STATE][AUT-036] robotics_presence_mode.owner_domain = AUTOMATION

---

### 4. Domains of application (qualitative state)

[STATE][AUT-040] transport_automation_level = "near_total"
[STATE][AUT-041] transport_automation_level.owner_domain = AUTOMATION

[STATE][AUT-042] manufacturing_automation_level = "lights_out"
[STATE][AUT-043] manufacturing_automation_level.owner_domain = AUTOMATION

[STATE][AUT-044] medical_ai_routine_use = true
[STATE][AUT-045] medical_ai_routine_use.owner_domain = LIFE

[STATE][AUT-046] education_ai_routine_use = true
[STATE][AUT-047] education_ai_routine_use.owner_domain = GOVERNANCE

[STATE][AUT-048] urban_systems_ai_coordination = "continuous"
[STATE][AUT-049] urban_systems_ai_coordination.owner_domain = URBANISM

---

### 5. Human participation (state)

[STATE][AUT-050] human_execution_role = "minority_niche"
[STATE][AUT-051] human_execution_role.owner_domain = SOCIETY

[STATE][AUT-052] human_legitimation_role = "required"
[STATE][AUT-053] human_legitimation_role.owner_domain = GOVERNANCE

---

## USAGE / RESOLUTION

[FACT][AUT-090] Defines allowed numeric ranges and qualitative states for downstream documents.

[FORBIDDEN][AUT-091] Using this SSOT document for:
- causal explanations of social/political conflict,
- modeling failures/accidents,
- selecting scene modes or outcomes.

---

## OUTPUT CONTRACT

~~~yaml
doc_id: SSOT-AUTOMATION-A-2215-0004
role_type: STATE
export:
  - metric: labor_automation_percent_tasks
    owner_domain: AUTOMATION
    values: {core: 80, p90: 90, range: null}
    unit: percent

  - metric: ai_compute_EJ_per_year
    owner_domain: AUTOMATION
    values: {core: 75, p90: 200, range: null}
    unit: EJ_per_year

  - metric: ai_energy_share_percent
    owner_domain: AUTOMATION
    values: {core: null, p90: 20, range: null}
    unit: percent

  - metric: robots_per_human
    owner_domain: AUTOMATION
    values: {core: null, p90: 1.0, range: null}
    unit: ratio

  - state: automation_execution_mode
    owner_domain: AUTOMATION
    value: systemic_global

  - state: robotics_presence_mode
    owner_domain: AUTOMATION
    value: ubiquitous_infrastructure

  - state: transport_automation_level
    owner_domain: AUTOMATION
    value: near_total

  - state: manufacturing_automation_level
    owner_domain: AUTOMATION
    value: lights_out

  - state: medical_ai_routine_use
    owner_domain: LIFE
    value: true

  - state: education_ai_routine_use
    owner_domain: GOVERNANCE
    value: true

  - state: urban_systems_ai_coordination
    owner_domain: URBANISM
    value: continuous

  - state: human_execution_role
    owner_domain: SOCIETY
    value: minority_niche

  - state: human_legitimation_role
    owner_domain: GOVERNANCE
    value: required
~~~

---

## FORBIDDEN

[FORBIDDEN][AUT-100] Introducing new automation metrics outside SSOT.
[FORBIDDEN][AUT-101] Embedding causal chains, resolution rules, or governance logic.
[FORBIDDEN][AUT-102] Treating qualitative states as narrative drivers.

---

## NON-NORMATIVE

(Empty by design)

~~~
</file>

<file path="ssot/SSOT-CLIMATE-A-2215-0004.md">
~~~markdown
---
id: SSOT-CLIMATE-A-2215-0004
title: >
  Climate State and Impacts — Scenario A (2215, SSOT State)
class: ssot
status: draft
version: 1.1.0
inputs: []
depends_on:
  - SPEC-DOC-STYLE-2215-0001
  - SSOT-SCENARIO-A-2215-0001
  - SSOT-ENERGY-A-2215-0004
scope: >
  SSOT-состояние климатического фона мира в 2215 году (Scenario A): потепление,
  уровень моря, баланс выбросов, режим экстремумов и состояние адаптационных контуров.
  Документ содержит только декларативные числовые метрики (core/p90/range) и категориальные состояния.
  Не содержит причинности, правил разрешения и процедур реагирования.
---

## LLM-INTENT

ROLE_TYPE: STATE
SCOPE: declarative climate state for Scenario A around year 2215
INPUTS: []
OUTPUTS:
  - climate_state
FORBIDDEN:
  - causal_logic
  - resolution_rules
  - procedural_response
  - narrative_explanations

---

## DEFINITIONS

[DEF][CLM-DEF-010] climate_state = global and region-typical climate parameters and operational impacts as infrastructure background.

---

## INVARIANTS

[FACT][CLM-000] Applicable only to Scenario A.
[FACT][CLM-001] Climate is stabilized at a new level; default mode is not “collapse”.
[FACT][CLM-002] Full return to preindustrial climate is not assumed.
[FACT][CLM-003] Net CO₂ balance is maintained near zero (net ≈ 0).

---

## CONTENT

### 1. Global warming and sea level (2215)

[STATE][CLM-010] warming_C_vs_preindustrial.core = 2.5
[STATE][CLM-011] warming_C_vs_preindustrial.p90 = null
[STATE][CLM-012] warming_C_vs_preindustrial.range = [2.0, 2.5]
[STATE][CLM-013] warming_C_vs_preindustrial.unit = C
[STATE][CLM-014] warming_C_vs_preindustrial.owner_domain = CLIMATE

[STATE][CLM-015] sea_level_m.core = 1.7
[STATE][CLM-016] sea_level_m.p90 = null
[STATE][CLM-017] sea_level_m.range = [1.5, 2.0]
[STATE][CLM-018] sea_level_m.unit = m
[STATE][CLM-019] sea_level_m.owner_domain = CLIMATE

[STATE][CLM-020] warming_trend_post_2215 = "stable_no_accelerating_increase"
[STATE][CLM-021] warming_trend_post_2215.owner_domain = CLIMATE

---

### 2. Emissions balance (2215)

[STATE][CLM-030] net_co2_emissions_mode = "near_zero"
[STATE][CLM-031] net_co2_emissions_mode.owner_domain = CLIMATE

[STATE][CLM-032] residual_emissions_primary_sources = ["land_use", "hard_to_abate_processes"]
[STATE][CLM-033] residual_emissions_primary_sources.owner_domain = CLIMATE

[STATE][CLM-034] emissions_sink_balance_state = "near_zero_equilibrium"
[STATE][CLM-035] emissions_sink_balance_state.owner_domain = CLIMATE

---

### 3. Extremes and risk profile (state)

[STATE][CLM-050] extreme_weather_frequency_vs_20c = "higher"
[STATE][CLM-051] extreme_weather_frequency_vs_20c.owner_domain = CLIMATE

[STATE][CLM-052] climate_risk_distribution = "geographically_redistributed"
[STATE][CLM-053] climate_risk_distribution.owner_domain = CLIMATE

[STATE][CLM-054] typical_extreme_types = [
  "heat_waves",
  "intense_precipitation",
  "storm_systems",
  "drought_periods",
  "compound_multi_risks"
]
[STATE][CLM-055] typical_extreme_types.owner_domain = CLIMATE

[STATE][CLM-056] extremes_handling_mode = "managed_risk_profile"
[STATE][CLM-057] extremes_handling_mode.owner_domain = GOVERNANCE

---

### 4. Adaptation layer (state)

[STATE][CLM-070] adaptation_infrastructure_programs_present = true
[STATE][CLM-071] adaptation_infrastructure_programs_present.owner_domain = GOVERNANCE

[STATE][CLM-072] adaptation_core_program_types = ["coastal_defense", "water_systems", "agro_adaptation"]
[STATE][CLM-073] adaptation_core_program_types.owner_domain = CLIMATE

[STATE][CLM-074] managed_relocation_programs_present = true
[STATE][CLM-075] managed_relocation_programs_present.owner_domain = GOVERNANCE

[STATE][CLM-076] climate_shocks_system_effect_mode = "adaptation_stimulus_not_collapse"
[STATE][CLM-077] climate_shocks_system_effect_mode.owner_domain = CLIMATE

---

### 5. Water, coasts, food (state)

[STATE][CLM-090] water_systems_role_in_adaptation = "key_contour"
[STATE][CLM-091] water_systems_role_in_adaptation.owner_domain = CLIMATE

[STATE][CLM-092] water_scarcity_mode = "regional_infrastructure_managed"
[STATE][CLM-093] water_scarcity_mode.owner_domain = CLIMATE

[STATE][CLM-094] coastal_protection_programs_obligatory = true
[STATE][CLM-095] coastal_protection_programs_obligatory.owner_domain = GOVERNANCE

[STATE][CLM-096] managed_retreat_is_normal_policy_in_some_zones = true
[STATE][CLM-097] managed_retreat_is_normal_policy_in_some_zones.owner_domain = GOVERNANCE

[STATE][CLM-098] food_system_stability_mode = "stable_with_local_shocks"
[STATE][CLM-099] food_system_stability_mode.owner_domain = CLIMATE

---

## USAGE / RESOLUTION

[FACT][CLM-900] Provides declarative climate and adaptation parameters for downstream documents.

[FORBIDDEN][CLM-901] Using this SSOT document for:
- emergency response protocols,
- causal chains (“why it happened”),
- default collapse-plot generation without override.

---

## OUTPUT CONTRACT

~~~yaml
doc_id: SSOT-CLIMATE-A-2215-0004
role_type: STATE
export:
  - metric: warming_C_vs_preindustrial
    owner_domain: CLIMATE
    values: {core: 2.5, p90: null, range: [2.0, 2.5]}
    unit: C

  - metric: sea_level_m
    owner_domain: CLIMATE
    values: {core: 1.7, p90: null, range: [1.5, 2.0]}
    unit: m

  - state: warming_trend_post_2215
    owner_domain: CLIMATE
    value: stable_no_accelerating_increase

  - state: net_co2_emissions_mode
    owner_domain: CLIMATE
    value: near_zero

  - state: emissions_sink_balance_state
    owner_domain: CLIMATE
    value: near_zero_equilibrium

  - state: extreme_weather_frequency_vs_20c
    owner_domain: CLIMATE
    value: higher

  - state: climate_risk_distribution
    owner_domain: CLIMATE
    value: geographically_redistributed

  - state: typical_extreme_types
    owner_domain: CLIMATE
    value: [heat_waves, intense_precipitation, storm_systems, drought_periods, compound_multi_risks]

  - state: extremes_handling_mode
    owner_domain: GOVERNANCE
    value: managed_risk_profile

  - state: adaptation_infrastructure_programs_present
    owner_domain: GOVERNANCE
    value: true

  - state: managed_relocation_programs_present
    owner_domain: GOVERNANCE
    value: true

  - state: water_scarcity_mode
    owner_domain: CLIMATE
    value: regional_infrastructure_managed
~~~

---

## FORBIDDEN

[FORBIDDEN][CLM-990] Introducing new world metrics or numeric claims outside SSOT.
[FORBIDDEN][CLM-991] Embedding causal chains, loops, resolution rules, or procedural response logic.
[FORBIDDEN][CLM-992] Treating climate state as narrative directive.

---

## NON-NORMATIVE

(Empty by design)

~~~
</file>

<file path="ssot/SSOT-CONSISTENCY-A-2215-0009.md">
~~~markdown
---
id: SSOT-CONSISTENCY-A-2215-0009
title: >
  Consistency Ruleset — Scenario A (2215)
class: ssot
status: draft
version: 1.1.0
inputs: []
depends_on:
  - SPEC-DOC-STYLE-2215-0001
  - SSOT-SCENARIO-A-2215-0001
  - SSOT-ECONOMY-A-2215-0003
  - SSOT-DEMOGRAPHY-A-2215-0002
  - SSOT-AUTOMATION-A-2215-0004
  - SSOT-ENERGY-A-2215-0004
  - SSOT-CLIMATE-A-2215-0004
  - SSOT-GOVERNANCE-SECURITY-A-2215-0005
  - SSOT-URBANISM-A-2215-0007
scope: >
  SSOT RULE-документ согласованности корпуса 2215 (Scenario A).
  Определяет статусы метрик (CANON | DUAL_ALLOWED | CONFLICT | UNKNOWN),
  правила интерпретации и обязательства downstream-документов.
  Не вводит новые метрики и не выбирает значения.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: consistency validation and interpretation rules for SSOT corpus (Scenario A)
INPUTS:
  - SSOT-SCENARIO-A-2215-0001
  - SSOT-ECONOMY-A-2215-0003
  - SSOT-DEMOGRAPHY-A-2215-0002
  - SSOT-AUTOMATION-A-2215-0004
  - SSOT-ENERGY-A-2215-0004
  - SSOT-CLIMATE-A-2215-0004
  - SSOT-GOVERNANCE-SECURITY-A-2215-0005
  - SSOT-URBANISM-A-2215-0007
OUTPUTS:
  - metric_status
  - allowed_values
  - downstream_constraints
FORBIDDEN:
  - introduce_world_facts
  - select_values
  - narrative_reasoning

---

## DEFINITIONS

[DEF][CONS-DEF-010] metric_status ∈ {CANON, DUAL_ALLOWED, CONFLICT, UNKNOWN}.

[DEF][CONS-DEF-011] CANON = exactly one allowed value/range for downstream default usage.

[DEF][CONS-DEF-012] DUAL_ALLOWED = core allowed as default; upper-tail (p90) allowed only as explicitly localized upper-tail case (override).

[DEF][CONS-DEF-013] CONFLICT = incompatible SSOT STATE declarations without an explicit resolving rule.

[DEF][CONS-DEF-014] UNKNOWN = referenced downstream but not declared in any SSOT STATE document.

[DEF][CONS-DEF-015] downstream_docs = {baseline, canon, plan, scene}.

[DEF][CONS-DEF-016] narrative_lock = rule-level constraint that forces downstream to treat a metric as CANON even if SSOT declares core+p90.

---

## INVARIANTS

[RULE][CONS-INV-010] CONSISTENCY MUST NOT introduce new metrics or values.
[RULE][CONS-INV-011] CONSISTENCY interprets SSOT STATE but never overrides it.
[RULE][CONS-INV-012] Any metric used downstream MUST have a defined status.

---

## CONTENT

### 1. Metric status derivation rules

[RULE][CONS-010] IF a metric has exactly one declared value or range across all SSOT STATE docs THEN status = CANON.

[RULE][CONS-011] IF a metric has declared `core` and `p90` (or equivalent upper-tail) values AND no rule forbids coexistence THEN status = DUAL_ALLOWED.

[RULE][CONS-012] IF two or more SSOT STATE docs declare incompatible values AND no DUAL_ALLOWED rule exists THEN status = CONFLICT.

[RULE][CONS-013] IF a metric is referenced downstream but not declared in any SSOT STATE THEN status = UNKNOWN.

---

### 2. Downstream usage rules by status

[RULE][CONS-020] IF metric status = CANON THEN downstream MUST use the canonical value/range only.

[RULE][CONS-021] IF metric status = DUAL_ALLOWED THEN downstream MUST use `core` as default background.

[RULE][CONS-022] IF metric status = DUAL_ALLOWED THEN upper-tail (`p90`) usage is override_only and MUST satisfy localization + procedural cost rules (see CANON-METRICS-GLOBAL-2215-0002 where applicable).

[RULE][CONS-023] IF metric status = CONFLICT THEN any downstream usage is FORBIDDEN until resolved by class: canon or class: override.

[RULE][CONS-024] IF metric status = UNKNOWN THEN any downstream usage is FORBIDDEN.

---

### 3. Narrative lock rules

[RULE][CONS-030] A metric MAY be marked as narrative_lock by a RULE or CANON document.

[RULE][CONS-031] IF metric has narrative_lock = true THEN downstream MUST treat it as CANON (default background), even if SSOT status is DUAL_ALLOWED.

[RULE][CONS-032] IF narrative_lock = true THEN upper-tail values MAY ONLY be used via explicit override with localization and cost.

---

### 4. Location-specific constraints (policy gates)

[RULE][CONS-040] IF location = RU-16/CHELNY AND metric = primary_energy_TW THEN upper-tail (p90) values are FORBIDDEN as default background.

---

### 5. Closure rules (status finalization)

[RULE][CONS-050] DUAL_ALLOWED or UNKNOWN metrics MAY be closed only by:
- class: canon
- class: override

[RULE][CONS-051] AFTER closure, metric status MUST be updated to CANON (or remain FORBIDDEN if removed).

---

## USAGE / RESOLUTION

[RULE][CONS-090] CONSISTENCY rules MUST be applied before any baseline/canon generation that references SSOT metrics.
[RULE][CONS-091] Any violation of CONSISTENCY rules MUST be treated as a generation error, not as a creative choice.

---

## OUTPUT CONTRACT

~~~yaml
doc_id: SSOT-CONSISTENCY-A-2215-0009
role_type: RULE
export:
  - metric: <metric_key>
    status: CANON | DUAL_ALLOWED | CONFLICT | UNKNOWN
    narrative_lock: true | false
    allowed_usage:
      downstream_default: core | canon | forbidden
      upper_tail: allowed | forbidden | override_only
~~~

---

## FORBIDDEN

[FORBIDDEN][CONS-100] Selecting values for narrative use.
[FORBIDDEN][CONS-101] Repeating SSOT STATE data (numbers/ranges) inside this document.
[FORBIDDEN][CONS-102] Implicit resolution without class: canon or class: override.

---

## NON-NORMATIVE

(Empty by design)

~~~
</file>

<file path="ssot/SSOT-DEMOGRAPHY-A-2215-0002.md">
~~~markdown
---
id: SSOT-DEMOGRAPHY-A-2215-0002
title: >
  Demography — Scenario A (2215, SSOT State)
class: ssot
status: draft
version: 1.1.0
inputs:
  - SSOT-SCENARIO-A-2215-0001
  - SSOT-ECONOMY-A-2215-0003
  - SSOT-LIFE-A-2215-0007
depends_on:
  - SPEC-DOC-STYLE-2215-0001
scope: >
  SSOT-состояние демографии мира в 2215 году (Scenario A).
  Документ содержит только декларативные числовые и качественные
  демографические параметры и не вводит причинность или сценарные режимы.
---

## LLM-INTENT

ROLE_TYPE: STATE
SCOPE: global demographic state for Scenario A around year 2215
INPUTS: []
OUTPUTS:
  - demography_metric_state
FORBIDDEN:
  - causal_logic
  - resolution_rules
  - narrative_explanations

---

## DEFINITIONS

[DEF][DEM-DEF-010] demography = population size, age structure, spatial distribution, and mobility equilibrium.

---

## INVARIANTS

[FACT][DEM-000] Applicable only to Scenario A.
[FACT][DEM-001] Demography is treated as a slowly changing systemic contour.
[FACT][DEM-002] No extreme demographic collapse is assumed by default.

---

## CONTENT

### 1. Total population

[STATE][DEM-010] population_billion.core = 8.8
[STATE][DEM-011] population_billion.p90 = null
[STATE][DEM-012] population_billion.range = [8.5, 9.0]
[STATE][DEM-013] population_billion.unit = billion
[STATE][DEM-014] population_billion.owner_domain = DEMOGRAPHY

[STATE][DEM-015] population_growth_mode = "post_peak_stable"
[STATE][DEM-016] population_growth_mode.owner_domain = DEMOGRAPHY

---

### 2. Age structure and longevity

[STATE][DEM-020] life_expectancy_years.core = 100
[STATE][DEM-021] life_expectancy_years.p90 = null
[STATE][DEM-022] life_expectancy_years.range = [95, 110]
[STATE][DEM-023] life_expectancy_years.unit = years
[STATE][DEM-024] life_expectancy_years.owner_domain = LIFE

[STATE][DEM-025] population_age_structure = "older_but_active"
[STATE][DEM-026] population_age_structure.owner_domain = DEMOGRAPHY

[STATE][DEM-027] retirement_age_concept = "blurred"
[STATE][DEM-028] retirement_age_concept.owner_domain = GOVERNANCE

---

### 3. Fertility and reproduction

[STATE][DEM-030] total_fertility_rate.core = null
[STATE][DEM-031] total_fertility_rate.p90 = null
[STATE][DEM-032] total_fertility_rate.range = [1.5, 1.8]
[STATE][DEM-033] total_fertility_rate.unit = births_per_woman
[STATE][DEM-034] total_fertility_rate.owner_domain = DEMOGRAPHY

[STATE][DEM-035] fertility_control_mode = "cultural_political"
[STATE][DEM-036] fertility_control_mode.owner_domain = GOVERNANCE

[STATE][DEM-037] assisted_reproduction_prevalence = "common_not_dominant"
[STATE][DEM-038] assisted_reproduction_prevalence.owner_domain = LIFE

---

### 4. Urbanization (external ownership)

[STATE][DEM-040] urban_population_share_percent.source = "SSOT-URBANISM-A-2215-0007"
[STATE][DEM-041] urban_population_share_percent.owner_domain = URBANISM
[DECISION][DEM-042] Demography MUST NOT declare, duplicate, or export URBANISM-owned metrics.

---

### 5. Regional distribution

[STATE][DEM-050] regional_population_concentration = "africa_south_asia_high_share"
[STATE][DEM-051] regional_population_concentration.owner_domain = DEMOGRAPHY

[STATE][DEM-052] interregional_demographic_divergence = "reduced"
[STATE][DEM-053] interregional_demographic_divergence.owner_domain = DEMOGRAPHY

---

### 6. Migration and mobility

[STATE][DEM-060] migration_primary_drivers = ["climate", "economy", "security"]
[STATE][DEM-061] migration_primary_drivers.owner_domain = DEMOGRAPHY

[STATE][DEM-062] migration_regulation_mode = "institutionalized"
[STATE][DEM-063] migration_regulation_mode.owner_domain = GOVERNANCE

[STATE][DEM-064] open_borders_exist = false
[STATE][DEM-065] open_borders_exist.owner_domain = GOVERNANCE

[STATE][DEM-066] uncontrolled_mass_migration = false
[STATE][DEM-067] uncontrolled_mass_migration.owner_domain = GOVERNANCE

---

## USAGE / RESOLUTION

[FACT][DEM-090] Provides declarative numeric ranges and qualitative demographic states for downstream documents.

[FORBIDDEN][DEM-091] Using this SSOT document for:
- causal explanations of demographic change,
- crisis modeling,
- selecting narrative or scene modes.

---

## OUTPUT CONTRACT

~~~yaml
doc_id: SSOT-DEMOGRAPHY-A-2215-0002
role_type: STATE
export:
  - metric: population_billion
    owner_domain: DEMOGRAPHY
    values: {core: 8.8, p90: null, range: [8.5, 9.0]}
    unit: billion

  - metric: life_expectancy_years
    owner_domain: LIFE
    values: {core: 100, p90: null, range: [95, 110]}
    unit: years

  - metric: total_fertility_rate
    owner_domain: DEMOGRAPHY
    values: {core: null, p90: null, range: [1.5, 1.8]}
    unit: births_per_woman
~~~

---

## FORBIDDEN

[FORBIDDEN][DEM-100] Introducing new demographic metrics outside SSOT.
[FORBIDDEN][DEM-101] Embedding causal chains or sociological narratives.
[FORBIDDEN][DEM-102] Treating qualitative states as narrative drivers.
[FORBIDDEN][DEM-103] Declaring or exporting URBANISM-owned metrics in DEMOGRAPHY SSOT.

---

## NON-NORMATIVE

(Empty by design)

~~~
</file>

<file path="ssot/SSOT-ECONOMY-A-2215-0003.md">
~~~markdown
---
id: SSOT-ECONOMY-A-2215-0003
title: >
  Economy and Production — Scenario A (2215, SSOT State)
class: ssot
status: draft
version: 1.1.0
inputs: []
depends_on:
  - SPEC-DOC-STYLE-2215-0001
  - SSOT-SCENARIO-A-2215-0001
  - SSOT-DEMOGRAPHY-A-2215-0002
  - SSOT-AUTOMATION-A-2215-0004
scope: >
  SSOT-состояние макроэкономики мира в 2215 году (Scenario A).
  Документ содержит только декларативные метрики (core/p90/range)
  и качественные экономические состояния.
  Не содержит причинности, правил разрешения конфликтов и моделей управления.
---

## LLM-INTENT

ROLE_TYPE: STATE
SCOPE: global macroeconomic state for Scenario A around year 2215
INPUTS: []
OUTPUTS:
  - economic_metric_state
FORBIDDEN:
  - causal_logic
  - resolution_rules
  - governance_models
  - narrative_explanations

---

## DEFINITIONS

[DEF][ECO-DEF-010] economy = global production, allocation, and execution capacity under high automation and coordination.

---

## INVARIANTS

[FACT][ECO-000] Applicable only to Scenario A.
[FACT][ECO-001] Macroeconomy is treated as a production-capacity allocation system, not as a microeconomic market.
[FACT][ECO-002] Behavioral and microeconomic models are out of scope for this SSOT.

---

## CONTENT

### 1. Output and growth (state)

[STATE][ECO-010] gdp_ppp_relative_to_2025.core = 30
[STATE][ECO-011] gdp_ppp_relative_to_2025.p90 = 40
[STATE][ECO-012] gdp_ppp_relative_to_2025.range = [5, 40]
[STATE][ECO-013] gdp_ppp_relative_to_2025.unit = multiplier
[STATE][ECO-014] gdp_ppp_relative_to_2025.owner_domain = ECONOMY

[STATE][ECO-015] long_term_growth_mode = "high_stable"
[STATE][ECO-016] long_term_growth_mode.owner_domain = ECONOMY

---

### 2. Productivity and automation coupling

[STATE][ECO-020] labor_automation_percent_tasks.source = "SSOT-AUTOMATION-A-2215-0004"
[STATE][ECO-021] labor_automation_percent_tasks.owner_domain = AUTOMATION
[DECISION][ECO-022] ECONOMY SSOT MUST NOT redefine AUTOMATION-owned metrics.

[STATE][ECO-023] labor_cost_trend = "strong_decline"
[STATE][ECO-024] labor_cost_trend.owner_domain = ECONOMY

---

### 3. Production structure

[STATE][ECO-030] services_share_gdp_percent.core = null
[STATE][ECO-031] services_share_gdp_percent.p90 = 90
[STATE][ECO-032] services_share_gdp_percent.range = [60, 90]
[STATE][ECO-033] services_share_gdp_percent.unit = percent
[STATE][ECO-034] services_share_gdp_percent.owner_domain = ECONOMY

[STATE][ECO-035] production_localization_trend = "partial_relocalization"
[STATE][ECO-036] production_localization_trend.owner_domain = ECONOMY

---

### 4. Trade and distribution

[STATE][ECO-040] trade_to_gdp_percent.core = null
[STATE][ECO-041] trade_to_gdp_percent.p90 = 50
[STATE][ECO-042] trade_to_gdp_percent.range = [10, 50]
[STATE][ECO-043] trade_to_gdp_percent.unit = percent
[STATE][ECO-044] trade_to_gdp_percent.owner_domain = ECONOMY

[STATE][ECO-045] global_gini_index.core = null
[STATE][ECO-046] global_gini_index.p90 = 0.4
[STATE][ECO-047] global_gini_index.range = null
[STATE][ECO-048] global_gini_index.unit = coefficient
[STATE][ECO-049] global_gini_index.owner_domain = ECONOMY

---

### 5. Allocation and absorption (qualitative state)

[STATE][ECO-050] mandatory_output_absorption = "high"
[STATE][ECO-051] mandatory_output_absorption.owner_domain = ECONOMY

[STATE][ECO-052] free_capacity_share = "limited"
[STATE][ECO-053] free_capacity_share.owner_domain = ECONOMY

---

### 6. Administrative scarcity (state)

[STATE][ECO-060] scarcity_mode = "administrative"
[STATE][ECO-061] scarcity_mode.owner_domain = GOVERNANCE

[STATE][ECO-062] scarcity_triggers = [
  "licensing",
  "quota",
  "access_window",
  "compliance",
  "joint_access_protocol"
]
[STATE][ECO-063] scarcity_triggers.owner_domain = GOVERNANCE

---

## USAGE / RESOLUTION

[FACT][ECO-090] Provides declarative numeric ranges and qualitative macroeconomic states for downstream documents.

[FORBIDDEN][ECO-091] Using this SSOT document for:
- causal explanations of crises,
- conflict modeling,
- selecting scene or narrative modes.

---

## OUTPUT CONTRACT

~~~yaml
doc_id: SSOT-ECONOMY-A-2215-0003
role_type: STATE
export:
  - metric: gdp_ppp_relative_to_2025
    owner_domain: ECONOMY
    values: {core: 30, p90: 40, range: [5, 40]}
    unit: multiplier

  - metric: services_share_gdp_percent
    owner_domain: ECONOMY
    values: {core: null, p90: 90, range: [60, 90]}
    unit: percent

  - metric: trade_to_gdp_percent
    owner_domain: ECONOMY
    values: {core: null, p90: 50, range: [10, 50]}
    unit: percent

  - metric: global_gini_index
    owner_domain: ECONOMY
    values: {core: null, p90: 0.4, range: null}
    unit: coefficient
~~~

---

## FORBIDDEN

[FORBIDDEN][ECO-100] Introducing new economic metrics outside SSOT.
[FORBIDDEN][ECO-101] Embedding causal chains, governance logic, or resolution rules.
[FORBIDDEN][ECO-102] Treating qualitative states as narrative explanations.

---

## NON-NORMATIVE

(Empty by design)

~~~
</file>

<file path="ssot/SSOT-ENERGY-A-2215-0004.md">
~~~markdown
---
id: SSOT-ENERGY-A-2215-0004
title: >
  Energy System — Scenario A (2215, SSOT State)
class: ssot
status: draft
version: 1.1.0
inputs: []
depends_on:
  - SSOT-SCENARIO-A-2215-0001
  - SSOT-ECONOMY-A-2215-0003
scope: >
  SSOT-состояние энергетической системы мира в 2215 году (Scenario A).
  Документ содержит только декларативные метрики (core/p90/range)
  и бинарные/категориальные свойства энергосистемы.
  Не содержит причинности, процедур, сценариев отказа или разрешения конфликтов.
---

## LLM-INTENT

ROLE_TYPE: STATE
SCOPE: global energy system state for Scenario A around year 2215
INPUTS: []
OUTPUTS:
  - energy_metric_state
FORBIDDEN:
  - causal_logic
  - resolution_rules
  - narrative_explanations
  - failure_models

---

## DEFINITIONS

[DEF][ENG-DEF-010] energy_system = global generation, storage, transmission, and consumption of energy in Scenario A.

---

## INVARIANTS

[FACT][ENG-000] Applicable only to Scenario A.
[FACT][ENG-001] Energy system is treated as critical infrastructure.
[FACT][ENG-002] Fossil fuels are not the dominant energy source.
[FACT][ENG-003] Energy system does not impose a hard cap on economic growth within declared Scenario A metrics.

---

## CONTENT

### 1. Primary energy (global)

[STATE][ENG-010] primary_energy_TW.core = 30
[STATE][ENG-011] primary_energy_TW.p90 = 60
[STATE][ENG-012] primary_energy_TW.range = [20, 60]
[STATE][ENG-013] primary_energy_TW.unit = TW
[STATE][ENG-014] primary_energy_TW.owner_domain = ENERGY

---

### 2. Energy mix

[STATE][ENG-020] low_carbon_share_percent.core = 95
[STATE][ENG-021] low_carbon_share_percent.range = [90, 98]
[STATE][ENG-022] low_carbon_share_percent.unit = percent
[STATE][ENG-023] low_carbon_share_percent.owner_domain = ENERGY

[STATE][ENG-024] fossil_energy_role = "residual_niche"
[STATE][ENG-025] fossil_energy_role.owner_domain = ENERGY

[STATE][ENG-026] generation_mix_structure = "renewables + nuclear + advanced_sources"
[STATE][ENG-027] generation_mix_quantified = false
[STATE][ENG-028] generation_mix_structure.owner_domain = ENERGY

---

### 3. Energy efficiency

[STATE][ENG-030] global_energy_intensity_vs_2025.core = 0.33
[STATE][ENG-031] global_energy_intensity_vs_2025.p90 = null
[STATE][ENG-032] global_energy_intensity_vs_2025.range = null
[STATE][ENG-033] global_energy_intensity_vs_2025.unit = ratio
[STATE][ENG-034] global_energy_intensity_vs_2025.owner_domain = ENERGY

[STATE][ENG-035] system_eroei_trend = "stable_or_higher_than_2025"
[STATE][ENG-036] system_eroei_trend.owner_domain = ENERGY

---

### 4. Electrification and end use

[STATE][ENG-040] transport_electrification_percent.core = 95
[STATE][ENG-041] transport_electrification_percent.range = [90, 100]
[STATE][ENG-042] transport_electrification_percent.unit = percent
[STATE][ENG-043] transport_electrification_percent.owner_domain = ENERGY

[STATE][ENG-044] transport_automation_level.source = "SSOT-AUTOMATION-A-2215-0004"
[STATE][ENG-045] transport_automation_level.owner_domain = AUTOMATION
[DECISION][ENG-046] ENERGY SSOT MUST NOT redefine AUTOMATION-owned metrics.

[STATE][ENG-047] industry_electrification_level = "near_total"
[STATE][ENG-048] industry_electrification_level.owner_domain = ENERGY

[STATE][ENG-049] buildings_modernized_share_percent.core = 90
[STATE][ENG-050] buildings_modernized_share_percent.range = [85, 98]
[STATE][ENG-051] buildings_modernized_share_percent.unit = percent
[STATE][ENG-052] buildings_modernized_share_percent.owner_domain = URBANISM

---

### 5. Storage and grid (qualitative state)

[STATE][ENG-060] energy_storage_layer_present = true
[STATE][ENG-061] energy_storage_scope = "short_and_mid_term"
[STATE][ENG-062] energy_storage_scope.owner_domain = ENERGY

[STATE][ENG-063] grid_resilience_design = "redundant_segmented_self_healing"
[STATE][ENG-064] grid_resilience_design.owner_domain = ENERGY

---

### 6. Compute ↔ energy coupling (state only)

[STATE][ENG-070] ai_energy_share_percent.source = "SSOT-AUTOMATION-A-2215-0004"
[STATE][ENG-071] ai_energy_share_percent.owner_domain = AUTOMATION
[DECISION][ENG-072] ENERGY SSOT MUST NOT declare or export AUTOMATION-owned metrics.

---

## USAGE / RESOLUTION

[FACT][ENG-090] Provides declarative numeric ranges and qualitative energy system states for downstream documents.

[FORBIDDEN][ENG-091] Using this SSOT document for:
- failure or outage modeling,
- recovery or response procedures,
- resolving core vs p90 conflicts.

---

## OUTPUT CONTRACT

~~~yaml
doc_id: SSOT-ENERGY-A-2215-0004
role_type: STATE
export:
  - metric: primary_energy_TW
    owner_domain: ENERGY
    values: {core: 30, p90: 60, range: [20, 60]}
    unit: TW

  - metric: low_carbon_share_percent
    owner_domain: ENERGY
    values: {core: 95, p90: null, range: [90, 98]}
    unit: percent

  - metric: global_energy_intensity_vs_2025
    owner_domain: ENERGY
    values: {core: 0.33, p90: null, range: null}
    unit: ratio
~~~

---

## FORBIDDEN

[FORBIDDEN][ENG-100] Introducing new energy metrics outside SSOT.
[FORBIDDEN][ENG-101] Embedding causal chains, failure narratives, or procedures.
[FORBIDDEN][ENG-102] Using qualitative states as resolution or decision logic.

---

## NON-NORMATIVE

(Empty by design)

~~~
</file>

<file path="ssot/SSOT-GOVERNANCE-SECURITY-A-2215-0005.md">
~~~markdown
---
id: SSOT-GOVERNANCE-SECURITY-A-2215-0005
title: >
  Governance and Security — Scenario A (2215, SSOT State)
class: ssot
status: draft
version: 1.1.0
inputs: []
depends_on:
  - SSOT-SCENARIO-A-2215-0001
  - SSOT-ECONOMY-A-2215-0003
scope: >
  SSOT-состояние институтов управления, безопасности и конфликтов мира
  в 2215 году (Scenario A). Документ содержит только декларативные
  бинарные/категориальные свойства и минимальные количественные ориентиры
  (если присутствуют). Не содержит причинности, процедур, правоприменения
  или правил разрешения конфликтов.
---

## LLM-INTENT

ROLE_TYPE: STATE
SCOPE: governance and security global state for Scenario A around year 2215
INPUTS: []
OUTPUTS:
  - governance_security_state
FORBIDDEN:
  - causal_logic
  - resolution_rules
  - procedural_law
  - narrative_explanations

---

## DEFINITIONS

[DEF][GOV-DEF-010] governance = institutional contours of legitimation, regulation, and allocation.
[DEF][GOV-DEF-011] security = prevention and suppression of violence, including cyber and infrastructure threats.

---

## INVARIANTS

[FACT][GOV-000] Applicable only to Scenario A.
[FACT][GOV-001] No global world government exists.
[FACT][GOV-002] Sovereign states persist as primary political units.
[FACT][GOV-003] Classical interstate wars are not the default condition of 2215.

---

## CONTENT

### 1. States and sovereignty

[STATE][GOV-010] world_government_exists = false
[STATE][GOV-011] world_government_exists.owner_domain = GOVERNANCE

[STATE][GOV-012] sovereign_states_exist = true
[STATE][GOV-013] sovereign_states_exist.owner_domain = GOVERNANCE

[STATE][GOV-014] state_enforcement_primacy_on_territory = true
[STATE][GOV-015] state_enforcement_primacy_on_territory.owner_domain = GOVERNANCE

[STATE][GOV-016] territorial_expansion_by_war_incentive = "low"
[STATE][GOV-017] territorial_expansion_by_war_incentive.owner_domain = GOVERNANCE

---

### 2. Supranational coordination

[STATE][GOV-020] supranational_governance_mode = "treaties_standards_regimes"
[STATE][GOV-021] supranational_governance_mode.owner_domain = GOVERNANCE

[STATE][GOV-022] supranational_direct_sovereignty = false
[STATE][GOV-023] supranational_direct_sovereignty.owner_domain = GOVERNANCE

[STATE][GOV-024] supranational_coordination_domains = [
  "climate",
  "energy",
  "trade",
  "ai_safety",
  "arms_control"
]
[STATE][GOV-025] supranational_coordination_domains.owner_domain = GOVERNANCE

[STATE][GOV-026] un_successor_institutions_role = "coordination_platform"
[STATE][GOV-027] un_successor_institutions_role.owner_domain = GOVERNANCE

[STATE][GOV-028] extraterritorial_special_regimes_exist = true
[STATE][GOV-029] extraterritorial_special_regimes_exist.owner_domain = GOVERNANCE

[STATE][GOV-030] extraterritorial_regimes_state_trigger_entry = true
[STATE][GOV-031] extraterritorial_regimes_state_trigger_entry.owner_domain = GOVERNANCE

---

### 3. Algorithmic governance

[STATE][GOV-040] algorithmic_governance_prevalence = "high"
[STATE][GOV-041] algorithmic_governance_prevalence.owner_domain = GOVERNANCE

[STATE][GOV-042] government_ai_use_domains = [
  "taxation",
  "resource_allocation",
  "forecasting",
  "compliance"
]
[STATE][GOV-043] government_ai_use_domains.owner_domain = GOVERNANCE

[STATE][GOV-044] routine_governance_decisions_automation = "high"
[STATE][GOV-045] routine_governance_decisions_automation.owner_domain = GOVERNANCE

[STATE][GOV-046] human_final_authority_in_normative_decisions = true
[STATE][GOV-047] human_final_authority_in_normative_decisions.owner_domain = GOVERNANCE

[STATE][GOV-048] algorithmic_opacity_risk_profile = "material"
[STATE][GOV-049] algorithmic_opacity_risk_profile.owner_domain = SECURITY

---

### 4. Corporations and economic power

[STATE][GOV-060] systemic_corporations_exist = true
[STATE][GOV-061] systemic_corporations_exist.owner_domain = ECONOMY

[STATE][GOV-062] corporate_power_vs_mid_states = "comparable"
[STATE][GOV-063] corporate_power_vs_mid_states.owner_domain = ECONOMY

[STATE][GOV-064] corporate_sovereignty = false
[STATE][GOV-065] corporate_sovereignty.owner_domain = GOVERNANCE

[STATE][GOV-066] corporate_regulatory_subordination = true
[STATE][GOV-067] corporate_regulatory_subordination.owner_domain = GOVERNANCE

[STATE][GOV-068] mandatory_audit_transparency_compliance = true
[STATE][GOV-069] mandatory_audit_transparency_compliance.owner_domain = GOVERNANCE

[STATE][GOV-070] corporate_influence_mode = "law_contracts_standards_access"
[STATE][GOV-071] corporate_influence_mode.owner_domain = GOVERNANCE

[STATE][GOV-072] corporate_direct_force_against_state = "rare"
[STATE][GOV-073] corporate_direct_force_against_state.owner_domain = SECURITY

---

### 5. Law and enforcement (state)

[STATE][GOV-080] law_is_primary_legitimation_tool = true
[STATE][GOV-081] law_is_primary_legitimation_tool.owner_domain = GOVERNANCE

[STATE][GOV-082] automated_monitoring_and_enforcement_present = true
[STATE][GOV-083] automated_monitoring_and_enforcement_present.owner_domain = SECURITY

[STATE][GOV-084] judicial_ai_assistance_present = true
[STATE][GOV-085] judicial_ai_assistance_present.owner_domain = GOVERNANCE

[STATE][GOV-086] legal_final_decisions_by_humans = true
[STATE][GOV-087] legal_final_decisions_by_humans.owner_domain = GOVERNANCE

[STATE][GOV-088] private_security_allowed = true
[STATE][GOV-089] private_security_allowed.owner_domain = SECURITY

[STATE][GOV-090] private_security_scope = "narrow_legal_field"
[STATE][GOV-091] private_security_scope.owner_domain = SECURITY

---

### 6. Conflict and security

[STATE][GOV-100] dominant_conflict_domains = ["cyber", "economic", "legal"]
[STATE][GOV-101] dominant_conflict_domains.owner_domain = SECURITY

[STATE][GOV-102] conventional_army_clashes_frequency = "rare_limited"
[STATE][GOV-103] conventional_army_clashes_frequency.owner_domain = SECURITY

[STATE][GOV-104] conflict_mode = "asymmetric_proxy_common"
[STATE][GOV-105] conflict_mode.owner_domain = SECURITY

---

### 7. Autonomous systems and deterrence

[STATE][GOV-120] autonomous_weapons_state_use_prevalence = "high"
[STATE][GOV-121] autonomous_weapons_state_use_prevalence.owner_domain = SECURITY

[STATE][GOV-122] drone_swarm_platforms_are_military_core = true
[STATE][GOV-123] drone_swarm_platforms_are_military_core.owner_domain = SECURITY

[STATE][GOV-124] tactical_human_participation_level = "minimal"
[STATE][GOV-125] tactical_human_participation_level.owner_domain = SECURITY

[STATE][GOV-126] strategic_force_decisions_by_humans = true
[STATE][GOV-127] strategic_force_decisions_by_humans.owner_domain = GOVERNANCE

[STATE][GOV-128] corporations_are_war_sovereigns = false
[STATE][GOV-129] corporations_are_war_sovereigns.owner_domain = SECURITY

[STATE][GOV-130] corporate_force_scope = "object_security_only"
[STATE][GOV-131] corporate_force_scope.owner_domain = SECURITY

---

### 8. Cybersecurity and infrastructure security

[STATE][GOV-140] cybersecurity_centrality = "core_axis"
[STATE][GOV-141] cybersecurity_centrality.owner_domain = SECURITY

[STATE][GOV-142] primary_attack_targets = ["energy", "ai_infrastructure", "finance", "logistics"]
[STATE][GOV-143] primary_attack_targets.owner_domain = SECURITY

[STATE][GOV-144] cyber_defense_automation_level = "high"
[STATE][GOV-145] cyber_defense_automation_level.owner_domain = SECURITY

---

### 9. Arms control and AI safety

[STATE][GOV-160] autonomous_weapons_arms_control_regimes_exist = true
[STATE][GOV-161] autonomous_weapons_arms_control_regimes_exist.owner_domain = GOVERNANCE

[STATE][GOV-162] arms_control_mode = "procedural_technological"
[STATE][GOV-163] arms_control_mode.owner_domain = GOVERNANCE

[STATE][GOV-164] autonomous_weapons_total_ban = false
[STATE][GOV-165] autonomous_weapons_total_ban.owner_domain = GOVERNANCE

[STATE][GOV-166] arms_control_primary_goal = "prevent_uncontrolled_escalation_and_accidents"
[STATE][GOV-167] arms_control_primary_goal.owner_domain = GOVERNANCE

---

### 10. Internal security

[STATE][GOV-180] internal_security_stack = ["police", "ai_surveillance", "prevention"]
[STATE][GOV-181] internal_security_stack.owner_domain = SECURITY

[STATE][GOV-182] physical_crime_trend_vs_21c = "lower"
[STATE][GOV-183] physical_crime_trend_vs_21c.owner_domain = SECURITY

[STATE][GOV-184] cybercrime_significance = "high"
[STATE][GOV-185] cybercrime_significance.owner_domain = SECURITY

[STATE][GOV-186] economic_crime_significance = "high"
[STATE][GOV-187] economic_crime_significance.owner_domain = SECURITY

[STATE][GOV-188] mass_violence_and_terrorism_frequency = "rare_not_eliminated"
[STATE][GOV-189] mass_violence_and_terrorism_frequency.owner_domain = SECURITY

---

## USAGE / RESOLUTION

[FACT][GOV-900] Provides declarative governance and security state for downstream documents.

[FORBIDDEN][GOV-901] Using this SSOT document for:
- causal explanations of conflicts,
- procedural law or enforcement detail,
- escalation or war scenario modeling.

---

## OUTPUT CONTRACT

~~~yaml
doc_id: SSOT-GOVERNANCE-SECURITY-A-2215-0005
role_type: STATE
export:
  - key: world_government_exists
    value: false
    owner_domain: GOVERNANCE

  - key: supranational_governance_mode
    value: treaties_standards_regimes
    owner_domain: GOVERNANCE

  - key: algorithmic_governance_prevalence
    value: high
    owner_domain: GOVERNANCE

  - key: dominant_conflict_domains
    value: [cyber, economic, legal]
    owner_domain: SECURITY

  - key: cybersecurity_centrality
    value: core_axis
    owner_domain: SECURITY
~~~

---

## FORBIDDEN

[FORBIDDEN][GOV-990] Introducing new world metrics or numeric claims.
[FORBIDDEN][GOV-991] Embedding causal chains or operational procedures.
[FORBIDDEN][GOV-992] Using governance or security state as narrative directive.

---

## NON-NORMATIVE

(Empty by design)

~~~
</file>

<file path="ssot/SSOT-LAW-A-2215-0008.md">
~~~markdown
---
id: SSOT-LAW-A-2215-0008
title: >
  Law & Correction System — 2215 (Crime Mechanics)
class: ssot
status: fixed
version: 1.1.0
scope: >
  Механика преступлений, иерархия санкций (от штрафа до Неплатежеспособности)
  и принципы Алгократии.
  Закрывает UNK-2215-0009, UNK-2215-0010.
inputs: []
depends_on: []
---

## LLM-INTENT

ROLE_TYPE: STATE
SCOPE: mechanics of crime, tiered punishment logic, insolvency protocols.
INPUTS: []
OUTPUTS: [crime_typology, punishment_hierarchy, insolvency_rules]
FORBIDDEN: [prison_tropes, moral_judgements, death_penalty_as_ritual]

## DEFINITIONS

[FACT][LAW-DEF-010] Algocracy = система, где тяжесть наказания рассчитывается как сумма экономического ущерба (Restitution Value).
[FACT][LAW-DEF-011] Correctional Debt = юридическое обязательство возместить ущерб трудом (Tier 1).
[FACT][LAW-DEF-012] Insolvency (Неплатежеспособность) = состояние, когда сумма долга (ущерба) превышает пожизненный потенциал заработка субъекта.

## INVARIANTS

[DECISION][LAW-INV-010] Prisons (passive confinement) are abolished due to economic inefficiency.
[DECISION][LAW-INV-011] Punishment MUST generate value. Passive incarceration generates zero value.
[DECISION][LAW-INV-012] Human life is an asset; Murder is the destruction of a high-value asset.

## CONTENT

### 1. Typology of Crime (The Hierarchy of Damage)

[STATE][LAW-CRIME-010] crime.tier_1 = Protocol_Violation (Jaywalking, minor scheduling errors, noise).
[STATE][LAW-CRIME-011] crime.tier_2 = Resource_Theft (Quota fraud, petty theft, vandalism, smuggling).
[STATE][LAW-CRIME-012] crime.tier_3 = Asset_Destruction (Murder, arson, massive sabotage, rape).

### 2. Tier 1: Automated Fines (Micro-Correction)

[STATE][LAW-PUN-010] tier_1.response = Instant_Debit.
[STATE][LAW-PUN-011] tier_1.impact = Reduction of daily luxury quota (less coffee, slower bandwidth).
[STATE][LAW-PUN-012] tier_1.record = Expunged immediately upon payment.

### 3. Tier 2: Correctional Debt (Labor)

[STATE][LAW-PUN-020] tier_2.trigger = Damage exceeds instant liquidity of the subject.
[STATE][LAW-PUN-021] tier_2.method = Debt_Assignment + Privilege_Block.
[STATE][LAW-PUN-022] tier_2.conditions = Home detention (smart lock), caloric minimum, garnishing 100% of excess income.
[STATE][LAW-PUN-023] tier_2.logic = "You maintain your current job, but work effectively for free until restitution is complete."

### 4. Tier 3: Insolvency Protocol (The "Life Sentence")

[STATE][LAW-PUN-030] tier_3.trigger = Debt > Projected_Lifetime_Earnings (e.g., Murder cost ≈ 40M+ credits).
[STATE][LAW-PUN-031] tier_3.status = Insolvency (Bankrupt Life / Ward of State).
[STATE][LAW-PUN-032] tier_3.assignment = Indefinite Hazardous Duty (High-Risk/High-Yield labor).
[STATE][LAW-PUN-033] tier_3.examples = [Reactor core manual cleaning, Toxic filter replacement, Outer shell repair during storms].
[STATE][LAW-PUN-034] tier_3.logic = Only high-risk labor pays enough to service the interest on a "Murder Debt".

### 5. Aggression Control (Neuro-Correction)

[STATE][LAW-BIO-040] mechanism = Mandatory Pharmacological Damper.
[STATE][LAW-BIO-041] usage = Applied to subjects with impulse control issues (Assault/Violence) *in addition* to Debt.
[STATE][LAW-BIO-042] effect = Chemically blocks adrenaline spikes; induces nausea upon aggression.
[STATE][LAW-BIO-043] oversight = Requires Human Tribunal signature.

## USAGE / RESOLUTION

[DECISION][LAW-USE-010] Characters DO NOT fear "jail". They fear "insolvency" (being sent to the Zones).
[DECISION][LAW-USE-011] Justice is discussed in accounting terms ("balance," "amortization," "net loss").
[DECISION][LAW-USE-012] Tier 3 sentencing requires a human judge to sign off on the "Asset Write-down".

## OUTPUT CONTRACT

~~~yaml
doc_id: SSOT-LAW-A-2215-0008
role_type: STATE
export:
  - metric: punishment.murder
    owner_domain: LAW
    values:
      core: Insolvency (Hazardous Labor)
  - metric: punishment.assault
    owner_domain: LAW
    values:
      core: Neuro-Correction + Debt
  - metric: prison.status
    owner_domain: LAW
    values:
      core: abolished
~~~

## FORBIDDEN

[FORBIDDEN][LAW-FBD-010] Courtrooms with juries (too expensive/slow).
[FORBIDDEN][LAW-FBD-011] Execution as a ritual (waste of labor potential).
[FORBIDDEN][LAW-FBD-012] Moralizing about "evil" in legal texts. The system cares about "damage".
[FORBIDDEN][LAW-FBD-013] Cannibalism or "Soylent Green" scenarios (people are workers, not food).

## NON-NORMATIVE

~~~markdown
Example: "He killed a Level-5 engineer. His lifetime projection is only 2 million credits.
The engineer was worth 40 million. He is being assigned to Sector 4 radiation cleanup indefinitely."
~~~
~~~
</file>

<file path="ssot/SSOT-LIFE-A-2215-0007.md">
~~~markdown
---
id: SSOT-LIFE-A-2215-0007
title: >
  Life, Body, and Daily Reality — Scenario A (2215, SSOT State)
class: ssot
status: draft
version: 1.1.0
inputs: []
depends_on:
  - SSOT-SCENARIO-A-2215-0001
  - SSOT-DEMOGRAPHY-A-2215-0002
  - SSOT-ECONOMY-A-2215-0003
  - SPEC-QUALITATIVE-ENUMS-2215-0001
scope: >
  SSOT-состояние повседневной жизни, телесности и социально-технологической
  реальности человека в 2215 году (Scenario A). Документ содержит только
  декларативные бинарные/категориальные свойства и минимальные количественные
  ориентиры (если есть). Не содержит причинности, процедур, нормативных
  предписаний или narrative-логики.
---

## LLM-INTENT

ROLE_TYPE: STATE
SCOPE: human daily life and body-related state for Scenario A around year 2215
INPUTS: []
OUTPUTS:
  - life_state
FORBIDDEN:
  - causal_logic
  - resolution_rules
  - narrative_explanations
  - feedback_loops

---

## DEFINITIONS

[DEF][LIF-DEF-010] life = everyday practices, access to services, privacy regimes, and cultural norms.
[DEF][LIF-DEF-011] body = health, medicine, therapeutic augmentation, and human biological limits.

---

## INVARIANTS

[FACT][LIF-000] Applicable only to Scenario A.
[FACT][LIF-001] Human biological and psychological constraints persist.
[FACT][LIF-002] No default radical post-human discontinuity.
[FACT][LIF-003] No mass immortality.

---

## CONTENT

### 1. Health and longevity

[STATE][LIF-010] life_expectancy_years.core = 100
[STATE][LIF-011] life_expectancy_years.range = [95, 110]
[STATE][LIF-012] life_expectancy_years.unit = years
[STATE][LIF-013] life_expectancy_years.owner_domain = LIFE

[STATE][LIF-014] longevity_mode = "prevention_and_chronic_management"
[STATE][LIF-015] longevity_mode.owner_domain = LIFE

[STATE][LIF-016] medical_care_personalization = "high"
[STATE][LIF-017] medical_care_personalization.owner_domain = LIFE

[STATE][LIF-018] medical_automation_level = "high"
[STATE][LIF-019] medical_automation_level.owner_domain = AUTOMATION

[STATE][LIF-020] robotic_surgery_is_standard = true
[STATE][LIF-021] robotic_surgery_is_standard.owner_domain = LIFE

[STATE][LIF-022] ai_diagnostics_is_standard = true
[STATE][LIF-023] ai_diagnostics_is_standard.owner_domain = LIFE

[STATE][LIF-024] primary_mortality_shift = "late_ages"
[STATE][LIF-025] primary_mortality_shift.owner_domain = LIFE

---

### 2. Augmentation and limits

[STATE][LIF-030] therapeutic_augmentation_prevalence = "common"
[STATE][LIF-031] therapeutic_augmentation_prevalence.owner_domain = LIFE

[STATE][LIF-032] enhancement_augmentation_prevalence = "rare_socially_limited"
[STATE][LIF-033] enhancement_augmentation_prevalence.owner_domain = GOVERNANCE

[STATE][LIF-034] cognitive_implants_prevalence = "niche_professional"
[STATE][LIF-035] cognitive_implants_prevalence.owner_domain = LIFE

[STATE][LIF-036] radical_body_modification_norm = false
[STATE][LIF-037] radical_body_modification_norm.owner_domain = LIFE

---

### 3. Perception, AR/VR, and media

[STATE][LIF-040] ar_interfaces_daily_use = true
[STATE][LIF-041] ar_interfaces_daily_use.owner_domain = LIFE

[STATE][LIF-042] ar_device_forms = ["wearable", "implantable"]
[STATE][LIF-043] ar_device_forms.owner_domain = LIFE

[STATE][LIF-044] vr_widespread_use = true
[STATE][LIF-045] vr_widespread_use.owner_domain = LIFE

[STATE][LIF-046] vr_full_immersion_is_dominant_lifestyle = false
[STATE][LIF-047] vr_full_immersion_is_dominant_lifestyle.owner_domain = LIFE

[STATE][LIF-048] vr_primary_use_cases = ["work", "education", "therapy", "entertainment"]
[STATE][LIF-049] vr_primary_use_cases.owner_domain = LIFE

---

### 4. Work, time, and meaning

[STATE][LIF-060] routine_human_labor_necessity = "low"
[STATE][LIF-061] routine_human_labor_necessity.owner_domain = ECONOMY

[STATE][LIF-062] work_as_primary_identity_norm = false
[STATE][LIF-063] work_as_primary_identity_norm.owner_domain = LIFE

[STATE][LIF-064] common_human_activity_domains = [
  "creative",
  "care",
  "education",
  "governance",
  "civic_activity"
]
[STATE][LIF-065] common_human_activity_domains.owner_domain = LIFE

[STATE][LIF-066] basic_material_needs_provision_mode = "decoupled_from_labor_market"
[STATE][LIF-067] basic_material_needs_provision_mode.owner_domain = ECONOMY

[STATE][LIF-068] meaning_identity_crisis_prevalence = "present_nonzero"
[STATE][LIF-069] meaning_identity_crisis_prevalence.owner_domain = LIFE

---

### 5. Education and cognition

[STATE][LIF-080] lifelong_education_norm = true
[STATE][LIF-081] lifelong_education_norm.owner_domain = LIFE

[STATE][LIF-082] ai_tutors_are_standard = true
[STATE][LIF-083] ai_tutors_are_standard.owner_domain = LIFE

[STATE][LIF-084] knowledge_access_mode = "near_universal"
[STATE][LIF-085] knowledge_access_mode.owner_domain = GOVERNANCE

[STATE][LIF-086] diplomas_vs_competence_signal = "competence_over_diplomas"
[STATE][LIF-087] diplomas_vs_competence_signal.owner_domain = GOVERNANCE

---

### 6. Social structure and inequality (everyday)

[STATE][LIF-100] inequality_primary_dimensions = ["space", "privacy", "augmentations"]
[STATE][LIF-101] inequality_primary_dimensions.owner_domain = ECONOMY

[STATE][LIF-102] extreme_material_poverty_exists = false
[STATE][LIF-103] extreme_material_poverty_exists.owner_domain = ECONOMY

[STATE][LIF-104] everyday_status_differences_mode = "cultural_status_not_existential"
[STATE][LIF-105] everyday_status_differences_mode.owner_domain = LIFE

---

### 7. Surveillance, privacy, and autonomy

[STATE][LIF-120] ubiquitous_digital_surveillance = true
[STATE][LIF-121] ubiquitous_digital_surveillance.owner_domain = SECURITY

[STATE][LIF-122] surveillance_operation_mode = "automated_procedural"
[STATE][LIF-123] surveillance_operation_mode.owner_domain = SECURITY

[STATE][LIF-124] privacy_mode = "regulated_contractual"
[STATE][LIF-125] privacy_mode.owner_domain = GOVERNANCE

[STATE][LIF-126] surveillance_social_acceptance = "high"
[STATE][LIF-127] surveillance_social_acceptance.owner_domain = LIFE

[STATE][LIF-128] full_anonymity_availability = "limited_legal_regimes"
[STATE][LIF-129] full_anonymity_availability.owner_domain = GOVERNANCE

---

### 8. Culture, norms, and values

[STATE][LIF-140] cultural_orientation = ["sustainability", "security", "rationality"]
[STATE][LIF-141] cultural_orientation.owner_domain = LIFE

[STATE][LIF-142] extremist_ideologies_prevalence = "marginal"
[STATE][LIF-143] extremist_ideologies_prevalence.owner_domain = SECURITY

[STATE][LIF-144] social_norms_emphasis = ["responsibility", "compliance", "long_term_thinking"]
[STATE][LIF-145] social_norms_emphasis.owner_domain = GOVERNANCE

---

## USAGE / RESOLUTION

[FACT][LIF-900] Provides declarative LIFE and BODY state for downstream documents.

[FORBIDDEN][LIF-901] Using this SSOT document for:
- causal explanations of social behavior,
- selecting scene “tone” or aesthetics,
- feedback-loop or governance logic.

---

## OUTPUT CONTRACT

~~~yaml
doc_id: SSOT-LIFE-A-2215-0007
role_type: STATE
export:
  - metric: life_expectancy_years
    owner_domain: LIFE
    values:
      core: 100
      p90: null
      range: [95, 110]
    unit: years

  - key: therapeutic_augmentation_prevalence
    value: common
    owner_domain: LIFE

  - key: ubiquitous_digital_surveillance
    value: true
    owner_domain: SECURITY

  - key: privacy_mode
    value: regulated_contractual
    owner_domain: GOVERNANCE

  - key: ar_interfaces_daily_use
    value: true
    owner_domain: LIFE
~~~

---

## FORBIDDEN

[FORBIDDEN][LIF-990] Introducing new world metrics or numeric claims outside SSOT.
[FORBIDDEN][LIF-991] Embedding causal chains, loops, or normative prescriptions.
[FORBIDDEN][LIF-992] Treating LIFE state as narrative directive.

---

## NON-NORMATIVE

(Empty by design)

~~~
</file>

<file path="ssot/SSOT-LOC-WEATHER-CHELNY-2215-0001.md">
~~~markdown
---
id: SSOT-LOC-WEATHER-CHELNY-2215-0001
title: >
  RU 2215 — Набережные Челны: Погодный режим (дефолты) — Scene-Consumed SSOT
class: ssot
status: draft
version: 0.1.0
prefix: CHW
doc_language: ru-RU
prose_language: ru-RU
inputs: []
depends_on:
  - SPEC-DOC-STYLE-2215-0001
scope: >
  Декларативные SSOT-метрики погодного режима для сцен в Набережных Челнах (2215).
  Документ предназначен для потребления генератором прозы как дефолт и не содержит
  причинности, объяснений, клише-ограничений или нарративной логики.
---

## LLM-INTENT

ROLE_TYPE: STATE
SCOPE: scene-consumed default weather metrics for Chelny-2215 (declarative only)
INPUTS: []
OUTPUTS: [weather_metrics]
FORBIDDEN: [causality, narrative_explanations, noir_tropes, utopia_sterility, implicit_overrides]

## DEFINITIONS

[FACT][CHW-010] `weather_profile` = набор метрик погодного режима, потребляемый сценой как дефолт.
[FACT][CHW-020] `scene_consumed` = документ, чьи exports используются генератором прозы как дефолтные ограничения.

## INVARIANTS

[DECISION][CHW-030] Этот документ экспортирует только STATE-метрики; любая интерпретация “почему так” FORBIDDEN.
[DECISION][CHW-031] Переопределение метрик `weather_profile` допускается только через Override/Scene по правилам приоритета корпуса.

## CONTENT

[STATE][CHW-040] chelny.weather_profile.mode = SOFT_GREY_COMFORT.
[STATE][CHW-041] chelny.weather_profile.sky_texture = TEXTURED_CONCRETE.
[STATE][CHW-042] chelny.weather_profile.temperature_c = [22, 24].
[STATE][CHW-043] chelny.weather_profile.wind = WARM_LIGHT_BREEZE.
[STATE][CHW-044] chelny.weather_profile.vibe = DECEPTIVE_CALM.

## USAGE / RESOLUTION

[DECISION][CHW-050] Любая сцена в RU-16/Челны MUST использовать `chelny.weather_profile.*` как дефолт, если не активирован явный инцидентный контур.
[FORBIDDEN][CHW-051] Подмена дефолтов на “постоянный дождь/мрак/кислотный неон” без явного Override/Scene.

## OUTPUT CONTRACT

~~~yaml
doc_id: SSOT-LOC-WEATHER-CHELNY-2215-0001
role_type: STATE
export:
  - metric: chelny.weather_profile.mode
    owner_domain: URBANISM
    values: { core: SOFT_GREY_COMFORT, p90: none, range: none }
    unit: none
  - metric: chelny.weather_profile.sky_texture
    owner_domain: URBANISM
    values: { core: TEXTURED_CONCRETE, p90: none, range: none }
    unit: none
  - metric: chelny.weather_profile.temperature_c
    owner_domain: URBANISM
    values: { core: none, p90: none, range: [22, 24] }
    unit: C
  - metric: chelny.weather_profile.wind
    owner_domain: URBANISM
    values: { core: WARM_LIGHT_BREEZE, p90: none, range: none }
    unit: none
  - metric: chelny.weather_profile.vibe
    owner_domain: URBANISM
    values: { core: DECEPTIVE_CALM, p90: none, range: none }
    unit: none
~~~

## FORBIDDEN

[FORBIDDEN][CHW-900] Добавление причинности/объяснений в этот документ.
[FORBIDDEN][CHW-901] Использование неэкспортируемых фрагментов как источника правил или фактов.
[FORBIDDEN][CHW-902] Введение новых погодных метрик без явного расширения OUTPUT CONTRACT.

## NON-NORMATIVE

~~~
</file>

<file path="ssot/SSOT-SCENARIO-A-2215-0001.md">
~~~markdown
---
id: SSOT-SCENARIO-A-2215-0001
title: >
  Scenario A — Macro World State for 2215 (SSOT)
class: ssot
status: draft
version: 1.0.0
prefix: SCNA
doc_language: ru-RU
prose_language: ru-RU
inputs: []
depends_on: [SPEC-DOC-STYLE-2215-0001]
scope: >
  Каноническое SSOT-описание Scenario A как единственного допустимого
  макро-состояния мира к ~2215. Документ содержит только декларативные
  утверждения о состоянии мира и допустимых диапазонах метрик.
---

## LLM-INTENT

ROLE_TYPE: STATE
SCOPE: canonical macro world state for Scenario A in year ~2215
INPUTS: []
OUTPUTS: [metric_state]
FORBIDDEN: [resolution_logic, narrative_usage, priority_rules, causal_explanations]

## DEFINITIONS

- Scenario A — кооперативная техно-оптимистическая траектория глобального развития,
  зафиксированная как единственная допустимая ветка мира 2215.

## INVARIANTS

- [FACT][SCNA-000] Scenario A является единственным допустимым сценарием
  макро-эволюции мира в корпусе 2215.

- [FACT][SCNA-001] Все downstream-документы ОБЯЗАНЫ использовать только
  метрики и диапазоны, объявленные в данном документе или в доменных SSOT.

## CONTENT

### 1. Scenario Identity

- [STATE][SCNA-010] scenario_id = "A"
- [STATE][SCNA-011] scenario_name = "Cooperative Techno-optimism"
- [STATE][SCNA-012] scenario_confidence_estimate_percent ≈ 25
- [STATE][SCNA-013] scenario_owner_domain = SCENARIO

### 2. Global Qualitative State (2215)

- [STATE][SCNA-020] global_cooperation_level = "high"
- [STATE][SCNA-021] global_technological_progress_continuity = true
- [STATE][SCNA-022] automation_scaling_mode = "systemic_global"
- [STATE][SCNA-023] climate_policy_persistence = "long_term_strict"
- [STATE][SCNA-024] global_warfare_norm = false

### 3. Population and Society

- [STATE][SCNA-030] population_billion.core = 8.8
- [STATE][SCNA-031] population_billion.range = [8.0, 9.5]
- [STATE][SCNA-032] population_billion.unit = billion
- [STATE][SCNA-033] population_billion.owner_domain = DEMOGRAPHY

- [STATE][SCNA-034] life_expectancy_years.core = 100
- [STATE][SCNA-035] life_expectancy_years.range = [95, 110]
- [STATE][SCNA-036] life_expectancy_years.unit = years
- [STATE][SCNA-037] life_expectancy_years.owner_domain = LIFE

### 4. Energy and Climate

- [STATE][SCNA-040] primary_energy_TW.core = 30
- [STATE][SCNA-041] primary_energy_TW.p90 = 60
- [STATE][SCNA-042] primary_energy_TW.unit = TW
- [STATE][SCNA-043] primary_energy_TW.owner_domain = ENERGY

- [STATE][SCNA-044] low_carbon_share_percent.core = 95
- [STATE][SCNA-045] low_carbon_share_percent.range = [90, 98]
- [STATE][SCNA-046] low_carbon_share_percent.unit = percent
- [STATE][SCNA-047] low_carbon_share_percent.owner_domain = ENERGY

- [STATE][SCNA-048] warming_C_vs_preindustrial.core = 2.5
- [STATE][SCNA-049] warming_C_vs_preindustrial.range = [2.0, 2.8]
- [STATE][SCNA-050] warming_C_vs_preindustrial.unit = C
- [STATE][SCNA-051] warming_C_vs_preindustrial.owner_domain = CLIMATE

- [STATE][SCNA-052] sea_level_m.core = 1.7
- [STATE][SCNA-053] sea_level_m.range = [1.2, 2.2]
- [STATE][SCNA-054] sea_level_m.unit = m
- [STATE][SCNA-055] sea_level_m.owner_domain = CLIMATE

### 5. Economy

- [STATE][SCNA-060] gdp_ppp_relative_to_2025.core = 30
- [STATE][SCNA-061] gdp_ppp_relative_to_2025.p90 = 40
- [STATE][SCNA-062] gdp_ppp_relative_to_2025.unit = multiplier
- [STATE][SCNA-063] gdp_ppp_relative_to_2025.owner_domain = ECONOMY

- [STATE][SCNA-064] global_gini_index.p90 = 0.4
- [STATE][SCNA-065] global_gini_index.unit = coefficient
- [STATE][SCNA-066] global_gini_index.owner_domain = ECONOMY

### 6. AI and Automation

- [STATE][SCNA-070] labor_automation_percent_tasks.core = 80
- [STATE][SCNA-071] labor_automation_percent_tasks.p90 = 90
- [STATE][SCNA-072] labor_automation_percent_tasks.unit = percent
- [STATE][SCNA-073] labor_automation_percent_tasks.owner_domain = AUTOMATION

- [STATE][SCNA-074] ai_compute_EJ_per_year.core = 75
- [STATE][SCNA-075] ai_compute_EJ_per_year.p90 = 200
- [STATE][SCNA-076] ai_compute_EJ_per_year.unit = EJ_per_year
- [STATE][SCNA-077] ai_compute_EJ_per_year.owner_domain = AUTOMATION

## USAGE / RESOLUTION

- [FACT][SCNA-090] Данный документ предоставляет допустимые значения и диапазоны
  метрик для downstream-документов.

- [FORBIDDEN][SCNA-091] Использование данного документа для:
  - выбора core vs p90;
  - задания приоритетов сцен;
  - разрешения конфликтов между доменами.

## OUTPUT CONTRACT

~~~yaml
doc_id: SSOT-SCENARIO-A-2215-0001
role_type: STATE
export:
  - metric: population_billion
    owner_domain: DEMOGRAPHY
    values:
      core: 8.8
      p90: null
      range: [8.0, 9.5]
    unit: billion

  - metric: primary_energy_TW
    owner_domain: ENERGY
    values:
      core: 30
      p90: 60
      range: null
    unit: TW

  - metric: ai_compute_EJ_per_year
    owner_domain: AUTOMATION
    values:
      core: 75
      p90: 200
      range: null
    unit: EJ_per_year
~~~

---

## FORBIDDEN

- [FORBIDDEN][SCNA-100] Introducing new metrics not declared in SSOT.
- [FORBIDDEN][SCNA-101] Embedding causal logic or scenario comparison.
- [FORBIDDEN][SCNA-102] Using this document as narrative directive.

## NON-NORMATIVE

(Empty by design)

~~~
</file>

<file path="ssot/SSOT-SPACE-INDUSTRY-A-2215-0006.md">
~~~markdown
---
id: SSOT-SPACE-INDUSTRY-A-2215-0006
title: >
  Space Industry and Orbital Infrastructure — Scenario A (2215, SSOT State)
class: ssot
status: draft
version: 1.0.0
inputs:
  - REG-TECH-2215-0001
  - SSOT-SCENARIO-A-2215-0001
  - SSOT-ECONOMY-A-2215-0003
depends_on:
  - SPEC-DOC-STYLE-2215-0001
scope: >
  Каноническое SSOT-состояние космической индустрии и орбитальной
  инфраструктуры мира в 2215 году в рамках Scenario A: масштабы,
  функции, население, роль в экономике и системные ограничения.
  Документ содержит только декларативные числовые и категориальные состояния.
---

## LLM-INTENT

ROLE_TYPE: STATE
SCOPE: space industry and orbital infrastructure state for Scenario A in year ~2215
INPUTS: []
OUTPUTS: [space_industry_state]
FORBIDDEN: [causal_logic, resolution_rules, narrative_explanations, colonization_epics]

---

## DEFINITIONS

- Space industry — производственные, логистические и сервисные контуры,
  обеспечивающие орбитальную/цислунарную инфраструктуру.
- Orbital infrastructure — спутники, платформы, узлы связи/навигации/наблюдения,
  обслуживаемые и заменяемые индустриальными контурами.

---

## INVARIANTS

- [FACT][SPI-000] Документ применим только в рамках Scenario A.
- [FACT][SPI-001] Космос является инфраструктурным продолжением земной экономики,
  а не автономной цивилизацией.
- [FACT][SPI-002] Массовой космической колонизации не произошло.

---

## CONTENT

### 1. Presence and Population (Orbital / Cislunar)

- [STATE][SPI-010] offworld_permanent_population.core = 50000
- [STATE][SPI-011] offworld_permanent_population.range = [20000, 100000]
- [STATE][SPI-012] offworld_permanent_population.unit = persons
- [STATE][SPI-013] offworld_permanent_population.owner_domain = SPACE-INDUSTRY

- [STATE][SPI-014] offworld_presence_primary_zones = ["LEO", "GEO_nodes", "cislunar"]
- [STATE][SPI-015] offworld_presence_zones_owner_domain = SPACE-INDUSTRY

- [STATE][SPI-016] lunar_presence_mode = "industrial_scientific_not_mass_settlement"
- [STATE][SPI-017] lunar_presence_owner_domain = SPACE-INDUSTRY

---

### 2. Core Functions (Qualitative Set)

- [STATE][SPI-020] space_industry_core_functions = [
    "orbital_infrastructure_build_and_service",
    "limited_extraterrestrial_resource_processing",
    "niche_orbital_energy_support",
    "microgravity_vacuum_experiments"
  ]
- [STATE][SPI-021] space_functions_owner_domain = SPACE-INDUSTRY

---

### 3. Economic Role

- [STATE][SPI-030] space_industry_is_dominant_sector = false
- [STATE][SPI-031] space_industry_dominance_owner_domain = ECONOMY

- [STATE][SPI-032] space_economy_gdp_share_percent = "low_single_digit"
- [STATE][SPI-033] space_gdp_share_owner_domain = ECONOMY

- [STATE][SPI-034] primary_value_to_earth_infrastructure = ["communications", "navigation", "observation", "security_support"]
- [STATE][SPI-035] primary_value_owner_domain = SPACE-INDUSTRY

---

### 4. Automation and Labor

- [STATE][SPI-040] space_operations_automation_level = "very_high"
- [STATE][SPI-041] space_automation_owner_domain = AUTOMATION

- [STATE][SPI-042] dominant_operational_agents = ["robots", "drones", "autonomous_systems"]
- [STATE][SPI-043] dominant_agents_owner_domain = AUTOMATION

- [STATE][SPI-044] human_roles_in_space = ["supervision", "repair", "nonstandard_decisions", "science"]
- [STATE][SPI-045] human_roles_owner_domain = SPACE-INDUSTRY

- [STATE][SPI-046] human_access_mode = "specialized_training_and_clearance"
- [STATE][SPI-047] human_access_owner_domain = GOVERNANCE

---

### 5. Logistics and Transport

- [STATE][SPI-060] space_logistics_transport_mode = ["reusable_systems", "autonomous_tugs"]
- [STATE][SPI-061] space_transport_owner_domain = SPACE-INDUSTRY

- [STATE][SPI-062] inter_node_cargo_movement_automation = "high"
- [STATE][SPI-063] inter_node_cargo_automation_owner_domain = AUTOMATION

- [STATE][SPI-064] launch_cost_constraint_level = "material"
- [STATE][SPI-065] launch_cost_constraint_owner_domain = ECONOMY

---

### 6. Governance and Control

- [STATE][SPI-080] space_activity_regulation_mode = "international_regimes_and_treaties"
- [STATE][SPI-081] space_regulation_owner_domain = GOVERNANCE

- [STATE][SPI-082] space_sovereign_state_exists = false
- [STATE][SPI-083] space_sovereignty_owner_domain = GOVERNANCE

- [STATE][SPI-084] actors_in_space = ["states", "corporations"]
- [STATE][SPI-085] actors_in_space_owner_domain = GOVERNANCE

- [STATE][SPI-086] access_basis = ["licenses", "supranational_agreements"]
- [STATE][SPI-087] access_basis_owner_domain = GOVERNANCE

- [STATE][SPI-088] space_militarization_level = "limited_not_eliminated"
- [STATE][SPI-089] space_militarization_owner_domain = SECURITY

---

### 7. Constraints and Limits (State)

- [STATE][SPI-100] scaling_constraints = ["logistics_cost", "radiation_risk", "life_support_complexity"]
- [STATE][SPI-101] scaling_constraints_owner_domain = SPACE-INDUSTRY

- [STATE][SPI-102] space_is_mass_migration_destination = false
- [STATE][SPI-103] space_migration_owner_domain = DEMOGRAPHY

- [STATE][SPI-104] project_filter = "economic_viability"
- [STATE][SPI-105] project_filter_owner_domain = ECONOMY

---

## USAGE / RESOLUTION

- [FACT][SPI-900] Документ предоставляет декларативные свойства космической индустрии
  и орбитальной инфраструктуры для downstream-документов.

- [FORBIDDEN][SPI-901] Использование данного документа для:
  - построения причинных цепочек и “почему так сложилось”,
  - описания операционных процедур или протоколов доступа,
  - романтизации колонизации как доминирующей нормы.

---

## OUTPUT CONTRACT

~~~yaml
doc_id: SSOT-SPACE-INDUSTRY-A-2215-0006
role_type: STATE
export:
  - metric: offworld_permanent_population
    owner_domain: SPACE-INDUSTRY
    values:
      core: 50000
      p90: null
      range: [20000, 100000]
    unit: persons

  - key: offworld_presence_primary_zones
    value: [LEO, GEO_nodes, cislunar]
    owner_domain: SPACE-INDUSTRY

  - key: space_economy_gdp_share_percent
    value: low_single_digit
    owner_domain: ECONOMY

  - key: space_operations_automation_level
    value: very_high
    owner_domain: AUTOMATION

  - key: space_militarization_level
    value: limited_not_eliminated
    owner_domain: SECURITY
~~~

---

## FORBIDDEN

- [FORBIDDEN][SPI-990] Introducing new world metrics or numeric claims outside SSOT.
- [FORBIDDEN][SPI-991] Embedding causal chains or procedural logic.
- [FORBIDDEN][SPI-992] Treating space industry state as narrative directive.

---

## NON-NORMATIVE

(Empty by design)

~~~
</file>

<file path="ssot/SSOT-URBANISM-A-2215-0007.md">
~~~markdown
---
id: SSOT-URBANISM-A-2215-0007
title: >
  Urbanism and City Systems — Scenario A (2215, SSOT State)
class: ssot
status: fixed
version: 1.1.0
inputs:
  - SSOT-SCENARIO-A-2215-0001
  - SSOT-DEMOGRAPHY-A-2215-0002
  - BASELINE-PHYSICAL_LEVEL_MID-2215-0001
depends_on:
  - SPEC-DOC-STYLE-2215-0001
scope: >
  Каноническое SSOT-состояние городской среды и систем агломераций
  в 2215 году в рамках Scenario A: морфология, инфраструктуры, транспорт,
  сенсорная среда, управление и визуальный код.
---

## LLM-INTENT

ROLE_TYPE: STATE
SCOPE: urban systems state for Scenario A in year ~2215 (LEVEL-MID defaults)
INPUTS: []
OUTPUTS: [urbanism_state, visual_code]
FORBIDDEN: [causal_logic, resolution_rules, narrative_explanations, feedback_loops]

## DEFINITIONS

[FACT][URB-DEF-010] Urbanism = морфология расселения и эксплуатационные режимы городской “машины”.
[FACT][URB-DEF-011] City systems = критические инфраструктуры и их стандартные поведенческие режимы.

## INVARIANTS

[DECISION][URB-INV-010] Документ применим только в рамках Scenario A.
[DECISION][URB-INV-011] Город трактуется как инфраструктурная машина жизнеобеспечения.
[DECISION][URB-INV-012] Базовой формой расселения являются агломерации высокой плотности.
[DECISION][URB-INV-013] Городская среда по умолчанию находится в 24/7 функциональном режиме.
[DECISION][URB-INV-020] `urban_population_share_percent` is owned and exported ONLY by this document (owner_domain = URBANISM).

## CONTENT

### 1. Urbanization Level and Dominant Form

[STATE][URB-010] urban_population_share_percent.core = 82
[STATE][URB-011] urban_population_share_percent.range = [80, 85]
[STATE][URB-012] dominant_settlement_form = "large_agglomerations_and_metapolises"
[STATE][URB-013] typical_urban_fabric_density = "high"
[STATE][URB-014] verticalization_norm = true
[STATE][URB-015] low_density_suburbia_dominant = false

### 2. City Morphology (Built Form)

[STATE][URB-030] mass_built_form = "modular"
[STATE][URB-031] mixed_use_blocks_prevalence = "high"
[STATE][URB-032] urban_fabric_optimized_for = ["logistics", "maintenance", "energy_efficiency"]
[STATE][URB-033] architectural_uniqueness = "present_not_mass_norm"

### 3. Green and Open Space

[STATE][URB-050] green_space_role = "infrastructure_function" (biomass, oxygen).
[STATE][URB-051] green_elements_integration = ["buildings", "transport_corridors"].
[STATE][URB-052] parks_as_voids_dominant = false (integrated greenery preferred).

### 4. Infrastructure Baseline (LEVEL-MID)

[STATE][URB-070] city_energy_service = "stable_continuous".
[STATE][URB-071] infrastructure_resilience = "redundant_self_healing".
[STATE][URB-072] water_service_continuity = true.
[STATE][URB-073] air_filtration_microclimate_layer = present.

### 5. Maintenance and Service Layer

[STATE][URB-090] city_maintenance_mode = "autonomous_background".
[STATE][URB-091] city_operations_telemetry = "continuous".
[STATE][URB-092] service_agents = ["robots", "drones"].
[STATE][URB-093] service_domains = ["cleaning", "repair", "delivery"].

### 6. Transport and Mobility

[STATE][URB-110] urban_transport_automation = "high".
[STATE][URB-111] public_transport_mode = "on_demand_service".
[STATE][URB-112] semi_public_mobility = ["capsules", "shuttles"].
[STATE][URB-113] private_transport_necessity = false.
[STATE][URB-114] manual_driving_mass_norm = false.
[STATE][URB-115] street_space_managed = true.
[STATE][URB-116] mobility_predictability = "high".

### 7. Public Space and Access Control

[STATE][URB-140] access_control = present.
[STATE][URB-141] public_spaces_safety = "high".
[STATE][URB-142] access_levels = ["LEVEL-LOW", "LEVEL-MID", "LEVEL-HIGH"].
[STATE][URB-143] access_level_is_social_hierarchy = false (functional hierarchy).
[STATE][URB-144] privacy_mode = "protected_logged".

### 8. Interface Layer (UI Invisibility)

[STATE][URB-160] environment_interfaces = "mostly_hidden".
[STATE][URB-161] user_ui_visual_requirement = false.
[STATE][URB-162] physical_screens_requirement = false.
[STATE][URB-163] operator_observability = "high".

### 9. Sensory Profile (LEVEL-MID)

[STATE][URB-180] ambient_sound = "low_intensity_infrastructure_noise".
[STATE][URB-181] sharp_noise_events = "rare_suppressed".
[STATE][URB-182] lighting_adaptive = true.
[STATE][URB-183] city_darkness_default = false.
[STATE][URB-184] indoor_air_smell = "filtered_low_odor".

### 10. Climate Adaptation (Urban)

[STATE][URB-200] urban_climate_risk = "system_load".
[STATE][URB-201] adaptation_design_targets = ["heat_waves", "extreme_weather"].
[STATE][URB-202] critical_nodes_protection = true.
[STATE][URB-203] crisis_frequency_trend = "decreasing".

### 11. Visual Code (Solar Brutalism)

[STATE][URB-VIS-050] facade.decor = prohibited (reason: thermal_reflectivity).
[STATE][URB-VIS-051] interior.decor = allowed (condition: fire_retardant).
[STATE][URB-VIS-052] exterior.palette = [white, light_grey, raw_concrete] (High Albedo).
[STATE][URB-VIS-053] visual_noise = suppressed (no billboards/graffiti in MID).

## USAGE / RESOLUTION

[DECISION][URB-USE-010] Документ предоставляет декларативные свойства городской среды (LEVEL-MID).
[DECISION][URB-USE-011] Scenes must emphasize uniformity and lack of visual noise.

## OUTPUT CONTRACT

~~~yaml
doc_id: SSOT-URBANISM-A-2215-0007
role_type: STATE
export:
  - metric: urban_population_share_percent
    owner_domain: URBANISM
    values:
      core: 82
      range: [80, 85]
  - metric: facade.decor
    owner_domain: URBANISM
    values:
      core: prohibited
  - metric: visual_style
    owner_domain: URBANISM
    values:
      core: Solar Brutalism
~~~

## FORBIDDEN

[FORBIDDEN][URB-FBD-010] Introducing new world metrics outside SSOT.
[FORBIDDEN][URB-FBD-011] Describing slums or chaotic decor in LEVEL-MID.
[FORBIDDEN][URB-FBD-012] Using narrative logic to override infrastructure facts.
~~~
</file>

</architecture_docs>
