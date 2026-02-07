---
id: CANON-OSA-GLOBAL-2215-0005
title: >
  ОСА (Отдел Системных Аномалий) — мандат, подчинение, полномочия и режимы работы (2215)
class: canon
status: draft
version: 0.1.1
inputs:
  - CANON-CONFLICT-GLOBAL-2215-0001
  - CANON-SYSTEMS-GLOBAL-2215-0001
  - CANON-ORDERS-GLOBAL-2215-0003
  - CANON-CAST-GLOBAL-2215-0001
depends_on: []
scope: >
  RULE-канон об ОСА как госструктуре: место в государстве, мандат,
  полномочия и ограничения, обязательная ордерность действий, артефакты
  работы и режимы (normal / infra-counterintelligence).
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: define OSA mandate, authority boundaries, required procedural forms, and operating modes
INPUTS: [CANON-BASE-RULE-GLOBAL-2215-0001, CANON-CONFLICT-GLOBAL-2215-0001, CANON-SYSTEMS-GLOBAL-2215-0001, CANON-ORDERS-GLOBAL-2215-0003, CANON-CAST-GLOBAL-2215-0001]
OUTPUTS: [osa_identity, osa_mandate, allowed_actions_by_procedure, required_artifacts, operating_modes, failure_modes]
FORBIDDEN: [osa_as_police, osa_as_court, arbitrary_surveillance, action_without_order]

## DEFINITIONS

[DECISION][OSA-001] term.osa = "ОСА / Отдел Системных Аномалий".
[DECISION][OSA-002] term.case = "активированный кейс ОСА с docket + orders + evidence ledger".
[DECISION][OSA-003] term.mandate = "рамка полномочий на кейс (объект, цель, пределы, срок)".
[DECISION][OSA-004] term.order = "формализованное разрешение на конкретное действие (см. CANON-ORDERS-GLOBAL-2215-0003)".
[DECISION][OSA-005] term.emergency = "исключение, действующее ≤72h и порождающее пост-отчёт + ретро-легализацию (см. CANON-ORDERS-GLOBAL-2215-0003)".

## INVARIANTS

[DECISION][OSA-010] osa.is_state_body = "MUST".
[DECISION][OSA-011] osa.is_interagency = "MUST".
[DECISION][OSA-012] osa.is_infrastructure_operator = "MUST NOT".
[DECISION][OSA-013] osa.is_regulator = "MUST NOT".
[DECISION][OSA-014] osa.is_court = "MUST NOT".
[DECISION][OSA-015] osa.is_army = "MUST NOT".
[DECISION][OSA-016] osa.political_policing_as_norm = "MUST NOT".

## CONTENT

[DECISION][OSA-020] osa.mission = "identify, prove, and stop systemic anomalies across domains/jurisdictions with measurable harm".
[DECISION][OSA-021] osa.success_criteria = [
  "causality_made_admissible",
  "dangerous_mode_stopped_or_restricted",
  "observability_blind_spots_closed_or_formalized",
  "regime_changed_via_legal_levers"
].

[DECISION][OSA-030] osa.activation_form = ["case_intake", "triage", "hypotheses", "mandate", "orders", "evidence_capture", "causal_model", "counterfactual_test", "findings", "remedy_package", "monitoring"].
[DECISION][OSA-031] action.requires_procedural_form = "MUST".
[DECISION][OSA-032] IF action.is_significant = true THEN action.form MUST be one_of ["mandate", "order", "emergency"].

[DECISION][OSA-040] osa.allowed_actions = [
  "request_telemetry_and_logs",
  "site_inspection",
  "imaging_snapshot_with_crypto_fixation",
  "seize_media_modules_components",
  "detain_persons_as_procedural_action",
  "use_force_as_procedural_tool"
].
[DECISION][OSA-041] IF osa.uses_coercion = true THEN osa.MUST_produce_artifact = true.
[DECISION][OSA-042] coercion.artifacts_min = ["act", "protocol", "inventory", "chain_of_custody_entry"].

[DECISION][OSA-050] osa.limitations = [
  "order_scope_perimeter",
  "time_window_deadlines",
  "evidence_admissibility",
  "appealability",
  "osa_actions_must_be_auditable"
].
[DECISION][OSA-051] osa.arbitrary_surveillance = "MUST NOT".
[DECISION][OSA-052] IF personal_data_access_needed = true THEN default MUST be ["minimize", "mask", "procedural_basis_required"].

[DECISION][OSA-060] osa.interfaces = [
  "regulators: mandates, license_triggers, suspensions, audit_requirements",
  "operators: access, JAP, resistance, purge_risk, negotiation",
  "courts_arbitration: admissibility, appeals, subject-liability_demands",
  "other_agencies: force_support, cyber_forensics, witness_protection"
].

[DECISION][OSA-070] osa.outputs.artifacts = [
  "case_docket",
  "evidence_ledger_with_chain_of_custody",
  "causal_map_CMC",
  "remedy_package_with_monitoring_plan",
  "public_and_restricted_summary"
].

[DECISION][OSA-080] operating_mode.enum = ["normal", "infrastructure_counterintelligence"].
[DECISION][OSA-081] operating_mode.current_book = "normal".
[DECISION][OSA-082] IF operating_mode = "normal" THEN cross_border_actor_active MUST be false.
[DECISION][OSA-083] IF operating_mode = "infrastructure_counterintelligence" THEN focus MUST be "external_interference_signals_in_infrastructure" AND political_policing_as_norm MUST be false.
[DECISION][OSA-084] For any mode: order_required MUST be true AND chain_of_custody_required MUST be true AND admissibility_required MUST be true.

[DECISION][OSA-090] osa.failure_modes = [
  "window_lost",
  "purge_before_fixation",
  "legal_opacity_no_liability_subject",
  "report_sterilized_politically",
  "internal_conflict_procedure_vs_fast_entry"
].
[DECISION][OSA-091] osa.victory_profile = "procedural_partial_with_cost_and_residual_risk".

## USAGE / RESOLUTION

[DECISION][OSA-100] Any scene depicting OSA action MUST reference an order/mandate/emergency token consistent with CANON-ORDERS-GLOBAL-2215-0003.
[DECISION][OSA-101] Any scene depicting evidence collection MUST include chain-of-custody implication (explicit or via artifact snippet).
[DECISION][OSA-102] IF a scene implies OSA runs systems post-raid THEN scene MUST be rewritten to "operator/regulator executes changes; OSA enforces via procedure".
[DECISION][OSA-103] IF a scene implies OSA as patrol police THEN scene MUST be rewritten to "OSA enters only through systemic anomaly case activation".

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-OSA-GLOBAL-2215-0005
role_type: RULE
export:
  - rule_id: OSA-031
    intent: significant actions require procedural form
    inputs: [action.is_significant]
    outputs: [action.form_required]
  - rule_id: OSA-041
    intent: coercion requires artifacts and auditability
    inputs: [osa.uses_coercion]
    outputs: [required_artifacts]
  - rule_id: OSA-051
    intent: prohibit arbitrary surveillance
    inputs: [personal_data_access_needed]
    outputs: [required_minimization_masking]
  - rule_id: OSA-081
    intent: fix current book operating mode
    inputs: []
    outputs: [operating_mode.current_book]
~~~

## FORBIDDEN

[FORBIDDEN][OSA-900] Depicting OSA as universal police/patrol service.
[FORBIDDEN][OSA-901] Depicting OSA issuing verdicts or acting as court.
[FORBIDDEN][OSA-902] Depicting OSA operating infrastructure as steady-state owner.
[FORBIDDEN][OSA-903] Any significant OSA action without mandate/order/emergency linkage.
[FORBIDDEN][OSA-904] Any access to personal data without procedural basis and minimization/masking defaults.
[FORBIDDEN][OSA-905] Treating infra-counterintelligence mode as political спецслужба behavior.

## NON-NORMATIVE

[DECISION][OSA-990] Example reminder: "победа ОСА = остановка режима/изменение KPI/закрытие слепой зоны; 'посадить человека' может не случиться."
