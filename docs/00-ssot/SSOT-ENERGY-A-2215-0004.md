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
