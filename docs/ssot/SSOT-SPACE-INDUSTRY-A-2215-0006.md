---
id: SSOT-SPACE-INDUSTRY-A-2215-0006
title: >
  Space Industry and Orbital Infrastructure — Scenario A (2215, SSOT State)
class: ssot
status: draft
version: 1.0.0
inputs:
  - REG-TECH-2215-0001
  - SSOT-SCENARIO-A-2215-0001
  - SSOT-ECONOMY-A-2215-0003
depends_on:
  - SPEC-DOC_STYLE-2215-0001
scope: >
  Каноническое SSOT-состояние космической индустрии и орбитальной
  инфраструктуры мира в 2215 году в рамках Scenario A: масштабы,
  функции, население, роль в экономике и системные ограничения.
  Документ содержит только декларативные числовые и категориальные состояния.
---

## LLM-INTENT

ROLE_TYPE: STATE
SCOPE: space industry and orbital infrastructure state for Scenario A in year ~2215
INPUTS: []
OUTPUTS: [space_industry_state]
FORBIDDEN: [causal_logic, resolution_rules, narrative_explanations, colonization_epics]

---

## DEFINITIONS

- Space industry — производственные, логистические и сервисные контуры,
  обеспечивающие орбитальную/цислунарную инфраструктуру.
- Orbital infrastructure — спутники, платформы, узлы связи/навигации/наблюдения,
  обслуживаемые и заменяемые индустриальными контурами.

---

## INVARIANTS

- [FACT][SPI-000] Документ применим только в рамках Scenario A.
- [FACT][SPI-001] Космос является инфраструктурным продолжением земной экономики,
  а не автономной цивилизацией.
- [FACT][SPI-002] Массовой космической колонизации не произошло.

---

## CONTENT

### 1. Presence and Population (Orbital / Cislunar)

- [STATE][SPI-010] offworld_permanent_population.core = 50000
- [STATE][SPI-011] offworld_permanent_population.range = [20000, 100000]
- [STATE][SPI-012] offworld_permanent_population.unit = persons
- [STATE][SPI-013] offworld_permanent_population.owner_domain = SPACE-INDUSTRY

- [STATE][SPI-014] offworld_presence_primary_zones = ["LEO", "GEO_nodes", "cislunar"]
- [STATE][SPI-015] offworld_presence_zones_owner_domain = SPACE-INDUSTRY

- [STATE][SPI-016] lunar_presence_mode = "industrial_scientific_not_mass_settlement"
- [STATE][SPI-017] lunar_presence_owner_domain = SPACE-INDUSTRY

---

### 2. Core Functions (Qualitative Set)

- [STATE][SPI-020] space_industry_core_functions = [
    "orbital_infrastructure_build_and_service",
    "limited_extraterrestrial_resource_processing",
    "niche_orbital_energy_support",
    "microgravity_vacuum_experiments"
  ]
- [STATE][SPI-021] space_functions_owner_domain = SPACE-INDUSTRY

---

### 3. Economic Role

- [STATE][SPI-030] space_industry_is_dominant_sector = false
- [STATE][SPI-031] space_industry_dominance_owner_domain = ECONOMY

- [STATE][SPI-032] space_economy_gdp_share_percent = "low_single_digit"
- [STATE][SPI-033] space_gdp_share_owner_domain = ECONOMY

- [STATE][SPI-034] primary_value_to_earth_infrastructure = ["communications", "navigation", "observation", "security_support"]
- [STATE][SPI-035] primary_value_owner_domain = SPACE-INDUSTRY

---

### 4. Automation and Labor

- [STATE][SPI-040] space_operations_automation_level = "very_high"
- [STATE][SPI-041] space_automation_owner_domain = AUTOMATION

- [STATE][SPI-042] dominant_operational_agents = ["robots", "drones", "autonomous_systems"]
- [STATE][SPI-043] dominant_agents_owner_domain = AUTOMATION

- [STATE][SPI-044] human_roles_in_space = ["supervision", "repair", "nonstandard_decisions", "science"]
- [STATE][SPI-045] human_roles_owner_domain = SPACE-INDUSTRY

- [STATE][SPI-046] human_access_mode = "specialized_training_and_clearance"
- [STATE][SPI-047] human_access_owner_domain = GOVERNANCE

---

### 5. Logistics and Transport

- [STATE][SPI-060] space_logistics_transport_mode = ["reusable_systems", "autonomous_tugs"]
- [STATE][SPI-061] space_transport_owner_domain = SPACE-INDUSTRY

- [STATE][SPI-062] inter_node_cargo_movement_automation = "high"
- [STATE][SPI-063] inter_node_cargo_automation_owner_domain = AUTOMATION

- [STATE][SPI-064] launch_cost_constraint_level = "material"
- [STATE][SPI-065] launch_cost_constraint_owner_domain = ECONOMY

---

### 6. Governance and Control

- [STATE][SPI-080] space_activity_regulation_mode = "international_regimes_and_treaties"
- [STATE][SPI-081] space_regulation_owner_domain = GOVERNANCE

- [STATE][SPI-082] space_sovereign_state_exists = false
- [STATE][SPI-083] space_sovereignty_owner_domain = GOVERNANCE

- [STATE][SPI-084] actors_in_space = ["states", "corporations"]
- [STATE][SPI-085] actors_in_space_owner_domain = GOVERNANCE

- [STATE][SPI-086] access_basis = ["licenses", "supranational_agreements"]
- [STATE][SPI-087] access_basis_owner_domain = GOVERNANCE

- [STATE][SPI-088] space_militarization_level = "limited_not_eliminated"
- [STATE][SPI-089] space_militarization_owner_domain = SECURITY

---

### 7. Constraints and Limits (State)

- [STATE][SPI-100] scaling_constraints = ["logistics_cost", "radiation_risk", "life_support_complexity"]
- [STATE][SPI-101] scaling_constraints_owner_domain = SPACE-INDUSTRY

- [STATE][SPI-102] space_is_mass_migration_destination = false
- [STATE][SPI-103] space_migration_owner_domain = DEMOGRAPHY

- [STATE][SPI-104] project_filter = "economic_viability"
- [STATE][SPI-105] project_filter_owner_domain = ECONOMY

---

## USAGE / RESOLUTION

- [FACT][SPI-900] Документ предоставляет декларативные свойства космической индустрии
  и орбитальной инфраструктуры для downstream-документов.

- [FORBIDDEN][SPI-901] Использование данного документа для:
  - построения причинных цепочек и “почему так сложилось”,
  - описания операционных процедур или протоколов доступа,
  - романтизации колонизации как доминирующей нормы.

---

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

  - key: offworld_presence_primary_zones
    value: [LEO, GEO_nodes, cislunar]
    owner_domain: SPACE-INDUSTRY

  - key: space_economy_gdp_share_percent
    value: low_single_digit
    owner_domain: ECONOMY

  - key: space_operations_automation_level
    value: very_high
    owner_domain: AUTOMATION

  - key: space_militarization_level
    value: limited_not_eliminated
    owner_domain: SECURITY
~~~

---

## FORBIDDEN

- [FORBIDDEN][SPI-990] Introducing new world metrics or numeric claims outside SSOT.
- [FORBIDDEN][SPI-991] Embedding causal chains or procedural logic.
- [FORBIDDEN][SPI-992] Treating space industry state as narrative directive.

---

## NON-NORMATIVE

(Empty by design)
