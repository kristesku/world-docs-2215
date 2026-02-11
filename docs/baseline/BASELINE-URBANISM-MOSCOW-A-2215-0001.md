---
id: BASELINE-URBANISM-MOSCOW-A-2215-0001
title: >
  Urbanism Baseline — Moscow Megacity Agglomeration (Scenario A, 2215)
class: baseline
status: fixed
prefix: URBMSK
doc_language: en-US
inputs:
  - SSOT-URBANISM-A-2215-0007
depends_on:
  - SPEC-DOC_STYLE-2215-0001
references: []
scope: >
  City-specific baseline (STATE selection) for the Moscow megacity agglomeration in 2215
  under Scenario A. Selects concrete values from SSOT-URBANISM allowed modes and fixes
  the “megacity” local profile where density and throughput constraints shape green and public-space texture.
---

## LLM-INTENT

ROLE_TYPE: STATE
SCOPE: local urban baseline for Moscow megacity (Scenario A, ~2215, LEVEL-MID)
INPUTS:
  - SSOT-URBANISM-A-2215-0007
OUTPUTS: [local_urbanism_state]
FORBIDDEN: [causal_logic, resolution_rules, narrative_explanations, feedback_loops, global_claims]

## DEFINITIONS

[FACT][URBMSK-010] This baseline selects SSOT-URBANISM values for the Moscow megacity agglomeration only.
[FACT][URBMSK-020] `megacity_profile` = extreme density + high service throughput; open space is managed as capacity and flow, not as pervasive ambient greenery.

## INVARIANTS

[DECISION][URBMSK-030] Local selections MUST stay within SSOT-URBANISM allowed modes.
[DECISION][URBMSK-040] Green layer prioritizes load management (thermal + air + noise) and crowd throughput, not ubiquitous “green everywhere” presence.
[DECISION][URBMSK-050] Parks exist primarily as designated assets (capacity buffers, event-pressure sinks), not as default courtyard fabric.

## CONTENT

### 1. Green and Open Space (LOCAL CHOICE = selective designated)

[STATE][URBMSK-100] green_space_role = ["microclimate_stabilization", "thermal_load_reduction", "human_comfort"].
[STATE][URBMSK-110] green_elements_integration = ["transport_corridors", "streets", "select_building_envelopes"].
[STATE][URBMSK-120] parks_presence = "selective_designated".
[STATE][URBMSK-130] parks_as_voids_dominant = "situational".
[STATE][URBMSK-140] daily_green_exposure = "non_guaranteed".
[STATE][URBMSK-150] green_space_maintenance = "mixed_regime".

### 2. Visual Texture (LOCAL EMPHASIS)

[STATE][URBMSK-200] baseline_visual_goal = "low_visual_noise__high_legibility".
[STATE][URBMSK-210] visual_noise = "suppressed_in_baseline_layer".
[DECISION][URBMSK-220] Density increases perceived stimulus without adding spectacle; suppression of visual noise applies to baseline layer only.

## USAGE / RESOLUTION

[DECISION][URBMSK-800] Scenes located in Moscow MUST treat greenery as concentrated: corridors, designated parks, engineered envelopes — not as ubiquitous courtyard presence.
[DECISION][URBMSK-810] Parks read as capacity-managed assets with explicit flow logic (entries, corridors, service perimeters), not as “natural voids”.
[DECISION][URBMSK-820] Any spectacle/aesthetic program MUST remain in designated modes and MUST NOT alter mass housing and infrastructure contracts.

## OUTPUT CONTRACT

~~~yaml
doc_id: BASELINE-URBANISM-MOSCOW-A-2215-0001
role_type: STATE
export:
  - metric: parks_presence
    owner_domain: URBANISM
    values:
      core: selective_designated
      p90: none
      range: none
    unit: none
  - metric: parks_as_voids_dominant
    owner_domain: URBANISM
    values:
      core: situational
      p90: none
      range: none
    unit: none
  - metric: daily_green_exposure
    owner_domain: URBANISM
    values:
      core: non_guaranteed
      p90: none
      range: none
    unit: none
  - metric: green_space_maintenance
    owner_domain: URBANISM
    values:
      core: mixed_regime
      p90: none
      range: none
    unit: none
  - metric: baseline_visual_goal
    owner_domain: URBANISM
    values:
      core: low_visual_noise__high_legibility
      p90: none
      range: none
    unit: none
  - metric: visual_noise
    owner_domain: URBANISM
    values:
      core: suppressed_in_baseline_layer
      p90: none
      range: none
    unit: none
~~~

## FORBIDDEN

[FORBIDDEN][URBMSK-900] Introducing metrics not declared in SSOT-URBANISM-A-2215-0007.
[FORBIDDEN][URBMSK-910] Selecting values outside SSOT-URBANISM allowed modes.
[FORBIDDEN][URBMSK-920] Treating megacity throughput constraints as justification for spectacle.

## NON-NORMATIVE

~~~text
Moscow fixes a concentrated-green profile: corridors and designated parks act as load buffers
and crowd-pressure sinks. Green is present, but it is managed as capacity, not as ubiquitous courtyard fabric.
~~~
