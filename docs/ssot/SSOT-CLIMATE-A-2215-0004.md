---
id: SSOT-CLIMATE-A-2215-0004
title: >
  Climate State and Impacts — Scenario A (2215, SSOT State)
class: ssot
status: draft
prefix: CLM
doc_language: en-US
inputs: []
depends_on:
  - SPEC-DOC_STYLE-2215-0001
  - SSOT-ENERGY-A-2215-0004
  - SSOT-SCENARIO-A-2215-0001
references: []
scope: >
  SSOT state of the global climate background in 2215 (Scenario A): warming,
  sea level, emissions balance, extremes regime, and adaptation contours.
  Contains only declarative numeric metrics (core/p90/range) and categorical states.
  Does not contain causality, resolution rules, or response procedures.
---

## LLM-INTENT

ROLE_TYPE: STATE
SCOPE: declarative climate state for Scenario A around year 2215
INPUTS: []
OUTPUTS: [climate_state]
FORBIDDEN: [causal_logic, resolution_rules, procedural_response, narrative_explanations]

## DEFINITIONS

[FACT][CLM-010] `climate_state` = global and region-typical climate parameters and operational impacts as infrastructure background.

## INVARIANTS

[DECISION][CLM-020] This document is applicable ONLY to Scenario A.
[DECISION][CLM-030] Climate is stabilized at a new level; default mode is not "collapse".
[DECISION][CLM-040] Full return to preindustrial climate is not assumed.
[DECISION][CLM-050] Net CO2 balance is maintained near zero (net ≈ 0).

## CONTENT

### 1. Global Warming and Sea Level

[STATE][CLM-100] warming_C_vs_preindustrial.core = 2.5.
[STATE][CLM-110] warming_C_vs_preindustrial.p90 = none.
[STATE][CLM-120] warming_C_vs_preindustrial.range = [2.0, 2.5].
[STATE][CLM-130] warming_C_vs_preindustrial.unit = C.
[STATE][CLM-140] warming_C_vs_preindustrial.owner_domain = CLIMATE.
[STATE][CLM-150] sea_level_m.core = 1.7.
[STATE][CLM-160] sea_level_m.p90 = none.
[STATE][CLM-170] sea_level_m.range = [1.5, 2.0].
[STATE][CLM-180] sea_level_m.unit = m.
[STATE][CLM-190] sea_level_m.owner_domain = CLIMATE.
[STATE][CLM-200] warming_trend_post_2215 = "stable_no_accelerating_increase".
[STATE][CLM-210] warming_trend_post_2215.owner_domain = CLIMATE.

### 2. Emissions Balance

[STATE][CLM-220] net_co2_emissions_mode = "near_zero".
[STATE][CLM-230] net_co2_emissions_mode.owner_domain = CLIMATE.
[STATE][CLM-240] residual_emissions_primary_sources = ["land_use", "hard_to_abate_processes"].
[STATE][CLM-250] residual_emissions_primary_sources.owner_domain = CLIMATE.
[STATE][CLM-260] emissions_sink_balance_state = "near_zero_equilibrium".
[STATE][CLM-270] emissions_sink_balance_state.owner_domain = CLIMATE.

### 3. Extremes and Risk Profile

[STATE][CLM-280] extreme_weather_frequency_vs_20c = "higher".
[STATE][CLM-290] extreme_weather_frequency_vs_20c.owner_domain = CLIMATE.
[STATE][CLM-300] climate_risk_distribution = "geographically_redistributed".
[STATE][CLM-310] climate_risk_distribution.owner_domain = CLIMATE.
[STATE][CLM-320] typical_extreme_types = ["heat_waves", "intense_precipitation", "storm_systems", "drought_periods", "compound_multi_risks"].
[STATE][CLM-330] typical_extreme_types.owner_domain = CLIMATE.
[STATE][CLM-340] extremes_handling_mode = "managed_risk_profile".
[STATE][CLM-350] extremes_handling_mode.owner_domain = GOVERNANCE.

### 4. Adaptation Layer

[STATE][CLM-360] adaptation_infrastructure_programs_present = true.
[STATE][CLM-370] adaptation_infrastructure_programs_present.owner_domain = GOVERNANCE.
[STATE][CLM-380] adaptation_core_program_types = ["coastal_defense", "water_systems", "agro_adaptation"].
[STATE][CLM-390] adaptation_core_program_types.owner_domain = CLIMATE.
[STATE][CLM-400] managed_relocation_programs_present = true.
[STATE][CLM-410] managed_relocation_programs_present.owner_domain = GOVERNANCE.
[STATE][CLM-420] climate_shocks_system_effect_mode = "adaptation_stimulus_not_collapse".
[STATE][CLM-430] climate_shocks_system_effect_mode.owner_domain = CLIMATE.

### 5. Water, Coasts, Food

[STATE][CLM-440] water_systems_role_in_adaptation = "key_contour".
[STATE][CLM-450] water_systems_role_in_adaptation.owner_domain = CLIMATE.
[STATE][CLM-460] water_scarcity_mode = "regional_infrastructure_managed".
[STATE][CLM-470] water_scarcity_mode.owner_domain = CLIMATE.
[STATE][CLM-480] coastal_protection_programs_obligatory = true.
[STATE][CLM-490] coastal_protection_programs_obligatory.owner_domain = GOVERNANCE.
[STATE][CLM-500] managed_retreat_is_normal_policy_in_some_zones = true.
[STATE][CLM-510] managed_retreat_is_normal_policy_in_some_zones.owner_domain = GOVERNANCE.
[STATE][CLM-520] food_system_stability_mode = "stable_with_local_shocks".
[STATE][CLM-530] food_system_stability_mode.owner_domain = CLIMATE.

## USAGE / RESOLUTION

[DECISION][CLM-800] This document provides declarative climate and adaptation parameters for downstream documents.
[FORBIDDEN][CLM-810] Using this SSOT document for emergency response protocols.
[FORBIDDEN][CLM-820] Using this SSOT document for causal chains.
[FORBIDDEN][CLM-830] Using this SSOT document for default collapse-plot generation without an exemption document.

## OUTPUT CONTRACT

~~~yaml
doc_id: SSOT-CLIMATE-A-2215-0004
role_type: STATE
export:
  - metric: warming_C_vs_preindustrial
    owner_domain: CLIMATE
    values:
      core: 2.5
      p90: none
      range: [2.0, 2.5]
    unit: C
  - metric: sea_level_m
    owner_domain: CLIMATE
    values:
      core: 1.7
      p90: none
      range: [1.5, 2.0]
    unit: m
  - metric: warming_trend_post_2215
    owner_domain: CLIMATE
    values:
      core: stable_no_accelerating_increase
      p90: none
      range: none
    unit: none
  - metric: net_co2_emissions_mode
    owner_domain: CLIMATE
    values:
      core: near_zero
      p90: none
      range: none
    unit: none
  - metric: emissions_sink_balance_state
    owner_domain: CLIMATE
    values:
      core: near_zero_equilibrium
      p90: none
      range: none
    unit: none
  - metric: extreme_weather_frequency_vs_20c
    owner_domain: CLIMATE
    values:
      core: higher
      p90: none
      range: none
    unit: none
  - metric: climate_risk_distribution
    owner_domain: CLIMATE
    values:
      core: geographically_redistributed
      p90: none
      range: none
    unit: none
  - metric: typical_extreme_types
    owner_domain: CLIMATE
    values:
      core: [heat_waves, intense_precipitation, storm_systems, drought_periods, compound_multi_risks]
      p90: none
      range: none
    unit: none
  - metric: extremes_handling_mode
    owner_domain: GOVERNANCE
    values:
      core: managed_risk_profile
      p90: none
      range: none
    unit: none
  - metric: adaptation_infrastructure_programs_present
    owner_domain: GOVERNANCE
    values:
      core: true
      p90: none
      range: none
    unit: none
  - metric: managed_relocation_programs_present
    owner_domain: GOVERNANCE
    values:
      core: true
      p90: none
      range: none
    unit: none
  - metric: water_scarcity_mode
    owner_domain: CLIMATE
    values:
      core: regional_infrastructure_managed
      p90: none
      range: none
    unit: none
  - metric: food_system_stability_mode
    owner_domain: CLIMATE
    values:
      core: stable_with_local_shocks
      p90: none
      range: none
    unit: none
~~~

## FORBIDDEN

[FORBIDDEN][CLM-900] Introducing new world metrics or numeric claims outside SSOT.
[FORBIDDEN][CLM-910] Embedding causal chains, loops, resolution rules, or procedural response logic.
[FORBIDDEN][CLM-920] Treating climate state as narrative directive.

## NON-NORMATIVE

~~~text
Empty by design.
~~~