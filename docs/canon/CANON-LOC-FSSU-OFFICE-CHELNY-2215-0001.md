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

