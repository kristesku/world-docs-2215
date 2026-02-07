---
id: CANON-CITY-RULES-RU-2215-0001
title: >
  RU 2215 — Набережные Челны: базовые законы города
class: canon
status: draft
version: 1.0.1
prefix: CITYR
doc_language: ru-RU
prose_language: ru-RU
inputs:
  - CANON-CITY-BOUNDARY-RU-2215-0008
  - CANON-CITY-RU-2215-0007
depends_on:
  - SPEC-DOC-STYLE-2215-0001
scope: >
  Жёсткие инварианты города Набережные Челны в 2215 году: география,
  архитектура, материалы, масштаб и бытовые нормы. Документ задаёт
  непреодолимые ограничения для сцен и описаний. Не является источником
  “якорей” и не подменяет CANON-CITY-RU-2215-0007.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: non-overridable urban invariants for Chelny-2215 (geo/architecture/materials/scale/everyday norms + narrative constraints)
INPUTS: [CANON-CITY-BOUNDARY-RU-2215-0008, CANON-CITY-RU-2215-0007]
OUTPUTS: [urban_constraints, forbidden_patterns]
FORBIDDEN: [introduce_metrics, redefine_boundaries, narrative_prose, implicit_anchors]

## DEFINITIONS

[FACT][CITYR-010] `city_chelny_2215` = функциональная городская территория Челнов-2215 внутри канонического периметра (`CANON-CITY-BOUNDARY-RU-2215-0008`).
[FACT][CITYR-011] `kama_west_bank` = природная/охранная зона западного берега Камы вне городской урбанизации.
[FACT][CITYR-012] `excess_scale` = размер элементов среды, превышающий минимально функциональный (масштаб как норма, не как “флекс”).

## INVARIANTS

[RULE][CITYR-020] IF location.is_west_of_kama == true THEN urbanization_allowed MUST be false; ELSE PASS.
[RULE][CITYR-021] IF location.is_protected_forest_zone == true THEN construction_allowed MUST be false; ELSE PASS.
[RULE][CITYR-022] Urban_fabric MUST be axis_aligned_along_infrastructure AND MUST NOT be radial_by_default; ELSE FAIL.
[RULE][CITYR-023] excess_scale MUST apply to all key urban elements (entries, underpasses, bridges, public volumes); ELSE FAIL.
[RULE][CITYR-024] Architectural language MUST NOT signal “tech as spectacle”; tech_signaling_as_goal is FORBIDDEN.

## CONTENT

### География

[RULE][CITYR-030] IF location == KAMA_WEST_BANK THEN access_allowed MUST be gated_by_boundary_rules AND urbanization_allowed MUST be false; ELSE PASS.
[RULE][CITYR-031] Primary city growth vectors MUST be in {EAST, SOUTH, SOUTH_EAST}; ELSE FAIL.
[RULE][CITYR-032] Forest massifs (including BOROVETSKY_FOREST) MUST be treated as hard_urban_limit; ELSE FAIL.
[FORBIDDEN][CITYR-033] Any new boundary, corridor, or “expanded perimeter” not defined in `CANON-CITY-BOUNDARY-RU-2215-0008`.

### Архитектура

[RULE][CITYR-040] Architecture MUST follow principle EXCESS_SCALE_OVER_FUNCTION; ELSE FAIL.
[RULE][CITYR-041] IF form in {ORGANIC, BIOMORPHIC} THEN dominance_allowed MUST be false; ELSE PASS.
[RULE][CITYR-042] Iconic_symbol_buildings MUST NOT be used as city dominants; ELSE FAIL.

### Материалы

[RULE][CITYR-050] Allowed base materials MUST be exactly {CONCRETE, STONE, MATTE_METAL}; ELSE FAIL.
[RULE][CITYR-051] IF material == GLASS THEN usage MUST be limited AND non_dominant; ELSE FAIL.
[RULE][CITYR-052] Load_bearing_and_engineering elements MUST be visually_readable; ELSE FAIL.

### Масштаб и тело

[RULE][CITYR-060] Sidewalks MUST be sized_for_flows AND MUST NOT be sized_for_crowds_by_default; ELSE FAIL.
[RULE][CITYR-061] Underpasses MUST be deep AND wide AND MUST be perceived_as_engineering_spaces; ELSE FAIL.
[RULE][CITYR-062] Entry_groups MUST be portal_like AND MUST NOT be door_like_by_default; ELSE FAIL.
[RULE][CITYR-063] Public_space_ceiling_heights MUST exceed 21C_psychological_norm; ELSE FAIL.

### Бытовые нормы

[RULE][CITYR-070] Observability_and_logging MUST be treated_as_normal_state; ELSE FAIL.
[RULE][CITYR-071] Anonymity MUST be privilege AND MUST NOT be baseline_right; ELSE FAIL.
[RULE][CITYR-072] IF subject == CHILD THEN presence_in_city MUST be normalized; ELSE FAIL.
[RULE][CITYR-073] Deviations_from_regimes MUST be auto_logged AND MUST NOT be dramatic_by_default; ELSE FAIL.
[RULE][CITYR-074] City MUST be comfortable_for_locals AND frictional_for_visitors; ELSE FAIL.

### Нарративные ограничения (как показывать инварианты)

[RULE][CITYR-080] Geography MUST be conveyed via movement_and_routes AND MUST NOT be conveyed via maps_as_primary; ELSE FAIL.
[RULE][CITYR-081] Architecture MUST be described via bodily_scale AND MUST NOT be described via style_labels_as_primary; ELSE FAIL.
[RULE][CITYR-082] Systems MUST NOT be directly explained IF behaviour_and_constraints imply function; ELSE FAIL.
[RULE][CITYR-083] In scene, city MUST either assist OR obstruct the character (environment-as-actor); ELSE FAIL.
[FORBIDDEN][CITYR-084] Using optional anchors from `CANON-CITY-RU-2215-0007` as defaults without explicit scene reference (anchors are not invariants).

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
    inputs: [material]
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
[FORBIDDEN][CITYR-904] Использование CANON-CITY-RU-2215-0007 как “дефолта” сцены без явной ссылки со стороны сцены.

## NON-NORMATIVE

~~~text
City rules are invariants (always applicable within boundary).
City anchors are optional (only applicable when explicitly referenced by a scene).
~~~
