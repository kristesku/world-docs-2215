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
