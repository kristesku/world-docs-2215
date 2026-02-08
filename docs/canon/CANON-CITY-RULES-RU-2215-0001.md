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
