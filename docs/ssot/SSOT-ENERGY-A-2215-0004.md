---
id: SSOT-ENERGY-A-2215-0004
title: >
  Energy System — Scenario A (2215, SSOT State)
class: ssot
status: draft
prefix: ENG
doc_language: en-US
inputs: []
depends_on:
  - SPEC-DOC_STYLE-2215-0001
  - SSOT-ECONOMY-A-2215-0003
  - SSOT-SCENARIO-A-2215-0001
references: []
scope: >
  SSOT state of the global energy system in 2215 (Scenario A).
  Contains only declarative metrics (core/p90/range) and binary/categorical
  energy system properties. Does not contain causality, procedures,
  failure scenarios, or conflict resolution.
---

## LLM-INTENT

ROLE_TYPE: STATE
SCOPE: global energy system state for Scenario A around year 2215
INPUTS: []
OUTPUTS: [energy_metric_state]
FORBIDDEN: [causal_logic, resolution_rules, narrative_explanations, failure_models]

## DEFINITIONS

[FACT][ENG-010] `energy_system` = global generation, storage, transmission, and consumption of energy in Scenario A.

## INVARIANTS

[DECISION][ENG-020] This document is applicable ONLY to Scenario A.
[DECISION][ENG-030] Energy system is treated as critical infrastructure.
[DECISION][ENG-040] Fossil fuels are not the dominant energy source.
[DECISION][ENG-050] Energy system does not impose a hard cap on economic growth within declared Scenario A metrics.

## CONTENT

### 1. Primary Energy

[STATE][ENG-100] primary_energy_TW.core = 30.
[STATE][ENG-110] primary_energy_TW.p90 = 60.
[STATE][ENG-120] primary_energy_TW.range = [20, 60].
[STATE][ENG-130] primary_energy_TW.unit = TW.
[STATE][ENG-140] primary_energy_TW.owner_domain = ENERGY.

### 2. Energy Mix

[STATE][ENG-150] low_carbon_share_percent.core = 95.
[STATE][ENG-160] low_carbon_share_percent.range = [90, 98].
[STATE][ENG-170] low_carbon_share_percent.unit = percent.
[STATE][ENG-180] low_carbon_share_percent.owner_domain = ENERGY.
[STATE][ENG-190] fossil_energy_role = "residual_niche".
[STATE][ENG-200] fossil_energy_role.owner_domain = ENERGY.
[STATE][ENG-210] generation_mix_structure = "renewables + nuclear + advanced_sources".
[STATE][ENG-220] generation_mix_structure.owner_domain = ENERGY.
[STATE][ENG-230] generation_mix_quantified = false.
[STATE][ENG-240] generation_mix_quantified.owner_domain = ENERGY.

### 3. Energy Efficiency

[STATE][ENG-250] global_energy_intensity_vs_2025.core = 0.33.
[STATE][ENG-260] global_energy_intensity_vs_2025.p90 = none.
[STATE][ENG-270] global_energy_intensity_vs_2025.range = none.
[STATE][ENG-280] global_energy_intensity_vs_2025.unit = ratio.
[STATE][ENG-290] global_energy_intensity_vs_2025.owner_domain = ENERGY.
[STATE][ENG-300] system_eroei_trend = "stable_or_higher_than_2025".
[STATE][ENG-310] system_eroei_trend.owner_domain = ENERGY.

### 4. Electrification and End Use

[STATE][ENG-320] transport_electrification_percent.core = 95.
[STATE][ENG-330] transport_electrification_percent.range = [90, 100].
[STATE][ENG-340] transport_electrification_percent.unit = percent.
[STATE][ENG-350] transport_electrification_percent.owner_domain = ENERGY.
[STATE][ENG-360] transport_automation_level.source = "SSOT-AUTOMATION-A-2215-0004".
[STATE][ENG-370] transport_automation_level.owner_domain = AUTOMATION.
[DECISION][ENG-380] ENERGY SSOT MUST NOT redefine AUTOMATION-owned metrics.
[STATE][ENG-390] industry_electrification_level = "near_total".
[STATE][ENG-400] industry_electrification_level.owner_domain = ENERGY.
[STATE][ENG-410] buildings_modernized_share_percent.core = 90.
[STATE][ENG-420] buildings_modernized_share_percent.range = [85, 98].
[STATE][ENG-430] buildings_modernized_share_percent.unit = percent.
[STATE][ENG-440] buildings_modernized_share_percent.owner_domain = URBANISM.

### 5. Storage and Grid

[STATE][ENG-450] energy_storage_layer_present = true.
[STATE][ENG-460] energy_storage_layer_present.owner_domain = ENERGY.
[STATE][ENG-470] energy_storage_scope = "short_and_mid_term".
[STATE][ENG-480] energy_storage_scope.owner_domain = ENERGY.
[STATE][ENG-490] grid_resilience_design = "redundant_segmented_self_healing".
[STATE][ENG-500] grid_resilience_design.owner_domain = ENERGY.

### 6. Compute and Energy Coupling

[STATE][ENG-510] ai_energy_share_percent.source = "SSOT-AUTOMATION-A-2215-0004".
[STATE][ENG-520] ai_energy_share_percent.owner_domain = AUTOMATION.
[DECISION][ENG-530] ENERGY SSOT MUST NOT declare or export AUTOMATION-owned metrics.

## USAGE / RESOLUTION

[DECISION][ENG-800] This document provides declarative numeric ranges and qualitative energy system states for downstream documents.
[FORBIDDEN][ENG-810] Using this SSOT document for failure or outage modeling.
[FORBIDDEN][ENG-820] Using this SSOT document for recovery or response procedures.
[FORBIDDEN][ENG-830] Using this SSOT document for resolving core vs p90 conflicts.

## OUTPUT CONTRACT

~~~yaml
doc_id: SSOT-ENERGY-A-2215-0004
role_type: STATE
export:
  - metric: primary_energy_TW
    owner_domain: ENERGY
    values:
      core: 30
      p90: 60
      range: [20, 60]
    unit: TW
  - metric: low_carbon_share_percent
    owner_domain: ENERGY
    values:
      core: 95
      p90: none
      range: [90, 98]
    unit: percent
  - metric: fossil_energy_role
    owner_domain: ENERGY
    values:
      core: residual_niche
      p90: none
      range: none
    unit: none
  - metric: generation_mix_structure
    owner_domain: ENERGY
    values:
      core: "renewables + nuclear + advanced_sources"
      p90: none
      range: none
    unit: none
  - metric: global_energy_intensity_vs_2025
    owner_domain: ENERGY
    values:
      core: 0.33
      p90: none
      range: none
    unit: ratio
  - metric: system_eroei_trend
    owner_domain: ENERGY
    values:
      core: stable_or_higher_than_2025
      p90: none
      range: none
    unit: none
  - metric: transport_electrification_percent
    owner_domain: ENERGY
    values:
      core: 95
      p90: none
      range: [90, 100]
    unit: percent
  - metric: industry_electrification_level
    owner_domain: ENERGY
    values:
      core: near_total
      p90: none
      range: none
    unit: none
  - metric: buildings_modernized_share_percent
    owner_domain: URBANISM
    values:
      core: 90
      p90: none
      range: [85, 98]
    unit: percent
  - metric: energy_storage_layer_present
    owner_domain: ENERGY
    values:
      core: true
      p90: none
      range: none
    unit: none
  - metric: energy_storage_scope
    owner_domain: ENERGY
    values:
      core: short_and_mid_term
      p90: none
      range: none
    unit: none
  - metric: grid_resilience_design
    owner_domain: ENERGY
    values:
      core: redundant_segmented_self_healing
      p90: none
      range: none
    unit: none
~~~

## FORBIDDEN

[FORBIDDEN][ENG-900] Introducing new energy metrics outside SSOT.
[FORBIDDEN][ENG-910] Embedding causal chains, failure narratives, or procedures.
[FORBIDDEN][ENG-920] Using qualitative states as resolution or decision logic.
[FORBIDDEN][ENG-930] Declaring or exporting AUTOMATION-owned metrics in ENERGY SSOT.

## NON-NORMATIVE

~~~text
Empty by design.
~~~