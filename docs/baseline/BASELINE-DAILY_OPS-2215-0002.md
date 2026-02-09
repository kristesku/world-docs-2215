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
