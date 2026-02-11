---
id: BASELINE-URBANISM-CHELNY-A-2215-0001
title: >
  Urbanism Baseline — Naberezhnye Chelny Agglomeration (Scenario A, 2215)
class: baseline
status: fixed
prefix: URBCH
doc_language: en-US
inputs:
  - SSOT-URBANISM-A-2215-0007
depends_on:
  - SPEC-DOC_STYLE-2215-0001
references: []
scope: >
  City-specific baseline (STATE selection) for the Naberezhnye Chelny agglomeration in 2215
  under Scenario A. Selects concrete values from SSOT-URBANISM allowed modes and fixes
  the “green city” local profile as an operational norm (not a spectacle program).
---

## LLM-INTENT

ROLE_TYPE: STATE
SCOPE: local urban baseline for Naberezhnye Chelny (Scenario A, ~2215, LEVEL-MID)
INPUTS:
  - SSOT-URBANISM-A-2215-0007
OUTPUTS: [local_urbanism_state]
FORBIDDEN: [causal_logic, resolution_rules, narrative_explanations, feedback_loops, global_claims]

## DEFINITIONS

[FACT][URBCH-010] This baseline selects SSOT-URBANISM values for the Naberezhnye Chelny agglomeration only.
[FACT][URBCH-020] `green_city_profile` = pervasive integrated greenery maintained as standardized infrastructure layer (not decorative spectacle).

## INVARIANTS

[DECISION][URBCH-030] Local selections MUST stay within SSOT-URBANISM allowed modes.
[DECISION][URBCH-040] Local identity MAY increase green intensity and “green exposure”, but MUST NOT violate serviceability and platform contracts.
[DECISION][URBCH-050] Green layer is a long-horizon operational asset (microclimate + comfort), not a marketing showcase.

## CONTENT

### 1. Green and Open Space (LOCAL CHOICE = high integration)

[STATE][URBCH-100] green_space_role = ["microclimate_stabilization", "thermal_load_reduction", "human_comfort"].
[STATE][URBCH-110] green_elements_integration = ["residential_blocks", "courtyards", "streets", "transport_corridors"].
[STATE][URBCH-120] parks_presence = "pervasive_integrated".
[STATE][URBCH-130] parks_as_voids_dominant = false.
[STATE][URBCH-140] daily_green_exposure = "baseline_expected".
[STATE][URBCH-150] green_space_maintenance = "standardized_infrastructure_layer".

### 2. Visual Texture (LOCAL EMPHASIS)

[STATE][URBCH-200] palette_driver = ["thermal", "maintenance", "replacement_cycles", "green_integration"].
[DECISION][URBCH-210] Baseline visual goal for Chelny is legibility-first with persistent green presence; spectacle MUST NOT be applied by default.

## USAGE / RESOLUTION

[DECISION][URBCH-800] Scenes located in Naberezhnye Chelny MUST treat greenery as baseline presence (courtyards, corridors, streets), not as an event.
[DECISION][URBCH-810] Green maintenance is visible as standardized operations (pruning cycles, replacement grids), not as artisanal gardening.
[DECISION][URBCH-820] Any spectacle/aesthetic program MUST remain in designated modes and MUST NOT alter mass housing and infrastructure contracts.

## OUTPUT CONTRACT

~~~yaml
doc_id: BASELINE-URBANISM-CHELNY-A-2215-0001
role_type: STATE
export:
  - metric: parks_presence
    owner_domain: URBANISM
    values:
      core: pervasive_integrated
      p90: none
      range: none
    unit: none
  - metric: parks_as_voids_dominant
    owner_domain: URBANISM
    values:
      core: false
      p90: none
      range: none
    unit: none
  - metric: daily_green_exposure
    owner_domain: URBANISM
    values:
      core: baseline_expected
      p90: none
      range: none
    unit: none
  - metric: green_space_maintenance
    owner_domain: URBANISM
    values:
      core: standardized_infrastructure_layer
      p90: none
      range: none
    unit: none
  - metric: palette_driver
    owner_domain: URBANISM
    values:
      core: [thermal, maintenance, replacement_cycles, green_integration]
      p90: none
      range: none
    unit: none
~~~

## FORBIDDEN

[FORBIDDEN][URBCH-900] Introducing metrics not declared in SSOT-URBANISM-A-2215-0007.
[FORBIDDEN][URBCH-910] Selecting values outside SSOT-URBANISM allowed modes.
[FORBIDDEN][URBCH-920] Treating local green profile as spectacle or marketing asset.

## NON-NORMATIVE

~~~text
Naberezhnye Chelny fixes the high-integration green profile from SSOT-URBANISM allowed
modes. This reflects long planning inertia where greenery is treated as infrastructure
and microclimate stabilization, not as a “design statement”.
~~~
