---
id: CANON-ORDERS-GLOBAL-2215-0003
title: >
  Canon Orders — FSSU Warrants, Mandates, and Access Regimes (2215)
class: canon
status: draft
version: 1.1.0
inputs: []
depends_on:
  - SPEC-DOC_STYLE-2215-0001
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
[DECISION][ORD-USE-011] При конфликте применяется SPEC-PRIORITY_RESOLUTION-2215-0001.

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
