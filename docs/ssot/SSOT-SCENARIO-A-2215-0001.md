---
id: SSOT-SCENARIO-A-2215-0001
title: >
  Scenario A — Macro World State for 2215 (SSOT)
class: ssot
status: draft
version: 1.0.0
prefix: SCNA
doc_language: en-US
prose_language: ru-RU
inputs: []
depends_on: [SPEC-DOC_STYLE-2215-0001]
scope: >
  Каноническое SSOT-описание Scenario A как единственного допустимого
  макро-состояния мира к ~2215. Документ содержит только декларативные
  утверждения о состоянии мира и допустимых диапазонах метрик.
---

## LLM-INTENT

ROLE_TYPE: STATE
SCOPE: canonical macro world state for Scenario A in year ~2215
INPUTS: []
OUTPUTS: [metric_state]
FORBIDDEN: [resolution_logic, narrative_usage, priority_rules, causal_explanations]

## DEFINITIONS

- Scenario A — кооперативная техно-оптимистическая траектория глобального развития,
  зафиксированная как единственная допустимая ветка мира 2215.

## INVARIANTS

- [FACT][SCNA-000] Scenario A является единственным допустимым сценарием
  макро-эволюции мира в корпусе 2215.

- [FACT][SCNA-001] Все downstream-документы ОБЯЗАНЫ использовать только
  метрики и диапазоны, объявленные в данном документе или в доменных SSOT.

## CONTENT

### 1. Scenario Identity

- [STATE][SCNA-010] scenario_id = "A"
- [STATE][SCNA-011] scenario_name = "Cooperative Techno-optimism"
- [STATE][SCNA-012] scenario_confidence_estimate_percent ≈ 25
- [STATE][SCNA-013] scenario_owner_domain = SCENARIO

### 2. Global Qualitative State (2215)

- [STATE][SCNA-020] global_cooperation_level = "high"
- [STATE][SCNA-021] global_technological_progress_continuity = true
- [STATE][SCNA-022] automation_scaling_mode = "systemic_global"
- [STATE][SCNA-023] climate_policy_persistence = "long_term_strict"
- [STATE][SCNA-024] global_warfare_norm = false

### 3. Population and Society

- [STATE][SCNA-030] population_billion.core = 8.8
- [STATE][SCNA-031] population_billion.range = [8.0, 9.5]
- [STATE][SCNA-032] population_billion.unit = billion
- [STATE][SCNA-033] population_billion.owner_domain = DEMOGRAPHY

- [STATE][SCNA-034] life_expectancy_years.core = 100
- [STATE][SCNA-035] life_expectancy_years.range = [95, 110]
- [STATE][SCNA-036] life_expectancy_years.unit = years
- [STATE][SCNA-037] life_expectancy_years.owner_domain = LIFE

### 4. Energy and Climate

- [STATE][SCNA-040] primary_energy_TW.core = 30
- [STATE][SCNA-041] primary_energy_TW.p90 = 60
- [STATE][SCNA-042] primary_energy_TW.unit = TW
- [STATE][SCNA-043] primary_energy_TW.owner_domain = ENERGY

- [STATE][SCNA-044] low_carbon_share_percent.core = 95
- [STATE][SCNA-045] low_carbon_share_percent.range = [90, 98]
- [STATE][SCNA-046] low_carbon_share_percent.unit = percent
- [STATE][SCNA-047] low_carbon_share_percent.owner_domain = ENERGY

- [STATE][SCNA-048] warming_C_vs_preindustrial.core = 2.5
- [STATE][SCNA-049] warming_C_vs_preindustrial.range = [2.0, 2.8]
- [STATE][SCNA-050] warming_C_vs_preindustrial.unit = C
- [STATE][SCNA-051] warming_C_vs_preindustrial.owner_domain = CLIMATE

- [STATE][SCNA-052] sea_level_m.core = 1.7
- [STATE][SCNA-053] sea_level_m.range = [1.2, 2.2]
- [STATE][SCNA-054] sea_level_m.unit = m
- [STATE][SCNA-055] sea_level_m.owner_domain = CLIMATE

### 5. Economy

- [STATE][SCNA-060] gdp_ppp_relative_to_2025.core = 30
- [STATE][SCNA-061] gdp_ppp_relative_to_2025.p90 = 40
- [STATE][SCNA-062] gdp_ppp_relative_to_2025.unit = multiplier
- [STATE][SCNA-063] gdp_ppp_relative_to_2025.owner_domain = ECONOMY

- [STATE][SCNA-064] global_gini_index.p90 = 0.4
- [STATE][SCNA-065] global_gini_index.unit = coefficient
- [STATE][SCNA-066] global_gini_index.owner_domain = ECONOMY

### 6. AI and Automation

- [STATE][SCNA-070] labor_automation_percent_tasks.core = 80
- [STATE][SCNA-071] labor_automation_percent_tasks.p90 = 90
- [STATE][SCNA-072] labor_automation_percent_tasks.unit = percent
- [STATE][SCNA-073] labor_automation_percent_tasks.owner_domain = AUTOMATION

- [STATE][SCNA-074] ai_compute_EJ_per_year.core = 75
- [STATE][SCNA-075] ai_compute_EJ_per_year.p90 = 200
- [STATE][SCNA-076] ai_compute_EJ_per_year.unit = EJ_per_year
- [STATE][SCNA-077] ai_compute_EJ_per_year.owner_domain = AUTOMATION

## USAGE / RESOLUTION

- [FACT][SCNA-090] Данный документ предоставляет допустимые значения и диапазоны
  метрик для downstream-документов.

- [FORBIDDEN][SCNA-091] Использование данного документа для:
  - выбора core vs p90;
  - задания приоритетов сцен;
  - разрешения конфликтов между доменами.

## OUTPUT CONTRACT

~~~yaml
doc_id: SSOT-SCENARIO-A-2215-0001
role_type: STATE
export:
  - metric: population_billion
    owner_domain: DEMOGRAPHY
    values:
      core: 8.8
      p90: null
      range: [8.0, 9.5]
    unit: billion

  - metric: primary_energy_TW
    owner_domain: ENERGY
    values:
      core: 30
      p90: 60
      range: null
    unit: TW

  - metric: ai_compute_EJ_per_year
    owner_domain: AUTOMATION
    values:
      core: 75
      p90: 200
      range: null
    unit: EJ_per_year
~~~

---

## FORBIDDEN

- [FORBIDDEN][SCNA-100] Introducing new metrics not declared in SSOT.
- [FORBIDDEN][SCNA-101] Embedding causal logic or scenario comparison.
- [FORBIDDEN][SCNA-102] Using this document as narrative directive.

## NON-NORMATIVE

(Empty by design)
