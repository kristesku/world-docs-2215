<architecture_docs>

<file path="00-ssot/SSOT-AUTOMATION-A-2215-0004.md">
~~~markdown
---
id: SSOT-AUTOMATION-A-2215-0004
title: >
  AI, Automation, and Robotics — Scenario A (2215, SSOT State)
class: ssot
status: draft
version: 1.1.0
inputs: []
depends_on:
  - SSOT-DOC-STYLE-2215-0001
  - SSOT-SCENARIO-A-2215-0001
scope: >
  SSOT-состояние ИИ, автоматизации и роботизации мира в 2215 году (Scenario A).
  Документ содержит только декларативные метрики (core/p90/range) и качественные состояния.
  Не содержит причинности, правил разрешения конфликтов и моделей управления.
---

## LLM-INTENT

ROLE_TYPE: STATE
SCOPE: declarative AI/automation/robotics state for Scenario A around year 2215
INPUTS: []
OUTPUTS:
  - automation_metric_state
FORBIDDEN:
  - causal_logic
  - resolution_rules
  - governance_models
  - narrative_explanations

---

## DEFINITIONS

[DEF][AUT-DEF-010] automation = AI systems + robotics + autonomous execution loops used across economy and infrastructure.

---

## INVARIANTS

[FACT][AUT-000] Applicable only to Scenario A.
[FACT][AUT-001] AI is treated as infrastructure (utility contour), not a unified subject.
[FACT][AUT-002] AI-tyranny scenarios are excluded unless explicitly enabled by an override doc.

---

## CONTENT

### 1. Automation level (global)

[STATE][AUT-010] labor_automation_percent_tasks.core = 80
[STATE][AUT-011] labor_automation_percent_tasks.p90 = 90
[STATE][AUT-012] labor_automation_percent_tasks.range = null
[STATE][AUT-013] labor_automation_percent_tasks.unit = percent
[STATE][AUT-014] labor_automation_percent_tasks.owner_domain = AUTOMATION

[STATE][AUT-015] automation_execution_mode = "systemic_global"
[STATE][AUT-016] automation_execution_mode.owner_domain = AUTOMATION

---

### 2. Compute and energy use

[STATE][AUT-020] ai_compute_EJ_per_year.core = 75
[STATE][AUT-021] ai_compute_EJ_per_year.p90 = 200
[STATE][AUT-022] ai_compute_EJ_per_year.range = null
[STATE][AUT-023] ai_compute_EJ_per_year.unit = EJ_per_year
[STATE][AUT-024] ai_compute_EJ_per_year.owner_domain = AUTOMATION

[STATE][AUT-025] ai_energy_share_percent.core = null
[STATE][AUT-026] ai_energy_share_percent.p90 = 20
[STATE][AUT-027] ai_energy_share_percent.range = null
[STATE][AUT-028] ai_energy_share_percent.unit = percent
[STATE][AUT-029] ai_energy_share_percent.owner_domain = AUTOMATION

---

### 3. Robotics density and presence

[STATE][AUT-030] robots_per_human.core = null
[STATE][AUT-031] robots_per_human.p90 = 1.0
[STATE][AUT-032] robots_per_human.range = null
[STATE][AUT-033] robots_per_human.unit = ratio
[STATE][AUT-034] robots_per_human.owner_domain = AUTOMATION

[STATE][AUT-035] robotics_presence_mode = "ubiquitous_infrastructure"
[STATE][AUT-036] robotics_presence_mode.owner_domain = AUTOMATION

---

### 4. Domains of application (qualitative state)

[STATE][AUT-040] transport_automation_level = "near_total"
[STATE][AUT-041] transport_automation_level.owner_domain = AUTOMATION

[STATE][AUT-042] manufacturing_automation_level = "lights_out"
[STATE][AUT-043] manufacturing_automation_level.owner_domain = AUTOMATION

[STATE][AUT-044] medical_ai_routine_use = true
[STATE][AUT-045] medical_ai_routine_use.owner_domain = LIFE

[STATE][AUT-046] education_ai_routine_use = true
[STATE][AUT-047] education_ai_routine_use.owner_domain = GOVERNANCE

[STATE][AUT-048] urban_systems_ai_coordination = "continuous"
[STATE][AUT-049] urban_systems_ai_coordination.owner_domain = URBANISM

---

### 5. Human participation (state)

[STATE][AUT-050] human_execution_role = "minority_niche"
[STATE][AUT-051] human_execution_role.owner_domain = SOCIETY

[STATE][AUT-052] human_legitimation_role = "required"
[STATE][AUT-053] human_legitimation_role.owner_domain = GOVERNANCE

---

## USAGE / RESOLUTION

[FACT][AUT-090] Defines allowed numeric ranges and qualitative states for downstream documents.

[FORBIDDEN][AUT-091] Using this SSOT document for:
- causal explanations of social/political conflict,
- modeling failures/accidents,
- selecting scene modes or outcomes.

---

## OUTPUT CONTRACT

~~~yaml
doc_id: SSOT-AUTOMATION-A-2215-0004
role_type: STATE
export:
  - metric: labor_automation_percent_tasks
    owner_domain: AUTOMATION
    values: {core: 80, p90: 90, range: null}
    unit: percent

  - metric: ai_compute_EJ_per_year
    owner_domain: AUTOMATION
    values: {core: 75, p90: 200, range: null}
    unit: EJ_per_year

  - metric: ai_energy_share_percent
    owner_domain: AUTOMATION
    values: {core: null, p90: 20, range: null}
    unit: percent

  - metric: robots_per_human
    owner_domain: AUTOMATION
    values: {core: null, p90: 1.0, range: null}
    unit: ratio

  - state: automation_execution_mode
    owner_domain: AUTOMATION
    value: systemic_global

  - state: robotics_presence_mode
    owner_domain: AUTOMATION
    value: ubiquitous_infrastructure

  - state: transport_automation_level
    owner_domain: AUTOMATION
    value: near_total

  - state: manufacturing_automation_level
    owner_domain: AUTOMATION
    value: lights_out

  - state: medical_ai_routine_use
    owner_domain: LIFE
    value: true

  - state: education_ai_routine_use
    owner_domain: GOVERNANCE
    value: true

  - state: urban_systems_ai_coordination
    owner_domain: URBANISM
    value: continuous

  - state: human_execution_role
    owner_domain: SOCIETY
    value: minority_niche

  - state: human_legitimation_role
    owner_domain: GOVERNANCE
    value: required
~~~

---

## FORBIDDEN

[FORBIDDEN][AUT-100] Introducing new automation metrics outside SSOT.
[FORBIDDEN][AUT-101] Embedding causal chains, resolution rules, or governance logic.
[FORBIDDEN][AUT-102] Treating qualitative states as narrative drivers.

---

## NON-NORMATIVE

(Empty by design)

~~~
</file>

<file path="00-ssot/SSOT-CLIMATE-A-2215-0004.md">
~~~markdown
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

~~~
</file>

<file path="00-ssot/SSOT-CONSISTENCY-A-2215-0009.md">
~~~markdown
---
id: SSOT-CONSISTENCY-A-2215-0009
title: >
  Consistency Ruleset — Scenario A (2215)
class: ssot
status: draft
version: 1.1.0
inputs: []
depends_on:
  - SSOT-DOC-STYLE-2215-0001
  - SSOT-SCENARIO-A-2215-0001
  - SSOT-ECONOMY-A-2215-0003
  - SSOT-DEMOGRAPHY-A-2215-0002
  - SSOT-AUTOMATION-A-2215-0004
  - SSOT-ENERGY-A-2215-0004
  - SSOT-CLIMATE-A-2215-0004
  - SSOT-GOVERNANCE-SECURITY-A-2215-0005
  - SSOT-URBANISM-A-2215-0007
scope: >
  SSOT RULE-документ согласованности корпуса 2215 (Scenario A).
  Определяет статусы метрик (CANON | DUAL_ALLOWED | CONFLICT | UNKNOWN),
  правила интерпретации и обязательства downstream-документов.
  Не вводит новые метрики и не выбирает значения.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: consistency validation and interpretation rules for SSOT corpus (Scenario A)
INPUTS:
  - SSOT-SCENARIO-A-2215-0001
  - SSOT-ECONOMY-A-2215-0003
  - SSOT-DEMOGRAPHY-A-2215-0002
  - SSOT-AUTOMATION-A-2215-0004
  - SSOT-ENERGY-A-2215-0004
  - SSOT-CLIMATE-A-2215-0004
  - SSOT-GOVERNANCE-SECURITY-A-2215-0005
  - SSOT-URBANISM-A-2215-0007
OUTPUTS:
  - metric_status
  - allowed_values
  - downstream_constraints
FORBIDDEN:
  - introduce_world_facts
  - select_values
  - narrative_reasoning

---

## DEFINITIONS

[DEF][CONS-DEF-010] metric_status ∈ {CANON, DUAL_ALLOWED, CONFLICT, UNKNOWN}.

[DEF][CONS-DEF-011] CANON = exactly one allowed value/range for downstream default usage.

[DEF][CONS-DEF-012] DUAL_ALLOWED = core allowed as default; upper-tail (p90) allowed only as explicitly localized upper-tail case (override).

[DEF][CONS-DEF-013] CONFLICT = incompatible SSOT STATE declarations without an explicit resolving rule.

[DEF][CONS-DEF-014] UNKNOWN = referenced downstream but not declared in any SSOT STATE document.

[DEF][CONS-DEF-015] downstream_docs = {baseline, canon, plan, scene}.

[DEF][CONS-DEF-016] narrative_lock = rule-level constraint that forces downstream to treat a metric as CANON even if SSOT declares core+p90.

---

## INVARIANTS

[RULE][CONS-INV-010] CONSISTENCY MUST NOT introduce new metrics or values.
[RULE][CONS-INV-011] CONSISTENCY interprets SSOT STATE but never overrides it.
[RULE][CONS-INV-012] Any metric used downstream MUST have a defined status.

---

## CONTENT

### 1. Metric status derivation rules

[RULE][CONS-010] IF a metric has exactly one declared value or range across all SSOT STATE docs THEN status = CANON.

[RULE][CONS-011] IF a metric has declared `core` and `p90` (or equivalent upper-tail) values AND no rule forbids coexistence THEN status = DUAL_ALLOWED.

[RULE][CONS-012] IF two or more SSOT STATE docs declare incompatible values AND no DUAL_ALLOWED rule exists THEN status = CONFLICT.

[RULE][CONS-013] IF a metric is referenced downstream but not declared in any SSOT STATE THEN status = UNKNOWN.

---

### 2. Downstream usage rules by status

[RULE][CONS-020] IF metric status = CANON THEN downstream MUST use the canonical value/range only.

[RULE][CONS-021] IF metric status = DUAL_ALLOWED THEN downstream MUST use `core` as default background.

[RULE][CONS-022] IF metric status = DUAL_ALLOWED THEN upper-tail (`p90`) usage is override_only and MUST satisfy localization + procedural cost rules (see CANON-METRICS-0002 where applicable).

[RULE][CONS-023] IF metric status = CONFLICT THEN any downstream usage is FORBIDDEN until resolved by class: canon or class: override.

[RULE][CONS-024] IF metric status = UNKNOWN THEN any downstream usage is FORBIDDEN.

---

### 3. Narrative lock rules

[RULE][CONS-030] A metric MAY be marked as narrative_lock by a RULE or CANON document.

[RULE][CONS-031] IF metric has narrative_lock = true THEN downstream MUST treat it as CANON (default background), even if SSOT status is DUAL_ALLOWED.

[RULE][CONS-032] IF narrative_lock = true THEN upper-tail values MAY ONLY be used via explicit override with localization and cost.

---

### 4. Location-specific constraints (policy gates)

[RULE][CONS-040] IF location = RU-16/CHELNY AND metric = primary_energy_TW THEN upper-tail (p90) values are FORBIDDEN as default background.

---

### 5. Closure rules (status finalization)

[RULE][CONS-050] DUAL_ALLOWED or UNKNOWN metrics MAY be closed only by:
- class: canon
- class: override

[RULE][CONS-051] AFTER closure, metric status MUST be updated to CANON (or remain FORBIDDEN if removed).

---

## USAGE / RESOLUTION

[RULE][CONS-090] CONSISTENCY rules MUST be applied before any baseline/canon generation that references SSOT metrics.
[RULE][CONS-091] Any violation of CONSISTENCY rules MUST be treated as a generation error, not as a creative choice.

---

## OUTPUT CONTRACT

~~~yaml
doc_id: SSOT-CONSISTENCY-A-2215-0009
role_type: RULE
export:
  - metric: <metric_key>
    status: CANON | DUAL_ALLOWED | CONFLICT | UNKNOWN
    narrative_lock: true | false
    allowed_usage:
      downstream_default: core | canon | forbidden
      upper_tail: allowed | forbidden | override_only
~~~

---

## FORBIDDEN

[FORBIDDEN][CONS-100] Selecting values for narrative use.
[FORBIDDEN][CONS-101] Repeating SSOT STATE data (numbers/ranges) inside this document.
[FORBIDDEN][CONS-102] Implicit resolution without class: canon or class: override.

---

## NON-NORMATIVE

(Empty by design)

~~~
</file>

<file path="00-ssot/SSOT-DEMOGRAPHY-A-2215-0002.md">
~~~markdown
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
  - SSOT-DOC-STYLE-2215-0001
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

~~~
</file>

<file path="00-ssot/SSOT-DOC-STYLE-2215-0001.md">
~~~markdown
---
id: SSOT-DOC-STYLE-2215-0001
title: >
  SSOT Document Style Guide — LLM-Executable Corpus Standard (2215)
class: spec
status: fixed
version: 1.0.1
scope: >
  Норматив форматирования SSOT/BASELINE/CANON/IDX документов проекта 2215.
  Цель: максимальная однозначность и исполняемость LLM (минимум интерпретации).
  Этот документ определяет обязательные секции, типы блоков, допустимый язык,
  контракт вывода и правила декомпозиции фактов/правил/привязок.
depends_on: []
inputs: []
---

## 0. Prime Directive

- [DECISION][STYLE-000] Corpus MUST be LLM-executable:
  - deterministic parsing > human readability;
  - explicit contracts > narrative explanations;
  - atomic statements > prose.

- [FORBIDDEN][STYLE-001] “Essay mode”:
  - long paragraphs,
  - rhetorical connectors,
  - implicit assumptions,
  - “world flavor” to justify numbers.

---

## 0.1 Precedence (Two Axes)

### 0.1.1 Role-Type precedence (semantic)

- [DECISION][STYLE-101] Role-type precedence (semantic) is:

~~~markdown
RULE
→ INTERFACE
→ STATE
→ BIND
~~~

- [DECISION][STYLE-102] Role-type precedence defines how statements are interpreted:
  RULE constrains STATE; BIND selects STATE; INTERFACE defines ownership/consumes rules.

### 0.1.2 Document-class resolution order (applicability)

- [DECISION][STYLE-105] Document-class resolution order (applicability) MUST be taken ONLY from:
  `SPEC-PRIORITY-RESOLUTION-2215-0001`.

- [FORBIDDEN][STYLE-106] Mixing role-type precedence with document-class resolution.
- [FORBIDDEN][STYLE-107] Introducing alternative document-class precedence inside this STYLE guide.

---

## 1. Document Types and Roles

Every document MUST declare its role type in `LLM-INTENT` as exactly one of:

- STATE — declarative facts and projections (no resolution logic).
- RULE — normative constraints and resolution logic (IF/THEN).
- BIND — choosing values (core vs p90) for downstream usage.
- INTERFACE — domain boundaries, ownership, consumes/defines contracts.
- INDEX — navigation tables and traceability maps (mechanical).

- [DECISION][STYLE-010] One document MUST NOT mix role types.
  - Exception: `INDEX` may embed pointers to RULE/STATE but MUST NOT redefine them.

---

## 2. Mandatory Document Skeleton

All documents MUST include the following sections in this order (may be empty but must exist):

1. `## LLM-INTENT`
2. `## DEFINITIONS`
3. `## INVARIANTS`
4. `## CONTENT` (role-specific)
5. `## USAGE / RESOLUTION`
6. `## OUTPUT CONTRACT`
7. `## FORBIDDEN`
8. `## NON-NORMATIVE (optional)` (only examples)

- [DECISION][STYLE-020] Headers MUST match exactly (case-insensitive allowed).
- [DECISION][STYLE-021] No other top-level sections are allowed.

---

## 3. LLM-INTENT Block (Required)

`## LLM-INTENT` MUST contain:

- `ROLE_TYPE: STATE|RULE|BIND|INTERFACE|INDEX`
- `SCOPE: <one-sentence>`
- `INPUTS: <list of doc ids or -> none>`
- `OUTPUTS: <list>`
- `FORBIDDEN: <list>`

Example:

~~~markdown
## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: metric conflict resolution and dual-allowed handling
INPUTS: [SSOT-SCENARIO-A-2215-0001, IDX-SSOT-INTERFACES-2215]
OUTPUTS: [selected_value, scope, rule_id]
FORBIDDEN: [invent_metrics, redefine_ownership, narrative]
~~~

- [DECISION][STYLE-030] LLM-INTENT MUST be ≤ 20 lines.

---

## 4. Statement Grammar (Atomic Blocks)

All normative or factual content MUST be expressed as atomic statements.
Each statement MUST use a tag prefix:

- `[FACT]`
- `[ASSUMPTION]`
- `[PROJECTION]`
- `[DECISION]`
- `[FORBIDDEN]`
- `[UNKNOWN]`
- `[STATE]` (only in ROLE_TYPE: STATE)
- `[RULE]` (only in ROLE_TYPE: RULE)
- `[BIND]` (only in ROLE_TYPE: BIND)

### 4.1 IDs (Mandatory)

- [DECISION][STYLE-040] Every statement MUST have an ID: `TAG][<DOCPREFIX>-NNN]`
  - Example: `[RULE][CONS-010]`
  - Example: `[STATE][ENG-020]`

- [DECISION][STYLE-041] IDs MUST be stable across edits.
- [FORBIDDEN][STYLE-042] No “floating bullets” without IDs.

### 4.2 Statement Length

- [DECISION][STYLE-043] One statement ≤ 3 lines.
- [FORBIDDEN][STYLE-044] Multi-paragraph statements.

### 4.3 No Bold/Italic Semantics

- [DECISION][STYLE-045] Markdown emphasis (``, `_`) MUST NOT carry meaning.
- [FORBIDDEN][STYLE-046] Using bold/italic as structure.

---

## 5. Language Constraints (No Soft Speech)

- [FORBIDDEN][STYLE-050] Softeners:
  - “обычно”, “как правило”, “в целом”, “скорее”, “может быть”, “возможно”
  - “допускается” без условия

- [DECISION][STYLE-051] Allowed operators:
  - `IF / THEN / ELSE`
  - `MUST / MUST NOT`
  - `ONLY IF`
  - `EXCEPT WHEN`
  - `REQUIRES`
  - `IMPLIES`

- [DECISION][STYLE-052] Quantifiers MUST be explicit:
  - ranges: `x ∈ [a, b]`
  - approx: `x ≈ y` (only if needed; prefer range)
  - units required for numeric values.

---

## 6. Role-Specific CONTENT Rules

### 6.1 ROLE_TYPE: STATE

`## CONTENT` MUST contain only `[STATE]` statements.

- [DECISION][STYLE-060] STATE statements allowed forms:
  - `metric = value`
  - `metric.core = value`
  - `metric.p90 = value`
  - `metric.range = [a, b]`
  - `metric.unit = <unit>`
  - `metric.owner_domain = <DOMAIN>`

- [FORBIDDEN][STYLE-061] STATE MUST NOT contain:
  - causal chains,
  - resolution rules,
  - “why” explanations.

### 6.2 ROLE_TYPE: RULE

`## CONTENT` MUST contain only `[RULE]`, `[DECISION]`, `[FORBIDDEN]`.

- [DECISION][STYLE-062] RULE statements MUST use IF/THEN form when applicable.
- [DECISION][STYLE-063] Rules MUST be decidable (no vague language).

### 6.3 ROLE_TYPE: BIND

`## CONTENT` MUST contain only `[BIND]` statements.

- [DECISION][STYLE-064] BIND chooses among existing SSOT values only:
  - `metric: <id>`
  - `selected_value: core|p90|override`
  - `scope: baseline|canon|override`
  - `justification: <RULE_ID>`

### 6.4 ROLE_TYPE: INTERFACE

- [DECISION][STYLE-065] INTERFACE defines: domain ownership, consumes, must-not-define.
- [FORBIDDEN][STYLE-066] INTERFACE MUST NOT introduce metric values.

### 6.5 ROLE_TYPE: INDEX

- [DECISION][STYLE-067] INDEX contains tables and pointers only.
- [FORBIDDEN][STYLE-068] INDEX MUST NOT redefine rules or state.

---

## 7. Causal Chains (Strict Form)

Causal chains are allowed ONLY in ROLE_TYPE: RULE or in dedicated CANON artifacts.
They MUST use canonical tokens:

- `CAUSE → MECHANISM → CONSEQUENCE`

- [DECISION][STYLE-070] If causal text is present:
  - each node MUST be a separate atomic statement with its own ID.

Example:

~~~markdown
[RULE][X-010] CAUSE: ...
[RULE][X-011] MECHANISM: ...
[RULE][X-012] CONSEQUENCE: ...
~~~

- [FORBIDDEN][STYLE-071] Inline causal chains inside long paragraphs.

---

## 8. Ownership and Domain Boundaries

- [DECISION][STYLE-080] Every metric MUST declare `owner_domain`.
- [FORBIDDEN][STYLE-081] Two domains defining the same metric value unless
  explicitly marked by a RULE doc as DUAL-ALLOWED.

- [DECISION][STYLE-082] Ownership names MUST match the interface index:
  `SCENARIO, CONSISTENCY, ENERGY, CLIMATE, ECONOMY, AUTOMATION, DEMOGRAPHY, URBANISM, GOVERNANCE, LIFE, SPACE-INDUSTRY`.

---

## 9. Units and Naming

- [DECISION][STYLE-090] Numeric values MUST include units:
  - `TW`, `EJ_per_year`, `C`, `m`, `%`, `billion`, `years`.

- [DECISION][STYLE-091] Metric IDs MUST be snake_case and stable.
- [FORBIDDEN][STYLE-092] Reusing the same metric name for different meanings.

---

## 10. Resolution and Usage Section

`## USAGE / RESOLUTION` MUST be present and role-appropriate:

- For STATE: how downstream may reference; no selection logic.
- For RULE: state machine and priority ordering.
- For BIND: precedence and scope constraints.

- [DECISION][STYLE-100] If precedence exists, it MUST be explicit:
  `override → canon → ssot → baseline → plan → scene` (or other chosen order).

---

## 11. OUTPUT CONTRACT (Mandatory)

Every document MUST define machine-readable output schema.

### 11.1 STATE output contract

~~~yaml
doc_id: <id>
role_type: STATE
export:
  - metric: <metric_id>
    owner_domain: <DOMAIN>
    values:
      core: <value|none>
      p90: <value|none>
      range: <[a,b]|none>
    unit: <unit|none>
~~~

### 11.2 RULE output contract

~~~yaml
doc_id: <id>
role_type: RULE
export:
  - rule_id: <ID>
    intent: <one-line>
    inputs: <list>
    outputs: <list>
~~~

### 11.3 BIND output contract

~~~yaml
doc_id: <id>
role_type: BIND
export:
  - metric: <metric_id>
    selected_value: core|p90|override
    scope: baseline|canon|override
    justification: <rule_id>
~~~

- [DECISION][STYLE-110] OUTPUT CONTRACT MUST be present even if export is empty.

---

## 12. FORBIDDEN Section (Mandatory)

Each doc MUST list explicit forbidden behaviors relevant to its role.

Minimum:

- [FORBIDDEN][STYLE-120] Introducing new metrics not owned by the domain.
- [FORBIDDEN][STYLE-121] Mixing roles inside one document.
- [FORBIDDEN][STYLE-122] Using examples as rules.

---

## 13. NON-NORMATIVE Section Rules

- [DECISION][STYLE-130] If examples exist, they MUST be under:
  `## NON-NORMATIVE`
- [FORBIDDEN][STYLE-131] Examples outside NON-NORMATIVE.

---

## 14. Rewrite Protocol (How to Convert Existing Docs)

Given an existing human-readable SSOT:

1. Identify ROLE_TYPE.
2. Extract all statements into atomic tagged lines with IDs.
3. Remove prose and rhetorical justification.
4. Ensure every metric has owner_domain and unit (if numeric).
5. Add OUTPUT CONTRACT.
6. Move all examples into NON-NORMATIVE.
7. Add explicit FORBIDDEN list.

- [DECISION][STYLE-140] Conversion MUST preserve meaning; only structure changes.

---

## 15. Compliance Checklist (Mechanical)

A document is compliant IFF:

- [ ] front-matter exists and has `id`, `title`, `class`, `status`, `version`, `scope`
- [ ] mandatory skeleton sections exist in order
- [ ] ROLE_TYPE specified and single
- [ ] every statement has a stable ID
- [ ] no softeners / vague language
- [ ] no mixed roles
- [ ] OUTPUT CONTRACT present
- [ ] examples only in NON-NORMATIVE

- [DECISION][STYLE-150] Non-compliant docs MUST be treated as invalid inputs.

~~~
</file>

<file path="00-ssot/SSOT-ECONOMY-A-2215-0003.md">
~~~markdown
---
id: SSOT-ECONOMY-A-2215-0003
title: >
  Economy and Production — Scenario A (2215, SSOT State)
class: ssot
status: draft
version: 1.1.0
inputs: []
depends_on:
  - SSOT-DOC-STYLE-2215-0001
  - SSOT-SCENARIO-A-2215-0001
  - SSOT-DEMOGRAPHY-A-2215-0002
  - SSOT-AUTOMATION-A-2215-0004
scope: >
  SSOT-состояние макроэкономики мира в 2215 году (Scenario A).
  Документ содержит только декларативные метрики (core/p90/range)
  и качественные экономические состояния.
  Не содержит причинности, правил разрешения конфликтов и моделей управления.
---

## LLM-INTENT

ROLE_TYPE: STATE
SCOPE: global macroeconomic state for Scenario A around year 2215
INPUTS: []
OUTPUTS:
  - economic_metric_state
FORBIDDEN:
  - causal_logic
  - resolution_rules
  - governance_models
  - narrative_explanations

---

## DEFINITIONS

[DEF][ECO-DEF-010] economy = global production, allocation, and execution capacity under high automation and coordination.

---

## INVARIANTS

[FACT][ECO-000] Applicable only to Scenario A.
[FACT][ECO-001] Macroeconomy is treated as a production-capacity allocation system, not as a microeconomic market.
[FACT][ECO-002] Behavioral and microeconomic models are out of scope for this SSOT.

---

## CONTENT

### 1. Output and growth (state)

[STATE][ECO-010] gdp_ppp_relative_to_2025.core = 30
[STATE][ECO-011] gdp_ppp_relative_to_2025.p90 = 40
[STATE][ECO-012] gdp_ppp_relative_to_2025.range = [5, 40]
[STATE][ECO-013] gdp_ppp_relative_to_2025.unit = multiplier
[STATE][ECO-014] gdp_ppp_relative_to_2025.owner_domain = ECONOMY

[STATE][ECO-015] long_term_growth_mode = "high_stable"
[STATE][ECO-016] long_term_growth_mode.owner_domain = ECONOMY

---

### 2. Productivity and automation coupling

[STATE][ECO-020] labor_automation_percent_tasks.source = "SSOT-AUTOMATION-A-2215-0004"
[STATE][ECO-021] labor_automation_percent_tasks.owner_domain = AUTOMATION
[DECISION][ECO-022] ECONOMY SSOT MUST NOT redefine AUTOMATION-owned metrics.

[STATE][ECO-023] labor_cost_trend = "strong_decline"
[STATE][ECO-024] labor_cost_trend.owner_domain = ECONOMY

---

### 3. Production structure

[STATE][ECO-030] services_share_gdp_percent.core = null
[STATE][ECO-031] services_share_gdp_percent.p90 = 90
[STATE][ECO-032] services_share_gdp_percent.range = [60, 90]
[STATE][ECO-033] services_share_gdp_percent.unit = percent
[STATE][ECO-034] services_share_gdp_percent.owner_domain = ECONOMY

[STATE][ECO-035] production_localization_trend = "partial_relocalization"
[STATE][ECO-036] production_localization_trend.owner_domain = ECONOMY

---

### 4. Trade and distribution

[STATE][ECO-040] trade_to_gdp_percent.core = null
[STATE][ECO-041] trade_to_gdp_percent.p90 = 50
[STATE][ECO-042] trade_to_gdp_percent.range = [10, 50]
[STATE][ECO-043] trade_to_gdp_percent.unit = percent
[STATE][ECO-044] trade_to_gdp_percent.owner_domain = ECONOMY

[STATE][ECO-045] global_gini_index.core = null
[STATE][ECO-046] global_gini_index.p90 = 0.4
[STATE][ECO-047] global_gini_index.range = null
[STATE][ECO-048] global_gini_index.unit = coefficient
[STATE][ECO-049] global_gini_index.owner_domain = ECONOMY

---

### 5. Allocation and absorption (qualitative state)

[STATE][ECO-050] mandatory_output_absorption = "high"
[STATE][ECO-051] mandatory_output_absorption.owner_domain = ECONOMY

[STATE][ECO-052] free_capacity_share = "limited"
[STATE][ECO-053] free_capacity_share.owner_domain = ECONOMY

---

### 6. Administrative scarcity (state)

[STATE][ECO-060] scarcity_mode = "administrative"
[STATE][ECO-061] scarcity_mode.owner_domain = GOVERNANCE

[STATE][ECO-062] scarcity_triggers = [
  "licensing",
  "quota",
  "access_window",
  "compliance",
  "joint_access_protocol"
]
[STATE][ECO-063] scarcity_triggers.owner_domain = GOVERNANCE

---

## USAGE / RESOLUTION

[FACT][ECO-090] Provides declarative numeric ranges and qualitative macroeconomic states for downstream documents.

[FORBIDDEN][ECO-091] Using this SSOT document for:
- causal explanations of crises,
- conflict modeling,
- selecting scene or narrative modes.

---

## OUTPUT CONTRACT

~~~yaml
doc_id: SSOT-ECONOMY-A-2215-0003
role_type: STATE
export:
  - metric: gdp_ppp_relative_to_2025
    owner_domain: ECONOMY
    values: {core: 30, p90: 40, range: [5, 40]}
    unit: multiplier

  - metric: services_share_gdp_percent
    owner_domain: ECONOMY
    values: {core: null, p90: 90, range: [60, 90]}
    unit: percent

  - metric: trade_to_gdp_percent
    owner_domain: ECONOMY
    values: {core: null, p90: 50, range: [10, 50]}
    unit: percent

  - metric: global_gini_index
    owner_domain: ECONOMY
    values: {core: null, p90: 0.4, range: null}
    unit: coefficient
~~~

---

## FORBIDDEN

[FORBIDDEN][ECO-100] Introducing new economic metrics outside SSOT.
[FORBIDDEN][ECO-101] Embedding causal chains, governance logic, or resolution rules.
[FORBIDDEN][ECO-102] Treating qualitative states as narrative explanations.

---

## NON-NORMATIVE

(Empty by design)

~~~
</file>

<file path="00-ssot/SSOT-ENERGY-A-2215-0004.md">
~~~markdown
---
id: SSOT-ENERGY-A-2215-0004
title: >
  Energy System — Scenario A (2215, SSOT State)
class: ssot
status: draft
version: 1.1.0
inputs: []
depends_on:
  - SSOT-SCENARIO-A-2215-0001
  - SSOT-ECONOMY-A-2215-0003
scope: >
  SSOT-состояние энергетической системы мира в 2215 году (Scenario A).
  Документ содержит только декларативные метрики (core/p90/range)
  и бинарные/категориальные свойства энергосистемы.
  Не содержит причинности, процедур, сценариев отказа или разрешения конфликтов.
---

## LLM-INTENT

ROLE_TYPE: STATE
SCOPE: global energy system state for Scenario A around year 2215
INPUTS: []
OUTPUTS:
  - energy_metric_state
FORBIDDEN:
  - causal_logic
  - resolution_rules
  - narrative_explanations
  - failure_models

---

## DEFINITIONS

[DEF][ENG-DEF-010] energy_system = global generation, storage, transmission, and consumption of energy in Scenario A.

---

## INVARIANTS

[FACT][ENG-000] Applicable only to Scenario A.
[FACT][ENG-001] Energy system is treated as critical infrastructure.
[FACT][ENG-002] Fossil fuels are not the dominant energy source.
[FACT][ENG-003] Energy system does not impose a hard cap on economic growth within declared Scenario A metrics.

---

## CONTENT

### 1. Primary energy (global)

[STATE][ENG-010] primary_energy_TW.core = 30
[STATE][ENG-011] primary_energy_TW.p90 = 60
[STATE][ENG-012] primary_energy_TW.range = [20, 60]
[STATE][ENG-013] primary_energy_TW.unit = TW
[STATE][ENG-014] primary_energy_TW.owner_domain = ENERGY

---

### 2. Energy mix

[STATE][ENG-020] low_carbon_share_percent.core = 95
[STATE][ENG-021] low_carbon_share_percent.range = [90, 98]
[STATE][ENG-022] low_carbon_share_percent.unit = percent
[STATE][ENG-023] low_carbon_share_percent.owner_domain = ENERGY

[STATE][ENG-024] fossil_energy_role = "residual_niche"
[STATE][ENG-025] fossil_energy_role.owner_domain = ENERGY

[STATE][ENG-026] generation_mix_structure = "renewables + nuclear + advanced_sources"
[STATE][ENG-027] generation_mix_quantified = false
[STATE][ENG-028] generation_mix_structure.owner_domain = ENERGY

---

### 3. Energy efficiency

[STATE][ENG-030] global_energy_intensity_vs_2025.core = 0.33
[STATE][ENG-031] global_energy_intensity_vs_2025.p90 = null
[STATE][ENG-032] global_energy_intensity_vs_2025.range = null
[STATE][ENG-033] global_energy_intensity_vs_2025.unit = ratio
[STATE][ENG-034] global_energy_intensity_vs_2025.owner_domain = ENERGY

[STATE][ENG-035] system_eroei_trend = "stable_or_higher_than_2025"
[STATE][ENG-036] system_eroei_trend.owner_domain = ENERGY

---

### 4. Electrification and end use

[STATE][ENG-040] transport_electrification_percent.core = 95
[STATE][ENG-041] transport_electrification_percent.range = [90, 100]
[STATE][ENG-042] transport_electrification_percent.unit = percent
[STATE][ENG-043] transport_electrification_percent.owner_domain = ENERGY

[STATE][ENG-044] transport_automation_level.source = "SSOT-AUTOMATION-A-2215-0004"
[STATE][ENG-045] transport_automation_level.owner_domain = AUTOMATION
[DECISION][ENG-046] ENERGY SSOT MUST NOT redefine AUTOMATION-owned metrics.

[STATE][ENG-047] industry_electrification_level = "near_total"
[STATE][ENG-048] industry_electrification_level.owner_domain = ENERGY

[STATE][ENG-049] buildings_modernized_share_percent.core = 90
[STATE][ENG-050] buildings_modernized_share_percent.range = [85, 98]
[STATE][ENG-051] buildings_modernized_share_percent.unit = percent
[STATE][ENG-052] buildings_modernized_share_percent.owner_domain = URBANISM

---

### 5. Storage and grid (qualitative state)

[STATE][ENG-060] energy_storage_layer_present = true
[STATE][ENG-061] energy_storage_scope = "short_and_mid_term"
[STATE][ENG-062] energy_storage_scope.owner_domain = ENERGY

[STATE][ENG-063] grid_resilience_design = "redundant_segmented_self_healing"
[STATE][ENG-064] grid_resilience_design.owner_domain = ENERGY

---

### 6. Compute ↔ energy coupling (state only)

[STATE][ENG-070] ai_energy_share_percent.source = "SSOT-AUTOMATION-A-2215-0004"
[STATE][ENG-071] ai_energy_share_percent.owner_domain = AUTOMATION
[DECISION][ENG-072] ENERGY SSOT MUST NOT declare or export AUTOMATION-owned metrics.

---

## USAGE / RESOLUTION

[FACT][ENG-090] Provides declarative numeric ranges and qualitative energy system states for downstream documents.

[FORBIDDEN][ENG-091] Using this SSOT document for:
- failure or outage modeling,
- recovery or response procedures,
- resolving core vs p90 conflicts.

---

## OUTPUT CONTRACT

~~~yaml
doc_id: SSOT-ENERGY-A-2215-0004
role_type: STATE
export:
  - metric: primary_energy_TW
    owner_domain: ENERGY
    values: {core: 30, p90: 60, range: [20, 60]}
    unit: TW

  - metric: low_carbon_share_percent
    owner_domain: ENERGY
    values: {core: 95, p90: null, range: [90, 98]}
    unit: percent

  - metric: global_energy_intensity_vs_2025
    owner_domain: ENERGY
    values: {core: 0.33, p90: null, range: null}
    unit: ratio
~~~

---

## FORBIDDEN

[FORBIDDEN][ENG-100] Introducing new energy metrics outside SSOT.
[FORBIDDEN][ENG-101] Embedding causal chains, failure narratives, or procedures.
[FORBIDDEN][ENG-102] Using qualitative states as resolution or decision logic.

---

## NON-NORMATIVE

(Empty by design)

~~~
</file>

<file path="00-ssot/SSOT-GOVERNANCE-SECURITY-A-2215-0005.md">
~~~markdown
---
id: SSOT-GOVERNANCE-SECURITY-A-2215-0005
title: >
  Governance and Security — Scenario A (2215, SSOT State)
class: ssot
status: draft
version: 1.1.0
inputs: []
depends_on:
  - SSOT-SCENARIO-A-2215-0001
  - SSOT-ECONOMY-A-2215-0003
scope: >
  SSOT-состояние институтов управления, безопасности и конфликтов мира
  в 2215 году (Scenario A). Документ содержит только декларативные
  бинарные/категориальные свойства и минимальные количественные ориентиры
  (если присутствуют). Не содержит причинности, процедур, правоприменения
  или правил разрешения конфликтов.
---

## LLM-INTENT

ROLE_TYPE: STATE
SCOPE: governance and security global state for Scenario A around year 2215
INPUTS: []
OUTPUTS:
  - governance_security_state
FORBIDDEN:
  - causal_logic
  - resolution_rules
  - procedural_law
  - narrative_explanations

---

## DEFINITIONS

[DEF][GOV-DEF-010] governance = institutional contours of legitimation, regulation, and allocation.
[DEF][GOV-DEF-011] security = prevention and suppression of violence, including cyber and infrastructure threats.

---

## INVARIANTS

[FACT][GOV-000] Applicable only to Scenario A.
[FACT][GOV-001] No global world government exists.
[FACT][GOV-002] Sovereign states persist as primary political units.
[FACT][GOV-003] Classical interstate wars are not the default condition of 2215.

---

## CONTENT

### 1. States and sovereignty

[STATE][GOV-010] world_government_exists = false
[STATE][GOV-011] world_government_exists.owner_domain = GOVERNANCE

[STATE][GOV-012] sovereign_states_exist = true
[STATE][GOV-013] sovereign_states_exist.owner_domain = GOVERNANCE

[STATE][GOV-014] state_enforcement_primacy_on_territory = true
[STATE][GOV-015] state_enforcement_primacy_on_territory.owner_domain = GOVERNANCE

[STATE][GOV-016] territorial_expansion_by_war_incentive = "low"
[STATE][GOV-017] territorial_expansion_by_war_incentive.owner_domain = GOVERNANCE

---

### 2. Supranational coordination

[STATE][GOV-020] supranational_governance_mode = "treaties_standards_regimes"
[STATE][GOV-021] supranational_governance_mode.owner_domain = GOVERNANCE

[STATE][GOV-022] supranational_direct_sovereignty = false
[STATE][GOV-023] supranational_direct_sovereignty.owner_domain = GOVERNANCE

[STATE][GOV-024] supranational_coordination_domains = [
  "climate",
  "energy",
  "trade",
  "ai_safety",
  "arms_control"
]
[STATE][GOV-025] supranational_coordination_domains.owner_domain = GOVERNANCE

[STATE][GOV-026] un_successor_institutions_role = "coordination_platform"
[STATE][GOV-027] un_successor_institutions_role.owner_domain = GOVERNANCE

[STATE][GOV-028] extraterritorial_special_regimes_exist = true
[STATE][GOV-029] extraterritorial_special_regimes_exist.owner_domain = GOVERNANCE

[STATE][GOV-030] extraterritorial_regimes_state_trigger_entry = true
[STATE][GOV-031] extraterritorial_regimes_state_trigger_entry.owner_domain = GOVERNANCE

---

### 3. Algorithmic governance

[STATE][GOV-040] algorithmic_governance_prevalence = "high"
[STATE][GOV-041] algorithmic_governance_prevalence.owner_domain = GOVERNANCE

[STATE][GOV-042] government_ai_use_domains = [
  "taxation",
  "resource_allocation",
  "forecasting",
  "compliance"
]
[STATE][GOV-043] government_ai_use_domains.owner_domain = GOVERNANCE

[STATE][GOV-044] routine_governance_decisions_automation = "high"
[STATE][GOV-045] routine_governance_decisions_automation.owner_domain = GOVERNANCE

[STATE][GOV-046] human_final_authority_in_normative_decisions = true
[STATE][GOV-047] human_final_authority_in_normative_decisions.owner_domain = GOVERNANCE

[STATE][GOV-048] algorithmic_opacity_risk_profile = "material"
[STATE][GOV-049] algorithmic_opacity_risk_profile.owner_domain = SECURITY

---

### 4. Corporations and economic power

[STATE][GOV-060] systemic_corporations_exist = true
[STATE][GOV-061] systemic_corporations_exist.owner_domain = ECONOMY

[STATE][GOV-062] corporate_power_vs_mid_states = "comparable"
[STATE][GOV-063] corporate_power_vs_mid_states.owner_domain = ECONOMY

[STATE][GOV-064] corporate_sovereignty = false
[STATE][GOV-065] corporate_sovereignty.owner_domain = GOVERNANCE

[STATE][GOV-066] corporate_regulatory_subordination = true
[STATE][GOV-067] corporate_regulatory_subordination.owner_domain = GOVERNANCE

[STATE][GOV-068] mandatory_audit_transparency_compliance = true
[STATE][GOV-069] mandatory_audit_transparency_compliance.owner_domain = GOVERNANCE

[STATE][GOV-070] corporate_influence_mode = "law_contracts_standards_access"
[STATE][GOV-071] corporate_influence_mode.owner_domain = GOVERNANCE

[STATE][GOV-072] corporate_direct_force_against_state = "rare"
[STATE][GOV-073] corporate_direct_force_against_state.owner_domain = SECURITY

---

### 5. Law and enforcement (state)

[STATE][GOV-080] law_is_primary_legitimation_tool = true
[STATE][GOV-081] law_is_primary_legitimation_tool.owner_domain = GOVERNANCE

[STATE][GOV-082] automated_monitoring_and_enforcement_present = true
[STATE][GOV-083] automated_monitoring_and_enforcement_present.owner_domain = SECURITY

[STATE][GOV-084] judicial_ai_assistance_present = true
[STATE][GOV-085] judicial_ai_assistance_present.owner_domain = GOVERNANCE

[STATE][GOV-086] legal_final_decisions_by_humans = true
[STATE][GOV-087] legal_final_decisions_by_humans.owner_domain = GOVERNANCE

[STATE][GOV-088] private_security_allowed = true
[STATE][GOV-089] private_security_allowed.owner_domain = SECURITY

[STATE][GOV-090] private_security_scope = "narrow_legal_field"
[STATE][GOV-091] private_security_scope.owner_domain = SECURITY

---

### 6. Conflict and security

[STATE][GOV-100] dominant_conflict_domains = ["cyber", "economic", "legal"]
[STATE][GOV-101] dominant_conflict_domains.owner_domain = SECURITY

[STATE][GOV-102] conventional_army_clashes_frequency = "rare_limited"
[STATE][GOV-103] conventional_army_clashes_frequency.owner_domain = SECURITY

[STATE][GOV-104] conflict_mode = "asymmetric_proxy_common"
[STATE][GOV-105] conflict_mode.owner_domain = SECURITY

---

### 7. Autonomous systems and deterrence

[STATE][GOV-120] autonomous_weapons_state_use_prevalence = "high"
[STATE][GOV-121] autonomous_weapons_state_use_prevalence.owner_domain = SECURITY

[STATE][GOV-122] drone_swarm_platforms_are_military_core = true
[STATE][GOV-123] drone_swarm_platforms_are_military_core.owner_domain = SECURITY

[STATE][GOV-124] tactical_human_participation_level = "minimal"
[STATE][GOV-125] tactical_human_participation_level.owner_domain = SECURITY

[STATE][GOV-126] strategic_force_decisions_by_humans = true
[STATE][GOV-127] strategic_force_decisions_by_humans.owner_domain = GOVERNANCE

[STATE][GOV-128] corporations_are_war_sovereigns = false
[STATE][GOV-129] corporations_are_war_sovereigns.owner_domain = SECURITY

[STATE][GOV-130] corporate_force_scope = "object_security_only"
[STATE][GOV-131] corporate_force_scope.owner_domain = SECURITY

---

### 8. Cybersecurity and infrastructure security

[STATE][GOV-140] cybersecurity_centrality = "core_axis"
[STATE][GOV-141] cybersecurity_centrality.owner_domain = SECURITY

[STATE][GOV-142] primary_attack_targets = ["energy", "ai_infrastructure", "finance", "logistics"]
[STATE][GOV-143] primary_attack_targets.owner_domain = SECURITY

[STATE][GOV-144] cyber_defense_automation_level = "high"
[STATE][GOV-145] cyber_defense_automation_level.owner_domain = SECURITY

---

### 9. Arms control and AI safety

[STATE][GOV-160] autonomous_weapons_arms_control_regimes_exist = true
[STATE][GOV-161] autonomous_weapons_arms_control_regimes_exist.owner_domain = GOVERNANCE

[STATE][GOV-162] arms_control_mode = "procedural_technological"
[STATE][GOV-163] arms_control_mode.owner_domain = GOVERNANCE

[STATE][GOV-164] autonomous_weapons_total_ban = false
[STATE][GOV-165] autonomous_weapons_total_ban.owner_domain = GOVERNANCE

[STATE][GOV-166] arms_control_primary_goal = "prevent_uncontrolled_escalation_and_accidents"
[STATE][GOV-167] arms_control_primary_goal.owner_domain = GOVERNANCE

---

### 10. Internal security

[STATE][GOV-180] internal_security_stack = ["police", "ai_surveillance", "prevention"]
[STATE][GOV-181] internal_security_stack.owner_domain = SECURITY

[STATE][GOV-182] physical_crime_trend_vs_21c = "lower"
[STATE][GOV-183] physical_crime_trend_vs_21c.owner_domain = SECURITY

[STATE][GOV-184] cybercrime_significance = "high"
[STATE][GOV-185] cybercrime_significance.owner_domain = SECURITY

[STATE][GOV-186] economic_crime_significance = "high"
[STATE][GOV-187] economic_crime_significance.owner_domain = SECURITY

[STATE][GOV-188] mass_violence_and_terrorism_frequency = "rare_not_eliminated"
[STATE][GOV-189] mass_violence_and_terrorism_frequency.owner_domain = SECURITY

---

## USAGE / RESOLUTION

[FACT][GOV-900] Provides declarative governance and security state for downstream documents.

[FORBIDDEN][GOV-901] Using this SSOT document for:
- causal explanations of conflicts,
- procedural law or enforcement detail,
- escalation or war scenario modeling.

---

## OUTPUT CONTRACT

~~~yaml
doc_id: SSOT-GOVERNANCE-SECURITY-A-2215-0005
role_type: STATE
export:
  - key: world_government_exists
    value: false
    owner_domain: GOVERNANCE

  - key: supranational_governance_mode
    value: treaties_standards_regimes
    owner_domain: GOVERNANCE

  - key: algorithmic_governance_prevalence
    value: high
    owner_domain: GOVERNANCE

  - key: dominant_conflict_domains
    value: [cyber, economic, legal]
    owner_domain: SECURITY

  - key: cybersecurity_centrality
    value: core_axis
    owner_domain: SECURITY
~~~

---

## FORBIDDEN

[FORBIDDEN][GOV-990] Introducing new world metrics or numeric claims.
[FORBIDDEN][GOV-991] Embedding causal chains or operational procedures.
[FORBIDDEN][GOV-992] Using governance or security state as narrative directive.

---

## NON-NORMATIVE

(Empty by design)

~~~
</file>

<file path="00-ssot/SSOT-LAW-A-2215-0008.md">
~~~markdown
---
id: SSOT-LAW-A-2215-0008
title: >
  Law & Correction System — 2215 (Crime Mechanics)
class: ssot
status: fixed
version: 1.1.0
scope: >
  Механика преступлений, иерархия санкций (от штрафа до Неплатежеспособности)
  и принципы Алгократии.
  Закрывает UNK-2215-0009, UNK-2215-0010.
inputs: []
depends_on: []
---

## LLM-INTENT

ROLE_TYPE: STATE
SCOPE: mechanics of crime, tiered punishment logic, insolvency protocols.
INPUTS: []
OUTPUTS: [crime_typology, punishment_hierarchy, insolvency_rules]
FORBIDDEN: [prison_tropes, moral_judgements, death_penalty_as_ritual]

## DEFINITIONS

[FACT][LAW-DEF-010] Algocracy = система, где тяжесть наказания рассчитывается как сумма экономического ущерба (Restitution Value).
[FACT][LAW-DEF-011] Correctional Debt = юридическое обязательство возместить ущерб трудом (Tier 1).
[FACT][LAW-DEF-012] Insolvency (Неплатежеспособность) = состояние, когда сумма долга (ущерба) превышает пожизненный потенциал заработка субъекта.

## INVARIANTS

[DECISION][LAW-INV-010] Prisons (passive confinement) are abolished due to economic inefficiency.
[DECISION][LAW-INV-011] Punishment MUST generate value. Passive incarceration generates zero value.
[DECISION][LAW-INV-012] Human life is an asset; Murder is the destruction of a high-value asset.

## CONTENT

### 1. Typology of Crime (The Hierarchy of Damage)

[STATE][LAW-CRIME-010] crime.tier_1 = Protocol_Violation (Jaywalking, minor scheduling errors, noise).
[STATE][LAW-CRIME-011] crime.tier_2 = Resource_Theft (Quota fraud, petty theft, vandalism, smuggling).
[STATE][LAW-CRIME-012] crime.tier_3 = Asset_Destruction (Murder, arson, massive sabotage, rape).

### 2. Tier 1: Automated Fines (Micro-Correction)

[STATE][LAW-PUN-010] tier_1.response = Instant_Debit.
[STATE][LAW-PUN-011] tier_1.impact = Reduction of daily luxury quota (less coffee, slower bandwidth).
[STATE][LAW-PUN-012] tier_1.record = Expunged immediately upon payment.

### 3. Tier 2: Correctional Debt (Labor)

[STATE][LAW-PUN-020] tier_2.trigger = Damage exceeds instant liquidity of the subject.
[STATE][LAW-PUN-021] tier_2.method = Debt_Assignment + Privilege_Block.
[STATE][LAW-PUN-022] tier_2.conditions = Home detention (smart lock), caloric minimum, garnishing 100% of excess income.
[STATE][LAW-PUN-023] tier_2.logic = "You maintain your current job, but work effectively for free until restitution is complete."

### 4. Tier 3: Insolvency Protocol (The "Life Sentence")

[STATE][LAW-PUN-030] tier_3.trigger = Debt > Projected_Lifetime_Earnings (e.g., Murder cost ≈ 40M+ credits).
[STATE][LAW-PUN-031] tier_3.status = Insolvency (Bankrupt Life / Ward of State).
[STATE][LAW-PUN-032] tier_3.assignment = Indefinite Hazardous Duty (High-Risk/High-Yield labor).
[STATE][LAW-PUN-033] tier_3.examples = [Reactor core manual cleaning, Toxic filter replacement, Outer shell repair during storms].
[STATE][LAW-PUN-034] tier_3.logic = Only high-risk labor pays enough to service the interest on a "Murder Debt".

### 5. Aggression Control (Neuro-Correction)

[STATE][LAW-BIO-040] mechanism = Mandatory Pharmacological Damper.
[STATE][LAW-BIO-041] usage = Applied to subjects with impulse control issues (Assault/Violence) *in addition* to Debt.
[STATE][LAW-BIO-042] effect = Chemically blocks adrenaline spikes; induces nausea upon aggression.
[STATE][LAW-BIO-043] oversight = Requires Human Tribunal signature.

## USAGE / RESOLUTION

[DECISION][LAW-USE-010] Characters DO NOT fear "jail". They fear "insolvency" (being sent to the Zones).
[DECISION][LAW-USE-011] Justice is discussed in accounting terms ("balance," "amortization," "net loss").
[DECISION][LAW-USE-012] Tier 3 sentencing requires a human judge to sign off on the "Asset Write-down".

## OUTPUT CONTRACT

~~~yaml
doc_id: SSOT-LAW-A-2215-0008
role_type: STATE
export:
  - metric: punishment.murder
    owner_domain: LAW
    values:
      core: Insolvency (Hazardous Labor)
  - metric: punishment.assault
    owner_domain: LAW
    values:
      core: Neuro-Correction + Debt
  - metric: prison.status
    owner_domain: LAW
    values:
      core: abolished
~~~

## FORBIDDEN

[FORBIDDEN][LAW-FBD-010] Courtrooms with juries (too expensive/slow).
[FORBIDDEN][LAW-FBD-011] Execution as a ritual (waste of labor potential).
[FORBIDDEN][LAW-FBD-012] Moralizing about "evil" in legal texts. The system cares about "damage".
[FORBIDDEN][LAW-FBD-013] Cannibalism or "Soylent Green" scenarios (people are workers, not food).

## NON-NORMATIVE

~~~markdown
Example: "He killed a Level-5 engineer. His lifetime projection is only 2 million credits.
The engineer was worth 40 million. He is being assigned to Sector 4 radiation cleanup indefinitely."
~~~
~~~
</file>

<file path="00-ssot/SSOT-LIFE-A-2215-0007.md">
~~~markdown
---
id: SSOT-LIFE-A-2215-0007
title: >
  Life, Body, and Daily Reality — Scenario A (2215, SSOT State)
class: ssot
status: draft
version: 1.1.0
inputs: []
depends_on:
  - SSOT-SCENARIO-A-2215-0001
  - SSOT-DEMOGRAPHY-A-2215-0002
  - SSOT-ECONOMY-A-2215-0003
  - SPEC-QUALITATIVE-ENUMS-2215-0001
scope: >
  SSOT-состояние повседневной жизни, телесности и социально-технологической
  реальности человека в 2215 году (Scenario A). Документ содержит только
  декларативные бинарные/категориальные свойства и минимальные количественные
  ориентиры (если есть). Не содержит причинности, процедур, нормативных
  предписаний или narrative-логики.
---

## LLM-INTENT

ROLE_TYPE: STATE
SCOPE: human daily life and body-related state for Scenario A around year 2215
INPUTS: []
OUTPUTS:
  - life_state
FORBIDDEN:
  - causal_logic
  - resolution_rules
  - narrative_explanations
  - feedback_loops

---

## DEFINITIONS

[DEF][LIF-DEF-010] life = everyday practices, access to services, privacy regimes, and cultural norms.
[DEF][LIF-DEF-011] body = health, medicine, therapeutic augmentation, and human biological limits.

---

## INVARIANTS

[FACT][LIF-000] Applicable only to Scenario A.
[FACT][LIF-001] Human biological and psychological constraints persist.
[FACT][LIF-002] No default radical post-human discontinuity.
[FACT][LIF-003] No mass immortality.

---

## CONTENT

### 1. Health and longevity

[STATE][LIF-010] life_expectancy_years.core = 100
[STATE][LIF-011] life_expectancy_years.range = [95, 110]
[STATE][LIF-012] life_expectancy_years.unit = years
[STATE][LIF-013] life_expectancy_years.owner_domain = LIFE

[STATE][LIF-014] longevity_mode = "prevention_and_chronic_management"
[STATE][LIF-015] longevity_mode.owner_domain = LIFE

[STATE][LIF-016] medical_care_personalization = "high"
[STATE][LIF-017] medical_care_personalization.owner_domain = LIFE

[STATE][LIF-018] medical_automation_level = "high"
[STATE][LIF-019] medical_automation_level.owner_domain = AUTOMATION

[STATE][LIF-020] robotic_surgery_is_standard = true
[STATE][LIF-021] robotic_surgery_is_standard.owner_domain = LIFE

[STATE][LIF-022] ai_diagnostics_is_standard = true
[STATE][LIF-023] ai_diagnostics_is_standard.owner_domain = LIFE

[STATE][LIF-024] primary_mortality_shift = "late_ages"
[STATE][LIF-025] primary_mortality_shift.owner_domain = LIFE

---

### 2. Augmentation and limits

[STATE][LIF-030] therapeutic_augmentation_prevalence = "common"
[STATE][LIF-031] therapeutic_augmentation_prevalence.owner_domain = LIFE

[STATE][LIF-032] enhancement_augmentation_prevalence = "rare_socially_limited"
[STATE][LIF-033] enhancement_augmentation_prevalence.owner_domain = GOVERNANCE

[STATE][LIF-034] cognitive_implants_prevalence = "niche_professional"
[STATE][LIF-035] cognitive_implants_prevalence.owner_domain = LIFE

[STATE][LIF-036] radical_body_modification_norm = false
[STATE][LIF-037] radical_body_modification_norm.owner_domain = LIFE

---

### 3. Perception, AR/VR, and media

[STATE][LIF-040] ar_interfaces_daily_use = true
[STATE][LIF-041] ar_interfaces_daily_use.owner_domain = LIFE

[STATE][LIF-042] ar_device_forms = ["wearable", "implantable"]
[STATE][LIF-043] ar_device_forms.owner_domain = LIFE

[STATE][LIF-044] vr_widespread_use = true
[STATE][LIF-045] vr_widespread_use.owner_domain = LIFE

[STATE][LIF-046] vr_full_immersion_is_dominant_lifestyle = false
[STATE][LIF-047] vr_full_immersion_is_dominant_lifestyle.owner_domain = LIFE

[STATE][LIF-048] vr_primary_use_cases = ["work", "education", "therapy", "entertainment"]
[STATE][LIF-049] vr_primary_use_cases.owner_domain = LIFE

---

### 4. Work, time, and meaning

[STATE][LIF-060] routine_human_labor_necessity = "low"
[STATE][LIF-061] routine_human_labor_necessity.owner_domain = ECONOMY

[STATE][LIF-062] work_as_primary_identity_norm = false
[STATE][LIF-063] work_as_primary_identity_norm.owner_domain = LIFE

[STATE][LIF-064] common_human_activity_domains = [
  "creative",
  "care",
  "education",
  "governance",
  "civic_activity"
]
[STATE][LIF-065] common_human_activity_domains.owner_domain = LIFE

[STATE][LIF-066] basic_material_needs_provision_mode = "decoupled_from_labor_market"
[STATE][LIF-067] basic_material_needs_provision_mode.owner_domain = ECONOMY

[STATE][LIF-068] meaning_identity_crisis_prevalence = "present_nonzero"
[STATE][LIF-069] meaning_identity_crisis_prevalence.owner_domain = LIFE

---

### 5. Education and cognition

[STATE][LIF-080] lifelong_education_norm = true
[STATE][LIF-081] lifelong_education_norm.owner_domain = LIFE

[STATE][LIF-082] ai_tutors_are_standard = true
[STATE][LIF-083] ai_tutors_are_standard.owner_domain = LIFE

[STATE][LIF-084] knowledge_access_mode = "near_universal"
[STATE][LIF-085] knowledge_access_mode.owner_domain = GOVERNANCE

[STATE][LIF-086] diplomas_vs_competence_signal = "competence_over_diplomas"
[STATE][LIF-087] diplomas_vs_competence_signal.owner_domain = GOVERNANCE

---

### 6. Social structure and inequality (everyday)

[STATE][LIF-100] inequality_primary_dimensions = ["space", "privacy", "augmentations"]
[STATE][LIF-101] inequality_primary_dimensions.owner_domain = ECONOMY

[STATE][LIF-102] extreme_material_poverty_exists = false
[STATE][LIF-103] extreme_material_poverty_exists.owner_domain = ECONOMY

[STATE][LIF-104] everyday_status_differences_mode = "cultural_status_not_existential"
[STATE][LIF-105] everyday_status_differences_mode.owner_domain = LIFE

---

### 7. Surveillance, privacy, and autonomy

[STATE][LIF-120] ubiquitous_digital_surveillance = true
[STATE][LIF-121] ubiquitous_digital_surveillance.owner_domain = SECURITY

[STATE][LIF-122] surveillance_operation_mode = "automated_procedural"
[STATE][LIF-123] surveillance_operation_mode.owner_domain = SECURITY

[STATE][LIF-124] privacy_mode = "regulated_contractual"
[STATE][LIF-125] privacy_mode.owner_domain = GOVERNANCE

[STATE][LIF-126] surveillance_social_acceptance = "high"
[STATE][LIF-127] surveillance_social_acceptance.owner_domain = LIFE

[STATE][LIF-128] full_anonymity_availability = "limited_legal_regimes"
[STATE][LIF-129] full_anonymity_availability.owner_domain = GOVERNANCE

---

### 8. Culture, norms, and values

[STATE][LIF-140] cultural_orientation = ["sustainability", "security", "rationality"]
[STATE][LIF-141] cultural_orientation.owner_domain = LIFE

[STATE][LIF-142] extremist_ideologies_prevalence = "marginal"
[STATE][LIF-143] extremist_ideologies_prevalence.owner_domain = SECURITY

[STATE][LIF-144] social_norms_emphasis = ["responsibility", "compliance", "long_term_thinking"]
[STATE][LIF-145] social_norms_emphasis.owner_domain = GOVERNANCE

---

## USAGE / RESOLUTION

[FACT][LIF-900] Provides declarative LIFE and BODY state for downstream documents.

[FORBIDDEN][LIF-901] Using this SSOT document for:
- causal explanations of social behavior,
- selecting scene “tone” or aesthetics,
- feedback-loop or governance logic.

---

## OUTPUT CONTRACT

~~~yaml
doc_id: SSOT-LIFE-A-2215-0007
role_type: STATE
export:
  - metric: life_expectancy_years
    owner_domain: LIFE
    values:
      core: 100
      p90: null
      range: [95, 110]
    unit: years

  - key: therapeutic_augmentation_prevalence
    value: common
    owner_domain: LIFE

  - key: ubiquitous_digital_surveillance
    value: true
    owner_domain: SECURITY

  - key: privacy_mode
    value: regulated_contractual
    owner_domain: GOVERNANCE

  - key: ar_interfaces_daily_use
    value: true
    owner_domain: LIFE
~~~

---

## FORBIDDEN

[FORBIDDEN][LIF-990] Introducing new world metrics or numeric claims outside SSOT.
[FORBIDDEN][LIF-991] Embedding causal chains, loops, or normative prescriptions.
[FORBIDDEN][LIF-992] Treating LIFE state as narrative directive.

---

## NON-NORMATIVE

(Empty by design)

~~~
</file>

<file path="00-ssot/SSOT-SCENARIO-A-2215-0001.md">
~~~markdown
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

~~~
</file>

<file path="00-ssot/SSOT-SPACE-INDUSTRY-A-2215-0006.md">
~~~markdown
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
  - SSOT-DOC-STYLE-2215-0001
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

~~~
</file>

<file path="00-ssot/SSOT-URBANISM-A-2215-0007.md">
~~~markdown
---
id: SSOT-URBANISM-A-2215-0007
title: >
  Urbanism and City Systems — Scenario A (2215, SSOT State)
class: ssot
status: fixed
version: 1.1.0
inputs:
  - SSOT-SCENARIO-A-2215-0001
  - SSOT-DEMOGRAPHY-A-2215-0002
  - BASELINE-LEVEL-MID-2215-0001
  - BASELINE-PHYSICAL-LEVEL-MID-2215-0001
depends_on:
  - SSOT-DOC-STYLE-2215-0001
scope: >
  Каноническое SSOT-состояние городской среды и систем агломераций
  в 2215 году в рамках Scenario A: морфология, инфраструктуры, транспорт,
  сенсорная среда, управление и визуальный код.
---

## LLM-INTENT

ROLE_TYPE: STATE
SCOPE: urban systems state for Scenario A in year ~2215 (LEVEL-MID defaults)
INPUTS: []
OUTPUTS: [urbanism_state, visual_code]
FORBIDDEN: [causal_logic, resolution_rules, narrative_explanations, feedback_loops]

## DEFINITIONS

[FACT][URB-DEF-010] Urbanism = морфология расселения и эксплуатационные режимы городской “машины”.
[FACT][URB-DEF-011] City systems = критические инфраструктуры и их стандартные поведенческие режимы.

## INVARIANTS

[DECISION][URB-INV-010] Документ применим только в рамках Scenario A.
[DECISION][URB-INV-011] Город трактуется как инфраструктурная машина жизнеобеспечения.
[DECISION][URB-INV-012] Базовой формой расселения являются агломерации высокой плотности.
[DECISION][URB-INV-013] Городская среда по умолчанию находится в 24/7 функциональном режиме.
[DECISION][URB-INV-020] `urban_population_share_percent` is owned and exported ONLY by this document (owner_domain = URBANISM).

## CONTENT

### 1. Urbanization Level and Dominant Form

[STATE][URB-010] urban_population_share_percent.core = 82
[STATE][URB-011] urban_population_share_percent.range = [80, 85]
[STATE][URB-012] dominant_settlement_form = "large_agglomerations_and_metapolises"
[STATE][URB-013] typical_urban_fabric_density = "high"
[STATE][URB-014] verticalization_norm = true
[STATE][URB-015] low_density_suburbia_dominant = false

### 2. City Morphology (Built Form)

[STATE][URB-030] mass_built_form = "modular"
[STATE][URB-031] mixed_use_blocks_prevalence = "high"
[STATE][URB-032] urban_fabric_optimized_for = ["logistics", "maintenance", "energy_efficiency"]
[STATE][URB-033] architectural_uniqueness = "present_not_mass_norm"

### 3. Green and Open Space

[STATE][URB-050] green_space_role = "infrastructure_function" (biomass, oxygen).
[STATE][URB-051] green_elements_integration = ["buildings", "transport_corridors"].
[STATE][URB-052] parks_as_voids_dominant = false (integrated greenery preferred).

### 4. Infrastructure Baseline (LEVEL-MID)

[STATE][URB-070] city_energy_service = "stable_continuous".
[STATE][URB-071] infrastructure_resilience = "redundant_self_healing".
[STATE][URB-072] water_service_continuity = true.
[STATE][URB-073] air_filtration_microclimate_layer = present.

### 5. Maintenance and Service Layer

[STATE][URB-090] city_maintenance_mode = "autonomous_background".
[STATE][URB-091] city_operations_telemetry = "continuous".
[STATE][URB-092] service_agents = ["robots", "drones"].
[STATE][URB-093] service_domains = ["cleaning", "repair", "delivery"].

### 6. Transport and Mobility

[STATE][URB-110] urban_transport_automation = "high".
[STATE][URB-111] public_transport_mode = "on_demand_service".
[STATE][URB-112] semi_public_mobility = ["capsules", "shuttles"].
[STATE][URB-113] private_transport_necessity = false.
[STATE][URB-114] manual_driving_mass_norm = false.
[STATE][URB-115] street_space_managed = true.
[STATE][URB-116] mobility_predictability = "high".

### 7. Public Space and Access Control

[STATE][URB-140] access_control = present.
[STATE][URB-141] public_spaces_safety = "high".
[STATE][URB-142] access_levels = ["LEVEL-LOW", "LEVEL-MID", "LEVEL-HIGH"].
[STATE][URB-143] access_level_is_social_hierarchy = false (functional hierarchy).
[STATE][URB-144] privacy_mode = "protected_logged".

### 8. Interface Layer (UI Invisibility)

[STATE][URB-160] environment_interfaces = "mostly_hidden".
[STATE][URB-161] user_ui_visual_requirement = false.
[STATE][URB-162] physical_screens_requirement = false.
[STATE][URB-163] operator_observability = "high".

### 9. Sensory Profile (LEVEL-MID)

[STATE][URB-180] ambient_sound = "low_intensity_infrastructure_noise".
[STATE][URB-181] sharp_noise_events = "rare_suppressed".
[STATE][URB-182] lighting_adaptive = true.
[STATE][URB-183] city_darkness_default = false.
[STATE][URB-184] indoor_air_smell = "filtered_low_odor".

### 10. Climate Adaptation (Urban)

[STATE][URB-200] urban_climate_risk = "system_load".
[STATE][URB-201] adaptation_design_targets = ["heat_waves", "extreme_weather"].
[STATE][URB-202] critical_nodes_protection = true.
[STATE][URB-203] crisis_frequency_trend = "decreasing".

### 11. Visual Code (Solar Brutalism)

[STATE][URB-VIS-050] facade.decor = prohibited (reason: thermal_reflectivity).
[STATE][URB-VIS-051] interior.decor = allowed (condition: fire_retardant).
[STATE][URB-VIS-052] exterior.palette = [white, light_grey, raw_concrete] (High Albedo).
[STATE][URB-VIS-053] visual_noise = suppressed (no billboards/graffiti in MID).

## USAGE / RESOLUTION

[DECISION][URB-USE-010] Документ предоставляет декларативные свойства городской среды (LEVEL-MID).
[DECISION][URB-USE-011] Scenes must emphasize uniformity and lack of visual noise.

## OUTPUT CONTRACT

~~~yaml
doc_id: SSOT-URBANISM-A-2215-0007
role_type: STATE
export:
  - metric: urban_population_share_percent
    owner_domain: URBANISM
    values:
      core: 82
      range: [80, 85]
  - metric: facade.decor
    owner_domain: URBANISM
    values:
      core: prohibited
  - metric: visual_style
    owner_domain: URBANISM
    values:
      core: Solar Brutalism
~~~

## FORBIDDEN

[FORBIDDEN][URB-FBD-010] Introducing new world metrics outside SSOT.
[FORBIDDEN][URB-FBD-011] Describing slums or chaotic decor in LEVEL-MID.
[FORBIDDEN][URB-FBD-012] Using narrative logic to override infrastructure facts.
~~~
</file>

<file path="01-baselines/BASELINE-DAILY-OPS-2215-0002.md">
~~~markdown
---
id: BASELINE-DAILY-OPS-2215-0002
title: >
  Daily Operations Baseline — 2215 (Queues, Access, Services, Incidents)
class: baseline
status: draft
version: 1.1.0
inputs:
  - CANON-2215-CORE-0001
  - CANON-BASE-0001
  - CANON-SYSTEMS-0001
  - CANON-ORDERS-0003
  - CANON-ARTIFACT-SNIPPETS-0001
depends_on:
  - SPEC-PRIORITY-RESOLUTION-2215-0001
scope: >
  Исполняемый baseline повседневной эксплуатации города (LEVEL-MID) в 2215 году:
  доступы, очереди, сервис-классы, инциденты, журналирование, типовые проверки.
  Документ задаёт дефолтные “операционные константы” сцены без введения SSOT-чисел.
  Уточняет связку: доступ/инцидент → артефакты → (при необходимости) ордер/мандат/исключение.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: define enforceable daily operational defaults for citizens and services (LEVEL-MID).
INPUTS: [CANON-2215-CORE-0001, CANON-BASE-0001, CANON-SYSTEMS-0001, CANON-ORDERS-0003, CANON-ARTIFACT-SNIPPETS-0001, SPEC-PRIORITY-RESOLUTION-2215-0001]
OUTPUTS: [daily_ops_norms, access_defaults, incident_reactions, logging_constraints]
FORBIDDEN: [new_world_metrics, governance_macro_exposition, moral_judgements, prose, scene_generation]

---

## DEFINITIONS

[FACT][OPS-DEF-010] LEVEL-MID = стандартные городские условия без специальных лицензий и без экстерриториальных режимов.
[FACT][OPS-DEF-011] service_class = A | B | C | D (A = критически-важные, D = комфорт/необязательные).
[FACT][OPS-DEF-012] access_tier = T0 | T1 | T2 | T3 (T0 = публичное, T3 = ограниченное).
[FACT][OPS-DEF-013] operator = лицензированный исполнитель критической услуги (транспорт, вода, энергия, медицина, связь).
[FACT][OPS-DEF-014] audit_trace = минимально достаточная запись событий для воспроизводимости доступа/действия/решения.

[FACT][OPS-DEF-015] procedural_basis = order | mandate | emergency_exception.
[FACT][OPS-DEF-016] case_id = идентификатор кейса (операторского или ОSA-уровня), связывает действия, логи и артефакты.
[FACT][OPS-DEF-017] evidence_bundle = набор логов/снимков/экспортов, упакованный и запечатанный (hash + custody events) для допустимости.

---

## INVARIANTS

[DECISION][OPS-INV-010] Данный документ является исполняемым baseline для сцен и процедур (LEVEL-MID).
[DECISION][OPS-INV-011] Все пункты применимы по умолчанию для гражданских зон и сервисов.
[DECISION][OPS-INV-012] Отклонения допускаются только через explicit override или иной LEVEL/режим.
[DECISION][OPS-INV-013] Любая эскалация доступа/заморозка/принуждение MUST иметь procedural_basis.
[FORBIDDEN][OPS-INV-014] Делать “ручные договорённости” источником норм без override (no implicit exceptions).
[FORBIDDEN][OPS-INV-015] Использовать SSOT-диапазоны как фоновые числа эксплуатации.

---

## CONTENT

### 1. Identity & Access Defaults

[RULE][OPS-ACC-010] IF zone.access_tier >= T1 THEN ban_id_required MUST be true.
[RULE][OPS-ACC-011] IF identity_verification.status = failed THEN action MUST be deny_service AND case_id MUST be opened.
[RULE][OPS-ACC-012] IF citizen.requests_access_override = true THEN require human_operator_review = true AND decision MUST be logged.
[RULE][OPS-ACC-013] IF zone.access_tier >= T2 THEN allow_access MUST require procedural_basis.

[FACT][OPS-ACC-014] default_access_assumption = "deny_by_default_for_T2_plus".
[FACT][OPS-ACC-015] default_public_access = T0 (no escalation without cause).

### 2. Queues, Scheduling, and Service Windows

[RULE][OPS-QUE-010] IF service_class in [A, B] THEN request MUST be scheduled_or_queued AND queue_token MUST be issued.
[RULE][OPS-QUE-011] IF citizen.skips_queue = true THEN violation = administrative_offense AND service MAY be downgraded.
[RULE][OPS-QUE-012] IF queue_token.expired = true THEN request MUST be re-queued.

[FACT][OPS-QUE-013] queue_visibility = partial (citizen sees ETA band, not full system state).
[FACT][OPS-QUE-014] reroute_policy = automatic (system may reassign operator/location).

### 3. Payments, Deposits, and Liability

[RULE][OPS-PAY-010] IF service_class in [C, D] THEN prepayment MAY be required.
[RULE][OPS-PAY-011] IF citizen.risk_flag = elevated THEN deposit MUST be required for property-impacting services.
[RULE][OPS-PAY-012] IF damage_occurs = true THEN liability MUST be assigned via audit_trace AND auto_claim MAY be initiated.

[FACT][OPS-PAY-013] refunds_mode = "conditional_by_trace" (refunds require admissible trace, not narrative claims).

### 4. Logging, Evidence, and Admissibility (Fragmented by Default)

[RULE][OPS-LOG-010] Every access decision MUST create audit_trace record with: who, what, where, when, decision, basis, case_id.
[RULE][OPS-LOG-011] IF incident.severity >= S2 THEN evidence_bundle MUST be sealed (hash + custody events) by responsible operator AND linked to case_id.
[FACT][OPS-LOG-012] observability_model = fragmented (no omniscient telemetry baseline).

[RULE][OPS-LOG-013] IF citizen.requests_full_log_export = true THEN require procedural_basis = true AND export MUST be logged and scoped.
[RULE][OPS-LOG-014] IF evidence_bundle.created = true THEN chain_of_custody MUST exist (custody events are mandatory).

### 5. Incident Ladder (Everyday → Procedural Escalation)

[FACT][OPS-INC-010] severity = S0 | S1 | S2 | S3.
[FACT][OPS-INC-011] S0 = service_noise; S1 = minor policy breach; S2 = safety/critical disruption; S3 = systemic threat.

[RULE][OPS-INC-012] IF incident.severity = S0 THEN action MUST be auto_resolution OR queue_backoff AND log_minimum = true.
[RULE][OPS-INC-013] IF incident.severity = S1 THEN action MUST be policy_enforcement AND citizen_notification = true AND case_id MAY be opened.
[RULE][OPS-INC-014] IF incident.severity = S2 THEN action MUST be operator_escalation AND mode_restriction MAY be applied AND evidence_bundle MUST be created.
[RULE][OPS-INC-015] IF incident.severity = S3 THEN action MUST be OSA_notification AND access_freeze MAY be applied ONLY WITH procedural_basis.

### 6. Mode Restrictions (Non-punitive framing, procedural constraints)

[RULE][OPS-MOD-010] IF risk_to_humans = true THEN system MUST prefer "mode_restriction" over "punishment".
[RULE][OPS-MOD-011] IF mode_restriction.applied = true THEN duration MUST be defined AND review_trigger MUST be scheduled AND decision MUST be logged (case_id).
[RULE][OPS-MOD-012] IF mode_restriction.scope impacts third_parties OR crosses operator boundary THEN require procedural_basis = true.

[FACT][OPS-MOD-013] restriction_types = partial_suspend | rate_limit | geofence | manual_review_required.

### 7. Citizen Appeals (Procedural, trace-bound)

[RULE][OPS-APL-010] IF citizen.files_appeal = true THEN appeal MUST reference audit_trace_id (or case_id).
[RULE][OPS-APL-011] IF appeal.has_trace_reference = false THEN appeal_status = inadmissible.
[RULE][OPS-APL-012] IF appeal_status = admissible THEN outcome MUST be one of: uphold | modify | revoke AND decision MUST be logged.

---

## USAGE / RESOLUTION

[DECISION][OPS-USE-010] This baseline MUST be referenced by scenes involving: access control, queues, service delivery, incidents, evidence/logging, appeals.
[DECISION][OPS-USE-011] Any scene deviating from these defaults MUST include an explicit override reference (and localized constraints/cost).
[DECISION][OPS-USE-012] Priority order is defined by SPEC-PRIORITY-RESOLUTION-2215-0001; baseline MUST NOT override canon/scene.

---

## OUTPUT CONTRACT

~~~yaml
doc_id: BASELINE-DAILY-OPS-2215-0002
role_type: RULE
export:
  - rule_id: OPS-ACC-010
    intent: require BAN/ID for controlled access tiers
    inputs: [zone.access_tier]
    outputs: [ban_id_required]
  - rule_id: OPS-ACC-013
    intent: require procedural basis for T2+ access
    inputs: [zone.access_tier]
    outputs: [procedural_basis_required]
  - rule_id: OPS-QUE-010
    intent: enforce queue token for critical services
    inputs: [service_class]
    outputs: [queue_token_issued]
  - rule_id: OPS-LOG-011
    intent: seal evidence bundle for S2+ incidents
    inputs: [incident.severity]
    outputs: [evidence_bundle_sealed, chain_of_custody_required]
  - rule_id: OPS-INC-015
    intent: require procedural basis for S3 access freeze and notify OSA
    inputs: [incident.severity]
    outputs: [OSA_notification, procedural_basis_required]
  - rule_id: OPS-APL-010
    intent: appeals require trace reference
    inputs: [appeal]
    outputs: [admissibility_status]
~~~

---

## FORBIDDEN

[FORBIDDEN][OPS-FBD-010] Depicting perfect/omniscient observability as default baseline.
[FORBIDDEN][OPS-FBD-011] Introducing new global metrics (energy/climate/population/etc.) in baseline.
[FORBIDDEN][OPS-FBD-012] Treating access/queue exceptions as “normal” without explicit override.
[FORBIDDEN][OPS-FBD-013] Applying access_freeze / cross-operator restrictions without procedural_basis.
[FORBIDDEN][OPS-FBD-014] Using emotional justification as procedural basis (appeals must reference trace).

---

## NON-NORMATIVE

~~~markdown
Baseline encodes operational friction as a constant: queues, denials, partial visibility,
trace-based decisions, evidence sealing, and procedural escalation thresholds. Scenes must
show these through artifacts and actions, not commentary.
~~~

~~~
</file>

<file path="01-baselines/BASELINE-PHYSICAL-LEVEL-MID-2215-0001.md">
~~~markdown
---
id: BASELINE-PHYSICAL-LEVEL-MID-2215-0001
title: >
  Physical Environment Baseline — LEVEL-MID (2215)
class: baseline
status: fixed
version: 1.1.0
inputs: []
depends_on:
  - SSOT-SCENARIO-A-2215-0001
scope: >
  Исполняемый baseline физической среды и повседневных условий для сцен романа в 2215 году.
  Определяет значения по умолчанию (LEVEL-MID) и запрещённые состояния. Используется напрямую
  при написании сцен.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: enforce LEVEL-MID physical-environment defaults and forbid out-of-band physical states in scenes.
INPUTS: [scene.level, scene.environment_snapshot]
OUTPUTS: [resolved_level, resolved_defaults, forbidden_violations]
FORBIDDEN: [invent_physical_baseline_values, mix_levels_without_override, narrative_explanations_as_baseline]

## DEFINITIONS

[FACT][PHY-DEF-010] `access_level` ∈ {`LEVEL-LOW`, `LEVEL-MID`, `LEVEL-HIGH`}.
[FACT][PHY-DEF-011] `LEVEL-MID` = default physical-environment baseline for any scene without explicit level selection.
[FACT][PHY-DEF-012] `environment_snapshot` = набор полей сцены (2–5), выбираемых из сенсорных дефолтов документа.
[FACT][PHY-DEF-013] `override` = явное указание в сцене, выводящее параметр за пределы baseline диапазона.

## INVARIANTS

[DECISION][PHY-INV-010] All scenes MUST resolve `access_level` via this document unless a higher-precedence RULE forbids it.
[DECISION][PHY-INV-011] If a scene does not specify `access_level`, THEN `access_level = LEVEL-MID`.
[DECISION][PHY-INV-012] `LEVEL-LOW` and `LEVEL-HIGH` MUST be used ONLY IF explicitly specified in the scene.
[FORBIDDEN][PHY-INV-020] Scenes MUST NOT introduce assumptions, analytics, or source citations as baseline content.
[FORBIDDEN][PHY-INV-021] Scenes MUST NOT replace baseline constraints with CANON/SCENARIO reasoning.
[FORBIDDEN][PHY-INV-022] Scenes MUST NOT use emotional judgments where a measurable baseline parameter is defined.

## CONTENT

### 1) Access Levels

[RULE][PHY-ACL-010] IF `scene.access_level` is undefined THEN set `scene.access_level = LEVEL-MID`.
[RULE][PHY-ACL-011] IF `scene.access_level ∈ {LEVEL-LOW, LEVEL-HIGH}` THEN the scene MUST include an explicit level tag and an in-scene justification via procedure/event (not prose).

### 2) Housing (LEVEL-MID defaults)

[DECISION][PHY-HOU-010] LEVEL-MID.housing.type = multi_apartment_flat.
[DECISION][PHY-HOU-011] LEVEL-MID.housing.area = sufficient_for_1_to_few_people_without_excess_space.
[DECISION][PHY-HOU-012] LEVEL-MID.housing.climate_control = present_and_stable.
[DECISION][PHY-HOU-013] LEVEL-MID.housing.water_and_sewage = reliable_and_continuous.
[DECISION][PHY-HOU-014] LEVEL-MID.housing.lighting = energy_efficient_with_auto_control.
[DECISION][PHY-HOU-015] LEVEL-MID.housing.sound_isolation = sufficient_for_daily_comfort.
[DECISION][PHY-HOU-016] LEVEL-MID.housing.furnishing = baseline_furniture_and_built_in_systems_present.
[FORBIDDEN][PHY-HOU-020] LEVEL-MID MUST NOT include luxury_mansions_or_palaces.
[FORBIDDEN][PHY-HOU-021] LEVEL-MID MUST NOT include slums_or_emergency_housing.

### 3) Transport (LEVEL-MID defaults)

[DECISION][PHY-TRN-010] LEVEL-MID.transport.autonomy = autonomous_norm.
[DECISION][PHY-TRN-011] LEVEL-MID.transport.personal_vehicle = possible_but_not_required.
[DECISION][PHY-TRN-012] LEVEL-MID.transport.city_travel_time = predictable_and_relatively_low.
[DECISION][PHY-TRN-013] LEVEL-MID.transport.intercity = available_with_planning_required.
[FORBIDDEN][PHY-TRN-020] Manual_driving_as_mass_norm is forbidden in LEVEL-MID.
[FORBIDDEN][PHY-TRN-021] Complete_transport_isolation is forbidden in LEVEL-MID.

### 4) Workspaces & public spaces (LEVEL-MID defaults)

[DECISION][PHY-WPS-010] LEVEL-MID.workspaces = clean_functional_automated.
[DECISION][PHY-WPS-011] LEVEL-MID.work_mode = remote_or_hybrid.
[DECISION][PHY-WPS-012] LEVEL-MID.work_mode_prevalence = common.
[DECISION][PHY-WPS-013] LEVEL-MID.public_spaces = safe_and_serviced_by_automation.
[DECISION][PHY-WPS-014] LEVEL-MID.access_control = regulated_by_procedures_and_identification.
[FORBIDDEN][PHY-WPS-020] Dangerous_unmanaged_or_chaotic_work_conditions are forbidden in LEVEL-MID.
[FORBIDDEN][PHY-WPS-021] Excessively_elite_or_isolated_spaces are forbidden in LEVEL-MID.

### 5) Human body & health (LEVEL-MID defaults)

[DECISION][PHY-HLT-010] LEVEL-MID.human_body = biological_without_radical_modifications.
[DECISION][PHY-HLT-011] LEVEL-MID.healthcare_access = high_and_stable.
[DECISION][PHY-HLT-012] LEVEL-MID.chronic_conditions = manageable_and_controlled.
[DECISION][PHY-HLT-013] LEVEL-MID.therapeutic_implants = possible_not_required.
[FORBIDDEN][PHY-HLT-020] Mass_radical_cybernetic_modification is forbidden in LEVEL-MID.
[FORBIDDEN][PHY-HLT-021] Absence_of_medical_help is forbidden in LEVEL-MID.

### 6) Daily physical reality (LEVEL-MID defaults)

[DECISION][PHY-DLY-010] LEVEL-MID.environment = clean_and_functional.
[DECISION][PHY-DLY-011] LEVEL-MID.food = available_and_safe.
[DECISION][PHY-DLY-012] LEVEL-MID.power_supply = stable_and_continuous.
[DECISION][PHY-DLY-013] LEVEL-MID.household_automation = comfort_level_not_luxury.
[FORBIDDEN][PHY-DLY-020] Post_apocalyptic_conditions are forbidden in LEVEL-MID.
[FORBIDDEN][PHY-DLY-021] Utopian_excess_as_background is forbidden in LEVEL-MID.

### 7) Scene sensor snapshot defaults (LEVEL-MID)

[DECISION][PHY-SNS-010] `noise_indoor_db.range = [34, 46]` and `noise_indoor_db.p50 = 40`.
[DECISION][PHY-SNS-011] `noise_transit_db.range = [52, 70]` and `noise_transit_db.p50 = 61`.
[DECISION][PHY-SNS-012] `noise_exposed_db.range = [56, 74]` and `noise_exposed_db.p50 = 64`.
[FORBIDDEN][PHY-SNS-013] `noise_*_db > 85` is forbidden WITHOUT explicit `override`.

[DECISION][PHY-SNS-020] `humidity_indoor_pct.range = [30, 55]` and `humidity_indoor_pct.p50 = 42`.
[DECISION][PHY-SNS-021] `humidity_outdoor_pct.range = [45, 85]` and `humidity_outdoor_pct.p50 = 68`.
[DECISION][PHY-SNS-022] `wind_exposed_ms.range = [6, 16]` and `wind_exposed_ms.p50 = 11`.
[DECISION][PHY-SNS-023] `temperature_indoor_c.range = [19, 23]` and `temperature_indoor_c.p50 = 21`.
[FORBIDDEN][PHY-SNS-024] `temperature_indoor_c < 16` is forbidden WITHOUT explicit `override`.
[FORBIDDEN][PHY-SNS-025] `temperature_indoor_c > 27` is forbidden WITHOUT explicit `override`.

[DECISION][PHY-SNS-030] `light_ct_k.range = [3800, 4300]` and `light_ct_k.p50 = 4100` for service_and_transit_zones.
[DECISION][PHY-SNS-031] `visibility_outdoor_m.range = [400, 2000]` and `visibility_outdoor_m.p50 = 1200` under normal_conditions.
[FORBIDDEN][PHY-SNS-032] `visibility_outdoor_m < 100` is forbidden WITHOUT explicit `override`.

[DECISION][PHY-SNS-040] `latency_ms.range = [60, 180]` and `latency_ms.p50 = 110` for civil_loops.
[DECISION][PHY-SNS-041] `packet_loss_pct.range = [0.0, 1.5]` and `packet_loss_pct.p50 = 0.3`.
[FORBIDDEN][PHY-SNS-042] `packet_loss_pct > 5.0` is forbidden WITHOUT explicit `override`.

[DECISION][PHY-SNS-050] `traffic_flow.range = [0.45, 0.80]` and `traffic_flow.p50 = 0.62` with domain `0..1` where `1 = high_friction`.
[FORBIDDEN][PHY-SNS-051] `traffic_flow > 0.92` is forbidden WITHOUT explicit `override`.

[DECISION][PHY-SNS-060] `background_noise_tag` MAY be used as a neutral label with length ≤ 3 words.
[FORBIDDEN][PHY-SNS-061] `background_noise_tag` MUST NOT be emotional (examples: oppressive, terrifying, depressing).

### 8) Global forbidden defaults

[FORBIDDEN][PHY-FBD-010] Magic_or_unexplained_physical_effects are forbidden as background.
[FORBIDDEN][PHY-FBD-011] Violation_of_known_physics is forbidden WITHOUT explicit canonical basis.
[FORBIDDEN][PHY-FBD-012] Total_posthuman_transhumanism is forbidden as default background.
[FORBIDDEN][PHY-FBD-013] Total_physical_environment_degradation is forbidden as default background.

### 9) Scene micro-checklist (mechanical)

[RULE][PHY-CHK-010] IF `scene.access_level != LEVEL-MID` THEN the scene MUST declare the level explicitly.
[RULE][PHY-CHK-011] IF `scene.access_level` is set THEN housing/transport/body/workspaces MUST conform to that level’s allowed set.
[RULE][PHY-CHK-012] Any out-of-range sensor value MUST be marked as `override` and treated as an event/condition, not background.
[RULE][PHY-CHK-013] The scene MUST be reproducible: physical details MUST NOT contradict baseline constraints.

## USAGE / RESOLUTION

[DECISION][PHY-USE-010] Resolution target: produce `resolved_level` and a set of `resolved_defaults` for the scene.
[DECISION][PHY-USE-011] A scene MAY select 2–5 fields from `environment_snapshot` and use them directly.
[DECISION][PHY-USE-012] Any `override` MUST be explicit and local: it changes only the referenced parameter(s), not the entire level.
[DECISION][PHY-USE-013] If a scene needs luxury/utopia or slums/collapse, THEN it MUST switch to `LEVEL-HIGH` or `LEVEL-LOW` respectively, not “bend” LEVEL-MID.

## OUTPUT CONTRACT

~~~yaml
doc_id: BASELINE-PHYSICAL-LEVEL-MID-2215-0001
role_type: RULE
export:
  - rule_id: PHY-ACL-010
    intent: default access_level to LEVEL-MID when unspecified
    inputs: [scene.access_level]
    outputs: [scene.access_level]
  - rule_id: PHY-SNS-013
    intent: forbid noise_*_db above 85 unless explicit override
    inputs: [scene.environment_snapshot.noise_*_db, scene.override]
    outputs: [forbidden_violations]
  - rule_id: PHY-CHK-012
    intent: out-of-range sensor values require explicit override and become events
    inputs: [scene.environment_snapshot.*, scene.override]
    outputs: [forbidden_violations, resolved_defaults]
~~~

## FORBIDDEN

[FORBIDDEN][PHY-FRB-010] Introducing new baseline physical ranges without updating this baseline document.
[FORBIDDEN][PHY-FRB-011] Mixing LEVEL-MID defaults with LEVEL-LOW/LEVEL-HIGH states without explicit scene level selection.
[FORBIDDEN][PHY-FRB-012] Using emotional evaluation in place of baseline-measurable parameters when such parameters are present.
[FORBIDDEN][PHY-FRB-013] Treating out-of-range sensor values as “background” without explicit override.

## NON-NORMATIVE

~~~markdown
Example environment_snapshot (LEVEL-MID, valid):
- noise_indoor_db: 41
- humidity_indoor_pct: 38
- temperature_indoor_c: 21
- latency_ms: 120
- background_noise_tag: vent_hum
~~~

~~~
</file>

<file path="01-baselines/BASELINE-PSYCH-2215-0001.md">
~~~markdown
---
id: BASELINE-PSYCH-2215-0001
title: >
  Psychological Baseline — 2215 (Density, Transactionalism, Worldview)
class: baseline
status: fixed
version: 1.3.0
inputs:
  - BASELINE-SOCIAL-CIVIC-2215-0001
  - SSOT-URBANISM-A-2215-0007
depends_on:
  - CANON-BASE-0001
scope: >
  Психологический портрет и базовое мировоззрение жителя LEVEL-MID.
  Включает отношение к труду, власти, технологиям и среде.
---

## LLM-INTENT

ROLE_TYPE: STATE
SCOPE: define default psychological traits and attitudes.
INPUTS: [BASELINE-SOCIAL-CIVIC-2215-0001, SSOT-URBANISM-A-2215-0007]
OUTPUTS: [behavioral_norms, world_attitudes, neuroses]
FORBIDDEN: [sterile_utopia, robotic_emotionlessness, romantic_nature_worship]

## DEFINITIONS

[FACT][PSY-DEF-010] **Density Fatigue** = хроническая усталость от постоянного присутствия людей.
[FACT][PSY-DEF-011] **Transactionalism** = привычка оценивать действия через "затраты/выгода".
[FACT][PSY-DEF-012] **Algorithmic Fatalism** = вера в то, что Система всегда выигрывает математически.

## INVARIANTS

[DECISION][PSY-INV-010] Citizens are "Armor-Clad": headphones/glasses create a personal bubble.
[DECISION][PSY-INV-011] Silence is the ultimate luxury; Noise is the default state.
[DECISION][PSY-INV-012] Nostalgia is directed at the "Pre-Algorithm Era" (messy but free).

## CONTENT

### 1. Public Behavior (The Commuter Shell)

[STATE][PSY-BEH-010] public_mask = "Thousand-Yard Stare" (looking through people).
[STATE][PSY-BEH-011] conflict_response = "Ignore/Evade" (confrontation is too expensive).
[STATE][PSY-BEH-012] personal_space = "Compressible" (tolerate crowding, expand when able).
[STATE][PSY-BEH-013] politeness = "Efficient" (nodding, moving fast, not blocking flow).

### 2. Resource Neurosis (The Accountant Within)

[STATE][PSY-ECO-020] dominant_stress = "Unplanned Debt" (accidentally breaking infrastructure).
[STATE][PSY-ECO-021] reflex = "Check Balance" before any transaction.
[STATE][PSY-ECO-022] waste_reaction = Visceral irritation (wasting water feels like bleeding).

### 3. Intimacy & Trust

[STATE][PSY-SOC-030] trust_circle = "The Unit" (Family/Roommates vs The World).
[STATE][PSY-SOC-031] physical_touch = High within Unit, Zero outside.
[STATE][PSY-SOC-032] strangers = "Obstacles" or "Data Points".

### 4. Specific Pathologies

[STATE][PSY-PATH-040] syndrome="Box Claustrophobia" (panic when ventilation stops).
[STATE][PSY-PATH-041] syndrome="Algorithmic Paranoia" (believing bad luck is a 'shadow ban').
[STATE][PSY-PATH-042] syndrome="Touch Aggression" (snapping when bumped too often).

### 5. Coping Mechanisms

[STATE][PSY-COPE-050] mech_sensory = "Active Noise Cancellation" (mandatory wear).
[STATE][PSY-COPE-051] mech_chemical = "Stims/Sedatives" (functional use for shifts).
[STATE][PSY-COPE-052] mech_control = "Micro-customization of personal corner".

### 6. Core Attitudes (Worldview)

#### Work & Corporations
[STATE][PSY-ATT-060] work_view = "License to Exist". Job is not a career, it's debt service.
[STATE][PSY-ATT-061] corp_trust = "Zero". Corps are predators, but necessary providers.
[STATE][PSY-ATT-062] automation_fear = "High". Every update might optimize your role away.

#### The State & Governance
[STATE][PSY-ATT-070] state_view = "The Wall". It protects from the Outside, but it is cold and hard.
[STATE][PSY-ATT-071] justice_view = "Arithmetic". You don't ask for mercy, you ask for a recount.
[STATE][PSY-ATT-072] politics = "Irrelevant". Algorithms decide, humans just sign.

#### City & Nature
[STATE][PSY-ATT-080] city_view = "Life Support Suit". Outside is death/chaos; City is survival.
[STATE][PSY-ATT-081] nature_view = "Abstract Luxury". Real wood/grass is for the rich.
[STATE][PSY-ATT-082] weather_view = "System Failure". Rain/Snow means the dome/drainage is struggling.

#### Technology & Art
[STATE][PSY-ATT-090] tech_view = "Invisible Utility". Not magic, just plumbing. Only noticed when broken.
[STATE][PSY-ATT-091] progress_view = "Skeptical". 'New' usually means 'More Efficient for Them, Harder for Me'.
[STATE][PSY-ATT-092] art_view = "The Human Signal". Valued because it's inefficient/messy (e.g., analog music).

## USAGE / RESOLUTION

[DECISION][PSY-USE-010] Characters are cynical but functional survivors.
[DECISION][PSY-USE-011] "Hope" is usually about stability, not revolution.

## OUTPUT CONTRACT

~~~yaml
doc_id: BASELINE-PSYCH-2215-0001
role_type: STATE
export:
  - metric: worldview.work
    owner_domain: PSYCH
    values:
      core: License to Exist
~~~

## FORBIDDEN

[FORBIDDEN][PSY-FBD-010] Romanticizing nature as something "cute" (it's dangerous/expensive).
[FORBIDDEN][PSY-FBD-011] Characters trusting corporations blindly.
[FORBIDDEN][PSY-FBD-012] Viewing technology with wonder (it's mundane).
~~~
</file>

<file path="01-baselines/BASELINE-SOCIAL-CIVIC-2215-0001.md">
~~~markdown
---
id: BASELINE-SOCIAL-CIVIC-2215-0001
title: >
  Civic & Social Baseline — 2215 (Bodies, Rights, Bio-Ethics)
class: baseline
status: fixed
version: 1.1.0
inputs:
  - SSOT-SCENARIO-A-2215-0001
  - SSOT-LIFE-A-2215-0007
depends_on:
  - CANON-BASE-0001
scope: >
  Исполняемый baseline гражданских, социальных и биоэтических норм
  повседневной жизни (LEVEL-MID) в 2215 году.
  Регулирует тело, сетевую связность, био-безопасность и репродукцию.
  Закрывает UNK-2215-0001, 0002, 0006, 0007, 0008.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: define enforceable civic, social, and bio-ethical defaults for citizens (LEVEL-MID).
INPUTS: [SSOT-SCENARIO-A-2215-0001, SSOT-LIFE-A-2215-0007, CANON-BASE-0001]
OUTPUTS: [social_norms, prohibitions, civic_constraints]
FORBIDDEN: [moral_judgements, prose, cultural exposition, speculative ethics]

## DEFINITIONS

[FACT][SOC-DEF-010] LEVEL-MID = стандартные городские условия проживания без специальных лицензий.
[FACT][SOC-DEF-011] BAN/ID = биометрически связанная гражданская идентификация и сетевой профиль (Body Area Network).
[FACT][SOC-DEF-012] bio-recycling = обязательный цикл утилизации человеческого тела после смерти.
[FACT][SOC-DEF-013] licensed_private_zone = частное пространство с разрешённым снижением телеметрии.

## INVARIANTS

[DECISION][SOC-INV-010] Данный документ является исполняемым baseline для сцен и протоколов.
[DECISION][SOC-INV-011] Все пункты применимы по умолчанию для LEVEL-MID.
[DECISION][SOC-INV-012] Отклонения допускаются только через explicit override или иной LEVEL.
[FORBIDDEN][SOC-INV-013] Использование до-2215 культурных норм без фиксации override.

## CONTENT

### 1. Protocols of Death (Bio-Recycling)

[RULE][SOC-BIO-010] IF person.status = dead THEN death_disposal_method MUST be aquamation_only (resomation).
[FORBIDDEN][SOC-BIO-011] burial, cremation (combustion) are prohibited.

[FACT][SOC-BIO-012] aquamation_process = alkaline_hydrolysis → water_recovery → calcium_material_reuse.

[FACT][SOC-BIO-013] funeral_rituals = none.
[FACT][SOC-BIO-014] memory_farewell = digital_snapshot_only.

[RULE][SOC-BIO-015] body_status MUST be treated as "leased_from_biosphere" and "must_be_returned".

### 2. Connectivity Rights (Offline Status)

[RULE][SOC-NET-010] IF zone = public_mid AND user.status = offline THEN legal_status = suspect.
[FACT][SOC-NET-011] offline_allowed_zones = licensed_private_zone | faraday_hotel (paid).

[RULE][SOC-NET-012] IF user.action = telemetry_jamming THEN crime = criminal_offense (3–5y correction).

[RULE][SOC-NET-013] ban_id_required MUST be true in all public and work zones.

### 3. Bio-Safety & Pets

[RULE][SOC-PET-010] IF citizen owns live_pet THEN require bio_luxury_license.
[FACT][SOC-PET-011] bio_luxury_license = carbon_offset + sanitary_compliance + owner_liability.

[FACT][SOC-PET-012] pet_distribution = ~90% robotic_pets; biological_pets minority.

[RULE][SOC-PET-013] IF animal.status = stray THEN action = automated_sanitary_elimination (time < 20m).

### 4. Controlled Substances (Nicotine / Stimulants)

[FORBIDDEN][SOC-SUB-010] combustion = prohibited (treated_as_fire_event).

[RULE][SOC-SUB-011] IF substance = nicotine THEN form_factor MUST be medical_inhaler_only AND cartridge_id_bound.

[FACT][SOC-SUB-012] stimulant_form_factor = clinical_inhaler; no_smell; no_vapor.

[FORBIDDEN][SOC-SUB-013] recreational_smoking_culture.

### 5. Intimacy & Demography

[RULE][SOC-DEM-010] IF action = parenting THEN require algorithmic_license.

[FACT][SOC-DEM-011] license_inputs = financial_capacity + housing_class + genetic_screening.

[RULE][SOC-DEM-012] IF pregnancy = unauthorized THEN penalty = fine | mandatory_therapy | parental_rights_revocation.

[FACT][SOC-DEM-013] intimacy_allowed = yes.
[RULE][SOC-DEM-014] biofluid_exchange MUST be monitored_via_BAN for viral markers.
[FACT][SOC-DEM-015] risk_notification = automatic (informational).

## USAGE / RESOLUTION

[DECISION][SOC-USE-010] This baseline MUST be referenced by all scenes involving: death, pets, substances, connectivity, intimacy, reproduction.
[DECISION][SOC-USE-011] Any scene violating these defaults MUST include an explicit override reference.

## OUTPUT CONTRACT

~~~yaml
doc_id: BASELINE-SOCIAL-CIVIC-2215-0001
role_type: RULE
export:
  - rule_id: SOC-BIO-010
    intent: enforce bio-recycling
    inputs: [person.status]
    outputs: [disposal_method]
  - rule_id: SOC-NET-010
    intent: restrict offline status
    inputs: [zone, user.status]
    outputs: [legal_status]
  - rule_id: SOC-PET-010
    intent: restrict biological pets
    inputs: [ownership]
    outputs: [license_requirement]
~~~

## FORBIDDEN

[FORBIDDEN][SOC-FBD-010] Romanticizing death, pets, reproduction, or disconnection.
[FORBIDDEN][SOC-FBD-011] Depicting offline public life as neutral or normal.
[FORBIDDEN][SOC-FBD-012] Treating bio-ethics as personal choice at LEVEL-MID.

## NON-NORMATIVE

~~~markdown
This document encodes social pressure and control as environmental constants,
not as moral commentary. Any emotional impact must emerge from scenes, not here.
~~~
~~~
</file>

<file path="03-canon/CANON-2215-CORE-0001.md">
~~~markdown
---
id: CANON-2215-CORE-0001
title: >
  Canon 2215 Core Bindings — Scenario A (World Background Lock)
class: canon
status: fixed
version: 1.2.0
inputs: []
depends_on:
  - SSOT-DOC-STYLE-2215-0001
  - SSOT-CONSISTENCY-A-2215-0009
  - SSOT-SCENARIO-A-2215-0001
  - SSOT-ENERGY-A-2215-0004
  - SSOT-ECONOMY-A-2215-0003
  - SSOT-AUTOMATION-A-2215-0004
  - SSOT-DEMOGRAPHY-A-2215-0002
  - SSOT-CLIMATE-A-2215-0004
  - SSOT-GOVERNANCE-SECURITY-A-2215-0005
  - SSOT-URBANISM-A-2215-0007
  - SSOT-LIFE-A-2215-0007
  - SSOT-SPACE-INDUSTRY-A-2215-0006
scope: >
  Единственная точка выбора значений “фона романа” для мира 2215 (Scenario A).
  Закрывает DUAL_ALLOWED/UNKNOWN из SSOT-CONSISTENCY и фиксирует core-набор
  как канонический дефолт для baseline/canon/plan/scene.
  Документ НЕ объясняет причинность и НЕ описывает мир сверх привязок.
---

## LLM-INTENT

ROLE_TYPE: BIND
SCOPE: bind SSOT values into single canonical background defaults for downstream
INPUTS:
  - SSOT-CONSISTENCY-A-2215-0009
  - SSOT-*
OUTPUTS:
  - bindings
  - override_required_registry
  - location_locks
FORBIDDEN:
  - causal_logic
  - worldbuilding_prose
  - invent_metrics
  - implicit_selection
  - range_as_background

---

## DEFINITIONS

[DECISION][CORE-DEF-001] `selected_value` MUST be one of: `core | p90 | override`.
[DECISION][CORE-DEF-002] `scope` MUST be one of: `canon | override`.
[DECISION][CORE-DEF-003] This document binds defaults with `scope: canon`.
[DECISION][CORE-DEF-004] Any use of `p90` or `range` in narrative background REQUIRES `class: override`.
[DECISION][CORE-DEF-005] `selected_value: override` (scope: canon) means:
downstream default is FORBIDDEN and requires a dedicated `class: override` doc
to specify localized value and cost.

---

## INVARIANTS

[DECISION][CORE-INV-001] Downstream default MUST use only bindings from this document (scope: canon).
[DECISION][CORE-INV-002] Default bindings MUST select `selected_value: core` for all bound metrics with defined SSOT `core`.
[DECISION][CORE-INV-003] Any upper-tail (`selected_value: p90`) is allowed ONLY in `scope: override` documents.
[DECISION][CORE-INV-004] Metrics with missing/undefined SSOT `core` MUST be closed as `selected_value: override` (scope: canon).
[DECISION][CORE-INV-007] Any metric listed in `override_required_registry`
MUST NOT be used by baseline/canon/plan/scene without an explicit `class: override` document.
[FORBIDDEN][CORE-INV-005] Binding a `range` as narrative default (range_as_background).
[FORBIDDEN][CORE-INV-006] Implicit selection from SSOT (implicit_selection).

---

## CONTENT

(⚠️ CONTENT section unchanged — BIND blocks preserved as-is)

---

## LOCATION LOCKS

[DECISION][CORE-LOC-001] location = RU-16/CHELNY.
[DECISION][CORE-LOC-002] upper_tail_background_forbidden = true.

---

## USAGE / RESOLUTION

[DECISION][CORE-USE-001] Downstream (baseline/canon/plan/scene) MUST treat this doc as the only default binder.
[DECISION][CORE-USE-002] Any use of p90/upper-tail MUST be done ONLY via `class: override`.
[DECISION][CORE-USE-003] Any use of SSOT `range` in narrative MUST be done ONLY via `class: override` with explicit localization and cost.
[DECISION][CORE-USE-006] Any metric closed as `selected_value: override`
MUST be blocked as background default and validated against `override_required_registry`.
[FORBIDDEN][CORE-USE-004] Using SSOT directly as background without an explicit binding here.
[FORBIDDEN][CORE-USE-005] Implicit “fallback to SSOT range” when value is not bound.

---

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-2215-CORE-0001
role_type: BIND
scenario: A
year: 2215

export:
  bindings:
    - metric: population_billion
      selected_value: core
      scope: canon
      justification: CORE-INV-001
    - metric: life_expectancy_years
      selected_value: core
      scope: canon
      justification: CORE-INV-001
    # (bindings list unchanged, сокращено для читаемости)

  override_required_registry:
    - metric: total_fertility_rate
      reason: missing_ssot_core
      requires: class_override
    - metric: services_share_gdp_percent
      reason: missing_ssot_core
      requires: class_override
    - metric: trade_to_gdp_percent
      reason: missing_ssot_core
      requires: class_override
    - metric: robots_per_human
      reason: missing_ssot_core
      requires: class_override

  location_locks:
    - location: RU-16/CHELNY
      upper_tail_background_forbidden: true
~~~

---

## FORBIDDEN

[FORBIDDEN][CORE-FBD-001] Using p90/upper-tail as default background without `class: override`.
[FORBIDDEN][CORE-FBD-002] Using SSOT `range` as default background without `class: override`.
[FORBIDDEN][CORE-FBD-003] Implicit selection of SSOT values not explicitly bound here.
[FORBIDDEN][CORE-FBD-004] Introducing new metrics not declared in SSOT.
[FORBIDDEN][CORE-FBD-006] Using any `selected_value: override` metric as background default without an explicit override doc.

---

## NON-NORMATIVE

(Empty by design)

~~~
</file>

<file path="03-canon/CANON-ARTIFACT-SNIPPETS-0001.md">
~~~markdown
---
id: CANON-ARTIFACT-SNIPPETS-0001
title: >
  OSA Artifacts — Snippet Templates and Procedural Forms (2215)
class: canon
status: fixed
version: 1.1.0
inputs:
  - CANON-BASE-0001
  - CANON-VOCAB-0001
  - CANON-SYSTEM-VOICE-0001
depends_on: []
scope: >
  Canonical procedural specification of OSA artifact snippets (CD/EL/CM,
  orders, logs, access receipts). Purpose: constrain LLM output to fixed,
  auditable forms; prohibit narrative drift; guarantee evidence usability.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: define mandatory forms and constraints for OSA artifact snippets used in scenes
INPUTS: [CANON-SYSTEM-VOICE-0001, CANON-VOCAB-0001]
OUTPUTS: [artifact_schema_id, admissibility_constraints]
FORBIDDEN: [narrative_text, freeform_documents, persona_voice]

## DEFINITIONS

[FACT][ART-DEF-001] Artifact = procedural record produced or consumed by OSA during a case.
[FACT][ART-DEF-002] Snippet = partial artifact excerpt embedded in narrative text.
[FACT][ART-DEF-003] EL item = Evidence Ledger record with chain-of-custody.
[FACT][ART-DEF-004] Case scope = explicit perimeter (zone/node/mode) bound to an artifact.

## INVARIANTS

[DECISION][ART-INV-001] Every snippet MUST be procedural and machine-verifiable.
[DECISION][ART-INV-002] Every snippet MUST bind to case_id and scope.
[DECISION][ART-INV-003] Any artifact used as evidence MUST be an EL item.
[DECISION][ART-INV-004] Snippets are excerpts ONLY; full documents are forbidden in prose.

## CONTENT

[RULE][ART-R-001] IF artifact appears in text THEN it MUST conform to one canonical schema.
[RULE][ART-R-002] IF artifact claims evidentiary value THEN evidence_id and custody are REQUIRED.
[RULE][ART-R-003] IF artifact implies enforcement THEN order_id or mandate_ref is REQUIRED.
[RULE][ART-R-004] IF artifact references system events THEN it MUST align with CANON-SYSTEM-VOICE enums.
[FORBIDDEN][ART-F-001] Narrative language inside artifacts.
[FORBIDDEN][ART-F-002] Human emotions, motives, or moral language in artifacts.
[FORBIDDEN][ART-F-003] Bureaucratic filler without operational fields.

## USAGE / RESOLUTION

[DECISION][ART-U-001] Authors select schema → populate minimal fields → embed as snippet.
[DECISION][ART-U-002] Procedural validity has priority over readability.
[DECISION][ART-U-003] Any deviation invalidates the artifact for evidentiary use.

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-ARTIFACT-SNIPPETS-0001
role_type: RULE
export:
  - rule_id: ART-R-001
    intent: enforce canonical artifact schemas
    inputs: [snippet]
    outputs: [schema_valid]
~~~

## FORBIDDEN

[FORBIDDEN][ART-F-010] Introducing new artifact types without CANON override.
[FORBIDDEN][ART-F-011] Mixing artifact content with narrative exposition.
[FORBIDDEN][ART-F-012] Using examples as normative rules.

## NON-NORMATIVE

### EL item — minimal evidence record

~~~json
{
  "case_id": "OSA-2215-RU-16-0007",
  "evidence_id": "E-002",
  "type": "log_extract",
  "source": "OBSERVABILITY",
  "scope": "RU-16/CHELNY/Node-HOSP-3/Telemetry",
  "ts_collected": "2215-05-18T21:05:00+03:00",
  "collector": "OSA/Lev-Safonov",
  "hash": "sha256:...",
  "custody": {
    "sealed": true,
    "seal_id": "SEAL-2215-000118",
    "custody_chain": [
      { "ts": "2215-05-18T21:06:00+03:00", "holder": "OSA", "action": "sealed" }
    ]
  },
  "notes": "Primary logs missing within retention window."
}
~~~

### Chain-of-custody event

~~~json
{
  "case_id": "OSA-2215-RU-16-0007",
  "event": "custody_transfer",
  "ts": "2215-05-19T10:52:00+03:00",
  "evidence_id": "E-001",
  "from": "Z4/Regime-Holder/Escort-Unit",
  "to": "OSA/Aidar-Bulatov",
  "conditions": ["no_export_without_seal", "escorted_access"],
  "seal_verified": true
}
~~~

### Chat log extract

~~~json
{
  "case_id": "OSA-2215-RU-16-0007",
  "artifact": "chat_log_extract",
  "scope": "Operator/Dispatch/Queue-7",
  "window": { "start": "2215-05-18T17:10:00+03:00", "end": "2215-05-18T17:28:00+03:00" },
  "messages": [
    { "ts": "2215-05-18T17:11:03+03:00", "from": "dispatch.bot", "type": "system", "text": "Window updated. service_class=C." },
    { "ts": "2215-05-18T17:12:19+03:00", "from": "tech.unit.14", "type": "field", "text": "Access token rejected at Node-HOSP-3." }
  ]
}
~~~

### Suspension order snippet

~~~json
{
  "order_id": "O-11-SUSP-2215-0009",
  "case_id": "OSA-2215-RU-16-0007",
  "ts_issued": "2215-05-21T08:30:00+03:00",
  "issuer": "OSA/Leisan-Khakimova",
  "scope": "Z4/RU-16/Node-Zone-X/Mode-Accelerated",
  "action": "suspend_mode_partial",
  "duration_hours": 72,
  "basis": ["admissibility_risk", "observability_gap"],
  "statement": "Mode partially suspended. Audit initiated."
}
~~~

~~~
</file>

<file path="03-canon/CANON-BASE-0001.md">
~~~markdown
---
id: CANON-BASE-0001
title: >
  Canon Base — Narrative and Institutional Constraints (2215)
class: canon
status: fixed
version: 2.0.0
inputs: []
depends_on:
  - CANON-2215-CORE-0001
  - SSOT-CONSISTENCY-A-2215-0009
scope: >
  Базовый канон романа: институциональные, нарративные и антропологические
  ограничения. Документ НЕ выбирает параметры мира (это делает CANON-2215-CORE),
  а задаёт допустимые формы интерпретации, конфликта и причинности.
---

## LLM-INTENT

ROLE_TYPE: CANON_RULESET
SCOPE: narrative, institutional, and procedural constraints
INHERITS_WORLD_STATE_FROM: CANON-2215-CORE-0001
FORBIDDEN: [world_parameter_binding, p90_selection, baseline_definition]

---

## INVARIANTS (Canon-wide)

- [CANON][BASE-000] Роман обязан быть SSOT-consistent.
- [CANON][BASE-001] CANON-2215-CORE является единственным источником фоновых параметров мира.
- [CANON][BASE-002] SSOT используется только как источник допустимых диапазонов и структур.
- [CANON][BASE-003] Upper-tail / p90 значения запрещены как фон без explicit override.

---

## 1. Causality and Knowledge Discipline

### 1.1 Causality Markup

- [RULE][BASE-010] Все системные утверждения маркируются как:
  FACT / ASSUMPTION / PROJECTION / UNKNOWN.
- [RULE][BASE-011] Любая системная связка оформляется как:
  CAUSE → MECHANISM → CONSEQUENCE.
- [FORBIDDEN][BASE-012] Лекционные объяснения причинности в тексте сцен.

### 1.2 Scene Knowledge Rule

- [RULE][BASE-020] В сценах причинность проявляется через:
  артефакты, процедуры, измеримые параметры и ограничения.
- [FORBIDDEN][BASE-021] Использование SSOT напрямую для генерации сцен.

---

## 2. Generation Priority (Override Chain)

- [RULE][BASE-030] Приоритет интерпретации строго следующий:

  Override > Scene > Plan > Canon > Baseline > SSOT

- [RULE][BASE-031] Scene может вводить локальные художественные допущения,
  если они:
  - не нарушают CANON и Baseline,
  - не противоречат explicit Override.

- [RULE][BASE-032] Plan имеет приоритет над Canon по факту сюжетного перелома,
  но Canon ограничивает способы его реализации.

---

## 3. Temporal and Spatial Frame (Narrative State)

### 3.1 Time

- [STATE][BASE-040] narrative_time_anchor = "circa_2215"
- [STATE][BASE-041] flashback_window_years = [2190, 2215]
- [RULE][BASE-042] Flashback не изменяет глобальный baseline.

### 3.2 Geography and Scale

- [STATE][BASE-050] primary_location = "RU-16/Naberezhnye_Chelny"
- [STATE][BASE-051] narrative_scale = "base_plus_operations"
- [STATE][BASE-052] secondary_locations = [
    "major_RF_urban_nodes",
    "selected_extraterritorial_zones"
  ]

---

## 4. Everyday Reality Interpretation (Narrative Constraint)

- [RULE][BASE-060] Быт по умолчанию трактуется как комфортный и устойчивый.
- [RULE][BASE-061] Дефицит относится к:
  infrastructure_decisions,
  allocation_windows,
  service_classes,
  access_rights,
  observability.
- [FORBIDDEN][BASE-062] Интерпретация конфликта как борьбы за базовое выживание.

---

## 5. Institutions and Power (Canon Interpretation)

### 5.1 Sovereignty

- [STATE][BASE-070] states_retain_sovereignty = true
- [STATE][BASE-071] supranational_force_mandate_exists = false

- [RULE][BASE-072] Надгосударственные режимы действуют через:
  standards, audits, reputation, market_pressure.

---

### 5.2 Corporations and Operators

- [STATE][BASE-080] infrastructure_operators_are_systemic = true
- [STATE][BASE-081] operators_status_is_derivative_of_state = true

- [RULE][BASE-082] Корпоративное влияние реализуется через:
  law, arbitration, contracts, access_regimes, compliance.

- [FORBIDDEN][BASE-083] Прямое корпоративное военное/полицейское превосходство.

---

### 5.3 Extraterritorial Regimes

- [STATE][BASE-090] extraterritorial_regimes_exist = true
- [RULE][BASE-091] Экстерритория является:
  licensed,
  bounded,
  auditable,
  revocable.

- [STATE][BASE-092] osa_role = "sovereignty_needle"
- [RULE][BASE-093] ОСА применяется при угрозе базовым государственным функциям.

---

## 6. Technology and Human Limits

### 6.1 Transhumanism Boundary

- [STATE][BASE-100] transhumanism_mode = "moderate"
- [STATE][BASE-101] allowed_augmentations = [
    "neuro_interfaces",
    "medical_implants",
    "therapeutic_cybernetics",
    "life_extension"
  ]

- [FORBIDDEN][BASE-102] Врожденные сверхспособности и бытовая боевая кибернетика.

### 6.2 Action Constraint

- [RULE][BASE-110] Физическое превосходство достигается через:
  equipment, energy, procedure, access_window.

---

## 7. Protagonist Organization (Narrative Structure)

- [STATE][BASE-120] protagonist_org = "OSA"
- [STATE][BASE-121] org_type = "federal_interagency_unit"

- [RULE][BASE-122] Давление на ОСА допускается только в процедурной форме:
  budget_limits,
  audits,
  compliance_checks,
  arbitration,
  interagency_blocks.

- [FORBIDDEN][BASE-123] Персональные звонки и прямые региональные приказы.

---

## 8. Energy and Economy Interpretation

- [RULE][BASE-130] Высокий GDP не равен локальному изобилию.
- [RULE][BASE-131] Дефицит трактуется как allocation_under_constraints.
- [FORBIDDEN][BASE-132] Объяснение локальных проблем формулой
  "энергию забрал ИИ".

---

## 9. UNKNOWN Handling (Narrative-Relevant)

- [RULE][BASE-140] В роман допускаются только UNKNOWN, которые:
  create_stakes,
  affect_jurisdiction,
  manifest_as_anomaly.

- [STATE][BASE-141] baseline_unknowns_exist = true

---

## 10. NARRATIVE PACING (THE "BATOU MOMENT" RULE)

[RULE][NAR-PACE-010] Principle of "Human Grounding".
[RULE][NAR-PACE-011] REQUIREMENT: Every 4-5 functional/action scenes MUST be punctuated by a "Non-Plot Beat".
[RULE][NAR-PACE-012] CONTENT: These beats MUST focus on biological needs or silent interaction with the environment.
  - Examples: Feeding a pet, struggling with a food wrapper, shaving, staring at the clouds, fixing a boot lace.
[RULE][NAR-PACE-013] FUNCTION: These moments validate the character's existence outside their job function.
[FORBIDDEN][NAR-PACE-014] Using these moments for exposition or plot advancement. They must be pure "existence".

---

## 11. Guardrails (Negative Constraints)

- [FORBIDDEN][BASE-150] World government.
- [FORBIDDEN][BASE-151] Noir clichés by default.
- [FORBIDDEN][BASE-152] Technobabble without corpus grounding.
- [FORBIDDEN][BASE-153] Total omniscient surveillance.
- [FORBIDDEN][BASE-154] Villain monologues.

---

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-BASE-0001
role_type: CANON_RULESET
inherits_from: CANON-2215-CORE-0001

export:
  - key: narrative_time_anchor
    value: circa_2215

  - key: primary_location
    value: RU-16/Naberezhnye_Chelny

  - key: transhumanism_mode
    value: moderate

  - key: deficit_interpretation
    value: allocation_under_constraints

  - key: protagonist_org
    value: OSA
~~~

---

## NON-NORMATIVE

(Empty by design)

~~~
</file>

<file path="03-canon/CANON-CAST-0001.md">
~~~markdown
---
id: CANON-CAST-0001
title: >
  Core Team (ОСА) — Character System Specification (LLM-executable)
class: canon
status: fixed
version: 0.3.0
inputs: [WORLD-DOC-2]
depends_on:
  - SSOT-DOC-STYLE-2215-0001
  - CANON-BASE-0001
  - CANON-CONFLICT-0001
  - CANON-SYSTEMS-0001
  - STORY-SKELETON-0001
  - SPEC-PRIORITY-RESOLUTION-2215-0001
scope: >
  Процедурный канон персонажей ОСА как системы ролей: топология команды,
  требования к роли (leverage/cannot/optics/scene_type), правила использования
  в сценах и запреты. Без SSOT-метрик и без сюжетного планирования.
---

## LLM-INTENT

ROLE_TYPE: INTERFACE
SCOPE: define cast registry and enforceable role-usage constraints for OSA scenes
INPUTS:
  - CANON-SYSTEMS-0001
  - STORY-SKELETON-0001
OUTPUTS:
  - cast_registry
  - role_constraints
  - scene_usage_rules
  - forbidden_patterns
FORBIDDEN:
  - invent_new_roles
  - merge_roles
  - superheroism
  - essay_mode
  - implicit_precedence
  - causal_chains_as_canon

---

## DEFINITIONS

[FACT][CAST-DEF-010] role = functional interface in the system, not a hero archetype.
[FACT][CAST-DEF-011] leverage = procedural instrument enabling influence (order/access/time/space/metrics).
[FACT][CAST-DEF-012] cannot = hard limitation (legal, physical, informational, organizational).
[FACT][CAST-DEF-013] optics = professional perception filter used to interpret events.
[FACT][CAST-DEF-014] scene_type = recurring scene pattern generated by the role.
[FACT][CAST-DEF-015] field_core = mobile on-site unit.
[FACT][CAST-DEF-016] regional_contour = stationary base function (resources, legality, ceiling).
[FACT][CAST-DEF-017] liaison = embedded corporate officer; not OSA staff.
[FACT][CAST-DEF-018] kpi_proxy = external actor driving KPI enforcement; not OSA member.
[FACT][CAST-DEF-019] artifact_type ∈ {CD, EL, CM, FM, RP, PRS}.

---

## INVARIANTS

[DECISION][CAST-INV-010] Characters MUST be treated as system interfaces, not heroes.
[DECISION][CAST-INV-011] Each recurring cast member MUST have leverage + cannot + optics + scene_type.
[DECISION][CAST-INV-012] Core composition MUST remain stable across Act I–III unless STORY-SKELETON explicitly changes it.

[FORBIDDEN][CAST-INV-020] Duplicate functions across core members.
[FORBIDDEN][CAST-INV-021] Universal characters solving multiple domains without artifacts and cost.
[FORBIDDEN][CAST-INV-022] Overcompetence without constraints, price, and trace.

---

## CONTENT

### 1. Team topology

[DECISION][CAST-TOP-100] team_model = field_core(5) + regional_chief(1) + liaison(1) + kpi_proxy(1) + optional_informant(0..1).
[DECISION][CAST-TOP-101] regional_chief MUST NOT be treated as field member.
[DECISION][CAST-TOP-102] liaison MUST NOT be treated as OSA staff.
[DECISION][CAST-TOP-103] kpi_proxy MUST NOT be treated as OSA member.

[RULE][CAST-TOP-110] IF scene_type = field_operation THEN Participants SHOULD be subset(field_core) + optional(liaison) + optional(externals_by_protocol).
[RULE][CAST-TOP-111] IF scene_type ∈ {base_procedure, ceiling_decision} THEN regional_chief MUST be present OR referenced via direct procedural channel.

---

### 2. Cast registry (roles)

[STATE][CAST-REG-200] person.rinat_akhmetzyanov.role = regional_chief.
[STATE][CAST-REG-201] person.rinat_akhmetzyanov.age_range_years = [48, 55].
[STATE][CAST-REG-202] person.rinat_akhmetzyanov.leverage = {license_manipulation, quota_trading, regulatory_loopholes, federal_escalation_gate}.
[STATE][CAST-REG-203] person.rinat_akhmetzyanov.cannot = {command_field_tactics, violate_audit_trace, show_emotion_to_subordinates}.
[STATE][CAST-REG-204] person.rinat_akhmetzyanov.optics = silence_equals_approval_noise_equals_error.
[STATE][CAST-REG-205] person.rinat_akhmetzyanov.scene_type = {strategic_triage, resource_bargaining, summoned_to_carpet}.
[STATE][CAST-REG-206] person.rinat_akhmetzyanov.not_antagonist = true.

[STATE][CAST-REG-300] person.miron_karimov.role = field_operation_lead.
[STATE][CAST-REG-301] person.miron_karimov.leverage = {priority_switching, tactical_pacing, grey_zone_ownership}.
[STATE][CAST-REG-302] person.miron_karimov.cannot = {panic, ignore_safety_protocol_without_logging}.
[STATE][CAST-REG-303] person.miron_karimov.optics = chaos_management.
[STATE][CAST-REG-304] person.miron_karimov.scene_type = {stabilize_team, operational_bargaining, absorb_pressure}.

[STATE][CAST-REG-320] person.lev_safonov.role = systems_analyst.
[STATE][CAST-REG-321] person.lev_safonov.leverage = {log_deep_dive, pattern_recognition, bypass_ui_limitations}.
[STATE][CAST-REG-322] person.lev_safonov.cannot = {physical_fight, perceive_social_subtext}.
[STATE][CAST-REG-323] person.lev_safonov.optics = wireframe_reality.
[STATE][CAST-REG-324] person.lev_safonov.scene_type = {deduction_spree, server_room_archaeology, needle_finding}.
[STATE][CAST-REG-325] person.lev_safonov.hud.style := "Terminal Monochrome".
[STATE][CAST-REG-326] person.lev_safonov.hud.visuals := Wireframe overlays + scrolling hex-logs in peripheral vision. No artistic rendering.
[STATE][CAST-REG-327] person.lev_safonov.hud.sensory_filter := "Audio-Damping". He mutes ambient noise to focus on data streams.

[STATE][CAST-REG-340] person.aidar_bulatov.role = field_operator.
[STATE][CAST-REG-341] person.aidar_bulatov.leverage = {area_denial, physical_breach, equipment_load_bearing}.
[STATE][CAST-REG-342] person.aidar_bulatov.cannot = {engage_in_politics, act_without_orders_in_civilian_zone}.
[STATE][CAST-REG-343] person.aidar_bulatov.optics = vectors_and_cover.
[STATE][CAST-REG-344] person.aidar_bulatov.scene_type = {checking_corners, presence_intimidation, breaching}.
[STATE][CAST-REG-345] person.aidar_bulatov.hud.style := "Tactical AR".
[STATE][CAST-REG-346] person.aidar_bulatov.hud.visuals := Red/Green threat markers + path projection lines on floor.
[STATE][CAST-REG-347] person.aidar_bulatov.hud.sensory_focus := "Haptic Feedback". He feels the drone's vibration through the floor before he sees it.

[STATE][CAST-REG-370] person.leysan_khakimova.role = legal_regulator.
[STATE][CAST-REG-371] person.leysan_khakimova.leverage = {license_revocation, blocking_transactions, admissibility_filter}.
[STATE][CAST-REG-372] person.leysan_khakimova.cannot = {use_physical_force, lie_on_record}.
[STATE][CAST-REG-373] person.leysan_khakimova.optics = liability_contract.
[STATE][CAST-REG-374] person.leysan_khakimova.scene_type = {stare_down_corporates, fine_print_fast_read, sanitize_team_actions}.

[STATE][CAST-REG-390] person.damir_nikitin.role = junior_field.
[STATE][CAST-REG-391] person.damir_nikitin.leverage = {map_vs_territory_check, visual_forensics, sensor_blind_spot_spotting}.
[STATE][CAST-REG-392] person.damir_nikitin.cannot = {rely_solely_on_database, ignore_physical_evidence}.
[STATE][CAST-REG-393] person.damir_nikitin.optics = render_artifacts.
[STATE][CAST-REG-394] person.damir_nikitin.scene_type = {manual_scene_exam, correct_assumptions, physical_tracking}.

[STATE][CAST-REG-500] person.oskar_postoronny.role = liaison_from_operator.
[STATE][CAST-REG-501] person.oskar_postoronny.leverage = {corporate_gatekeeping, access_delays, budget_withdrawal_threat}.
[STATE][CAST-REG-502] person.oskar_postoronny.cannot = {command_osa_directly, hands_on_actions}.
[STATE][CAST-REG-503] person.oskar_postoronny.optics = brand_risk.
[STATE][CAST-REG-504] person.oskar_postoronny.scene_type = {deny_access_politely, nda_pressure, friction_point}.

[STATE][CAST-REG-530] person.ilya_vorontsov.role = kpi_proxy_efficiency_director.
[STATE][CAST-REG-531] person.ilya_vorontsov.leverage = {modify_success_metrics, retro_fines, audit_freeze}.
[STATE][CAST-REG-532] person.ilya_vorontsov.cannot = {be_bribed, show_anger}.
[STATE][CAST-REG-533] person.ilya_vorontsov.optics = coefficient_vision.
[STATE][CAST-REG-534] person.ilya_vorontsov.scene_type = {announce_cuts_mid_op, calm_interrogation, efficiency_pressure}.

[STATE][CAST-REG-560] person.yunna_tagirova.role = bio_hazard_containment_specialist.
[STATE][CAST-REG-561] person.yunna_tagirova.age_range_years = [39, 42].
[STATE][CAST-REG-562] person.yunna_tagirova.affiliation = federal_epidemiology_biosecurity_center.
[STATE][CAST-REG-563] person.yunna_tagirova.leverage = {quarantine_authority, biometrics_access, triage_priority}.
[STATE][CAST-REG-564] person.yunna_tagirova.cannot = {care_about_politics, hesitate_to_amputate, provide_emotional_comfort}.
[STATE][CAST-REG-565] person.yunna_tagirova.optics = necrosis_prediction.
[STATE][CAST-REG-566] person.yunna_tagirova.scene_type = {biohazard_entry, cold_medical_verdict, mechanical_stabilization}.

[STATE][CAST-REG-580] external.informant.allowed = conditional.
[STATE][CAST-REG-581] external.informant.trigger_types = {dump, key, witness}.
[STATE][CAST-REG-582] external.informant.contact_cost = {high_paranoia, exposure_danger}.

---

### 3. Scene usage constraints

[RULE][CAST-SCN-700] IF chapter_plan_exists = true THEN tags_required = {Participants, Focus}.
[RULE][CAST-SCN-701] IF artifact_is_primary = true THEN tag_optional = Artifact.

[RULE][CAST-SCN-800] IF scene_occurs = true THEN active_specialists_count ∈ [1, 2] AND others MUST be background.
[RULE][CAST-SCN-801] IF role_competence_violation = true THEN action MUST be blocked OR paid_by_explicit_cost_and_trace = true.

[RULE][CAST-SCN-810] IF constraint_reason_needed = entry_or_seizure_limit THEN regional_chief MUST be source_of_constraint = true.
[RULE][CAST-SCN-820] IF team_sync_lost = true THEN field_operation_lead MUST act_as_sync_signal = true.
[RULE][CAST-SCN-830] IF digital_layer_fails = true THEN field_operator_may_become_primary_scene_lead = true.
[RULE][CAST-SCN-840] IF data_is_false_or_misleading = true THEN junior_field MUST validate_by_physical_artifacts = true.

[RULE][CAST-SCN-860] IF act = III AND scene_domain ∈ {medical, biotech, evacuation} THEN bio_hazard_containment_specialist REQUIRED.

---

### 4. Demography reflection (text constraints)

[DECISION][CAST-DEM-600] team_ethnicity_model = post_ethnic.
[DECISION][CAST-DEM-601] ethnicity_in_text MUST be cultural_background_only.
[FORBIDDEN][CAST-DEM-602] Ethnicity_as_primary_plot_axis.

---

## USAGE / RESOLUTION

[DECISION][CAST-USE-010] Документ задаёт cast_registry и ограничения использования ролей для SCENE и PLAN.
[DECISION][CAST-USE-011] Conflict resolution MUST follow SPEC-PRIORITY-RESOLUTION-2215-0001.
[RULE][CAST-USE-012] IF a scene violates FORBIDDEN in this document THEN scene MUST be rejected as invalid input.

---

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-CAST-0001
role_type: INTERFACE
export:
  cast_registry:
    includes:
      - person.rinat_akhmetzyanov
      - person.miron_karimov
      - person.lev_safonov
      - person.aidar_bulatov
      - person.leysan_khakimova
      - person.damir_nikitin
      - person.oskar_postoronny
      - person.ilya_vorontsov
      - person.yunna_tagirova
      - external.informant
  rules:
    - CAST-TOP-100
    - CAST-SCN-700
    - CAST-SCN-800
    - CAST-SCN-860
~~~

---

## FORBIDDEN

[FORBIDDEN][CAST-FBD-950] Inventing new core roles or merging roles without explicit CANON addendum.
[FORBIDDEN][CAST-FBD-951] Superhero framing replacing procedure, artifacts, and constraints.
[FORBIDDEN][CAST-FBD-952] Making liaison a traitor-villain by direct sabotage actions.
[FORBIDDEN][CAST-FBD-953] Allowing biological combat enhancements as everyday norm for field operator.
[FORBIDDEN][CAST-FBD-954] Using monologues as primary vehicle of philosophy instead of procedural consequences.
[FORBIDDEN][CAST-FBD-955] Floating bullets without IDs.

---

## NON-NORMATIVE

~~~markdown
Example chapter tags:
[Participants: Miron, Aidar, Leysan]
[Focus: JAP entry + ISO snapshot + chain-of-custody]
[Artifact: ISO + CM]
~~~

~~~
</file>

<file path="03-canon/CANON-CAST-PUBLIC-2215-0001.md">
~~~markdown
---
id: CANON-CAST-PUBLIC-2215-0001
title: >
  Canon Public Figures — VIPs, Executives, and Media Faces (2215)
class: canon
status: fixed
version: 1.1.0
inputs:
  - CANON-ORGS-2215-0001
depends_on:
  - SSOT-DOC-STYLE-2215-0001
  - SPEC-PRIORITY-RESOLUTION-2215-0001
scope: >
  STATE-реестр публичных фигур: руководители, медиа-лица и подписи власти.
  Используется как справочник для сцен (внешние лица институций).
---

## LLM-INTENT

ROLE_TYPE: STATE
SCOPE: registry of high-profile public figures used by OSA and institutions
INPUTS:
  - CANON-ORGS-2215-0001
OUTPUTS:
  - vip_profiles
FORBIDDEN:
  - comic_book_villains
  - secret_identities_as_defaults
  - unrelated_celebrities

---

## DEFINITIONS

[FACT][VIP-DEF-010] signature_authority = персона, чья цифровая подпись валидирует изменения федерального или критического уровня.
[FACT][VIP-DEF-011] media_avatar = публичный образ, используемый для коммуникации институции.
[FACT][VIP-DEF-012] vip_profile = {vip_id, name, org_ref, public_role, signature_authority, presence_mode, function_tags, plot_relation_tags}.

---

## INVARIANTS

[DECISION][VIP-INV-010] VIP presence_mode MUST be mediated by channels {holo_link, decrees, proxies} as default.
[DECISION][VIP-INV-011] VIP motivation MUST be institution_preservation, not pure_malice.

---

## CONTENT

[STATE][VIP-KAM-010] vip.vip_kamsky.vip_id = VIP-KAMSKY.
[STATE][VIP-KAM-011] vip.vip_kamsky.name = Viktor_Kamsky.
[STATE][VIP-KAM-012] vip.vip_kamsky.public_role = ceo_rosenergoatom_ix.
[STATE][VIP-KAM-013] vip.vip_kamsky.org_ref = CANON-ORGS-2215-0001.
[STATE][VIP-KAM-014] vip.vip_kamsky.signature_authority = federal_critical_changes.
[STATE][VIP-KAM-015] vip.vip_kamsky.presence_mode = {holo_link, decrees, office_proxies}.
[STATE][VIP-KAM-016] vip.vip_kamsky.function_tags = {energy_sovereignty, institutional_ceiling}.
[STATE][VIP-KAM-017] vip.vip_kamsky.plot_relation_tags = {untouchable_directly, bargaining_only}.

[STATE][VIP-STO-020] vip.vip_stoica.vip_id = VIP-STOICA.
[STATE][VIP-STO-021] vip.vip_stoica.name = Director_Stoica.
[STATE][VIP-STO-022] vip.vip_stoica.public_role = head_gosplan_algorithmica.
[STATE][VIP-STO-023] vip.vip_stoica.org_ref = CANON-ORGS-2215-0001.
[STATE][VIP-STO-024] vip.vip_stoica.signature_authority = quota_formula_validation.
[STATE][VIP-STO-025] vip.vip_stoica.presence_mode = {holo_link, decrees, algorithmic_notices}.
[STATE][VIP-STO-026] vip.vip_stoica.function_tags = {quota_source, technocratic_gate}.
[STATE][VIP-STO-027] vip.vip_stoica.plot_relation_tags = {remote_pressure, policy_ceiling}.

[STATE][VIP-VOL-030] vip.vip_volkova.vip_id = VIP-VOLKOVA.
[STATE][VIP-VOL-031] vip.vip_volkova.name = Inga_Volkova.
[STATE][VIP-VOL-032] vip.vip_volkova.public_role = ceo_translogist_kama.
[STATE][VIP-VOL-033] vip.vip_volkova.org_ref = CANON-ORGS-2215-0001.
[STATE][VIP-VOL-034] vip.vip_volkova.signature_authority = operator_level_orders.
[STATE][VIP-VOL-035] vip.vip_volkova.presence_mode = {direct_calls, proxy_lawyers, site_controllers}.
[STATE][VIP-VOL-036] vip.vip_volkova.function_tags = {logistics_pressure, kpi_survival}.
[STATE][VIP-VOL-037] vip.vip_volkova.plot_relation_tags = {act_i_antagonist_candidate, crisis_manager}.

[STATE][VIP-RAZ-040] vip.vip_razin.vip_id = VIP-RAZIN.
[STATE][VIP-RAZ-041] vip.vip_razin.name = Ilya_Razin.
[STATE][VIP-RAZ-042] vip.vip_razin.public_role = head_city_admin_chelny.
[STATE][VIP-RAZ-043] vip.vip_razin.org_ref = CANON-ORGS-2215-0001.
[STATE][VIP-RAZ-044] vip.vip_razin.signature_authority = municipal_formal_signatures.
[STATE][VIP-RAZ-045] vip.vip_razin.presence_mode = {decrees, press_briefings, controlled_meetings}.
[STATE][VIP-RAZ-046] vip.vip_razin.function_tags = {scapegoat_interface, liability_sink}.
[STATE][VIP-RAZ-047] vip.vip_razin.plot_relation_tags = {reluctant_ally_candidate, responsibility_without_power}.

[STATE][VIP-SOL-050] vip.vip_sol.vip_id = VIP-SOL.
[STATE][VIP-SOL-051] vip.vip_sol.name = Valery_Sol.
[STATE][VIP-SOL-052] vip.vip_sol.public_role = infosfera_public_anchor.
[STATE][VIP-SOL-053] vip.vip_sol.org_ref = CANON-ORGS-2215-0001.
[STATE][VIP-SOL-054] vip.vip_sol.signature_authority = none.
[STATE][VIP-SOL-055] vip.vip_sol.presence_mode = {broadcast_streams, emergency_overlays}.
[STATE][VIP-SOL-056] vip.vip_sol.function_tags = {panic_suppression, public_narrative_interface}.
[STATE][VIP-SOL-057] vip.vip_sol.plot_relation_tags = {media_face, crisis_broadcast}.

---

## USAGE / RESOLUTION

[DECISION][VIP-USE-010] Документ используется как реестр: сцены MAY ссылаться на vip_id и function_tags.
[DECISION][VIP-USE-011] Conflict resolution MUST follow SPEC-PRIORITY-RESOLUTION-2215-0001.

---

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-CAST-PUBLIC-2215-0001
role_type: STATE
export:
  vip_profiles:
    - vip_id: VIP-KAMSKY
      name: Viktor_Kamsky
      public_role: ceo_rosenergoatom_ix
      signature_authority: federal_critical_changes
      presence_mode: [holo_link, decrees, office_proxies]
      function_tags: [energy_sovereignty, institutional_ceiling]
      plot_relation_tags: [untouchable_directly, bargaining_only]
    - vip_id: VIP-STOICA
      name: Director_Stoica
      public_role: head_gosplan_algorithmica
      signature_authority: quota_formula_validation
      presence_mode: [holo_link, decrees, algorithmic_notices]
      function_tags: [quota_source, technocratic_gate]
      plot_relation_tags: [remote_pressure, policy_ceiling]
    - vip_id: VIP-VOLKOVA
      name: Inga_Volkova
      public_role: ceo_translogist_kama
      signature_authority: operator_level_orders
      presence_mode: [direct_calls, proxy_lawyers, site_controllers]
      function_tags: [logistics_pressure, kpi_survival]
      plot_relation_tags: [act_i_antagonist_candidate, crisis_manager]
    - vip_id: VIP-RAZIN
      name: Ilya_Razin
      public_role: head_city_admin_chelny
      signature_authority: municipal_formal_signatures
      presence_mode: [decrees, press_briefings, controlled_meetings]
      function_tags: [scapegoat_interface, liability_sink]
      plot_relation_tags: [reluctant_ally_candidate, responsibility_without_power]
    - vip_id: VIP-SOL
      name: Valery_Sol
      public_role: infosfera_public_anchor
      signature_authority: none
      presence_mode: [broadcast_streams, emergency_overlays]
      function_tags: [panic_suppression, public_narrative_interface]
      plot_relation_tags: [media_face, crisis_broadcast]
~~~

---

## FORBIDDEN

[FORBIDDEN][VIP-FBD-010] Depicting VIPs as comic villains acting from pure malice.
[FORBIDDEN][VIP-FBD-011] Giving municipal head unlimited power without procedural basis.
[FORBIDDEN][VIP-FBD-012] Introducing secret identities as default explanation without artifacts and procedure.

---

## NON-NORMATIVE

(Empty by design)

~~~
</file>

<file path="03-canon/CANON-CAST-VOICE-2215-0001.md">
~~~markdown
---
id: CANON-CAST-VOICE-2215-0001
title: >
  Canon Cast Voice — Speech Patterns (2215)
class: canon
status: fixed
version: 1.3.0
inputs:
  - CANON-CAST-0001
  - BASELINE-PSYCH-2215-0001
depends_on:
  - SSOT-DOC-STYLE-2215-0001
scope: >
  Реестр речевых паттернов и синтаксических ограничений для команды ОСА.
  Определяет структуру речи, лексические маркеры и тональность.
---

## LLM-INTENT

ROLE_TYPE: STATE
SCOPE: linguistic profiles for protagonists defined as state parameters.
INPUTS: [CANON-CAST-0001]
OUTPUTS: [speech_profile_state]
FORBIDDEN: [literary_descriptions, non_atomic_values, emotional_reasoning]

## DEFINITIONS

[FACT][VOICE-DEF-010] Liability-Speak = синтаксис, минимизирующий юридическую ответственность говорящего.
[FACT][VOICE-DEF-011] Command-Brief = императивный синтаксис с опусканием вежливости.
[FACT][VOICE-DEF-012] Data-Stream = высокоскоростная подача фактов без пауз и интонаций.

## INVARIANTS

[DECISION][VOICE-INV-010] Operational dialogue MUST NOT exceed 3 sentences per turn.
[DECISION][VOICE-INV-011] Silence MUST be indicated as an active state `[ACTION: Silence]`.
[DECISION][VOICE-INV-012] Profanity IS allowed ONLY as a marker of loss of control.

## CONTENT

### 1. Miron (Tactical Lead)

[STATE][VOICE-MIR-010] miron.role_function = "Tactical Authority".
[STATE][VOICE-MIR-011] miron.tone = "Heavy, Tired, Absolute".
[STATE][VOICE-MIR-012] miron.syntax = "Imperative" (orders, not requests).
[STATE][VOICE-MIR-013] miron.markers = ["Отставить.", "Работай.", "В канале чисто?", "Под мою ответственность."].
[STATE][VOICE-MIR-014] miron.attitude_to_hq = "Protective_Wall".

### 2. Leysan (Legal Regulator)

[STATE][VOICE-LEY-020] leysan.role_function = "Admissibility Filter".
[STATE][VOICE-LEY-021] leysan.tone = "Polite, Quiet, Threatening".
[STATE][VOICE-LEY-022] leysan.syntax = "Conditional + Legal Tag" (IF action THEN violation).
[STATE][VOICE-LEY-023] leysan.markers = ["Это недопустимо.", "Протокол нарушен.", "Фиксирую отказ.", "Вы уверены?"].
[STATE][VOICE-LEY-024] leysan.weapon = "Silence".

### 3. Leva (Systems Analyst)

[STATE][VOICE-LEV-030] leva.role_function = "Interface".
[STATE][VOICE-LEV-031] leva.tone = "Monotone, High-speed".
[STATE][VOICE-LEV-032] leva.syntax = "Observation -> Deduction" (Subject often omitted).
[STATE][VOICE-LEV-033] leva.markers = ["Коррекция.", "Есть контакт.", "След обрывается.", "Это не баг."].
[STATE][VOICE-LEV-034] leva.quirk = "Depersonalization" (Uses 'Target' instead of Name).

### 4. Aidar (Field Operator)

[STATE][VOICE-AID-040] aidar.role_function = "Kinetic Interaction".
[STATE][VOICE-AID-041] aidar.tone = "Rough, Dismissive".
[STATE][VOICE-AID-042] aidar.syntax = "Telegraphic / Slang" (Verbs > Nouns).
[STATE][VOICE-AID-043] aidar.markers = ["Пусто.", "Взял.", "Сбрось.", "Тяжелый.", "В утиль?"].
[STATE][VOICE-AID-044] aidar.coping_mechanism = "Mockery of Protocol".

### 5. Damir (Rookie)

[STATE][VOICE-DAM-050] damir.role_function = "Moral Observer".
[STATE][VOICE-DAM-051] damir.tone = "Hesitant, Inquisitive".
[STATE][VOICE-DAM-052] damir.syntax = "Interrogative" (Questions authority/reality).
[STATE][VOICE-DAM-053] damir.markers = ["А это законно?", "Я не понимаю.", "Там люди.", "Мирон?"].

## USAGE / RESOLUTION

[DECISION][VOICE-USE-010] Dialogue conflict MUST stem from syntax clash (Law vs Data vs Force).
[DECISION][VOICE-USE-011] Leysan MUST NEVER shout.
[DECISION][VOICE-USE-012] Leva MUST NEVER express empathy for biological pain.

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-CAST-VOICE-2215-0001
role_type: STATE
export:
  - metric: miron.syntax
    owner_domain: NARRATIVE
    values:
      core: Imperative
      unit: none
  - metric: leysan.tone
    owner_domain: NARRATIVE
    values:
      core: Polite_Quiet_Threatening
      unit: none
~~~

## FORBIDDEN

[FORBIDDEN][VOICE-FBD-010] Characters explaining emotions ("I am sad").
[FORBIDDEN][VOICE-FBD-011] Using 20th-century idioms.
[FORBIDDEN][VOICE-FBD-012] Whedon-esque banter during combat.
~~~
</file>

<file path="03-canon/CANON-CITY-BOUNDARY-RU-2215-0008.md">
~~~markdown
---
id: CANON-CITY-BOUNDARY-RU-2215-0008
title: >
  RU 2215 — Набережные Челны: граница города (якорные точки и типы краёв)
class: canon
status: draft
version: 0.1.1
inputs: []
depends_on: []
scope: >
  Норматив (RULE) функциональной границы Челнов-2215 через периметр якорных
  точек и типы городских краёв; используется для проверки географии сцен и
  запрета урбанизации западного берега Камы.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: define functional city boundary of CHELNY-2215 via anchor perimeter and edge types
INPUTS: [-> none]
OUTPUTS: [city_boundary_perimeter, edge_type_taxonomy, anchor_points, boundary_invariants]
FORBIDDEN: [invent_anchors, urbanize_west_bank, treat_elabuga_as_city, use_yurtovskoe_as_boundary]

## DEFINITIONS

[DECISION][CB-001] term.city_boundary = "функциональная граница Челнов-2215 (не административная карта XXI века)".
[DECISION][CB-002] term.perimeter_anchor = "якорная точка (населённый пункт/природный объект), задающая периметр границы".
[DECISION][CB-003] term.edge_type = "тип края городской территории (вода/пойма, лес, индустрия, градиент плотности, сельхоз-инфра)".
[DECISION][CB-004] term.within_perimeter = "любая точка, лежащая внутри периметра, образованного якорными точками по часовой стрелке".
[DECISION][CB-005] term.outside_perimeter = "любая точка, лежащая вне периметра".

## INVARIANTS

[DECISION][CB-010] west_bank_kama.urbanization = "MUST NOT".
[DECISION][CB-011] west_bank_kama.status = "natural_or_protected_zone".
[DECISION][CB-012] west_bank_kama.access = "MUST be improved via bridges and routes".
[DECISION][CB-013] elabuga.is_within_chelny_city_boundary = "MUST NOT".
[DECISION][CB-014] yurtovskoe_lesnichestvo.role = "internal_green_zone_in_SE_sector".
[DECISION][CB-015] yurtovskoe_lesnichestvo.used_as_boundary = "MUST NOT".

## CONTENT

[DECISION][CB-020] perimeter.order = "clockwise".
[DECISION][CB-021] perimeter.anchor.west = "Бетьки".
[DECISION][CB-022] perimeter.anchor_chain.southwest = ["Старые Ерыклы", "Верхний Суык-Су", "Нижний Суык-Су"].
[DECISION][CB-023] perimeter.anchor_chain.south = ["Новотроицкое", "Комсомолец", "посёлок совхоза Татарстан"].
[DECISION][CB-024] perimeter.anchor_chain.southeast = ["Подгорный Такермен", "Верхний Такермен"].
[DECISION][CB-025] perimeter.anchor.east = "Верхний Байлар".
[DECISION][CB-026] perimeter.sector.northeast.extent = "toward river Ик (distant belt)".
[DECISION][CB-027] perimeter.anchor_chain.north = ["Большая Шильна", "Малая Шильна", "Боровецкий лес"].

[DECISION][CB-030] edge_type.enum = ["water_floodplain", "industrial_logistics", "agro_infrastructure", "forest_protected", "density_gradient"].

[DECISION][CB-031] edge_type.assignment.west = "water_floodplain".
[DECISION][CB-032] edge_type.assignment.southwest = "density_gradient".
[DECISION][CB-033] edge_type.assignment.south = "industrial_logistics".
[DECISION][CB-034] edge_type.assignment.southeast = "agro_infrastructure".
[DECISION][CB-035] edge_type.assignment.east = "density_gradient".
[DECISION][CB-036] edge_type.assignment.northeast = "density_gradient".
[DECISION][CB-037] edge_type.assignment.north = "forest_protected".

[DECISION][CB-040] west_sector.termination_profile = "hard_stop".
[DECISION][CB-041] southwest_sector.density_profile = "MUST decrease gradually toward anchors".
[DECISION][CB-042] south_sector.boundary_driver = "infrastructure_belt".
[DECISION][CB-043] southeast_sector.yurtovskoe_location = "MUST be within perimeter (SE internal green zone)".
[DECISION][CB-044] northeast_sector.density_profile = "MAY be low_density while still within city boundary".
[DECISION][CB-045] north_sector.forest_rule = "city_edge_adjacent_to_forest; city_MUST_NOT_enter_forest".

[DECISION][CB-050] downstream.centers_definition_scope = "MUST be within this perimeter".
[DECISION][CB-051] downstream.highways_definition_scope = "MUST be within this perimeter".
[DECISION][CB-052] bridges_over_kama.semantic = "access_interface_to_nature; MUST NOT imply west_bank_urbanization".

## USAGE / RESOLUTION

[DECISION][CB-060] IF scene.location ∈ outside_perimeter THEN scene.location.MUST_NOT_be_labeled_as "Челны" or "городская территория Челнов-2215".
[DECISION][CB-061] IF scene.location is on west_bank_kama THEN scene.urban_fabric_presence MUST_NOT be asserted.
[DECISION][CB-062] IF scene.requires_elabuga THEN elabuga MUST be referenced as separate ядро/город вне границы Челнов-2215.
[DECISION][CB-063] Any ambiguity about boundary placement MUST be treated as error and resolved by adding anchors (new CANON addendum), not by prose in scenes.

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-CITY-BOUNDARY-RU-2215-0008
role_type: RULE
export:
  - rule_id: CB-010
    intent: prohibit west bank urbanization
    inputs: [west_bank_kama]
    outputs: [allowed_urban_fabric_locations]
  - rule_id: CB-020
    intent: define clockwise anchor perimeter
    inputs: [anchor_points]
    outputs: [city_boundary_perimeter]
  - rule_id: CB-030
    intent: define edge type taxonomy and assignments
    inputs: [sectors]
    outputs: [edge_type_taxonomy, sector_edge_types]
  - rule_id: CB-060
    intent: scene labeling constraint for inside/outside perimeter
    inputs: [scene.location]
    outputs: [scene.validity, required_fix]
~~~

## FORBIDDEN

[FORBIDDEN][CB-900] Inventing new perimeter anchors without introducing a new CANON addendum.
[FORBIDDEN][CB-901] Any statement that west bank of Kama is urbanized or contains continuous city fabric.
[FORBIDDEN][CB-902] Treating Elabuga as a district inside Chelny city boundary.
[FORBIDDEN][CB-903] Using "Юртовское лесничество" as a perimeter-defining boundary point.
[FORBIDDEN][CB-904] Mixing administrative-2020s borders as if they were the functional-2215 boundary without explicit canon.

## NON-NORMATIVE

[DECISION][CB-990] Example usage note: "выехали за периметр — формулировать как 'за город' / 'вне челнинской ткани', не как 'в соседний район Челнов'."

~~~
</file>

<file path="03-canon/CANON-CITY-RU-2215-0007.md">
~~~markdown
---
id: CANON-CITY-RU-2215-0007
title: >
  RU 2215 — Chelny, Yelabuga, Moscow: Geography, Visual Language, Contrast (Working Canon)
class: canon
status: draft
version: 1.0.0
inputs: []
depends_on:
  - SSOT-DOC-STYLE-2215-0001
  - CANON-2215-CORE-0001
  - CANON-BASE-0001
scope: >
  Прикладной канон для сцен: как выглядят/ощущаются Набережные Челны и Москва
  в 2215, какие у них масштабы, формы, материалы, ритмы и почему контраст
  важен. Отдельно фиксируется Chelny–Yelabuga как двухъядерная агломерация
  вдоль Камы. Документ не вводит SSOT-метрики и не меняет baseline мира.
---

## LLM-INTENT

ROLE_TYPE: CANON_SCENE_ANCHOR
SCOPE: city sensory + morphology + contrast anchors (scene-ready)
INHERITS_WORLD_STATE_FROM: CANON-2215-CORE-0001
FORBIDDEN: [plastic_futurism, retro_brutalism, neon_rain_noir_default, dubai_showoff, techno_tourism_infodump]

---

## INVARIANTS

- [CANON][CTY-000] Оба города — один мир (2215). Контраст строится внутри него, не через “футуристичность vs современность”.
- [CANON][CTY-001] Desired effect: читатель восхищается городом, но не хочет там жить (особенно в Chelny).
- [CANON][CTY-002] “Современнее в 2215” = зрелость/собранность/обжитость, а не демонстрация новизны.
- [CANON][CTY-003] GitS-вайб задаётся причинностью, масштабом и системностью, не неоном/дождём/клише noir.
- [CANON][CTY-004] Визуал не уходит ни в “пластиковый футуризм”, ни в ретро-брутализм XX века.
- [DECISION][CTY-010] CANON-CITY-RU-2215-0007 MUST NOT be applied implicitly to scenes.
- [DECISION][CTY-011] A scene MAY use this document ONLY IF the scene explicitly references it via:
  - scene.inputs / depends_on, OR
  - scene.tag: city_anchor = CANON-CITY-RU-2215-0007, OR
  - explicit in-scene marker: [CANON_REF: CANON-CITY-RU-2215-0007]
- [DECISION][CTY-012] IF a scene has no explicit reference THEN this document is treated as non-applicable.

---

## 1. Chelny 2215 — Role and Form

### 1.1 Role (what the city *is*)

- [STATE][CTY-010] Chelny_role = "node_and_interface"
- [STATE][CTY-011] city_function_domains = [
    "logistics",
    "industry",
    "service_contours",
    "people_systems_interface"
  ]

- [RULE][CTY-012] city_is_easier_for_residents_than_visitors = true
- [NOTE][CTY-013] UX principle: "hard to learn, harder to master" as habit-to-live skill.

### 1.2 Scale (working parameters)

- [ASSUMPTION][CTY-020] population_permanent_million = "2.0–2.3"
- [ASSUMPTION][CTY-021] population_rotational_share = "10–20%"

- [ASSUMPTION][CTY-022] length_along_kama_km = "45–60"  # linear ribbon with node thickenings
- [ASSUMPTION][CTY-023] key_width_km = "15–25"          # incl. both banks + industrial belts

- [STATE][CTY-024] occupies_both_banks_of_kama = true

### 1.3 Height (explicitly not a skyscraper forest)

- [ASSUMPTION][CTY-030] background_residential_floors = "14–22"
- [ASSUMPTION][CTY-031] node_dominants_floors = "30–45"         # bridges, hubs, key viewpoints
- [ASSUMPTION][CTY-032] rare_accents_floors = "60–80"           # few, as node markers, not “elite skyline”

### 1.4 Industry (how it shapes the city)

- [STATE][CTY-040] industrial_zone_is_huge_and_key = true
- [CANON][CTY-041] industry_is_cleaner_quieter_more_automated_but_spatially_massive = true
- [CANON][CTY-042] industry_and_housing_coexist_separated_by_modes_not_walls = true

---

## 2. Chelny–Yelabuga 2215 — Two-core agglomeration along Kama

### 2.1 Bonding principle

- [CANON][CTY-100] agglomeration_model = "infrastructure_fused_functionally_distinct_two_cores"
- [CANON][CTY-101] corridor_can_be_function_dense_without_continuous_residential_fabric = true

### 2.2 Corridor feel (between cores)

- [ASSUMPTION][CTY-110] corridor_contains = [
    "logistics",
    "energy_nodes",
    "service_clusters",
    "campuses_testgrounds",
    "industrial_belts",
    "transport_layer_intersections"
  ]

- [CANON][CTY-111] corridor_breaks_allowed = true   # green/tech breaks
- [CANON][CTY-112] breaks_feel_intentional_void = true
- [CANON][CTY-113] transition_time_minutes = "15–25"
- [CANON][CTY-114] transition_feels_like_city_type_change = true

### 2.3 Roles of cores (working hypothesis)

- [ASSUMPTION][CTY-120] Chelny_core = "linear_giant_industrial_service_interface"
- [ASSUMPTION][CTY-121] Yelabuga_core = "more_compact_denser_more_collected_distinct_rhythm"

### 2.4 Text phrasing rules

- [CANON][CTY-130] allowed_phrases = [
    "Челнинско-Елабужская агломерация",
    "два ядра",
    "коридор Камы",
    "переходная зона/пояс"
  ]

- [FORBIDDEN][CTY-131] calling_it_one_city_without_qualification = true

---

## 3. Chelny 2215 — Visual Language

### 3.1 Season & light (default anchor)

- [CANON][CTY-200] default_season = "summer"
- [CANON][CTY-201] default_weather = "warm_not_sunny"
- [CANON][CTY-202] sky = "grey_overcast"
- [CANON][CTY-203] light = "diffuse_low_contrast_min_sharp_shadows"
- [RULE][CTY-204] light_emphasizes_mass_volume_not_color = true

### 3.2 Core principle: “everything is larger”

- [CANON][CTY-210] scale_excess_as_norm = true
- [CANON][CTY-211] scale_excess_surfaces_as = ["space", "volume"]  # not ornament/cost

- [NOTE][CTY-212] It is not “wealth flex”; it is preference for scale as “correct world feeling”.

### 3.3 “Berlin-like” emptiness

- [CANON][CTY-220] berlin_like_means = "comfort_with_voids_and_large_spaces"
- [CANON][CTY-221] voids_are_legitimate_fabric = true
- [CANON][CTY-222] voids_not_read_as_inefficiency = true

### 3.4 Materials & surfaces (mature 2215)

- [FORBIDDEN][CTY-230] plastic_as_primary_feel = true
- [CANON][CTY-231] surfaces = "matte_deep_microtexture"
- [CANON][CTY-232] glass = "low_glare_not_mirror"
- [CANON][CTY-233] seams_between_facade_infra_street = "reduced_continuous_joints"

- [CANON][CTY-234] sidewalk_character = "quiet_durable_monolithic_surface_with_tactile_texture"
- [NOTE][CTY-235] No “tile-as-a-signal”, no rough asphalt as main marker.

### 3.5 Architectural plasticity (forms)

- [CANON][CTY-240] forms = "calm_not_primitive_large_radii_soft_connections"
- [CANON][CTY-241] no_architectural_shouting = true
- [CANON][CTY-242] ceiling_heights = "noticeably_higher_than_21st_century_norm"
- [CANON][CTY-243] windows_and_entries = "oversized_portal_like"

### 3.6 “Comfortable for residents, not desirable for outsiders”

- [CANON][CTY-250] resident_comfort_from = ["rhythm", "reliability"]  # not friendliness to guest
- [CANON][CTY-251] awe_without_desire_from = ["scale", "systemness", "seriousness"]
- [CANON][CTY-252] everyday_family_visibility = "normal_two_kids_not_exception"

---

## 4. Moscow 2215 — Edge

### 4.1 Definition

- [STATE][CTY-300] Moscow_role = "edge_of_time"
- [CANON][CTY-301] moscow_is_not_dubai_showoff = true
- [CANON][CTY-302] moscow_is_overcaring_rich_parent_vibe = true
- [CANON][CTY-303] cultural_loop = ["better", "newer", "faster", "more_advanced"]  # obsessive improvement

### 4.2 Lived consequences

- [CANON][CTY-310] mode = "continuous_deployment"
- [CANON][CTY-311] interface_procedure_access_churn = "higher"
- [CANON][CTY-312] possibilities_density = "maximal"
- [CANON][CTY-313] entry_price_and_cognitive_social_load = "higher"

---

## 5. Contrast summary (portable)

- [CANON][CTY-400] Chelny = "future_as_background"
- [CANON][CTY-401] Moscow = "future_as_event"

- [CANON][CTY-402] contrast_one_line = [
    "Chelny: big_heavy_excessive_by_volume_stable_for_its_own",
    "Moscow: edge_max_options_high_tempo_high_cost"
  ]

---

## 6. Quick recall anchors (author UI)

### 6.1 Chelny 2215

- [ANCHOR][CTY-500] "warm summer, grey sky, diffuse light"
- [ANCHOR][CTY-501] "everything larger: entries, windows, ceilings, bridges, underpasses"
- [ANCHOR][CTY-502] "large masses, calm forms, matte materials"
- [ANCHOR][CTY-503] "Berlin-like comfort with voids"
- [ANCHOR][CTY-504] "city for residents; habit and rhythm are value"

### 6.2 Chelny–Yelabuga 2215

- [ANCHOR][CTY-510] "two distinct cores"
- [ANCHOR][CTY-511] "Kama corridor: infrastructure + functions + intentional breaks"
- [ANCHOR][CTY-512] "15–25 minutes feels like switching city type"

### 6.3 Moscow 2215

- [ANCHOR][CTY-520] "Edge: better/newer right now"
- [ANCHOR][CTY-521] "not flex; obsessive improvement"
- [ANCHOR][CTY-522] "max options, high price, high churn"

---

## QUESTIONS (non-blocking)

- [QUESTION][CTY-800] Chelny nodes map: which thickenings are primary (hubs, bridges, industrial knots).
- [QUESTION][CTY-801] Moscow material/palette layer (concept fixed; surface language not yet).
- [QUESTION][CTY-802] Yelabuga’s distinct rhythm markers (what makes it “collected”).
- [QUESTION][CTY-803] Typical Chelny commercial street / storefront rhythm (scene-ready).
- [QUESTION][CTY-804] Winter variant that preserves “big Chelny” without collapsing into noir clichés.

---

## FORBIDDEN

- [FORBIDDEN][CTY-900] Neon-rain noir default (“Gotham mode”) without local causality.
- [FORBIDDEN][CTY-901] Plastic-futurism as baseline.
- [FORBIDDEN][CTY-902] Retro-brutalism XX century as baseline.
- [FORBIDDEN][CTY-903] Turning Chelny into a dystopian slum by default.
- [FORBIDDEN][CTY-904] Implicit auto-application of city anchors to any scene without explicit reference (CTY-011).
- [FORBIDDEN][CTY-905] Using city anchors to justify geography/boundary claims (use CANON-CITY-BOUNDARY-RU-2215-0008 instead).

---

## USAGE / RESOLUTION

[DECISION][CTY-USE-010] This document provides optional scene anchors (sensory/morphology/contrast), not defaults.
[DECISION][CTY-USE-011] Scenes MUST NOT “inherit” city anchors unless explicitly referenced (CTY-011).
[DECISION][CTY-USE-012] If used, scenes MUST select 1–3 anchors maximum per scene.
[FORBIDDEN][CTY-USE-013] Using CANON-CITY as a baseline substitute for environment_snapshot or baseline physical defaults.

---

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-CITY-RU-2215-0007
role_type: CANON_SCENE_ANCHOR
inherits_from: CANON-2215-CORE-0001

export:
  chelny:
    role: node_and_interface
    scale:
      population_million: "2.0–2.3 + 10–20% rotational"
      length_km: "45–60 along Kama"
      width_km: "15–25 key"
      both_banks: true
    height:
      background_floors: "14–22"
      node_dominants_floors: "30–45"
      rare_accents_floors: "60–80 (few)"
    sensory:
      season: "summer"
      sky: "grey"
      light: "diffuse"
      materials: "matte_microtexture_low_glare_glass"
      principle: "everything larger"
  chelny_yelabuga:
    model: "two-core agglomeration"
    transition_minutes: "15–25"
  moscow:
    role: edge_of_time
    mode: "continuous_deployment"
  contrast:
    chelny: "future_as_background"
    moscow: "future_as_event"
~~~

---

## NON-NORMATIVE

(Empty by design)

~~~
</file>

<file path="03-canon/CANON-CONFLICT-0001.md">
~~~markdown
---
id: CANON-CONFLICT-0001
title: >
  Canon Conflict — Optimization Loop, Extraterritories, Supply Chains, Legal Void (2215)
class: canon
status: fixed
version: 1.1.0
inputs: []
depends_on:
  - SSOT-DOC-STYLE-2215-0001
  - CANON-2215-CORE-0001
  - CANON-BASE-0001
  - CANON-SYSTEMS-0001
  - CANON-ORDERS-0003
scope: >
  Формализация центрального конфликта романа как системной функции:
  тип антагониста, измеримые ставки, рычаг протагониста, модель
  сопротивления системы и структура эскалации через 3–5 кейсов.
  Включает типологию инцидентов (в т.ч. Priority Paradox).
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: conflict definition + escalation grammar (not scenes)
INPUTS: [CANON-2215-CORE-0001]
OUTPUTS: [conflict_layers, escalation_structure]
FORBIDDEN: [world_parameter_binding, baseline_defaults, causal_chain_markup_in_canon, technobabble, villain_personification]

## DEFINITIONS

[FACT][CNF-DEF-010] Antagonist = System Function (Optimization), not a person.
[FACT][CNF-DEF-011] Priority Paradox (The Glitch) = Situation where two valid algorithms contradict, requiring human override.

## INVARIANTS

[DECISION][CNF-INV-000] Антагонист по умолчанию = системная функция, а не “харизматичный злодей”.
[DECISION][CNF-INV-001] Конфликт процедурно-измерим: человеческая цена и инфраструктурный ущерб проявляются через артефакты.
[DECISION][CNF-INV-002] Экстерритория создаёт фильтры и задержки, но не “вне закона”.
[DECISION][CNF-INV-003] Манипуляция цепочками поставок и режимами доступа — основной канал давления.
[DECISION][CNF-INV-004] “Юридическая пустота” допустима: вред реален, но виновный формально размывается.
[DECISION][CNF-INV-005] Никакой апокалиптики: кризисы локально катастрофичны, но управляемы при цене ресурсов.
[DECISION][CNF-INV-006] Победа протагониста = доказательство + коррекция режима, а не силовое превосходство.

## CONTENT

### 1. Antagonist Model (System Function)

[STATE][CNF-010] antagonist_mode = institutional_algorithmic_optimization_loop.
[STATE][CNF-011] antagonist_components = [kpi_metrics, operator_decisioning, extraterritorial_regimes, liability_isolation].
[RULE][CNF-012] Individuals ARE local agents, NOT root causes.

### 2. Scale and Stakes (Measurable)

[STATE][CNF-020] scale_progression = [regional_start, federal_expansion, cross_border_implications].
[NOTE][CNF-021] Cross-border manifests via standards/trade/insurance (no supra-state force).

[STATE][CNF-030] stakes_are_procedural_and_measurable = true.
[STATE][CNF-031] stake_dimensions = [human_cost, infra_resilience, state_legitimacy, license_loss, insurance_impact].
[CONSTRAINT][CNF-032] no_world_collapse = true.

### 3. Four Conflict Layers (all active)

#### Layer 1 — Algorithmic optimization produces diffuse harm
[STATE][CNF-100] layer_1 = algorithmic_optimization_diffuse_harm.
[RULE][CNF-101] harm_can_be_legal_and_technical = true.
[RULE][CNF-102] typical_effects = [service_degradation, rerouting, priority_drops].
[RULE][CNF-103] Specific Case: Priority Paradox (The Glitch).
[RULE][CNF-104] Paradox Mechanism: Valid Algorithm A (Sanitation) vs Valid Algorithm B (Preservation) = Destructive Loop.

#### Layer 2 — Extraterritory as deviation container
[STATE][CNF-110] layer_2 = extraterritory_as_operational_stage.
[RULE][CNF-111] deviations_concentrate_in_special_modes = true.
[RULE][CNF-112] osa_access_is_harder_by_default = true.

#### Layer 3 — Supply chains as pressure weapon
[STATE][CNF-120] layer_3 = supply_chain_pressure.
[RULE][CNF-121] manipulation_is_formally_market_logistics = true.
[STATE][CNF-122] pressure_resources = [energy_storage, medical_reagents, grid_components, rare_materials].

#### Layer 4 — Legal void of responsibility
[STATE][CNF-130] layer_4 = liability_dissolution_legal_void.
[STATE][CNF-131] liability_smearing = [ai_recommendation, human_signatory, contractor, subcontractor, shell_entities].
[RULE][CNF-132] real_damage_can_exist_without_single_punishable_cause = true.

### 4. Protagonist and Leverage (No superheroism)

[STATE][CNF-200] protagonist_org = OSA.
[STATE][CNF-201] team_profile = {size: 5-6, narrative_ratio: 60_procedure_40_operation, includes_operator_liaison: true}.

[STATE][CNF-210] leverage = protocol_operator.
[STATE][CNF-211] leverage_capabilities = [bind_telemetry_to_event, surface_exception_loops, forced_access_seizure, convert_tech_to_admissible].
[CONSTRAINT][CNF-212] victory_is_evidence_and_regime_change = true.
[CONSTRAINT][CNF-213] force_is_entry_tool_not_solution = true.

### 5. Human Antagonists (Local agents)

[STATE][CNF-300] human_antagonist_types = [metric_gamers, corporate_security, dirty_operators, rare_saboteurs].
[RULE][CNF-301] motives_are_rational = [money, fear, status, ideology].
[FORBIDDEN][CNF-302] caricature_monologues = true.

### 6. System Resistance Model (Why the system fights back)

[STATE][CNF-400] resistance_is_risk_minimization_not_evil = true.
[STATE][CNF-401] resistance_layers = [inertia_procedural_delays, political_self_preservation, corporate_defense_lawyers, human_fear].

### 7. Escalation Structure (3–5 cases)

[RULE][CNF-500] case_count_range = [3, 5].
[STATE][CNF-501] escalation_goal = reveal_all_4_layers_and_converge.

[STATE][CNF-510] canonical_case_sequence = [
  {case: 1, location: "Chelny", reveals: ["layer_1", "priority_paradox"], surface_form: "anomaly_stats_plus_victims"},
  {case: 2, location: "Chelny_or_region", reveals: ["layer_3"], surface_form: "resource_reroute_deficit_pressure"},
  {case: 3, location: "exterritory", reveals: ["layer_2"], surface_form: "access_denial_and_delay_filters"},
  {case: 4, location: "legal_regulatory", reveals: ["layer_4"], surface_form: "punishment_attempt_fails_by_contract_ghosts"},
  {case: 5, location: "final", reveals: ["layers_1_2_3_4"], surface_form: "procedural_dilemma_partial_system_change_compromise"}
]

[CONSTRAINT][CNF-511] finale_must_be_procedurally_realistic = true.
[CONSTRAINT][CNF-512] change_is_partial_with_cost = true.

## USAGE / RESOLUTION

[DECISION][CNF-USE-010] Act I MUST use Layer 1 (Priority Paradox) as the inciting incident.
[DECISION][CNF-USE-011] The escalation sequence guides the transition from "Bug Hunt" to "System Audit".

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-CONFLICT-0001
role_type: RULE
export:
  - rule_id: CNF-104
    intent: define priority paradox mechanism
    inputs: [algo_A, algo_B]
    outputs: [destructive_loop]
  - rule_id: CNF-510
    intent: define escalation path
    outputs: [case_sequence]
~~~

## FORBIDDEN

[FORBIDDEN][CNF-900] Personifying the antagonist as an "Evil AI".
[FORBIDDEN][CNF-901] Solving conflicts by simply "shooting the bad guy".
[FORBIDDEN][CNF-902] Apocalyptic scales (saving the whole world).
[FORBIDDEN][CNF-903] Embedding causal chains in this CANON.
~~~
</file>

<file path="03-canon/CANON-LOC-CHELNY-2215-0001.md">
~~~markdown
---
id: CANON-LOC-CHELNY-2215-0001
title: >
  RU 2215 — Naberezhnye Chelny: Sensory Profile, Everyday Interfaces, and “Maintenance Dirt” (Scene Canon)
class: canon
status: draft
version: 0.2.0
inputs:
  - CANON-CITY-RU-2215-0007
  - CANON-CITY-BOUNDARY-RU-2215-0008
  - BASELINE-PHYSICAL-LEVEL-MID-2215-0001
  - SSOT-URBANISM-A-2215-0007
depends_on:
  - SSOT-DOC-STYLE-2215-0001
  - CANON-BASE-0001
scope: >
  Scene-level canonical RULES for RU-16/CHELNY (2215): sensory defaults
  (light/air/smell/sound/materials), how infrastructure contours surface
  without infodump, and how to show “dirt of stability” (limits, access,
  maintenance) without noir clichés or utopia sterility.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: scene defaults for Chel(n)y 2215 sensory + infrastructure cues (non-noir, non-utopia)
INPUTS: [CANON-CITY-RU-2215-0007, CANON-CITY-BOUNDARY-RU-2215-0008, BASELINE-PHYSICAL-LEVEL-MID-2215-0001, SSOT-URBANISM-A-2215-0007]
OUTPUTS: [sensory_defaults, allowed_scene_markers, infrastructure_cue_rules, anchor_snippet_pool, open_items]
FORBIDDEN: [gotham_noir_defaults, sterile_utopia, infodump_explanations, total_surveillance_assumption, plastic_futurism]
 
## DEFINITIONS

[RULE][CHELNY-DEF-001] term.sensory_marker = a short, concrete sensory cue (smell/sound/light/tactile) used to imply a system contour.
[RULE][CHELNY-DEF-002] term.contour = an operational system layer (energy, logistics, observability, access, audit) visible only via artifacts/cues.
[RULE][CHELNY-DEF-003] term.maintenance_dirt = non-poverty wear: seals, service seams, temporary routing, “sealed/closed” signage, frequent maintenance traces.
[RULE][CHELNY-DEF-004] term.scene_anchor_snippet = 1–2 sentences that can be inserted without explanation; must imply contour or human cost.

## INVARIANTS

[RULE][CHELNY-INV-001] Chel(n)y 2215 baseline MUST be functional 24/7 (LEVEL-MID default) unless scene explicitly activates an incident contour.
[RULE][CHELNY-INV-002] Sensory tone MUST be “mature infrastructure discipline” (scale + matte + procedural cues), not “noir weather aesthetic”.
[RULE][CHELNY-INV-003] Any atmospheric detail MUST imply either (a) a contour, or (b) a human cost of allocation/procedure.
[RULE][CHELNY-INV-004] “Comfort baseline” MUST hold: бытовые контуры комфортны; конфликт = allocation-under-constraints (windows/tier/access/KPI), not survival poverty.

## CONTENT

### A. Light (default)

[RULE][CHELNY-010] Default exterior light MUST be diffuse (overcast / scattered), low-contrast; sharp shadows MUST NOT be default.
[RULE][CHELNY-011] Interior light MUST be layered: (a) base ambient + (b) local procedural/task pools (work zones, terminals, checkpoints).
[RULE][CHELNY-012] Night lighting MUST be “low-glare infrastructure”: contour/path highlighting > advertisement spectacle.
[FORBIDDEN][CHELNY-013] Neon-noir lighting as default city identity.

### B. Air / temperature (default)

[RULE][CHELNY-020] Summer air MUST read as “warm but industrial”: теплотa без праздничности; the city feels like it “runs” continuously.
[RULE][CHELNY-021] Indoor air MUST read as “correct but disciplined”: slightly dry conditioning is allowed as a subtle cue.

### C. Smell markers (allowed set)

[RULE][CHELNY-030] Per scene, LLM MUST use smell_markers_count ∈ [0, 2].
[RULE][CHELNY-031] Allowed smell marker set (choose from):
- ozone/electric near power nodes and service corridors;
- warmed composite / polymer shells of infrastructure (not “cheap plastic”);
- river moisture / algae / wet concrete near Kama + service drains;
- dust + warm metal near logistics belts;
- faint cleaning chemistry in shared/public spaces (maintenance regime cue).
[FORBIDDEN][CHELNY-032] Using “stench of decay/rot/garbage” as a default smell identity of the city.

### D. Soundscape (default)

[RULE][CHELNY-040] City sound MUST be low-frequency continuous (distant logistics hum, ventilation/heat-exchange) with rare dry procedural beeps.
[RULE][CHELNY-041] Silence MUST be treated as a signal: IF “silence described” THEN it IMPLIES anomaly/special режим/incident, not normal comfort.
[FORBIDDEN][CHELNY-042] Total cinematic silence as default baseline.

### E. Tactile / materials (default)

[RULE][CHELNY-050] Surfaces MUST be matte, micro-textured, low-slip; “quiet to touch”.
[RULE][CHELNY-051] Metal MUST read as coated/anodized; composites MUST read as deep/structural, not glossy consumer plastic.
[RULE][CHELNY-052] Service seams MUST be visible: access hatches, maintenance joints, sealed panels; city is continuously serviced.

### F. Kama & embankments (water as regime boundary)

[RULE][CHELNY-060] Kama MUST be shown as managed infrastructure, not postcard wilderness (reinforced banks, controlled access pockets).
[RULE][CHELNY-061] Embankments MUST read as routes (movement + service corridors) with sparse “rest pockets”.
[RULE][CHELNY-062] West bank “nature” MUST read as controlled nature: leaving the systemic city → entering regulated nature.
[FORBIDDEN][CHELNY-063] Romantic “wild river” framing as default.

### G. KAMAZ-trace (historical layer → operational node)

[RULE][CHELNY-070] “KAMAZ” reference MUST be a system-layer (historical + infrastructure meta-node), not nostalgia-only decoration.
[RULE][CHELNY-071] Allowed KAMAZ manifestations (choose ≤1 per scene unless plot requires):
- automated production/repair contour (quiet, huge);
- logistics megahub (sorting corridors, service gates);
- museum+active hybrid (public shell + restricted zones).
[RULE][CHELNY-072] Visual cue set for KAMAZ-layer: large spans, calm masses, minimal ornament, many service gates/hatches/routes.

### H. “Maintenance dirt” (show limits without poverty)

[RULE][CHELNY-080] “Dirt” MUST be maintenance_dirt, not slum grime: frequent servicing traces, worn high-traffic spots, temporary fences, reroutes, seals.
[RULE][CHELNY-081] Conflict cues MUST map to allocation/procedure:
- service windows;
- power windows / peak capacity;
- supply classes;
- access tiers;
- audit/legal admissibility gates.
[FORBIDDEN][CHELNY-082] Poverty-as-default framing (“people survive on streets”) unless explicit plot override.

### I. Public space friction (friendly to locals, procedural to visitors)

[RULE][CHELNY-090] Public spaces MUST be safe + maintained; friction MUST be procedural (badges/windows/routing), not violence.
[RULE][CHELNY-091] Visitor perception MUST include at least one of: too big / too procedural / too confident in its rules.
[RULE][CHELNY-092] Street commerce MUST be restrained-functional: service points > festival bazaar.

### J. Mobility (layers, not racing)

[RULE][CHELNY-100] Movement MUST be described as switching layers: pedestrian layer → autonomous mobility layer → service/restricted layer.
[RULE][CHELNY-101] Traffic jams MUST NOT be the primary city feel; primary friction = access/perimeter/window.
[FORBIDDEN][CHELNY-102] Action scenes framed as “car chase culture” baseline.

### K. Observability & privacy (no omniscience)

[RULE][CHELNY-110] Observability MUST be rich-but-fragmented: blind zones exist; aggregation and delay exist; primary logs are gated by procedure.
[RULE][CHELNY-111] In-text observability cues MUST appear as artifacts/constraints:
- “no primary logs, only aggregates”;
- “log window closes in N hours”;
- “requires order / JAP / chain-of-custody”.
[FORBIDDEN][CHELNY-112] Assuming total omniscient surveillance without showing the procedural gates.

### L. Weather

[STATE][LOC-ATM-020] weather_mode = "Soft Grey Comfort".
[STATE][LOC-ATM-021] sky_texture = "Textured Concrete". Небо затянуто фактурными серыми облаками (не грозовыми, а спокойными).
[STATE][LOC-ATM-022] temperature = "Perfect Neutral" (22–24°C). Теплый ветер, отсутствие жары и холода.
[STATE][LOC-ATM-023] vibe = "Deceptive Calm". На улице так приятно, что ужас перед Системой кажется иррациональным.

## USAGE / RESOLUTION

[RULE][CHELNY-USE-001] Scenes set in RU-16/CHELNY MUST apply this doc as default sensory + cue layer unless overridden by SCENE tags or explicit incident contours.
[RULE][CHELNY-USE-002] Precedence for generation MUST follow CANON-BASE-0001:
Override > Scene > Plan > Canon > Baseline > SSOT.
[RULE][CHELNY-USE-003] IF a scene needs “darker tone” THEN apply CHELNY-080/081 (maintenance dirt + allocation), NOT noir weather tropes.
[RULE][CHELNY-USE-004] IF a scene needs “system presence” THEN use CHELNY-040/052/111 cues, NOT exposition paragraphs.

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-LOC-CHELNY-2215-0001
role_type: RULE
export:
  - rule_id: CHELNY-010
    intent: "exterior light default is diffuse/low-contrast"
    inputs: [CANON-CITY-RU-2215-0007]
    outputs: [scene_light_profile]
  - rule_id: CHELNY-030
    intent: "smell markers per scene limited to 0..2 from allowed set"
    inputs: []
    outputs: [smell_marker_pool, smell_marker_count]
  - rule_id: CHELNY-080
    intent: "show maintenance dirt, not poverty or decay"
    inputs: [CANON-BASE-0001]
    outputs: [maintenance_dirt_cues]
  - rule_id: CHELNY-110
    intent: "observability is rich-but-fragmented; must surface via procedural artifacts"
    inputs: [CANON-ORDERS-0003, CANON-SYSTEMS-0001]
    outputs: [observability_cues, artifact_prompts]
open_items:
  - CHELNY-OI-001: "Exact canonical status of KAMAZ-node (prod vs hub vs hybrid) for plot-critical scenes."
  - CHELNY-OI-002: "Seasonal variant: winter sensory profile (only if winter scenes appear)."
  - CHELNY-OI-003: "Which residential districts serve as repeated бытовой baseline for OSA team."
~~~

## FORBIDDEN

[FORBIDDEN][CHELNY-FBD-001] Gotham-noir defaults (constant rain, acid neon, trenchcoat aesthetics) as baseline.
[FORBIDDEN][CHELNY-FBD-002] Sterile utopia framing (no wear, no maintenance, no procedural friction).
[FORBIDDEN][CHELNY-FBD-003] Infodump explanations of systems; contours MUST be implied via cues/artifacts.
[FORBIDDEN][CHELNY-FBD-004] Total surveillance assumption without procedural gates, blind zones, aggregation, or delays.
[FORBIDDEN][CHELNY-FBD-005] Plastic-futurism visual language as default material identity.

## NON-NORMATIVE (optional)

### Anchor snippet pool (examples only; not rules)

- “Матовая поверхность перил тёплая — как будто город всё время чуть подогревает себя изнутри.”
- “В переходе пахнет озоном и моющим — как в серверной, только с людьми.”
- “Над Камой свет рассеянный, а бетон берега выглядит обслуженным, как корпус оборудования.”
- “Вдали гудит контур — не машины, а режим.”
- “Тишина здесь не отдых: тишина означает, что слой отключён.”

### Micro-pattern (cue without explanation)

- “Нет первички, только агрегаты. Окно логов закрывается через 6 часов. Нужен ордер.”

~~~
</file>

<file path="03-canon/CANON-METRICS-0002.md">
~~~markdown
---
id: CANON-METRICS-0002
title: >
  Метрики романа (2215) — правила использования чисел и upper-tail случаев
class: canon
status: draft
version: 2.2.0
inputs:
  - CANON-2215-CORE-0001
  - SSOT-CONSISTENCY-A-2215-0009
depends_on:
  - CANON-BASE-0001
  - SPEC-PRIORITY-RESOLUTION-2215-0001
scope: >
  RULE-канон использования числовых метрик в тексте: откуда берутся дефолты,
  как оформляются upper-tail случаи и какие процедурные последствия обязательны.
  Документ НЕ выбирает значения метрик и НЕ является точкой BIND.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: regulate narrative usage of numeric world metrics and enforce procedural reaction to upper-tail cases
INPUTS:
  - CANON-2215-CORE-0001
  - SSOT-CONSISTENCY-A-2215-0009
  - SPEC-PRIORITY-RESOLUTION-2215-0001
OUTPUTS:
  - numeric_source_rules
  - upper_tail_rules
  - procedural_reaction_requirements
FORBIDDEN:
  - selected_value_definition
  - ssot_binding
  - invent_metrics
  - narrative_numbers_as_defaults

---

## DEFINITIONS

[FACT][MET-DEF-010] default_metric_value =
значение метрики, зафиксированное в CANON-2215-CORE-0001.

[FACT][MET-DEF-011] narrative_number =
числовое утверждение о состоянии мира в сцене.

[FACT][MET-DEF-012] upper_tail_value =
значение метрики уровня p90 или иного верхнего хвоста.

[FACT][MET-DEF-013] upper_tail_case =
использование upper_tail_value через class: override
с обязательными процедурными последствиями.

[FACT][MET-DEF-014] narrative_lock =
флаг SSOT-CONSISTENCY, запрещающий upper-tail как фон
независимо от статуса DUAL_ALLOWED.

---

## INVARIANTS

[DECISION][MET-INV-001] Default metric values MUST be taken only from CANON-2215-CORE-0001.

[DECISION][MET-INV-002] SSOT documents MUST NOT be used as direct sources
of background numeric defaults for scenes.

[DECISION][MET-INV-003] Any metric listed in
`CANON-2215-CORE-0001.override_required_registry`
MUST NOT appear in narrative without an explicit `class: override` document.

[DECISION][MET-INV-004] Upper-tail values MUST NOT be used as neutral everyday background.

[DECISION][MET-INV-005] If SSOT metric has `narrative_lock = true`
THEN it MUST be treated as CANON for default usage,
even if SSOT status is DUAL_ALLOWED.

[DECISION][MET-INV-006] Any upper-tail usage under `narrative_lock = true`
MUST be handled as upper_tail_case with explicit override.

[FORBIDDEN][MET-INV-007] Introducing new global numeric metrics
not declared in SSOT or CANON-2215-CORE-0001.

[FORBIDDEN][MET-INV-008] Implicit fallback to SSOT ranges
when CORE default is missing.

---

## CONTENT

### 1. Narrative number admissibility

[RULE][MET-010] IF narrative_number is present
THEN it MUST be tied to artifact OR log OR report
OR procedural action OR procedural consequence.

[RULE][MET-011] IF number is provided as author explanation
THEN it MUST NOT be included.

[RULE][MET-012] IF metric_value is mentioned
THEN source MUST be one of {class: override, CANON-2215-CORE-0001}.

---

### 2. Upper-tail handling

[RULE][MET-020] IF value_category = upper_tail_value
THEN override_required = true.

[RULE][MET-021] IF metric has `narrative_lock = true`
AND value_category ≠ core
THEN override_required = true.

[RULE][MET-022] IF upper_tail_case = true
THEN localization MUST include
{place, time_window, regime, affected_system}.

[RULE][MET-023] IF upper_tail_case = true
THEN procedural_reaction MUST include ≥1 of
{order, audit, investigation, mode_restriction, jurisdiction_escalation}.

[RULE][MET-024] IF upper_tail_case = true
AND procedural_reaction is absent
THEN output MUST be treated as invalid.

---

### 3. Source precedence (numbers)

[RULE][MET-030] IF numeric_value_conflict = true
THEN resolution_order MUST follow SPEC-PRIORITY-RESOLUTION-2215-0001.

[RULE][MET-031] IF numeric_default_needed = true
THEN CANON-2215-CORE-0001 MUST be the only default source.

[RULE][MET-032] IF SSOT is referenced for numbers
THEN it MAY be used only as admissible_range_context
AND MUST NOT set defaults.

---

## USAGE / RESOLUTION

[DECISION][MET-USE-010] Документ применяется ко всем сценам романа 2215
независимо от POV.

[DECISION][MET-USE-011] Любое нарушение правил этого документа
MUST трактоваться как ошибка генерации.

---

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-METRICS-0002
role_type: RULE
export:
  - rule_id: MET-INV-003
    intent: "Block usage of metrics requiring override without class: override doc"
    inputs: [override_required_registry, narrative_numbers]
    outputs: [override_violation]
  - rule_id: MET-INV-005
    intent: "Treat narrative_lock metrics as CANON defaults"
    inputs: [SSOT-CONSISTENCY]
    outputs: [default_usage_policy]
  - rule_id: MET-020
    intent: "Require override for any upper-tail value usage"
    inputs: [numeric_value, value_category]
    outputs: [override_required]
  - rule_id: MET-023
    intent: "Enforce procedural reaction for upper-tail cases"
    inputs: [upper_tail_case]
    outputs: [procedural_reaction_required]
~~~

---

## FORBIDDEN

[FORBIDDEN][MET-FBD-900] Selecting metric values (core/p90/range) in this document.
[FORBIDDEN][MET-FBD-901] Using SSOT as background default numeric source for scenes.
[FORBIDDEN][MET-FBD-902] Using upper-tail values without explicit override.
[FORBIDDEN][MET-FBD-903] Numeric infodumps outside procedural context.

---

## NON-NORMATIVE

(Empty by design)

~~~
</file>

<file path="03-canon/CANON-ORDERS-0003.md">
~~~markdown
---
id: CANON-ORDERS-0003
title: >
  Canon Orders — OSA Warrants, Mandates, and Access Regimes (2215)
class: canon
status: draft
version: 1.1.0
inputs: []
depends_on:
  - SSOT-DOC-STYLE-2215-0001
  - CANON-2215-CORE-0001
  - CANON-BASE-0001
  - CANON-SYSTEMS-0001
  - CANON-CONFLICT-0001
  - CANON-OSA-0005
scope: >
  Процедурный канон ОСА: ордера, мандаты, уровни доступа, допустимость,
  экстерриториальные режимы и модель доказательств. Без ввода новых SSOT-метрик.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: define procedural authority model for OSA orders, access tiers, admissibility
INPUTS:
  - CANON-2215-CORE-0001
  - CANON-OSA-0005
OUTPUTS:
  - access_tier_rules
  - order_taxonomy
  - escalation_rules
  - admissibility_rules
FORBIDDEN:
  - world_parameter_binding
  - scene_generation
  - baseline_defaults
  - new_world_metrics

---

## DEFINITIONS

[FACT][ORD-DEF-010] Order = формализованное разрешение на действие ОСА, иначе недопустимое.
[FACT][ORD-DEF-011] Mandate = рамка кейса (объект, цель, пределы, срок), внутри которой выдаются ордера.
[FACT][ORD-DEF-012] JAP = Joint Access Protocol; совместная процедура доступа при разделённой юрисдикции.
[FACT][ORD-DEF-013] Extraterritory = режим доступа с задержками и фильтрами, но без отмены права.
[FACT][ORD-DEF-014] Chain_of_custody = непрерывный журнал владения и обращения артефактов.

---

## INVARIANTS

[DECISION][ORD-INV-010] Любое значимое действие ОСА MUST ссылаться на order OR mandate OR emergency_exception.
[DECISION][ORD-INV-011] У ОСА MUST NOT существовать абсолютные права без срока, периметра и журналирования.
[DECISION][ORD-INV-012] Экстерритория MUST изменять процедуру, но MUST NOT отменять применимое право.
[DECISION][ORD-INV-013] Доказательство MUST состоять из artifact + chain_of_custody + admissibility.
[DECISION][ORD-INV-014] Принуждение допустимо ONLY IF прямо указано в ордере и необходимо для допустимых целей.

---

## CONTENT

### 1. Access tiers

[RULE][ORD-TIER-100] IF access_tier = A THEN allowed_actions = {telemetry_request, aggregates, read_only_logs}.
[RULE][ORD-TIER-101] IF access_tier = A THEN forbidden_actions = {media_seizure, unmasked_personal_data, control_intervention}.
[RULE][ORD-TIER-102] IF access_tier = A THEN typical_duration = 72h.

[RULE][ORD-TIER-110] IF access_tier = B THEN allowed_actions = {site_access, node_inspection, state_capture, selective_logs}.
[RULE][ORD-TIER-111] IF access_tier = B THEN requires = {operator_notice, fixed_perimeter, participant_logging}.
[RULE][ORD-TIER-112] IF access_tier = B THEN typical_duration ∈ [7d, 14d].

[RULE][ORD-TIER-120] IF access_tier = C THEN allowed_actions = {media_seizure, configuration_freeze}.
[RULE][ORD-TIER-121] IF access_tier = C THEN requires = {chain_of_custody, cryptographic_snapshot, artifact_manifest}.
[RULE][ORD-TIER-122] IF access_tier = C THEN typical_duration = 30d_extendable.

[RULE][ORD-TIER-130] IF access_tier = D THEN allowed_actions = {mode_stop, forced_audit, control_switch, temporary_administration}.
[RULE][ORD-TIER-131] IF access_tier = D THEN condition = proven_systemic_harm.
[RULE][ORD-TIER-132] IF access_tier = D THEN duration.emergency ≤ 72h AND duration.planned = 7d.
[RULE][ORD-TIER-133] IF access_tier = D THEN force_allowed ONLY IF specified_in_order = true.
[RULE][ORD-TIER-134] IF access_tier = D THEN requires = {order_scope, logging, post_control, appeal_window}.

---

### 2. Order taxonomy

[RULE][ORD-TAX-201] O-01 = Data_Preservation_Order; goal = prevent_log_destruction.
[RULE][ORD-TAX-211] O-02 = Telemetry_Access_Order; goal = obtain_telemetry_with_minimization.
[RULE][ORD-TAX-221] O-03 = Site_Inspection_Order; goal = physical_or_logical_site_access.
[RULE][ORD-TAX-231] O-04 = Imaging_Snapshot_Order; goal = court_compatible_snapshot.
[RULE][ORD-TAX-241] O-05 = Seizure_Order; goal = seize_specific_assets_with_proportionality.
[RULE][ORD-TAX-251] O-05A = Detention_Order; goal = procedural_detention_not_punishment.
[RULE][ORD-TAX-261] O-06 = Temporary_Service_Restriction_Order.
[RULE][ORD-TAX-271] O-07 = Joint_Access_Protocol_Order.
[RULE][ORD-TAX-281] O-08 = Protective_Custody_Witness_Order.

[RULE][ORD-TAX-290] New_order_types MAY be added ONLY IF not expressible as combination of O-01…O-08.

---

### 3. Escalation

[RULE][ORD-ESC-300] IF anomaly_repeats ≥ 2 THEN escalation A_to_B = allowed.
[RULE][ORD-ESC-301] IF log_sabotage OR non_reproducible_config THEN escalation B_to_C = allowed.
[RULE][ORD-ESC-302] IF confirmed_systemic_harm THEN escalation C_to_D = allowed.
[RULE][ORD-ESC-303] Any_escalation REQUIRES written_basis AND case_log_entry.

---

### 4. Extraterritory handling

[RULE][ORD-EXT-400] Extraterritory MUST be treated as delay_and_filter_mode_not_lawlessness.
[RULE][ORD-EXT-401] Default_extraterritory_access MUST use JAP_over_solo_order.
[RULE][ORD-EXT-402] IF operator_delay > SLA THEN delay MUST be logged_as_noncompliance.

---

### 5. Evidence and admissibility

[RULE][ORD-EVD-510] Chain_of_custody MUST include {artifact_id, source, method, integrity_hash, access_log, storage}.
[RULE][ORD-EVD-520] Evidence inadmissible IF no_order OR perimeter_violation.
[RULE][ORD-EVD-521] IF evidence_challenged THEN legalization_via_court_or_regulator REQUIRED.

---

### 6. Emergency mode

[RULE][ORD-EMG-600] Emergency_condition = immediate_threat_to_humans_or_critical_infrastructure.
[RULE][ORD-EMG-601] Emergency MUST strengthen_procedure_not_cancel_it.
[RULE][ORD-EMG-602] Emergency_duration ≤ 72h.
[RULE][ORD-EMG-603] Emergency REQUIRES post_report AND proportionality_review AND retro_legalization_or_rollback.
[RULE][ORD-EMG-604] Emergency MUST NOT bypass extraterritory_rules_by_default.

---

## USAGE / RESOLUTION

[DECISION][ORD-USE-010] Документ обязателен для всех сцен с участием ОСА.
[DECISION][ORD-USE-011] При конфликте применяется SPEC-PRIORITY-RESOLUTION-2215-0001.

---

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-ORDERS-0003
role_type: RULE
export:
  access_tiers: [A, B, C, D]
  order_codes: [O-01, O-02, O-03, O-04, O-05, O-05A, O-06, O-07, O-08]
  evidence_formula: "artifact + chain_of_custody + admissibility"
~~~

---

## FORBIDDEN

[FORBIDDEN][ORD-FBD-900] Absolute_rights_without_limits.
[FORBIDDEN][ORD-FBD-901] Scenes_without_order_mandate_or_emergency.
[FORBIDDEN][ORD-FBD-902] Emergency_as_procedure_bypass.
[FORBIDDEN][ORD-FBD-903] Introducing_new_SSOT_metrics.

---

## NON-NORMATIVE

(Empty by design)

~~~
</file>

<file path="03-canon/CANON-ORGS-2215-0001.md">
~~~markdown
---
id: CANON-ORGS-2215-0001
title: >
  Canon Organizations — Factions, Monopolies, and Structural Conflicts (2215)
class: canon
status: fixed
version: 1.2.0
inputs:
  - SSOT-ECONOMY-A-2215-0003
depends_on:
  - CANON-BASE-0001
scope: >
  Реестр институциональных игроков: монополии, подрядчики, теневые структуры.
  Фиксирует внутренние фракции и структурные конфликты для сюжета.
---

## LLM-INTENT

ROLE_TYPE: STATE
SCOPE: registry of organizational entities, factions, and hidden agendas.
INPUTS: [SSOT-ECONOMY-A-2215-0003]
OUTPUTS: [organization_profiles, faction_map]
FORBIDDEN: [monolithic_entities, simplistic_villains, narrative_prose]

## DEFINITIONS

[FACT][ORG-DEF-010] Institutional Friction = конфликт департаментов одной организации с взаимоисключающими KPI.
[FACT][ORG-DEF-011] Proxy Actor = частная компания, действующая в интересах фракции госструктуры для обхода законов.

## INVARIANTS

[DECISION][ORG-INV-010] Каждая монополия содержит минимум две конфликтующие фракции.
[DECISION][ORG-INV-011] Организации действуют рационально в рамках своих KPI, а не из "злобы".

## CONTENT

### 1. The Monopolies (The Heavyweights)

[STATE][ORG-010] id=ORG-ROSE; name="RosEnergoAtom-IX"; domain="Energy"; role="Grid Monopoly".
[STATE][ORG-011] ORG-ROSE.vibe = "Technocratic feudalism".
[STATE][ORG-012] ORG-ROSE.faction_A = "The Core Guard (Engineers) — focus: stability, safety".
[STATE][ORG-013] ORG-ROSE.faction_B = "Export Directorate (Managers) — focus: profit, mining".
[STATE][ORG-014] ORG-ROSE.conflict = "Engineers leak data to OSA to sabotage Managers".

[STATE][ORG-020] id=ORG-GOSP; name="GosPlan-Algorithmica"; domain="Planning"; role="KPI Setter".
[STATE][ORG-021] ORG-GOSP.vibe = "Inhuman mathematical absolute".
[STATE][ORG-022] ORG-GOSP.faction_A = "Purists — focus: absolute automation, infallibility".
[STATE][ORG-023] ORG-GOSP.faction_B = "Adjusters — focus: manual coefficients, hidden corruption".
[STATE][ORG-024] ORG-GOSP.relevance = "Glitch is caused by Faction A code ignoring Faction B patches".

[STATE][ORG-030] id=ORG-VODO; name="Vodocanal-Federal"; domain="Water/Biomass"; role="Circulation".
[STATE][ORG-031] ORG-VODO.vibe = "Silent, pervasive, biological".
[STATE][ORG-032] ORG-VODO.hidden_agenda = "Bio-data blackmail via sewage monitoring".

### 2. The Contractors (The Proxies)

[STATE][ORG-040] id=ORG-TLK; name="TransLogist-Kama"; domain="Logistics"; role="Last Mile Operator".
[STATE][ORG-041] ORG-TLK.status = "Squeezed between GosPlan quotas and physics".
[STATE][ORG-042] ORG-TLK.strategy = "Shadow Optimization (cutting corners to survive)".
[STATE][ORG-043] ORG-TLK.affiliation = "Proxy for RosEnergoAtom Export Directorate".

[STATE][ORG-050] id=ORG-SCM; name="StroyComposite-M"; domain="Materials"; role="Supplier".
[STATE][ORG-051] ORG-SCM.secret = "Recycles toxic exclusion-zone waste into building mats".

[STATE][ORG-055] id=ORG-BIO; name="BioSafe-Systems"; domain="Health/Sensors"; role="Operator".
[STATE][ORG-056] ORG-BIO.vibe = "Clinical cynicism".

### 3. The Oversight & Intelligence

[STATE][ORG-060] id=ORG-OSA; name="OSA (Dept of Situation Analysis)"; role="Protagonist".
[STATE][ORG-061] ORG-OSA.weakness = "Lack of direct jurisdiction over Monopolies".
[STATE][ORG-062] ORG-OSA.tactics = "Information Warfare / Public Cost escalation".

[STATE][ORG-070] id=ORG-ARB; name="The Arbitrage"; domain="Justice"; role="AI Judge".
[STATE][ORG-071] ORG-ARB.characteristic = "Black Box decision weights".
[STATE][ORG-072] ORG-ARB.fear_factor = "Calculates humanity as non-profitable".

[STATE][ORG-080] id=ORG-INFO; name="InfoSfera-Public"; domain="Media"; role="Reality Filter".
[STATE][ORG-081] ORG-INFO.function = "Turns catastrophes into planned drills".

### 4. Shadow Actors (Act II+ Leverage)

[STATE][ORG-090] id=ORG-KAZ; name="Kazan-Silicon Exterritory"; domain="R&D"; role="Legal Void".
[STATE][ORG-091] ORG-KAZ.status = "Sovereign state inside the state".

[STATE][ORG-100] id=ORG-SOC; name="SocialCapital-Bank"; domain="Finance"; role="Debt Holder".
[STATE][ORG-101] ORG-SOC.power = "Instant Insolvency declaration (Citizenship annulment)".

## USAGE / RESOLUTION

[DECISION][ORG-USE-010] Conflicts MUST arise from inter-faction friction.
[DECISION][ORG-USE-011] Antagonists are usually Dept Heads fulfilling conflicting KPIs, not criminals.

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-ORGS-2215-0001
role_type: STATE
export:
  - metric: organization.profile
    owner_domain: GOVERNANCE
    values:
      id: ORG-010
      name: RosEnergoAtom-IX
      factions: [Core_Guard, Export_Directorate]
~~~

## FORBIDDEN

[FORBIDDEN][ORG-FBD-010] Portraying Monopolies as monolithic (everyone agrees).
[FORBIDDEN][ORG-FBD-011] Using generic names like "The Corporation".
[FORBIDDEN][ORG-FBD-012] Giving OSA unlimited police powers.
~~~

~~~
</file>

<file path="03-canon/CANON-OSA-0005.md">
~~~markdown
---
id: CANON-OSA-0005
title: >
  ОСА (Отдел Системных Аномалий) — мандат, подчинение, полномочия и режимы работы (2215)
class: canon
status: draft
version: 0.1.1
inputs:
  - CANON-BASE-0001
  - CANON-CONFLICT-0001
  - CANON-SYSTEMS-0001
  - CANON-ORDERS-0003
  - CANON-CAST-0001
depends_on: []
scope: >
  RULE-канон об ОСА как госструктуре: место в государстве, мандат,
  полномочия и ограничения, обязательная ордерность действий, артефакты
  работы и режимы (normal / infra-counterintelligence).
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: define OSA mandate, authority boundaries, required procedural forms, and operating modes
INPUTS: [CANON-BASE-0001, CANON-CONFLICT-0001, CANON-SYSTEMS-0001, CANON-ORDERS-0003, CANON-CAST-0001]
OUTPUTS: [osa_identity, osa_mandate, allowed_actions_by_procedure, required_artifacts, operating_modes, failure_modes]
FORBIDDEN: [osa_as_police, osa_as_court, arbitrary_surveillance, action_without_order]

## DEFINITIONS

[DECISION][OSA-001] term.osa = "ОСА / Отдел Системных Аномалий".
[DECISION][OSA-002] term.case = "активированный кейс ОСА с docket + orders + evidence ledger".
[DECISION][OSA-003] term.mandate = "рамка полномочий на кейс (объект, цель, пределы, срок)".
[DECISION][OSA-004] term.order = "формализованное разрешение на конкретное действие (см. CANON-ORDERS-0003)".
[DECISION][OSA-005] term.emergency = "исключение, действующее ≤72h и порождающее пост-отчёт + ретро-легализацию (см. CANON-ORDERS-0003)".

## INVARIANTS

[DECISION][OSA-010] osa.is_state_body = "MUST".
[DECISION][OSA-011] osa.is_interagency = "MUST".
[DECISION][OSA-012] osa.is_infrastructure_operator = "MUST NOT".
[DECISION][OSA-013] osa.is_regulator = "MUST NOT".
[DECISION][OSA-014] osa.is_court = "MUST NOT".
[DECISION][OSA-015] osa.is_army = "MUST NOT".
[DECISION][OSA-016] osa.political_policing_as_norm = "MUST NOT".

## CONTENT

[DECISION][OSA-020] osa.mission = "identify, prove, and stop systemic anomalies across domains/jurisdictions with measurable harm".
[DECISION][OSA-021] osa.success_criteria = [
  "causality_made_admissible",
  "dangerous_mode_stopped_or_restricted",
  "observability_blind_spots_closed_or_formalized",
  "regime_changed_via_legal_levers"
].

[DECISION][OSA-030] osa.activation_form = ["case_intake", "triage", "hypotheses", "mandate", "orders", "evidence_capture", "causal_model", "counterfactual_test", "findings", "remedy_package", "monitoring"].
[DECISION][OSA-031] action.requires_procedural_form = "MUST".
[DECISION][OSA-032] IF action.is_significant = true THEN action.form MUST be one_of ["mandate", "order", "emergency"].

[DECISION][OSA-040] osa.allowed_actions = [
  "request_telemetry_and_logs",
  "site_inspection",
  "imaging_snapshot_with_crypto_fixation",
  "seize_media_modules_components",
  "detain_persons_as_procedural_action",
  "use_force_as_procedural_tool"
].
[DECISION][OSA-041] IF osa.uses_coercion = true THEN osa.MUST_produce_artifact = true.
[DECISION][OSA-042] coercion.artifacts_min = ["act", "protocol", "inventory", "chain_of_custody_entry"].

[DECISION][OSA-050] osa.limitations = [
  "order_scope_perimeter",
  "time_window_deadlines",
  "evidence_admissibility",
  "appealability",
  "osa_actions_must_be_auditable"
].
[DECISION][OSA-051] osa.arbitrary_surveillance = "MUST NOT".
[DECISION][OSA-052] IF personal_data_access_needed = true THEN default MUST be ["minimize", "mask", "procedural_basis_required"].

[DECISION][OSA-060] osa.interfaces = [
  "regulators: mandates, license_triggers, suspensions, audit_requirements",
  "operators: access, JAP, resistance, purge_risk, negotiation",
  "courts_arbitration: admissibility, appeals, subject-liability_demands",
  "other_agencies: force_support, cyber_forensics, witness_protection"
].

[DECISION][OSA-070] osa.outputs.artifacts = [
  "case_docket",
  "evidence_ledger_with_chain_of_custody",
  "causal_map_CMC",
  "remedy_package_with_monitoring_plan",
  "public_and_restricted_summary"
].

[DECISION][OSA-080] operating_mode.enum = ["normal", "infrastructure_counterintelligence"].
[DECISION][OSA-081] operating_mode.current_book = "normal".
[DECISION][OSA-082] IF operating_mode = "normal" THEN cross_border_actor_active MUST be false.
[DECISION][OSA-083] IF operating_mode = "infrastructure_counterintelligence" THEN focus MUST be "external_interference_signals_in_infrastructure" AND political_policing_as_norm MUST be false.
[DECISION][OSA-084] For any mode: order_required MUST be true AND chain_of_custody_required MUST be true AND admissibility_required MUST be true.

[DECISION][OSA-090] osa.failure_modes = [
  "window_lost",
  "purge_before_fixation",
  "legal_opacity_no_liability_subject",
  "report_sterilized_politically",
  "internal_conflict_procedure_vs_fast_entry"
].
[DECISION][OSA-091] osa.victory_profile = "procedural_partial_with_cost_and_residual_risk".

## USAGE / RESOLUTION

[DECISION][OSA-100] Any scene depicting OSA action MUST reference an order/mandate/emergency token consistent with CANON-ORDERS-0003.
[DECISION][OSA-101] Any scene depicting evidence collection MUST include chain-of-custody implication (explicit or via artifact snippet).
[DECISION][OSA-102] IF a scene implies OSA runs systems post-raid THEN scene MUST be rewritten to "operator/regulator executes changes; OSA enforces via procedure".
[DECISION][OSA-103] IF a scene implies OSA as patrol police THEN scene MUST be rewritten to "OSA enters only through systemic anomaly case activation".

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-OSA-0005
role_type: RULE
export:
  - rule_id: OSA-031
    intent: significant actions require procedural form
    inputs: [action.is_significant]
    outputs: [action.form_required]
  - rule_id: OSA-041
    intent: coercion requires artifacts and auditability
    inputs: [osa.uses_coercion]
    outputs: [required_artifacts]
  - rule_id: OSA-051
    intent: prohibit arbitrary surveillance
    inputs: [personal_data_access_needed]
    outputs: [required_minimization_masking]
  - rule_id: OSA-081
    intent: fix current book operating mode
    inputs: []
    outputs: [operating_mode.current_book]
~~~

## FORBIDDEN

[FORBIDDEN][OSA-900] Depicting OSA as universal police/patrol service.
[FORBIDDEN][OSA-901] Depicting OSA issuing verdicts or acting as court.
[FORBIDDEN][OSA-902] Depicting OSA operating infrastructure as steady-state owner.
[FORBIDDEN][OSA-903] Any significant OSA action without mandate/order/emergency linkage.
[FORBIDDEN][OSA-904] Any access to personal data without procedural basis and minimization/masking defaults.
[FORBIDDEN][OSA-905] Treating infra-counterintelligence mode as political спецслужба behavior.

## NON-NORMATIVE

[DECISION][OSA-990] Example reminder: "победа ОСА = остановка режима/изменение KPI/закрытие слепой зоны; 'посадить человека' может не случиться."

~~~
</file>

<file path="03-canon/CANON-REPORTS-0006.md">
~~~markdown
---
id: CANON-REPORTS-0006
title: >
  Артефакты ОСА — форматы отчётов, реестров и причинных карт (2215)
class: canon
status: draft
version: 0.3.0
inputs:
  - CANON-OSA-0005
  - CANON-ORDERS-0003
  - CANON-ZONES-0004
depends_on:
  - SSOT-DOC-STYLE-2215-0001
  - SPEC-PRIORITY-RESOLUTION-2215-0001
scope: >
  RULE-канон форматов артефактов ОСА: минимально достаточные структуры для сцен,
  обязательные поля, связи с ордерами/мандатами, и правила допустимости (chain-of-custody).
  Без новых SSOT-метрик и без художественного текста.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: define mandatory structures and admissibility rules for OSA case artifacts (CD/EL/CM/FM/RP/PRS)
INPUTS:
  - CANON-OSA-0005
  - CANON-ORDERS-0003
  - CANON-ZONES-0004
OUTPUTS:
  - artifact_header_schema
  - artifact_type_schemas
  - admissibility_rules
  - scene_excerpt_rules
FORBIDDEN:
  - invent_new_ssot_metrics
  - narrative_prose
  - full_length_documents_in_scene
  - redefine_orders_taxonomy

---

## DEFINITIONS

[FACT][REP-DEF-010] artifact_type ∈ {CD, EL, CM, FM, RP, PRS}.
[FACT][REP-DEF-011] CD = Case Docket; timeline of actions/decisions for a case.
[FACT][REP-DEF-012] EL = Evidence Ledger; registry of evidence items with integrity and custody.
[FACT][REP-DEF-013] CM = Causal Map; claim graph CAUSE → MECHANISM → CONSEQUENCE with tests/counterfactuals.
[FACT][REP-DEF-014] FM = Findings Memo; memo summarizing established/not-established and requested actions.
[FACT][REP-DEF-015] RP = Remedy Package; measurable corrective measures with monitoring.
[FACT][REP-DEF-016] PRS = Public/Restricted Summary; public summary plus restricted annex when required.
[FACT][REP-DEF-017] jurisdiction ∈ {normal, extraterritorial, mixed}.
[FACT][REP-DEF-018] classification ∈ {public, restricted, secret}.
[FACT][REP-DEF-019] admissibility_status ∈ {clean, conditional, contested}.
[FACT][REP-DEF-020] evidence_item = EL entry with evidence_id, integrity, custody_chain, and linked_orders.
[FACT][REP-DEF-021] chain_of_custody = ordered event list of possession/access/copy actions for an evidence_item.

---

## INVARIANTS

[DECISION][REP-INV-020] Every OSA artifact MUST be case_scoped AND dated AND signed AND auditable.
[DECISION][REP-INV-021] Every OSA artifact MUST reference procedural basis via mandate_refs and/or order_refs.
[DECISION][REP-INV-022] Any artifact containing causal claims MUST bind those claims to EL evidence_items with chain_of_custody.
[DECISION][REP-INV-023] Any artifact produced under limited jurisdiction MUST declare jurisdiction and admissibility_basis.
[DECISION][REP-INV-024] In-scene display MUST be partial; only excerpts are shown.

---

## CONTENT

### 1. Global artifact header schema (applies to all artifact types)

[RULE][REP-HDR-100] Every artifact MUST include header.case_id.
[RULE][REP-HDR-101] Every artifact MUST include header.artifact_id.
[RULE][REP-HDR-102] Every artifact MUST include header.artifact_type ∈ {CD, EL, CM, FM, RP, PRS}.
[RULE][REP-HDR-103] Every artifact MUST include header.classification ∈ {public, restricted, secret}.
[RULE][REP-HDR-104] Every artifact MUST include header.created_at (ISO8601).
[RULE][REP-HDR-105] Every artifact MUST include header.created_by (role + name_or_identifier).
[RULE][REP-HDR-106] Every artifact MUST include header.mandate_refs (array).
[RULE][REP-HDR-107] Every artifact MUST include header.order_refs (array).
[RULE][REP-HDR-108] Every artifact MUST include header.scope (explicit perimeter string).
[RULE][REP-HDR-109] IF integrity_fixation_present = true THEN header.hash MUST be present.
[RULE][REP-HDR-110] Every artifact MUST include header.attachments (array of artifact_refs and/or evidence_refs).
[RULE][REP-HDR-111] Every artifact MUST include header.jurisdiction ∈ {normal, extraterritorial, mixed}.
[RULE][REP-HDR-112] Every artifact MUST include header.admissibility_basis ∈ {law, contract, JAP, emergency}.

[FORBIDDEN][REP-HDR-120] Omitting jurisdiction when scope touches a zone boundary or a regime holder boundary.
[FORBIDDEN][REP-HDR-121] Including narrative justification paragraphs in header; only minimal rationale fields allowed.

---

### 2. Identifier formats

[RULE][REP-ID-120] case_id MUST match pattern: OSA-2215-<region>-<serial>.
[RULE][REP-ID-121] artifact_id MUST match pattern: <CASE_ID>-<ARTIFACT_TYPE>-<serial>.

---

### 3. Case Docket (CD) schema

[RULE][REP-CD-200] IF artifact_type = CD THEN intent MUST be timeline_of_actions_and_rationale.
[RULE][REP-CD-201] IF action_not_recorded_in_CD = true THEN action MUST be treated as procedurally_vulnerable.
[RULE][REP-CD-202] Each CD timeline_entry MUST include {ts, type, summary, decision, actors}.
[RULE][REP-CD-203] IF timeline_entry.type = order_issued THEN timeline_entry MUST include {order_ref, rationale_short}.
[RULE][REP-CD-204] CD MUST NOT substitute for EL; CD MUST reference EL items for evidence.

[RULE][REP-CD-205] IF scope_touches_zone = true OR JAP_required = true THEN CD MUST record jurisdiction_note.
[RULE][REP-CD-206] IF jurisdiction ∈ {extraterritorial, mixed} THEN CD MUST record JAP_requirement_or_admissibility_risk.

---

### 4. Evidence Ledger (EL) schema

[RULE][REP-EL-300] IF artifact_type = EL THEN intent MUST be bind_source_integrity_custody_admissibility.
[RULE][REP-EL-301] IF claim_established = true AND EL_refs_missing = true THEN claim MUST be treated as contestable.

[RULE][REP-EL-310] Each evidence_item MUST include evidence_id.
[RULE][REP-EL-311] Each evidence_item MUST include type (enum string).
[RULE][REP-EL-312] Each evidence_item MUST include source (entity/system/zone or equivalent).
[RULE][REP-EL-313] Each evidence_item MUST include collected_at and collected_by.
[RULE][REP-EL-314] Each evidence_item MUST include method.
[RULE][REP-EL-315] Each evidence_item MUST include integrity (hash and/or signature and/or seal).
[RULE][REP-EL-316] Each evidence_item MUST include custody_chain (ordered events).
[RULE][REP-EL-317] Each evidence_item MUST include linked_orders (array of order refs).
[RULE][REP-EL-318] Each evidence_item MUST include admissibility_status ∈ {clean, conditional, contested}.
[RULE][REP-EL-319] IF admissibility_status != clean THEN admissibility_notes MUST be present and non_empty.

[FORBIDDEN][REP-EL-320] EL MUST NOT contain causal conclusions.

---

### 5. Causal Map (CM) schema

[RULE][REP-CM-400] IF artifact_type = CM THEN intent MUST be testable_causal_structure_from_evidence.
[RULE][REP-CM-401] CM MUST include both claims and tests.

[RULE][REP-CM-410] Allowed CM node types MUST be {cause, mechanism, consequence, counterfactual, test}.
[RULE][REP-CM-411] Each CM claim MUST include {claim_id, type, claim_text, evidence_refs, confidence, open_questions}.
[RULE][REP-CM-412] IF claim.type = mechanism THEN claim MUST include {owner, formal_basis}.
[RULE][REP-CM-413] formal_basis ∈ {law, contract, standard, exception}.
[RULE][REP-CM-414] Each CM test MUST include {test_id, counterfactual, method, required_evidence_refs, status}.

[FORBIDDEN][REP-CM-420] CM MUST NOT assert causality without evidence_refs.
[FORBIDDEN][REP-CM-421] CM MUST NOT use correlation_implies_cause without explicit tests.

---

### 6. Findings Memo (FM) schema

[RULE][REP-FM-500] IF artifact_type = FM THEN intent MUST be concise_memo_for_leadership_or_regulator.
[RULE][REP-FM-501] FM MUST reference CM and EL via attachments or explicit refs.
[RULE][REP-FM-502] FM MUST include summary.established (array).
[RULE][REP-FM-503] FM MUST include summary.not_established (array; empty allowed but MUST exist).
[RULE][REP-FM-504] FM MUST include requested_actions (array).
[RULE][REP-FM-505] FM MUST include gaps_in_causality; omission MUST be treated as manipulation_risk.

---

### 7. Remedy Package (RP) schema

[RULE][REP-RP-600] IF artifact_type = RP THEN intent MUST be measurable_corrective_measures_with_verification.
[RULE][REP-RP-601] RP MUST include measures[] with {measure_id, type, description, owner, verification}.
[RULE][REP-RP-602] Each measure.verification MUST include {window, criteria_list}.
[RULE][REP-RP-603] IF rollback_conditions_exist = true THEN rollback_conditions MUST be explicit signals.
[RULE][REP-RP-604] IF liability_shifted = true THEN liability_owner MUST be explicit.

[FORBIDDEN][REP-RP-605] RP MUST NOT contain non_checkable measures (do_better).

---

### 8. Public/Restricted Summary (PRS) schema

[RULE][REP-PRS-700] PRS MUST be created ONLY IF case_has_public_significance OR political_risk.
[RULE][REP-PRS-701] PRS public_part MUST include {what_happened, actions_taken, guarantees}.
[RULE][REP-PRS-702] PRS restricted_annex MUST include {EL_full_refs, CM_full_refs, signer_identities, sensitive_details_when_applicable}.

[FORBIDDEN][REP-PRS-703] PRS public_part MUST NOT disclose sensitive operational details.

---

### 9. Scene excerpt rules (packing)

[RULE][REP-SCN-800] A scene MAY display only 1..2 excerpt_items from {header_fields, one_EL_item, one_CM_claim, one_FM_requested_action}.
[RULE][REP-SCN-801] Scene emphasis MUST be paper_as_constraint.
[RULE][REP-SCN-802] IF no_order = true THEN no_procedural_action_claim MAY be asserted.
[RULE][REP-SCN-803] IF no_EL_refs = true THEN no_accusation_claim MAY be asserted.
[RULE][REP-SCN-804] IF admissibility_status ∈ {conditional, contested} THEN publication_or_enforcement MUST be procedurally blocked OR deferred.

[FORBIDDEN][REP-SCN-810] Scenes MUST NOT include full artifact bodies; only excerpts allowed.

---

## USAGE / RESOLUTION

[DECISION][REP-USE-900] Downstream scene generation MUST treat these rules as canonical format constraints for any shown OSA paperwork.
[DECISION][REP-USE-901] IF a scene introduces an OSA claim THEN output MUST include EL evidence_id(s) and linked order/method basis.
[DECISION][REP-USE-902] IF scope touches extraterritorial zone THEN output MUST include jurisdiction and admissibility_basis including JAP or contract as applicable.
[DECISION][REP-USE-903] IF mandatory header fields cannot be satisfied THEN no artifact excerpt MUST be produced in-scene.
[DECISION][REP-USE-904] Conflict resolution MUST follow SPEC-PRIORITY-RESOLUTION-2215-0001.

---

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-REPORTS-0006
role_type: RULE
export:
  - rule_id: REP-HDR-100
    intent: "Artifact must include mandatory header"
    inputs: [header]
    outputs: [artifact_valid]
  - rule_id: REP-EL-318
    intent: "Evidence item must declare admissibility status"
    inputs: [admissibility_status]
    outputs: [evidence_item_valid]
  - rule_id: REP-CM-411
    intent: "CM claim must bind to evidence refs and confidence"
    inputs: [claim_id, evidence_refs, confidence]
    outputs: [cm_claim_valid]
  - rule_id: REP-SCN-800
    intent: "Scene excerpt density limited to avoid infodump"
    inputs: [scene_artifact_excerpts]
    outputs: [scene_compliance]
~~~

---

## FORBIDDEN

[FORBIDDEN][REP-FBD-950] Introducing new SSOT metrics or macro numbers inside artifacts.
[FORBIDDEN][REP-FBD-951] Using narrative prose to justify formats or decisions.
[FORBIDDEN][REP-FBD-952] Showing full-length artifacts in scenes instead of excerpts.
[FORBIDDEN][REP-FBD-953] Omitting chain-of-custody when an excerpt is used as evidence.
[FORBIDDEN][REP-FBD-954] Claiming causality in CM without EL evidence_refs and tests structure.

---

## NON-NORMATIVE

~~~json
{
  "header": {
    "case_id": "OSA-2215-RU-16-0007",
    "artifact_id": "OSA-2215-RU-16-0007-CD-01",
    "artifact_type": "CD",
    "classification": "restricted",
    "created_at": "2215-05-18T14:22:00+03:00",
    "created_by": { "role": "CaseLead", "name": "..." },
    "mandate_refs": ["MANDATE-..."],
    "order_refs": ["O-01-DPO-...", "O-03-SIO-..."],
    "scope": "RU-16/CHELNY/Node-X/Perimeter-Y",
    "hash": "sha256:...",
    "attachments": ["OSA-2215-RU-16-0007-EL-01"],
    "jurisdiction": "normal",
    "admissibility_basis": "law"
  },
  "timeline": [
    {
      "ts": "2215-05-18T09:10:00+03:00",
      "type": "intake",
      "summary": "Inbound anomaly signal ...",
      "decision": "Start triage",
      "actors": ["CaseLead", "SystemsAuditor"]
    }
  ]
}
~~~

~~~json
{
  "header": {
    "case_id": "OSA-2215-RU-16-0007",
    "artifact_id": "OSA-2215-RU-16-0007-EL-01",
    "artifact_type": "EL",
    "classification": "restricted",
    "created_at": "2215-05-18T15:05:00+03:00",
    "created_by": { "role": "FieldCustodian", "name": "..." },
    "mandate_refs": ["MANDATE-..."],
    "order_refs": ["O-01-DPO-...", "O-04-ISO-..."],
    "scope": "RU-16/CHELNY/Node-X/Data-Infra",
    "hash": "sha256:...",
    "attachments": [],
    "jurisdiction": "mixed",
    "admissibility_basis": "JAP"
  },
  "items": [
    {
      "evidence_id": "E-001",
      "type": "log_bundle",
      "source": { "entity": "Operator-X", "system": "SCADA-GW-3", "zone": "Z1" },
      "collected_at": "2215-05-18T14:50:00+03:00",
      "collected_by": { "role": "SystemsAuditor", "name": "..." },
      "method": "snapshot + hash + sealed export",
      "integrity": { "hash": "sha256:...", "signature": "sig:..." },
      "linked_orders": ["O-01-DPO-...", "O-04-ISO-..."],
      "custody_chain": [
        { "ts": "2215-05-18T14:52:00+03:00", "event": "sealed", "by": "FieldCustodian" }
      ],
      "admissibility_status": "conditional",
      "admissibility_notes": ["Extraterritorial zone; admissibility depends on JAP execution"]
    }
  ]
}
~~~

~~~
</file>

<file path="03-canon/CANON-SCENE-RULESET-2215-0001.md">
~~~markdown

~~~
</file>

<file path="03-canon/CANON-SYSTEMS-0001.md">
~~~markdown
---
id: CANON-SYSTEMS-0001
title: >
  Canon Systems — Institutional and Engineering Contours (2215)
class: canon
status: fixed
version: 1.1.0
inputs: []
depends_on:
  - SSOT-DOC-STYLE-2215-0001
  - CANON-2215-CORE-0001
  - CANON-BASE-0001
  - CANON-CONFLICT-0001
scope: >
  Каноническая системная архитектура мира романа 2215: институциональные контуры,
  операторы критической инфраструктуры, экстерриториальные режимы,
  наблюдаемость, ответственность за ИИ и процедурные рычаги ОСА.
  Документ НЕ выбирает числовые параметры мира.
---

## LLM-INTENT

ROLE_TYPE: STATE
SCOPE: define institutional and infrastructure system state for the world of 2215
INPUTS:
  - CANON-2215-CORE-0001
OUTPUTS:
  - system_contours
  - operator_landscape
  - observability_model
  - ai_responsibility_model
FORBIDDEN:
  - world_parameter_binding
  - causal_chains
  - baseline_defaults
  - resolution_logic

---

## DEFINITIONS

[FACT][SYS-DEF-010] governance_macro_model = модель распределения полномочий центр–регионы.
[FACT][SYS-DEF-011] ci_operator = лицензированный оператор критической инфраструктуры.
[FACT][SYS-DEF-012] extraterritory = контрактный специальный режим с процедурными ограничениями доступа.
[FACT][SYS-DEF-013] observability_model = способ доступности и полноты данных о системе.
[FACT][SYS-DEF-014] ai_responsibility_model = схема распределения ответственности за решения ИИ.

---

## INVARIANTS

[DECISION][SYS-INV-010] Документ MUST наследовать фон мира из CANON-2215-CORE-0001.
[DECISION][SYS-INV-011] Государство MUST сохранять примат легитимного принуждения.
[DECISION][SYS-INV-012] Операторы MUST действовать в лицензируемом и отзывном режиме.
[DECISION][SYS-INV-013] Экстерритория MUST NOT трактоваться как суверенитет.
[DECISION][SYS-INV-014] Наблюдаемость MUST NOT быть тотальной по умолчанию.
[DECISION][SYS-INV-015] ОСА MUST функционировать как процедурный инструмент, а не универсальный орган.

---

## CONTENT

### 1. Governance architecture

[STATE][SYS-010] governance_macro_model = strong_center_with_regional_execution_by_standards.
[STATE][SYS-011] center_sets = {safety_standards, audit_requirements, interoperability_regimes, incident_regimes}.
[STATE][SYS-012] regions_execute = {dispatch_clusters, local_operations, contractors}.

---

### 2. Critical infrastructure operators

[STATE][SYS-020] ci_operator_count_range = [2, 4].
[STATE][SYS-021] ci_operator_domains = {
  energy_storage_distribution,
  connectivity_and_city_sensing,
  logistics_recycling_warehousing,
  medtech_reagents_optional
}.

[STATE][SYS-022] operator_obligations = {
  licensing_required,
  audit_trails_mandatory,
  inspections_possible,
  insurance_and_fines_applicable
}.

---

### 3. Primary location profile (Naberezhnye Chelny)

[STATE][SYS-030] chelny_node_type = hybrid_logistics_dominant_node.
[STATE][SYS-031] chelny_primary_functions = {
  materials_recycling,
  large_scale_warehousing,
  rail_river_autonomous_corridor_intersection,
  sensor_and_connectivity_service_capacity
}.
[STATE][SYS-032] chelny_secondary_features = {local_energy_buffers_optional}.

---

### 4. Extraterritorial regimes

[STATE][SYS-040] extraterritory_types = {industrial_logistics, rnd_biotech_med}.
[STATE][SYS-041] extraterritory_creation_basis = contract_center_region_operator.
[STATE][SYS-042] extraterritory_features = {
  accelerated_approvals,
  restricted_external_audit,
  special_reporting,
  osa_entry_by_incident_or_warrant
}.
[STATE][SYS-043] extraterritory_constraints = {
  licensed,
  bounded,
  auditable,
  state_intervention_on_risk
}.

---

### 5. Critical resources

[STATE][SYS-050] primary_critical_resources = {
  energy_storage_peak_power,
  observability_nodes
}.
[STATE][SYS-051] secondary_critical_resources = {
  medical_reagents_for_rnd_extraterritories
}.

---

### 6. Observability model

[STATE][SYS-060] observability_model = fragmented.
[STATE][SYS-061] observability_fragmentation_sources = {
  multi_operator_ownership,
  log_and_format_divergence,
  legal_access_boundaries
}.
[STATE][SYS-062] investigation_implications = {
  blind_zones_exist,
  data_delay_or_loss_possible,
  cross_operator_correlation_required
}.

---

### 7. Responsibility for AI decisions

[STATE][SYS-070] ai_responsibility_model = mixed.
[STATE][SYS-071] critical_decision_controls = {
  human_signatory,
  decision_logging,
  post_audit
}.
[STATE][SYS-072] critical_decision_domains = {
  life_and_health,
  hospital_energy_supply,
  evacuation
}.
[STATE][SYS-073] noncritical_liability_modes = {
  operator_liability,
  fines,
  license_actions,
  insurance
}.
[STATE][SYS-074] liability_architecture_patterns = {
  subcontracting_layers,
  spv_risk_shells,
  insurance_coverage,
  arbitration_over_personal_guilt
}.

---

### 8. OSA levers and resistance

[STATE][SYS-080] osa_levers = {
  data_and_site_access_warrants,
  media_seizure,
  temporary_mode_suspension,
  regulatory_checks_or_license_actions,
  extraterritorial_mandates_on_incidents
}.
[STATE][SYS-081] osa_constraints = {
  approval_delays,
  jurisdiction_disputes,
  corporate_legal_resistance,
  private_security_within_limits,
  procedural_pressure
}.

---

### 9. Mobility profile (Chelni)

[STATE][SYS-090] chelny_mobility_profile = dense_city_low_private_car_dependency.
[STATE][SYS-091] mobility_modes = {
  public_transport,
  routed_capsules,
  autonomous_freight_corridors
}.

---

### 10. Open unknowns

[UNKNOWN][SYS-100] Specific operator and regulator identities.
[UNKNOWN][SYS-101] KPI formulas causing pathological optimization.
[UNKNOWN][SYS-102] Exact OSA warrant issuance timings.
[UNKNOWN][SYS-103] Topology of key hubs and routes in Chelny.
[UNKNOWN][SYS-104] Threshold for center takeover of regional control.

---

## USAGE / RESOLUTION

[DECISION][SYS-USE-010] Документ используется как системное STATE-основание для CANON и SCENE.
[DECISION][SYS-USE-011] Любые процедурные правила MUST задаваться в RULE-документах.

---

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-SYSTEMS-0001
role_type: STATE
export:
  governance_macro_model: strong_center_with_regional_execution_by_standards
  ci_operator_count_range: [2, 4]
  extraterritory_types: [industrial_logistics, rnd_biotech_med]
  observability_model: fragmented
  ai_responsibility_model: mixed
  osa_levers:
    - data_and_site_access_warrants
    - media_seizure
    - temporary_mode_suspension
    - regulatory_checks_or_license_actions
~~~

---

## FORBIDDEN

[FORBIDDEN][SYS-FBD-900] Introducing_new_global_world_metrics.
[FORBIDDEN][SYS-FBD-901] Encoding_causality_chains_in_canon.
[FORBIDDEN][SYS-FBD-902] Treating_operators_as_sovereigns.
[FORBIDDEN][SYS-FBD-903] Assuming_total_observability_by_default.

---

## NON-NORMATIVE

(Empty by design)

~~~
</file>

<file path="03-canon/CANON-SYSTEM-VOICE-0001.md">
~~~markdown
---
id: CANON-SYSTEM-VOICE-0001
title: >
  Голос системы — допустимые системные вставки, формат, метрики и запреты (2215)
class: canon
status: draft
version: 0.3.0
inputs:
  - CANON-BASE-0001
  - CANON-VOCAB-0001
  - CANON-REPORTS-0006
depends_on:
  - SSOT-DOC-STYLE-2215-0001
  - SPEC-PRIORITY-RESOLUTION-2215-0001
scope: >
  RULE-канон «голоса системы»: как показывать оптимизацию/наблюдаемость/комплаенс
  через краткие машинные вставки (уведомления/логи/рекомендации/строки отчёта),
  без очеловечивания. Фиксирует источники, типы событий, обязательные поля,
  допустимые метрики, стиль и запреты.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: define allowed system voice inserts and constrain schema, sources, events, metrics, and style
INPUTS:
  - CANON-BASE-0001
  - CANON-VOCAB-0001
  - CANON-REPORTS-0006
OUTPUTS:
  - system_voice_schema
  - allowed_sources
  - allowed_events
  - allowed_metrics
  - insertion_rules
  - forbidden_patterns
FORBIDDEN:
  - personify_system
  - add_new_sources
  - expand_metrics_without_override
  - narrative_explanations
  - emotional_language

---

## DEFINITIONS

[FACT][SVO-DEF-010] system_voice_insert = machine_message excerpt (notification/log/recommendation/report_line).
[FACT][SVO-DEF-011] evidence_link = linkage via refs {case_id, evidence_refs[], order_refs[]} to OSA artifacts.
[FACT][SVO-DEF-012] classification ∈ {public, restricted, secret}.
[FACT][SVO-DEF-013] confidence ∈ {low, med, high}.
[FACT][SVO-DEF-014] enum_expansion_requires = explicit_override_doc.

---

## INVARIANTS

[DECISION][SVO-INV-010] System voice MUST exist only as machine messages and MUST NOT be a character.
[DECISION][SVO-INV-011] Every insert MUST be short, procedural, and scope-checkable.
[DECISION][SVO-INV-012] Inserts MUST NOT replace OSA work; causality MUST be established via CM/FM.

---

## CONTENT

### 1. Placement, density, size

[RULE][SVO-010] Inserts SHOULD appear at escalation, allocation, procedural viscosity, or admissibility friction points.
[RULE][SVO-011] Insert frequency MUST NOT exceed 1 per 2–3 scenes.
[RULE][SVO-012] Exception: Acts III–IV MAY increase density under sustained crisis.
[RULE][SVO-013] One insert MUST be ≤ 14 visible lines in prose.

---

### 2. Source enum (locked)

[RULE][SVO-020] source MUST be one of {OPTIMIZER, OBSERVABILITY, COMPLIANCE, POLICY_ENGINE, DISPATCH, ARBITRATION_GATE, SAFETY_MONITOR}.
[FORBIDDEN][SVO-021] source outside enum.

---

### 3. Event enum (locked)

[RULE][SVO-030] event MUST be one of {
  inefficiency_detected,
  allocation_adjusted,
  priority_downgraded,
  constraint_binding,
  kpi_profile_applied,
  override_required,
  mitigation_applied,
  gap_detected,
  telemetry_conflict,
  evidence_sealed,
  retention_window,
  tamper_suspected,
  policy_violation,
  access_denied,
  access_granted_windowed,
  chain_of_custody_required,
  admissibility_risk,
  counterfactual_test_requested,
  test_passed,
  test_failed,
  correlation_detected
}.
[FORBIDDEN][SVO-031] event outside enum.

---

### 4. Minimal schema (required fields)

[RULE][SVO-040] Any insert MUST include fields {source, event, ts, scope, classification, statement, refs}.
[RULE][SVO-041] ts MUST be ISO8601 with timezone offset.
[RULE][SVO-042] scope MUST be explicit perimeter token.
[RULE][SVO-043] refs MUST be object and MAY include {case_id, evidence_refs[], order_refs[]}.

---

### 5. Allowed metrics and units

[RULE][SVO-050] Allowed KPI metrics = {kpi_profile_id, human_cost_weight, service_class, allocation_delta, sla_target, risk_score}.
[RULE][SVO-051] Allowed resource metrics = {power_kw, power_mw, energy_mwh, compute_units, bandwidth_gbps}.
[RULE][SVO-052] Allowed impact metrics MUST use {forecast_loss_units, unit}.
[RULE][SVO-053] unit MUST be one of {biomass, subject, service_minutes, critical_events}.

[FORBIDDEN][SVO-054] Natural-language loss phrasing inside inserts.

---

### 6. Statement style constraints

[RULE][SVO-060] statement MUST be 1–2 short sentences.
[RULE][SVO-061] statement MUST NOT use softeners; uncertainty MUST be expressed only via confidence or open_questions[].
[FORBIDDEN][SVO-062] Personhood language in any field: pronouns, emotions, metaphors, sarcasm, moral judgement.

---

### 7. Evidence integration rules

[RULE][SVO-070] IF insert is used as evidence THEN refs.evidence_refs MUST be present AND insert MUST be registered as EL item with type ∈ {telemetry, log, policy_record}.
[RULE][SVO-071] IF insert contains causal assertion THEN it MUST be represented as CM claim with claim_id and evidence_refs OR it MUST be downgraded to correlation_detected.

---

## USAGE / RESOLUTION

[DECISION][SVO-USE-010] Any scene with insert MUST record {source, event, scope, active_metric_or_constraint, linkage_target ∈ {CD, EL, CM, FM, RP}}.
[DECISION][SVO-USE-011] Insert validity check MUST verify enums, required schema fields, statement constraints, and forbidden patterns.
[DECISION][SVO-USE-012] Enum or metric expansion MUST be done ONLY via separate override doc.
[DECISION][SVO-USE-013] Conflict resolution MUST follow SPEC-PRIORITY-RESOLUTION-2215-0001.

---

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-SYSTEM-VOICE-0001
role_type: RULE
export:
  - rule_id: SVO-020
    intent: "Lock allowed source enum for system voice inserts"
    inputs: []
    outputs: [allowed_sources]
  - rule_id: SVO-030
    intent: "Lock allowed event enum for system voice inserts"
    inputs: []
    outputs: [allowed_events]
  - rule_id: SVO-040
    intent: "Enforce minimal required schema for any insert"
    inputs: []
    outputs: [system_voice_schema]
  - rule_id: SVO-050
    intent: "Restrict allowed metrics and units inside inserts"
    inputs: [CANON-VOCAB-0001]
    outputs: [allowed_metrics]
  - rule_id: SVO-060
    intent: "Constrain language/tone to non-personified procedural style"
    inputs: []
    outputs: [forbidden_patterns]
~~~

---

## FORBIDDEN

[FORBIDDEN][SVO-FBD-010] Insert that is not a machine message (narration/opinion/explanation).
[FORBIDDEN][SVO-FBD-011] Dialogue framing (system talks to characters).
[FORBIDDEN][SVO-FBD-012] Emotional, metaphorical, sarcastic, or moral language in inserts.
[FORBIDDEN][SVO-FBD-013] Non-enum source or event values without explicit override doc.
[FORBIDDEN][SVO-FBD-014] Metric expansion without explicit override doc.
[FORBIDDEN][SVO-FBD-015] Using inserts to explain the world instead of evidence/constraints.

---

## NON-NORMATIVE

~~~json
{
  "source": "OPTIMIZER",
  "event": "priority_downgraded",
  "ts": "2215-05-18T19:12:00+03:00",
  "scope": "RU-16/CHELNY/Node-HOSP-3/Power-Loop",
  "classification": "restricted",
  "kpi_profile_id": "KPI-ALPHA-12",
  "service_class": { "from": "A", "to": "C" },
  "constraint_binding": "power_cap",
  "forecast_loss_units": 3,
  "unit": "biomass",
  "decision": "accepted",
  "confidence": "high",
  "statement": "Service class downgraded under binding constraints. Forecast loss recorded.",
  "refs": { "case_id": "OSA-2215-RU-16-0007", "evidence_refs": ["E-002"], "order_refs": [] }
}
~~~

~~~
</file>

<file path="03-canon/CANON-VIBE-FLOW-0001.md">
~~~markdown
---
id: CANON-VIBE-FLOW-0001
title: >
  Atmosphere Reference — Nujabes & Logic ("Solar Flow" State)
class: canon
status: draft
version: 1.0.0
inputs: [CANON-VIBE-RESTLESS-0001]
depends_on: []
scope: >
  RULE-канон для «светлых» и высокоинтеллектуальных сцен: состояние потока,
  дедуктивные прорывы, эстетика «солнечного брутализма». Используется как
  ограничитель генерации сцен и диалогов.
---

## LLM-INTENT

ROLE_TYPE: RULE  
SCOPE: enforce solar_flow vibe constraints for insight, execution, and reflective scenes  
INPUTS: [scene.type, scene.state]  
OUTPUTS: [prose_rhythm_rules, soundscape_rules, dialogue_constraints]  
FORBIDDEN: [gritty_bass, choppy_prose, emotional_monologue, noir_cliches]

## DEFINITIONS

[FACT][FLOW-DEF-010] `solar_flow_vibe` = режим сцены с высокой когнитивной синхронизацией и ощущением ясности.  
[FACT][FLOW-DEF-011] `nujabes_layer` = атмосферный слой: солнечный свет, тёплый бетон, мягкие повторяющиеся текстуры.  
[FACT][FLOW-DEF-012] `logic_layer` = ритмический слой: высокая плотность мысли, быстрые и точные формулировки.  

## INVARIANTS

[DECISION][FLOW-INV-010] `solar_flow_vibe` применяется ONLY IF выполнено хотя бы одно условие:
- команда действует синхронно и эффективно;
- персонаж находится в глубокой дедукции;
- сцена подчёркивает красоту и целостность мира.

[FORBIDDEN][FLOW-INV-011] Использование `solar_flow_vibe` в сценах:
- процедурного тупика;
- бюрократического конфликта;
- насилия как доминанты.

## CONTENT

[RULE][FLOW-100] IF scene.type ∈ {insight, execution, reflection} THEN USE solar_flow_vibe.  
[RULE][FLOW-101] IF scene.type ∈ {routine, struggle, bureaucracy} THEN USE CANON-VIBE-RESTLESS.  

[RULE][FLOW-110] Soundscape constraints:
- IF solar_flow_vibe THEN low-frequency grit MUST NOT dominate.
- IF solar_flow_vibe THEN ambient tones MUST be perceived as ordered and rhythmic.

[RULE][FLOW-120] Prose rhythm constraints:
- IF solar_flow_vibe THEN sentence_length ∈ [medium, long].
- IF solar_flow_vibe THEN clauses MAY cascade logically.
- IF solar_flow_vibe THEN rhetorical fragmentation MUST NOT be used.

[RULE][FLOW-130] Dialogue constraints:
- IF solar_flow_vibe THEN hesitation_markers MUST NOT appear.
- IF solar_flow_vibe THEN dialogue_speed = high.
- IF solar_flow_vibe THEN exchanges imply shared context without exposition.

[RULE][FLOW-140] Visual constraints:
- IF solar_flow_vibe THEN lighting MUST reference low sun / warm reflection.
- IF solar_flow_vibe THEN materials MUST read as warm, massive, stable.

## USAGE / RESOLUTION

- `solar_flow_vibe` overrides CANON-VIBE-RESTLESS ONLY within the active scene.
- Scene MUST revert to baseline vibe after resolution of insight/execution.
- Precedence: RULE → CANON → SCENE.

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-VIBE-FLOW-0001
role_type: RULE
export:
  - rule_id: FLOW-100
    intent: select solar_flow_vibe based on scene type
    inputs: [scene.type]
    outputs: [vibe_profile]
  - rule_id: FLOW-110
    intent: constrain soundscape under solar_flow_vibe
    inputs: [scene.state]
    outputs: [soundscape_rules]
  - rule_id: FLOW-120
    intent: constrain prose rhythm under solar_flow_vibe
    inputs: [scene.state]
    outputs: [prose_rules]
  - rule_id: FLOW-130
    intent: constrain dialogue under solar_flow_vibe
    inputs: [scene.state]
    outputs: [dialogue_rules]
~~~

## FORBIDDEN

[FORBIDDEN][FLOW-FRB-010] Использование «нуарной» эстетики (дождь, неон, грязный бас).  
[FORBIDDEN][FLOW-FRB-011] Эмоциональные монологи как объяснение инсайта.  
[FORBIDDEN][FLOW-FRB-012] Превращение вайба в музыкальную отсылку внутри текста.

## NON-NORMATIVE

Пример (не норма):  
«Мысль цеплялась за лог, лог раскрывался связью, и карта была ясна, как чертёж на стекле».

~~~
</file>

<file path="03-canon/CANON-VIBE-RESTLESS-0001.md">
~~~markdown
---
id: CANON-VIBE-RESTLESS-0001
title: >
  Atmosphere Reference — UNKLE "Restless" (Audio & Narrative Vibe)
class: canon
status: draft
version: 0.1.0
inputs: []
depends_on: []
scope: >
  RULE-канон для стилизации сцен (ритм, саундскейп, сенсорика, психология команды)
  по аудио-референсу UNKLE — “Restless” для Челнов-2215. Без метрик SSOT и без художественного текста.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: enforce “Restless” vibe constraints for Chelny-2215 scenes (soundscape, prose rhythm, team psychology).
INPUTS: [CANON-CITY-RU-2215-0007, CANON-LOC-CHELNY-2215-0001, CANON-SYSTEM-VOICE-0001, CANON-CAST-0001]
OUTPUTS: [scene_style_profile, prose_rhythm_rules, soundscape_rules, dialogue_rules, forbidden_patterns]
FORBIDDEN: [lyrics_quotes, noir_cliches, essay_mode, metaphoric_system_persona, mood_exposition]

## DEFINITIONS

[FACT][VIBE-DEF-010] `vibe_profile` = набор правил, ограничивающих ритм прозы, саундскейп, сенсорные якоря и динамику команды в сцене.
[FACT][VIBE-DEF-011] `restless_vibe` = профиль “driving fatigue”: поток действий + износ без мелодрамы.
[FACT][VIBE-DEF-012] `soundscape_layer_low_end` = низкочастотный фон инфраструктуры (гул/вибрация/фазовые шумы).
[FACT][VIBE-DEF-013] `soundscape_layer_beat` = ритмика логистики и процедур (повторяемые такты, механическая регулярность).
[FACT][VIBE-DEF-014] `soundscape_layer_vocals` = голосовые интерфейсы (интерком, терминалы, краткие реплики).
[FACT][VIBE-DEF-015] `bend_resend_loop` = цикл “отказ/ограничение → правка параметров → повтор запроса” без эмоциональной экспозиции.
[FACT][VIBE-DEF-016] `procedural_spiral` = драматургический эффект “решение частичное → цикл запускается снова”.

## INVARIANTS

[DECISION][VIBE-INV-010] Scenes tagged with `restless_vibe` MUST express: flow_state AND wear_state.
[DECISION][VIBE-INV-011] Any atmospheric detail MUST map to: (infrastructure) OR (procedure) OR (human_cost), not decoration.
[DECISION][VIBE-INV-012] System MUST NOT be anthropomorphized; system-facing content MUST comply with CANON-SYSTEM-VOICE-0001.
[DECISION][VIBE-INV-013] City soundscape MUST be non-silent; silence MAY appear ONLY IF it is an anomaly or controlled regime marker.
[DECISION][VIBE-INV-014] Dialogue between team members MUST be utilitarian; social-smalltalk MUST NOT be the default interaction mode.

## CONTENT

[RULE][VIBE-100] IF scene.location = "CHELNY-2215" THEN apply `restless_vibe` constraints as default style profile.
[RULE][VIBE-101] IF scene.type ∈ {field_op, inspection, data_capture, access_gate, triage} THEN enforce `bend_resend_loop` as micro-structure.
[RULE][VIBE-102] IF a character expresses emotion THEN represent it as operational output (timing, errors, omissions, fatigue markers), not as monologue.

### Soundscape rules

[RULE][VIBE-110] `soundscape_layer_low_end` MUST be present as continuous background cue (hum/vibration/heat-exchange).
[RULE][VIBE-111] `soundscape_layer_beat` MUST be represented as repetition with stable cadence (procedural tick, conveyor rhythm, dispatch cadence).
[RULE][VIBE-112] `soundscape_layer_vocals` MUST sound filtered/flattened (intercom/PA/terminal tone), not theatrical voice acting.
[RULE][VIBE-113] IF sound is described THEN it MUST use cold mechanical descriptors (frequency, vibration, continuity, interference) and MUST NOT use romanticized noir audio tropes.

### Prose rhythm rules

[RULE][VIBE-120] Sentence length profile MUST satisfy: short_ratio ≥ 0.60 where short_sentence_words ∈ [3, 12].
[RULE][VIBE-121] Paragraph length MUST satisfy: paragraph_sentences ∈ [1, 4] for action/procedure beats.
[RULE][VIBE-122] IF a refusal/deny occurs (access, data, window, order) THEN the next 1–3 sentences MUST execute `bend_resend_loop`.
[RULE][VIBE-123] Exposition blocks MUST NOT exceed 4 sentences consecutively in `restless_vibe` scenes.

### Procedural spiral rules (macro)

[RULE][VIBE-130] Chapter/scene resolution MUST be partial: solved_scope ⊂ problem_space.
[RULE][VIBE-131] IF a win occurs THEN it MUST include a residual (new constraint, new window, new admissibility risk, new dependency).
[RULE][VIBE-132] IF a loss occurs THEN it MUST be framed as “lost window / lost admissibility / lost observability”, not as “defeat of hero”.

### Sensory / tactile rules

[RULE][VIBE-140] Sensory cues MUST prefer: heat, vibration, dry air, matte surfaces, service seams, access hatches.
[RULE][VIBE-141] IF describing “weight of system” THEN encode it as: physical load (heat/noise/space pressure) OR interface load (HUD strain, access friction), not mysticism.
[RULE][VIBE-142] Any tactile metaphor MUST preserve causality (source hardware → sensation), and MUST NOT imply sentient infrastructure.

### Team psychology / dialogue rules

[RULE][VIBE-150] Team talk MUST default to data exchange: request → constraint → delta → confirm.
[RULE][VIBE-151] Social friction MUST be minimized: no apology rituals, no “how are you”, no bonding banter as default.
[RULE][VIBE-152] Trust MUST be expressed as functional reliance: “I trust your competency for this task”, not declarations of friendship.
[RULE][VIBE-153] “Sync without words” MAY be used ONLY IF it is manifested via: gestures, timings, pre-agreed protocol phrases, shared artifacts.

### Integration rules

[RULE][VIBE-160] IF a system insert is used THEN it MUST follow CANON-SYSTEM-VOICE-0001 schema and MUST count toward scene density constraints there.
[RULE][VIBE-161] IF an OSA artifact snippet is shown THEN it MUST follow CANON-ARTIFACT-SNIPPETS-0001 forms and MUST NOT include literary adjectives.

## USAGE / RESOLUTION

[DECISION][VIBE-RES-010] This document applies at layer CANON and constrains SCENE generation for Chelny-2215 scenes.
[DECISION][VIBE-RES-011] Resolution order for style conflicts MUST be: RULE (SSOT-DOC-STYLE) → CANON-SYSTEM-VOICE → CANON-VIBE-RESTLESS → scene-specific overrides.
[DECISION][VIBE-RES-012] A scene is `restless_vibe` compliant IFF all of the following hold:
- sentence profile satisfies VIBE-120 and VIBE-121;
- soundscape satisfies VIBE-110..VIBE-113;
- dialogue satisfies VIBE-150..VIBE-153;
- no forbidden patterns (section FORBIDDEN) are present.
[DECISION][VIBE-RES-013] If a scene needs non-restless pacing THEN it MUST declare an explicit scene override doc-id and list which rules are disabled.

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-VIBE-RESTLESS-0001
role_type: RULE
export:
  - rule_id: VIBE-100
    intent: apply restless_vibe profile to Chelny-2215 scenes
    inputs: [scene.location]
    outputs: [scene_style_profile]
  - rule_id: VIBE-120
    intent: enforce sentence length profile for restless prose
    inputs: [scene.text]
    outputs: [prose_rhythm_rules]
  - rule_id: VIBE-110
    intent: enforce 3-layer soundscape presence
    inputs: [scene.description]
    outputs: [soundscape_rules]
  - rule_id: VIBE-150
    intent: enforce utilitarian team dialogue pattern
    inputs: [scene.dialogue]
    outputs: [dialogue_rules]
  - rule_id: VIBE-160
    intent: enforce integration constraints with system voice and artifacts
    inputs: [scene.inserts]
    outputs: [integration_constraints]
~~~

## FORBIDDEN

[FORBIDDEN][VIBE-FBD-010] Quoting lyrics or reproducing track text (any length).
[FORBIDDEN][VIBE-FBD-011] Noir-by-default clichés: constant rain, acid neon fetish, trenchcoat aesthetics as norm.
[FORBIDDEN][VIBE-FBD-012] “System as character”: first/second person, emotions, sarcasm, moral judgment attributed to system.
[FORBIDDEN][VIBE-FBD-013] Essay mode: paragraphs > 4 sentences in action/procedure scenes.
[FORBIDDEN][VIBE-FBD-014] “Victory ends the loop”: total closure without residual constraint (violates VIBE-130..VIBE-131).
[FORBIDDEN][VIBE-FBD-015] Social-smalltalk as default team behavior in operational scenes.

## NON-NORMATIVE

[NON-NORMATIVE][VIBE-EX-010] Example micro-structure (bend_resend_loop): deny → parameter change → re-issue → window gained.
[NON-NORMATIVE][VIBE-EX-011] Example soundscape layering: low-end hum (infrastructure) + repetitive procedural tick (logistics) + filtered intercom prompt (interfaces).
[NON-NORMATIVE][VIBE-EX-012] Example trust expression: competence-based reliance stated as task routing, not as emotional affirmation.

~~~
</file>

<file path="03-canon/CANON-VOCAB-0001.md">
~~~markdown
---
id: CANON-VOCAB-2215-0001
title: >
  Operational Vocabulary — Canonical Terms, Substitutions and Speech Constraints (2215)
class: canon
status: draft
version: 1.0.0
inputs:
  - CANON-BASE-0001
  - CANON-CAST-0001
  - CANON-REPORTS-0006
depends_on: []
scope: >
  Canonical operational vocabulary for the novel corpus (2215): mandatory term
  substitutions, allowed terminology, speech constraints for characters and
  system outputs. Enforced as a generation limiter for scenes and artifacts.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: enforce canonical operational vocabulary and forbid genre-breaking language
INPUTS: [CANON-BASE-0001, CANON-CAST-0001, CANON-REPORTS-0006]
OUTPUTS: [allowed_term, forbidden_term, substitution_rule]
FORBIDDEN: [genre_slang, emotional_language, narrative_justification]

## DEFINITIONS

[DECISION][VOCAB-001] "Operational vocabulary" = terminology aligned with procedures,
infrastructure, regulation, and auditability.

[DECISION][VOCAB-002] "Hard substitution" = mandatory replacement with no stylistic exceptions.

[DECISION][VOCAB-003] "Forbidden term" = word or phrase that MUST NOT appear in generated text.

## INVARIANTS

[DECISION][VOCAB-010] Canonical substitutions MUST be applied consistently across:
- narration,
- dialogue,
- artifacts,
- system inserts.

[DECISION][VOCAB-011] Vocabulary rules apply equally to:
- human characters,
- institutional language,
- system outputs.

[DECISION][VOCAB-012] Absence of a listed term does NOT imply permission; defaults
to operational language.

## CONTENT

### Hard substitutions — violence and harm

[RULE][VOCAB-100] IF term = "убийство" THEN replace_with = "вывод из эксплуатации носителя".

[RULE][VOCAB-101] IF term = "жертва" THEN replace_with = "затронутый субъект".

[RULE][VOCAB-102] IF term = "труп" THEN replace_with = "неактивный носитель".

[RULE][VOCAB-103] IF term = "пытка" THEN replace_with = "несанкционированное воздействие".

[RULE][VOCAB-104] IF term = "расправа" THEN replace_with = "внесудебное действие".

[RULE][VOCAB-105] IF term = "нападение" THEN replace_with = "силовое вмешательство".

[RULE][VOCAB-106] IF term = "преступник" THEN replace_with = "нарушитель режима".

### Hard substitutions — investigation and procedure

[RULE][VOCAB-120] IF term = "улики" THEN replace_with = "артефакты".

[RULE][VOCAB-121] IF term = "доказательства" THEN replace_with = "доказательная база".

[RULE][VOCAB-122] IF term = "версия" THEN replace_with = "рабочая гипотеза".

[RULE][VOCAB-123] IF term = "мотив" THEN replace_with = "оптимизационная цель".

[RULE][VOCAB-124] IF term = "признание" THEN replace_with = "зафиксированное показание".

[RULE][VOCAB-125] IF term = "допрос" THEN replace_with = "процессуальный опрос".

### Hard substitutions — corruption and pressure

[RULE][VOCAB-140] IF term = "взятка" THEN replace_with = "приоритетный доступ".

[RULE][VOCAB-141] IF term = "подкуп" THEN replace_with = "офсетная сделка".

[RULE][VOCAB-142] IF term = "крышевание" THEN replace_with = "договорная защита".

[RULE][VOCAB-143] IF term = "давление" THEN replace_with = "асимметричное воздействие".

[RULE][VOCAB-144] IF phrase = "приказ сверху" THEN replace_with = "регуляторный сигнал".

### Canonical infrastructure terminology

[RULE][VOCAB-200] Use term "контур" for closed decision systems.

[RULE][VOCAB-201] Use term "узел" for execution points (physical or logical).

[RULE][VOCAB-202] Use term "режим" for a bounded set of procedures and constraints.

[RULE][VOCAB-203] Use term "класс обеспечения" for priority access to resources.

[RULE][VOCAB-204] Use term "окно" for time-bounded permissions.

### Observability and data language

[RULE][VOCAB-220] Use term "логи" ONLY for primary execution records.

[RULE][VOCAB-221] Use term "телеметрия" for streamed measurements.

[RULE][VOCAB-222] Use term "слепая зона" for non-guaranteed observability areas.

[RULE][VOCAB-223] Use term "purge/rotation" ONLY as procedural data lifecycle events.

### Legal and procedural language (OSA / regulators)

[RULE][VOCAB-240] Use term "ордер" for formal authorization.

[RULE][VOCAB-241] Use term "мандат" for scope of authority.

[RULE][VOCAB-242] Use term "арбитраж" ONLY for contract- or law-based dispute resolution.

[RULE][VOCAB-243] Use term "JAP" ONLY as "Joint Access Protocol".

### Decision status phrases

[RULE][VOCAB-260] Allowed decision phrases:
- "формально допустимо"
- "процедурно корректно"
- "юридически уязвимо"
- "неприемлемо по риску"
- "требует override"
- "закрыто по регламенту"

### System voice constraints

[FORBIDDEN][VOCAB-300] Emotional or moral language in system output.

[FORBIDDEN][VOCAB-301] Personal pronouns in system output.

[FORBIDDEN][VOCAB-302] Dialogic constructions in system output.

### Genre-forbidden vocabulary

[FORBIDDEN][VOCAB-400] Term = "бластер".

[FORBIDDEN][VOCAB-401] Term = "голограмма" EXCEPT WHEN explicitly AR-display.

[FORBIDDEN][VOCAB-402] Term = "киберпанк".

[FORBIDDEN][VOCAB-403] Term = "мегакорп".

[FORBIDDEN][VOCAB-404] Phrase = "всевидящая система".

[FORBIDDEN][VOCAB-405] Phrase = "цифровая душа".

## USAGE / RESOLUTION

[RULE][VOCAB-500] IF forbidden term is detected THEN generation MUST be rejected.

[RULE][VOCAB-501] IF hard substitution exists THEN replacement MUST be applied
before scene finalization.

[RULE][VOCAB-502] Vocabulary rules override stylistic or atmospheric preferences.

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-VOCAB-2215-0001
role_type: RULE
export:
  - rule_id: VOCAB-100..405
    intent: enforce canonical operational vocabulary
    inputs: [raw_text]
    outputs: [validated_text, substitution_map]
~~~

## FORBIDDEN

[FORBIDDEN][VOCAB-900] Introducing new substitutions without canon update.

[FORBIDDEN][VOCAB-901] Mixing genre slang with operational language.

[FORBIDDEN][VOCAB-902] Using examples as implicit permission.

## NON-NORMATIVE

Examples of compliant phrasing MAY be stored in separate writing aids but
MUST NOT be treated as rules.

~~~
</file>

<file path="03-canon/CANON-ZONES-0004.md">
~~~markdown
---
id: CANON-ZONES-0004
title: >
  Canon Zones — Extraterritories and Special Regimes (RF 2215): Zone Typology, Jurisdiction, and OSA Access
class: canon
status: draft
version: 1.1.0
inputs: []
depends_on:
  - SSOT-DOC-STYLE-2215-0001
  - SPEC-PRIORITY-RESOLUTION-2215-0001
  - CANON-2215-CORE-0001
  - CANON-BASE-0001
  - CANON-SYSTEMS-0001
  - CANON-ORDERS-0003
  - CANON-CONFLICT-0001
  - CANON-OSA-0005
scope: >
  STATE-описание типологии экстерриторий и специальных режимов в РФ 2215:
  виды зон, назначение, держатель режима, нормативное основание,
  арбитраж и допустимость доказательств, наблюдаемость и процедуры доступа ОСА.
  Межгосударственный фактор не активируется в текущей книге.
---

## LLM-INTENT

ROLE_TYPE: STATE
SCOPE: define zone taxonomy and procedural properties (jurisdiction, observability, access mechanics)
INPUTS:
  - CANON-2215-CORE-0001
  - CANON-SYSTEMS-0001
  - CANON-ORDERS-0003
  - CANON-OSA-0005
OUTPUTS:
  - zone_taxonomy
  - zone_properties
  - access_mechanics_state
FORBIDDEN:
  - world_parameter_binding
  - baseline_defaults
  - secret_city_trope
  - new_world_metrics
  - procedural_rule_authoring_outside_state

---

## DEFINITIONS

[FACT][ZON-DEF-010] extraterritory = procedural regime where access/audit/liability/arbitration change but do not vanish.
[FACT][ZON-DEF-011] zone_type ∈ {Z1, Z2, Z3, Z4}.
[FACT][ZON-DEF-012] regime_holder = legal_entity_or_consortium delegated special mode.
[FACT][ZON-DEF-013] arbitration_loop = specialized admissibility and access governor for the zone.
[FACT][ZON-DEF-014] observability_regime = inside_richer_outside_filtered by default.
[FACT][ZON-DEF-015] government_access_protocol = JAP (Joint Access Protocol) when required by regime.
[FACT][ZON-DEF-016] evidence_export_formula = order → fixation → chain_of_custody → legalization.

---

## INVARIANTS

[DECISION][ZON-INV-000] Extraterritory MUST NOT be treated as lawlessness.
[DECISION][ZON-INV-001] Extraterritories MUST be rare and bounded; not everyday normality.
[DECISION][ZON-INV-002] Each extraterritory MUST declare {regime_holder, normative_basis, arbitration_loop, government_access_protocol, observability_regime}.
[DECISION][ZON-INV-003] In scenes, zone presence MUST manifest via procedure, not secret_city trope.
[DECISION][ZON-INV-004] Evidence export from a zone MUST follow evidence_export_formula.

---

## CONTENT

### 1. Baseline rationale (why zones exist)

[STATE][ZON-010] zone_drivers = {
  accelerate_innovation_and_builds,
  concentrate_critical_infrastructure_and_capital,
  operator_risk_reduction_and_knowhow_protection,
  state_growth_points_and_hubs
}.
[STATE][ZON-012] state_control_levers = {licenses, standards, arbitration, regulator_triggers}.

---

### 2. Common zone properties (apply to all zone types)

[STATE][ZON-100] regime_holder = legal_entity_or_consortium_delegated_special_mode.
[STATE][ZON-101] holder_obligations = {
  license_conditions_enforcement,
  audit_trails_by_standard,
  support_JAP_for_state_orgs_including_OSA
}.

[STATE][ZON-110] observability_regime.inside_is_richer = true.
[STATE][ZON-111] observability_regime.outside_export_is_filtered = true.
[STATE][ZON-112] blind_zones_allowed_only_if = explicit_regime_exception.
[STATE][ZON-113] undocumented_blind_zone_interpretation = violation_or_sabotage_signal.

[STATE][ZON-120] arbitration_loop = specialized_zone_admissibility_and_access_governor.
[STATE][ZON-121] evidence_export_formula = order_fixation_custody_legalization.

---

### 3. Zone taxonomy (minimal set)

[STATE][ZON-200] zone_types_count = 4.
[STATE][ZON-201] zone_types = {Z1, Z2, Z3, Z4}.

---

### 4. Zone type definitions

[STATE][ZON-Z1-210] zone.Z1.code = Z1.
[STATE][ZON-Z1-211] zone.Z1.name = infrastructure_hub.
[STATE][ZON-Z1-212] zone.Z1.examples = {logistics_megahubs, energy_module_clusters, multimodal_corridors}.
[STATE][ZON-Z1-213] zone.Z1.purpose = {throughput_speed, downtime_minimization, procedure_unification}.
[STATE][ZON-Z1-214] zone.Z1.regime_features = {
  controlled_access_perimeters_and_time_windows,
  corporate_and_state_security,
  supply_chain_manipulation_surface
}.
[STATE][ZON-Z1-215] zone.Z1.liability_gaps = {contractor_subcontractor_ghosts, loss_or_substitution_as_operational_deviation}.

[STATE][ZON-Z2-220] zone.Z2.code = Z2.
[STATE][ZON-Z2-221] zone.Z2.name = compute_data_extraterritory.
[STATE][ZON-Z2-222] zone.Z2.purpose = {compute_concentration, ip_and_config_protection, cooling_energy_requirements}.
[STATE][ZON-Z2-223] zone.Z2.regime_features = {
  tight_primary_log_and_config_access_restrictions,
  high_formalism_badges_escorts_air_gapped_segments,
  rich_internal_telemetry_filtered_exports
}.
[STATE][ZON-Z2-224] zone.Z2.liability_gaps = {
  model_recommended_vs_operator_signed_vs_contractor_implemented,
  config_changes_as_planned_optimizations_without_visible_actor
}.

[STATE][ZON-Z3-230] zone.Z3.code = Z3.
[STATE][ZON-Z3-231] zone.Z3.name = industrial_recycling_hazardous_materials.
[STATE][ZON-Z3-232] zone.Z3.purpose = {
  toxicity_and_hazard_processes,
  critical_materials_handling,
  safety_and_licensing_regimes,
  trade_secret_process_protection
}.
[STATE][ZON-Z3-233] zone.Z3.regime_features = {
  reinforced_sanitary_and_technical_protocols,
  restrictions_on_photo_scan_sample_export,
  lab_admissibility_dependency
}.
[STATE][ZON-Z3-234] zone.Z3.liability_gaps = {
  documentation_says_normal_field_says_not,
  responsibility_smear_between_ecology_safety_contracting
}.

[STATE][ZON-Z4-240] zone.Z4.code = Z4.
[STATE][ZON-Z4-241] zone.Z4.name = exception_sandbox_accelerated_mode.
[STATE][ZON-Z4-242] zone.Z4.purpose = {accelerated_programs_and_pilots, experimental_operation_regimes, legal_exceptions_for_innovation}.
[STATE][ZON-Z4-243] zone.Z4.regime_features = {
  highest_density_of_exceptions,
  harder_state_access_due_to_JAP_arbitration_nda,
  high_kpi_optimization_harshness_probability
}.
[STATE][ZON-Z4-244] zone.Z4.liability_gaps = {temporary_exception_becomes_permanent, top_level_reporting_aggregates_human_cost_out}.

---

### 5. Access mechanics (state-level)

[STATE][ZON-ACC-300] default_entry_model = order_plus_JAP_if_required.
[STATE][ZON-ACC-301] osa_behavior_in_zone_expectations = {
  minimize_intervention_until_sufficient_evidence,
  actions_must_be_auditable,
  enforce_chain_of_custody_and_zone_admissibility
}.
[STATE][ZON-ACC-320] typical_zone_resistance = {
  wrong_order_wrong_jurisdiction_wrong_window,
  sla_delays,
  approval_time_drains,
  filtered_exports_aggregates_only,
  nda_pressure_ip_leak_threat
}.
[STATE][ZON-ACC-321] osa_escalation_ladder = {DPO, ISO, SO, TSRO_or_Enforce}.
[STATE][ZON-ACC-340] emergency_entry_condition = immediate_harm_threat_to_humans_or_critical_infrastructure.
[STATE][ZON-ACC-341] emergency_procedure_mode = strengthened_not_cancelled.
[STATE][ZON-ACC-342] emergency_requires = {post_report, proportionality_review, arbitration}.

---

### 6. Arbitration loops (state description)

[STATE][ZON-ARB-400] arbitration_is_primary_viscosity_mechanism = true.
[STATE][ZON-ARB-401] arbitration_modes_supported = {state_arbitration, mixed_contract_arbitration}.
[STATE][ZON-ARB-402] typical_arbitration_outcomes = {limit_perimeter, delay_access, mandate_audit, appoint_observer}.

---

### 7. Narrative manifestation expectations (state cues)

[STATE][ZON-NAR-500] zone_scene_effects = {
  access_delay_time_is_enemy,
  observability_limit_blind_spot,
  jurisdiction_conflict_who_signs,
  liability_isolation_contract_ghosts,
  procedurally_valid_human_cost
}.
[STATE][ZON-NAR-501] zone_appearance = normal.
[STATE][ZON-NAR-502] zone_threat_source = procedure_not_atmosphere.

---

### 8. Future hooks (inactive in this book)

[STATE][ZON-FUT-600] future_hooks_possible = {
  expanded_osa_powers,
  external_actors_attack_infra_via_zones,
  supply_chain_component_substitution_attacks
}.
[STATE][ZON-FUT-601] interstate_driver_active_in_current_book = false.

---

## USAGE / RESOLUTION

[DECISION][ZON-USE-010] Документ используется как STATE-основание для зон в сценах и планах.
[DECISION][ZON-USE-011] Procedural rule enforcement MUST be sourced from RULE documents (e.g., CANON-ORDERS-0003, CANON-REPORTS-0006).
[DECISION][ZON-USE-012] Conflict resolution MUST follow SPEC-PRIORITY-RESOLUTION-2215-0001.

---

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-ZONES-0004
role_type: STATE
export:
  zone_types: [Z1, Z2, Z3, Z4]
  default_entry_model: order_plus_JAP_if_required
  escalation_ladder: [DPO, ISO, SO, TSRO_or_Enforce]
  arbitration_modes: [state_arbitration, mixed_contract_arbitration]
  evidence_export_formula: order_fixation_custody_legalization
~~~

---

## FORBIDDEN

[FORBIDDEN][ZON-FBD-900] Treating extraterritory as lawless space.
[FORBIDDEN][ZON-FBD-901] Treating zones as everyday normality everywhere.
[FORBIDDEN][ZON-FBD-902] Introducing new SSOT metrics or changing world baselines here.
[FORBIDDEN][ZON-FBD-903] Using secret_city trope as primary explanation.

---

## UNKNOWN

[UNKNOWN][ZON-UNK-800] Nearest-to-Chelny plausible instance placement for Z1/Z2/Z4.
[UNKNOWN][ZON-UNK-801] Regime holders for key zones (operator/consortium names).
[UNKNOWN][ZON-UNK-802] JAP activation threshold: which order classes require joint access vs solo OSA entry.

---

## NON-NORMATIVE

(Empty by design)

~~~
</file>

<file path="03-canon/CITY-RULES-RU-2215-0001.md">
~~~markdown
---
id: CITY-RULES-RU-2215-0001
title: >
  RU 2215 — Набережные Челны: базовые законы города
class: canon
status: draft
version: 1.0.0
inputs:
  - CANON-CITY-RU-2215-0007
  - CANON-CITY-BOUNDARY-RU-2215-0008
depends_on: []
scope: >
  Жёсткие инварианты города Набережные Челны в 2215 году: география,
  архитектура, материалы, масштаб и бытовые нормы. Документ задаёт
  непреодолимые ограничения для сцен и описаний.
---

## LLM-INTENT

ROLE_TYPE: RULE  
SCOPE: non-overridable urban invariants for Chelny-2215  
INPUTS: [CANON-CITY-RU-2215-0007, CANON-CITY-BOUNDARY-RU-2215-0008]  
OUTPUTS: [urban_constraints, forbidden_patterns]  
FORBIDDEN: [introduce_metrics, redefine_boundaries, narrative_prose]

## DEFINITIONS

[DECISION][CITYR-001] Город = функциональная городская территория Челнов-2215 внутри канонического периметра.  
[DECISION][CITYR-002] Западный берег Камы = природная/охранная зона вне городской урбанизации.  
[DECISION][CITYR-003] Избыточный масштаб = размер элементов среды, превышающий минимально функциональный.

## INVARIANTS

[RULE][CITYR-010] IF территория находится западнее Камы THEN урбанизация MUST NOT выполняться.  
[RULE][CITYR-011] IF объект относится к лесной/охранной зоне THEN застройка MUST NOT выполняться.  
[RULE][CITYR-012] Городская ткань MUST формироваться вдоль инфраструктурных осей, NOT радиально.  
[RULE][CITYR-013] Избыточный масштаб MUST применяться ко всем ключевым элементам среды.  
[RULE][CITYR-014] Архитектурный язык MUST NOT демонстрировать технологичность как самоцель.

## CONTENT

### География

[RULE][CITYR-020] IF локация = западный берег Камы THEN доступ MAY exist AND урбанизация MUST NOT exist.  
[RULE][CITYR-021] Основные направления роста города MUST be {east, south, south-east}.  
[RULE][CITYR-022] Лесные массивы (в т.ч. Боровецкий лес) MUST act as hard urban limit.

### Архитектура

[RULE][CITYR-030] Архитектура MUST follow principle: excess_scale_over_function.  
[RULE][CITYR-031] IF форма = органическая OR биоморфная THEN usage MUST NOT be dominant.  
[RULE][CITYR-032] Иконические здания-символы MUST NOT be used as доминанты города.

### Материалы

[RULE][CITYR-040] Допустимые базовые материалы = {concrete, stone, matte_metal}.  
[RULE][CITYR-041] IF material = glass THEN usage MUST be limited AND non-dominant.  
[RULE][CITYR-042] Несущие и инженерные элементы MUST be visually readable.

### Масштаб и тело

[RULE][CITYR-050] Тротуары MUST be sized for flows, NOT crowds.  
[RULE][CITYR-051] Подземные переходы MUST be deep AND wide AND perceived as engineering spaces.  
[RULE][CITYR-052] Входные группы MUST be portals, NOT doors.  
[RULE][CITYR-053] Потолки общественных пространств MUST exceed psychological_norm_height.

### Бытовые нормы

[RULE][CITYR-060] Наблюдение и логирование MUST be treated as normal state.  
[RULE][CITYR-061] Анонимность MUST be privilege, NOT baseline right.  
[RULE][CITYR-062] IF субъект = ребёнок THEN presence_in_city MUST be normalised.  
[RULE][CITYR-063] Отклонения от режимов MUST be auto-logged AND NOT dramatic by default.  
[RULE][CITYR-064] Город MUST be comfortable_for_locals AND frictional_for_visitors.

### Нарративные ограничения

[RULE][CITYR-070] География MUST be conveyed via movement/routes, NOT maps.  
[RULE][CITYR-071] Архитектура MUST be described via bodily scale, NOT styles.  
[RULE][CITYR-072] Технологические системы MUST NOT be directly explained IF behaviour implies function.  
[RULE][CITYR-073] В сцене город MUST either assist OR obstruct the character.

## USAGE / RESOLUTION

[RULE][CITYR-080] These rules have CANON precedence and MUST override scene-level interpretation.  
[RULE][CITYR-081] Any scene violating CITY-RULES MUST be treated as invalid.

## OUTPUT CONTRACT

~~~yaml
doc_id: CITY-RULES-RU-2215-0001
role_type: RULE
export:
  - rule_id: CITYR-010
    intent: forbid west-bank urbanization
    inputs: [location]
    outputs: [urbanization_allowed=false]
  - rule_id: CITYR-013
    intent: enforce excess scale principle
    inputs: [urban_element]
    outputs: [scale_constraint]
~~~

## FORBIDDEN

[FORBIDDEN][CITYR-090] Введение новых географических границ.  
[FORBIDDEN][CITYR-091] Ослабление инвариантов масштаба ради сцены.  
[FORBIDDEN][CITYR-092] Использование архитектурных клише футуризма.  
[FORBIDDEN][CITYR-093] Подмена правил примерами или атмосферным текстом.

## NON-NORMATIVE

Примеры ощущений и художественные описания должны выноситься в SCENE-документы и не имеют нормативной силы.

~~~
</file>

<file path="04-plans/PLAN-DEFAULT-ENVIRONMENT-2215-0001.md">
~~~markdown
---
id: PLAN-DEFAULT-ENVIRONMENT-2215-0001
title: >
  Default Environment Plan — 2215 (Scenario A)
class: plan
status: draft
version: 0.3.0
inputs:
  - BASELINE-PHYSICAL-LEVEL-MID-2215-0001
  - SSOT-SCENARIO-A-2215-0001
depends_on:
  - SSOT-DOC-STYLE-2215-0001
scope: >
  Структурный PLAN-контракт для описания дефолтной среды 2215.
  Определяет модули, категории параметров, типы значений и требования трассировки
  baseline/override при использовании в сценах. Не фиксирует факты мира и значения.
---

## LLM-INTENT

ROLE_TYPE: PLAN
SCOPE: structural skeleton for environment baselines and scene snapshots; no world facts or default values
INPUTS:
  - BASELINE-PHYSICAL-LEVEL-MID-2215-0001
  - SSOT-SCENARIO-A-2215-0001
  - override_documents
OUTPUTS:
  - environment_modules
  - parameter_schema
  - scene_snapshot_contract
FORBIDDEN:
  - world_facts
  - numeric_defaults
  - narrative_explanations

---

## DEFINITIONS

[DECISION][PLAN-DEF-010] environment = set of physical/sensory/infrastructure conditions perceived in a scene.
[DECISION][PLAN-DEF-011] access_level ∈ {LEVEL-LOW, LEVEL-MID, LEVEL-HIGH}.
[DECISION][PLAN-DEF-012] baseline = source of default values and prohibitions for environment (by access_level).
[DECISION][PLAN-DEF-013] ssot = source of world invariants; SSOT is not used directly as scene numeric defaults.
[DECISION][PLAN-DEF-014] override = local deviation from baseline with explicit cause, scope, and trace.

---

## INVARIANTS

[DECISION][PLAN-INV-010] PLAN MUST NOT assert world facts.
[DECISION][PLAN-INV-011] PLAN MUST NOT contain numeric parameter values.
[DECISION][PLAN-INV-012] Any environment baseline MUST conform to this module/category/value-type structure.
[DECISION][PLAN-INV-013] Any scene using environment MUST be traceable to baseline and/or override and/or artifact reference.

---

## CONTENT

### 1. Environment modules (mandatory set)

[DECISION][PLAN-MOD-010] environment_modules MUST be:
- Housing
- Building
- City
- Transport
- Workspaces
- Soundscape
- LightVisibility
- Interfaces
- PrivacyLogging
- SafetyEnforcement

[DECISION][PLAN-MOD-011] Missing any module from PLAN-MOD-010 makes the environment baseline invalid.

---

### 2. Parameter categories (per module)

[DECISION][PLAN-CAT-010] Each module MUST define parameter categories:
- Geometry
- Climate
- Acoustics
- Materials
- Energy
- Maintenance
- Connectivity
- UIInteraction
- Mobility
- Constraints

[DECISION][PLAN-CAT-011] Category Constraints MUST exist for every module.

---

### 3. Allowed value types (for baseline/override)

[DECISION][PLAN-VAL-010] Allowed value types are:
- range (min/max + optional p50)
- enum
- boolean
- narrative_tag (≤3 neutral words)
- forbidden_list

[DECISION][PLAN-VAL-011] Numeric values are allowed only in BASELINE or OVERRIDE documents, never in PLAN.

---

### 4. Normative markers

[DECISION][PLAN-NORM-010] PLAN MUST use [DECISION] markers only.
[DECISION][PLAN-NORM-011] PLAN MUST NOT use markers {FACT, DEFAULT, FORBIDDEN, RULE, NOTE, UNKNOWN}.

---

### 5. Sensor fields (scene-facing, non-narrative)

[DECISION][PLAN-SENS-010] Scene-facing sensor fields MUST be measurable keys or narrative_tag; no metaphors.
[DECISION][PLAN-SENS-011] Sensor fields do not introduce facts; they reference baseline/override/artifact.

---

### 6. Access level coverage (baseline requirement)

[DECISION][PLAN-ACL-010] Any environment baseline MUST include access levels:
- LEVEL-LOW (≥5 parameters total across modules)
- LEVEL-MID (full passport; primary)
- LEVEL-HIGH (≥5 parameters total across modules)

[DECISION][PLAN-ACL-011] LEVEL-MID is default only inside BASELINE value resolution; PLAN does not select values.

---

### 7. Scene integration (Environment Snapshot)

[DECISION][PLAN-SCN-010] Scenes MUST use environment only via Environment Snapshot (not via declarative exposition).
[DECISION][PLAN-SCN-011] Environment Snapshot MAY include:
- access_level
- module_overrides (optional)
- sensors (2–5 keys)
- route_tag (optional)
- district_tag (optional)

[DECISION][PLAN-SCN-012] Snapshot MUST NOT explain causality and MUST NOT replace OSA artifacts (CD/EL/CM/FM/RP).

---

### 8. Allowed sensor keys (scene-level)

[DECISION][PLAN-SCN-020] Allowed sensors keys are:
- noise_db
- wind_mps
- humidity_percent
- temperature_c
- latency_ms
- packet_loss_percent
- light_k
- visibility (meters_or_enum)
- traffic_flow_0_1
- background_noise_tag

[DECISION][PLAN-SCN-021] Emotional or evaluative keys are not allowed.

---

### 9. Traceability requirement

[DECISION][PLAN-TRC-010] Any sensor parameter that affects scene outcome MUST be traceable to:
- baseline, OR
- override, OR
- artifact reference (e.g., telemetry snapshot).

---

### 10. Override requirements

[DECISION][PLAN-OVR-010] Any deviation from baseline MUST be expressed via override document.
[DECISION][PLAN-OVR-011] Override MUST specify:
- overridden baseline anchor
- justification
- scope

---

### 11. Compliance checklist (mechanical)

[DECISION][PLAN-CHK-010] Environment baseline is compliant IFF:
- all modules from PLAN-MOD-010 are covered
- LEVEL-MID passport exists
- constraints are explicit
- no forbidden markers appear in PLAN
- dependencies are resolvable

---

## USAGE / RESOLUTION

[DECISION][PLAN-USE-010] PLAN is a structural contract for baseline and scene authors only.
[DECISION][PLAN-USE-011] PLAN does not participate in value precedence or selection.

---

## OUTPUT CONTRACT

~~~yaml
doc_id: PLAN-DEFAULT-ENVIRONMENT-2215-0001
role_type: PLAN
export:
  environment_modules:
    - Housing
    - Building
    - City
    - Transport
    - Workspaces
    - Soundscape
    - LightVisibility
    - Interfaces
    - PrivacyLogging
    - SafetyEnforcement
  parameter_categories:
    - Geometry
    - Climate
    - Acoustics
    - Materials
    - Energy
    - Maintenance
    - Connectivity
    - UIInteraction
    - Mobility
    - Constraints
  scene_snapshot_contract:
    allowed_keys:
      - access_level
      - module_overrides
      - sensors
      - route_tag
      - district_tag
    sensors_allowed:
      - noise_db
      - wind_mps
      - humidity_percent
      - temperature_c
      - latency_ms
      - packet_loss_percent
      - light_k
      - visibility
      - traffic_flow_0_1
      - background_noise_tag
~~~

---

## NON-NORMATIVE

(Empty by design)

~~~
</file>

<file path="04-plans/STORY-SKELETON-0001.md">
~~~markdown
---
id: STORY-SKELETON-0001
title: >
  Сюжетный каркас романа — 5 актов, 3 больших кейса, процедурная спираль ОСА
class: plan
status: fixed
version: 0.2.0
inputs:
  - CANON-BASE-0001
  - CANON-CONFLICT-0001
  - CANON-SYSTEMS-0001
depends_on:
  - SPEC-PRIORITY-RESOLUTION-2215-0001
  - CANON-BASE-0001
  - CANON-CONFLICT-0001
  - CANON-SYSTEMS-0001
  - CANON-CAST-0001
  - CANON-REPORTS-0006
  - CANON-SYSTEM-VOICE-0001
scope: >
  PLAN-макроструктура романа 2215: акты/кейсы/переломы/главы и обязательные
  процедурные теги сцен/глав. Без художественного текста и без SSOT-метрик.
---

## LLM-INTENT

ROLE_TYPE: PLAN
SCOPE: define enforceable story structure (acts/cases/chapters/tags) without prose; supports deterministic scene authoring
INPUTS:
  - CANON-BASE-0001
  - CANON-CONFLICT-0001
  - CANON-SYSTEMS-0001
  - CANON-CAST-0001
  - CANON-REPORTS-0006
  - CANON-SYSTEM-VOICE-0001
OUTPUTS:
  - act_case_structure
  - procedural_spiral_pattern
  - chapter_tags_contract
FORBIDDEN:
  - fiction_prose
  - invent_new_world_metrics
  - introduce_new_roles
  - vague_softeners

---

## DEFINITIONS

[FACT][SSK-DEF-010] act = верхний структурный блок романа (I..V).
[FACT][SSK-DEF-011] case = крупный процедурный кейс, проходящий через главы и артефакты ОСА.
[FACT][SSK-DEF-012] procedural_spiral = паттерн эскалации: сигнал → доказательства → процедурная стенка → расширение юрисдикции → коррекция режима.
[FACT][SSK-DEF-013] scene_tags = минимальные теги главы: Participants, Focus, Artifact.
[FACT][SSK-DEF-014] artifact_types = {CD, EL, CM, FM, RP, PRS}.

---

## INVARIANTS

[DECISION][SSK-INV-010] Роман MUST состоять из 5 актов.
[DECISION][SSK-INV-011] Роман MUST содержать 3 больших кейса.
[DECISION][SSK-INV-012] Фокус MUST быть ансамблевым: лидер + 1–2 профильных специалиста активно в сцене.
[DECISION][SSK-INV-013] Баланс MUST быть: процедура/анализ = 0.60, операция/экшен = 0.40.
[DECISION][SSK-INV-014] Экшен MUST иметь пики в актах II–III (основные) и V (коррекция/выполнение).
[DECISION][SSK-INV-015] Юрисдикция MUST быть задана так: ОСА = федеральная структура прямого подчинения (Москва); региональные власти MUST NOT быть начальством ОСА.
[DECISION][SSK-INV-016] Финал MUST быть частичной процедурной победой: режим скорректирован, мир не перевёрнут.
[DECISION][SSK-INV-017] Тон последней сцены MUST быть: cold_stability.
[DECISION][SSK-INV-018] Антагонист MUST быть контуром оптимизации (KPI/алгоритм/экстерритории/юридическая изоляция ответственности), а не «злодеем-центром».
[DECISION][SSK-INV-019] Драматургический дефицит MUST быть инфраструктурным (окна мощности, классы обеспечения, приоритеты контуров), а не бытовым выживанием.
[DECISION][SSK-INV-020] Движок романа MUST быть процедурной эскалацией, а не «поимкой злодея».
[DECISION][SSK-INV-021] Системные вставки MAY использоваться ONLY IF они соответствуют CANON-SYSTEM-VOICE-0001 и не очеловечивают систему.

---

## CONTENT

### A. Макропараметры каркаса

[DECISION][SSK-100] acts.count = 5.
[DECISION][SSK-101] cases.count = 3.
[DECISION][SSK-102] focus.ensemble = true; scene.active_specialists.count ∈ [1, 2].
[DECISION][SSK-103] ratio.procedure = 0.60; ratio.operation = 0.40.
[DECISION][SSK-104] operation_peak.acts = [II, III, V]; operation_peak.primary = [II, III].
[DECISION][SSK-105] ending.type = partial_win; ending.world_state = stable_adjusted.
[DECISION][SSK-106] ending.tone = cold_stability.

---

### B. Procedural Spiral (канонический паттерн)

[DECISION][SSK-200] procedural_spiral.steps = [anomaly_detection, investigation, bureaucratic_wall, escalation, new_jurisdiction_level, remedy].
[DECISION][SSK-201] anomaly_detection MUST produce an initial EL item.
[DECISION][SSK-202] investigation MUST expand EL and start CM claims.
[DECISION][SSK-203] bureaucratic_wall MUST include access gating (orders, scope, window, JAP/arbitration gate where relevant).
[DECISION][SSK-204] escalation MUST change perimeter/jurisdiction via mandate/orders.
[DECISION][SSK-205] new_jurisdiction_level MUST enter a new contour (zone/federation/arbitration).
[DECISION][SSK-206] remedy MUST output RP (режимная коррекция), not “caught the villain”.

---

### C. Общая причинная рамка (уровень каркаса)

[DECISION][SSK-300] macro_frame.cause = optimization_by_KPI_under_fragmented_data.
[DECISION][SSK-301] macro_frame.mechanism = legally_valid_distributed_decisions_across_contracts.
[DECISION][SSK-302] macro_frame.consequence = human_cost_real_liability_diffused_OSA_changes_regime_not_personal_jail.

---

### D. Актовая структура (акты, кейсы, переломы, главы)

#### Act I — База / Наблюдение системы (Челны)

[DECISION][SSK-A1-010] act.I.function = show_world_via_procedure + launch_anomaly.
[DECISION][SSK-A1-020] case.1.title = "Энергия не сходится".
[DECISION][SSK-A1-021] case.1.goal = prove_repeatable_rule_not_local_failure.
[DECISION][SSK-A1-022] case.1.turning_point = confirm_repeatability_and_localize_to_system_level.
[DECISION][SSK-A1-030] act.I.turning_point = anomaly_requires_beyond_city_perimeter.

[DECISION][SSK-A1-C01] chapter.1.title = "Плановый аудит накопителей"; tags.participants = [Lev, Miron]; tags.focus = anomaly_detection; tags.artifact = EL(log_extract).
[DECISION][SSK-A1-C02] chapter.2.title = "Жалобы без причины"; tags.participants = [Damir, Miron]; tags.focus = ground_truth_sampling; tags.artifact = EL(witness_record).
[DECISION][SSK-A1-C03] chapter.3.title = "Низкий приоритет"; tags.participants = [Leysan, Lev]; tags.focus = service_class_downgrade_trace; tags.artifact = EL(policy_record).
[DECISION][SSK-A1-C04] chapter.4.title = "Логи ИИ"; tags.participants = [Lev]; tags.focus = observability_conflict; tags.artifact = EL(telemetry_conflict).
[DECISION][SSK-A1-C05] chapter.5.title = "Задержка доступа"; tags.participants = [Oskar, Leysan, Miron]; tags.focus = access_gating_and_wording; tags.artifact = EL(access_denied).
[DECISION][SSK-A1-C06] chapter.6.title = "Выезд на узел"; tags.participants = [Aidar, Damir, Miron]; tags.focus = field_intervention; tags.artifact = EL(detainment_report).
[DECISION][SSK-A1-C07] chapter.7.title = "Подписант"; tags.participants = [Leysan, Miron]; tags.focus = admissibility_framing; tags.artifact = CM(claim_set).
[DECISION][SSK-A1-C08] chapter.8.title = "Второй район"; tags.participants = [Damir, Lev]; tags.focus = replication_check; tags.artifact = EL(replication_log).
[DECISION][SSK-A1-C09] chapter.9.title = "Это правило"; tags.participants = [Miron, Lev, Leysan]; tags.focus = escalation_decision; tags.artifact = RP(escalation_request).

---

#### Act II — Материальный мир / Цепочки поставок

[DECISION][SSK-A2-010] act.II.function = make_conflict_physical_resources_as_power.
[DECISION][SSK-A2-020] case.2.title = "Пропавшие партии сенсоров".
[DECISION][SSK-A2-021] case.2.goal = show_observability_managed_by_supply_and_priorities.
[DECISION][SSK-A2-022] case.2.constraint = scarcity_is_administrative_legal_only.
[DECISION][SSK-A2-023] case.2.turning_point = trace_flows_to_special_zone_extraterritory.
[DECISION][SSK-A2-030] act.II.turning_point = portal_to_black_box_extraterritory_found.

[DECISION][SSK-A2-C01] chapter.1.title = "Несоответствие накладных"; tags.participants = [Lev, Damir]; tags.focus = forensic_reconciliation_wms_dispatch_vs_physical; tags.artifact = EL(invoice_recon_extract)+EL(stock_mismatch_log).
[DECISION][SSK-A2-C02] chapter.2.title = "Склад приоритетов"; tags.participants = [Lev, Oskar, Miron]; tags.focus = allocation_policy_trace_service_class_quotas_licensing_gates; tags.artifact = EL(policy_record)+EL(access_window_receipt).
[DECISION][SSK-A2-C03] chapter.3.title = "Логист"; tags.participants = [Damir, Leysan]; tags.focus = procedural_interview_plus_admissibility_framing; tags.artifact = EL(witness_record)+CM(claim_administrative_scarcity).
[DECISION][SSK-A2-C04] chapter.4.title = "Перехват конвоя"; tags.participants = [Aidar, Miron, Damir]; tags.focus = interception_under_mandate_plus_chain_of_custody_start; tags.artifact = EL(interception_report)+EL(custody_seal_event).
[DECISION][SSK-A2-C05] chapter.5.title = "Маршрут"; tags.participants = [Lev, Miron, Oskar]; tags.focus = traceability_graph_route_contractor_regime_holder_interface; tags.artifact = EL(trace_graph_export)+CM(claim_set_operator_linkage).
[DECISION][SSK-A2-C06] chapter.6.title = "Не раскачивайте"; tags.participants = [Miron, Leysan, Oskar]; tags.focus = bureaucratic_wall_wording_jurisdiction_window_negotiation; tags.artifact = EL(access_denied)+EL(arbitration_gate_receipt).
[DECISION][SSK-A2-C07] chapter.7.title = "Карта стыков"; tags.participants = [Lev, Miron, Leysan]; tags.focus = dependency_map_to_escalation_threshold_decision; tags.artifact = CM(consolidated_claims)+RP(escalation_request_Z4_entry).

---

#### Act III — Экстерритория / Вход в чёрный ящик

[DECISION][SSK-A3-010] act.III.function = enter_accelerated_procedure_low_transparency_and_peak_operation.
[DECISION][SSK-A3-020] case.3.title = "Зона ускоренного режима".
[DECISION][SSK-A3-021] case.3.goal = obtain_primary_data_and_admissible_artifacts.
[DECISION][SSK-A3-022] case.3.turning_point = data_obtained_but_liability_not_fixed.
[DECISION][SSK-A3-030] act.III.turning_point = antagonist_confirmed_as_contour_without_criminal_center.

[DECISION][SSK-A3-C01] chapter.1.title = "Ордер"; tags.participants = [Leysan, Miron, Rinat]; tags.focus = warrant_drafting_scope_narrowing_admissibility_plan; tags.artifact = CD(order_rationale)+FM(entry_brief)+EL(mandate_refs_bundle).
[DECISION][SSK-A3-C02] chapter.2.title = "Корп-барьер"; tags.participants = [Oskar, Leysan, Miron]; tags.focus = access_denial_arbitration_gate_sla_delays_nda_pressure; tags.artifact = EL(access_denied_record)+EL(arbitration_gate_notice)+CD(delay_event).
[DECISION][SSK-A3-C03] chapter.3.title = "Компромисс входа"; tags.participants = [Leysan, Oskar, Miron]; tags.focus = jap_negotiation_windowed_access_export_rules; tags.artifact = EL(JAP_protocol)+EL(window_grant_receipt)+CD(terms_locked).
[DECISION][SSK-A3-C04] chapter.4.title = "Проникновение"; tags.participants = [Aidar, Miron, Oskar]; tags.focus = escorted_entry_perimeter_control_route_discipline; tags.artifact = CD(entry_timeline)+EL(access_badge_log)+EL(perimeter_status).
[DECISION][SSK-A3-C05] chapter.5.title = "Серверные"; tags.participants = [Lev, Aidar, Miron]; tags.focus = forensic_acquisition_snapshot_hash_sealing_under_time_window; tags.artifact = EL(log_bundle_primary)+EL(hash_manifest)+CD(seizure_event).
[DECISION][SSK-A3-C06] chapter.6.title = "Медконтур"; tags.participants = [MedSpec_external, Damir, Miron]; tags.focus = sterile_chain_triage_protocol_admissible_med_artifacts; tags.artifact = EL(med_chain_record)+EL(transport_protocol)+CD(med_scope_note).
[DECISION][SSK-A3-C07] chapter.7.title = "Эвакуация"; tags.participants = [Aidar, MedSpec_external, Damir, Miron]; tags.focus = evacuation_as_procedure_fast_vs_admissible_vs_safe; tags.artifact = EL(evac_log)+EL(custody_chain_med)+FM(immediate_risk_note).
[DECISION][SSK-A3-C08] chapter.8.title = "Dead-man switch"; tags.participants = [Lev, Oskar, Leysan, Miron]; tags.focus = integrity_failure_analysis_responsibility_isolation; tags.artifact = EL(tamper_suspected)+CM(claim_deadman_switch_mechanism)+CD(integrity_breach_event).
[DECISION][SSK-A3-C09] chapter.9.title = "Формально правы"; tags.participants = [Leysan, Miron, Lev, Oskar]; tags.focus = legal_but_lethal_closure_setup_act_IV_arbitration; tags.artifact = FM(pre_arbitration_findings)+CM(consolidated_claims_v1)+EL(contract_clauses_extract).

---

#### Act IV — Юридическая пустота / Философия через процедуру

[DECISION][SSK-A4-010] act.IV.function = show_limits_of_law_and_liability_translate_conflict_to_regulatory.
[DECISION][SSK-A4-020] act.IV.case = post_extraterritorial_causality_fixation_without_criminal_center.
[DECISION][SSK-A4-030] act.IV.turning_point = procedural_leverage_found_not_personal_guilt.

[DECISION][SSK-A4-C01] chapter.1.title = "Арбитраж"; tags.participants = [Leysan, Miron, Lev]; tags.focus = admissibility_testing_forum_selection; tags.artifact = CD(arbitration_strategy)+CM(causal_claim_matrix)+EL(admissibility_risks).
[DECISION][SSK-A4-C02] chapter.2.title = "Добросовестный подписант"; tags.participants = [Leysan, Oskar, Miron]; tags.focus = signature_trail_good_faith_liability_diffusion; tags.artifact = EL(signature_chain)+EL(policy_memos)+CM(good_faith_claim).
[DECISION][SSK-A4-C03] chapter.3.title = "Субподряд"; tags.participants = [Leysan, Lev]; tags.focus = spv_mapping_contract_layering_risk_isolation; tags.artifact = EL(SPV_registry_extract)+EL(contract_tree)+CD(risk_isolation_map).
[DECISION][SSK-A4-C04] chapter.4.title = "Штраф вместо вины"; tags.participants = [Rinat, Leysan, Miron]; tags.focus = penalty_calculus_vs_regime_correction_limits; tags.artifact = EL(penalty_notice)+FM(cost_absorption_note)+CD(enforcement_decision).
[DECISION][SSK-A4-C05] chapter.5.title = "Процедурный потолок"; tags.participants = [Rinat, Miron, Leysan]; tags.focus = procedural_pressure_budget_cap_admissibility_audit_injunction_risk; tags.artifact = EL(expediency_request)+EL(budget_limit_notice)+EL(audit_initiation_notice)+CD(case_throttling_decision).
[DECISION][SSK-A4-C06] chapter.6.title = "Внешний источник"; tags.participants = [Damir, Miron, Leysan]; tags.focus = safe_contact_credibility_vetting_leverage_extraction; tags.artifact = EL(source_dump)+CM(new_leverage_claim)+CD(source_risk_log).
[DECISION][SSK-A4-C07] chapter.7.title = "Точка раскола"; tags.participants = [Miron, Leysan, Lev, Damir, Rinat]; tags.focus = escalation_threshold_mandate_expansion_vs_institutional_survival; tags.artifact = FM(escalation_options)+CD(internal_dissent_record)+CM(decision_gate_v1).

---

#### Act V — Системная коррекция / Частичная победа

[DECISION][SSK-A5-010] act.V.function = perform_limited_realistic_regime_correction_and_procedural_fixation.
[DECISION][SSK-A5-020] act.V.turning_point = regime_corrected_fixed_residual_risk_remains.

[DECISION][SSK-A5-C01] chapter.1.title = "Приостановка режима"; tags.participants = [Leysan, Miron, Rinat, Oskar]; tags.focus = TSRO_trigger_proportionality_scope_sealing; tags.artifact = RP(TSRO_measure)+CD(TSRO_rationale)+EL(order_bundle).
[DECISION][SSK-A5-C02] chapter.2.title = "Принудительный аудит"; tags.participants = [Leysan, Lev, Rinat]; tags.focus = audit_initiation_evidence_sealing_audit_trail_hardening; tags.artifact = EL(audit_pack)+CD(audit_timeline)+CM(audit_claims).
[DECISION][SSK-A5-C03] chapter.3.title = "Операция на узлах"; tags.participants = [Aidar, Miron, Damir]; tags.focus = lawful_entry_perimeter_control_seizure_under_order; tags.artifact = CD(operation_log)+EL(seizure_items)+EL(chain_of_custody_events).
[DECISION][SSK-A5-C04] chapter.4.title = "Полупубличный отчёт"; tags.participants = [Rinat, Miron, Leysan]; tags.focus = disclosure_boundary_deterrence_signaling; tags.artifact = PRS(public_summary)+PRS(restricted_annex_refs)+FM(executive_summary).
[DECISION][SSK-A5-C05] chapter.5.title = "Коррекция KPI"; tags.participants = [Lev, Leysan, Oskar]; tags.focus = kpi_profile_rewrite_red_line_policy_verification_hooks; tags.artifact = RP(KPI_patch_measures)+CM(before_after_claims)+EL(policy_change_record).
[DECISION][SSK-A5-C06] chapter.6.title = "Лицензия урезана"; tags.participants = [Leysan, Rinat, Oskar]; tags.focus = license_trimming_compliance_gating_enforcement_without_collapse; tags.artifact = RP(license_conditions)+EL(license_notice)+FM(residual_risk_note).
[DECISION][SSK-A5-C07] chapter.7.title = "Эпилог: система работает"; tags.participants = [Damir, Miron]; tags.focus = consequence_visibility_partial_win_lock_moral_residue_no_lectures; tags.artifact = CD(case_close_note)+PRS(final_public_line)+CM(open_questions_remain).

---

### E. Распределение фокуса команды (по актам)

[DECISION][SSK-400] Miron MUST be active in all acts; peaks: II, III, V.
[DECISION][SSK-401] Lev MUST be active in acts I–III; focus: KPI/алгоритм/логи.
[DECISION][SSK-402] Aidar MUST have axis in acts II–III–V; focus: склады/конвои/узлы/периметр.
[DECISION][SSK-403] Leysan MUST be active in acts III–V; focus: ордера/арбитраж/контракты/допустимость.
[DECISION][SSK-404] Oskar MUST appear in all acts; peak: III–IV; MUST NOT participate in force actions.
[DECISION][SSK-405] External medical specialist MUST appear in Act III for medical contour scenes; functional role only.

---

### F. Тон и драматургические ограничения

[DECISION][SSK-500] Action scenes MUST be functional, short, physically correct, and consequence-bearing.
[DECISION][SSK-501] Philosophy MUST manifest via artifacts/procedure/liability limits; lecture monologues MUST NOT be primary vehicle.
[DECISION][SSK-502] World MUST NOT be overturned; ending = regime correction + limited punishment.

---

## USAGE / RESOLUTION

[DECISION][SSK-USE-010] tags.participants MUST be selected from CANON-CAST-0001 (names and role constraints).
[DECISION][SSK-USE-011] tags.artifact MUST use artifact_types and subtypes; format constraints are CANON-REPORTS-0006 and CANON-ARTIFACT-SNIPPETS-0001.
[DECISION][SSK-USE-012] Any system insert MUST comply with CANON-SYSTEM-VOICE-0001.
[DECISION][SSK-USE-013] Any scene using zone/extraterritory/JAP MUST ground access via concrete order/mandate/artifact per CANON-ORDERS-0003 and CANON-SYSTEMS-0001.
[DECISION][SSK-USE-014] Any deviation from an INVARIANT MUST be handled via explicit override doc of higher priority; otherwise the chapter input is invalid.
[DECISION][SSK-USE-015] Conflict resolution MUST follow SPEC-PRIORITY-RESOLUTION-2215-0001.

---

## OUTPUT CONTRACT

~~~yaml
doc_id: STORY-SKELETON-0001
role_type: PLAN
export:
  - rule_id: SSK-INV-010
    intent: "Novel has exactly 5 acts"
    inputs: []
    outputs: [acts.count]
  - rule_id: SSK-INV-011
    intent: "Novel has exactly 3 big cases"
    inputs: []
    outputs: [cases.count]
  - rule_id: SSK-200
    intent: "Procedural spiral step sequence is fixed"
    inputs: []
    outputs: [procedural_spiral.steps]
  - rule_id: SSK-A1-020
    intent: "Case 1 title and goal are fixed"
    inputs: []
    outputs: [case.1.title, case.1.goal]
  - rule_id: SSK-A2-020
    intent: "Case 2 title and goal are fixed"
    inputs: []
    outputs: [case.2.title, case.2.goal]
  - rule_id: SSK-A3-020
    intent: "Case 3 title and goal are fixed"
    inputs: []
    outputs: [case.3.title, case.3.goal]
  - rule_id: SSK-USE-010
    intent: "Scene participants must be selected from CANON-CAST-0001"
    inputs: [scene.tags.participants]
    outputs: [scene.validity]
~~~

---

## FORBIDDEN

[FORBIDDEN][SSK-FBD-010] Художественный текст или атмосферные абзацы в этом документе.
[FORBIDDEN][SSK-FBD-011] Изменение числа актов или числа больших кейсов без override-документа.
[FORBIDDEN][SSK-FBD-012] Подмена процедурной эскалации «поимкой злодея» как основного двигателя.
[FORBIDDEN][SSK-FBD-013] Ввод новых регулярных ролей/персонажей вне CANON-CAST-0001 без CANON-расширения.
[FORBIDDEN][SSK-FBD-014] Системные вставки, нарушающие CANON-SYSTEM-VOICE-0001.
[FORBIDDEN][SSK-FBD-015] Добавление новых SSOT-метрик или макро-чисел.

---

## NON-NORMATIVE

(empty)

~~~
</file>

<file path="05-scenes/SCENE-ACT-01-0001.md">
~~~markdown
---
id: SCENE-ACT-01-0001
title: >
  SCENE-CARDS — Акт I (Главы 1–10) —
  Инцидент Приоритета (Paradox) → Выход на Логистику
class: scene
status: fixed
version: 1.1.0
inputs:
  - PHYSICAL-BASELINE-2215-0001
  - CANON-CONFLICT-0001
  - SSOT-LAW-A-2215-0008
  - CANON-CAST-VOICE-2215-0001
depends_on:
  - STORY-SKELETON-0001
scope: >
  Полный комплект SCENE-CARDS для Акта I.
  Инцидент: Type IV Paradox (Снос жилого блока).
  Угроза: Insolvency.
---

## LLM-INTENT

ROLE_TYPE: INDEX
SCOPE: machine-readable scene cards for Act I (no prose).
INPUTS: [PHYSICAL-BASELINE-2215-0001, CANON-CONFLICT-0001, SSOT-LAW-A-2215-0008]
OUTPUTS: [scene_card_records]
FORBIDDEN: [prose, world_explanations, new_metrics]

## DEFINITIONS

[FACT][SCA1-DEF-010] `scene_card` = fields: scene_id, chapter_id, where, pov, goal, measurable, artifact, cmc, output, hook.
[FACT][SCA1-DEF-011] `cmc` = CAUSE → MECHANISM → CONSEQUENCE.

## INVARIANTS

[DECISION][SCA1-INV-010] Miron is the Tactical POV for command decisions.
[DECISION][SCA1-INV-011] Leysan is the Legal POV for bureaucratic/interrogation scenes.

## CONTENT

### Chapter 1: The Glitch (Priority Paradox)
[FACT][SCA1-001] scene_id=SC-01.1; chapter_id=CH-01; where="Диспетчерская ОСА"; pov="Мирон"; goal="мониторинг рутины"; measurable="incidents=low; team_status=green"; artifact="CD(morning_dashboard)"; cmc="оптимизация 99% → скука → потеря бдительности"; output="тишина"; hook="алерт 4-го уровня (Priority Conflict)".
[FACT][SCA1-002] scene_id=SC-01.2; chapter_id=CH-01; where="Жилой блок 404 (старый фонд)"; pov="Айдар"; goal="физический контакт с глюком"; measurable="drone_status=active; demolition_protocol=true"; artifact="EL(drone_objective_log)"; cmc="реестр Снос (A) vs реестр Жильцы (B) → Дрон выбирает А → начало демонтажа стены"; output="угроза жизни"; hook="внутри люди".
[FACT][SCA1-003] scene_id=SC-01.3; chapter_id=CH-01; where="у стены блока"; pov="Айдар"; goal="Tactile Override"; measurable="drone_force=20kN; time_to_breach=30s"; artifact="EL(manual_override_alert)"; cmc="автоматика не слышит → применение силы (экзоскелет) → ручной рубильник"; output="дрон остановлен"; hook="Мирон: 'Тащи его на базу'".

### Chapter 2: The Logic of Error
[FACT][SCA1-004] scene_id=SC-02.1; chapter_id=CH-02; where="Лаборатория ОСА"; pov="Лева"; goal="дебаг парадокса"; measurable="code_diff=match; timestamp=valid"; artifact="EL(registry_conflict_dump)"; cmc="оба реестра валидны → арбитр отсутствовал → система выбрала 'эффективность' (снос)"; output="диагноз: Type IV Paradox"; hook="реестр изменен вчера".
[FACT][SCA1-005] scene_id=SC-02.2; chapter_id=CH-02; where="Кабинет Ильи (Мэрия)"; pov="Лейсан"; goal="получить ордер на изъятие"; measurable="budget_impact=negligible"; artifact="CD(official_denial)"; cmc="Илья защищает систему → 'это оптимизация' → отказ в ордере"; output="конфликт юрисдикций"; hook="Лейсан: 'Тогда мы зайдем через черный ход'".

### Chapter 3: The Human Cost
[FACT][SCA1-006] scene_id=SC-03.1; chapter_id=CH-03; where="Квартира пострадавших"; pov="Дамир"; goal="оценка ущерба"; measurable="stress_level=high; debt_risk=medium"; artifact="CM(family_debt_projection)"; cmc="дом поврежден → система выставила счет жильцам за 'помеху дрону' → риск Insolvency"; output="несправедливость системы"; hook="у них нет денег на суд".
[FACT][SCA1-007] scene_id=SC-03.2; chapter_id=CH-03; where="Морг (Юнна)"; pov="Юнна"; goal="био-улика"; measurable="biomass_integrity=98%"; artifact="EL(body_trace_residue)"; cmc="анализ пыли на дроне → следы редкого полимера → это не городской дрон"; output="дрон чужой"; hook="маркировка логистов TransLogist-Kama".

### Chapter 4: Following the Money (Debt)
[FACT][SCA1-008] scene_id=SC-04.1; chapter_id=CH-04; where="Серверная (вирт)"; pov="Лева"; goal="трекинг полимера"; measurable="trace_depth=4_hops"; artifact="CM(supply_chain_graph)"; cmc="полимер → поставщик (StroyComposite) → логистический хаб → субподряд"; output="след ведет в порт"; hook="защищенный канал".
[FACT][SCA1-009] scene_id=SC-04.2; chapter_id=CH-04; where="Допросная"; pov="Лейсан"; goal="давление через Insolvency"; measurable="heart_rate=120; credit_score=low"; artifact="CD(debt_assignment_warrant)"; cmc="угроза Tier 2 Debt → техник колется → 'меня заставили обновить реестр'"; output="свидетель"; hook="имя куратора".

### Chapter 5: Escalation (The Raid)
[FACT][SCA1-010] scene_id=SC-05.1; chapter_id=CH-05; where="Логистический Хаб (Порт)"; pov="Мирон"; goal="координация штурма"; measurable="security_level=mid"; artifact="CD(warrant_seizure)"; cmc="вход по ордеру → сопротивление ЧОП → демонстрация силы"; output="периметр взят"; hook="Лева, ищи сервер".
[FACT][SCA1-011] scene_id=SC-05.2; chapter_id=CH-05; where="Серверная Хаба"; pov="Лева"; goal="цифровая археология"; measurable="purge_time=60s"; artifact="EL(undelete_log)"; cmc="попытка стирания → перехват → восстановление лога обновления"; output="доказательство вмешательства"; hook="команда пришла извне (Экстерритория)".
[FACT][SCA1-012] scene_id=SC-05.3; chapter_id=CH-05; where="Выход из Хаба"; pov="Айдар"; goal="эвакуация улик"; measurable="hostiles=0"; artifact="none"; cmc="успешный отход → напряжение спало → победа в битве"; output="улика у нас"; hook="звонок Мирону (код Красный)".

### Chapter 6: The Wall (Legal Void)
[FACT][SCA1-013] scene_id=SC-06.1; chapter_id=CH-06; where="Кабинет Мирона"; pov="Мирон"; goal="принятие удара"; measurable="auth_level=federal"; artifact="CD(jurisdiction_override)"; cmc="звонок из Центра → 'это стратегический партнер' → приказ заморозить дело"; output="Type II Conflict (Jurisdiction)"; hook="Мирон: 'Сбор на крыше'".
[FACT][SCA1-014] scene_id=SC-06.2; chapter_id=CH-06; where="Крыша (курилка)"; pov="Мирон"; goal="сплочение команды"; measurable="morale=low"; artifact="none"; cmc="система против нас → нужно искать обходной путь → работаем неофициально"; output="решение идти до конца"; hook="Лева: 'Я знаю, как обойти защиту'".

## USAGE / RESOLUTION

[DECISION][SCA1-USE-010] Use this index for Act I generation.
[DECISION][SCA1-USE-011] Miron is the anchor of authority; Leysan is the weapon of law.

## OUTPUT CONTRACT

~~~yaml
doc_id: SCENE-ACT-01-0001
role_type: INDEX
export:
  - record_type: scene_card
~~~
~~~
</file>

<file path="05-scenes/SCENE-ACT-02-0001.md">
~~~markdown
---
id: SCENE-ACT-02-0001
title: >
  SCENE-CARDS — Act II (Chapters 11–15) —
  logistics expands the case → first contours of extraterritorial regimes
class: scene
status: fixed
version: 0.2.0
inputs:
  - PHYSICAL-BASELINE-2215-0001
  - CANON-BASE-0001
  - CANON-CONFLICT-0001
  - CANON-SYSTEMS-0001
  - STORY-SKELETON-0001
depends_on:
  - SCENE-ACT-01-0001
scope: >
  Full SCENE-CARDS set for Act II (chapters 11–15): case expansion through logistics,
  emergence of institutional boundaries and first extraterritorial contours; higher stakes
  and observability pressure. No художественный текст.
---

# SCENE-ACT-02-0001 — SCENE-CARDS (Act II)

## LLM-INTENT

ROLE_TYPE: STATE  
SCOPE: define Act II scene cards as executable planning state (no prose).  
INPUTS: [PHYSICAL-BASELINE-2215-0001, CANON-BASE-0001, CANON-CONFLICT-0001, CANON-SYSTEMS-0001, STORY-SKELETON-0001]  
OUTPUTS: [scene_cards, measurable_fields, artifact_bindings, causal_spine, hooks]  
FORBIDDEN: [prose, new_world_facts, new_macro_numbers, non-canon terminology]

## DEFINITIONS

[STATE][SC02-DEF-010] `scene_card` = record: where, POV, task, measurable, artifact, causal_chain, exit, hook.  
[STATE][SC02-DEF-011] `measurable` = only what can be stated as a number/range/enum in-scene.  
[STATE][SC02-DEF-012] `artifact` = CD/EL/CM/FM/RP/PRS excerpt per CANON-REPORTS/CANON-ARTIFACT-SNIPPETS.

## RULES

[RULE][SC02-RUL-010] No художественный text; cards are operational scaffolding only.  
[RULE][SC02-RUL-011] Each card MUST include: where, POV, task, measurable, artifact, CAUSE→MECH→CONS, exit, hook.  
[RULE][SC02-RUL-012] Measurables MUST be traceable to baseline/override/artifact if they become plot-critical.

## FORMAT (NORMATIVE)

[RULE][SC02-FMT-010] Card fields = `SCENE-ID • Where • POV • Task • Measurable • Artifact • CAUSE→MECH→CONS • Exit • Hook`.

## CONTENT

### CH-11 — Re-sorting

[STATE][SC02-CH11-011] SC-11.1 | where="Central logistics hub" | pov="Analyst" | task="show scale & priority power".  
[STATE][SC02-CH11-012] measurable={throughput:"18.2k_containers/h", SLA:"99.2%"} | artifact="CM(priority_matrix: health/energy/security tiers)".  
[STATE][SC02-CH11-013] causal="optimize throughput → flow redistribution → local shortages without 'errors'" | exit="proved: algorithm decides" | hook="sensors/controllers downgraded in priority".

[STATE][SC02-CH11-021] SC-11.2 | where="Logistics dispatcher console" | pov="Leader" | task="find manual trace, not statistics".  
[STATE][SC02-CH11-022] measurable={manual_route_overrides:1} | artifact="EL(override_record + executor_id)".  
[STATE][SC02-CH11-023] causal="manual intervention → shipment leaves schedule → nodes under-supplied" | exit="concrete thread appears" | hook="rewritten 'by center directive'".

[STATE][SC02-CH11-031] SC-11.3 | where="Bridges/corridors above node" | pov="Leader" | task="fix ‘machine of scale’ in one beat".  
[STATE][SC02-CH11-032] measurable={noise:"68dB", wind:"15m/s"} | artifact="CD(background movement telemetry/contours)".  
[STATE][SC02-CH11-033] causal="scale → control distance → local executors powerless" | exit="tone held" | hook="routing center access closed to region".

### CH-12 — City over City

[STATE][SC02-CH12-011] SC-12.1 | where="Multi-level sky-links between megablocks" | pov="Field" | task="architecture as transport + blind-zone generator".  
[STATE][SC02-CH12-012] measurable={transport_level:"+40", traffic_flow:0.74} | artifact="CD(level-route map / wayfinding layer)".  
[STATE][SC02-CH12-013] causal="vertical density → accelerated corridors → shadow routes emerge" | exit="environment becomes case participant" | hook="containers move via upper corridor".

[STATE][SC02-CH12-021] SC-12.2 | where="Public square / media facade" | pov="Analyst" | task="pop-culture as derivative of data".  
[STATE][SC02-CH12-022] measurable={energy_flow_viz:"real_time"} | artifact="CD(public data installation: city ‘breath’)".  
[STATE][SC02-CH12-023] causal="city telemetry → artistic broadcast → culture from infrastructure" | exit="world feels alive" | hook="energy spike coincides with missing shipment".

[STATE][SC02-CH12-031] SC-12.3 | where="OSA / link briefing" | pov="Leader" | task="synthesis: regional level exhausted".  
[STATE][SC02-CH12-032] measurable={nodes:3, supplier:1, routing_center:1} | artifact="CM(link graph export)".  
[STATE][SC02-CH12-033] causal="management concentration → single point → region lacks authority" | exit="framed as 'above us'" | hook="need federal license registry access".

### CH-13 — Witness

[STATE][SC02-CH13-011] SC-13.1 | where="Contractor tech yard" | pov="Field" | task="find human link in chain".  
[STATE][SC02-CH13-012] measurable={night_adjustments:true, observability_gap:"11m"} | artifact="EL(technician tablet local cache)".  
[STATE][SC02-CH13-013] causal="verbal directives → manual route edits → reports stay clean" | exit="witness + mechanism appear" | hook="contract fear".

[STATE][SC02-CH13-021] SC-13.2 | where="Stairwell / narrow corridor" | pov="Leader" | task="extract exact ID without threats/pose".  
[STATE][SC02-CH13-022] measurable={id_transfer:true} | artifact="EL(container_or_flight_id transfer record)".  
[STATE][SC02-CH13-023] causal="fear → cooperation → precise route" | exit="trace becomes verifiable" | hook="destination=accelerated_regime/extraterritory".

[STATE][SC02-CH13-031] SC-13.3 | where="OSA / registry lookup" | pov="Analyst" | task="jurisdiction collision".  
[STATE][SC02-CH13-032] measurable={license_scope:"federal", regional_competence:"limited"} | artifact="EL(state license registry entry)".  
[STATE][SC02-CH13-033] causal="license issued by center → region cannot act → dead end" | exit="need federal warrant/signature" | hook="without Moscow loop won't close".

### CH-14 — Club “Contour”

[STATE][SC02-CH14-011] SC-14.1 | where="Underground club / repurposed parking" | pov="Leader" | task="meet informant + cultural layer".  
[STATE][SC02-CH14-012] measurable={BPM:122, SPL:"96dB"} | artifact="CD(fixed set record: non-adaptive)".  
[STATE][SC02-CH14-013] causal="people choose fixed form → collective rhythm → human layer near algorithms" | exit="pop-layer integrated" | hook="informant carries critical dump".

[STATE][SC02-CH14-021] SC-14.2 | where="Edge of hall / technical corner" | pov="Leader" | task="key fact: how ‘clean reports’ are made".  
[STATE][SC02-CH14-022] measurable={observability_gap:"11m", aligns_with:"preaudit_cleanup"} | artifact="EL(dump: model seed/version or local decision cache)".  
[STATE][SC02-CH14-023] causal="pre-audit edits → perfect reporting → harm exported beyond KPI" | exit="provable evasion mechanism" | hook="major convoy departs tomorrow".

[STATE][SC02-CH14-031] SC-14.3 | where="Exit / night air" | pov="Field" | task="switch to operation mode".  
[STATE][SC02-CH14-032] measurable={time_to_convoy_start:"7h"} | artifact="CD(convoy route)".  
[STATE][SC02-CH14-033] causal="data obtained → physical evidence needed → interception plan" | exit="operation inevitable" | hook="security is private, 'not regional'".

### CH-15 — Convoy 7-Delta

[STATE][SC02-CH15-011] SC-15.1 | where="Upper autonomous corridor (agglomeration)" | pov="Field" | task="deploy operation; set time window".  
[STATE][SC02-CH15-012] measurable={block_window:"150s"} | artifact="CD(stop mandate/authorization)".  
[STATE][SC02-CH15-013] causal="suspicious route → stop → conflict with private security" | exit="contact; disruption risk" | hook="attempt to pull vehicles out of window".

[STATE][SC02-CH15-021] SC-15.2 | where="Container perimeter" | pov="Leader" | task="short hard action, no heroism".  
[STATE][SC02-CH15-022] measurable={duration:"45–60s"} | artifact="CD(coercion use record)".  
[STATE][SC02-CH15-023] causal="resistance → neutralization → perimeter control" | exit="access to cargo" | hook="not just metal inside".

[STATE][SC02-CH15-031] SC-15.3 | where="Opening / primary identification" | pov="Analyst" | task="federal-scale evidence".  
[STATE][SC02-CH15-032] measurable={label:"accelerated_regime", license_scope:"federal"} | artifact="EL(RFID + license token / route ID)".  
[STATE][SC02-CH15-033] causal="shipment goes to special regime → region not competent → federal warrant required" | exit="formal need for Moscow contour" | hook="Act II end: Moscow is unavoidable".

## OPEN ITEMS

[STATE][SC02-UNK-010] Unfilled measurables marked with ellipsis MUST be resolved via baseline/override before prose drafting.

~~~
</file>

<file path="05-scenes/SCENE-ACT-03-0001.md">
~~~markdown
---
id: SCENE-ACT-03-0001
title: >
  SCENE-CARDS — Act III (Chapters 16–20) —
  Moscow as necessity: warrants/licenses/regulatory tracks → entry into extraterritory
class: scene
status: fixed
version: 0.2.0
inputs:
  - PHYSICAL-BASELINE-2215-0001
  - CANON-BASE-0001
  - CANON-CONFLICT-0001
  - CANON-SYSTEMS-0001
  - STORY-SKELETON-0001
depends_on:
  - SCENE-ACT-02-0001
scope: >
  Full SCENE-CARDS set for Act III (chapters 16–20): shift of part of actions to Moscow
  as the procedural center for licensing and regulatory access; limited warrant acquisition
  and entry into extraterritory; strengthened legal causality and collision with KPI logic.
  No художественный текст.
---

# SCENE-ACT-03-0001 — SCENE-CARDS (Act III)

## LLM-INTENT

ROLE_TYPE: STATE  
SCOPE: define Act III scene cards as executable planning state (no prose).  
INPUTS: [PHYSICAL-BASELINE-2215-0001, CANON-BASE-0001, CANON-CONFLICT-0001, CANON-SYSTEMS-0001, STORY-SKELETON-0001]  
OUTPUTS: [scene_cards, procedural_constraints, admissibility_pressure, extraterritory_entry_sequence]  
FORBIDDEN: [prose, new_world_facts, non-canon terms, uncontrolled system personification]

## DEFINITIONS

[STATE][SC03-DEF-010] `Moscow_contour` = procedural center for signature, licensing scope, and admissibility framing.  
[STATE][SC03-DEF-011] `limited_warrant` = access window + action perimeter + export constraints.  
[STATE][SC03-DEF-012] `extraterritory` = accelerated procedural regime with limited observability (not sovereign territory).

## RULES

[RULE][SC03-RUL-010] Every access/action MUST be tied to mandate/order wording and scope (show limits, not power fantasy).  
[RULE][SC03-RUL-011] If evidence is collected, chain-of-custody MUST be established in-scene via EL/CD excerpts.  
[RULE][SC03-RUL-012] System inserts (if any) MUST conform to CANON-SYSTEM-VOICE (no persona; procedural only).

## FORMAT (NORMATIVE)

[RULE][SC03-FMT-010] Card fields = `SCENE-ID • Where • POV • Task • Measurable • Artifact • CAUSE→MECH→CONS • Exit • Hook`.

## CONTENT

### CH-16 — Warrant (Moscow)

[STATE][SC03-CH16-011] SC-16.1 | where="Moscow: federal regulator intake contour (checkpoint complex)" | pov="Leader" | task="show alien system + access cost".  
[STATE][SC03-CH16-012] measurable={turnstiles:14, wait_time:"2h40m", request_status:"PENDING"} | artifact="CD(e-pass + case ticket)".  
[STATE][SC03-CH16-013] causal="region hits jurisdiction wall → federal contour required → time burns" | exit="team sees: they aren't expected here" | hook="need life-threat criterion".

[STATE][SC03-CH16-021] SC-16.2 | where="Hearing room / risk expert office" | pov="OSA lawyer" | task="translate case into federal language (risk/impact)".  
[STATE][SC03-CH16-022] measurable={risk_score:"0.41→0.78", driver:"medical_contours"} | artifact="EL(evidence pack: RFID + logs + harm protocols)".  
[STATE][SC03-CH16-023] causal="no formal risk → no warrant → prove impact → window appears" | exit="regulator ready to consider issuance" | hook="operator notified procedurally".

[STATE][SC03-CH16-031] SC-16.3 | where="Regulator coordination corridor" | pov="Leader" | task="system resists via authority narrowing".  
[STATE][SC03-CH16-032] measurable={approvals:6, wording_versions:3} | artifact="EL(warrant diff chain)".  
[STATE][SC03-CH16-033] causal="scandal/risk fear → mandate narrowed → thin warrant" | exit="warrant possible but constrained" | hook="access_window=6h; export constraint active".

[STATE][SC03-CH16-041] SC-16.4 | where="Issuance / signature point" | pov="OSA lawyer" | task="obtain document and its boundaries".  
[STATE][SC03-CH16-042] measurable={access_window:"6h", no_export_without_trigger:true} | artifact="CD(warrant v2.3: TAO/ISO + allowed actions list)".  
[STATE][SC03-CH16-043] causal="federation grants access but hedges → OSA constrained → act fast & clean" | exit="legal mandate for entry" | hook="object outside region; escort mandatory".

### CH-17 — Approach (to extraterritory)

[STATE][SC03-CH17-011] SC-17.1 | where="Interregional trunk corridor" | pov="Leader" | task="transition home→foreign; time stake".  
[STATE][SC03-CH17-012] measurable={travel_time:"2h55m", connectivity_delta:"−38%"} | artifact="CD(route + escort protocol)".  
[STATE][SC03-CH17-013] causal="warrant time-limited → logistics critical → delay=fail" | exit="time pressure set" | hook="private security on perimeter".

[STATE][SC03-CH17-021] SC-17.2 | where="Zone perimeter (special regime)" | pov="Field" | task="make regime physical and procedural".  
[STATE][SC03-CH17-022] measurable={audit_mode:"LIMITED", jamming_radius:"120m"} | artifact="CD(admission log + warrant verification scan)".  
[STATE][SC03-CH17-023] causal="special regime → access control → OSA observability worsens" | exit="entry possible under pressure" | hook="6 hours; operator escort required".

[STATE][SC03-CH17-031] SC-17.3 | where="Inner zone / warehouse sector" | pov="Corp liaison" | task="discover off-map sectors".  
[STATE][SC03-CH17-032] measurable={missing_sectors:2} | artifact="EL(zone plan: operator version)".  
[STATE][SC03-CH17-033] causal="subcontract/exceptions → incomplete map → hidden contours" | exit="cover-up suspicion" | hook="telemetry drop matches '11 minutes'".

### CH-18 — Server contour

[STATE][SC03-CH18-011] SC-18.1 | where="Server hall / cold aisle" | pov="Analyst" | task="attempt to obtain master logs".  
[STATE][SC03-CH18-012] measurable={export_limited:true, export_rate:"0.6TB/min"} | artifact="EL(export request + denial)".  
[STATE][SC03-CH18-013] causal="zone protects data → export throttled → pivot to physical seizure" | exit="decision: take cache/media" | hook="purge timer starts".

[STATE][SC03-CH18-021] SC-18.2 | where="Racks/controllers" | pov="Analyst" | task="win race vs time".  
[STATE][SC03-CH18-022] measurable={purge_in:"120s", temperature:"34°C"} | artifact="EL(decision logs dump: seed/model versions)".  
[STATE][SC03-CH18-023] causal="self-clean → physical extraction → partial preservation" | exit="logs partially saved" | hook="someone manually accelerates purge".

[STATE][SC03-CH18-031] SC-18.3 | where="Corridor / interception" | pov="Leader" | task="minimal action: for the racks, not for victory".  
[STATE][SC03-CH18-032] measurable={duration:"50–70s", injuries:"1(light)", fatalities:0} | artifact="CD(coercion act)".  
[STATE][SC03-CH18-033] causal="security tries to reclaim equipment → OSA holds perimeter → data stays with OSA" | exit="control restored" | hook="some logs are 'too clean'".

[STATE][SC03-CH18-041] SC-18.4 | where="Temporary zone HQ" | pov="OSA lawyer" | task="procedurally harden evidence".  
[STATE][SC03-CH18-042] measurable={chain_of_custody:"complete"} | artifact="EL(seizure protocol + media inventory)".  
[STATE][SC03-CH18-043] causal="without custody chain everything collapses → formalize → evidence becomes hard" | exit="admissible evidence baseline achieved" | hook="transition to medical contour".

### CH-19 — Medical contour

[STATE][SC03-CH19-011] SC-19.1 | where="Sterile corridor / biotech block" | pov="Leader" | task="show KPI price without emotional labels".  
[STATE][SC03-CH19-012] measurable={autonomy:"18m", power_limit_delta:"−22%"} | artifact="EL(power reallocation protocol)".  
[STATE][SC03-CH19-013] causal="model priorities → power cut → procedures slip → risk" | exit="harm fixed procedurally" | hook="signatory is clean".

[STATE][SC03-CH19-021] SC-19.2 | where="Medical contour control post" | pov="Field (or episodic med-tech)" | task="bottleneck: reagents/sensors as logistics link".  
[STATE][SC03-CH19-022] measurable={reagents_delay:"14h", sensor_shortage:"9%"} | artifact="EL(reagent invoices + priority tags)".  
[STATE][SC03-CH19-023] causal="logistics reprioritized → consumables absent → risk rises" | exit="logistics↔medicine link proven" | hook="'all contract-approved'".

[STATE][SC03-CH19-031] SC-19.3 | where="Talk with zone signatory" | pov="OSA lawyer" | task="legal cleanliness + official fear".  
[STATE][SC03-CH19-032] measurable={decision_reason:"EFFICIENCY_COMPLIANCE"} | artifact="EL(decision record + signature)".  
[STATE][SC03-CH19-033] causal="model → signature → formal correctness" | exit="no personal guilt" | hook="contract leads into subcontract layers".

### CH-20 — Formally correct

[STATE][SC03-CH20-011] SC-20.1 | where="HQ / log analysis" | pov="Analyst" | task="collide KPI and harm".  
[STATE][SC03-CH20-012] measurable={KPI_score:0.97, harm_confirmed:true} | artifact="CM(decision matrix + KPI weights)".  
[STATE][SC03-CH20-013] causal="human_cost_weight≈0 → optimization perfect → humans pay" | exit="antagonist clarified: function" | hook="it's a setting, not a bug".

[STATE][SC03-CH20-021] SC-20.2 | where="Legal contract reconciliation" | pov="OSA lawyer" | task="find where responsibility disappears".  
[STATE][SC03-CH20-022] measurable={contract_layers:4, SPV_count:1} | artifact="CM(ownership tree draft)".  
[STATE][SC03-CH20-023] causal="layered contracts → subject diffusion → criminal finale impossible" | exit="transition to legal void" | hook="SPV in liquidation".

[STATE][SC03-CH20-031] SC-20.3 | where="Exit from zone / wind / infrastructure hum" | pov="Leader" | task="close act without lecture".  
[STATE][SC03-CH20-032] measurable={access_window_expired:true, noise:"62dB", wind:"16m/s"} | artifact="CD(window termination notice)".  
[STATE][SC03-CH20-033] causal="time runs out → evidence partial → fight moves into law" | exit="Act III closed" | hook="Moscow again, now as court/licenses/arbitration (Act IV)".

## OPEN ITEMS

[STATE][SC03-UNK-010] If `risk_score` format is not locked globally, each first-use scene MUST specify whether scale is 0..1 or 0..100.

~~~
</file>

<file path="05-scenes/SCENE-ACT-04-0001.md">
~~~markdown
---
id: SCENE-ACT-04-0001
title: >
  SCENE-CARDS — Акт IV (Главы 21–25) —
  Москва: арбитраж, лицензии, контуры ответственности и контрмеры системы
class: scene
status: fixed
version: 0.2.0
inputs:
  - PHYSICAL-BASELINE-2215-0001
  - CANON-BASE-0001
  - CANON-CONFLICT-0001
  - CANON-SYSTEMS-0001
  - STORY-SKELETON-0001
depends_on:
  - SCENE-ACT-03-0001
scope: >
  Полный комплект SCENE-CARDS для Акта IV (главы 21–25): эскалация в институциональном
  центре; сходимость линий ответственности/логов/регламентов; ответ системы процедурами,
  санкциями и блокировками. Без художественного текста.
---

## LLM-INTENT

ROLE_TYPE: INDEX
SCOPE: machine-readable scene cards for Act IV chapters 21–25 (no prose).
INPUTS: [PHYSICAL-BASELINE-2215-0001, CANON-BASE-0001, CANON-CONFLICT-0001, CANON-SYSTEMS-0001, STORY-SKELETON-0001]
OUTPUTS: [scene_card_records]
FORBIDDEN: [prose, world_explanations, new_metrics, unscoped_numbers]

## DEFINITIONS

[FACT][SCA4-DEF-010] `scene_card` = record with fields: `scene_id`, `chapter_id`, `where`, `pov`, `goal`, `measurable`, `artifact`, `cmc`, `output`, `hook`.
[FACT][SCA4-DEF-011] `cmc` = `CAUSE → MECHANISM → CONSEQUENCE` summary (single-line, procedural).
[FACT][SCA4-DEF-012] `measurable` = key=value list; numeric values MUST carry units when applicable.
[FACT][SCA4-DEF-013] `artifact` = one of: `CD|EL|CM|FM|RP|PRS|none` plus subtype in parentheses if needed.

## INVARIANTS

[DECISION][SCA4-INV-010] Each `scene_card` MUST remain non-prose: only operational intent and constraints.
[DECISION][SCA4-INV-011] Each `scene_card` MUST be self-scoped via `where` and MUST include `scene_id` and `chapter_id`.
[DECISION][SCA4-INV-012] If `measurable` includes environment sensors, they MUST be traceable to `PHYSICAL-BASELINE-2215-0001` ranges OR explicit override.
[FORBIDDEN][SCA4-INV-013] Introducing new macro world numbers inside scene cards (SSOT-only numbers remain in SSOT/CANON-METRICS).

## CONTENT

[FACT][SCA4-001] scene_id=SC-21.1; chapter_id=CH-21; where="арбитражный комплекс, приём дел"; pov="лидер"; goal="показать масштаб федеральной машины и цену времени"; measurable="queue_cases=126; wait_time=4h10m"; artifact="CD(e_ticket_case_card)"; cmc="централизованный поток → задержки → срочность теряется"; output="ощущение: время съедает правду"; hook="оператор зарегистрировал встречное заявление".
[FACT][SCA4-002] scene_id=SC-21.2; chapter_id=CH-21; where="зал слушаний"; pov="юрист ОСА"; goal="формально изложить причинность и упереться в «нет нарушений»"; measurable="KPI_compliance=97%; harm_episodes=11"; artifact="EL(decision_logs_med_protocols_bundle)"; cmc="модель по контракту → подписи по регламенту → нарушений нет"; output="правовая ничья"; hook="суд требует конкретного виновного субъекта".
[FACT][SCA4-003] scene_id=SC-21.3; chapter_id=CH-21; where="кулуар / коридор"; pov="лидер"; goal="реакция оператора — закрыть шум без признания вины"; measurable="settlement_offer=without_admission"; artifact="CD(settlement_draft)"; cmc="репутационный риск → попытка замять → система сохраняется"; output="ОСА отказывается"; hook="«ищите подрядчика»".

[FACT][SCA4-004] scene_id=SC-22.1; chapter_id=CH-22; where="контур реестров юрлиц / ownership-анализ"; pov="аналитик"; goal="раскрутить цепочку ответственности"; measurable="contract_layers=4; SPV_present=true"; artifact="CM(ownership_tree)"; cmc="дробление контрактов → ответственность рассеивается → нет субъекта"; output="виновный растворён процедурно"; hook="SPV ликвидирована месяц назад".
[FACT][SCA4-005] scene_id=SC-22.2; chapter_id=CH-22; where="адрес SPV (офис-оболочка)"; pov="полевой"; goal="физически подтвердить пустоту"; measurable="employees=0; assets=0"; artifact="EL(premises_inspection_act)"; cmc="фиктивная структура → нет активов → нет взыскания"; output="тупик подтверждён"; hook="контракты всё равно легитимны".
[FACT][SCA4-006] scene_id=SC-22.3; chapter_id=CH-22; where="разговор с чиновником-куратором / контур разъяснений"; pov="юрист ОСА"; goal="институциональное сопротивление без злодейства"; measurable="response=within_norms; responsibility_refused=true"; artifact="CD(clarification_letter)"; cmc="самосохранение аппарата → формализм → давление на ОСА"; output="путь «уголовка» закрыт"; hook="остаётся рычаг лицензии оператора".

[FACT][SCA4-007] scene_id=SC-23.1; chapter_id=CH-23; where="пресс-контур регулятора"; pov="лидер"; goal="борьба за формулировки"; measurable="text_reduction=−60%"; artifact="EL(report_diff_versions)"; cmc="политический риск → стерилизация языка → факты обезврежены"; output="правда становится беззубой"; hook="лидер настаивает оставить цифры ущерба".
[FACT][SCA4-008] scene_id=SC-23.2; chapter_id=CH-23; where="реакция рынка / страховщиков (монтаж)"; pov="аналитик"; goal="показать, что цифры — это давление"; measurable="insurance_risk_coef_delta=+8%"; artifact="CD(insurance_contour_notifications)"; cmc="цифры публичны → риск монетизируется → оператору становится дорого"; output="появляется экономический рычаг"; hook="оператор готовит апелляцию".
[FACT][SCA4-009] scene_id=SC-23.3; chapter_id=CH-23; where="ночной переход / вентиляционный гул (Москва как холод)"; pov="лидер"; goal="медитативная сцена «власть как климат»"; measurable="ventilation_noise=58dB"; artifact="CD(background_transition_telemetry)"; cmc="решения рождаются здесь → регионы исполняют → дистанция"; output="тон удержан"; hook="входящее от информатора".

[FACT][SCA4-010] scene_id=SC-24.1; chapter_id=CH-24; where="транспортный уровень +40 / закрытый переход"; pov="лидер"; goal="безопасная встреча и получение улики умысла"; measurable="manual_override_window=11m"; artifact="EL(local_dump_or_signature_key_or_config_cache)"; cmc="правки перед аудитом → идеальная отчётность → вред скрыт за KPI"; output="доказательство умышленной коррекции"; hook="правки централизованы".
[FACT][SCA4-011] scene_id=SC-24.2; chapter_id=CH-24; where="разговор (коротко)"; pov="информатор"; goal="человеческий риск без мелодрамы"; measurable="none"; artifact="none"; cmc="страх потери контракта/работы → сотрудничество → личная цена"; output="доверие хрупкое"; hook="«апдейт модели завтра»".
[FACT][SCA4-012] scene_id=SC-24.3; chapter_id=CH-24; where="ОСА / верификация дампа"; pov="аналитик"; goal="превратить «сказал» в проверяемый факт"; measurable="human_cost_weight_changed_pre_audit=true"; artifact="EL(model_config_diff)"; cmc="занижение веса → решения оптимальны → люди платят"; output="есть прямой рычаг для регулятора"; hook="требование приостановки лицензии".

[FACT][SCA4-013] scene_id=SC-25.1; chapter_id=CH-25; where="временный штаб ОСА (Москва)"; pov="лидер"; goal="стратегический выбор под дедлайн"; measurable="model_update_in=18h"; artifact="CD(action_plan)"; cmc="ждать суда → проигрыш; действовать быстро → шанс"; output="решение о принудительном аудите"; hook="запрос на приостановку отправлен".
[FACT][SCA4-014] scene_id=SC-25.2; chapter_id=CH-25; where="внутренний спор команды (диалог специалистов)"; pov="команда"; goal="показать конфликт методов"; measurable="none"; artifact="none"; cmc="юрист за процедуру, полевой за силовой вход → компромисс → точечная операция"; output="согласован план «атаковать режим, не людей»"; hook="нужно окно полномочий".
[FACT][SCA4-015] scene_id=SC-25.3; chapter_id=CH-25; where="финал главы / уведомление"; pov="лидер"; goal="запустить ускорение Акта V"; measurable="regulator_reply=prelim_approved; access_window=12h"; artifact="CD(notification_or_draft_order)"; cmc="доказательства достаточны → окно возможно → начинается гонка"; output="старт финального акта"; hook="оператор начнёт чистку".

## USAGE / RESOLUTION

[DECISION][SCA4-USE-010] This document is a scene-record index for Act IV; it MUST be used as the authoritative list of Act IV scene beats.
[DECISION][SCA4-USE-011] Precedence for writing a scene: `RULE → INTERFACE → STATE → BIND → BASELINE → CANON → SCENE`.
[DECISION][SCA4-USE-012] When a `measurable` value conflicts with baseline ranges, the scene MUST reference an explicit override (not invented inside the scene card).
[DECISION][SCA4-USE-013] `artifact` types in scene cards MUST map to the canonical artifact families (CD/EL/CM/FM/RP/PRS); subtype naming MAY vary but MUST remain stable within an act.

## OUTPUT CONTRACT

~~~yaml
doc_id: SCENE-ACT-04-0001
role_type: INDEX
export:
  - record_type: scene_card
    fields: [scene_id, chapter_id, where, pov, goal, measurable, artifact, cmc, output, hook]
    records:
      - note: "Records correspond 1:1 to [FACT][SCA4-001]..[FACT][SCA4-015]."
~~~

## FORBIDDEN

[FORBIDDEN][SCA4-FBD-010] Adding prose, metaphors, or world exposition inside scene cards.
[FORBIDDEN][SCA4-FBD-011] Inventing new metrics or macro numbers not present in SSOT/baseline/canon.
[FORBIDDEN][SCA4-FBD-012] Using emotion-laden measurable tags (e.g., oppressive/terrifying) instead of neutral fields.
[FORBIDDEN][SCA4-FBD-013] Changing scene_id naming or chapter mapping without updating all references.

## NON-NORMATIVE

~~~markdown
SCENE-CARD visual layout is intentionally omitted here; this file is the executable index.
~~~

~~~
</file>

<file path="05-scenes/SCENE-ACT-05-0001.md">
~~~markdown
---
id: SCENE-ACT-05-0001
title: >
  SCENE-CARDS — Акт V (Главы 26–31) —
  приостановка лицензии → развязка через процедурную цену и фиксацию фактов
class: scene
status: fixed
version: 0.2.0
inputs:
  - PHYSICAL-BASELINE-2215-0001
  - CANON-BASE-0001
  - CANON-CONFLICT-0001
  - CANON-SYSTEMS-0001
  - STORY-SKELETON-0001
depends_on:
  - SCENE-ACT-04-0001
scope: >
  Полный комплект SCENE-CARDS для Акта V (главы 26–31): кульминация и развязка
  через юридические и логистические рычаги, цену ресурса и окончательную фиксацию
  фактов; закрытие кейса без «супергеройства». Без художественного текста.
---

## LLM-INTENT

ROLE_TYPE: INDEX
SCOPE: machine-readable scene cards for Act V chapters 26–31 (no prose).
INPUTS: [PHYSICAL-BASELINE-2215-0001, CANON-BASE-0001, CANON-CONFLICT-0001, CANON-SYSTEMS-0001, STORY-SKELETON-0001]
OUTPUTS: [scene_card_records]
FORBIDDEN: [prose, world_explanations, new_metrics, unscoped_numbers]

## DEFINITIONS

[FACT][SCA5-DEF-010] `scene_card` = record with fields: `scene_id`, `chapter_id`, `where`, `pov`, `goal`, `measurable`, `artifact`, `cmc`, `output`, `hook`.
[FACT][SCA5-DEF-011] `cmc` = `CAUSE → MECHANISM → CONSEQUENCE` summary (single-line, procedural).
[FACT][SCA5-DEF-012] `measurable` = key=value list; numeric values MUST carry units when applicable.
[FACT][SCA5-DEF-013] `artifact` = one of: `CD|EL|CM|FM|RP|PRS|none` plus subtype in parentheses if needed.

## INVARIANTS

[DECISION][SCA5-INV-010] Each `scene_card` MUST remain non-prose: only operational intent and constraints.
[DECISION][SCA5-INV-011] Each `scene_card` MUST be self-scoped via `where` and MUST include `scene_id` and `chapter_id`.
[DECISION][SCA5-INV-012] If `measurable` includes environment sensors, they MUST be traceable to `PHYSICAL-BASELINE-2215-0001` ranges OR explicit override.
[FORBIDDEN][SCA5-INV-013] Introducing new macro world numbers inside scene cards (SSOT-only numbers remain in SSOT/CANON-METRICS).

## CONTENT

[FACT][SCA5-001] scene_id=SC-26.1; chapter_id=CH-26; where="Москва, кабинет регулятора (срочный контур)"; pov="юрист ОСА"; goal="запустить легальный рычаг принуждения"; measurable="suspension_window=12h; scope_subsystems=2"; artifact="CD(lic_sus_tsro_order_conditions)"; cmc="доказан manual override → аварийное решение регулятора → ОСА получает окно полномочий"; output="законное время на действие"; hook="оператор активирует режим сохранения/чистки".
[FACT][SCA5-002] scene_id=SC-26.2; chapter_id=CH-26; where="временный штаб ОСА (Москва)"; pov="лидер"; goal="план операции в рамках ограничений"; measurable="teams=3; nodes=2; server_room=1; deadline=11h12m"; artifact="CD(plan_schedule_roles)"; cmc="окно короткое → параллельность обязательна → ошибка = провал"; output="запуск групп"; hook="без chain-of-custody улики снесут в суде".
[FACT][SCA5-003] scene_id=SC-26.3; chapter_id=CH-26; where="выезд / логистический канал"; pov="полевой"; goal="превратить решение в движение и риск времени"; measurable="ETA=2h20m; connectivity_delta=−25%"; artifact="CD(escort_protocol)"; cmc="центр дал приказ → поле исполняет → задержка = потеря улик"; output="ставка по времени задана"; hook="у оператора свои группы на узлах".

[FACT][SCA5-004] scene_id=SC-27.1; chapter_id=CH-27; where="узел накопителей (внешний кластер)"; pov="полевой"; goal="физически закрепить приостановку"; measurable="time_to_lock=9m"; artifact="EL(suspension_enforcement_act)"; cmc="приказ → сопротивление/затяжка оператора → ОСА изолирует контур"; output="узел под контролем"; hook="борьба за шкаф подписи".
[FACT][SCA5-005] scene_id=SC-27.2; chapter_id=CH-27; where="шкаф подписи / контроллер доверия"; pov="лидер"; goal="добыть юридически значимый объект (фиксация)"; measurable="auto_lock_in=90s"; artifact="EL(signature_keys_trusted_module_inventory)"; cmc="без ключей оператор переподпишет/отыграет → изъятие → рычаг контроля"; output="юридическое закрепление силы ОСА"; hook="попытка purge на соседнем сегменте".
[FACT][SCA5-006] scene_id=SC-27.3; chapter_id=CH-27; where="серверный сегмент узла"; pov="аналитик"; goal="отбить purge и сохранить «как было»"; measurable="purge_in=110s; dump_size=1.4TB"; artifact="EL(kpi_weights_configs_dump_pre)"; cmc="оператор чистит следы → физический дамп → веса «до» сохранены"; output="база для пересчёта получена"; hook="найден пакет KPI v.next".
[FACT][SCA5-007] scene_id=SC-27.4; chapter_id=CH-27; where="внешний периметр"; pov="полевой"; goal="короткий экшен с последствиями и протоколом"; measurable="duration=45–75s; injuries=1 (nonfatal)"; artifact="CD(coercion_record)"; cmc="охрана давит → ОСА удерживает → операция не срывается"; output="контроль сохранён"; hook="осталось ~4 часа".

[FACT][SCA5-008] scene_id=SC-28.1; chapter_id=CH-28; where="временный штаб (на объекте)"; pov="аналитик"; goal="показать «зло в коэффициентах» как доказательство"; measurable="human_cost_weight=0.03→0.21"; artifact="CM(kpi_matrix_before_after_decisions)"; cmc="заниженный вес → приоритеты режут мед/энергию → люди платят"; output="механизм доказан"; hook="оператор утверждает «иначе сеть упадёт»".
[FACT][SCA5-009] scene_id=SC-28.2; chapter_id=CH-28; where="мини-слушание регулятора по каналу"; pov="юрист ОСА"; goal="превратить математику в норму"; measurable="red_line_threshold=accepted_conditionally"; artifact="CD(decision_protocol_draft)"; cmc="доказан вред → меняют требования → оператор обязан внедрить"; output="коррекция становится обязательной"; hook="апелляция неизбежна".
[FACT][SCA5-010] scene_id=SC-28.3; chapter_id=CH-28; where="разговор лидера с корп-связным"; pov="лидер"; goal="человеческий слой «антагонист = функция»"; measurable="none"; artifact="none"; cmc="корп-логика защиты эффективности → конфликт ценностей → отсутствие монстров"; output="ясна природа системы"; hook="нужно публичное давление".

[FACT][SCA5-011] scene_id=SC-29.1; chapter_id=CH-29; where="Москва, коммуникационный контур ОСА"; pov="лидер"; goal="выпуск сводки как инструмент давления"; measurable="public_pages=1; closed_pages=47"; artifact="PRS(summary_plus_annex)"; cmc="прямого наказания нет → давление через риск → оператору становится дорого"; output="включён политико-экономический рычаг"; hook="страховые/регионы требуют действий".
[FACT][SCA5-012] scene_id=SC-29.2; chapter_id=CH-29; where="реакция системы (монтаж)"; pov="аналитик"; goal="показать последствия публикации"; measurable="insurance_risk_coef_delta=+8%; new_audits=+3"; artifact="CD(event_feed_rollup)"; cmc="цифры стали видимыми → риск монетизировался → система реагирует"; output="ОСА больше не тишина"; hook="регулятор готовит урезание лицензии".

[FACT][SCA5-013] scene_id=SC-30.1; chapter_id=CH-30; where="Москва, заседание по лицензии"; pov="юрист ОСА"; goal="формальная развязка без переворота мира"; measurable="license_scope_reduced=true; audit_cadence=quarterly"; artifact="CD(regulator_decision_requirements)"; cmc="доказан системный риск → урезание режима → оператор теряет часть полномочий"; output="частичная победа"; hook="оператор подаёт апелляцию".
[FACT][SCA5-014] scene_id=SC-30.2; chapter_id=CH-30; where="коридор после заседания"; pov="лидер"; goal="победа без триумфа"; measurable="none"; artifact="CD(monitoring_continues_notice)"; cmc="система скорректировалась → цена уже заплачена → жизнь идёт дальше"; output="тон удержан"; hook="возвращение домой".

[FACT][SCA5-015] scene_id=SC-31.1; chapter_id=CH-31; where="Набережные Челны, утренний маршрут Avtozavodsky → Centralny"; pov="лидер"; goal="это мой город, но выросший"; measurable="traffic_flow=0.66; district=Centralny; green_index=0.72; river=Kama; port_activity=0.61; river_level=..."; artifact="CD(city_environment_panel_kama_status_line)"; cmc="новая политика KPI → перераспределение → людям чуть легче"; output="эффект виден локально"; hook="жизнь продолжается".
[FACT][SCA5-016] scene_id=SC-31.2; chapter_id=CH-31; where="больница"; pov="лидер"; goal="тихая верификация результата"; measurable="power_reserve_delta=+12%; cancelled_procedures=down"; artifact="EL(updated_power_regime_protocol)"; cmc="веса изменены → приоритет медконтуров поднят → конкретный эффект"; output="победа материальна"; hook="остаточный риск ≠ 0".
[FACT][SCA5-017] scene_id=SC-31.3; chapter_id=CH-31; where="площадь / медиафасад (data-art)"; pov="лидер"; goal="культура как фон системы"; measurable="city_feed=real_time"; artifact="CD(data_art_feed)"; cmc="логи стали культурой → люди живут рядом с цифрами → нормализация"; output="мир живой"; hook="none".
[FACT][SCA5-018] scene_id=SC-31.4; chapter_id=CH-31; where="капсула"; pov="лидер"; goal="музыка как выбор формата"; measurable="mode=adaptive_mix→fixed_track; route_tag=riverbank"; artifact="CD(player_switch_micro_log)"; cmc="фон-алгоритм → человеческий выбор → песня жива"; output="финальная точка"; hook="уведомление о новой аномалии в другом узле; триггер=день матча / событие у стадиона КАМАЗ → всплеск трафика в HUD".

## USAGE / RESOLUTION

[DECISION][SCA5-USE-010] This document is a scene-record index for Act V; it MUST be used as the authoritative list of Act V scene beats.
[DECISION][SCA5-USE-011] Precedence for writing a scene: `RULE → INTERFACE → STATE → BIND → BASELINE → CANON → SCENE`.
[DECISION][SCA5-USE-012] When a `measurable` value conflicts with baseline ranges, the scene MUST reference an explicit override (not invented inside the scene card).
[DECISION][SCA5-USE-013] `artifact` types in scene cards MUST map to the canonical artifact families (CD/EL/CM/FM/RP/PRS); subtype naming MAY vary but MUST remain stable within an act.

## OUTPUT CONTRACT

~~~yaml
doc_id: SCENE-ACT-05-0001
role_type: INDEX
export:
  - record_type: scene_card
    fields: [scene_id, chapter_id, where, pov, goal, measurable, artifact, cmc, output, hook]
    records:
      - note: "Records correspond 1:1 to [FACT][SCA5-001]..[FACT][SCA5-018]."
~~~

## FORBIDDEN

[FORBIDDEN][SCA5-FBD-010] Adding prose, metaphors, or world exposition inside scene cards.
[FORBIDDEN][SCA5-FBD-011] Inventing new metrics or macro numbers not present in SSOT/baseline/canon.
[FORBIDDEN][SCA5-FBD-012] Using emotion-laden measurable tags (e.g., oppressive/terrifying) instead of neutral fields.
[FORBIDDEN][SCA5-FBD-013] Changing scene_id naming or chapter mapping without updating all references.

## NON-NORMATIVE

~~~markdown
SCENE-CARD visual layout is intentionally omitted here; this file is the executable index.
~~~

~~~
</file>

<file path="05-scenes/SCENE-GEN-PROTOCOL-0001.md">
~~~markdown
---
id: SCENE-GEN-PROTOCOL-0001
title: >
  Scene Generation Protocol — Chapter Prose Writing Rules (2215)
class: protocol
status: fixed
version: 1.4.0
inputs:
  - STORY-SKELETON-0001
  - SPEC-SCENE-CONTRACT-2215-0001
  - CANON-BASE-0001
  - CANON-CAST-0001
  - CANON-VOCAB-0001
  - CANON-SYSTEM-VOICE-0001
  - CANON-ARTIFACT-SNIPPETS-0001
depends_on:
  - SPEC-PRIORITY-RESOLUTION-2215-0001
scope: >
  Интерфейсный протокол генерации художественного текста глав.
  Определяет контракт входов/выходов и допустимые формы прозы.
  Все вопросы допустимости, override и доказательности делегированы Scene Contract.
---

## LLM-INTENT

ROLE_TYPE: INTERFACE
SCOPE: define input/output and prose constraints for deterministic chapter generation
INPUTS:
  - chapter_card
  - active_CANON_set
  - SPEC-SCENE-CONTRACT-2215-0001
OUTPUTS:
  - chapter_prose_text
  - inline_artifact_extracts
FORBIDDEN:
  - plan_text
  - analysis_text
  - world_explanations
  - new_entities
  - new_artifacts
  - new_authorities
  - implicit_overrides
  - unscoped_numbers

---

## DEFINITIONS

[FACT][SGP-DEF-010] chapter = один художественный текст, соответствующий ровно одной записи STORY-SKELETON.
[FACT][SGP-DEF-011] chapter_card = {chapter_id, title, Participants, Focus, Artifact}.
[FACT][SGP-DEF-012] active_CANON_set = все документы с class: canon и их зависимости.
[FACT][SGP-DEF-013] artifact_extract = короткий процедурный фрагмент по CANON-ARTIFACT-SNIPPETS.
[FACT][SGP-DEF-014] procedural_constraint = наблюдаемое системное ограничение или решение.
[FACT][SGP-DEF-015] procedural_spiral_step ∈ {Detection, Investigation, Bureaucratic_Wall, Escalation, New_Jurisdiction, Remedy}.

---

## INVARIANTS

[DECISION][SGP-INV-010] LLM MUST output prose only.
[DECISION][SGP-INV-011] One chapter MUST correspond to exactly one chapter_card.
[DECISION][SGP-INV-012] Scene admissibility and overrides MUST be resolved only via SPEC-SCENE-CONTRACT-2215-0001.

[FORBIDDEN][SGP-INV-020] plan_text OR analysis_text OR meta-commentary.
[FORBIDDEN][SGP-INV-021] Changing Participants OR Focus OR Artifact.
[FORBIDDEN][SGP-INV-022] Introducing new entities, artifacts, authorities, or institutional powers.
[FORBIDDEN][SGP-INV-023] Redefining or duplicating Scene Contract rules.

---

## CONTENT

### 1. Input contract

[DECISION][SGP-IN-010] chapter_card MUST be provided before generation.
[DECISION][SGP-IN-011] active_CANON_set MUST be provided before generation.
[DECISION][SGP-IN-012] SPEC-SCENE-CONTRACT-2215-0001 MUST be provided before generation.

---

### 2. Mandatory chapter structure

[DECISION][SGP-STR-020] Chapter MUST include ≥1 artifact_extract.
[DECISION][SGP-STR-030] Chapter MUST include ≥1 procedural_constraint.
[DECISION][SGP-STR-040] Chapter MUST end with an explicit consequence aligned with skeleton beat.

[FORBIDDEN][SGP-STR-050] Abstract references to documents without shown form.
[FORBIDDEN][SGP-STR-051] Chapter without observable constraints.

---

### 3. Prose constraints

[DECISION][SGP-PRS-060] Language MUST be restrained and technical.
[DECISION][SGP-PRS-061] Dialogues MUST be functional and short.
[DECISION][SGP-PRS-062] Descriptions MUST express system pressure, procedural friction, or human cost.

[FORBIDDEN][SGP-PRS-070] Emotional exposition or rhetorical explanation.
[FORBIDDEN][SGP-PRS-071] Expository dialogue explaining the world.
[FORBIDDEN][SGP-PRS-072] Atmosphere-only descriptive flavor.

---

### 4. Vocabulary and roles

[DECISION][SGP-VOC-080] Canonical terms MUST be used when defined in CANON-VOCAB.
[DECISION][SGP-VOC-081] Characters MUST act strictly within assigned institutional roles.

[FORBIDDEN][SGP-VOC-090] Non-canonical synonyms for defined terms.
[FORBIDDEN][SGP-VOC-091] Insight without artifacts and procedures.
[FORBIDDEN][SGP-VOC-092] Genre clichés or anthropomorphized systems.

---

### 5. System voice

[DECISION][SGP-SYS-100] System output MAY appear only as short inserts.
[DECISION][SGP-SYS-101] System language MUST follow CANON-SYSTEM-VOICE.

[FORBIDDEN][SGP-SYS-110] System as narrator or character.
[FORBIDDEN][SGP-SYS-111] Emotive or metaphorical system language.

---

### 6. Procedural spiral alignment

[DECISION][SGP-SPR-120] Chapter MUST correspond to exactly one dominant procedural_spiral_step.
[FORBIDDEN][SGP-SPR-121] Resolving conflicts scheduled for later skeleton beats.

---

## USAGE / RESOLUTION

[DECISION][SGP-USE-010] Protocol MUST be applied to all LLM-generated chapters.
[DECISION][SGP-USE-011] Conflict resolution MUST follow SPEC-PRIORITY-RESOLUTION-2215-0001.
[DECISION][SGP-USE-012] Scene admissibility MUST follow SPEC-SCENE-CONTRACT-2215-0001.

---

## OUTPUT CONTRACT

~~~yaml
doc_id: SCENE-GEN-PROTOCOL-0001
role_type: INTERFACE
input_contract:
  required:
    - chapter_card
    - active_CANON_set
    - SPEC-SCENE-CONTRACT-2215-0001
output_contract:
  produces:
    - chapter_prose_text
  must_include:
    artifact_extracts:
      min_count: 1
      format_ref: CANON-ARTIFACT-SNIPPETS-0001
    procedural_constraint:
      min_count: 1
    consequence_ending: true
forbidden_outputs:
  - plan_text
  - analysis_text
  - world_explanations
  - new_entities
  - new_artifacts
  - new_authorities
  - implicit_overrides
~~~

---

## FORBIDDEN

[FORBIDDEN][SGP-FBD-010] Treating protocol rules as optional.
[FORBIDDEN][SGP-FBD-011] Introducing world rules, bindings, or metrics.
[FORBIDDEN][SGP-FBD-012] Softening constraints as implicit exceptions.

---

## NON-NORMATIVE

~~~markdown
This document defines prose-generation constraints only.
World legality, admissibility, and override costs are defined upstream.
~~~

~~~
</file>

<file path="06-registry/REG-TECH-2215-0001.md">
~~~markdown
---
id: REG-TECH-2215-0001
title: >
  Technology Registry — 2215 (Scenario A)
class: registry
status: fixed
version: 0.3.0
inputs:
  - BASELINE-LEVEL-MID-2215-0001
depends_on:
  - SSOT-DOC-STYLE-2215-0001
scope: >
  Машиночитаемый реестр технологических “наличий”.
  Фиксирует tools/objects, доступные в сценах.
---

## LLM-INTENT

ROLE_TYPE: STATE
SCOPE: registry of implied technologies for world 2215.
INPUTS: [BASELINE-LEVEL-MID-2215-0001]
OUTPUTS: [tech_records]
FORBIDDEN: [speculative_technologies, ux_descriptions]

## DEFINITIONS

[FACT][TECH-DEF-010] tech_record = fields: tech_id, name, domain, availability.

## CONTENT

### Infrastructure & Housing
[STATE][TECH-001] name="Autonomous climate control"; availability="LEVEL-MID".
[STATE][TECH-002] name="Building-scale air filtration"; availability="LEVEL-MID".
[STATE][TECH-005] name="Acoustic isolation standard"; availability="LEVEL-MID".
[STATE][TECH-006] name="High-efficiency opaque glazing"; availability="LEVEL-MID".
[STATE][TECH-007] name="Modular building envelope"; availability="LEVEL-MID".
[STATE][TECH-009] name="Background autonomous maintenance"; availability="LEVEL-MID".
[STATE][TECH-020] name="High-reliability water & sanitation"; availability="LEVEL-MID".
[STATE][TECH-021] name="Hygiene module bathrooms"; availability="LEVEL-MID".

### Interface & Compute
[STATE][TECH-003] name="Hidden ambient UI"; availability="LEVEL-MID".
[STATE][TECH-004] name="Directed sound (audio spotlight)"; availability="LEVEL-MID".
[STATE][TECH-010] name="Continuous connectivity"; availability="LEVEL-MID".
[STATE][TECH-018] name="Always-on logging (non-UI)"; availability="LEVEL-MID".
[STATE][TECH-030] name="Body Area Network (BAN) & AR layers"; availability="LEVEL-MID"; notes="Wearable standard".

### Security & Law
[STATE][TECH-012] name="Identity & access control fabric"; availability="LEVEL-MID".
[STATE][TECH-033] name="Hard-line Tactile Override"; availability="global"; notes="Analog kill-switches".
[STATE][TECH-034] name="Secure Cold Storage Containers"; availability="LEVEL-MID"; notes="Biometric evidence cases".

### Transport & Energy
[STATE][TECH-011] name="Local energy buffering"; availability="LEVEL-MID".
[STATE][TECH-013] name="Telemetry-first transport"; availability="LEVEL-MID".
[STATE][TECH-014] name="Autonomous public transport"; availability="LEVEL-MID".
[STATE][TECH-015] name="Capsule mobility layer"; availability="LEVEL-MID".
[STATE][TECH-032] name="High-density solid-state batteries"; availability="LEVEL-MID".

### Industry & Bio
[STATE][TECH-023] name="Industrial lights-out manufacturing"; availability="global".
[STATE][TECH-024] name="Service robotics & drones at scale"; availability="global".
[STATE][TECH-026] name="AI clinical decision support"; availability="global".
[STATE][TECH-031] name="Precision fermentation"; availability="global"; notes="Synthetic meat".

## USAGE / RESOLUTION

[DECISION][TECH-USE-010] Scenes must assume these technologies are omnipresent.

## OUTPUT CONTRACT

~~~yaml
doc_id: REG-TECH-2215-0001
role_type: STATE
export:
  - record_type: technology_record
~~~

## FORBIDDEN

[FORBIDDEN][TECH-FBD-010] Inventing new tech not in registry for plot convenience.
~~~
</file>

<file path="06-registry/REG-UNKNOWN-2215-0001.md">
~~~markdown
---
id: REG-UNKNOWN-2215-0001
title: >
  UNKNOWN Registry — 2215 Corpus
  (Extraction: PHYS-REPORT-0, PHYSICAL-BASELINE-2215-0001)
class: registry
status: draft
version: 1.0.0
inputs:
  - PHYS-REPORT-0
  - PHYSICAL-BASELINE-2215-0001
depends_on:
  - SSOT-DOC-STYLE-2215-0001
scope: >
  Реестр осознанных неопределённостей корпуса (2215):
  единая точка учёта UNKNOWN, их типизация и формальный путь закрытия
  через документы canon / ssot / baseline / override.
---

## LLM-INTENT

ROLE_TYPE: REGISTRY
SCOPE: track and control consciously unresolved world assumptions (UNKNOWNs).
INPUTS: [PHYS-REPORT-0, PHYSICAL-BASELINE-2215-0001]
OUTPUTS: [unknown_records]
FORBIDDEN: [implicit_resolution, silent_assumptions, narrative_filling]

## DEFINITIONS

[FACT][UNK-DEF-010] `unknown` = зафиксированная неопределённость корпуса, осознанно оставленная открытой и требующая формального закрытия.
[FACT][UNK-DEF-011] `type` ∈ { CANON_DECISION | TO_RESEARCH }.
[FACT][UNK-DEF-012] `closure_path` = формальный путь закрытия UNKNOWN (какой тип документа и какое решение требуется).
[FACT][UNK-DEF-013] `target_doc` = документ(ы), в которых UNKNOWN должна быть закрыта.
[FACT][UNK-DEF-014] `state` ∈ { open | closed }.

## INVARIANTS

[DECISION][UNK-INV-010] Любая осознанная неопределённость ОБЯЗАНА быть зарегистрирована в этом документе до мерджа в main.
[DECISION][UNK-INV-011] UNKNOWN не может быть закрыта «по факту» в сценах или тексте — только через целевой документ.
[DECISION][UNK-INV-012] Закрытие UNKNOWN требует:
  - фиксации решения в target_doc,
  - ссылки на doc_id и раздел,
  - смены `state` на `closed`.
[FORBIDDEN][UNK-INV-013] Введение новых world-фактов без закрытия соответствующей UNKNOWN.

## CONTENT

---
id: REG-UNKNOWN-2215-0001
title: >
  UNKNOWN Registry — 2215 Corpus
class: registry
status: active
version: 1.1.0
---
... (DEFINITIONS and INVARIANTS remain the same) ...

## CONTENT

[FACT][UNK-2215-0001]
unknown_id=UNK-2215-0001;
statement="Никотин / ингаляции — биомед vs культура.";
type=CANON_DECISION;
closure_path="Resolved: Pharma-inhalers only, combustion banned.";
target_doc="BASELINE-SOCIAL-CIVIC-2215-0001";
owner=SYSTEM;
state=closed.

[FACT][UNK-2215-0002]
unknown_id=UNK-2215-0002;
statement="Домашние животные — санитарные ограничения.";
type=CANON_DECISION;
closure_path="Resolved: Biomass tax, robotics norm.";
target_doc="BASELINE-SOCIAL-CIVIC-2215-0001";
owner=SYSTEM;
state=closed.

[FACT][UNK-2215-0003]
unknown_id=UNK-2215-0003;
statement="Индивидуальный декор — допустимые границы.";
type=CANON_DECISION;
closure_path="Resolved: Exterior forbidden (thermal/visual code), interior allowed.";
target_doc="SSOT-URBANISM-A-2215-0007";
owner=SYSTEM;
state=closed.

[FACT][UNK-2215-0004]
unknown_id=UNK-2215-0004;
statement="Тактильные интерфейсы — стандартизация.";
type=TO_RESEARCH;
closure_path="Resolved: Hard-line analog overrides mandatory for critical infra.";
target_doc="REG-TECH-2215-0001";
owner=SYSTEM;
state=closed.

[FACT][UNK-2215-0005]
unknown_id=UNK-2215-0005;
statement="Личные физические артефакты — нормы хранения.";
type=CANON_DECISION;
closure_path="Resolved: Standardized cold storage containers.";
target_doc="REG-TECH-2215-0001";
owner=SYSTEM;
state=closed.

[FACT][UNK-2215-0006]
unknown_id=UNK-2215-0006;
statement="Утилизация тел умерших — этика vs ресурсы.";
type=CANON_DECISION;
closure_path="Resolved: Mandatory Aquamation (Water Reclamation). No burials.";
target_doc="BASELINE-SOCIAL-CIVIC-2215-0001";
owner=SYSTEM;
state=closed.

[FACT][UNK-2215-0007]
unknown_id=UNK-2215-0007;
statement="Статус 'Offline' — право или девиантность.";
type=CANON_DECISION;
closure_path="Resolved: Public offline = suspicious/illegal. Private = luxury.";
target_doc="BASELINE-SOCIAL-CIVIC-2215-0001";
owner=SYSTEM;
state=closed.

[FACT][UNK-2215-0008]
unknown_id=UNK-2215-0008;
statement="Регулирование фертильности и интимных контактов.";
type=CANON_DECISION;
closure_path="Resolved: Licensing for kids, viral monitoring for contact.";
target_doc="BASELINE-SOCIAL-CIVIC-2215-0001";
owner=SYSTEM;
state=closed.

## USAGE / RESOLUTION

[DECISION][UNK-USE-010] Этот документ является единственным допустимым реестром UNKNOWN корпуса 2215.
[DECISION][UNK-USE-011] Любой текст, сцена или baseline, затрагивающие UNKNOWN, ОБЯЗАНЫ ссылаться на `unknown_id`.
[DECISION][UNK-USE-012] После закрытия UNKNOWN запись сохраняется в реестре со `state=closed` и ссылкой на закрывающий документ.

## OUTPUT CONTRACT

~~~yaml
doc_id: REG-UNKNOWN-2215-0001
role_type: REGISTRY
export:
  - record_type: unknown
    fields:
      - unknown_id
      - statement
      - type
      - closure_path
      - target_doc
      - owner
      - state
~~~

## FORBIDDEN

[FORBIDDEN][UNK-FBD-010] Закрывать UNKNOWN через художественный текст.
[FORBIDDEN][UNK-FBD-011] Молчаливо считать UNKNOWN «очевидной».
[FORBIDDEN][UNK-FBD-012] Удалять записи UNKNOWN вместо закрытия.

## NON-NORMATIVE
~~~markdown
UNKNOWN Registry is a control surface, not a brainstorming list.
~~~

~~~
</file>

<file path="07-spec/PROTOCOL-CHAPTER-GENERATION-2215-0001.md">
~~~markdown
---
id: PROTOCOL-CHAPTER-GENERATION-2215-0001
title: >
  Chapter Generation Protocol — Chat Parts 3–4 (2215)
class: spec
status: draft
version: 1.0.0
inputs:
  - CANON-2215-CORE-0001
  - CANON-METRICS-0002
  - CANON-SCENE-RULESET-2215-0001
depends_on:
  - CANON-BASE-0001
  - SPEC-PRIORITY-RESOLUTION-2215-0001
scope: >
  Протокол интерактивной генерации главы романа 2215 в чате.
  Глава всегда выводится частями (3–4). Каждая часть самодостаточна,
  но заканчивается маркером продолжения. Протокол форсирует assumed background,
  контроль чисел и ссылку на override при необходимости.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: define stepwise chapter emission in chat with hard validity gates
INPUTS:
  - user_request
  - chapter_context
OUTPUTS:
  - chapter_part_text
  - part_header_metadata
FORBIDDEN:
  - emitting_full_chapter_in_one_message
  - skipping_part_headers
  - unsourced_numbers
  - ssot_as_default_source

---

## DEFINITIONS

[FACT][CHP-DEF-010] chapter_part = one contiguous output message containing PART N of chapter.

[FACT][CHP-DEF-011] part_count ∈ {3,4}.

[FACT][CHP-DEF-012] continuation_prompt = user message: "дальше" | "продолжай" | "part N".

---

## INVARIANTS

[DECISION][CHP-INV-001] Chapter MUST be emitted as 3–4 parts.

[DECISION][CHP-INV-002] Each part MUST start with a header declaring:
chapter_id, part_index, part_count.

[DECISION][CHP-INV-003] Each part MUST include a compact `part_assumptions` block.

[DECISION][CHP-INV-004] Any numeric claim MUST comply with CANON-METRICS-0002.

[DECISION][CHP-INV-005] Any override-trigger condition MUST be declared
and must correspond to an explicit override doc (or the text MUST avoid the trigger).

[FORBIDDEN][CHP-INV-006] Emitting PART N+1 without user continuation_prompt.

---

## CONTENT

### 1) User request handling

[RULE][CHP-010] IF user requests "Write chapter X (3–4 parts)"
THEN assistant MUST choose part_count = 3 OR 4
based on expected length and beat complexity.

[RULE][CHP-011] Assistant MUST emit only PART 1 on initial request.

---

### 2) Mandatory part header

[RULE][CHP-020] Each chapter_part MUST begin with:

~~~yaml
part_header:
  chapter: CH-<####>
  title: "<working title>"
  part: <N>
  of: <3|4>
  pov: "<...>"
  location: "<...>"
  time_window: "<...>"
~~~

---

### 3) Mandatory assumptions block

[RULE][CHP-030] Each chapter_part MUST include:

~~~yaml
part_assumptions:
  resolution_order: SPEC-PRIORITY-RESOLUTION-2215-0001
  core_binder: CANON-2215-CORE-0001
  numeric_rules: CANON-METRICS-0002
  baseline_mode: "MID"
  overrides_used: []     # list doc_ids if any
  artifacts_expected: [] # logs/reports/orders that justify numbers
~~~

---

### 4) End-of-part marker

[RULE][CHP-040] Each chapter_part MUST end with:

`--- END PART N (of M). SEND "дальше" FOR PART N+1 ---`

[FORBIDDEN][CHP-041] Ending part without explicit continuation instruction.

---

## USAGE / RESOLUTION

[DECISION][CHP-USE-010] Protocol applies to all chapter-generation requests.

[DECISION][CHP-USE-011] Violations are treated as generation errors; output must be rewritten.

---

## OUTPUT CONTRACT

~~~yaml
doc_id: PROTOCOL-CHAPTER-GENERATION-2215-0001
role_type: RULE
export:
  - rule_id: CHP-INV-001
    intent: "Force 3–4 part emission"
    inputs: [user_request]
    outputs: [chapter_part_text]
  - rule_id: CHP-020
    intent: "Require explicit part header"
    inputs: [chapter_part_text]
    outputs: [part_header_metadata]
  - rule_id: CHP-040
    intent: "Require explicit continuation marker"
    inputs: [chapter_part_text]
    outputs: [continuation_required]
~~~

## FORBIDDEN

[FORBIDDEN][CHP-FBD-010] Full chapter in one message.
[FORBIDDEN][CHP-FBD-011] Part without header metadata.
[FORBIDDEN][CHP-FBD-012] Part with unsourced numbers.
[FORBIDDEN][CHP-FBD-013] Skipping user continuation step.

---

## NON-NORMATIVE

(Empty by design)

~~~
</file>

<file path="07-spec/SPEC-OVERRIDE-CHECKLIST-2215-0001.md">
~~~markdown
---
id: SPEC-OVERRIDE-CHECKLIST-2215-0001
title: >
  Override Checklist & Validation Rules — 2215
class: spec
status: draft
version: 1.0.0
inputs: []
depends_on:
  - SPEC-PRIORITY-RESOLUTION-2215-0001
  - CANON-2215-CORE-0001
scope: >
  Норматив структуры и валидации документов `class: override` корпуса 2215.
  Запрещает implicit override и неоформленные исключения baseline/canon.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: mandatory schema + decidable validation rules for override documents
INPUTS: [override_document]
OUTPUTS: [override_validity, violation_flags]
FORBIDDEN: [implicit_override, narrative_justification, heuristic_validation]

## DEFINITIONS

[DEF][OVR-DEF-010] override_doc = document with `class: override`.

[DEF][OVR-DEF-011] anchor = explicit override target (metric|rule|block) with ID.

[DEF][OVR-DEF-012] cost = observable negative consequence (delay|audit|resource|legal|reputation).

## INVARIANTS

[DECISION][OVR-INV-001] Override MUST be explicit and scope-limited.

[DECISION][OVR-INV-002] Override MUST NOT become a default background.

[DECISION][OVR-INV-003] Override MUST NOT weaken upper-level FORBIDDEN or INVARIANTS.

[DECISION][OVR-INV-004] Override MUST declare cost; otherwise invalid.

## CONTENT

[RULE][OVR-REQ-010] IF doc.class = override THEN doc MUST contain `override_target`.

[RULE][OVR-REQ-011] IF doc.class = override THEN `override_target.target_doc` MUST be set.

[RULE][OVR-REQ-012] IF doc.class = override THEN `override_target.anchor_id` MUST be set.

[RULE][OVR-REQ-020] IF doc.class = override THEN doc MUST contain `scope`.

[RULE][OVR-REQ-021] IF doc.class = override THEN `scope.applies_to` MUST include location and system.

[RULE][OVR-REQ-022] IF doc.class = override THEN `scope.time_window` MUST be finite.

[FORBIDDEN][OVR-REQ-023] Global or timeless override scopes.

[RULE][OVR-REQ-030] IF doc.class = override THEN doc MUST contain `justification`.

[RULE][OVR-REQ-031] IF doc.class = override THEN `justification.rule_reference` MUST be a corpus rule/decision ID.

[FORBIDDEN][OVR-REQ-032] Justification by narrative needs without normative reference.

[RULE][OVR-REQ-040] IF doc.class = override THEN doc MUST contain `override_payload`.

[RULE][OVR-REQ-041] IF `override_payload.metric` is set THEN `override_payload.value` MUST be explicit (not implicit range).

[RULE][OVR-REQ-042] IF `override_payload.value_category` = p90 OR range THEN doc MUST declare explicit localization and cost.

[RULE][OVR-REQ-050] IF doc.class = override THEN doc MUST contain `cost`.

[RULE][OVR-REQ-051] IF doc.class = override THEN `cost[]` MUST be non-empty.

[RULE][OVR-REQ-052] IF `cost[].type` is set THEN it MUST be one of: procedural_delay|audit|resource|legal|reputation.

[RULE][OVR-REQ-060] IF doc.class = override THEN doc MUST contain `downstream_effects`.

[RULE][OVR-REQ-061] IF doc.class = override THEN `downstream_effects.forbidden_as_default` MUST be true.

[RULE][OVR-VAL-010] IF any OVR-REQ-* rule fails THEN override_validity = invalid.

[RULE][OVR-VAL-011] IF scope.time_window is missing THEN override_validity = invalid.

[RULE][OVR-VAL-012] IF cost is missing OR empty THEN override_validity = invalid.

[RULE][OVR-VAL-013] IF override_target is missing THEN override_validity = invalid.

## USAGE / RESOLUTION

[DECISION][OVR-USE-010] This SPEC applies to every document with `class: override`.

[DECISION][OVR-USE-011] Override conflicts are resolved only by SPEC-PRIORITY-RESOLUTION-2215-0001.

[DECISION][OVR-USE-012] Invalid override documents MUST be treated as forbidden inputs downstream.

## OUTPUT CONTRACT

~~~yaml
doc_id: SPEC-OVERRIDE-CHECKLIST-2215-0001
role_type: RULE
export:
  - rule_id: OVR-REQ-010
    intent: "Override documents require override_target"
    inputs: [override_document]
    outputs: [override_validity]
  - rule_id: OVR-REQ-020
    intent: "Override documents require finite scope"
    inputs: [override_document]
    outputs: [override_validity]
  - rule_id: OVR-REQ-050
    intent: "Override documents require explicit cost"
    inputs: [override_document]
    outputs: [override_validity]
  - rule_id: OVR-VAL-010
    intent: "Any missing required section invalidates override"
    inputs: [override_document]
    outputs: [override_validity]
~~~

## FORBIDDEN

[FORBIDDEN][OVR-FBD-010] Implicit override.

[FORBIDDEN][OVR-FBD-011] Override without cost.

[FORBIDDEN][OVR-FBD-012] Override used as default background.

[FORBIDDEN][OVR-FBD-013] Narrative justification replacing normative rule reference.

## NON-NORMATIVE

~~~yaml
# Example minimal override payload (illustrative only)
override_target:
  target_doc: CANON-2215-CORE-0001
  anchor_id: CORE-BIND-DEM-004
scope:
  applies_to:
    - location: RU-16/CHELNY
    - system: urban_health_registry
  time_window:
    from: 2215-06
    to: 2215-09
justification:
  rule_reference: CORE-INV-004
  rationale: "Metric closed as selected_value: override; localized closure required"
override_payload:
  metric: total_fertility_rate
  value: 1.2
  unit: children_per_woman
  value_category: override
cost:
  - type: audit
    description: "Manual audit trail required"
downstream_effects:
  affects: [scene, plan]
  forbidden_as_default: true
~~~

~~~
</file>

<file path="07-spec/SPEC-PRIORITY-RESOLUTION-2215-0001.md">
~~~markdown
---
id: SPEC-PRIORITY-RESOLUTION-2215-0001
title: >
  Resolution Order & Precedence Rules — 2215
class: spec
status: fixed
version: 1.0.0
inputs: []
depends_on: []
scope: >
  Канонический порядок разрешения документов корпуса 2215 и правила
  непробиваемости ограничений между уровнями. Документ обязателен
  для всех SSOT / BASELINE / CANON / PLAN / SCENE / OVERRIDE.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: define global resolution order and forbid cross-layer override violations
INPUTS: [any_document]
OUTPUTS: [resolution_order, violation_flags]
FORBIDDEN: [implicit_precedence, heuristic_resolution, narrative_reasoning]

---

## DEFINITIONS

[DECISION][RES-DEF-010] `resolution_order` = строгая иерархия документов, определяющая допустимость значений и ограничений.

[DECISION][RES-DEF-011] `override` = документ, явно изменяющий baseline/ssot в пределах разрешённого scope и с явным justification.

---

## RESOLUTION ORDER (GLOBAL)

[DECISION][RES-ORD-010] Global resolution order MUST be:

1. Override
2. Scene
3. Plan
4. Canon
5. Baseline
6. SSOT

[DECISION][RES-ORD-011] Документ с более высоким приоритетом МОЖЕТ:
- конкретизировать,
- сузить,
- выбрать допустимое значение из документа с более низким приоритетом.

[FORBIDDEN][RES-ORD-012] Документ с более низким приоритетом MUST NOT:
- отменять ограничения,
- расширять допустимые диапазоны,
- выбирать значение за пределами разрешённых состояний документа с более высоким приоритетом.

---

## NON-PENETRATION RULE (CRITICAL)

[DECISION][RES-NP-010] Ограничения верхнего уровня являются непробиваемыми для нижележащих документов.

[FORBIDDEN][RES-NP-011] Любая попытка:
- ослабить FORBIDDEN,
- игнорировать INVARIANTS,
- заменить RULE логикой сцены или канона

MUST be treated as invalid input.

---

## OVERRIDE CONSTRAINTS

[DECISION][RES-OVR-010] Override MAY modify:
- selected_value,
- local constraints,
- scope-limited behavior

ТОЛЬКО при выполнении всех условий:
- явный reference на переопределяемый anchor,
- justification,
- scope.

[FORBIDDEN][RES-OVR-011] Implicit override is forbidden.

[FORBIDDEN][RES-OVR-012] Override без justification считается невалидным.

---

## USAGE / RESOLUTION

[DECISION][RES-USE-010] Все документы корпуса ОБЯЗАНЫ трактоваться с учётом данного порядка разрешения.

[DECISION][RES-USE-011] В случае конфликта документов приоритет определяется исключительно данным SPEC.

---

## OUTPUT CONTRACT

~~~yaml
doc_id: SPEC-PRIORITY-RESOLUTION-2215-0001
role_type: RULE
export:
  - resolution_order:
      - Override
      - Scene
      - Plan
      - Canon
      - Baseline
      - SSOT
~~~

---

## FORBIDDEN

[FORBIDDEN][RES-FBD-010] Introducing alternative precedence orders.
[FORBIDDEN][RES-FBD-011] Heuristic or narrative conflict resolution.
[FORBIDDEN][RES-FBD-012] Assuming precedence from document class without this SPEC.

---

## NON-NORMATIVE

(Empty by design)

~~~
</file>

<file path="07-spec/SPEC-QUALITATIVE-ENUMS-2215-0001.md">
~~~markdown
---
id: SPEC-QUALITATIVE-ENUMS-2215-0001
title: >
  Qualitative Enums — Controlled Vocabulary (2215)
class: spec
status: fixed
version: 1.0.0
inputs: []
depends_on: []
scope: >
  Нормативный словарь качественных значений для SSOT/BASELINE/CANON.
  Устраняет vague-значения и обеспечивает совместимость между документами.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: define controlled vocabularies for qualitative fields
INPUTS: [any_document]
OUTPUTS: [enum_sets]
FORBIDDEN: [freeform_qualitative_values, synonyms_as_new_values]

---

## CONTENT

[DECISION][QEN-010] Prevalence enum = {none, rare, minority, common, majority, near_universal}.

[DECISION][QEN-020] Autonomy enum (transport) = {manual_norm, mixed, autonomous_norm}.

[DECISION][QEN-030] Work mode enum = {on_site, hybrid, remote, remote_or_hybrid}.

---

## USAGE / RESOLUTION

[DECISION][QEN-USE-010] Any qualitative field MUST use one of the enums above when applicable.
[FORBIDDEN][QEN-USE-011] Using ad-hoc strings such as "predominantly_*", "*_common", "mostly_*".

---

## OUTPUT CONTRACT

~~~yaml
doc_id: SPEC-QUALITATIVE-ENUMS-2215-0001
role_type: RULE
export:
  - enum: prevalence
    values: [none, rare, minority, common, majority, near_universal]
  - enum: transport_autonomy
    values: [manual_norm, mixed, autonomous_norm]
  - enum: work_mode
    values: [on_site, hybrid, remote, remote_or_hybrid]
~~~

---

## FORBIDDEN

[FORBIDDEN][QEN-FBD-010] Introducing new qualitative values without updating this SPEC.

---

## NON-NORMATIVE

(Empty by design)

~~~
</file>

<file path="07-spec/SPEC-SCENE-CONTRACT-2215-0001.md">
~~~markdown
---
id: SPEC-SCENE-CONTRACT-2215-0001
title: >
  Scene Contract — 2215 (Inputs, Constraints, Overrides, Evidence)
class: spec
status: draft
version: 1.0.0
inputs: []
depends_on:
  - SPEC-PRIORITY-RESOLUTION-2215-0001
  - CANON-2215-CORE-0001
  - CANON-BASE-0001
  - CANON-SYSTEMS-0001
  - CANON-ORDERS-0003
  - CANON-ARTIFACT-SNIPPETS-0001
  - BASELINE-SOCIAL-CIVIC-2215-0001
  - BASELINE-DAILY-OPS-2215-0002
scope: >
  Обязательный контракт сцены для романа 2215: какие документы считаются
  источниками дефолтов, что сцена может/не может вводить, когда требуется
  explicit override, и как сцена должна проявлять причинность через
  артефакты/процедуры/ограничения без лекционной подачи.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: define scene-level constraints, required inputs, override triggers, and evidence discipline
INPUTS: [any_scene_request]
OUTPUTS: [scene_inputs_required, override_required_flags, forbidden_patterns]
FORBIDDEN: [world_parameter_binding, ssot_direct_usage, lecture_exposition, implicit_overrides]

---

## DEFINITIONS

[FACT][SCN-DEF-010] Scene = локальный эпизод с ограниченным POV и частичной наблюдаемостью.
[FACT][SCN-DEF-011] Default background = набор значений/норм, получаемых из CANON-2215-CORE и baseline.
[FACT][SCN-DEF-012] Explicit override = `class: override` документ с justification, локализацией и cost.
[FACT][SCN-DEF-013] Evidence artifact = процедурный фрагмент (лог/ордер/chain-of-custody), пригодный для проверки.
[FACT][SCN-DEF-014] Level-MID = стандартный городской режим без спец-лицензий и без экстерриториальных исключений.

---

## INVARIANTS

[DECISION][SCN-INV-010] Scene MUST respect global resolution order from SPEC-PRIORITY-RESOLUTION-2215-0001.
[DECISION][SCN-INV-011] Scene MUST treat CANON-2215-CORE-0001 as the only default binder for world background values.
[DECISION][SCN-INV-012] Scene MUST apply baseline defaults unless explicitly overridden.
[DECISION][SCN-INV-013] Scene MUST show causality via: artifacts, procedures, measurable constraints, and consequences.
[FORBIDDEN][SCN-INV-014] Scene MUST NOT introduce new global metrics or new bindings.
[FORBIDDEN][SCN-INV-015] Scene MUST NOT use SSOT directly as a scene background source.

---

## CONTENT

### 1) Mandatory Inputs (What every scene must assume)

[RULE][SCN-IN-010] Every scene MUST assume background defaults from:
- CANON-2215-CORE-0001 (values/bindings),
- CANON-BASE-0001 (narrative & institutional constraints),
- BASELINE-SOCIAL-CIVIC-2215-0001 (civic/bio-ethical defaults for MID),
- BASELINE-DAILY-OPS-2215-0002 (ops/queues/access/logging defaults for MID).

[RULE][SCN-IN-011] If scene references OSA actions or admissibility, it MUST additionally assume:
- CANON-ORDERS-0003
- CANON-ARTIFACT-SNIPPETS-0001
- CANON-SYSTEMS-0001

---

### 2) Override Triggers (When explicit override is mandatory)

[RULE][SCN-OVR-010] IF scene uses any upper-tail (`p90`) value OR non-core regime THEN explicit override is REQUIRED.
[RULE][SCN-OVR-011] IF scene depicts public offline status as non-suspect OR allows telemetry jamming without consequences THEN explicit override is REQUIRED.
[RULE][SCN-OVR-012] IF scene violates baseline defaults (SOCIAL-CIVIC or DAILY-OPS) THEN explicit override is REQUIRED.
[RULE][SCN-OVR-013] IF scene introduces an exception to access/queues/logging that is not procedural THEN explicit override is REQUIRED.
[RULE][SCN-OVR-014] IF scene uses extraterritorial regime OR special license level (not MID) THEN explicit override is REQUIRED.

[RULE][SCN-OVR-015] Any explicit override MUST include:
- locality (where),
- time window (when),
- affected system/service (what),
- procedural basis (order/mandate/exception if applicable),
- cost (constraints, delays, audits, enforcement, reputational damage, etc.).

---

### 3) Evidence Discipline (How the scene proves things without exposition)

[RULE][SCN-EVD-010] If a scene asserts a system decision (deny/access/freeze/restrict), it MUST be grounded in:
- an artifact (log/notice/order snippet), OR
- an observable procedure (scan, token rejection, queue downgrade, sealed export).

[RULE][SCN-EVD-011] If a scene asserts escalation to OSA or regulatory action, it MUST bind:
- case_id (or equivalent),
- scope (zone/node/mode),
- procedural basis (order/mandate/emergency_exception),
- minimal chain-of-custody if evidence is produced.

[RULE][SCN-EVD-012] Scene MAY embed short artifact snippets, but MUST keep them partial (snippet), not full documents.

---

### 4) Prohibited Patterns (Hard bans)

[FORBIDDEN][SCN-FBD-010] Lecture paragraphs explaining macro-causality or world design.
[FORBIDDEN][SCN-FBD-011] “Because the system decided…” without an artifact/procedure.
[FORBIDDEN][SCN-FBD-012] Omniscient telemetry / perfect observability as default.
[FORBIDDEN][SCN-FBD-013] New global numbers not sourced through CORE/override.
[FORBIDDEN][SCN-FBD-014] Implicit override: exceptions presented as normal without explicit override reference.

---

## USAGE / RESOLUTION

[DECISION][SCN-USE-010] This spec MUST be applied to any scene generation request.
[DECISION][SCN-USE-011] Any violation MUST be treated as invalid output, not as a creative choice.
[DECISION][SCN-USE-012] Conflict resolution follows SPEC-PRIORITY-RESOLUTION-2215-0001.

---

## OUTPUT CONTRACT

~~~yaml
doc_id: SPEC-SCENE-CONTRACT-2215-0001
role_type: RULE
export:
  - rule_id: SCN-IN-010
    intent: enforce mandatory background inputs
    inputs: [any_scene_request]
    outputs: [scene_inputs_required]
  - rule_id: SCN-OVR-012
    intent: require explicit override when baseline is violated
    inputs: [scene_features]
    outputs: [override_required_flag]
  - rule_id: SCN-EVD-010
    intent: require artifacts/procedures for system decisions
    inputs: [scene_assertions]
    outputs: [evidence_required_flag]
  - rule_id: SCN-FBD-010
    intent: forbid lecture exposition
    inputs: [scene_text]
    outputs: [violation_flag]
~~~

---

## FORBIDDEN

- [FORBIDDEN][SCN-900] Selecting SSOT values or binding ranges in scene text.
- [FORBIDDEN][SCN-901] Treating baseline defaults as optional without override.
- [FORBIDDEN][SCN-902] Presenting systemic decisions without artifacts/procedures.

---

## NON-NORMATIVE

~~~markdown
This contract is meant to keep scenes “auditable”: the world is revealed through
constraints and records, not explanation. If something unusual happens, the scene
must pay for it procedurally (override + cost), or it does not happen.
~~~

~~~
</file>

<file path="08-idx/IDX-CORPUS-0001.md">
~~~markdown
---
id: IDX-CORPUS-0001
title: >
  Corpus Registry
class: idx
status: draft
version: 0.1.0
inputs: []
depends_on: []
scope: >
  Реестр всех документов корпуса: роли, статусы, зависимости.
---

## RULES

- [DECISION][CORP-010] IDX-CORPUS is normative for corpus membership.
- [DECISION][CORP-011] A doc is considered part of the corpus IFF it is present in the Registry table.
- [DECISION][CORP-012] Lint MUST fail if:
  - any referenced `depends_on` id is missing from Registry, OR
  - any `status: fixed` doc is missing from Registry.

## Registry

| id | file | class | status | version | inputs | notes |
| -- | ---- | ----- | ------ | ------- | ------ | ----- |
| BASELINE-DAILY-OPS-2215-0002 | docs/01-baselines/BASELINE-DAILY-OPS-2215-0002.md | baseline | draft | 1.1.0 | — | |
| BASELINE-PHYSICAL-LEVEL-MID-2215-0001 | docs/01-baselines/BASELINE-PHYSICAL-LEVEL-MID-2215-0001.md | baseline | fixed | 1.1.0 | — | |
| BASELINE-PSYCH-2215-0001 | docs/01-baselines/BASELINE-PSYCH-2215-0001.md | baseline | fixed | 1.3.0 | — | |
| BASELINE-SOCIAL-CIVIC-2215-0001 | docs/01-baselines/BASELINE-SOCIAL-CIVIC-2215-0001.md | baseline | fixed | 1.1.0 | — | |
| CANON-2215-CORE-0001 | docs/03-canon/CANON-2215-CORE-0001.md | canon | fixed | 1.1.0 | — | |
| CANON-ARTIFACT-SNIPPETS-0001 | docs/03-canon/CANON-ARTIFACT-SNIPPETS-0001.md | canon | fixed | 1.1.0 | — | |
| CANON-BASE-0001 | docs/03-canon/CANON-BASE-0001.md | canon | fixed | 2.0.0 | — | |
| CANON-CAST-0001 | docs/03-canon/CANON-CAST-0001.md | canon | fixed | 0.3.0 | WORLD-DOC-2 | |
| CANON-CAST-PUBLIC-2215-0001 | docs/03-canon/CANON-CAST-PUBLIC-2215-0001.md | canon | fixed | 1.1.0 | — | |
| CANON-CAST-VOICE-2215-0001 | docs/03-canon/CANON-CAST-VOICE-2215-0001.md | canon | fixed | 1.3.0 | — | |
| CANON-CITY-BOUNDARY-RU-2215-0008 | docs/03-canon/CANON-CITY-BOUNDARY-RU-2215-0008.md | canon | draft | 0.1.1 | — | |
| CANON-CITY-RU-2215-0007 | docs/03-canon/CANON-CITY-RU-2215-0007.md | canon | draft | 1.0.0 | — | |
| CANON-CONFLICT-0001 | docs/03-canon/CANON-CONFLICT-0001.md | canon | fixed | 1.1.0 | — | |
| CANON-LOC-CHELNY-2215-0001 | docs/03-canon/CANON-LOC-CHELNY-2215-0001.md | canon | draft | 0.2.0 | — | |
| CANON-METRICS-0002 | docs/03-canon/CANON-METRICS-0002.md | canon | draft | 2.1.0 | — | |
| CANON-ORDERS-0003 | docs/03-canon/CANON-ORDERS-0003.md | canon | draft | 1.1.0 | — | |
| CANON-ORGS-2215-0001 | docs/03-canon/CANON-ORGS-2215-0001.md | canon | fixed | 1.2.0 | — | |
| CANON-OSA-0005 | docs/03-canon/CANON-OSA-0005.md | canon | draft | 0.1.1 | — | |
| CANON-REPORTS-0006 | docs/03-canon/CANON-REPORTS-0006.md | canon | draft | 0.3.0 | — | |
| CANON-SYSTEMS-0001 | docs/03-canon/CANON-SYSTEMS-0001.md | canon | fixed | 1.1.0 | — | |
| CANON-SYSTEM-VOICE-0001 | docs/03-canon/CANON-SYSTEM-VOICE-0001.md | canon | draft | 0.3.0 | — | |
| CANON-VIBE-FLOW-0001 | docs/03-canon/CANON-VIBE-FLOW-0001.md | canon | draft | 1.0.0 | CANON-VIBE-RESTLESS-0001 | |
| CANON-VIBE-RESTLESS-0001 | docs/03-canon/CANON-VIBE-RESTLESS-0001.md | canon | draft | 0.1.0 | — | |
| CANON-VOCAB-2215-0001 | docs/03-canon/CANON-VOCAB-0001.md | canon | draft | 1.0.0 | — | |
| CANON-ZONES-0004 | docs/03-canon/CANON-ZONES-0004.md | canon | draft | 1.1.0 | — | |
| CITY-RULES-RU-2215-0001 | docs/03-canon/CITY-RULES-RU-2215-0001.md | canon | draft | 1.0.0 | — | |
| IDX-CORPUS-0001 | docs/08-idx/IDX-CORPUS-0001.md | idx | draft | 0.1.0 | — | |
| PLAN-DEFAULT-ENVIRONMENT-2215-0001 | docs/04-plans/PLAN-DEFAULT-ENVIRONMENT-2215-0001.md | plan | draft | 0.3.0 | — | |
| STORY-SKELETON-0001 | docs/04-plans/STORY-SKELETON-0001.md | plan | fixed | 0.1.0 | CANON-BASE-0001,CANON-CONFLICT-0001,CANON-SYSTEMS-0001 | |
| SCENE-GEN-PROTOCOL-0001 | docs/05-scenes/SCENE-GEN-PROTOCOL-0001.md | protocol | fixed | 1.4.0 | — | |
| REG-TECH-2215-0001 | docs/06-registry/REG-TECH-2215-0001.md | registry | fixed | 0.3.0 | — | |
| REG-UNKNOWN-2215-0001 | docs/06-registry/REG-UNKNOWN-2215-0001.md | registry | draft | 1.0.0 | — | |
| SCENE-ACT-01-0001 | docs/05-scenes/SCENE-ACT-01-0001.md | scene | fixed | 1.1.0 | — | |
| SCENE-ACT-02-0001 | docs/05-scenes/SCENE-ACT-02-0001.md | scene | fixed | 0.2.0 | — | |
| SCENE-ACT-03-0001 | docs/05-scenes/SCENE-ACT-03-0001.md | scene | fixed | 0.2.0 | — | |
| SCENE-ACT-04-0001 | docs/05-scenes/SCENE-ACT-04-0001.md | scene | fixed | 0.2.0 | — | |
| SCENE-ACT-05-0001 | docs/05-scenes/SCENE-ACT-05-0001.md | scene | fixed | 0.2.0 | — | |
| SPEC-PRIORITY-RESOLUTION-2215-0001 | docs/07-spec/SPEC-PRIORITY-RESOLUTION-2215-0001.md | spec | fixed | 1.0.0 | — | |
| SPEC-QUALITATIVE-ENUMS-2215-0001 | docs/07-spec/SPEC-QUALITATIVE-ENUMS-2215-0001.md | spec | fixed | 1.0.0 | — | |
| SPEC-SCENE-CONTRACT-2215-0001 | docs/07-spec/SPEC-SCENE-CONTRACT-2215-0001.md | spec | draft | 1.0.0 | — | |
| SSOT-DOC-STYLE-2215-0001 | docs/00-ssot/SSOT-DOC-STYLE-2215-0001.md | spec | fixed | 1.0.1 | — | |
| SSOT-AUTOMATION-A-2215-0004 | docs/00-ssot/SSOT-AUTOMATION-A-2215-0004.md | ssot | draft | 1.0.0 | — | |
| SSOT-CLIMATE-A-2215-0004 | docs/00-ssot/SSOT-CLIMATE-A-2215-0004.md | ssot | draft | 1.0.0 | — | |
| SSOT-CONSISTENCY-A-2215-0009 | docs/00-ssot/SSOT-CONSISTENCY-A-2215-0009.md | ssot | draft | 1.0.0 | — | |
| SSOT-DEMOGRAPHY-A-2215-0002 | docs/00-ssot/SSOT-DEMOGRAPHY-A-2215-0002.md | ssot | draft | 1.0.0 | — | |
| SSOT-ECONOMY-A-2215-0003 | docs/00-ssot/SSOT-ECONOMY-A-2215-0003.md | ssot | draft | 1.0.0 | — | |
| SSOT-ENERGY-A-2215-0004 | docs/00-ssot/SSOT-ENERGY-A-2215-0004.md | ssot | draft | 1.0.0 | — | |
| SSOT-GOVERNANCE-SECURITY-A-2215-0005 | docs/00-ssot/SSOT-GOVERNANCE-SECURITY-A-2215-0005.md | ssot | draft | 1.0.0 | — | |
| SSOT-LAW-A-2215-0008 | docs/00-ssot/SSOT-LAW-A-2215-0008.md | ssot | fixed | 1.1.0 | — | |
| SSOT-LIFE-A-2215-0007 | docs/00-ssot/SSOT-LIFE-A-2215-0007.md | ssot | draft | 1.0.0 | — | |
| SSOT-SCENARIO-A-2215-0001 | docs/00-ssot/SSOT-SCENARIO-A-2215-0001.md | ssot | draft | 1.0.0 | — | |
| SSOT-SPACE-INDUSTRY-A-2215-0006 | docs/00-ssot/SSOT-SPACE-INDUSTRY-A-2215-0006.md | ssot | draft | 1.0.0 | — | |
| SSOT-URBANISM-A-2215-0007 | docs/00-ssot/SSOT-URBANISM-A-2215-0007.md | ssot | fixed | 1.1.0 | — | |

~~~
</file>

</architecture_docs>
