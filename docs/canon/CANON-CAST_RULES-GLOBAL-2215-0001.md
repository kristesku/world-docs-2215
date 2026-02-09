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
