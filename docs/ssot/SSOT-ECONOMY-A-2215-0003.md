---
id: SSOT-ECONOMY-A-2215-0003
title: >
  Economy and Production — Scenario A (2215, SSOT State)
class: ssot
status: draft
prefix: ECO
doc_language: en-US
inputs: []
depends_on:
  - SPEC-DOC_STYLE-2215-0001
  - SSOT-AUTOMATION-A-2215-0004
  - SSOT-SCENARIO-A-2215-0001
references:
  - SSOT-DEMOGRAPHY-A-2215-0002
scope: >
  SSOT state of global macroeconomics in 2215 (Scenario A).
  Contains only declarative metrics (core/p90/range) and qualitative economic states.
  Does not contain causality, conflict resolution rules, or governance models.
---

## LLM-INTENT

ROLE_TYPE: STATE
SCOPE: global macroeconomic state for Scenario A around year 2215
INPUTS: []
OUTPUTS: [economic_metric_state]
FORBIDDEN: [causal_logic, resolution_rules, governance_models, narrative_explanations]

## DEFINITIONS

[FACT][ECO-010] `economy` = global production, allocation, and execution capacity under high automation and coordination.

## INVARIANTS

[DECISION][ECO-020] This document is applicable ONLY to Scenario A.
[DECISION][ECO-030] Macroeconomy is treated as a production-capacity allocation system, not as a microeconomic market.
[DECISION][ECO-040] Behavioral and microeconomic models are out of scope for this SSOT.

## CONTENT

### 1. Output and Growth

[STATE][ECO-100] gdp_ppp_relative_to_2025.core = 30.
[STATE][ECO-110] gdp_ppp_relative_to_2025.p90 = 40.
[STATE][ECO-120] gdp_ppp_relative_to_2025.range = [5, 40].
[STATE][ECO-130] gdp_ppp_relative_to_2025.unit = multiplier.
[STATE][ECO-140] gdp_ppp_relative_to_2025.owner_domain = ECONOMY.
[STATE][ECO-150] long_term_growth_mode = "high_stable".
[STATE][ECO-160] long_term_growth_mode.owner_domain = ECONOMY.

### 2. Productivity and Automation Coupling

[STATE][ECO-170] labor_automation_percent_tasks.source = "SSOT-AUTOMATION-A-2215-0004".
[STATE][ECO-180] labor_automation_percent_tasks.owner_domain = AUTOMATION.
[DECISION][ECO-190] ECONOMY SSOT MUST NOT redefine AUTOMATION-owned metrics.
[STATE][ECO-200] labor_cost_trend = "strong_decline".
[STATE][ECO-210] labor_cost_trend.owner_domain = ECONOMY.

### 3. Production Structure

[STATE][ECO-220] services_share_gdp_percent.core = none.
[STATE][ECO-230] services_share_gdp_percent.p90 = 90.
[STATE][ECO-240] services_share_gdp_percent.range = [60, 90].
[STATE][ECO-250] services_share_gdp_percent.unit = percent.
[STATE][ECO-260] services_share_gdp_percent.owner_domain = ECONOMY.
[STATE][ECO-270] production_localization_trend = "partial_relocalization".
[STATE][ECO-280] production_localization_trend.owner_domain = ECONOMY.

### 4. Trade and Distribution

[STATE][ECO-290] trade_to_gdp_percent.core = none.
[STATE][ECO-300] trade_to_gdp_percent.p90 = 50.
[STATE][ECO-310] trade_to_gdp_percent.range = [10, 50].
[STATE][ECO-320] trade_to_gdp_percent.unit = percent.
[STATE][ECO-330] trade_to_gdp_percent.owner_domain = ECONOMY.
[STATE][ECO-340] global_gini_index.core = none.
[STATE][ECO-350] global_gini_index.p90 = 0.4.
[STATE][ECO-360] global_gini_index.range = none.
[STATE][ECO-370] global_gini_index.unit = coefficient.
[STATE][ECO-380] global_gini_index.owner_domain = ECONOMY.

### 5. Allocation and Absorption

[STATE][ECO-390] mandatory_output_absorption = "high".
[STATE][ECO-400] mandatory_output_absorption.owner_domain = ECONOMY.
[STATE][ECO-410] free_capacity_share = "limited".
[STATE][ECO-420] free_capacity_share.owner_domain = ECONOMY.

### 6. Administrative Scarcity

[STATE][ECO-430] scarcity_mode = "administrative".
[STATE][ECO-440] scarcity_mode.owner_domain = GOVERNANCE.
[STATE][ECO-450] scarcity_triggers = ["licensing", "quota", "access_window", "compliance", "joint_access_protocol"].
[STATE][ECO-460] scarcity_triggers.owner_domain = GOVERNANCE.

## USAGE / RESOLUTION

[DECISION][ECO-800] This document provides declarative numeric ranges and qualitative macroeconomic states for downstream documents.
[FORBIDDEN][ECO-810] Using this SSOT document for causal explanations of crises.
[FORBIDDEN][ECO-820] Using this SSOT document for conflict modeling.
[FORBIDDEN][ECO-830] Using this SSOT document for selecting scene or narrative modes.

## OUTPUT CONTRACT

~~~yaml
doc_id: SSOT-ECONOMY-A-2215-0003
role_type: STATE
export:
  - metric: gdp_ppp_relative_to_2025
    owner_domain: ECONOMY
    values:
      core: 30
      p90: 40
      range: [5, 40]
    unit: multiplier
  - metric: long_term_growth_mode
    owner_domain: ECONOMY
    values:
      core: high_stable
      p90: none
      range: none
    unit: none
  - metric: labor_cost_trend
    owner_domain: ECONOMY
    values:
      core: strong_decline
      p90: none
      range: none
    unit: none
  - metric: services_share_gdp_percent
    owner_domain: ECONOMY
    values:
      core: none
      p90: 90
      range: [60, 90]
    unit: percent
  - metric: production_localization_trend
    owner_domain: ECONOMY
    values:
      core: partial_relocalization
      p90: none
      range: none
    unit: none
  - metric: trade_to_gdp_percent
    owner_domain: ECONOMY
    values:
      core: none
      p90: 50
      range: [10, 50]
    unit: percent
  - metric: global_gini_index
    owner_domain: ECONOMY
    values:
      core: none
      p90: 0.4
      range: none
    unit: coefficient
  - metric: mandatory_output_absorption
    owner_domain: ECONOMY
    values:
      core: high
      p90: none
      range: none
    unit: none
  - metric: free_capacity_share
    owner_domain: ECONOMY
    values:
      core: limited
      p90: none
      range: none
    unit: none
  - metric: scarcity_mode
    owner_domain: GOVERNANCE
    values:
      core: administrative
      p90: none
      range: none
    unit: none
  - metric: scarcity_triggers
    owner_domain: GOVERNANCE
    values:
      core: [licensing, quota, access_window, compliance, joint_access_protocol]
      p90: none
      range: none
    unit: none
~~~

## FORBIDDEN

[FORBIDDEN][ECO-900] Introducing new economic metrics outside SSOT.
[FORBIDDEN][ECO-910] Embedding causal chains, governance logic, or resolution rules.
[FORBIDDEN][ECO-920] Treating qualitative states as narrative explanations.
[FORBIDDEN][ECO-930] Declaring or exporting AUTOMATION-owned metrics in ECONOMY SSOT.

## NON-NORMATIVE

~~~text
Empty by design.
~~~