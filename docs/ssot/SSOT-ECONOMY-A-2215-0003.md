---
id: SSOT-ECONOMY-A-2215-0003
title: >
  Economy and Production — Scenario A (2215, SSOT State)
class: ssot
status: draft
version: 1.1.0
inputs: []
depends_on:
  - SPEC-DOC_STYLE-2215-0001
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
