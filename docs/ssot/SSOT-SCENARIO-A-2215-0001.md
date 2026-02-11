---
id: SSOT-SCENARIO-A-2215-0001
title: >
  Scenario A — Macro World State for 2215 (SSOT)
class: ssot
status: draft
prefix: SCNA
doc_language: en-US
inputs: []
depends_on:
  - SPEC-DOC_STYLE-2215-0001
references: []
scope: >
  Canonical SSOT description of Scenario A as the sole admissible macro world
  state around ~2215. Contains only declarative assertions about world state
  and admissible metric ranges.
---

## LLM-INTENT

ROLE_TYPE: STATE
SCOPE: canonical macro world state for Scenario A in year ~2215
INPUTS: []
OUTPUTS: [metric_state]
FORBIDDEN: [resolution_logic, narrative_usage, priority_rules, causal_explanations]

## DEFINITIONS

[FACT][SCNA-010] `scenario_A` = cooperative techno-optimistic trajectory of global development,
  fixed as the sole admissible world branch for 2215.

## INVARIANTS

[DECISION][SCNA-020] Scenario A is the sole admissible scenario of macro world evolution in corpus 2215.
[DECISION][SCNA-030] All downstream documents MUST use only metrics and ranges declared in this document or in domain SSOT documents.

## CONTENT

### 1. Scenario Identity

[STATE][SCNA-100] scenario_id = "A".
[STATE][SCNA-110] scenario_name = "Cooperative Techno-optimism".
[STATE][SCNA-120] scenario_confidence_estimate_percent ≈ 25.
[STATE][SCNA-130] scenario_owner_domain = SCENARIO.

### 2. Global Qualitative State

[STATE][SCNA-140] global_cooperation_level = "high".
[STATE][SCNA-150] global_technological_progress_continuity = true.
[STATE][SCNA-160] automation_scaling_mode = "systemic_global".
[STATE][SCNA-170] climate_policy_persistence = "long_term_strict".
[STATE][SCNA-180] global_warfare_norm = false.

### 3. Population and Society

[STATE][SCNA-190] population_billion.core = 8.8.
[STATE][SCNA-200] population_billion.range = [8.0, 9.5].
[STATE][SCNA-210] population_billion.unit = billion.
[STATE][SCNA-220] population_billion.owner_domain = DEMOGRAPHY.
[STATE][SCNA-230] life_expectancy_years.core = 100.
[STATE][SCNA-240] life_expectancy_years.range = [95, 110].
[STATE][SCNA-250] life_expectancy_years.unit = years.
[STATE][SCNA-260] life_expectancy_years.owner_domain = LIFE.

### 4. Energy and Climate

[STATE][SCNA-270] primary_energy_TW.core = 30.
[STATE][SCNA-280] primary_energy_TW.p90 = 60.
[STATE][SCNA-290] primary_energy_TW.unit = TW.
[STATE][SCNA-300] primary_energy_TW.owner_domain = ENERGY.
[STATE][SCNA-310] low_carbon_share_percent.core = 95.
[STATE][SCNA-320] low_carbon_share_percent.range = [90, 98].
[STATE][SCNA-330] low_carbon_share_percent.unit = percent.
[STATE][SCNA-340] low_carbon_share_percent.owner_domain = ENERGY.
[STATE][SCNA-350] warming_C_vs_preindustrial.core = 2.5.
[STATE][SCNA-360] warming_C_vs_preindustrial.range = [2.0, 2.8].
[STATE][SCNA-370] warming_C_vs_preindustrial.unit = C.
[STATE][SCNA-380] warming_C_vs_preindustrial.owner_domain = CLIMATE.
[STATE][SCNA-390] sea_level_m.core = 1.7.
[STATE][SCNA-400] sea_level_m.range = [1.2, 2.2].
[STATE][SCNA-410] sea_level_m.unit = m.
[STATE][SCNA-420] sea_level_m.owner_domain = CLIMATE.

### 5. Economy

[STATE][SCNA-430] gdp_ppp_relative_to_2025.core = 30.
[STATE][SCNA-440] gdp_ppp_relative_to_2025.p90 = 40.
[STATE][SCNA-450] gdp_ppp_relative_to_2025.unit = multiplier.
[STATE][SCNA-460] gdp_ppp_relative_to_2025.owner_domain = ECONOMY.
[STATE][SCNA-470] global_gini_index.p90 = 0.4.
[STATE][SCNA-480] global_gini_index.unit = coefficient.
[STATE][SCNA-490] global_gini_index.owner_domain = ECONOMY.

### 6. AI and Automation

[STATE][SCNA-500] labor_automation_percent_tasks.core = 80.
[STATE][SCNA-510] labor_automation_percent_tasks.p90 = 90.
[STATE][SCNA-520] labor_automation_percent_tasks.unit = percent.
[STATE][SCNA-530] labor_automation_percent_tasks.owner_domain = AUTOMATION.
[STATE][SCNA-540] ai_compute_EJ_per_year.core = 75.
[STATE][SCNA-550] ai_compute_EJ_per_year.p90 = 200.
[STATE][SCNA-560] ai_compute_EJ_per_year.unit = EJ_per_year.
[STATE][SCNA-570] ai_compute_EJ_per_year.owner_domain = AUTOMATION.

## USAGE / RESOLUTION

[DECISION][SCNA-800] This document provides admissible values and ranges of metrics for downstream documents.
[FORBIDDEN][SCNA-810] Using this document for selecting core vs p90.
[FORBIDDEN][SCNA-820] Using this document for setting scene priorities.
[FORBIDDEN][SCNA-830] Using this document for resolving conflicts between domains.

## OUTPUT CONTRACT

~~~yaml
doc_id: SSOT-SCENARIO-A-2215-0001
role_type: STATE
export:
  - metric: scenario_id
    owner_domain: SCENARIO
    values:
      core: A
      p90: none
      range: none
    unit: none
  - metric: global_cooperation_level
    owner_domain: SCENARIO
    values:
      core: high
      p90: none
      range: none
    unit: none
  - metric: global_technological_progress_continuity
    owner_domain: SCENARIO
    values:
      core: true
      p90: none
      range: none
    unit: none
  - metric: automation_scaling_mode
    owner_domain: SCENARIO
    values:
      core: systemic_global
      p90: none
      range: none
    unit: none
  - metric: climate_policy_persistence
    owner_domain: SCENARIO
    values:
      core: long_term_strict
      p90: none
      range: none
    unit: none
  - metric: global_warfare_norm
    owner_domain: SCENARIO
    values:
      core: false
      p90: none
      range: none
    unit: none
  - metric: population_billion
    owner_domain: DEMOGRAPHY
    values:
      core: 8.8
      p90: none
      range: [8.0, 9.5]
    unit: billion
  - metric: life_expectancy_years
    owner_domain: LIFE
    values:
      core: 100
      p90: none
      range: [95, 110]
    unit: years
  - metric: primary_energy_TW
    owner_domain: ENERGY
    values:
      core: 30
      p90: 60
      range: none
    unit: TW
  - metric: low_carbon_share_percent
    owner_domain: ENERGY
    values:
      core: 95
      p90: none
      range: [90, 98]
    unit: percent
  - metric: warming_C_vs_preindustrial
    owner_domain: CLIMATE
    values:
      core: 2.5
      p90: none
      range: [2.0, 2.8]
    unit: C
  - metric: sea_level_m
    owner_domain: CLIMATE
    values:
      core: 1.7
      p90: none
      range: [1.2, 2.2]
    unit: m
  - metric: gdp_ppp_relative_to_2025
    owner_domain: ECONOMY
    values:
      core: 30
      p90: 40
      range: none
    unit: multiplier
  - metric: global_gini_index
    owner_domain: ECONOMY
    values:
      core: none
      p90: 0.4
      range: none
    unit: coefficient
  - metric: labor_automation_percent_tasks
    owner_domain: AUTOMATION
    values:
      core: 80
      p90: 90
      range: none
    unit: percent
  - metric: ai_compute_EJ_per_year
    owner_domain: AUTOMATION
    values:
      core: 75
      p90: 200
      range: none
    unit: EJ_per_year
~~~

## FORBIDDEN

[FORBIDDEN][SCNA-900] Introducing new metrics not declared in SSOT.
[FORBIDDEN][SCNA-910] Embedding causal logic or scenario comparison.
[FORBIDDEN][SCNA-920] Using this document as narrative directive.

## NON-NORMATIVE

~~~text
Empty by design.
~~~