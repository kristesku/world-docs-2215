---
id: SSOT-DEMOGRAPHY-A-2215-0002
title: >
  Demography — Scenario A (2215, SSOT State)
class: ssot
status: draft
prefix: DEM
doc_language: en-US
inputs:
  - SSOT-ECONOMY-A-2215-0003
  - SSOT-LIFE-A-2215-0007
  - SSOT-SCENARIO-A-2215-0001
depends_on:
  - SPEC-DOC_STYLE-2215-0001
references: []
scope: >
  SSOT state of global demography in 2215 (Scenario A).
  Contains only declarative numeric and qualitative demographic parameters.
  Does not introduce causality or scenario modes.
---

## LLM-INTENT

ROLE_TYPE: STATE
SCOPE: global demographic state for Scenario A around year 2215
INPUTS:
  - SSOT-ECONOMY-A-2215-0003
  - SSOT-LIFE-A-2215-0007
  - SSOT-SCENARIO-A-2215-0001
OUTPUTS: [demography_metric_state]
FORBIDDEN: [causal_logic, resolution_rules, narrative_explanations]

## DEFINITIONS

[FACT][DEM-010] `demography` = population size, age structure, spatial distribution, and mobility equilibrium.

## INVARIANTS

[DECISION][DEM-020] This document is applicable ONLY to Scenario A.
[DECISION][DEM-030] Demography is treated as a slowly changing systemic contour.
[DECISION][DEM-040] No extreme demographic collapse is assumed by default.

## CONTENT

### 1. Total Population

[STATE][DEM-100] population_billion.core = 8.8.
[STATE][DEM-110] population_billion.p90 = none.
[STATE][DEM-120] population_billion.range = [8.5, 9.0].
[STATE][DEM-130] population_billion.unit = billion.
[STATE][DEM-140] population_billion.owner_domain = DEMOGRAPHY.
[STATE][DEM-150] population_growth_mode = "post_peak_stable".
[STATE][DEM-160] population_growth_mode.owner_domain = DEMOGRAPHY.

### 2. Age Structure and Longevity

[STATE][DEM-170] life_expectancy_years.core = 100.
[STATE][DEM-180] life_expectancy_years.p90 = none.
[STATE][DEM-190] life_expectancy_years.range = [95, 110].
[STATE][DEM-200] life_expectancy_years.unit = years.
[STATE][DEM-210] life_expectancy_years.owner_domain = LIFE.
[STATE][DEM-220] population_age_structure = "older_but_active".
[STATE][DEM-230] population_age_structure.owner_domain = DEMOGRAPHY.
[STATE][DEM-240] retirement_age_concept = "blurred".
[STATE][DEM-250] retirement_age_concept.owner_domain = GOVERNANCE.

### 3. Fertility and Reproduction

[STATE][DEM-260] total_fertility_rate.core = none.
[STATE][DEM-270] total_fertility_rate.p90 = none.
[STATE][DEM-280] total_fertility_rate.range = [1.5, 1.8].
[STATE][DEM-290] total_fertility_rate.unit = births_per_woman.
[STATE][DEM-300] total_fertility_rate.owner_domain = DEMOGRAPHY.
[STATE][DEM-310] fertility_control_mode = "cultural_political".
[STATE][DEM-320] fertility_control_mode.owner_domain = GOVERNANCE.
[STATE][DEM-330] assisted_reproduction_prevalence = "common_not_dominant".
[STATE][DEM-340] assisted_reproduction_prevalence.owner_domain = LIFE.

### 4. Urbanization

[STATE][DEM-350] urban_population_share_percent.source = "SSOT-URBANISM-A-2215-0007".
[STATE][DEM-360] urban_population_share_percent.owner_domain = URBANISM.
[DECISION][DEM-370] Demography MUST NOT declare, duplicate, or export URBANISM-owned metrics.

### 5. Regional Distribution

[STATE][DEM-380] regional_population_concentration = "africa_south_asia_high_share".
[STATE][DEM-390] regional_population_concentration.owner_domain = DEMOGRAPHY.
[STATE][DEM-400] interregional_demographic_divergence = "reduced".
[STATE][DEM-410] interregional_demographic_divergence.owner_domain = DEMOGRAPHY.

### 6. Migration and Mobility

[STATE][DEM-420] migration_primary_drivers = ["climate", "economy", "security"].
[STATE][DEM-430] migration_primary_drivers.owner_domain = DEMOGRAPHY.
[STATE][DEM-440] migration_regulation_mode = "institutionalized".
[STATE][DEM-450] migration_regulation_mode.owner_domain = GOVERNANCE.
[STATE][DEM-460] open_borders_exist = false.
[STATE][DEM-470] open_borders_exist.owner_domain = GOVERNANCE.
[STATE][DEM-480] uncontrolled_mass_migration = false.
[STATE][DEM-490] uncontrolled_mass_migration.owner_domain = GOVERNANCE.

## USAGE / RESOLUTION

[DECISION][DEM-800] This document provides declarative numeric ranges and qualitative demographic states for downstream documents.
[FORBIDDEN][DEM-810] Using this SSOT document for causal explanations of demographic change.
[FORBIDDEN][DEM-820] Using this SSOT document for crisis modeling.
[FORBIDDEN][DEM-830] Using this SSOT document for selecting narrative or scene modes.

## OUTPUT CONTRACT

~~~yaml
doc_id: SSOT-DEMOGRAPHY-A-2215-0002
role_type: STATE
export:
  - metric: population_billion
    owner_domain: DEMOGRAPHY
    values:
      core: 8.8
      p90: none
      range: [8.5, 9.0]
    unit: billion
  - metric: population_growth_mode
    owner_domain: DEMOGRAPHY
    values:
      core: post_peak_stable
      p90: none
      range: none
    unit: none
  - metric: life_expectancy_years
    owner_domain: LIFE
    values:
      core: 100
      p90: none
      range: [95, 110]
    unit: years
  - metric: population_age_structure
    owner_domain: DEMOGRAPHY
    values:
      core: older_but_active
      p90: none
      range: none
    unit: none
  - metric: retirement_age_concept
    owner_domain: GOVERNANCE
    values:
      core: blurred
      p90: none
      range: none
    unit: none
  - metric: total_fertility_rate
    owner_domain: DEMOGRAPHY
    values:
      core: none
      p90: none
      range: [1.5, 1.8]
    unit: births_per_woman
  - metric: fertility_control_mode
    owner_domain: GOVERNANCE
    values:
      core: cultural_political
      p90: none
      range: none
    unit: none
  - metric: assisted_reproduction_prevalence
    owner_domain: LIFE
    values:
      core: common_not_dominant
      p90: none
      range: none
    unit: none
  - metric: regional_population_concentration
    owner_domain: DEMOGRAPHY
    values:
      core: africa_south_asia_high_share
      p90: none
      range: none
    unit: none
  - metric: interregional_demographic_divergence
    owner_domain: DEMOGRAPHY
    values:
      core: reduced
      p90: none
      range: none
    unit: none
  - metric: migration_primary_drivers
    owner_domain: DEMOGRAPHY
    values:
      core: [climate, economy, security]
      p90: none
      range: none
    unit: none
  - metric: migration_regulation_mode
    owner_domain: GOVERNANCE
    values:
      core: institutionalized
      p90: none
      range: none
    unit: none
  - metric: open_borders_exist
    owner_domain: GOVERNANCE
    values:
      core: false
      p90: none
      range: none
    unit: none
  - metric: uncontrolled_mass_migration
    owner_domain: GOVERNANCE
    values:
      core: false
      p90: none
      range: none
    unit: none
~~~

## FORBIDDEN

[FORBIDDEN][DEM-900] Introducing new demographic metrics outside SSOT.
[FORBIDDEN][DEM-910] Embedding causal chains or sociological narratives.
[FORBIDDEN][DEM-920] Treating qualitative states as narrative drivers.
[FORBIDDEN][DEM-930] Declaring or exporting URBANISM-owned metrics in DEMOGRAPHY SSOT.

## NON-NORMATIVE

~~~text
Empty by design.
~~~