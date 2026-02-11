---
id: SSOT-URBANISM-A-2215-0007
title: >
  Urbanism and City Systems — Scenario A (2215, SSOT State)
class: ssot
status: fixed
prefix: URB
doc_language: en-US
inputs:
  - SSOT-DEMOGRAPHY-A-2215-0002
  - SSOT-SCENARIO-A-2215-0001
depends_on:
  - SPEC-DOC_STYLE-2215-0001
references: []
scope: >
  Canonical SSOT state of urban environment and agglomeration systems
  in 2215 under Scenario A: morphology, infrastructure, transport,
  sensory environment, management, and visual code (LEVEL-MID defaults).
  Local implementations (e.g., specific cities) MUST be encoded in
  BASELINE-* documents and may apply explicit exemptions to selected fields.
---

## LLM-INTENT

ROLE_TYPE: STATE
SCOPE: urban systems state for Scenario A in year ~2215 (LEVEL-MID defaults)
INPUTS:
  - SSOT-DEMOGRAPHY-A-2215-0002
  - SSOT-SCENARIO-A-2215-0001
OUTPUTS: [urbanism_state, visual_code]
FORBIDDEN: [causal_logic, resolution_rules, narrative_explanations, feedback_loops]

## DEFINITIONS

[FACT][URB-010] `urbanism` = settlement morphology and operational regimes of the urban "operating system".
[FACT][URB-020] `city_systems` = critical infrastructures and their standard behavioral regimes.

## INVARIANTS

[DECISION][URB-030] This document is applicable ONLY within Scenario A.
[DECISION][URB-040] The city is treated as an infrastructure life-support machine.
[DECISION][URB-050] Dense agglomerations are the base settlement form.
[DECISION][URB-060] The urban environment operates in 24/7 functional mode by default.
[DECISION][URB-070] `urban_population_share_percent` is owned and exported ONLY by this document (owner_domain = URBANISM).
[DECISION][URB-080] The city in 2215 is an operating system for millions: minimal cost of maintaining habitability +
  maximum predictability of access to base functions over centuries despite inevitable technology shifts.
[DECISION][URB-090] Key shift: the city is designed as a platform, not as an aggregate of projects.
[DECISION][URB-100] Continuous operation takes precedence over aesthetics; appearance is a byproduct of regulation, maintenance, and repair logistics.
[DECISION][URB-110] Platform uniformity takes precedence over uniqueness: long-lived elements MUST have standardized service interfaces.
[DECISION][URB-120] Topology is more stable than materials: access points, service routes, and responsibility zones persist across implementation changes.
[DECISION][URB-130] Social function takes precedence over spatial gestures: environment is evaluated by access guarantees and predictability, not by formal expressiveness.
[DECISION][URB-140] Norm takes precedence over taste: the city does not need to be liked; it needs to PASS thresholds of safety, accessibility, repairability, manageability.
[DECISION][URB-150] Aesthetics are permitted as a managed layer and mode that MUST NOT affect mass housing and infrastructure stock (G ≤ G_max).
[DECISION][URB-150A] Local city character (including green intensity, park prevalence, and aesthetic layering) MUST be encoded in BASELINE-URBANISM-* documents.
[DECISION][URB-150B] SSOT provides: (a) global defaults, (b) allowed modes, (c) constraints for local exemptions.

## CONTENT

### 1. Platform Contracts

[DECISION][URB-160] Environment is defined by access contracts: entries/exits, evacuation, service perimeters.
[DECISION][URB-170] Environment is defined by utility contracts: connection nodes, diagnostic interfaces, scheduled maintenance windows.
[DECISION][URB-180] Environment is defined by replacement contracts: modular replacement without "rebuilding the world".

### 2. Interface Convergence and Implementation Variance

[DECISION][URB-190] Service interfaces are unified; implementations are variable.
[DECISION][URB-200] Visual heterogeneity is a consequence of asynchronous upgrade cycles under a single platform contract.

### 3. Regulated Ordinary

[DECISION][URB-210] Housing and base infrastructure are background.
[DECISION][URB-220] "Spectacle" is permitted ONLY in designated modes/locations and MUST NOT disrupt operations or maintenance schedules.

### 4. Risk and Cost Governance

[DECISION][URB-230] Urbanism = risk and cost management over centuries: failure localization, cheaper recovery,
  administrative impossibility of operational stock degradation.

### 5. Social Attraction as Service Metric

[DECISION][URB-240] "Attraction" is treated as a service metric: access predictability, safety, base-function density
  within time radius, absence of stigma and environmental marginalization, low flow conflict.

### 6. Optimization Frame

[DECISION][URB-250] Urbanism 2215 is evaluated by maximizing U = B + A + P + S and minimizing K = C + R + G
  under constraints: B ≥ B_min, M ≤ M_max, S ≥ S_min, V permitted ONLY IF it does not increase R or decrease P, G ≤ G_max.

### 7. Element Application

[DECISION][URB-260] Quarter: repeatable service corridors and access points; courtyard is an operational space (safe, repairable, predictable).
[DECISION][URB-270] Street: service route + movement route; embedded standardized infrastructure; decorative layers MUST NOT violate maintenance schedules.
[DECISION][URB-280] Housing: platform with interfaces; shells change, service core is stable; status solutions are a separate mode, isolated from mass stock.

### 8. Canonicality Checks

[DECISION][URB-290] IF depiction resembles advertising render THEN FAIL.
[DECISION][URB-300] IF district requires "one big reconstruction" THEN FAIL.
[DECISION][URB-310] IF time is shown as dirt/decay baseline THEN FAIL (Scenario A baseline).
[DECISION][URB-320] IF time is shown as coexistence of generations under one contract THEN PASS.
[DECISION][URB-330] IF regulation and serviceability are legible everywhere in baseline layer THEN PASS.

### 9. Urbanization Level and Dominant Form

[STATE][URB-340] urban_population_share_percent.core = 82.
[STATE][URB-350] urban_population_share_percent.range = [80, 85].
[STATE][URB-360] dominant_settlement_form = "large_agglomerations_and_metapolises".
[STATE][URB-370] typical_urban_fabric_density = "high".
[STATE][URB-380] verticalization_norm = true.
[STATE][URB-390] low_density_suburbia_dominant = false.

### 10. City Morphology

[STATE][URB-400] mass_built_form = "platform_modular".
[STATE][URB-410] mixed_use_blocks_prevalence = "high".
[STATE][URB-420] urban_fabric_drifted_toward = ["logistics", "maintenance", "repairability", "energy_efficiency"].
[STATE][URB-430] architectural_uniqueness = "present_as_local_layers_not_mass_norm".

### 11. Green and Open Space

[STATE][URB-440] green_space_role.allowed = ["microclimate_stabilization", "thermal_load_reduction", "human_comfort"].
[STATE][URB-450] green_elements_integration.allowed = ["residential_blocks", "courtyards", "streets", "transport_corridors"].
[STATE][URB-460] parks_presence.core = "selective_designated".
[STATE][URB-460A] parks_presence.allowed = ["selective_designated", "pervasive_integrated"].
[STATE][URB-470] parks_as_voids_dominant.core = "situational".
[STATE][URB-470A] parks_as_voids_dominant.allowed = ["true", "false", "situational"].
[STATE][URB-480] daily_green_exposure.core = "non_guaranteed".
[STATE][URB-480A] daily_green_exposure.allowed = ["non_guaranteed", "baseline_expected"].
[STATE][URB-490] green_space_maintenance.allowed = ["standardized_infrastructure_layer", "mixed_regime"].

### 12. Infrastructure Baseline

[STATE][URB-500] city_energy_service = "stable_continuous".
[STATE][URB-510] infrastructure_resilience = "redundant_procedural_recovery".
[STATE][URB-520] water_service_continuity = true.
[STATE][URB-530] air_filtration_microclimate_layer = "present_selective".

### 13. Maintenance and Service Layer

[STATE][URB-540] city_maintenance_mode = "scheduled_with_priority_exemptions".
[STATE][URB-550] city_operations_telemetry = "continuous_on_critical_nodes__patchy_elsewhere".
[STATE][URB-560] service_agents = ["human_crews", "semi_autonomous_machines", "inspection_drones_limited"].
[STATE][URB-570] service_domains = ["cleaning", "repair", "delivery", "inspection"].
[STATE][URB-580] maintenance_visibility = "persistent_low_grade".

### 14. Transport and Mobility

[STATE][URB-590] urban_transport_automation = "high_on_trunks__partial_elsewhere".
[STATE][URB-600] public_transport_mode = "scheduled_with_dynamic_adjustments".
[STATE][URB-610] semi_public_mobility = ["shuttles", "carshare_pools", "service_capsules_limited"].
[STATE][URB-620] private_transport_necessity = "situational".
[STATE][URB-630] private_vehicle_share = "significant_but_declining".
[STATE][URB-640] manual_driving_mass_norm = "allowed_but_constrained".
[STATE][URB-650] street_space_managed = true.
[STATE][URB-660] mobility_predictability = "high_systemic__medium_local".

### 15. Public Space and Access Control

[STATE][URB-670] access_control = "situational_procedural".
[STATE][URB-680] public_spaces_safety = "high_predictability__low_violence".
[STATE][URB-690] access_levels = ["LEVEL-LOW", "LEVEL-MID", "LEVEL-HIGH"].
[STATE][URB-700] access_level_is_social_hierarchy = false.
[STATE][URB-710] privacy_mode = "protected_logged".
[STATE][URB-720] social_conflict_visibility = "managed_not_erased".
[STATE][URB-730] informal_use_tolerated = "within_predictable_bounds".

### 16. Interface Layer

[STATE][URB-740] environment_interfaces = "mostly_hidden".
[STATE][URB-750] user_ui_visual_requirement = false.
[STATE][URB-760] physical_screens_requirement = false.
[STATE][URB-770] operator_observability = "high_on_critical_nodes__situational_elsewhere".

### 17. Sensory Profile

[STATE][URB-780] ambient_sound = "low_intensity_infrastructure_noise_with_green_absorption".
[STATE][URB-790] sharp_noise_events = "present_localized_managed".
[STATE][URB-800] lighting_adaptive = true.
[STATE][URB-810] city_darkness_default = false.
[STATE][URB-820] indoor_air_smell = "filtered_low_odor".

### 18. Climate Adaptation

[STATE][URB-830] urban_climate_risk = "system_load".
[STATE][URB-840] adaptation_design_targets = ["heat_waves", "extreme_weather"].
[STATE][URB-850] critical_nodes_protection = true.
[STATE][URB-860] crisis_frequency_trend = "extremes_increasing__system_failures_decreasing".
[STATE][URB-870] load_shedding_as_normal = true.
[STATE][URB-880] localized_service_degradation = "expected_under_extremes".

### 19. Visual Code

[STATE][URB-890] baseline_visual_goal = "low_visual_noise__high_legibility".
[STATE][URB-900] visual_noise = "suppressed_in_baseline_layer".
[STATE][URB-910] facade_expressivity = "secondary_to_maintenance_and_thermal_rules".
[STATE][URB-920] palette_driver = ["thermal", "maintenance", "replacement_cycles", "green_integration"].
[STATE][URB-930] facade_decor = "restricted".
[STATE][URB-940] interior_decor = "allowed".

## USAGE / RESOLUTION

[DECISION][URB-950] This document provides declarative properties of the urban environment (LEVEL-MID defaults).
[DECISION][URB-960] Scenes MUST emphasize legibility of regulation and serviceability; visual variation appears as
  asynchronous implementation layers under stable contracts.

## OUTPUT CONTRACT

~~~yaml
doc_id: SSOT-URBANISM-A-2215-0007
role_type: STATE
export:
  - metric: urban_population_share_percent
    owner_domain: URBANISM
    values:
      core: 82
      p90: none
      range: [80, 85]
    unit: percent
  - metric: parks_presence
    owner_domain: URBANISM
    values:
      core: selective_designated
      p90: none
      range: none
    allowed: [selective_designated, pervasive_integrated]
    unit: none
  - metric: daily_green_exposure
    owner_domain: URBANISM
    values:
      core: non_guaranteed
      p90: none
      range: none
    allowed: [non_guaranteed, baseline_expected]
    unit: none
  - metric: city_operations_telemetry
    owner_domain: URBANISM
    values:
      core: continuous_on_critical_nodes__patchy_elsewhere
      p90: none
      range: none
    unit: none
  - metric: city_maintenance_mode
    owner_domain: URBANISM
    values:
      core: scheduled_with_priority_exemptions
      p90: none
      range: none
    unit: none
  - metric: infrastructure_resilience
    owner_domain: URBANISM
    values:
      core: redundant_procedural_recovery
      p90: none
      range: none
    unit: none
  - metric: urban_transport_automation
    owner_domain: URBANISM
    values:
      core: high_on_trunks__partial_elsewhere
      p90: none
      range: none
    unit: none
  - metric: public_transport_mode
    owner_domain: URBANISM
    values:
      core: scheduled_with_dynamic_adjustments
      p90: none
      range: none
    unit: none
  - metric: private_transport_necessity
    owner_domain: URBANISM
    values:
      core: situational
      p90: none
      range: none
    unit: none
  - metric: manual_driving_mass_norm
    owner_domain: URBANISM
    values:
      core: allowed_but_constrained
      p90: none
      range: none
    unit: none
  - metric: crisis_frequency_trend
    owner_domain: URBANISM
    values:
      core: extremes_increasing__system_failures_decreasing
      p90: none
      range: none
    unit: none
  - metric: public_spaces_safety
    owner_domain: URBANISM
    values:
      core: high_predictability__low_violence
      p90: none
      range: none
    unit: none
  - metric: facade_decor
    owner_domain: URBANISM
    values:
      core: restricted
      p90: none
      range: none
    unit: none
~~~

## FORBIDDEN

[FORBIDDEN][URB-970] Introducing new world metrics outside SSOT.
[FORBIDDEN][URB-980] Describing slums or chaotic decor in LEVEL-MID baseline layer as mass norm.
[FORBIDDEN][URB-990] Using narrative logic to replace SSOT state.

## NON-NORMATIVE

~~~text
This document encodes global (Scenario A) urban defaults and constraints.
City-specific choices (e.g., pervasive greenery) must live in BASELINE-URBANISM-* documents.
~~~