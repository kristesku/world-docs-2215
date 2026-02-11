---
id: SSOT-SPACE-INDUSTRY-A-2215-0006
title: >
  Space Industry and Orbital Infrastructure — Scenario A (2215, SSOT State)
class: ssot
status: draft
prefix: SPI
doc_language: en-US
inputs:
  - SSOT-SCENARIO-A-2215-0001
  - SSOT-ECONOMY-A-2215-0003
depends_on:
  - SPEC-DOC_STYLE-2215-0001
references: []
scope: >
  Canonical SSOT state of global space industry and orbital infrastructure
  in 2215 under Scenario A: scale, functions, population, economic role,
  governance, and structural constraints. Contains declarative numerical
  and categorical state only.
---

## LLM-INTENT

ROLE_TYPE: STATE
SCOPE: space industry and orbital infrastructure state for Scenario A around year 2215
INPUTS: []
OUTPUTS: [space_industry_state]
FORBIDDEN: [causal_logic, resolution_rules, narrative_explanations, colonization_epics]

## DEFINITIONS

[FACT][SPI-DEF-010] space_industry = industrial, logistics, and service systems supporting orbital and cislunar infrastructure.
[FACT][SPI-DEF-020] orbital_infrastructure = satellites, platforms, communication/navigation/observation nodes maintained by industrial systems.

## INVARIANTS

[DECISION][SPI-INV-000] Applicable only within Scenario A.
[DECISION][SPI-INV-010] Space functions as an infrastructural extension of Earth’s economy, not as an autonomous civilization.
[DECISION][SPI-INV-020] No mass space colonization has occurred.

## CONTENT

### 1. Presence and Population (Orbital / Cislunar)

[STATE][SPI-010] offworld_permanent_population.core = 50000
[STATE][SPI-011] offworld_permanent_population.range = [20000, 100000]
[STATE][SPI-012] offworld_permanent_population.unit = persons

[STATE][SPI-014] offworld_presence_primary_zones = [LEO, GEO_nodes, cislunar]
[STATE][SPI-016] lunar_presence_mode = industrial_scientific_not_mass_settlement

### 2. Core Functions

[STATE][SPI-020] space_industry_core_functions = [
  orbital_infrastructure_build_and_service,
  limited_extraterrestrial_resource_processing,
  niche_orbital_energy_support,
  microgravity_vacuum_experiments
]

### 3. Economic Role

[STATE][SPI-030] space_industry_is_dominant_sector = false
[STATE][SPI-032] space_economy_gdp_share_percent = low_single_digit
[STATE][SPI-034] primary_value_to_earth_infrastructure = [communications, navigation, observation, security_support]

### 4. Automation and Labor

[STATE][SPI-040] space_operations_automation_level = very_high
[STATE][SPI-042] dominant_operational_agents = [robots, drones, autonomous_systems]
[STATE][SPI-044] human_roles_in_space = [supervision, repair, nonstandard_decisions, science]
[STATE][SPI-046] human_access_mode = specialized_training_and_clearance

### 5. Logistics and Transport

[STATE][SPI-060] space_logistics_transport_mode = [reusable_systems, autonomous_tugs]
[STATE][SPI-062] inter_node_cargo_movement_automation = high
[STATE][SPI-064] launch_cost_constraint_level = material

### 6. Governance and Control

[STATE][SPI-080] space_activity_regulation_mode = international_regimes_and_treaties
[STATE][SPI-082] space_sovereign_state_exists = false
[STATE][SPI-084] actors_in_space = [states, corporations]
[STATE][SPI-086] access_basis = [licenses, supranational_agreements]
[STATE][SPI-088] space_militarization_level = limited_not_eliminated

### 7. Constraints and Limits

[STATE][SPI-100] scaling_constraints = [logistics_cost, radiation_risk, life_support_complexity]
[STATE][SPI-102] space_is_mass_migration_destination = false
[STATE][SPI-104] project_filter = economic_viability

## OUTPUT CONTRACT

~~~yaml
doc_id: SSOT-SPACE-INDUSTRY-A-2215-0006
role_type: STATE
export:
  - metric: offworld_permanent_population
    owner_domain: SPACE-INDUSTRY
    values:
      core: 50000
      p90: null
      range: [20000, 100000]
    unit: persons

  - metric: offworld_presence_primary_zones
    owner_domain: SPACE-INDUSTRY
    values:
      core: [LEO, GEO_nodes, cislunar]
      p90: null
      range: null
    unit: none

  - metric: space_economy_gdp_share_percent
    owner_domain: ECONOMY
    values:
      core: low_single_digit
      p90: null
      range: null
    unit: none

  - metric: space_operations_automation_level
    owner_domain: AUTOMATION
    values:
      core: very_high
      p90: null
      range: null
    unit: none

  - metric: space_militarization_level
    owner_domain: SECURITY
    values:
      core: limited_not_eliminated
      p90: null
      range: null
    unit: none
~~~

## FORBIDDEN

[FORBIDDEN][SPI-990] Introducing new world metrics or numeric claims outside SSOT.
[FORBIDDEN][SPI-991] Embedding causal chains or procedural logic.
[FORBIDDEN][SPI-992] Treating space industry state as narrative directive.

## NON-NORMATIVE

~~~text
Empty by design.
~~~
