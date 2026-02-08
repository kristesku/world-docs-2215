ID NOT CHANGED

```markdown
---
id: CANON-OSA-GLOBAL-2215-0005
title: >
  ОСА (Отдел Системных Аномалий) — мандат, подчинение, полномочия и режимы работы (2215)
class: canon
status: draft
version: 0.1.2
prefix: OSA
doc_language: ru-RU
prose_language: ru-RU
inputs:
  - CANON-CONFLICT-GLOBAL-2215-0001
  - CANON-SYSTEMS-GLOBAL-2215-0001
  - CANON-ORDERS-GLOBAL-2215-0003
  - CANON-CAST-GLOBAL-2215-0001
depends_on:
  - CANON-BASE-RULE-GLOBAL-2215-0001
scope: >
  RULE-канон об ОСА как госструктуре: место в государстве, мандат, полномочия и ограничения,
  обязательная ордерность действий, артефакты работы и режимы (normal / infra-counterintelligence).
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: define OSA mandate, authority boundaries, required procedural forms, and operating modes
INPUTS:
  - CANON-BASE-RULE-GLOBAL-2215-0001
  - CANON-CONFLICT-GLOBAL-2215-0001
  - CANON-SYSTEMS-GLOBAL-2215-0001
  - CANON-ORDERS-GLOBAL-2215-0003
  - CANON-CAST-GLOBAL-2215-0001
OUTPUTS: [osa_identity, osa_mandate, allowed_actions, required_artifacts, operating_modes, failure_modes]
FORBIDDEN: [osa_as_police, osa_as_court, arbitrary_surveillance, action_without_order, political_policing]

---

## DEFINITIONS

[FACT][OSA-DEF-010] `osa` = ОСА / Отдел Системных Аномалий.
[FACT][OSA-DEF-011] `case` = активированный кейс ОСА, включающий docket, orders и evidence ledger.
[FACT][OSA-DEF-012] `mandate` = рамка полномочий на кейс (объект, цель, пределы, срок).
[FACT][OSA-DEF-013] `order` = формализованное разрешение на конкретное действие (согласно CANON-ORDERS-GLOBAL-2215-0003).
[FACT][OSA-DEF-014] `emergency` = исключительный режим, действующий ≤ 72 часов, требующий пост-отчёта и ретро-легализации.

---

## INVARIANTS

[DECISION][OSA-INV-010] `osa.is_state_body` MUST be true.
[DECISION][OSA-INV-011] `osa.is_interagency` MUST be true.
[DECISION][OSA-INV-012] `osa.is_infrastructure_operator` MUST be false.
[DECISION][OSA-INV-013] `osa.is_regulator` MUST be false.
[DECISION][OSA-INV-014] `osa.is_court` MUST be false.
[DECISION][OSA-INV-015] `osa.is_army` MUST be false.
[FORBIDDEN][OSA-INV-016] Political policing as a norm for OSA.

---

## CONTENT

### 1. Mission and Success Criteria

[DECISION][OSA-MIS-010] `osa.mission` = "identify, prove, and stop systemic anomalies across domains/jurisdictions with measurable harm".
[DECISION][OSA-MIS-011] `osa.success_criteria` MUST include `causality_made_admissible`.
[DECISION][OSA-MIS-012] `osa.success_criteria` MUST include `dangerous_mode_stopped_or_restricted`.
[DECISION][OSA-MIS-013] `osa.success_criteria` MUST include `observability_blind_spots_closed_or_formalized`.
[DECISION][OSA-MIS-014] `osa.success_criteria` MUST include `regime_changed_via_legal_levers`.

### 2. Activation and Procedure

[DECISION][OSA-ACT-010] `osa.activation_form` MUST contain: case_intake, triage, hypotheses, mandate, orders.
[DECISION][OSA-ACT-011] `osa.activation_form` MUST contain: evidence_capture, causal_model, counterfactual_test.
[DECISION][OSA-ACT-012] `osa.activation_form` MUST contain: findings, remedy_package, monitoring.

[RULE][OSA-ACT-020] `action.requires_procedural_form` MUST be true.
[RULE][OSA-ACT-021] IF `action.is_significant` = true THEN `action.form` MUST be one of {mandate, order, emergency}.

### 3. Allowed Actions

[DECISION][OSA-ACT-030] `osa.allowed_actions` INCLUDES `request_telemetry_and_logs`.
[DECISION][OSA-ACT-031] `osa.allowed_actions` INCLUDES `site_inspection`.
[DECISION][OSA-ACT-032] `osa.allowed_actions` INCLUDES `imaging_snapshot_with_crypto_fixation`.
[DECISION][OSA-ACT-033] `osa.allowed_actions` INCLUDES `seize_media_modules_components`.
[DECISION][OSA-ACT-034] `osa.allowed_actions` INCLUDES `detain_persons_as_procedural_action`.
[DECISION][OSA-ACT-035] `osa.allowed_actions` INCLUDES `use_force_as_procedural_tool`.

[RULE][OSA-ACT-040] IF `osa.uses_coercion` = true THEN `osa.MUST_produce_artifact` MUST be true.
[RULE][OSA-ACT-041] `coercion.artifacts_min` MUST include {act, protocol, inventory, chain_of_custody_entry}.

### 4. Limitations and Privacy

[DECISION][OSA-LIM-010] `osa.limitations` MUST include `order_scope_perimeter`.
[DECISION][OSA-LIM-011] `osa.limitations` MUST include `time_window_deadlines`.
[DECISION][OSA-LIM-012] `osa.limitations` MUST include `evidence_admissibility`.
[DECISION][OSA-LIM-013] `osa.limitations` MUST include `appealability`.
[DECISION][OSA-LIM-014] `osa.actions` MUST be auditable.

[FORBIDDEN][OSA-LIM-020] Arbitrary surveillance by OSA.
[RULE][OSA-LIM-021] IF `personal_data_access_needed` = true THEN default MUST be {minimize, mask, procedural_basis_required}.

### 5. Interfaces and Outputs

[DECISION][OSA-INT-010] OSA interacts with Regulators via: mandates, license_triggers, suspensions, audit_requirements.
[DECISION][OSA-INT-011] OSA interacts with Operators via: access, JAP, resistance, purge_risk, negotiation.
[DECISION][OSA-INT-012] OSA interacts with Courts/Arbitration via: admissibility, appeals, subject-liability_demands.
[DECISION][OSA-INT-013] OSA interacts with Other Agencies via: force_support, cyber_forensics, witness_protection.

[DECISION][OSA-OUT-020] `osa.outputs.artifacts` MUST include `case_docket`.
[DECISION][OSA-OUT-021] `osa.outputs.artifacts` MUST include `evidence_ledger_with_chain_of_custody`.
[DECISION][OSA-OUT-022] `osa.outputs.artifacts` MUST include `causal_map_CMC`.
[DECISION][OSA-OUT-023] `osa.outputs.artifacts` MUST include `remedy_package_with_monitoring_plan`.
[DECISION][OSA-OUT-024] `osa.outputs.artifacts` MUST include `public_and_restricted_summary`.

### 6. Operating Modes

[DECISION][OSA-MOD-010] `operating_mode.enum` = {normal, infrastructure_counterintelligence}.
[DECISION][OSA-MOD-011] `operating_mode.current_book` = normal.

[RULE][OSA-MOD-020] IF `operating_mode` = normal THEN `cross_border_actor_active` MUST be false.
[RULE][OSA-MOD-021] IF `operating_mode` = infrastructure_counterintelligence THEN focus MUST be `external_interference_signals_in_infrastructure`.
[RULE][OSA-MOD-022] IF `operating_mode` = infrastructure_counterintelligence THEN `political_policing_as_norm` MUST be false.

[RULE][OSA-MOD-030] For any mode, `order_required` MUST be true.
[RULE][OSA-MOD-031] For any mode, `chain_of_custody_required` MUST be true.
[RULE][OSA-MOD-032] For any mode, `admissibility_required` MUST be true.

### 7. Failure and Victory

[DECISION][OSA-FAIL-010] `osa.failure_modes` INCLUDES `window_lost`.
[DECISION][OSA-FAIL-011] `osa.failure_modes` INCLUDES `purge_before_fixation`.
[DECISION][OSA-FAIL-012] `osa.failure_modes` INCLUDES `legal_opacity_no_liability_subject`.
[DECISION][OSA-FAIL-013] `osa.failure_modes` INCLUDES `report_sterilized_politically`.
[DECISION][OSA-FAIL-014] `osa.failure_modes` INCLUDES `internal_conflict_procedure_vs_fast_entry`.

[DECISION][OSA-VIC-020] `osa.victory_profile` = "procedural_partial_with_cost_and_residual_risk".

---

## USAGE / RESOLUTION

[DECISION][OSA-USE-010] This document regulates OSA as a structure in all scenes.
[DECISION][OSA-USE-011] Any OSA action in a scene MUST reference a valid procedural form (mandate/order).
[DECISION][OSA-USE-012] Conflict resolution follows SPEC-PRIORITY-RESOLUTION-2215-0001.

---

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-OSA-GLOBAL-2215-0005
role_type: RULE
export:
  - rule_id: OSA-MIS-010
    intent: define OSA mission
    inputs: []
    outputs: [mission_statement]
  - rule_id: OSA-ACT-021
    intent: require significant actions to have form
    inputs: [action.is_significant]
    outputs: [required_form]
  - rule_id: OSA-MOD-030
    intent: enforce order requirement for all modes
    inputs: [operating_mode]
    outputs: [order_required]
~~~

---

## FORBIDDEN

[FORBIDDEN][OSA-FBD-010] Depicting OSA as general police force.
[FORBIDDEN][OSA-FBD-011] OSA acting as a court or issuing verdicts.
[FORBIDDEN][OSA-FBD-012] Conducting arbitrary surveillance without specific case mandate.
[FORBIDDEN][OSA-FBD-013] Taking significant action without an order or emergency justification.
[FORBIDDEN][OSA-FBD-014] Statements without IDs.

---

## NON-NORMATIVE

(empty)

```