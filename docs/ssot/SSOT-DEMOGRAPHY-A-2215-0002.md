---
id: SSOT-DEMOGRAPHY-A-2215-0002
title: >
  Demography — Scenario A (2215, SSOT State)
class: ssot
status: draft
version: 1.1.0
inputs:
  - SSOT-SCENARIO-A-2215-0001
  - SSOT-ECONOMY-A-2215-0003
  - SSOT-LIFE-A-2215-0007
depends_on:
  - SPEC-DOC-STYLE-2215-0001
scope: >
  SSOT-состояние демографии мира в 2215 году (Scenario A).
  Документ содержит только декларативные числовые и качественные
  демографические параметры и не вводит причинность или сценарные режимы.
---

## LLM-INTENT

ROLE_TYPE: STATE
SCOPE: global demographic state for Scenario A around year 2215
INPUTS: []
OUTPUTS:
  - demography_metric_state
FORBIDDEN:
  - causal_logic
  - resolution_rules
  - narrative_explanations

---

## DEFINITIONS

[DEF][DEM-DEF-010] demography = population size, age structure, spatial distribution, and mobility equilibrium.

---

## INVARIANTS

[FACT][DEM-000] Applicable only to Scenario A.
[FACT][DEM-001] Demography is treated as a slowly changing systemic contour.
[FACT][DEM-002] No extreme demographic collapse is assumed by default.

---

## CONTENT

### 1. Total population

[STATE][DEM-010] population_billion.core = 8.8
[STATE][DEM-011] population_billion.p90 = null
[STATE][DEM-012] population_billion.range = [8.5, 9.0]
[STATE][DEM-013] population_billion.unit = billion
[STATE][DEM-014] population_billion.owner_domain = DEMOGRAPHY

[STATE][DEM-015] population_growth_mode = "post_peak_stable"
[STATE][DEM-016] population_growth_mode.owner_domain = DEMOGRAPHY

---

### 2. Age structure and longevity

[STATE][DEM-020] life_expectancy_years.core = 100
[STATE][DEM-021] life_expectancy_years.p90 = null
[STATE][DEM-022] life_expectancy_years.range = [95, 110]
[STATE][DEM-023] life_expectancy_years.unit = years
[STATE][DEM-024] life_expectancy_years.owner_domain = LIFE

[STATE][DEM-025] population_age_structure = "older_but_active"
[STATE][DEM-026] population_age_structure.owner_domain = DEMOGRAPHY

[STATE][DEM-027] retirement_age_concept = "blurred"
[STATE][DEM-028] retirement_age_concept.owner_domain = GOVERNANCE

---

### 3. Fertility and reproduction

[STATE][DEM-030] total_fertility_rate.core = null
[STATE][DEM-031] total_fertility_rate.p90 = null
[STATE][DEM-032] total_fertility_rate.range = [1.5, 1.8]
[STATE][DEM-033] total_fertility_rate.unit = births_per_woman
[STATE][DEM-034] total_fertility_rate.owner_domain = DEMOGRAPHY

[STATE][DEM-035] fertility_control_mode = "cultural_political"
[STATE][DEM-036] fertility_control_mode.owner_domain = GOVERNANCE

[STATE][DEM-037] assisted_reproduction_prevalence = "common_not_dominant"
[STATE][DEM-038] assisted_reproduction_prevalence.owner_domain = LIFE

---

### 4. Urbanization (external ownership)

[STATE][DEM-040] urban_population_share_percent.source = "SSOT-URBANISM-A-2215-0007"
[STATE][DEM-041] urban_population_share_percent.owner_domain = URBANISM
[DECISION][DEM-042] Demography MUST NOT declare, duplicate, or export URBANISM-owned metrics.

---

### 5. Regional distribution

[STATE][DEM-050] regional_population_concentration = "africa_south_asia_high_share"
[STATE][DEM-051] regional_population_concentration.owner_domain = DEMOGRAPHY

[STATE][DEM-052] interregional_demographic_divergence = "reduced"
[STATE][DEM-053] interregional_demographic_divergence.owner_domain = DEMOGRAPHY

---

### 6. Migration and mobility

[STATE][DEM-060] migration_primary_drivers = ["climate", "economy", "security"]
[STATE][DEM-061] migration_primary_drivers.owner_domain = DEMOGRAPHY

[STATE][DEM-062] migration_regulation_mode = "institutionalized"
[STATE][DEM-063] migration_regulation_mode.owner_domain = GOVERNANCE

[STATE][DEM-064] open_borders_exist = false
[STATE][DEM-065] open_borders_exist.owner_domain = GOVERNANCE

[STATE][DEM-066] uncontrolled_mass_migration = false
[STATE][DEM-067] uncontrolled_mass_migration.owner_domain = GOVERNANCE

---

## USAGE / RESOLUTION

[FACT][DEM-090] Provides declarative numeric ranges and qualitative demographic states for downstream documents.

[FORBIDDEN][DEM-091] Using this SSOT document for:
- causal explanations of demographic change,
- crisis modeling,
- selecting narrative or scene modes.

---

## OUTPUT CONTRACT

~~~yaml
doc_id: SSOT-DEMOGRAPHY-A-2215-0002
role_type: STATE
export:
  - metric: population_billion
    owner_domain: DEMOGRAPHY
    values: {core: 8.8, p90: null, range: [8.5, 9.0]}
    unit: billion

  - metric: life_expectancy_years
    owner_domain: LIFE
    values: {core: 100, p90: null, range: [95, 110]}
    unit: years

  - metric: total_fertility_rate
    owner_domain: DEMOGRAPHY
    values: {core: null, p90: null, range: [1.5, 1.8]}
    unit: births_per_woman
~~~

---

## FORBIDDEN

[FORBIDDEN][DEM-100] Introducing new demographic metrics outside SSOT.
[FORBIDDEN][DEM-101] Embedding causal chains or sociological narratives.
[FORBIDDEN][DEM-102] Treating qualitative states as narrative drivers.
[FORBIDDEN][DEM-103] Declaring or exporting URBANISM-owned metrics in DEMOGRAPHY SSOT.

---

## NON-NORMATIVE

(Empty by design)
