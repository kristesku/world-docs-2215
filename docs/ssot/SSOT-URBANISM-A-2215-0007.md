---
id: SSOT-URBANISM-A-2215-0007
title: >
  Urbanism and City Systems — Scenario A (2215, SSOT State)
class: ssot
status: fixed
version: 1.1.0
inputs:
  - SSOT-SCENARIO-A-2215-0001
  - SSOT-DEMOGRAPHY-A-2215-0002
  - BASELINE-PHYSICALLEVELMID-2215-0001
depends_on:
  - SPEC-DOC-STYLE-2215-0001
scope: >
  Каноническое SSOT-состояние городской среды и систем агломераций
  в 2215 году в рамках Scenario A: морфология, инфраструктуры, транспорт,
  сенсорная среда, управление и визуальный код.
---

## LLM-INTENT

ROLE_TYPE: STATE
SCOPE: urban systems state for Scenario A in year ~2215 (LEVEL-MID defaults)
INPUTS: []
OUTPUTS: [urbanism_state, visual_code]
FORBIDDEN: [causal_logic, resolution_rules, narrative_explanations, feedback_loops]

## DEFINITIONS

[FACT][URB-DEF-010] Urbanism = морфология расселения и эксплуатационные режимы городской “машины”.
[FACT][URB-DEF-011] City systems = критические инфраструктуры и их стандартные поведенческие режимы.

## INVARIANTS

[DECISION][URB-INV-010] Документ применим только в рамках Scenario A.
[DECISION][URB-INV-011] Город трактуется как инфраструктурная машина жизнеобеспечения.
[DECISION][URB-INV-012] Базовой формой расселения являются агломерации высокой плотности.
[DECISION][URB-INV-013] Городская среда по умолчанию находится в 24/7 функциональном режиме.
[DECISION][URB-INV-020] `urban_population_share_percent` is owned and exported ONLY by this document (owner_domain = URBANISM).

## CONTENT

### 1. Urbanization Level and Dominant Form

[STATE][URB-010] urban_population_share_percent.core = 82
[STATE][URB-011] urban_population_share_percent.range = [80, 85]
[STATE][URB-012] dominant_settlement_form = "large_agglomerations_and_metapolises"
[STATE][URB-013] typical_urban_fabric_density = "high"
[STATE][URB-014] verticalization_norm = true
[STATE][URB-015] low_density_suburbia_dominant = false

### 2. City Morphology (Built Form)

[STATE][URB-030] mass_built_form = "modular"
[STATE][URB-031] mixed_use_blocks_prevalence = "high"
[STATE][URB-032] urban_fabric_optimized_for = ["logistics", "maintenance", "energy_efficiency"]
[STATE][URB-033] architectural_uniqueness = "present_not_mass_norm"

### 3. Green and Open Space

[STATE][URB-050] green_space_role = "infrastructure_function" (biomass, oxygen).
[STATE][URB-051] green_elements_integration = ["buildings", "transport_corridors"].
[STATE][URB-052] parks_as_voids_dominant = false (integrated greenery preferred).

### 4. Infrastructure Baseline (LEVEL-MID)

[STATE][URB-070] city_energy_service = "stable_continuous".
[STATE][URB-071] infrastructure_resilience = "redundant_self_healing".
[STATE][URB-072] water_service_continuity = true.
[STATE][URB-073] air_filtration_microclimate_layer = present.

### 5. Maintenance and Service Layer

[STATE][URB-090] city_maintenance_mode = "autonomous_background".
[STATE][URB-091] city_operations_telemetry = "continuous".
[STATE][URB-092] service_agents = ["robots", "drones"].
[STATE][URB-093] service_domains = ["cleaning", "repair", "delivery"].

### 6. Transport and Mobility

[STATE][URB-110] urban_transport_automation = "high".
[STATE][URB-111] public_transport_mode = "on_demand_service".
[STATE][URB-112] semi_public_mobility = ["capsules", "shuttles"].
[STATE][URB-113] private_transport_necessity = false.
[STATE][URB-114] manual_driving_mass_norm = false.
[STATE][URB-115] street_space_managed = true.
[STATE][URB-116] mobility_predictability = "high".

### 7. Public Space and Access Control

[STATE][URB-140] access_control = present.
[STATE][URB-141] public_spaces_safety = "high".
[STATE][URB-142] access_levels = ["LEVEL-LOW", "LEVEL-MID", "LEVEL-HIGH"].
[STATE][URB-143] access_level_is_social_hierarchy = false (functional hierarchy).
[STATE][URB-144] privacy_mode = "protected_logged".

### 8. Interface Layer (UI Invisibility)

[STATE][URB-160] environment_interfaces = "mostly_hidden".
[STATE][URB-161] user_ui_visual_requirement = false.
[STATE][URB-162] physical_screens_requirement = false.
[STATE][URB-163] operator_observability = "high".

### 9. Sensory Profile (LEVEL-MID)

[STATE][URB-180] ambient_sound = "low_intensity_infrastructure_noise".
[STATE][URB-181] sharp_noise_events = "rare_suppressed".
[STATE][URB-182] lighting_adaptive = true.
[STATE][URB-183] city_darkness_default = false.
[STATE][URB-184] indoor_air_smell = "filtered_low_odor".

### 10. Climate Adaptation (Urban)

[STATE][URB-200] urban_climate_risk = "system_load".
[STATE][URB-201] adaptation_design_targets = ["heat_waves", "extreme_weather"].
[STATE][URB-202] critical_nodes_protection = true.
[STATE][URB-203] crisis_frequency_trend = "decreasing".

### 11. Visual Code (Solar Brutalism)

[STATE][URB-VIS-050] facade.decor = prohibited (reason: thermal_reflectivity).
[STATE][URB-VIS-051] interior.decor = allowed (condition: fire_retardant).
[STATE][URB-VIS-052] exterior.palette = [white, light_grey, raw_concrete] (High Albedo).
[STATE][URB-VIS-053] visual_noise = suppressed (no billboards/graffiti in MID).

## USAGE / RESOLUTION

[DECISION][URB-USE-010] Документ предоставляет декларативные свойства городской среды (LEVEL-MID).
[DECISION][URB-USE-011] Scenes must emphasize uniformity and lack of visual noise.

## OUTPUT CONTRACT

~~~yaml
doc_id: SSOT-URBANISM-A-2215-0007
role_type: STATE
export:
  - metric: urban_population_share_percent
    owner_domain: URBANISM
    values:
      core: 82
      range: [80, 85]
  - metric: facade.decor
    owner_domain: URBANISM
    values:
      core: prohibited
  - metric: visual_style
    owner_domain: URBANISM
    values:
      core: Solar Brutalism
~~~

## FORBIDDEN

[FORBIDDEN][URB-FBD-010] Introducing new world metrics outside SSOT.
[FORBIDDEN][URB-FBD-011] Describing slums or chaotic decor in LEVEL-MID.
[FORBIDDEN][URB-FBD-012] Using narrative logic to override infrastructure facts.