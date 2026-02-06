---
id: SSOT-SCENARIO-A-2215-0001
title: >
  Scenario A — Macro World State for 2215 (SSOT)
class: ssot
status: draft
version: 1.0.0
inputs: []
depends_on: [SSOT-DOC-STYLE-2215-0001]
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

---

## DEFINITIONS

- Scenario A — кооперативная техно-оптимистическая траектория глобального развития,
  зафиксированная как единственная допустимая ветка мира 2215.

---

## INVARIANTS

- [FACT][SCN-000] Scenario A является единственным допустимым сценарием
  макро-эволюции мира в корпусе 2215.

- [FACT][SCN-001] Все downstream-документы ОБЯЗАНЫ использовать только
  метрики и диапазоны, объявленные в данном документе или в доменных SSOT.

---

## CONTENT

### 1. Scenario Identity

- [STATE][SCN-010] scenario_id = "A"
- [STATE][SCN-011] scenario_name = "Cooperative Techno-optimism"
- [STATE][SCN-012] scenario_confidence_estimate_percent ≈ 25
- [STATE][SCN-013] scenario_owner_domain = SCENARIO

---

### 2. Global Qualitative State (2215)

- [STATE][SCN-020] global_cooperation_level = "high"
- [STATE][SCN-021] global_technological_progress_continuity = true
- [STATE][SCN-022] automation_scaling_mode = "systemic_global"
- [STATE][SCN-023] climate_policy_persistence = "long_term_strict"
- [STATE][SCN-024] global_warfare_norm = false

---

### 3. Population and Society

- [STATE][SCN-030] population_billion.core = 8.8
- [STATE][SCN-031] population_billion.range = [8.0, 9.5]
- [STATE][SCN-032] population_billion.unit = billion
- [STATE][SCN-033] population_billion.owner_domain = DEMOGRAPHY

- [STATE][SCN-034] life_expectancy_years.core = 100
- [STATE][SCN-035] life_expectancy_years.range = [95, 110]
- [STATE][SCN-036] life_expectancy_years.unit = years
- [STATE][SCN-037] life_expectancy_years.owner_domain = LIFE

---

### 4. Energy and Climate

- [STATE][SCN-040] primary_energy_TW.core = 30
- [STATE][SCN-041] primary_energy_TW.p90 = 60
- [STATE][SCN-042] primary_energy_TW.unit = TW
- [STATE][SCN-043] primary_energy_TW.owner_domain = ENERGY

- [STATE][SCN-044] low_carbon_share_percent.core = 95
- [STATE][SCN-045] low_carbon_share_percent.range = [90, 98]
- [STATE][SCN-046] low_carbon_share_percent.unit = percent
- [STATE][SCN-047] low_carbon_share_percent.owner_domain = ENERGY

- [STATE][SCN-048] warming_C_vs_preindustrial.core = 2.5
- [STATE][SCN-049] warming_C_vs_preindustrial.range = [2.0, 2.8]
- [STATE][SCN-050] warming_C_vs_preindustrial.unit = C
- [STATE][SCN-051] warming_C_vs_preindustrial.owner_domain = CLIMATE

- [STATE][SCN-052] sea_level_m.core = 1.7
- [STATE][SCN-053] sea_level_m.range = [1.2, 2.2]
- [STATE][SCN-054] sea_level_m.unit = m
- [STATE][SCN-055] sea_level_m.owner_domain = CLIMATE

---

### 5. Economy

- [STATE][SCN-060] gdp_ppp_relative_to_2025.core = 30
- [STATE][SCN-061] gdp_ppp_relative_to_2025.p90 = 40
- [STATE][SCN-062] gdp_ppp_relative_to_2025.unit = multiplier
- [STATE][SCN-063] gdp_ppp_relative_to_2025.owner_domain = ECONOMY

- [STATE][SCN-064] global_gini_index.p90 = 0.4
- [STATE][SCN-065] global_gini_index.unit = coefficient
- [STATE][SCN-066] global_gini_index.owner_domain = ECONOMY

---

### 6. AI and Automation

- [STATE][SCN-070] labor_automation_percent_tasks.core = 80
- [STATE][SCN-071] labor_automation_percent_tasks.p90 = 90
- [STATE][SCN-072] labor_automation_percent_tasks.unit = percent
- [STATE][SCN-073] labor_automation_percent_tasks.owner_domain = AUTOMATION

- [STATE][SCN-074] ai_compute_EJ_per_year.core = 75
- [STATE][SCN-075] ai_compute_EJ_per_year.p90 = 200
- [STATE][SCN-076] ai_compute_EJ_per_year.unit = EJ_per_year
- [STATE][SCN-077] ai_compute_EJ_per_year.owner_domain = AUTOMATION

---

## USAGE / RESOLUTION

- [FACT][SCN-090] Данный документ предоставляет допустимые значения и диапазоны
  метрик для downstream-документов.

- [FORBIDDEN][SCN-091] Использование данного документа для:
  - выбора core vs p90;
  - задания приоритетов сцен;
  - разрешения конфликтов между доменами.

---

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

- [FORBIDDEN][SCN-100] Introducing new metrics not declared in SSOT.
- [FORBIDDEN][SCN-101] Embedding causal logic or scenario comparison.
- [FORBIDDEN][SCN-102] Using this document as narrative directive.

---

## NON-NORMATIVE

(Empty by design)
