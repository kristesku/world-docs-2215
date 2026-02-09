---
id: BASELINE-PHYSICAL_LEVEL_MID-2215-0001
title: >
  Physical Environment Baseline — LEVEL-MID (2215)
class: baseline
status: fixed
version: 1.1.1
prefix: PHY
doc_language: en-US
prose_language: ru-RU
inputs: []
depends_on:
  - SPEC-DOC_STYLE-2215-0001
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
