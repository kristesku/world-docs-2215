---
id: SSOT-CLIMATE-A-2215-0004
title: >
  Climate State and Impacts — Scenario A (2215, SSOT State)
class: ssot
status: draft
version: 1.1.0
inputs: []
depends_on:
  - SSOT-DOC-STYLE-2215-0001
  - SSOT-SCENARIO-A-2215-0001
  - SSOT-ENERGY-A-2215-0004
scope: >
  SSOT-состояние климатического фона мира в 2215 году (Scenario A): потепление,
  уровень моря, баланс выбросов, режим экстремумов и состояние адаптационных контуров.
  Документ содержит только декларативные числовые метрики (core/p90/range) и категориальные состояния.
  Не содержит причинности, правил разрешения и процедур реагирования.
---

## LLM-INTENT

ROLE_TYPE: STATE
SCOPE: declarative climate state for Scenario A around year 2215
INPUTS: []
OUTPUTS:
  - climate_state
FORBIDDEN:
  - causal_logic
  - resolution_rules
  - procedural_response
  - narrative_explanations

---

## DEFINITIONS

[DEF][CLM-DEF-010] climate_state = global and region-typical climate parameters and operational impacts as infrastructure background.

---

## INVARIANTS

[FACT][CLM-000] Applicable only to Scenario A.
[FACT][CLM-001] Climate is stabilized at a new level; default mode is not “collapse”.
[FACT][CLM-002] Full return to preindustrial climate is not assumed.
[FACT][CLM-003] Net CO₂ balance is maintained near zero (net ≈ 0).

---

## CONTENT

### 1. Global warming and sea level (2215)

[STATE][CLM-010] warming_C_vs_preindustrial.core = 2.5
[STATE][CLM-011] warming_C_vs_preindustrial.p90 = null
[STATE][CLM-012] warming_C_vs_preindustrial.range = [2.0, 2.5]
[STATE][CLM-013] warming_C_vs_preindustrial.unit = C
[STATE][CLM-014] warming_C_vs_preindustrial.owner_domain = CLIMATE

[STATE][CLM-015] sea_level_m.core = 1.7
[STATE][CLM-016] sea_level_m.p90 = null
[STATE][CLM-017] sea_level_m.range = [1.5, 2.0]
[STATE][CLM-018] sea_level_m.unit = m
[STATE][CLM-019] sea_level_m.owner_domain = CLIMATE

[STATE][CLM-020] warming_trend_post_2215 = "stable_no_accelerating_increase"
[STATE][CLM-021] warming_trend_post_2215.owner_domain = CLIMATE

---

### 2. Emissions balance (2215)

[STATE][CLM-030] net_co2_emissions_mode = "near_zero"
[STATE][CLM-031] net_co2_emissions_mode.owner_domain = CLIMATE

[STATE][CLM-032] residual_emissions_primary_sources = ["land_use", "hard_to_abate_processes"]
[STATE][CLM-033] residual_emissions_primary_sources.owner_domain = CLIMATE

[STATE][CLM-034] emissions_sink_balance_state = "near_zero_equilibrium"
[STATE][CLM-035] emissions_sink_balance_state.owner_domain = CLIMATE

---

### 3. Extremes and risk profile (state)

[STATE][CLM-050] extreme_weather_frequency_vs_20c = "higher"
[STATE][CLM-051] extreme_weather_frequency_vs_20c.owner_domain = CLIMATE

[STATE][CLM-052] climate_risk_distribution = "geographically_redistributed"
[STATE][CLM-053] climate_risk_distribution.owner_domain = CLIMATE

[STATE][CLM-054] typical_extreme_types = [
  "heat_waves",
  "intense_precipitation",
  "storm_systems",
  "drought_periods",
  "compound_multi_risks"
]
[STATE][CLM-055] typical_extreme_types.owner_domain = CLIMATE

[STATE][CLM-056] extremes_handling_mode = "managed_risk_profile"
[STATE][CLM-057] extremes_handling_mode.owner_domain = GOVERNANCE

---

### 4. Adaptation layer (state)

[STATE][CLM-070] adaptation_infrastructure_programs_present = true
[STATE][CLM-071] adaptation_infrastructure_programs_present.owner_domain = GOVERNANCE

[STATE][CLM-072] adaptation_core_program_types = ["coastal_defense", "water_systems", "agro_adaptation"]
[STATE][CLM-073] adaptation_core_program_types.owner_domain = CLIMATE

[STATE][CLM-074] managed_relocation_programs_present = true
[STATE][CLM-075] managed_relocation_programs_present.owner_domain = GOVERNANCE

[STATE][CLM-076] climate_shocks_system_effect_mode = "adaptation_stimulus_not_collapse"
[STATE][CLM-077] climate_shocks_system_effect_mode.owner_domain = CLIMATE

---

### 5. Water, coasts, food (state)

[STATE][CLM-090] water_systems_role_in_adaptation = "key_contour"
[STATE][CLM-091] water_systems_role_in_adaptation.owner_domain = CLIMATE

[STATE][CLM-092] water_scarcity_mode = "regional_infrastructure_managed"
[STATE][CLM-093] water_scarcity_mode.owner_domain = CLIMATE

[STATE][CLM-094] coastal_protection_programs_obligatory = true
[STATE][CLM-095] coastal_protection_programs_obligatory.owner_domain = GOVERNANCE

[STATE][CLM-096] managed_retreat_is_normal_policy_in_some_zones = true
[STATE][CLM-097] managed_retreat_is_normal_policy_in_some_zones.owner_domain = GOVERNANCE

[STATE][CLM-098] food_system_stability_mode = "stable_with_local_shocks"
[STATE][CLM-099] food_system_stability_mode.owner_domain = CLIMATE

---

## USAGE / RESOLUTION

[FACT][CLM-900] Provides declarative climate and adaptation parameters for downstream documents.

[FORBIDDEN][CLM-901] Using this SSOT document for:
- emergency response protocols,
- causal chains (“why it happened”),
- default collapse-plot generation without override.

---

## OUTPUT CONTRACT

~~~yaml
doc_id: SSOT-CLIMATE-A-2215-0004
role_type: STATE
export:
  - metric: warming_C_vs_preindustrial
    owner_domain: CLIMATE
    values: {core: 2.5, p90: null, range: [2.0, 2.5]}
    unit: C

  - metric: sea_level_m
    owner_domain: CLIMATE
    values: {core: 1.7, p90: null, range: [1.5, 2.0]}
    unit: m

  - state: warming_trend_post_2215
    owner_domain: CLIMATE
    value: stable_no_accelerating_increase

  - state: net_co2_emissions_mode
    owner_domain: CLIMATE
    value: near_zero

  - state: emissions_sink_balance_state
    owner_domain: CLIMATE
    value: near_zero_equilibrium

  - state: extreme_weather_frequency_vs_20c
    owner_domain: CLIMATE
    value: higher

  - state: climate_risk_distribution
    owner_domain: CLIMATE
    value: geographically_redistributed

  - state: typical_extreme_types
    owner_domain: CLIMATE
    value: [heat_waves, intense_precipitation, storm_systems, drought_periods, compound_multi_risks]

  - state: extremes_handling_mode
    owner_domain: GOVERNANCE
    value: managed_risk_profile

  - state: adaptation_infrastructure_programs_present
    owner_domain: GOVERNANCE
    value: true

  - state: managed_relocation_programs_present
    owner_domain: GOVERNANCE
    value: true

  - state: water_scarcity_mode
    owner_domain: CLIMATE
    value: regional_infrastructure_managed
~~~

---

## FORBIDDEN

[FORBIDDEN][CLM-990] Introducing new world metrics or numeric claims outside SSOT.
[FORBIDDEN][CLM-991] Embedding causal chains, loops, resolution rules, or procedural response logic.
[FORBIDDEN][CLM-992] Treating climate state as narrative directive.

---

## NON-NORMATIVE

(Empty by design)
