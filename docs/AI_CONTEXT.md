<architecture_docs>

<file path="baseline/BASELINE-URBANISM-CHELNY-A-2215-0001.md">
~~~markdown
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
  City-specific baseline for the Naberezhnye Chelny agglomeration in 2215
  under Scenario A. Selects concrete values from SSOT-URBANISM allowed modes
  and may apply explicit local selections where local identity, morphology,
  and long-lived planning inertia justify deviation from SSOT defaults.
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
[DECISION][URBCH-040] Local identity MUST NOT violate serviceability and platform contracts.
[DECISION][URBCH-050] Green layer is treated as long-horizon operational asset (microclimate + comfort), not as marketing showcase.

## CONTENT

### 1. Green and Open Space

[STATE][URBCH-100] green_space_role = ["microclimate_stabilization", "thermal_load_reduction", "human_comfort"].
[STATE][URBCH-110] green_elements_integration = ["residential_blocks", "courtyards", "streets", "transport_corridors"].
[STATE][URBCH-120] parks_presence = "pervasive_integrated".
[STATE][URBCH-130] parks_as_voids_dominant = false.
[STATE][URBCH-140] daily_green_exposure = "baseline_expected".
[STATE][URBCH-150] green_space_maintenance = "standardized_infrastructure_layer".

### 2. Visual Texture

[STATE][URBCH-200] palette_driver = ["thermal", "maintenance", "replacement_cycles", "green_integration"].
[DECISION][URBCH-210] Baseline visual goal for Chelny is legibility-first with persistent green presence; spectacle MUST NOT be applied by default.

## USAGE / RESOLUTION

[DECISION][URBCH-800] Scenes located in Naberezhnye Chelny MUST treat greenery as baseline presence (courtyards, corridors, streets), not as an event.
[DECISION][URBCH-810] Green maintenance is visible as standardized operations (pruning cycles, replacement grids), not as artisanal gardening.
[DECISION][URBCH-820] Any spectacle or aesthetic program MUST remain in designated modes and MUST NOT alter mass housing and infrastructure contracts.

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
Naberezhnye Chelny selects the high-integration green profile from SSOT-URBANISM
allowed modes. This reflects the agglomeration's long planning tradition of embedded
greenery as infrastructure, not a cosmetic overlay.
~~~
~~~
</file>

<file path="baseline/BASELINE-URBANISM-MOSCOW-A-2215-0001.md">
~~~markdown
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
  City-specific baseline for the Moscow megacity agglomeration in 2215
  under Scenario A. Selects concrete values from SSOT-URBANISM allowed modes
  and applies explicit local selections where megacity density, legacy layers,
  and operational constraints drive different urban texture.
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
[DECISION][URBMSK-040] Green layer prioritizes load management (thermal + air + noise) and crowd throughput, not ubiquitous pervasive presence.
[DECISION][URBMSK-050] Parks exist primarily as designated assets (capacity buffers, event-pressure sinks), not as default courtyard fabric.

## CONTENT

### 1. Green and Open Space

[STATE][URBMSK-100] green_space_role = ["microclimate_stabilization", "thermal_load_reduction", "human_comfort"].
[STATE][URBMSK-110] green_elements_integration = ["transport_corridors", "streets", "select_building_envelopes"].
[STATE][URBMSK-120] parks_presence = "selective_designated".
[STATE][URBMSK-130] parks_as_voids_dominant = "situational".
[STATE][URBMSK-140] daily_green_exposure = "non_guaranteed".
[STATE][URBMSK-150] green_space_maintenance = "mixed_regime".

### 2. Visual Texture

[STATE][URBMSK-200] baseline_visual_goal = "low_visual_noise__high_legibility".
[DECISION][URBMSK-210] Baseline visual goal for Moscow is legibility-first tuned for high throughput; green is concentrated and managed, not pervasive.
[STATE][URBMSK-220] visual_noise = "suppressed_in_baseline_layer".
[DECISION][URBMSK-230] Density increases perceived stimulus without adding spectacle; suppression of visual noise applies to baseline layer only.

## USAGE / RESOLUTION

[DECISION][URBMSK-800] Scenes located in Moscow MUST treat greenery as concentrated: corridors, designated parks, engineered envelopes — not as ubiquitous courtyard presence.
[DECISION][URBMSK-810] Parks read as capacity-managed assets with explicit flow logic (entries, corridors, service perimeters), not as natural voids.
[DECISION][URBMSK-820] Any spectacle or aesthetic program MUST remain in designated modes and MUST NOT alter mass housing and infrastructure contracts.

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
~~~

## FORBIDDEN

[FORBIDDEN][URBMSK-900] Introducing metrics not declared in SSOT-URBANISM-A-2215-0007.
[FORBIDDEN][URBMSK-910] Selecting values outside SSOT-URBANISM allowed modes.
[FORBIDDEN][URBMSK-920] Treating megacity density as justification for spectacle or aesthetic program in baseline layer.

## NON-NORMATIVE

~~~text
Moscow selects the selective-designated green profile from SSOT-URBANISM allowed modes.
This reflects megacity operational constraints: green is concentrated infrastructure
(corridors, engineered parks), not pervasive courtyard fabric as in smaller agglomerations.
~~~
~~~
</file>

<file path="canon/CANON-BUILDING_BLOCK-GLOBAL-2215-0001.md">
~~~markdown
---
id: CANON-BUILDING_BLOCK-GLOBAL-2215-0001
title: >
  Residential Building Block 2215 — Long-Lived Housing Canon
  (Platform State, Geometry Invariants, Time Stratification, Facade Evolution, Human Traces)
class: canon
status: fixed
prefix: BBK
doc_language: en-US
prose_language: ru-RU
inputs: []
depends_on:
  - SPEC-DOC_ID-2215-0001
  - SPEC-DOC_STYLE-2215-0001
  - SPEC-METHODOLOGY-2215-0001
references: []
scope: >
  Canon for the operational state of residential buildings in year 2215,
  regardless of original construction period. Defines platform-based housing
  as the only viable form of long-lived urban stock. Covers both legacy
  buildings refactored onto the platform model and native platform-built
  structures. Intended for prose depiction constraints only.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: enforce non-genre, long-lived housing realism for year-2215 prose; define the normative 2215 end-state; historical causality is normative only as justification constraints
INPUTS: []
OUTPUTS: [building_block_canon, platformization_rules, time_stratification_rules, operational_baseline_rules, anti_genre_constraints]
FORBIDDEN: [genre_futurism, cyberpunk_aesthetics, decorative_infrastructure, housing_showcase_aesthetics, image_generation_prompts]

## DEFINITIONS

[FACT][BBK-010] `building_block` = an operational residential building within the 2215 housing stock, regardless of original construction period, governed by platform-based maintenance and service contracts.
[FACT][BBK-012] `legacy_refactored` = a pre-platform building preserved as a load-bearing volume and brought into platform operation via `refactor_transition`.
[FACT][BBK-014] `native_platform` = a building designed from inception around `service_interface` nodes and a stable `infrastructural_core`.
[FACT][BBK-020] `geometry_invariant` = floor count, building footprint, volume, ground level, position of entrances and first-floor relationship to ground; unchanged since original construction (where applicable).
[FACT][BBK-030] `operational_baseline` = the minimum permissible regulatory condition at which a residential building is treated as functioning urban infrastructure rather than degrading stock.
[FACT][BBK-040] `platform_building` = a residential building whose operation, maintenance, tooling, and regulatory checks are executed through standardised `service_interface` nodes; the building functions as an operational platform, not a unique design object.
[FACT][BBK-050] `service_interface` = a repeatable access/connection/replacement node (panel module, service hatch, conduit box, fastener assembly) compatible with current regulatory procedures and tooling.
[FACT][BBK-060] `infrastructural_core` = the stable set of service zones, access paths, and interface locations within a 2215 building; a topological and contractual constant that does not change between maintenance cycles.
[FACT][BBK-070] `facade_cycle` = a generation of facade shell (cassettes/panels/fasteners), replaced locally and asynchronously; by 2215, multiple non-coinciding generations coexist on any given building.
[FACT][BBK-080] `infrastructure_belt` = the first floor as a zone of increased wear, protection, and regulated access.
[FACT][BBK-090] `time_stratification` = coexisting traces of different maintenance generations on the same object: present at the implementation level (panel types, colours, fastener models), absent at the interface level (service locations, access logic, connection standards are converged). Implementation diversity MUST NOT imply interface divergence.
[FACT][BBK-100] `human_trace` = a non-decorative trace of resident life that does not violate operational regulations.
[FACT][BBK-105] `showcase_marker` = any explicit prose depiction element that frames ordinary residential stock as a designed attraction (feature lighting, branded facade identity, “signature architecture”, retail-lobby staging, public-attraction framing).

[FACT][BBK-110] `maintenance_evolution` = historical change in appearance through maintenance, repair, and scheduled updates without architectural transformation; produces visible `time_stratification`.
[FACT][BBK-120] `refactor_transition` = a finite historical transition during which legacy buildings were irreversibly brought into compliance with platform architecture; after completion, further changes occur only at the implementation level.
[FACT][BBK-130] Regulatory and economic pressure converged housing maintenance onto standardised interfaces; by 2215, maintenance procedures, tooling, and inspection protocols assume `service_interface` nodes as given; non-platform operation is eliminated from operational stock.
[FACT][BBK-140] The `infrastructural_core` emerged through successive `refactor_transition` iterations as service zone positions, access paths, and interface locations stabilised; by 2215, these positions are fixed and do not drift between maintenance cycles.
[FACT][BBK-150] Visual heterogeneity of implementations accumulated as different contractors replaced components in different decades using different materials; interface contracts converged simultaneously, producing the 2215 signature: uniform service logic behind diverse surfaces.
[FACT][BBK-160] Residential construction shifted to `native_platform` once platform maintenance became the regulatory default; buildings are designed from inception around stable service interfaces and infrastructural cores.
[FACT][BBK-170] `native_platform` buildings differ from `legacy_refactored` stock only at the implementation level; their operational logic, interface contracts, and maintenance regimes are identical.

## INVARIANTS

[DECISION][BBK-200] In 2215, all operational residential buildings are `platform_building`; non-platformised buildings do not exist in the operational housing stock.
[DECISION][BBK-210] Platform-based architecture is not an upgrade or feature; it is the only survivable form of residential operation beyond ~150–200 years under the 2215 regulatory-economic regime.
[DECISION][BBK-220] Buildings not conforming to the platform model are phased out of operational housing stock through decommissioning, change of use, or exclusion from regulated maintenance.
[DECISION][BBK-230] In 2215, there is no categorical “old vs new” distinction at the operational level; both `legacy_refactored` and `native_platform` belong to the same platform housing class.

[DECISION][BBK-240] For `legacy_refactored` buildings, prose depictions MUST preserve the original load-bearing volume’s spatial identity; the load-bearing volume does not change over time.
[DECISION][BBK-250] For `legacy_refactored` buildings, `geometry_invariant` is fixed for the lifetime of the load-bearing structure: floor count, footprint, ground level relationship, and entrance positions do not drift.
[FORBIDDEN][BBK-260] For `legacy_refactored` buildings, demolition, vertical extension, disappearance of floors, or ground-level shift FORBIDDEN.

[DECISION][BBK-270] Prose depictions MUST NOT treat residential buildings as landmarks, showcases, or experiments; ordinary stock is the default.
[FORBIDDEN][BBK-280] Prose depictions containing any `showcase_marker` FORBIDDEN.

## CONTENT

### Object Status

[DECISION][BBK-300] In 2215 a residential building is an active asset, not a new object and not a ruin.
[DECISION][BBK-310] The building is not a city showcase, an experimental development, or a centre of attention.

### Operational Baseline

[DECISION][BBK-320] In 2215 the building MUST be depicted at or above the `operational_baseline`; traces of time are admissible ONLY on top of regulatory condition, not instead of it.
[DECISION][BBK-32A] The building MUST read as recently and regularly maintained: clean surfaces, aligned elements, neat joints; time is expressed as generational heterogeneity, not physical wear.
[FORBIDDEN][BBK-32B] Scuffing, peeling, soiling, or a “fatigued” facade that implies absent recent maintenance FORBIDDEN.
[DECISION][BBK-330] Load-bearing structures MUST be fully covered by protective shells; exposed concrete, slabs, and structural elements FORBIDDEN.
[FORBIDDEN][BBK-340] Visual signs of systemic degradation (“ran out of money”, “left as is”, “living out its final years”) FORBIDDEN.
[DECISION][BBK-350] The first floor MUST read as a functional `infrastructure_belt`: denser protection, service doors/hatches, traces of regulated access and maintenance.
[FORBIDDEN][BBK-360] A first floor that reads as abandoned, vacant, decommissioned, or “swallowed” by ground FORBIDDEN.
[DECISION][BBK-370] Courtyards and ground surfaces MUST be in acceptable operational condition: heterogeneity and patch repairs are admissible, collapse impressions are not.
[FORBIDDEN][BBK-380] Emergency-state pavement implying environmental collapse FORBIDDEN.
[DECISION][BBK-39A] Depicted quality MUST NOT be worse than the minimum acceptable standard for mass housing of the late 21st century.
[DECISION][BBK-39B] The building may be old, heterogeneous, and unattractive; it MUST NOT read as socially marginal due to abandonment or absent systemic maintenance.

### Time Stratification

[DECISION][BBK-440] In 2215, `time_stratification` reads as coexistence of different update GENERATIONS, each of which looked new and compliant at the time of installation.
[DECISION][BBK-450] Stratification is present at the implementation level: panel types, colours, fastener models differ across zones and floors.
[DECISION][BBK-460] Stratification is absent at the interface level: `service_interface` locations, access logic, and connection standards are converged and uniform across the building.
[FORBIDDEN][BBK-470] Interpreting `time_stratification` as accumulated physical wear or degradation FORBIDDEN.
[FORBIDDEN][BBK-480] Visual “simultaneity” as if everything was done in a single project FORBIDDEN.

### Facade

[DECISION][BBK-490] The facade is a ventilated modular shell.
[DECISION][BBK-500] Seams, fasteners, and traces of local replacement are visible.
[DECISION][BBK-510] There is no unified design pattern.
[DECISION][BBK-520] Palette is muted and functional: grey-sand, graphite, warm concrete.
[DECISION][BBK-530] Facade surfaces read as clean, intact, functional; no visual material ageing as the meaning-carrier.
[DECISION][BBK-540] Facade panels read as later-century manufactured replacements; they MUST NOT read as original/“surviving” cladding.
[DECISION][BBK-550] The facade reads as accumulation of several non-coinciding maintenance cycles carried out by different contractors in different decades.
[FORBIDDEN][BBK-560] A unified “single renovation project” read FORBIDDEN.

### Platform State

[DECISION][BBK-570] In 2215 the building reads as a `platform_building`: maintenance operates through standardised `service_interface` nodes.
[DECISION][BBK-580] Repeatable service nodes (hatches / conduit boxes / fastener assemblies / junction strips) are readable in logical maintenance locations.
[DECISION][BBK-590] The `infrastructural_core` is fixed: service zone locations, access paths, and interface positions are stable between cycles.
[DECISION][BBK-600] Visual diversity of implementations is present; diversity of interface contracts is absent.
[DECISION][BBK-610] Outdated implementations coexist with newer ones provided both conform to the same `service_interface` contract; components that still meet regulatory thresholds are not replaced.
[FORBIDDEN][BBK-620] Depicting platformisation as “hi-tech showcase” or aesthetic goal FORBIDDEN.
[DECISION][BBK-630] Platform signals are boring and institutional: standardised hatches, flat conduit runs, uniform access panels; they read as infrastructure, not as spectacle.

### Windows

[DECISION][BBK-640] Windows are energy-efficient, slightly tinted.
[DECISION][BBK-650] Different generations of windows may coexist; geometry is preserved.
[FORBIDDEN][BBK-660] Screens, interfaces, glow, sci-fi effects FORBIDDEN.

### First Floor — Infrastructure Belt

[DECISION][BBK-670] The `infrastructure_belt` is legible: denser materials, protective panels, deep vestibules, minimal functional navigation lighting.
[DECISION][BBK-680] The first floor implies restricted access and heightened regulation.
[FORBIDDEN][BBK-690] Lobby aesthetics and “inviting” design FORBIDDEN.

### Engineering Visibility

[FORBIDDEN][BBK-700] Decorative pipes, cable chaos, exoskeletons FORBIDDEN.
[DECISION][BBK-710] Only flat service conduit boxes and integrated shafts are depicted.
[DECISION][BBK-720] Every visible engineering element has a readable service logic.

### Human Traces

[DECISION][BBK-730] `human_trace` is admissible IF non-decorative and regulation-compatible: individual curtains, imperfect window unification, traces of entrance-group use.
[FORBIDDEN][BBK-740] Personalisation that turns the facade into a showcase FORBIDDEN.

### Yard and Environment

[DECISION][BBK-750] Courtyards of operational housing are maintained at or above `operational_baseline`; patchwork repairs and heterogeneous surfaces are typical.
[DECISION][BBK-760] Fewer cars, but cars are still present.
[FORBIDDEN][BBK-770] Neon, show-lighting, “future objects” inserted as spectacle FORBIDDEN.

### Climate Context

[DECISION][BBK-790] The climate is cold / moderately cold.
[DECISION][BBK-800] Materials and solutions imply moisture, snow, temperature swings.
[FORBIDDEN][BBK-810] Solutions that ignore the climate FORBIDDEN.

### Anti-Genre Constraints

[FORBIDDEN][BBK-820] Cyberpunk and sci-fi showcase aesthetics FORBIDDEN.
[FORBIDDEN][BBK-830] Borrowing recognisable genre templates FORBIDDEN.

## USAGE / RESOLUTION

[DECISION][BBK-840] This document is the normative canon for all prose depictions of residential development in 2215.
[DECISION][BBK-850] In case of conflict with scene-level data, this document takes precedence as a canon-class artefact.

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-BUILDING_BLOCK-GLOBAL-2215-0001
role_type: RULE
export:
  - rule_id: BBK-200
    intent: all operational residential buildings in 2215 are platform_building
    inputs: []
    outputs: [platformization_state_constraint]
  - rule_id: BBK-210
    intent: platform operation is the only survivable long-lived housing form under 2215 regime
    inputs: []
    outputs: [platform_survivability_constraint]
  - rule_id: BBK-270
    intent: residential buildings are ordinary stock; no landmark/showcase framing
    inputs: []
    outputs: [no_showcase_constraint]
  - rule_id: BBK-280
    intent: forbid showcase markers in prose depiction
    inputs: []
    outputs: [showcase_marker_forbidden]
  - rule_id: BBK-320
    intent: depiction must be at or above operational baseline; time is allowed only as generational heterogeneity
    inputs: []
    outputs: [operational_baseline_constraint]
  - rule_id: BBK-440
    intent: time stratification reads as generations, not wear
    inputs: []
    outputs: [time_stratification_constraint]
  - rule_id: BBK-460
    intent: interface-level stratification is absent; service interface contracts converged
    inputs: []
    outputs: [interface_convergence_constraint]
  - rule_id: BBK-490
    intent: facade is ventilated modular shell; no unified renovation project read
    inputs: []
    outputs: [facade_state_constraint]
  - rule_id: BBK-570
    intent: platform state is readable via standardized service interfaces; boring institutional signals only
    inputs: []
    outputs: [platformization_readability_constraint]
  - rule_id: BBK-820
    intent: forbid cyberpunk/sci-fi showcase aesthetics and genre templates in housing depiction
    inputs: []
    outputs: [anti_genre_constraint]
  - rule_id: BBK-240
    intent: legacy_refactored geometry invariants preserved; load-bearing volume identity remains
    inputs: []
    outputs: [legacy_geometry_invariant_constraint]
~~~

## FORBIDDEN

[FORBIDDEN][BBK-900] Demolition, vertical extension, alteration of load-bearing structure or `geometry_invariant` where invariants apply.
[FORBIDDEN][BBK-910] Systemic degradation, abandonment, decommissioning read (for operational housing).
[FORBIDDEN][BBK-920] Unified design pattern or “single renovation project” read for ordinary stock facades.
[FORBIDDEN][BBK-930] Cyberpunk, neon, sci-fi showcase aesthetics; recognisable genre templates.
[FORBIDDEN][BBK-940] Decorative engineering: pipes, cable chaos, exoskeletons.
[FORBIDDEN][BBK-950] Lobby aesthetics; inviting first-floor design.
[FORBIDDEN][BBK-960] Screens, interfaces, glow on windows.
[FORBIDDEN][BBK-970] Facade personalisation to the point of becoming a showcase.
[FORBIDDEN][BBK-980] “Platform” depicted as aesthetic demonstration rather than operational logic.
[FORBIDDEN][BBK-990] Diversity of `service_interface` contracts across coexisting implementations on the same building.
[FORBIDDEN][BBK-995] `showcase_marker` elements: signature lighting, branding the building as an object, curated facade “composition”, public-attraction framing.

## NON-NORMATIVE

~~~text
This document does NOT describe:
- internal apartment layouts
- specific technologies and brands
- city transport systems
- maintenance economics
- step-by-step transition playbooks (only the normative end-state and its justifications)
~~~

~~~
</file>

<file path="idx/IDX-CORPUS-0001.md">
~~~markdown
---
id: IDX-CORPUS-0001
title: >
  Corpus Registry
class: idx
status: draft
prefix: CORP
doc_language: en-US
inputs: []
depends_on: []
scope: >
  Нормативный реестр членства документов корпуса. Определяет, какие doc_id
  считаются частью корпуса, и предоставляет машиночитаемую таблицу навигации.
---

## LLM-INTENT

ROLE_TYPE: INDEX
SCOPE: normative corpus membership registry and navigation table
INPUTS: []
OUTPUTS: [registry_rows]
FORBIDDEN: [worldbuilding, prose, implicit_membership, rule_definition, state_definition]

## DEFINITIONS

[FACT][CORP-010] `registry_row` = запись таблицы с полями {id, file, class, status, role_type, inputs, depends_on}.
[FACT][CORP-020] `membership` = свойство документа считаться частью корпуса.
[FACT][CORP-030] `primary_key` = поле `id`.

## INVARIANTS

[DECISION][CORP-100] Document HAS membership IFF its `id` exists in Registry table; ELSE FAIL.
[DECISION][CORP-110] Any `depends_on` reference MUST exist in Registry; ELSE FAIL.
[DECISION][CORP-115] Any `inputs` reference MUST exist in Registry; ELSE FAIL.
[DECISION][CORP-120] Any document with `status: fixed` MUST exist in Registry; ELSE FAIL.
[DECISION][CORP-130] `id` MUST be unique across rows; ELSE FAIL.
[DECISION][CORP-140] Registry table is the ONLY authoritative membership source; ELSE FAIL.

[FORBIDDEN][CORP-150] Implicit membership by folder presence.
[FORBIDDEN][CORP-160] Redefining rules or state inside this INDEX.
[FORBIDDEN][CORP-170] Narrative or descriptive prose.

## CONTENT

|id|file|class|status|role_type|inputs|depends_on|
|--|----|-----|------|---------|------|----------|
|BASELINE-URBANISM-CHELNY-A-2215-0001|docs/baseline/BASELINE-URBANISM-CHELNY-A-2215-0001.md|baseline|fixed|STATE|SSOT-URBANISM-A-2215-0007|SPEC-DOC_STYLE-2215-0001|
|BASELINE-URBANISM-MOSCOW-A-2215-0001|docs/baseline/BASELINE-URBANISM-MOSCOW-A-2215-0001.md|baseline|fixed|STATE|SSOT-URBANISM-A-2215-0007|SPEC-DOC_STYLE-2215-0001|
|CANON-BUILDING_BLOCK-GLOBAL-2215-0001|docs/canon/CANON-BUILDING_BLOCK-GLOBAL-2215-0001.md|canon|fixed|RULE||SPEC-DOC_ID-2215-0001,SPEC-DOC_STYLE-2215-0001,SPEC-METHODOLOGY-2215-0001|
|IDX-CORPUS-0001|docs/idx/IDX-CORPUS-0001.md|idx|draft|INDEX|||
|SPEC-DOC_ID-2215-0001|docs/spec/SPEC-DOC_ID-2215-0001.md|spec|draft|RULE||SPEC-DOC_STYLE-2215-0001|
|SPEC-DOC_STYLE-2215-0001|docs/spec/SPEC-DOC_STYLE-2215-0001.md|spec|fixed|RULE||SPEC-PRIORITY_RESOLUTION-2215-0001|
|SPEC-METHODOLOGY-2215-0001|docs/spec/SPEC-METHODOLOGY-2215-0001.md|spec|draft|RULE||IDX-CORPUS-0001,SPEC-DOC_ID-2215-0001,SPEC-DOC_STYLE-2215-0001,SPEC-PRIORITY_RESOLUTION-2215-0001|
|SPEC-PRIORITY_RESOLUTION-2215-0001|docs/spec/SPEC-PRIORITY_RESOLUTION-2215-0001.md|spec|fixed|RULE|||
|SSOT-AUTOMATION-A-2215-0004|docs/ssot/SSOT-AUTOMATION-A-2215-0004.md|ssot|draft|STATE||SPEC-DOC_STYLE-2215-0001,SSOT-SCENARIO-A-2215-0001|
|SSOT-CLIMATE-A-2215-0004|docs/ssot/SSOT-CLIMATE-A-2215-0004.md|ssot|draft|STATE||SPEC-DOC_STYLE-2215-0001,SSOT-ENERGY-A-2215-0004,SSOT-SCENARIO-A-2215-0001|
|SSOT-CONSISTENCY-A-2215-0009|docs/ssot/SSOT-CONSISTENCY-A-2215-0009.md|ssot|draft|RULE||SPEC-DOC_STYLE-2215-0001,SSOT-AUTOMATION-A-2215-0004,SSOT-CLIMATE-A-2215-0004,SSOT-DEMOGRAPHY-A-2215-0002,SSOT-ECONOMY-A-2215-0003,SSOT-ENERGY-A-2215-0004,SSOT-GOVERNANCE-SECURITY-A-2215-0005,SSOT-SCENARIO-A-2215-0001,SSOT-URBANISM-A-2215-0007|
|SSOT-DEMOGRAPHY-A-2215-0002|docs/ssot/SSOT-DEMOGRAPHY-A-2215-0002.md|ssot|draft|STATE|SSOT-ECONOMY-A-2215-0003,SSOT-LIFE-A-2215-0007,SSOT-SCENARIO-A-2215-0001|SPEC-DOC_STYLE-2215-0001|
|SSOT-ECONOMY-A-2215-0003|docs/ssot/SSOT-ECONOMY-A-2215-0003.md|ssot|draft|STATE||SPEC-DOC_STYLE-2215-0001,SSOT-AUTOMATION-A-2215-0004,SSOT-SCENARIO-A-2215-0001|
|SSOT-ENERGY-A-2215-0004|docs/ssot/SSOT-ENERGY-A-2215-0004.md|ssot|draft|STATE||SPEC-DOC_STYLE-2215-0001,SSOT-ECONOMY-A-2215-0003,SSOT-SCENARIO-A-2215-0001|
|SSOT-GOVERNANCE-SECURITY-A-2215-0005|docs/ssot/SSOT-GOVERNANCE-SECURITY-A-2215-0005.md|ssot|draft|STATE||SPEC-DOC_STYLE-2215-0001,SSOT-ECONOMY-A-2215-0003,SSOT-SCENARIO-A-2215-0001|
|SSOT-LAW-A-2215-0008|docs/ssot/SSOT-LAW-A-2215-0008.md|ssot|fixed|STATE|||
|SSOT-LIFE-A-2215-0007|docs/ssot/SSOT-LIFE-A-2215-0007.md|ssot|draft|STATE||SSOT-SCENARIO-A-2215-0001,SSOT-DEMOGRAPHY-A-2215-0002,SSOT-ECONOMY-A-2215-0003|
|SSOT-LOC-WEATHER-CHELNY-2215-0001|docs/ssot/SSOT-LOC-WEATHER-CHELNY-2215-0001.md|ssot|draft|STATE||SPEC-DOC_STYLE-2215-0001|
|SSOT-SCENARIO-A-2215-0001|docs/ssot/SSOT-SCENARIO-A-2215-0001.md|ssot|draft|STATE||SPEC-DOC_STYLE-2215-0001|
|SSOT-SPACE-INDUSTRY-A-2215-0006|docs/ssot/SSOT-SPACE-INDUSTRY-A-2215-0006.md|ssot|draft|STATE|SSOT-SCENARIO-A-2215-0001,SSOT-ECONOMY-A-2215-0003|SPEC-DOC_STYLE-2215-0001|
|SSOT-URBANISM-A-2215-0007|docs/ssot/SSOT-URBANISM-A-2215-0007.md|ssot|fixed|STATE|SSOT-DEMOGRAPHY-A-2215-0002,SSOT-SCENARIO-A-2215-0001|SPEC-DOC_STYLE-2215-0001|
## USAGE / RESOLUTION

[DECISION][CORP-200] Tools generating AI_CONTEXT or performing lint MUST consume only rows of this table; ELSE FAIL.
[DECISION][CORP-210] Filename MUST equal `<id>.md`; ELSE FAIL.
[DECISION][CORP-220] Path column is informational and MUST NOT redefine membership.

## OUTPUT CONTRACT

~~~yaml
doc_id: IDX-CORPUS-0001
role_type: INDEX
export:
  column_types:
    id: doc_id
    file: path
    class: enum
    status: enum
    role_type: enum
    inputs: doc_id_csv
    depends_on: doc_id_csv
  column_encoding:
    doc_id_csv:
      separator: ","
      empty: ""
      trim: true
  columns:
    - id
    - file
    - class
    - status
    - role_type
    - inputs
    - depends_on
  primary_key: id
  rows_source: CONTENT
~~~

## FORBIDDEN

[FORBIDDEN][CORP-900] Using folder scan as corpus membership.
[FORBIDDEN][CORP-901] Consuming documents not present in this registry.
[FORBIDDEN][CORP-902] Treating any content outside the table in `## CONTENT` as registry data.
[FORBIDDEN][CORP-903] Using placeholders like "—" in CSV-typed columns.
[FORBIDDEN][CORP-904] Emitting spaces around separators in doc_id_csv (must be "," only).

## NON-NORMATIVE

(empty)

~~~
</file>

<file path="spec/SPEC-DOC_ID-2215-0001.md">
~~~markdown
---
id: SPEC-DOC_ID-2215-0001
title: >
  Document ID Contract — Corpus Doc-ID Grammar, Namespaces, and Lint Gates (2215)
class: spec
status: draft
prefix: DOCID
doc_language: en-US
inputs: []
depends_on:
  - SPEC-DOC_STYLE-2215-0001
references:
  - IDX-CORPUS-0001
scope: >
  Норматив грамматики `id` (doc_id) для всех документов корпуса 2215.
  Поддерживается single-author режим: разрешён rename+replace без migration_redirect
  при условии closed-world корпуса (IDX является полным реестром).
  Механизм OVERRIDE отсутствует: семейство OVERRIDE не допускается.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: define corpus-wide doc_id grammar, namespace-to-class mapping, scope schemas, lint gates, and deterministic rename rules (override family removed)
INPUTS: []
OUTPUTS: [doc_id_grammar, allowed_families, family_scope_schemas, class_family_mapping, lint_gates]
FORBIDDEN: [implicit_id_schemes, freeform_id_segments, mixed_scope_orders, non_decidable_exceptions, override_family]

## DEFINITIONS

[FACT][DOCID-010] `doc_id` = значение YAML-ключа `id` документа корпуса, являющееся глобальным идентификатором.
[FACT][DOCID-011] `family` = первый сегмент `doc_id` (split by `-`).
[FACT][DOCID-012] `topic` = второй сегмент `doc_id` (split by `-`), используемый как стабильный идентификатор предметной области; не обязан быть человекочитаемым.
[FACT][DOCID-013] `scope` = сегменты между `topic` и `seq`.
[FACT][DOCID-014] `seq` = последний сегмент (`0001..9999`).
[FACT][DOCID-015] `series_key` = `<family>-<topic>-<scope>`.

[FACT][DOCID-016] `class_family_match` = YAML `class` согласован с `family`.
[FACT][DOCID-017] `legacy_doc_id` = исторический id, нарушающий текущую схему.
[FACT][DOCID-018] `migration_redirect` = механизм соответствия old→new (опциональный механизм совместимости, не обязателен для closed-world).
[FACT][DOCID-019] `rename_replace` = операция, при которой документ переименован, файл переименован, все inbound/outbound ссылки заменены, а старый `doc_id` полностью отсутствует в IDX и корпусе.
[FACT][DOCID-020] `corpus_closed_world` = допущение, что весь корпус полностью перечислен в IDX-CORPUS; ссылки вне него не учитываются lint gates.

[FACT][DOCID-022] `corpus_year` = целевой год корпуса, используемый для валидации сегмента `<year>` в doc_id (по умолчанию: 2215).
[FACT][DOCID-023] `year_segment` = сегмент `<year>` в doc_id для семейств, чьи scope схемы содержат `<year>`.

[FACT][DOCID-025] `topic_label` = строка, допускающая пробелы и дефисы; предназначена для UI/навигации/читаемости и не влияет на `doc_id`.

## INVARIANTS

[DECISION][DOCID-030] Every corpus document MUST have decidably valid `doc_id`; ELSE FAIL.
[DECISION][DOCID-031] Deterministic grammar MUST override naming preference; ELSE FAIL.
[DECISION][DOCID-032] Deviations MUST be either legacy OR resolved via rename_replace; ELSE FAIL.
[RULE][DOCID-033] PASS IFF this spec is COMPLIANT with SPEC-DOC_STYLE-2215-0001; ELSE FAIL.

## CONTENT

### 1. Charset

[RULE][DOCID-040] PASS IFF `doc_id` matches `^[A-Z0-9_-]+$`; ELSE FAIL.
[RULE][DOCID-041] PASS IFF `doc_id` does NOT contain consecutive underscores (`__`); ELSE FAIL.

### 2. Sequence

[RULE][DOCID-050] PASS IFF `doc_id` matches `-[0-9]{4}$`; ELSE FAIL.
[RULE][DOCID-051] PASS IFF `seq_int` derived from `seq` satisfies `seq_int ∈ [1, 9999]`; ELSE FAIL.
[RULE][DOCID-052] PASS IFF `doc_id` is unique inside `series_key` within IDX-CORPUS; ELSE FAIL.

### 3. Family ↔ class

[RULE][DOCID-060] PASS IFF `family` is in `allowed_families`; ELSE FAIL.
[RULE][DOCID-061] IF `legacy_doc_id = false` THEN PASS IFF `class_family_match = true`; ELSE FAIL.

### 4. Scope schemas

[RULE][DOCID-070] PASS IFF `doc_id` matches form `<family>-<topic>-<scope>-<seq>`; ELSE FAIL.
[RULE][DOCID-071] PASS IFF `topic` is a single segment token and matches `^[A-Z0-9]+(?:_[A-Z0-9]+)*$`; ELSE FAIL.
[RULE][DOCID-072] PASS IFF `scope` conforms to `family_scope_schemas[family]`; ELSE FAIL.
[RULE][DOCID-073] IF `family_scope_schemas[family]` contains `<year>` THEN PASS IFF `year_segment == 2215`; ELSE FAIL.
[RULE][DOCID-075] IF `topic_label` is present THEN PASS IFF `topic_label` is a non-empty string AND contains at least one letter; ELSE FAIL.
[RULE][DOCID-076] PASS IFF any multiword `topic` uses `_` separators; ELSE FAIL.
[FORBIDDEN][DOCID-077] New documents MUST NOT introduce CamelCase inside `topic` (e.g., `CHAPTERDELIVERY`); use `_` (e.g., `CHAPTER_DELIVERY`).

~~~yaml
allowed_families:
  - SSOT
  - BASELINE
  - CANON
  - SPEC
  - PROTOCOL
  - IDX
  - REG
  - PLAN
  - SCENE

class_family_mapping:
  ssot: SSOT
  baseline: BASELINE
  canon: CANON
  spec: SPEC
  protocol: PROTOCOL
  idx: IDX
  registry: REG
  plan: PLAN
  scene: SCENE

family_scope_schemas:
  SSOT: "<family>-<topic>-<scenario>-<year>-<seq>"
  BASELINE: "<family>-<topic>-<year>-<seq>"
  CANON: "<family>-<topic>-<scope_variant>-<year>-<seq>"
  SPEC: "<family>-<topic>-<year>-<seq>"
  PROTOCOL: "<family>-<topic>-<year>-<seq>"
  IDX: "<family>-<topic>-<seq>"
  REG: "<family>-<topic>-<year>-<seq>"
  PLAN: "<family>-<topic>-<year>-<seq>"
  SCENE: "<family>-<topic>-<scope_variant>-<year>-<seq>"
~~~

### 5. Canonical forms

[RULE][DOCID-080] PASS IFF SSOT form is `SSOT-<TOPIC>-<SCENARIO>-2215-<SEQ>`; ELSE FAIL.
[RULE][DOCID-081] PASS IFF SPEC form is `SPEC-<TOPIC>-2215-<SEQ>`; ELSE FAIL.
[RULE][DOCID-082] PASS IFF CANON form is `CANON-<TOPIC>-<SCOPE>-2215-<SEQ>`; ELSE FAIL.
[RULE][DOCID-083] PASS IFF PROTOCOL form is `PROTOCOL-<TOPIC>-2215-<SEQ>`; ELSE FAIL.
[RULE][DOCID-084] PASS IFF IDX form is `IDX-<TOPIC>-<SEQ>`; ELSE FAIL.

## USAGE / RESOLUTION

[DECISION][DOCID-100] Spec is normative for all corpus docs.
[DECISION][DOCID-101] `doc_id` is primary key.
[RULE][DOCID-102] PASS IFF filename equals `<doc_id>.md`; ELSE FAIL.

## OUTPUT CONTRACT

~~~yaml
doc_id: SPEC-DOC_ID-2215-0001
role_type: RULE
export:
  - gate_id: DOCID-LINT-001
    intent: charset valid
    predicate: "doc_id matches ^[A-Z0-9_-]+$"
  - gate_id: DOCID-LINT-002
    intent: seq valid
    predicate: "doc_id ends with -[0-9]{4} and seq_int ∈ [1,9999]"
  - gate_id: DOCID-LINT-003
    intent: family allowed
    predicate: "family ∈ allowed_families"
  - gate_id: DOCID-LINT-004
    intent: topic single segment
    predicate: "topic matches ^[A-Z0-9]+(?:_[A-Z0-9]+)*$"
  - gate_id: DOCID-LINT-005
    intent: scope schema valid
    predicate: "scope conforms to family_scope_schemas[family]"
  - gate_id: DOCID-LINT-010
    intent: year segment matches corpus_year
    predicate: "family_scope_schemas[family] contains <year> => year_segment == 2215"
  - gate_id: DOCID-LINT-006
    intent: class_family_match
    predicate: "legacy_doc_id=false => class_family_mapping[class]=family"
  - gate_id: DOCID-LINT-007
    intent: uniqueness
    predicate: "doc_id unique within series_key in IDX-CORPUS"
  - gate_id: DOCID-LINT-009
    intent: filename equals doc_id
    predicate: "filename == doc_id + .md"
config:
  allowed_families_ref: "CONTENT.allowed_families"
  class_family_mapping_ref: "CONTENT.class_family_mapping"
  family_scope_schemas_ref: "CONTENT.family_scope_schemas"
~~~

## FORBIDDEN

[FORBIDDEN][DOCID-900] New family without updating schema.
[FORBIDDEN][DOCID-901] Hyphens in topic.
[FORBIDDEN][DOCID-902] Mixed scope schemas.
[FORBIDDEN][DOCID-903] Creating new legacy forms.
[FORBIDDEN][DOCID-904] Introducing family `OVERRIDE` or any equivalent mechanism.

## NON-NORMATIVE

~~~markdown
rename_replace workflow:
1. rename file
2. change id
3. replace all references
4. ensure old id absent in IDX
~~~

~~~
</file>

<file path="spec/SPEC-DOC_STYLE-2215-0001.md">
~~~markdown
---
id: SPEC-DOC_STYLE-2215-0001
title: >
  SSOT Document Style Guide — LLM-Executable Corpus Standard (2215)
class: spec
status: fixed
scope: >
  Normative standard for formatting SSOT/BASELINE/CANON/IDX documents in project 2215.
  Goal: maximum determinism and LLM-executability (minimal interpretation).
  This document defines mandatory sections, block types, allowed language,
  output contract, and rules for decomposing facts/rules/bindings.
prefix: STYLE
doc_language: en-US
inputs: []
depends_on:
  - SPEC-PRIORITY_RESOLUTION-2215-0001
references:
  - IDX-CORPUS-0001
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: define machine-readable corpus doc structure, language policy, record-stream formats, and compliance gates (compiler-grade)
INPUTS: []
OUTPUTS: [doc_style_rules, lint_gates, section_schema, rewrite_protocol, language_policy, record_stream_rules]
FORBIDDEN: [implicit_sections, missing_ids, ambiguous_markers, undocumented_exceptions, body_yaml_delimiters]

## DEFINITIONS

[FACT][STYLE-010] `document` = corpus unit: YAML front-matter (optional) + Markdown body, bounded by one set of YAML delimiters at document start.
[FACT][STYLE-011] `front_matter` = YAML block between two YAML delimiter lines at document start.
[FACT][STYLE-012] `yaml_delimiter_line` = line equal to `---` (used only for front_matter delimiters).
[FACT][STYLE-013] `skeleton` = fixed set of top-level sections (H2), used by all corpus documents.
[FACT][STYLE-014] `statement` = atomic line with `[TAG][ID]` prefix and a single semantic unit.
[FACT][STYLE-015] `statement_id` = stable identifier of form `<DOCPREFIX>-NNN<SFX>`, where `NNN` is a three-digit number and `<SFX>` is an optional suffix `A..Z` for branching/refinement without renumbering.
[FACT][STYLE-016] `docprefix` = prefix for `statement_id`, declared explicitly in YAML as `prefix:` OR inferred as the single common prefix of all `statement_id` in the document.
[FACT][STYLE-017] `ROLE_TYPE` = semantic role of document: STATE | RULE | BIND | INTERFACE | INDEX.
[FACT][STYLE-018] `doc_class` = document class per YAML `class:` (ssot|baseline|canon|spec|protocol|idx|registry|plan|scene, etc. per project).
[FACT][STYLE-019] `NON-NORMATIVE` = section for comments/examples, not a source of rules or facts.

[FACT][STYLE-020A] `structural_heading_line` = Markdown heading line of level H3 (`### ...`), used only for visual/navigational grouping.
[FACT][STYLE-020B] `statement_continuation_line` = statement continuation line, starting with two spaces; belongs to the preceding statement line.
[FACT][STYLE-020C] `markdown_table_line` = Markdown table line (`| ... |`) or alignment line (`| --- |`), used only in cases allowed by ROLE_TYPE rules.
[FACT][STYLE-020D] `statement_line` = non-empty line satisfying `STYLE-059A`.
[FACT][STYLE-020E] `fenced_machine_block` = fenced block bounded by `~~~` lines (optional language after opening fence), closed by `~~~` line.
[FACT][STYLE-020F] `allowed_normative_line_type` = {statement_line, statement_continuation_line, fenced_machine_block, structural_heading_line, markdown_table_line}.

[FACT][STYLE-210] `doc_id_reference_token` = token in text that MUST be treated as a corpus document reference, PASS IFF it matches regex `\b[A-Z0-9_]+(?:-[A-Z0-9_]+)+-[0-9]{4}\b`.
[FACT][STYLE-211] `explicit_dependency_set` = `hard_dependency_set` from YAML front_matter of current document.
[FACT][STYLE-212] `corpus_registry` = closed-world registry of corpus doc_id (IDX-CORPUS as source of truth for membership).
[FACT][STYLE-213] `superseded_by` = YAML key specifying doc_id that replaces a deprecated document.
[FACT][STYLE-214] `inputs` = list of doc_id whose `OUTPUT CONTRACT.export` is directly consumed by current document as data (data-flow dependency).
[FACT][STYLE-215] `depends_on` = list of doc_id on which the document relies normatively or semantically, but does NOT consume their export.
[FACT][STYLE-216] `hard_dependency_set` = `inputs ∪ depends_on`.
[FACT][STYLE-217A] `references` = list of doc_id mentioned or used as context in normative sections of the document, but not being either data-flow (`inputs`) or semantic (`depends_on`) dependencies.
[FACT][STYLE-217B] `contextual_reference_set` = `references`.
[FACT][STYLE-217C] `dependency_dag_set` = `inputs ∪ depends_on`.
[FACT][STYLE-218] `doc_id_segment_token` = doc_id segment between hyphens; PASS IFF matches `^[A-Z0-9]+(?:_[A-Z0-9]+)*$`.

[FACT][STYLE-260] `doc_language` = IETF language tag, declared in YAML as `doc_language: <tag>`, defining the primary language of non-diegetic document text.
[FACT][STYLE-270] `prose_language` = IETF language tag, declared in YAML as `prose_language: <tag>`, defining the required language for diegetic output (prose) that the document constrains.
[FACT][STYLE-280] `proper_name` = proper name token (character/toponym/organization/brand), used in TYPE C or in prose.
[FACT][STYLE-290] `canon_ru` = canonical Russian form of `proper_name`, used for binding and output in prose.
[FACT][STYLE-300] `display_ru` = Russian display form of `proper_name` in prose; if absent, `canon_ru` is used.
[FACT][STYLE-310] `canon_en` = optional canonical English form of `proper_name` for English-language documents; MUST NOT be derived automatically from `canon_ru`.
[FACT][STYLE-320] `record_stream` = ordered sequence of machine-readable records, used as TYPE C input (scenes/timeline/event array, etc.).
[FACT][STYLE-330] `record_format_id` = identifier for encoding/parsing format of `record_stream`, declared in YAML as `record_format_id: <id>`.
[FACT][STYLE-340] `dataset_id` = identifier for a dataset grouping multiple documents into one logical `record_stream` (series of acts/parts), declared in YAML as `dataset_id: <id>`.

## INVARIANTS

[DECISION][STYLE-030] This document itself MUST be COMPLIANT with its own standard (variant A: self-application).
[DECISION][STYLE-030A] Any document of class `spec` having ROLE_TYPE=RULE MUST be COMPLIANT with SPEC-DOC_STYLE-2215-0001; ELSE FAIL (self-consistency gate).
[DECISION][STYLE-030B] Any document with ROLE_TYPE=RULE MUST be COMPLIANT with SPEC-DOC_STYLE-2215-0001; ELSE FAIL (rule-doc self-consistency).
[DECISION][STYLE-031] Corpus allows exactly one `skeleton` for all documents; exceptions are possible only via explicit `[DECISION]` in the standard document and MUST be machine-readable.
[DECISION][STYLE-032] Any ambiguity allowing LLM to choose "as convenient" is treated as determinism hazard and MUST be eliminated by rule or lint gate.
[DECISION][STYLE-033A] Any rule in this standard MUST be formulated as a checkable predicate; if predicate is not defined, the rule is considered INVALID.
[DECISION][STYLE-033B] If a rule permits ≥2 interpretations, the rule-bearing document MUST be treated as NON-COMPLIANT (ambiguity hazard).

## CONTENT

### 0. Prime Directive (NORMATIVE)

[DECISION][STYLE-000] Corpus MUST be LLM-executable: deterministic parsing > human readability; explicit contracts > narrative explanations; atomic statements > prose.
[FORBIDDEN][STYLE-001] "Essay mode": long paragraphs; rhetorical connectors; implicit assumptions; "world flavor" to justify numbers.
[DECISION][STYLE-002] Explanatory prose is FORBIDDEN in normative sections; only atomic statements and machine-readable blocks are allowed.

### 1. Role-Type precedence (semantic) vs class precedence (applicability)

[DECISION][STYLE-101] Role-type precedence (semantic) is: STATE → RULE → BIND → INTERFACE → INDEX.
[DECISION][STYLE-102] ROLE_TYPE is restricted to: STATE | RULE | BIND | INTERFACE | INDEX.
[FORBIDDEN][STYLE-103] Introducing new ROLE_TYPE identifiers.
[DECISION][STYLE-104] Role-type precedence defines semantic authority (RULE constrains STATE; BIND selects STATE; INTERFACE defines ownership/consumes; INDEX navigates) and MUST NOT be used as document applicability order.
[DECISION][STYLE-105] Document-class resolution order (applicability) MUST be taken ONLY from `SPEC-PRIORITY_RESOLUTION-2215-0001`.
[FORBIDDEN][STYLE-106] Mixing role-type precedence with document-class resolution.
[FORBIDDEN][STYLE-107] Introducing alternative document-class precedence inside this STYLE guide or any other doc.

### 2. Mandatory Document Skeleton (top-level sections)

[DECISION][STYLE-020] All documents MUST include the following H2 sections in this exact order (sections may be empty but MUST exist):
[DECISION][STYLE-021] 1. `## LLM-INTENT`
[DECISION][STYLE-022] 2. `## DEFINITIONS`
[DECISION][STYLE-023] 3. `## INVARIANTS`
[DECISION][STYLE-024] 4. `## CONTENT`
[DECISION][STYLE-025] 5. `## USAGE / RESOLUTION`
[DECISION][STYLE-026] 6. `## OUTPUT CONTRACT`
[DECISION][STYLE-027] 7. `## FORBIDDEN`
[DECISION][STYLE-028] 8. `## NON-NORMATIVE` (optional; if absent, examples are forbidden).
[DECISION][STYLE-029] Headers MUST match exactly (case-sensitive; exact bytes).
[FORBIDDEN][STYLE-033] Any additional top-level (H2) sections outside the skeleton.
[FORBIDDEN][STYLE-034] Any `yaml_delimiter_line` inside the document body (segmentation hazard).
[DECISION][STYLE-095] Structural H3 headings are permitted ONLY as `### <title>` lines inside `## CONTENT` and `## NON-NORMATIVE`; ELSE FAIL.
[DECISION][STYLE-096] H3 structural heading line MUST match regex: `^###\s.+$`; ELSE FAIL.
[FORBIDDEN][STYLE-097] Heading levels H4+ (`####` and deeper) are forbidden in all sections; ELSE FAIL.
[FORBIDDEN][STYLE-099] H3 headings with numeric prefix `N)` are forbidden (editor noise / noncanonical numbering).
[DECISION][STYLE-099A] PASS IFF any H3 heading that begins with digits matches ^###\s[0-9]+(?:\.[0-9]+)*\s.+$; ELSE FAIL.

### 2.1 YAML front-matter (normalization; deterministic parsing)

[DECISION][STYLE-130] Any corpus document that is consumed as an input (i.e., referenced by `inputs`/`depends_on` or listed in IDX registry) MUST include `front_matter`.
[DECISION][STYLE-131] `front_matter` MUST include keys: `id`, `title`, `class`, `status`, `scope`, `inputs`, `depends_on`, `references`.
[DECISION][STYLE-132] `inputs` and `depends_on` MUST be present; when empty they MUST be `[]`; when non-empty they MUST be YAML block lists (`- <id>`) sorted lexicographically ascending.
[DECISION][STYLE-132A] `references` MUST be present; when empty it MUST be `[]`; when non-empty it MUST be a YAML block list sorted lexicographically.
[DECISION][STYLE-133] `id` MUST be ASCII uppercase with digits, hyphens, and underscores only (`[A-Z0-9_-]+`) and MUST be unique within the corpus membership registry.
[DECISION][STYLE-135] `status` MUST be one of: `draft` | `fixed` | `deprecated`.
[DECISION][STYLE-135A] IF `status=deprecated` THEN front_matter MUST include `superseded_by: <doc_id>`; ELSE FAIL.
[FORBIDDEN][STYLE-135B] New or modified documents MUST NOT declare `inputs`/`depends_on` referencing deprecated docs; ELSE FAIL.
[DECISION][STYLE-136] Non-core YAML keys are allowed ONLY if they are either standardized in this spec (e.g., `prefix`, `doc_language`, `prose_language`, `dataset_id`, `record_format_id`, `superseded_by`, `references`, `changelog`, `topic_label`) OR prefixed with `x_`.
[FORBIDDEN][STYLE-137] YAML anchors, aliases, and merge keys (parsing ambiguity).
[FORBIDDEN][STYLE-138] Tabs in YAML or body text (parser ambiguity); indentation MUST be spaces only.
[RULE][STYLE-139A] PASS IFF `inputs ∩ depends_on = ∅`; ELSE FAIL.
[RULE][STYLE-139B] PASS IFF any doc_id in `inputs` is required to interpret the document's `OUTPUT CONTRACT.export`; ELSE FAIL (anti-bloat rule).
[RULE][STYLE-139C] PASS IFF any doc_id in `depends_on` is NOT required to interpret the document's `OUTPUT CONTRACT.export`; ELSE FAIL (boundary rule).
[RULE][STYLE-139D] PASS IFF `inputs`, `depends_on`, `references` are pairwise disjoint; ELSE FAIL.

### 2.2 File-level invariants (byte stability; parser safety)

[RULE][STYLE-190] PASS IFF file encoding is UTF-8 and contains no BOM; ELSE FAIL.
[RULE][STYLE-191] PASS IFF file uses LF line endings only (`\n`), no CRLF; ELSE FAIL.
[RULE][STYLE-192] PASS IFF no line has trailing whitespace; ELSE FAIL.
[RULE][STYLE-193] PASS IFF file ends with exactly one newline; ELSE FAIL.

### 2.3 Reference integrity (closed-world; explicit dependencies)

[RULE][STYLE-200A] PASS IFF every doc_id in (`inputs` ∪ `depends_on` ∪ `references`) exists in `corpus_registry`; ELSE FAIL.
[RULE][STYLE-200B] PASS IFF corpus dependency graph over `inputs ∪ depends_on` is acyclic (DAG); ELSE FAIL.
[RULE][STYLE-200C] PASS IFF any `doc_id_reference_token` in normative sections is in (`inputs` ∪ `depends_on` ∪ `references`) OR equals current document `id`; ELSE FAIL.
[DECISION][STYLE-200D] `references` MUST be excluded from DAG construction and cycle detection.

### 3. LLM-INTENT block (required; machine header)

[DECISION][STYLE-035] `## LLM-INTENT` MUST contain exactly these keys (order free, ≤ 20 lines total):
[DECISION][STYLE-036] `ROLE_TYPE: STATE|RULE|BIND|INTERFACE|INDEX`
[DECISION][STYLE-037] `SCOPE: <one-sentence>`
[DECISION][STYLE-038] `INPUTS: <list>` (use `[]` when none)
[DECISION][STYLE-039] `OUTPUTS: <list>` (use `[]` when none)
[DECISION][STYLE-040] `FORBIDDEN: <list>` (use `[]` when none)
[FORBIDDEN][STYLE-041] Hidden dependencies not listed in INPUTS when they affect interpretation or exports.

### 4. Statement Grammar (atomic, tagged, id-stable)

[DECISION][STYLE-042] All normative or factual content MUST be expressed as atomic `statement`s.
[DECISION][STYLE-043] Each `statement` MUST use one tag prefix: [FACT] | [ASSUMPTION] | [PROJECTION] | [DECISION] | [FORBIDDEN] | [UNKNOWN] | [STATE] | [RULE] | [BIND].
[DECISION][STYLE-044] Tag-to-role constraints:
[DECISION][STYLE-045] ROLE_TYPE: STATE → allowed tags: [STATE], [DECISION], [FORBIDDEN] (definitions may use [FACT] only in `## DEFINITIONS`).
[DECISION][STYLE-046] ROLE_TYPE: RULE → allowed tags: [RULE], [DECISION], [FORBIDDEN] (definitions may use [FACT] only in `## DEFINITIONS`).
[DECISION][STYLE-047] ROLE_TYPE: BIND → allowed tags: [BIND], [DECISION], [FORBIDDEN] (definitions may use [FACT] only in `## DEFINITIONS`).
[DECISION][STYLE-048] ROLE_TYPE: INTERFACE → allowed tags: [DECISION], [FORBIDDEN] (definitions may use [FACT] only in `## DEFINITIONS`).
[DECISION][STYLE-049] ROLE_TYPE: INDEX → allowed tags: [DECISION], [FORBIDDEN] (tables in CONTENT are allowed).
[DECISION][STYLE-050] Every `statement` MUST have a stable ID: `[TAG][<DOCPREFIX>-NNN<SFX>]`.
[DECISION][STYLE-051] `DOCPREFIX` MUST be declared in YAML as `prefix:` OR MUST be inferable as the unique common prefix of all `statement_id` in the document; otherwise lint MUST fail.
[RULE][STYLE-051A] PASS IFF YAML `prefix` is globally unique within `corpus_registry`; ELSE FAIL.
[DECISION][STYLE-052] New statement_id allocation MUST satisfy STYLE-052A.
[RULE][STYLE-052A] PASS IFF (NNN increments by 10) OR (dense allocation is used AND any later insertions use suffixes A–Z instead of renumbering); ELSE FAIL.
[DECISION][STYLE-053] IDs MUST be stable across edits; rewriting MUST preserve existing IDs verbatim.
[FORBIDDEN][STYLE-054] "Floating bullets" without `[TAG][ID]` in any normative section.
[DECISION][STYLE-055] Statement physical length MUST be ≤ 3 lines.
[DECISION][STYLE-055A] Any statement continuation lines MUST match `statement_continuation_line` and MUST appear only immediately after a statement line; total lines (statement + continuations) MUST be ≤ 3; ELSE FAIL.
[FORBIDDEN][STYLE-056] Multi-paragraph statements.
[DECISION][STYLE-056A] Enumerated list markers inside statement text MUST use dot form only: `N.`; ELSE FAIL.
[FORBIDDEN][STYLE-056B] Parenthesis enumeration marker `N)` is forbidden anywhere in statement text (normalization rule).
[DECISION][STYLE-056C] PASS IFF statement text does NOT contain regex `\b[0-9]+\)`; ELSE FAIL.
[DECISION][STYLE-057] Markdown emphasis (`**`, `_`) MUST NOT carry meaning; structure MUST be expressed by tags/ids/keys.
[FORBIDDEN][STYLE-058] Using bold/italic as structure or as a proxy for tags.
[DECISION][STYLE-059] Any new term used as a normative token MUST be defined in the same document under `## DEFINITIONS`; corpus-wide terms MUST be promoted only via the canonical vocabulary doc.
[DECISION][STYLE-059A] Normative statement lines MUST match regex: ^\[(FACT|ASSUMPTION|PROJECTION|DECISION|FORBIDDEN|UNKNOWN|STATE|RULE|BIND)\]\[[A-Z0-9_]+-[0-9]{3}[A-Z]?\]\s.+$.
[DECISION][STYLE-059B] In any normative section, any non-empty line MUST be of allowed_normative_line_type; ELSE FAIL.
[DECISION][STYLE-059C] `structural_heading_line` MUST match `^###\s.+$`; ELSE FAIL.
[DECISION][STYLE-059D] `statement_continuation_line` MUST match `^ {2}\S.*$`; ELSE FAIL.
[DECISION][STYLE-059E] `markdown_table_line` MUST match `^\|.*\|$` OR `^\|[ \-:|]+\|$`; ELSE FAIL.
[FORBIDDEN][STYLE-059F] Markdown tables in normative sections are FORBIDDEN unless ROLE_TYPE is INDEX OR (ROLE_TYPE is STATE AND table usage satisfies STYLE-068); ELSE FAIL.

### 5. Language and operators (no soft speech)

[FORBIDDEN][STYLE-060] Softeners: "usually", "as a rule", "generally", "rather", "maybe", "possibly" (unless locked by condition).
[DECISION][STYLE-061] Allowed operators: IF / THEN / ELSE; MUST / MUST NOT; ONLY IF; EXCEPT WHEN; REQUIRES; IMPLIES.
[DECISION][STYLE-062] Quantifiers MUST be explicit: range `x ∈ [a, b]`; approx `x ≈ y` (only if unavoidable; prefer range).
[DECISION][STYLE-063] Numeric values MUST include units when applicable.
[DECISION][STYLE-063A] Allowed modals are restricted to: MUST, MUST NOT, FORBIDDEN, REQUIRED, FAIL, PASS (case-sensitive).
[FORBIDDEN][STYLE-063B] Any modal verbs outside allowed modals in normative sections MUST cause lint FAIL.

### 5.1 Language Policy (corpus vs prose)

[DECISION][STYLE-064] Corpus-wide `prose_language` MUST be `ru-RU` and MUST match the language of any generated diegetic prose.
[DECISION][STYLE-065] Every corpus document MUST declare `doc_language` in YAML; allowed values are: `ru-RU` | `en-US`.
[DECISION][STYLE-066] Any document that can be directly consumed by a prose generator (class: `protocol` OR class: `scene` OR any doc that constrains prose output) MUST declare `prose_language: ru-RU` in YAML; mismatch is a hard lint error.

### 5.2 Proper Names and Scripts (no auto-transliteration)

[DECISION][STYLE-084] Every `proper_name` referenced as a token in TYPE C inputs or prose MUST have a canonical Russian form `canon_ru` declared explicitly in the corpus (no implicit derivation).
[DECISION][STYLE-085] In diegetic prose output, `proper_name` MUST be emitted using `display_ru` (fallback: `canon_ru`) only.
[DECISION][STYLE-086] If `doc_language` is `en-US`, any mention of a `proper_name` in normative text MUST preserve the Russian spelling by referencing it as `ru:"<canon_ru>"`; `en:"<canon_en>"` is permitted only if `canon_en` is explicitly declared; the Russian string MUST NOT be altered.
[DECISION][STYLE-087] Latin-script names are permitted in Russian prose ONLY IF they are explicitly intended as the displayed form (i.e., stored as `display_ru` for that entity); otherwise Latin-script is forbidden in prose for that entity.
[FORBIDDEN][STYLE-088] Auto-transliteration or back-transliteration between scripts (ru↔lat) for any `proper_name`.
[FORBIDDEN][STYLE-089] Introducing aliases for `proper_name` unless they are explicitly declared as aliases in the canonical vocabulary/registry that owns that namespace.

### 6. Role-specific CONTENT rules (normative)

[DECISION][STYLE-067] ROLE_TYPE: STATE — `## CONTENT` MUST contain only `[STATE]` statements (plus `[DECISION]` / `[FORBIDDEN]` for constraints on reading).
[DECISION][STYLE-068] ROLE_TYPE: STATE MUST NOT use normative tables EXCEPT WHEN the table schema is declared in OUTPUT CONTRACT AND the table is the sole representation of those records (registry-style); ELSE FAIL.
[FORBIDDEN][STYLE-069] STATE content: causal chains, resolution logic, "why" explanations.
[DECISION][STYLE-070] ROLE_TYPE: RULE — `## CONTENT` MUST contain only `[RULE]`, `[DECISION]`, `[FORBIDDEN]` (plus non-normative examples in `## NON-NORMATIVE` only).
[DECISION][STYLE-071] RULE statements MUST be decidable; use IF/THEN where applicable.
[DECISION][STYLE-071A] Decidable rule format MUST be `PASS IFF <predicate>; ELSE FAIL` OR `IF <predicate> THEN <obligation>; ELSE FAIL`.
[DECISION][STYLE-072] ROLE_TYPE: BIND — `## CONTENT` MUST contain only `[BIND]` statements that select among existing STATE values.
[DECISION][STYLE-073] BIND MUST reference a RULE justification by ID for each selection.
[DECISION][STYLE-074] ROLE_TYPE: INTERFACE — defines domain ownership/consumes/forbids; MUST NOT introduce metric values.
[DECISION][STYLE-075] ROLE_TYPE: INDEX — contains navigation tables/pointers only; MUST NOT redefine rules or state.
[DECISION][STYLE-075A] In ROLE_TYPE: INDEX, any table in CONTENT MUST be fully specified in OUTPUT CONTRACT (columns, types, primary key if applicable).

### 6.1 Record Streams (TYPE C inputs: scenes / timelines / event arrays)

[DECISION][STYLE-076] TYPE C inputs MUST be represented as `record_stream` and MUST NOT be interpreted as TYPE B world state.
[DECISION][STYLE-077] Any document that contains a `record_stream` MUST declare `record_format_id` in YAML; if the dataset spans multiple documents, those docs MUST also declare the same `dataset_id`.
[DECISION][STYLE-078] Any document that exports `record_stream` MUST define, in its `## OUTPUT CONTRACT`, a machine-readable parser contract including at least: `record_start_rule`, `required_fields`, `field_encoding`, `merge_policy`.
[FORBIDDEN][STYLE-079] Mixing multiple incompatible record encodings inside the same exported `record_stream` without explicit separate exports per encoding.

### 7. Causal chains (strict form)

[DECISION][STYLE-080] Causal chains are allowed ONLY in ROLE_TYPE: RULE (or in explicitly allowed CANON artifacts declared by RULE docs).
[DECISION][STYLE-081] Canonical tokens: `CAUSE → MECHANISM → CONSEQUENCE`.
[DECISION][STYLE-082] If causal text is present, each node MUST be a separate atomic statement with its own ID.
[FORBIDDEN][STYLE-083] Inline causal chains inside long paragraphs.

### 8. Ownership, domains, and naming

[DECISION][STYLE-090] Every metric MUST declare ownership in a ROLE_TYPE: STATE document (e.g., `metric.owner_domain = <DOMAIN>`), or via an INTERFACE ownership table referenced by that STATE.
[FORBIDDEN][STYLE-091] Two domains defining the same metric value unless explicitly marked DUAL-ALLOWED by a RULE doc.
[DECISION][STYLE-092] Ownership names MUST match the interface index (project-owned enum set).
[DECISION][STYLE-093] Metric IDs MUST be snake_case and stable.
[FORBIDDEN][STYLE-094] Reusing the same metric name for different meanings.
[DECISION][STYLE-094A] Reserved keywords for corpus semantics are: ARTIFACT, BUNDLE, CONTRACT, GATE, LOCK, REGISTRY, PACK.
[FORBIDDEN][STYLE-094B] Using synonyms for reserved keywords in normative sections (e.g., "package" instead of PACK, "checkpoint" instead of GATE).

### 9. Numbers, units, strings, UNKNOWN

[DECISION][STYLE-120] Numeric values MUST include units: `TW`, `EJ_per_year`, `C`, `m`, `%`, `years`, etc.
[DECISION][STYLE-121] Tokens/enums MUST be UPPER_SNAKE_CASE; parsing-relevant human strings MUST be quoted consistently using `"` (double quotes).
[DECISION][STYLE-122] Missing data MUST be represented as `UNKNOWN` or omitted; never elided with `...` or `…`.
[FORBIDDEN][STYLE-123] Ellipsis placeholders (`...` / `…`) in any normative section; in `class: scene` this is a hard lint error.
[DECISION][STYLE-124] If a `record_stream` uses JSON (e.g., JSON Lines), it MUST be declared via `record_format_id` and MUST have an explicit parser contract in OUTPUT CONTRACT; "implicit JSON" is forbidden.
[DECISION][STYLE-124A] Any reference to an undefined term/metric/token in normative sections MUST be treated as [UNKNOWN] and MUST trigger lint FAIL unless explicitly allowed by a RULE.

### 10. OUTPUT CONTRACT templates (normative; role-specific)

[DECISION][STYLE-110] Every document MUST include `## OUTPUT CONTRACT` and it MUST be machine-readable.
[DECISION][STYLE-111] OUTPUT CONTRACT MUST be expressed as YAML in a fenced block with language tag `yaml`.

~~~yaml
doc_id: <id>
role_type: <ROLE_TYPE>
export: <role-specific>
~~~

[DECISION][STYLE-112] STATE output contract schema:

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

[DECISION][STYLE-113] RULE output contract schema (two allowed forms):

~~~yaml
# Variant A — ordinary RULE
doc_id: <id>
role_type: RULE
export:
  - rule_id: <STATEMENT_ID>
    intent: <one-line>
    inputs: <list>
    outputs: <list>

# Variant B — lint-spec RULE
doc_id: <id>
role_type: RULE
export:
  lint_config: <machine-readable lint configuration>
~~~

[RULE][STYLE-113A] PASS IFF (a RULE doc defines lint_gates ⇒ it uses RULE export Variant B) AND (it does NOT define lint_gates ⇒ it uses Variant A); ELSE FAIL.

[DECISION][STYLE-114] BIND output contract schema:

~~~yaml
doc_id: <id>
role_type: BIND
export:
  - metric: <metric_id>
    selected_value: core|p90
    scope: baseline|canon
    justification: <rule_id>
~~~

[DECISION][STYLE-115] INTERFACE output contract schema:

~~~yaml
doc_id: <id>
role_type: INTERFACE
export:
  - owns: <list of domains|concepts>
  - consumes: <list of domains|documents>
  - forbids: <list of forbidden definitions>
~~~

[DECISION][STYLE-116] INDEX output contract schema:

~~~yaml
doc_id: <id>
role_type: INDEX
export:
  - rows: <list>
  - columns: <list>
~~~

[DECISION][STYLE-116A] Any spec that defines lint MUST export machine-readable lint configuration in OUTPUT CONTRACT as YAML (no prose).
[FORBIDDEN][STYLE-117] Omitting OUTPUT CONTRACT even if `export` is empty.
[FORBIDDEN][STYLE-118] Using freeform prose in OUTPUT CONTRACT instead of machine-readable schema.
[RULE][STYLE-118A] PASS IFF OUTPUT CONTRACT YAML conforms to one of the allowed schema variants for the declared ROLE_TYPE; ELSE FAIL.

### 11. Rewrite protocol (deterministic transformation)

[DECISION][STYLE-140] Rewrite MUST preserve meaning; only structure changes unless explicitly requested.
[DECISION][STYLE-141] Rewrite MUST preserve all existing `statement_id`s verbatim; new statements MUST allocate new IDs without renumbering old ones.
[DECISION][STYLE-142] Rewrite algorithm MUST be:
[DECISION][STYLE-143] 1. Parse YAML front-matter; validate required keys.
[DECISION][STYLE-144] 2. Infer ROLE_TYPE (or keep if valid); enforce tag constraints.
[DECISION][STYLE-145] 3. Build mandatory skeleton; move all content under correct sections.
[DECISION][STYLE-146] 4. Split prose/bullets into atomic statements; assign IDs; keep ≤ 3 lines per statement.
[DECISION][STYLE-147] 5. Move examples into `## NON-NORMATIVE` only.
[DECISION][STYLE-148] 6. Emit `## OUTPUT CONTRACT` matching role templates; if export is empty, still emit schema.
[DECISION][STYLE-149] 7. Emit `## FORBIDDEN` tailored to doc role and scope.
[DECISION][STYLE-150] 8. Run lint gates; fail if any gate fails.
[DECISION][STYLE-151] Rewrite MUST NOT translate, transliterate, or back-transliterate any `proper_name`; Russian spellings MUST be preserved verbatim.
[DECISION][STYLE-152] If `doc_language` is missing, rewrite MUST set it to `ru-RU` by default unless explicitly requested otherwise; prose constraints MUST keep `prose_language: ru-RU`.
[DECISION][STYLE-153] If the document contains TYPE C records, rewrite MUST preserve the declared `record_format_id` (or set it explicitly) and MUST NOT silently convert encodings (e.g., KV → JSON) without an explicit request.
[DECISION][STYLE-154] Any newly introduced corpus-wide term during rewrite MUST be added either to local `## DEFINITIONS` (local scope) or to the canonical vocabulary doc; silent "new term without definition" is forbidden.
[RULE][STYLE-155] Rewrite of a COMPLIANT document MUST produce byte-identical output; ELSE FAIL (idempotency rule).

### 12. Compliance checklist (mechanical gates)

[DECISION][STYLE-160] A document is COMPLIANT IFF all lint gates in this spec pass.
[DECISION][STYLE-161] Non-compliant docs MUST be treated as invalid inputs (do not consume for generation).

## USAGE / RESOLUTION

[DECISION][STYLE-200] This spec is normative for all corpus docs unless a doc contains an explicit exemption statement that references this spec and declares its scope.
[DECISION][STYLE-201] Exemptions MUST be minimal and MUST NOT weaken determinism (exemption itself must be decidable).
[DECISION][STYLE-202] Applicability/precedence between documents is governed by `SPEC-PRIORITY_RESOLUTION-2215-0001`; this spec defines structure and lint gates only.
[DECISION][STYLE-203] Consumers MUST treat only OUTPUT CONTRACT `export` as consumable semantics; any content outside OUTPUT CONTRACT is NON-COMPLIANT to consume.

## OUTPUT CONTRACT

~~~yaml
doc_id: SPEC-DOC_STYLE-2215-0001
role_type: RULE
export:
  lint_config:
    rule_id_prefix: STYLE
    dependency_semantics:
      inputs_meaning: "data-flow dependency; consumes OUTPUT CONTRACT export"
      depends_on_meaning: "semantic/normative dependency; does not consume export"
      references_meaning: "contextual reference; navigation/mention only; excluded from DAG"
      disjointness_rule_id: "STYLE-139D"
      dag_scope: "inputs ∪ depends_on"
    corpus_language_policy:
      doc_language_allowed: ["ru-RU","en-US"]
      prose_language_required: "ru-RU"
      proper_names:
        canon_ru_required: true
        prose_emit: "display_ru_then_canon_ru"
        forbid_auto_transliteration: true
    record_stream_rules:
      require_record_format_id: true
      require_dataset_id_for_series: true
      require_parser_contract_keys: ["record_start_rule","required_fields","field_encoding","merge_policy"]
    skeleton_h2_order:
      - "LLM-INTENT"
      - "DEFINITIONS"
      - "INVARIANTS"
      - "CONTENT"
      - "USAGE / RESOLUTION"
      - "OUTPUT CONTRACT"
      - "FORBIDDEN"
      - "NON-NORMATIVE"
    allowed_role_types: ["STATE","RULE","BIND","INTERFACE","INDEX"]
    allowed_tags: ["FACT","ASSUMPTION","PROJECTION","DECISION","FORBIDDEN","UNKNOWN","STATE","RULE","BIND"]
    statement_line_regex: '^\[(FACT|ASSUMPTION|PROJECTION|DECISION|FORBIDDEN|UNKNOWN|STATE|RULE|BIND)\]\[[A-Z0-9_]+-[0-9]{3}[A-Z]?\]\s.+$'
    forbid_enumeration_paren_regex:
      regex: '\b[0-9]+\)'
      applies_to: statement_text
    doc_id_reference_token_regex: '\b[A-Z0-9_]+(?:-[A-Z0-9_]+)+-[0-9]{4}\b'
    file_invariants:
      encoding: "utf-8"
      forbid_bom: true
      line_endings: "LF"
      forbid_trailing_whitespace: true
      require_single_final_newline: true
    structural_line_policy:
      h3_regex: '^###\s.+$'
      allowed_sections: ["CONTENT","NON-NORMATIVE"]
      forbid_h4_plus: true
      forbid_h3_numeric_paren_prefix: true
      require_h3_numeric_dot_prefix: false
    statement_continuation_regex: '^ {2}\S.*$'
    structural_heading_regex: '^###\s.+$'
    markdown_table_regex:
      - '^\|.*\|$'
      - '^\|[ \-:|]+\|$'
    allowed_modals: ["MUST","MUST NOT","FORBIDDEN","REQUIRED","FAIL","PASS"]
    forbidden_modals: ["SHOULD","MAY","CAN","USUALLY","TYPICALLY","GENERALLY","OFTEN"]
    forbidden_softeners: ["usually","as a rule","generally","rather","maybe","possibly"]
    lint_gates:
      - gate_id: STYLE-LINT-001
        intent: "no extra H2 sections"
      - gate_id: STYLE-LINT-002
        intent: "every normative line is a tagged statement with stable id OR allowed structural line"
      - gate_id: STYLE-LINT-003
        intent: "LLM-INTENT has required keys and <=20 lines"
      - gate_id: STYLE-LINT-004
        intent: "OUTPUT CONTRACT present and machine-readable"
      - gate_id: STYLE-LINT-005
        intent: "prefix declared or inferable"
      - gate_id: STYLE-LINT-006
        intent: "no yaml_delimiter_line in body"
      - gate_id: STYLE-LINT-007
        intent: "no ellipsis placeholders in normative sections"
      - gate_id: STYLE-LINT-008
        intent: "front_matter required keys present and normalized (inputs/depends_on/references lists)"
      - gate_id: STYLE-LINT-009
        intent: "doc_language present and allowed"
      - gate_id: STYLE-LINT-010
        intent: "prose_language required for prose-consumed docs and must equal ru-RU"
      - gate_id: STYLE-LINT-011
        intent: "record_stream docs declare record_format_id (+dataset_id for series) and have parser contract keys"
      - gate_id: STYLE-LINT-012
        intent: "headers match exactly (case-sensitive) and follow skeleton order"
      - gate_id: STYLE-LINT-013
        intent: "no forbidden modals/softeners in normative sections"
      - gate_id: STYLE-LINT-014
        intent: "no consumption of non-export content is allowed"
      - gate_id: STYLE-LINT-015
        intent: "H3 headings allowed only in CONTENT/NON-NORMATIVE; H4+ forbidden"
      - gate_id: STYLE-LINT-016
        intent: "forbid enumeration marker N) in any statement text; require N. if numbering is used"
      - gate_id: STYLE-LINT-017
        intent: "file encoding is UTF-8 without BOM"
      - gate_id: STYLE-LINT-018
        intent: "line endings are LF only"
      - gate_id: STYLE-LINT-019
        intent: "no trailing whitespace and exactly one final newline"
      - gate_id: STYLE-LINT-020
        intent: "all inputs/depends_on/references IDs exist in corpus_registry (IDX-CORPUS)"
      - gate_id: STYLE-LINT-021
        intent: "dependency graph is acyclic (DAG)"
      - gate_id: STYLE-LINT-022
        intent: "deprecated workflow: deprecated requires superseded_by; new deps must not reference deprecated docs"
      - gate_id: STYLE-LINT-024
        intent: "OUTPUT CONTRACT YAML conforms to role-specific schema template"
      - gate_id: STYLE-LINT-025
        intent: "references key present and normalized (list, sorted, no duplicates)"
      - gate_id: STYLE-LINT-026
        intent: "doc_id reference tokens in normative sections must be declared in inputs, depends_on, or references"
  rewrite_protocol:
    - "STYLE-140"
    - "STYLE-141"
    - "STYLE-142"
    - "STYLE-143"
    - "STYLE-144"
    - "STYLE-145"
    - "STYLE-146"
    - "STYLE-147"
    - "STYLE-148"
    - "STYLE-149"
    - "STYLE-150"
    - "STYLE-151"
    - "STYLE-152"
    - "STYLE-153"
    - "STYLE-154"
    - "STYLE-155"
~~~

## FORBIDDEN

[FORBIDDEN][STYLE-900] Treating NON-NORMATIVE content as a source of constraints or facts.
[FORBIDDEN][STYLE-901] Silent relaxation of any MUST/MUST NOT rule without an explicit exemption statement.
[FORBIDDEN][STYLE-902] Consuming content outside of declared OUTPUT CONTRACT of a document.
[FORBIDDEN][STYLE-903] Using unscoped numbers (numbers without units where units are applicable).
[FORBIDDEN][STYLE-904] Using `yaml_delimiter_line` in document body (segmentation hazard).
[FORBIDDEN][STYLE-905] Auto-transliteration/back-transliteration of any proper names or toponyms (ru↔lat) without explicit canon/alias declaration.
[FORBIDDEN][STYLE-906] Emitting diegetic prose in any language other than `prose_language: ru-RU`.
[FORBIDDEN][STYLE-907] Changing `record_format_id` or mixing record encodings inside a dataset without an explicit exemption statement.
[FORBIDDEN][STYLE-908] Using synonyms for reserved keywords (CONTRACT/GATE/LOCK/REGISTRY/PACK) in normative sections.

## NON-NORMATIVE

### Example: Minimal compliant doc (illustrative; delimiter lines replaced to avoid segmentation hazards in examples)

~~~text
YAML_FRONT_MATTER_BEGIN
id: EXAMPLE-0001
title: >
  Example Doc
class: canon
status: draft
prefix: EXA
doc_language: en-US
prose_language: ru-RU
inputs: []
depends_on: []
references: []
scope: >
  Example scope.
YAML_FRONT_MATTER_END

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: example rules
INPUTS: []
OUTPUTS: []
FORBIDDEN: []

## DEFINITIONS

[FACT][EXA-010] `foo` = bar.

## INVARIANTS

[DECISION][EXA-020] Foo MUST remain bar.

## CONTENT

[RULE][EXA-030] IF foo == bar THEN baz MUST be qux; ELSE FAIL.

## USAGE / RESOLUTION

[DECISION][EXA-040] Applies globally.

## OUTPUT CONTRACT

OUTPUT_CONTRACT_YAML_BEGIN
doc_id: EXAMPLE-0001
role_type: RULE
export: []
OUTPUT_CONTRACT_YAML_END

## FORBIDDEN

[FORBIDDEN][EXA-900] Inventing baz.

## NON-NORMATIVE

(empty)
~~~

~~~
</file>

<file path="spec/SPEC-METHODOLOGY-2215-0001.md">
~~~markdown
---
id: SPEC-METHODOLOGY-2215-0001
title: >
  Corpus Methodology — Minimal Set for Prose Generation (2215)
class: spec
status: draft
prefix: METH
doc_language: en-US
inputs: []
depends_on:
  - IDX-CORPUS-0001
  - SPEC-DOC_ID-2215-0001
  - SPEC-DOC_STYLE-2215-0001
  - SPEC-PRIORITY_RESOLUTION-2215-0001
references: []
scope: >
  Норматив методологии корпуса 2215. Определяет допустимые типы документов,
  их роли, границы ответственности и правила потребления LLM.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: define corpus artifact classes and deterministic consumption rules
INPUTS: [IDX-CORPUS-0001, SPEC-DOC_ID-2215-0001, SPEC-DOC_STYLE-2215-0001, SPEC-PRIORITY_RESOLUTION-2215-0001]
OUTPUTS: [artifact_classes, applicability_rules, consumption_contract]
FORBIDDEN: [override_mechanism, alternative_precedence_orders, consuming_non_export_content]

## DEFINITIONS

[FACT][METH-010] `corpus` = множество документов, перечисленных в IDX-CORPUS-0001.
[FACT][METH-020] `doc_class` = значение YAML `class:` документа.
[FACT][METH-030] `active_classes` = {ssot, baseline, canon, plan, scene, idx, protocol, spec, registry}.
[FACT][METH-040] `knowledge_classes` = {ssot, baseline, canon, plan, scene}.
[FACT][METH-050] `constraint_bearing_classes` = {ssot, baseline, canon}.
[FACT][METH-060] `export_surface` = OUTPUT CONTRACT.export.

## INVARIANTS

[DECISION][METH-100] Only `active_classes` are permitted in the corpus.
[DECISION][METH-110] Any document without OUTPUT CONTRACT is NON-COMPLIANT.
[DECISION][METH-120] LLM MUST consume documents ONLY via `export_surface`.
[DECISION][METH-130] `idx` is the sole membership authority for the corpus.
[DECISION][METH-140] Override mechanism is NOT supported in any form.
[DECISION][METH-150] LLM MUST NOT invent values; allowed outcomes are omission or UNKNOWN.

## CONTENT

### Document class semantics

[DECISION][METH-200] `ssot` defines declarative metric ranges and invariants.
[DECISION][METH-210] `baseline` defines default operational values and policies and MAY be constrained by canon.
[DECISION][METH-220] `canon` defines admissibility, legality, and hard world constraints.
[DECISION][METH-230] `plan` defines narrative directives and required beats and MUST NOT define numeric values.
[DECISION][METH-240] `scene` records runtime facts and violations as events and MUST NOT create admissibility.
[DECISION][METH-250] `protocol` defines interface contracts only.
[DECISION][METH-260] `spec` defines corpus rules and consumption semantics.
[DECISION][METH-270] `registry` defines lookup sets and enumerations and introduces no rules.

### Applicability

[DECISION][METH-300] Scene context MUST be compiled using applicability order from SPEC-PRIORITY_RESOLUTION-2215-0001.
[FORBIDDEN][METH-310] Scene or Plan MUST NOT weaken constraints from Canon, Baseline, or SSOT.
[FORBIDDEN][METH-320] Direct use of SSOT as scene defaults.

### Document consumption

[DECISION][METH-400] Documents with status `fixed` take precedence over `draft`.
[DECISION][METH-410] IF operator_draft_allowed=false THEN draft documents MUST be ignored.
[DECISION][METH-420] IF operator_draft_allowed=true THEN draft documents MUST satisfy full COMPLIANCE to be consumed.
[DECISION][METH-430] Deprecated documents MUST NOT be consumed.

### Stop policy

[DECISION][METH-500] Corpus is closed-world.
[DECISION][METH-510] On contradiction or insufficient data, LLM MUST stop and request source correction.

## USAGE / RESOLUTION

[DECISION][METH-600] In conflicts, SPEC-DOC-ID and SPEC-DOC-STYLE take precedence over this document.

## OUTPUT CONTRACT

~~~yaml
doc_id: SPEC-METHODOLOGY-2215-0001
role_type: RULE
export:
  - rule_id: METH-200
    intent: define ssot semantics as declarative metric ranges
    inputs: []
    outputs: [ssot_class_semantics]
  - rule_id: METH-210
    intent: define baseline semantics as default operational values
    inputs: []
    outputs: [baseline_class_semantics]
  - rule_id: METH-220
    intent: define canon semantics as admissibility constraints
    inputs: []
    outputs: [canon_class_semantics]
  - rule_id: METH-230
    intent: define plan semantics as narrative directives
    inputs: []
    outputs: [plan_class_semantics]
  - rule_id: METH-240
    intent: define scene semantics as runtime event records
    inputs: []
    outputs: [scene_class_semantics]
  - rule_id: METH-300
    intent: define applicability order dependency on SPEC-PRIORITY-RESOLUTION
    inputs: [SPEC-PRIORITY_RESOLUTION-2215-0001]
    outputs: [applicability_rule]
  - rule_id: METH-120
    intent: enforce export-only consumption
    inputs: []
    outputs: [consumption_contract]
  - rule_id: METH-140
    intent: forbid override mechanism
    inputs: []
    outputs: [override_prohibition]
~~~

## FORBIDDEN

[FORBIDDEN][METH-900] Introducing new doc_class outside `active_classes`.
[FORBIDDEN][METH-910] Any form of override or precedence bypass.
[FORBIDDEN][METH-920] Using protocol as world knowledge.

## NON-NORMATIVE

(Empty by design)

~~~
</file>

<file path="spec/SPEC-PRIORITY_RESOLUTION-2215-0001.md">
~~~markdown
---
id: SPEC-PRIORITY_RESOLUTION-2215-0001
title: >
  Resolution Order & Precedence Rules — 2215
class: spec
status: fixed
prefix: RES
doc_language: en-US
inputs: []
depends_on: []
references: []
scope: >
  Канонический порядок применимости документов корпуса 2215 и правила
  непробиваемости ограничений между уровнями.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: define global document-class applicability order and non-penetration rules
INPUTS: []
OUTPUTS: [resolution_order, non_penetration_rules]
FORBIDDEN: [implicit_precedence, heuristic_resolution, narrative_reasoning, override_mechanism]

## DEFINITIONS

[FACT][RES-010] `resolution_order` = линейный порядок применимости классов документов при компиляции контекста.
[FACT][RES-020] `higher_layer` = документ, стоящий выше в `resolution_order`.
[FACT][RES-030] `lower_layer` = документ, стоящий ниже в `resolution_order`.

## INVARIANTS

[DECISION][RES-100] Applicability order MUST be globally unique for the corpus.
[DECISION][RES-110] No document may introduce an alternative applicability order.

## CONTENT

### Resolution order

[DECISION][RES-200] Global document-class applicability order MUST be:
[DECISION][RES-201] Order = Scene → Plan → Canon → Baseline → SSOT.

[DECISION][RES-210] Applicability order defines read/merge precedence only.
[DECISION][RES-211] Applicability order MUST NOT be interpreted as semantic authority order.

### Non-penetration (constraints)

[DECISION][RES-300] Constraint-bearing layers are: Canon, Baseline, SSOT.
[DECISION][RES-310] Scene and Plan are NOT constraint-bearing layers.

[FORBIDDEN][RES-320] Any lower_layer constraint-bearing document MUST NOT weaken or override constraints from a higher_layer constraint-bearing document.
[FORBIDDEN][RES-330] Scene or Plan MUST NOT introduce admissibility, legality, or world-constraint expansions.

[DECISION][RES-340] Violations of constraints are representable ONLY as Scene facts with consequences and MUST NOT modify admissibility.

## USAGE / RESOLUTION

[DECISION][RES-400] In any conflict, this SPEC is the sole source of document-class applicability order.
[DECISION][RES-410] Consumers MUST apply this order before evaluating ROLE_TYPE semantics.

## OUTPUT CONTRACT

~~~yaml
doc_id: SPEC-PRIORITY_RESOLUTION-2215-0001
role_type: RULE
export:
  - rule_id: RES-200
    intent: define global document-class applicability order
    inputs: []
    outputs: [resolution_order]
  - rule_id: RES-300
    intent: define constraint-bearing layer membership
    inputs: []
    outputs: [constraint_bearing_layers]
  - rule_id: RES-320
    intent: forbid lower_layer weakening of higher_layer constraints
    inputs: []
    outputs: [non_penetration_rule]
  - rule_id: RES-330
    intent: forbid Scene/Plan from introducing admissibility expansions
    inputs: []
    outputs: [scene_plan_limitation]
config:
  resolution_order:
    - Scene
    - Plan
    - Canon
    - Baseline
    - SSOT
  constraint_bearing_layers:
    - Canon
    - Baseline
    - SSOT
~~~

## FORBIDDEN

[FORBIDDEN][RES-900] Introducing Override or any equivalent precedence-bypass mechanism.
[FORBIDDEN][RES-910] Inferring precedence from document class outside this SPEC.
[FORBIDDEN][RES-920] Narrative or heuristic conflict resolution.

## NON-NORMATIVE

(Empty by design)

~~~
</file>

<file path="ssot/SSOT-AUTOMATION-A-2215-0004.md">
~~~markdown
---
id: SSOT-AUTOMATION-A-2215-0004
title: >
  AI, Automation, and Robotics — Scenario A (2215, SSOT State)
class: ssot
status: draft
prefix: AUT
doc_language: en-US
inputs: []
depends_on:
  - SPEC-DOC_STYLE-2215-0001
  - SSOT-SCENARIO-A-2215-0001
references: []
scope: >
  SSOT state of AI, automation, and robotics for the world in 2215 (Scenario A).
  Contains only declarative metrics (core/p90/range) and qualitative states.
  Does not contain causality, conflict resolution rules, or governance models.
---

## LLM-INTENT

ROLE_TYPE: STATE
SCOPE: declarative AI/automation/robotics state for Scenario A around year 2215
INPUTS: []
OUTPUTS: [automation_metric_state]
FORBIDDEN: [causal_logic, resolution_rules, governance_models, narrative_explanations]

## DEFINITIONS

[FACT][AUT-010] `automation` = AI systems + robotics + autonomous execution loops used across economy and infrastructure.

## INVARIANTS

[DECISION][AUT-020] This document is applicable ONLY to Scenario A.
[DECISION][AUT-030] AI is treated as infrastructure (utility contour), not a unified subject.
[DECISION][AUT-040] AI-tyranny scenarios are excluded unless explicitly enabled by an exemption document.

## CONTENT

### 1. Automation Level

[STATE][AUT-100] labor_automation_percent_tasks.core = 80.
[STATE][AUT-110] labor_automation_percent_tasks.p90 = 90.
[STATE][AUT-120] labor_automation_percent_tasks.range = null.
[STATE][AUT-130] labor_automation_percent_tasks.unit = percent.
[STATE][AUT-140] labor_automation_percent_tasks.owner_domain = AUTOMATION.
[STATE][AUT-150] automation_execution_mode = "systemic_global".
[STATE][AUT-160] automation_execution_mode.owner_domain = AUTOMATION.

### 2. Compute and Energy Use

[STATE][AUT-170] ai_compute_EJ_per_year.core = 75.
[STATE][AUT-180] ai_compute_EJ_per_year.p90 = 200.
[STATE][AUT-190] ai_compute_EJ_per_year.range = null.
[STATE][AUT-200] ai_compute_EJ_per_year.unit = EJ_per_year.
[STATE][AUT-210] ai_compute_EJ_per_year.owner_domain = AUTOMATION.
[STATE][AUT-220] ai_energy_share_percent.core = null.
[STATE][AUT-230] ai_energy_share_percent.p90 = 20.
[STATE][AUT-240] ai_energy_share_percent.range = null.
[STATE][AUT-250] ai_energy_share_percent.unit = percent.
[STATE][AUT-260] ai_energy_share_percent.owner_domain = AUTOMATION.

### 3. Robotics Density and Presence

[STATE][AUT-270] robots_per_human.core = null.
[STATE][AUT-280] robots_per_human.p90 = 1.0.
[STATE][AUT-290] robots_per_human.range = null.
[STATE][AUT-300] robots_per_human.unit = ratio.
[STATE][AUT-310] robots_per_human.owner_domain = AUTOMATION.
[STATE][AUT-320] robotics_presence_mode = "ubiquitous_infrastructure".
[STATE][AUT-330] robotics_presence_mode.owner_domain = AUTOMATION.

### 4. Domains of Application

[STATE][AUT-340] transport_automation_level = "near_total".
[STATE][AUT-350] transport_automation_level.owner_domain = AUTOMATION.
[STATE][AUT-360] manufacturing_automation_level = "lights_out".
[STATE][AUT-370] manufacturing_automation_level.owner_domain = AUTOMATION.
[STATE][AUT-380] medical_ai_routine_use = true.
[STATE][AUT-390] medical_ai_routine_use.owner_domain = LIFE.
[STATE][AUT-400] education_ai_routine_use = true.
[STATE][AUT-410] education_ai_routine_use.owner_domain = GOVERNANCE.
[STATE][AUT-420] urban_systems_ai_coordination = "continuous".
[STATE][AUT-430] urban_systems_ai_coordination.owner_domain = URBANISM.

### 5. Human Participation

[STATE][AUT-440] human_execution_role = "minority_niche".
[STATE][AUT-450] human_execution_role.owner_domain = SOCIETY.
[STATE][AUT-460] human_legitimation_role = "required".
[STATE][AUT-470] human_legitimation_role.owner_domain = GOVERNANCE.

## USAGE / RESOLUTION

[DECISION][AUT-800] This document defines allowed numeric ranges and qualitative states for downstream documents.
[FORBIDDEN][AUT-810] Using this SSOT document for causal explanations of social or political conflict.
[FORBIDDEN][AUT-820] Using this SSOT document for modeling failures or accidents.
[FORBIDDEN][AUT-830] Using this SSOT document for selecting scene modes or outcomes.

## OUTPUT CONTRACT

~~~yaml
doc_id: SSOT-AUTOMATION-A-2215-0004
role_type: STATE
export:
  - metric: labor_automation_percent_tasks
    owner_domain: AUTOMATION
    values:
      core: 80
      p90: 90
      range: none
    unit: percent
  - metric: ai_compute_EJ_per_year
    owner_domain: AUTOMATION
    values:
      core: 75
      p90: 200
      range: none
    unit: EJ_per_year
  - metric: ai_energy_share_percent
    owner_domain: AUTOMATION
    values:
      core: none
      p90: 20
      range: none
    unit: percent
  - metric: robots_per_human
    owner_domain: AUTOMATION
    values:
      core: none
      p90: 1.0
      range: none
    unit: ratio
  - metric: automation_execution_mode
    owner_domain: AUTOMATION
    values:
      core: systemic_global
      p90: none
      range: none
    unit: none
  - metric: robotics_presence_mode
    owner_domain: AUTOMATION
    values:
      core: ubiquitous_infrastructure
      p90: none
      range: none
    unit: none
  - metric: transport_automation_level
    owner_domain: AUTOMATION
    values:
      core: near_total
      p90: none
      range: none
    unit: none
  - metric: manufacturing_automation_level
    owner_domain: AUTOMATION
    values:
      core: lights_out
      p90: none
      range: none
    unit: none
  - metric: medical_ai_routine_use
    owner_domain: LIFE
    values:
      core: true
      p90: none
      range: none
    unit: none
  - metric: education_ai_routine_use
    owner_domain: GOVERNANCE
    values:
      core: true
      p90: none
      range: none
    unit: none
  - metric: urban_systems_ai_coordination
    owner_domain: URBANISM
    values:
      core: continuous
      p90: none
      range: none
    unit: none
  - metric: human_execution_role
    owner_domain: SOCIETY
    values:
      core: minority_niche
      p90: none
      range: none
    unit: none
  - metric: human_legitimation_role
    owner_domain: GOVERNANCE
    values:
      core: required
      p90: none
      range: none
    unit: none
~~~

## FORBIDDEN

[FORBIDDEN][AUT-900] Introducing new automation metrics outside SSOT.
[FORBIDDEN][AUT-910] Embedding causal chains, resolution rules, or governance logic.
[FORBIDDEN][AUT-920] Treating qualitative states as narrative drivers.

## NON-NORMATIVE

~~~text
Empty by design.
~~~
~~~
</file>

<file path="ssot/SSOT-CLIMATE-A-2215-0004.md">
~~~markdown
---
id: SSOT-CLIMATE-A-2215-0004
title: >
  Climate State and Impacts — Scenario A (2215, SSOT State)
class: ssot
status: draft
prefix: CLM
doc_language: en-US
inputs: []
depends_on:
  - SPEC-DOC_STYLE-2215-0001
  - SSOT-ENERGY-A-2215-0004
  - SSOT-SCENARIO-A-2215-0001
references: []
scope: >
  SSOT state of the global climate background in 2215 (Scenario A): warming,
  sea level, emissions balance, extremes regime, and adaptation contours.
  Contains only declarative numeric metrics (core/p90/range) and categorical states.
  Does not contain causality, resolution rules, or response procedures.
---

## LLM-INTENT

ROLE_TYPE: STATE
SCOPE: declarative climate state for Scenario A around year 2215
INPUTS: []
OUTPUTS: [climate_state]
FORBIDDEN: [causal_logic, resolution_rules, procedural_response, narrative_explanations]

## DEFINITIONS

[FACT][CLM-010] `climate_state` = global and region-typical climate parameters and operational impacts as infrastructure background.

## INVARIANTS

[DECISION][CLM-020] This document is applicable ONLY to Scenario A.
[DECISION][CLM-030] Climate is stabilized at a new level; default mode is not "collapse".
[DECISION][CLM-040] Full return to preindustrial climate is not assumed.
[DECISION][CLM-050] Net CO2 balance is maintained near zero (net ≈ 0).

## CONTENT

### 1. Global Warming and Sea Level

[STATE][CLM-100] warming_C_vs_preindustrial.core = 2.5.
[STATE][CLM-110] warming_C_vs_preindustrial.p90 = none.
[STATE][CLM-120] warming_C_vs_preindustrial.range = [2.0, 2.5].
[STATE][CLM-130] warming_C_vs_preindustrial.unit = C.
[STATE][CLM-140] warming_C_vs_preindustrial.owner_domain = CLIMATE.
[STATE][CLM-150] sea_level_m.core = 1.7.
[STATE][CLM-160] sea_level_m.p90 = none.
[STATE][CLM-170] sea_level_m.range = [1.5, 2.0].
[STATE][CLM-180] sea_level_m.unit = m.
[STATE][CLM-190] sea_level_m.owner_domain = CLIMATE.
[STATE][CLM-200] warming_trend_post_2215 = "stable_no_accelerating_increase".
[STATE][CLM-210] warming_trend_post_2215.owner_domain = CLIMATE.

### 2. Emissions Balance

[STATE][CLM-220] net_co2_emissions_mode = "near_zero".
[STATE][CLM-230] net_co2_emissions_mode.owner_domain = CLIMATE.
[STATE][CLM-240] residual_emissions_primary_sources = ["land_use", "hard_to_abate_processes"].
[STATE][CLM-250] residual_emissions_primary_sources.owner_domain = CLIMATE.
[STATE][CLM-260] emissions_sink_balance_state = "near_zero_equilibrium".
[STATE][CLM-270] emissions_sink_balance_state.owner_domain = CLIMATE.

### 3. Extremes and Risk Profile

[STATE][CLM-280] extreme_weather_frequency_vs_20c = "higher".
[STATE][CLM-290] extreme_weather_frequency_vs_20c.owner_domain = CLIMATE.
[STATE][CLM-300] climate_risk_distribution = "geographically_redistributed".
[STATE][CLM-310] climate_risk_distribution.owner_domain = CLIMATE.
[STATE][CLM-320] typical_extreme_types = ["heat_waves", "intense_precipitation", "storm_systems", "drought_periods", "compound_multi_risks"].
[STATE][CLM-330] typical_extreme_types.owner_domain = CLIMATE.
[STATE][CLM-340] extremes_handling_mode = "managed_risk_profile".
[STATE][CLM-350] extremes_handling_mode.owner_domain = GOVERNANCE.

### 4. Adaptation Layer

[STATE][CLM-360] adaptation_infrastructure_programs_present = true.
[STATE][CLM-370] adaptation_infrastructure_programs_present.owner_domain = GOVERNANCE.
[STATE][CLM-380] adaptation_core_program_types = ["coastal_defense", "water_systems", "agro_adaptation"].
[STATE][CLM-390] adaptation_core_program_types.owner_domain = CLIMATE.
[STATE][CLM-400] managed_relocation_programs_present = true.
[STATE][CLM-410] managed_relocation_programs_present.owner_domain = GOVERNANCE.
[STATE][CLM-420] climate_shocks_system_effect_mode = "adaptation_stimulus_not_collapse".
[STATE][CLM-430] climate_shocks_system_effect_mode.owner_domain = CLIMATE.

### 5. Water, Coasts, Food

[STATE][CLM-440] water_systems_role_in_adaptation = "key_contour".
[STATE][CLM-450] water_systems_role_in_adaptation.owner_domain = CLIMATE.
[STATE][CLM-460] water_scarcity_mode = "regional_infrastructure_managed".
[STATE][CLM-470] water_scarcity_mode.owner_domain = CLIMATE.
[STATE][CLM-480] coastal_protection_programs_obligatory = true.
[STATE][CLM-490] coastal_protection_programs_obligatory.owner_domain = GOVERNANCE.
[STATE][CLM-500] managed_retreat_is_normal_policy_in_some_zones = true.
[STATE][CLM-510] managed_retreat_is_normal_policy_in_some_zones.owner_domain = GOVERNANCE.
[STATE][CLM-520] food_system_stability_mode = "stable_with_local_shocks".
[STATE][CLM-530] food_system_stability_mode.owner_domain = CLIMATE.

## USAGE / RESOLUTION

[DECISION][CLM-800] This document provides declarative climate and adaptation parameters for downstream documents.
[FORBIDDEN][CLM-810] Using this SSOT document for emergency response protocols.
[FORBIDDEN][CLM-820] Using this SSOT document for causal chains.
[FORBIDDEN][CLM-830] Using this SSOT document for default collapse-plot generation without an exemption document.

## OUTPUT CONTRACT

~~~yaml
doc_id: SSOT-CLIMATE-A-2215-0004
role_type: STATE
export:
  - metric: warming_C_vs_preindustrial
    owner_domain: CLIMATE
    values:
      core: 2.5
      p90: none
      range: [2.0, 2.5]
    unit: C
  - metric: sea_level_m
    owner_domain: CLIMATE
    values:
      core: 1.7
      p90: none
      range: [1.5, 2.0]
    unit: m
  - metric: warming_trend_post_2215
    owner_domain: CLIMATE
    values:
      core: stable_no_accelerating_increase
      p90: none
      range: none
    unit: none
  - metric: net_co2_emissions_mode
    owner_domain: CLIMATE
    values:
      core: near_zero
      p90: none
      range: none
    unit: none
  - metric: emissions_sink_balance_state
    owner_domain: CLIMATE
    values:
      core: near_zero_equilibrium
      p90: none
      range: none
    unit: none
  - metric: extreme_weather_frequency_vs_20c
    owner_domain: CLIMATE
    values:
      core: higher
      p90: none
      range: none
    unit: none
  - metric: climate_risk_distribution
    owner_domain: CLIMATE
    values:
      core: geographically_redistributed
      p90: none
      range: none
    unit: none
  - metric: typical_extreme_types
    owner_domain: CLIMATE
    values:
      core: [heat_waves, intense_precipitation, storm_systems, drought_periods, compound_multi_risks]
      p90: none
      range: none
    unit: none
  - metric: extremes_handling_mode
    owner_domain: GOVERNANCE
    values:
      core: managed_risk_profile
      p90: none
      range: none
    unit: none
  - metric: adaptation_infrastructure_programs_present
    owner_domain: GOVERNANCE
    values:
      core: true
      p90: none
      range: none
    unit: none
  - metric: managed_relocation_programs_present
    owner_domain: GOVERNANCE
    values:
      core: true
      p90: none
      range: none
    unit: none
  - metric: water_scarcity_mode
    owner_domain: CLIMATE
    values:
      core: regional_infrastructure_managed
      p90: none
      range: none
    unit: none
  - metric: food_system_stability_mode
    owner_domain: CLIMATE
    values:
      core: stable_with_local_shocks
      p90: none
      range: none
    unit: none
~~~

## FORBIDDEN

[FORBIDDEN][CLM-900] Introducing new world metrics or numeric claims outside SSOT.
[FORBIDDEN][CLM-910] Embedding causal chains, loops, resolution rules, or procedural response logic.
[FORBIDDEN][CLM-920] Treating climate state as narrative directive.

## NON-NORMATIVE

~~~text
Empty by design.
~~~
~~~
</file>

<file path="ssot/SSOT-CONSISTENCY-A-2215-0009.md">
~~~markdown
---
id: SSOT-CONSISTENCY-A-2215-0009
title: >
  Consistency Ruleset — Scenario A (2215)
class: ssot
status: draft
prefix: CON
doc_language: en-US
inputs: []
depends_on:
  - SPEC-DOC_STYLE-2215-0001
  - SSOT-AUTOMATION-A-2215-0004
  - SSOT-CLIMATE-A-2215-0004
  - SSOT-DEMOGRAPHY-A-2215-0002
  - SSOT-ECONOMY-A-2215-0003
  - SSOT-ENERGY-A-2215-0004
  - SSOT-GOVERNANCE-SECURITY-A-2215-0005
  - SSOT-SCENARIO-A-2215-0001
  - SSOT-URBANISM-A-2215-0007
references: []
scope: >
  SSOT RULE document for corpus consistency in 2215 (Scenario A).
  Defines metric statuses (CANON, DUAL_ALLOWED, CONFLICT, UNKNOWN),
  interpretation rules, and downstream document obligations.
  Does not introduce new metrics or select values.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: consistency validation and interpretation rules for SSOT corpus (Scenario A)
INPUTS: []
OUTPUTS: [metric_status, allowed_values, downstream_constraints]
FORBIDDEN: [introduce_world_facts, select_values, narrative_reasoning]

## DEFINITIONS

[FACT][CON-010] `metric_status` ∈ {CANON, DUAL_ALLOWED, CONFLICT, UNKNOWN}.
[FACT][CON-020] CANON = exactly one allowed value/range for downstream default usage.
[FACT][CON-030] DUAL_ALLOWED = core allowed as default; upper-tail (p90) allowed ONLY as explicitly localized upper-tail case (exemption).
[FACT][CON-040] CONFLICT = incompatible SSOT STATE declarations without an explicit resolving rule.
[FACT][CON-050] UNKNOWN = referenced downstream but not declared in any SSOT STATE document.
[FACT][CON-060] `downstream_docs` = {baseline, canon, plan, scene}.
[FACT][CON-070] `narrative_lock` = rule-level constraint that forces downstream to treat a metric as CANON even if SSOT declares core+p90.

## INVARIANTS

[DECISION][CON-080] This document MUST NOT introduce new metrics or values.
[DECISION][CON-090] This document interprets SSOT STATE but MUST NOT replace it.
[DECISION][CON-100] Any metric used downstream MUST have a defined status.

## CONTENT

### 1. Metric Status Derivation Rules

[RULE][CON-200] IF a metric has exactly one declared value or range across all SSOT STATE docs THEN status MUST be CANON; ELSE FAIL.
[RULE][CON-210] IF a metric has declared `core` and `p90` values AND no rule forbids coexistence THEN status MUST be DUAL_ALLOWED; ELSE FAIL.
[RULE][CON-220] IF two or more SSOT STATE docs declare incompatible values AND no DUAL_ALLOWED rule exists THEN status MUST be CONFLICT; ELSE FAIL.
[RULE][CON-230] IF a metric is referenced downstream but not declared in any SSOT STATE THEN status MUST be UNKNOWN; ELSE FAIL.

### 2. Downstream Usage Rules by Status

[RULE][CON-240] IF metric status = CANON THEN downstream MUST use the canonical value/range only; ELSE FAIL.
[RULE][CON-250] IF metric status = DUAL_ALLOWED THEN downstream MUST use `core` as default background; ELSE FAIL.
[RULE][CON-260] IF metric status = DUAL_ALLOWED THEN upper-tail (`p90`) usage MUST be exemption_only AND MUST satisfy localization
  and procedural cost rules; ELSE FAIL.
[RULE][CON-270] IF metric status = CONFLICT THEN any downstream usage MUST be FORBIDDEN until resolved by class: canon; ELSE FAIL.
[RULE][CON-280] IF metric status = UNKNOWN THEN any downstream usage MUST be FORBIDDEN; ELSE FAIL.

### 3. Narrative Lock Rules

[RULE][CON-300] IF a RULE or CANON document marks a metric as narrative_lock = true THEN that marking MUST be applied; ELSE FAIL.
[RULE][CON-310] IF metric has narrative_lock = true THEN downstream MUST treat it as CANON (default background),
  even if SSOT status is DUAL_ALLOWED; ELSE FAIL.
[RULE][CON-320] IF narrative_lock = true THEN upper-tail values MUST be used ONLY via explicit exemption with localization and cost; ELSE FAIL.

### 4. Location-Specific Constraints

[RULE][CON-400] IF location = RU-16/CHELNY AND metric = primary_energy_TW THEN upper-tail (p90) values MUST be FORBIDDEN
  as default background; ELSE FAIL.

### 5. Closure Rules

[RULE][CON-500] IF metric status = DUAL_ALLOWED OR metric status = UNKNOWN THEN closure MUST be performed ONLY by a class: canon document; ELSE FAIL.
[RULE][CON-510] IF closure is performed THEN metric status MUST be updated to CANON (or MUST remain FORBIDDEN if removed); ELSE FAIL.

## USAGE / RESOLUTION

[DECISION][CON-800] Consistency rules MUST be applied before any baseline/canon generation that references SSOT metrics.
[DECISION][CON-810] Any violation of consistency rules MUST be treated as a generation error, not as a creative choice.

## OUTPUT CONTRACT

~~~yaml
doc_id: SSOT-CONSISTENCY-A-2215-0009
role_type: RULE
export:
  - rule_id: CON-200
    intent: "derive CANON status for single-value metrics"
    inputs: [metric_declarations]
    outputs: [metric_status]
  - rule_id: CON-210
    intent: "derive DUAL_ALLOWED status for core+p90 metrics"
    inputs: [metric_declarations]
    outputs: [metric_status]
  - rule_id: CON-240
    intent: "enforce canonical-only usage for CANON metrics"
    inputs: [metric_status]
    outputs: [downstream_constraint]
  - rule_id: CON-260
    intent: "restrict p90 usage to exemption-only for DUAL_ALLOWED"
    inputs: [metric_status]
    outputs: [downstream_constraint]
  - rule_id: CON-300
    intent: "apply narrative_lock from RULE/CANON documents"
    inputs: [metric, narrative_lock]
    outputs: [downstream_constraint]
  - rule_id: CON-500
    intent: "restrict closure authority to class: canon"
    inputs: [metric_status]
    outputs: [closure_constraint]
~~~

## FORBIDDEN

[FORBIDDEN][CON-900] Selecting values for narrative use.
[FORBIDDEN][CON-910] Repeating SSOT STATE data (numbers/ranges) inside this document.
[FORBIDDEN][CON-920] Implicit resolution without class: canon.

## NON-NORMATIVE

~~~text
Empty by design.
~~~
~~~
</file>

<file path="ssot/SSOT-DEMOGRAPHY-A-2215-0002.md">
~~~markdown
---
id: SSOT-DEMOGRAPHY-A-2215-0002
title: >
  Demography — Scenario A (2215, SSOT State)
class: ssot
status: draft
prefix: DEM
doc_language: en-US
inputs:
  - SSOT-ECONOMY-A-2215-0003
  - SSOT-LIFE-A-2215-0007
  - SSOT-SCENARIO-A-2215-0001
depends_on:
  - SPEC-DOC_STYLE-2215-0001
references: []
scope: >
  SSOT state of global demography in 2215 (Scenario A).
  Contains only declarative numeric and qualitative demographic parameters.
  Does not introduce causality or scenario modes.
---

## LLM-INTENT

ROLE_TYPE: STATE
SCOPE: global demographic state for Scenario A around year 2215
INPUTS:
  - SSOT-ECONOMY-A-2215-0003
  - SSOT-LIFE-A-2215-0007
  - SSOT-SCENARIO-A-2215-0001
OUTPUTS: [demography_metric_state]
FORBIDDEN: [causal_logic, resolution_rules, narrative_explanations]

## DEFINITIONS

[FACT][DEM-010] `demography` = population size, age structure, spatial distribution, and mobility equilibrium.

## INVARIANTS

[DECISION][DEM-020] This document is applicable ONLY to Scenario A.
[DECISION][DEM-030] Demography is treated as a slowly changing systemic contour.
[DECISION][DEM-040] No extreme demographic collapse is assumed by default.

## CONTENT

### 1. Total Population

[STATE][DEM-100] population_billion.core = 8.8.
[STATE][DEM-110] population_billion.p90 = none.
[STATE][DEM-120] population_billion.range = [8.5, 9.0].
[STATE][DEM-130] population_billion.unit = billion.
[STATE][DEM-140] population_billion.owner_domain = DEMOGRAPHY.
[STATE][DEM-150] population_growth_mode = "post_peak_stable".
[STATE][DEM-160] population_growth_mode.owner_domain = DEMOGRAPHY.

### 2. Age Structure and Longevity

[STATE][DEM-170] life_expectancy_years.core = 100.
[STATE][DEM-180] life_expectancy_years.p90 = none.
[STATE][DEM-190] life_expectancy_years.range = [95, 110].
[STATE][DEM-200] life_expectancy_years.unit = years.
[STATE][DEM-210] life_expectancy_years.owner_domain = LIFE.
[STATE][DEM-220] population_age_structure = "older_but_active".
[STATE][DEM-230] population_age_structure.owner_domain = DEMOGRAPHY.
[STATE][DEM-240] retirement_age_concept = "blurred".
[STATE][DEM-250] retirement_age_concept.owner_domain = GOVERNANCE.

### 3. Fertility and Reproduction

[STATE][DEM-260] total_fertility_rate.core = none.
[STATE][DEM-270] total_fertility_rate.p90 = none.
[STATE][DEM-280] total_fertility_rate.range = [1.5, 1.8].
[STATE][DEM-290] total_fertility_rate.unit = births_per_woman.
[STATE][DEM-300] total_fertility_rate.owner_domain = DEMOGRAPHY.
[STATE][DEM-310] fertility_control_mode = "cultural_political".
[STATE][DEM-320] fertility_control_mode.owner_domain = GOVERNANCE.
[STATE][DEM-330] assisted_reproduction_prevalence = "common_not_dominant".
[STATE][DEM-340] assisted_reproduction_prevalence.owner_domain = LIFE.

### 4. Urbanization

[STATE][DEM-350] urban_population_share_percent.source = "SSOT-URBANISM-A-2215-0007".
[STATE][DEM-360] urban_population_share_percent.owner_domain = URBANISM.
[DECISION][DEM-370] Demography MUST NOT declare, duplicate, or export URBANISM-owned metrics.

### 5. Regional Distribution

[STATE][DEM-380] regional_population_concentration = "africa_south_asia_high_share".
[STATE][DEM-390] regional_population_concentration.owner_domain = DEMOGRAPHY.
[STATE][DEM-400] interregional_demographic_divergence = "reduced".
[STATE][DEM-410] interregional_demographic_divergence.owner_domain = DEMOGRAPHY.

### 6. Migration and Mobility

[STATE][DEM-420] migration_primary_drivers = ["climate", "economy", "security"].
[STATE][DEM-430] migration_primary_drivers.owner_domain = DEMOGRAPHY.
[STATE][DEM-440] migration_regulation_mode = "institutionalized".
[STATE][DEM-450] migration_regulation_mode.owner_domain = GOVERNANCE.
[STATE][DEM-460] open_borders_exist = false.
[STATE][DEM-470] open_borders_exist.owner_domain = GOVERNANCE.
[STATE][DEM-480] uncontrolled_mass_migration = false.
[STATE][DEM-490] uncontrolled_mass_migration.owner_domain = GOVERNANCE.

## USAGE / RESOLUTION

[DECISION][DEM-800] This document provides declarative numeric ranges and qualitative demographic states for downstream documents.
[FORBIDDEN][DEM-810] Using this SSOT document for causal explanations of demographic change.
[FORBIDDEN][DEM-820] Using this SSOT document for crisis modeling.
[FORBIDDEN][DEM-830] Using this SSOT document for selecting narrative or scene modes.

## OUTPUT CONTRACT

~~~yaml
doc_id: SSOT-DEMOGRAPHY-A-2215-0002
role_type: STATE
export:
  - metric: population_billion
    owner_domain: DEMOGRAPHY
    values:
      core: 8.8
      p90: none
      range: [8.5, 9.0]
    unit: billion
  - metric: population_growth_mode
    owner_domain: DEMOGRAPHY
    values:
      core: post_peak_stable
      p90: none
      range: none
    unit: none
  - metric: life_expectancy_years
    owner_domain: LIFE
    values:
      core: 100
      p90: none
      range: [95, 110]
    unit: years
  - metric: population_age_structure
    owner_domain: DEMOGRAPHY
    values:
      core: older_but_active
      p90: none
      range: none
    unit: none
  - metric: retirement_age_concept
    owner_domain: GOVERNANCE
    values:
      core: blurred
      p90: none
      range: none
    unit: none
  - metric: total_fertility_rate
    owner_domain: DEMOGRAPHY
    values:
      core: none
      p90: none
      range: [1.5, 1.8]
    unit: births_per_woman
  - metric: fertility_control_mode
    owner_domain: GOVERNANCE
    values:
      core: cultural_political
      p90: none
      range: none
    unit: none
  - metric: assisted_reproduction_prevalence
    owner_domain: LIFE
    values:
      core: common_not_dominant
      p90: none
      range: none
    unit: none
  - metric: regional_population_concentration
    owner_domain: DEMOGRAPHY
    values:
      core: africa_south_asia_high_share
      p90: none
      range: none
    unit: none
  - metric: interregional_demographic_divergence
    owner_domain: DEMOGRAPHY
    values:
      core: reduced
      p90: none
      range: none
    unit: none
  - metric: migration_primary_drivers
    owner_domain: DEMOGRAPHY
    values:
      core: [climate, economy, security]
      p90: none
      range: none
    unit: none
  - metric: migration_regulation_mode
    owner_domain: GOVERNANCE
    values:
      core: institutionalized
      p90: none
      range: none
    unit: none
  - metric: open_borders_exist
    owner_domain: GOVERNANCE
    values:
      core: false
      p90: none
      range: none
    unit: none
  - metric: uncontrolled_mass_migration
    owner_domain: GOVERNANCE
    values:
      core: false
      p90: none
      range: none
    unit: none
~~~

## FORBIDDEN

[FORBIDDEN][DEM-900] Introducing new demographic metrics outside SSOT.
[FORBIDDEN][DEM-910] Embedding causal chains or sociological narratives.
[FORBIDDEN][DEM-920] Treating qualitative states as narrative drivers.
[FORBIDDEN][DEM-930] Declaring or exporting URBANISM-owned metrics in DEMOGRAPHY SSOT.

## NON-NORMATIVE

~~~text
Empty by design.
~~~
~~~
</file>

<file path="ssot/SSOT-ECONOMY-A-2215-0003.md">
~~~markdown
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
~~~
</file>

<file path="ssot/SSOT-ENERGY-A-2215-0004.md">
~~~markdown
---
id: SSOT-ENERGY-A-2215-0004
title: >
  Energy System — Scenario A (2215, SSOT State)
class: ssot
status: draft
prefix: ENG
doc_language: en-US
inputs: []
depends_on:
  - SPEC-DOC_STYLE-2215-0001
  - SSOT-ECONOMY-A-2215-0003
  - SSOT-SCENARIO-A-2215-0001
references: []
scope: >
  SSOT state of the global energy system in 2215 (Scenario A).
  Contains only declarative metrics (core/p90/range) and binary/categorical
  energy system properties. Does not contain causality, procedures,
  failure scenarios, or conflict resolution.
---

## LLM-INTENT

ROLE_TYPE: STATE
SCOPE: global energy system state for Scenario A around year 2215
INPUTS: []
OUTPUTS: [energy_metric_state]
FORBIDDEN: [causal_logic, resolution_rules, narrative_explanations, failure_models]

## DEFINITIONS

[FACT][ENG-010] `energy_system` = global generation, storage, transmission, and consumption of energy in Scenario A.

## INVARIANTS

[DECISION][ENG-020] This document is applicable ONLY to Scenario A.
[DECISION][ENG-030] Energy system is treated as critical infrastructure.
[DECISION][ENG-040] Fossil fuels are not the dominant energy source.
[DECISION][ENG-050] Energy system does not impose a hard cap on economic growth within declared Scenario A metrics.

## CONTENT

### 1. Primary Energy

[STATE][ENG-100] primary_energy_TW.core = 30.
[STATE][ENG-110] primary_energy_TW.p90 = 60.
[STATE][ENG-120] primary_energy_TW.range = [20, 60].
[STATE][ENG-130] primary_energy_TW.unit = TW.
[STATE][ENG-140] primary_energy_TW.owner_domain = ENERGY.

### 2. Energy Mix

[STATE][ENG-150] low_carbon_share_percent.core = 95.
[STATE][ENG-160] low_carbon_share_percent.range = [90, 98].
[STATE][ENG-170] low_carbon_share_percent.unit = percent.
[STATE][ENG-180] low_carbon_share_percent.owner_domain = ENERGY.
[STATE][ENG-190] fossil_energy_role = "residual_niche".
[STATE][ENG-200] fossil_energy_role.owner_domain = ENERGY.
[STATE][ENG-210] generation_mix_structure = "renewables + nuclear + advanced_sources".
[STATE][ENG-220] generation_mix_structure.owner_domain = ENERGY.
[STATE][ENG-230] generation_mix_quantified = false.
[STATE][ENG-240] generation_mix_quantified.owner_domain = ENERGY.

### 3. Energy Efficiency

[STATE][ENG-250] global_energy_intensity_vs_2025.core = 0.33.
[STATE][ENG-260] global_energy_intensity_vs_2025.p90 = none.
[STATE][ENG-270] global_energy_intensity_vs_2025.range = none.
[STATE][ENG-280] global_energy_intensity_vs_2025.unit = ratio.
[STATE][ENG-290] global_energy_intensity_vs_2025.owner_domain = ENERGY.
[STATE][ENG-300] system_eroei_trend = "stable_or_higher_than_2025".
[STATE][ENG-310] system_eroei_trend.owner_domain = ENERGY.

### 4. Electrification and End Use

[STATE][ENG-320] transport_electrification_percent.core = 95.
[STATE][ENG-330] transport_electrification_percent.range = [90, 100].
[STATE][ENG-340] transport_electrification_percent.unit = percent.
[STATE][ENG-350] transport_electrification_percent.owner_domain = ENERGY.
[STATE][ENG-360] transport_automation_level.source = "SSOT-AUTOMATION-A-2215-0004".
[STATE][ENG-370] transport_automation_level.owner_domain = AUTOMATION.
[DECISION][ENG-380] ENERGY SSOT MUST NOT redefine AUTOMATION-owned metrics.
[STATE][ENG-390] industry_electrification_level = "near_total".
[STATE][ENG-400] industry_electrification_level.owner_domain = ENERGY.
[STATE][ENG-410] buildings_modernized_share_percent.core = 90.
[STATE][ENG-420] buildings_modernized_share_percent.range = [85, 98].
[STATE][ENG-430] buildings_modernized_share_percent.unit = percent.
[STATE][ENG-440] buildings_modernized_share_percent.owner_domain = URBANISM.

### 5. Storage and Grid

[STATE][ENG-450] energy_storage_layer_present = true.
[STATE][ENG-460] energy_storage_layer_present.owner_domain = ENERGY.
[STATE][ENG-470] energy_storage_scope = "short_and_mid_term".
[STATE][ENG-480] energy_storage_scope.owner_domain = ENERGY.
[STATE][ENG-490] grid_resilience_design = "redundant_segmented_self_healing".
[STATE][ENG-500] grid_resilience_design.owner_domain = ENERGY.

### 6. Compute and Energy Coupling

[STATE][ENG-510] ai_energy_share_percent.source = "SSOT-AUTOMATION-A-2215-0004".
[STATE][ENG-520] ai_energy_share_percent.owner_domain = AUTOMATION.
[DECISION][ENG-530] ENERGY SSOT MUST NOT declare or export AUTOMATION-owned metrics.

## USAGE / RESOLUTION

[DECISION][ENG-800] This document provides declarative numeric ranges and qualitative energy system states for downstream documents.
[FORBIDDEN][ENG-810] Using this SSOT document for failure or outage modeling.
[FORBIDDEN][ENG-820] Using this SSOT document for recovery or response procedures.
[FORBIDDEN][ENG-830] Using this SSOT document for resolving core vs p90 conflicts.

## OUTPUT CONTRACT

~~~yaml
doc_id: SSOT-ENERGY-A-2215-0004
role_type: STATE
export:
  - metric: primary_energy_TW
    owner_domain: ENERGY
    values:
      core: 30
      p90: 60
      range: [20, 60]
    unit: TW
  - metric: low_carbon_share_percent
    owner_domain: ENERGY
    values:
      core: 95
      p90: none
      range: [90, 98]
    unit: percent
  - metric: fossil_energy_role
    owner_domain: ENERGY
    values:
      core: residual_niche
      p90: none
      range: none
    unit: none
  - metric: generation_mix_structure
    owner_domain: ENERGY
    values:
      core: "renewables + nuclear + advanced_sources"
      p90: none
      range: none
    unit: none
  - metric: global_energy_intensity_vs_2025
    owner_domain: ENERGY
    values:
      core: 0.33
      p90: none
      range: none
    unit: ratio
  - metric: system_eroei_trend
    owner_domain: ENERGY
    values:
      core: stable_or_higher_than_2025
      p90: none
      range: none
    unit: none
  - metric: transport_electrification_percent
    owner_domain: ENERGY
    values:
      core: 95
      p90: none
      range: [90, 100]
    unit: percent
  - metric: industry_electrification_level
    owner_domain: ENERGY
    values:
      core: near_total
      p90: none
      range: none
    unit: none
  - metric: buildings_modernized_share_percent
    owner_domain: URBANISM
    values:
      core: 90
      p90: none
      range: [85, 98]
    unit: percent
  - metric: energy_storage_layer_present
    owner_domain: ENERGY
    values:
      core: true
      p90: none
      range: none
    unit: none
  - metric: energy_storage_scope
    owner_domain: ENERGY
    values:
      core: short_and_mid_term
      p90: none
      range: none
    unit: none
  - metric: grid_resilience_design
    owner_domain: ENERGY
    values:
      core: redundant_segmented_self_healing
      p90: none
      range: none
    unit: none
~~~

## FORBIDDEN

[FORBIDDEN][ENG-900] Introducing new energy metrics outside SSOT.
[FORBIDDEN][ENG-910] Embedding causal chains, failure narratives, or procedures.
[FORBIDDEN][ENG-920] Using qualitative states as resolution or decision logic.
[FORBIDDEN][ENG-930] Declaring or exporting AUTOMATION-owned metrics in ENERGY SSOT.

## NON-NORMATIVE

~~~text
Empty by design.
~~~
~~~
</file>

<file path="ssot/SSOT-GOVERNANCE-SECURITY-A-2215-0005.md">
~~~markdown
---
id: SSOT-GOVERNANCE-SECURITY-A-2215-0005
title: >
  Governance and Security — Scenario A (2215, SSOT State)
class: ssot
status: draft
prefix: GOV
doc_language: en-US
inputs: []
depends_on:
  - SPEC-DOC_STYLE-2215-0001
  - SSOT-ECONOMY-A-2215-0003
  - SSOT-SCENARIO-A-2215-0001
references: []
scope: >
  SSOT state of governance institutions, security, and conflict in 2215
  (Scenario A). Contains only declarative binary/categorical properties
  and minimal quantitative benchmarks. Does not contain causality,
  procedures, law enforcement, or conflict resolution rules.
---

## LLM-INTENT

ROLE_TYPE: STATE
SCOPE: governance and security global state for Scenario A around year 2215
INPUTS: []
OUTPUTS: [governance_security_state]
FORBIDDEN: [causal_logic, resolution_rules, procedural_law, narrative_explanations]

## DEFINITIONS

[FACT][GOV-010] `governance` = institutional contours of legitimation, regulation, and allocation.
[FACT][GOV-020] `security` = prevention and suppression of violence, including cyber and infrastructure threats.

## INVARIANTS

[DECISION][GOV-030] This document is applicable ONLY to Scenario A.
[DECISION][GOV-040] No global world government exists.
[DECISION][GOV-050] Sovereign states persist as primary political units.
[DECISION][GOV-060] Classical interstate wars are not the default condition of 2215.

## CONTENT

### 1. States and Sovereignty

[STATE][GOV-100] world_government_exists = false.
[STATE][GOV-110] world_government_exists.owner_domain = GOVERNANCE.
[STATE][GOV-120] sovereign_states_exist = true.
[STATE][GOV-130] sovereign_states_exist.owner_domain = GOVERNANCE.
[STATE][GOV-140] state_enforcement_primacy_on_territory = true.
[STATE][GOV-150] state_enforcement_primacy_on_territory.owner_domain = GOVERNANCE.
[STATE][GOV-160] territorial_expansion_by_war_incentive = "low".
[STATE][GOV-170] territorial_expansion_by_war_incentive.owner_domain = GOVERNANCE.

### 2. Supranational Coordination

[STATE][GOV-180] supranational_governance_mode = "treaties_standards_regimes".
[STATE][GOV-190] supranational_governance_mode.owner_domain = GOVERNANCE.
[STATE][GOV-200] supranational_direct_sovereignty = false.
[STATE][GOV-210] supranational_direct_sovereignty.owner_domain = GOVERNANCE.
[STATE][GOV-220] supranational_coordination_domains = ["climate", "energy", "trade", "ai_safety", "arms_control"].
[STATE][GOV-230] supranational_coordination_domains.owner_domain = GOVERNANCE.
[STATE][GOV-240] un_successor_institutions_role = "coordination_platform".
[STATE][GOV-250] un_successor_institutions_role.owner_domain = GOVERNANCE.
[STATE][GOV-260] extraterritorial_special_regimes_exist = true.
[STATE][GOV-270] extraterritorial_special_regimes_exist.owner_domain = GOVERNANCE.
[STATE][GOV-280] extraterritorial_regimes_state_trigger_entry = true.
[STATE][GOV-290] extraterritorial_regimes_state_trigger_entry.owner_domain = GOVERNANCE.

### 3. Algorithmic Governance

[STATE][GOV-300] algorithmic_governance_prevalence = "high".
[STATE][GOV-310] algorithmic_governance_prevalence.owner_domain = GOVERNANCE.
[STATE][GOV-320] government_ai_use_domains = ["taxation", "resource_allocation", "forecasting", "compliance"].
[STATE][GOV-330] government_ai_use_domains.owner_domain = GOVERNANCE.
[STATE][GOV-340] routine_governance_decisions_automation = "high".
[STATE][GOV-350] routine_governance_decisions_automation.owner_domain = GOVERNANCE.
[STATE][GOV-360] human_final_authority_in_normative_decisions = true.
[STATE][GOV-370] human_final_authority_in_normative_decisions.owner_domain = GOVERNANCE.
[STATE][GOV-380] algorithmic_opacity_risk_profile = "material".
[STATE][GOV-390] algorithmic_opacity_risk_profile.owner_domain = SECURITY.

### 4. Corporations and Economic Power

[STATE][GOV-400] systemic_corporations_exist = true.
[STATE][GOV-410] systemic_corporations_exist.owner_domain = ECONOMY.
[STATE][GOV-420] corporate_power_vs_mid_states = "comparable".
[STATE][GOV-430] corporate_power_vs_mid_states.owner_domain = ECONOMY.
[STATE][GOV-440] corporate_sovereignty = false.
[STATE][GOV-450] corporate_sovereignty.owner_domain = GOVERNANCE.
[STATE][GOV-460] corporate_regulatory_subordination = true.
[STATE][GOV-470] corporate_regulatory_subordination.owner_domain = GOVERNANCE.
[STATE][GOV-480] mandatory_audit_transparency_compliance = true.
[STATE][GOV-490] mandatory_audit_transparency_compliance.owner_domain = GOVERNANCE.
[STATE][GOV-500] corporate_influence_mode = "law_contracts_standards_access".
[STATE][GOV-510] corporate_influence_mode.owner_domain = GOVERNANCE.
[STATE][GOV-520] corporate_direct_force_against_state = "rare".
[STATE][GOV-530] corporate_direct_force_against_state.owner_domain = SECURITY.

### 5. Law and Enforcement

[STATE][GOV-540] law_is_primary_legitimation_tool = true.
[STATE][GOV-550] law_is_primary_legitimation_tool.owner_domain = GOVERNANCE.
[STATE][GOV-560] automated_monitoring_and_enforcement_present = true.
[STATE][GOV-570] automated_monitoring_and_enforcement_present.owner_domain = SECURITY.
[STATE][GOV-580] judicial_ai_assistance_present = true.
[STATE][GOV-590] judicial_ai_assistance_present.owner_domain = GOVERNANCE.
[STATE][GOV-600] legal_final_decisions_by_humans = true.
[STATE][GOV-610] legal_final_decisions_by_humans.owner_domain = GOVERNANCE.
[STATE][GOV-620] private_security_allowed = true.
[STATE][GOV-630] private_security_allowed.owner_domain = SECURITY.
[STATE][GOV-640] private_security_scope = "narrow_legal_field".
[STATE][GOV-650] private_security_scope.owner_domain = SECURITY.

### 6. Conflict and Security

[STATE][GOV-660] dominant_conflict_domains = ["cyber", "economic", "legal"].
[STATE][GOV-670] dominant_conflict_domains.owner_domain = SECURITY.
[STATE][GOV-680] conventional_army_clashes_frequency = "rare_limited".
[STATE][GOV-690] conventional_army_clashes_frequency.owner_domain = SECURITY.
[STATE][GOV-700] conflict_mode = "asymmetric_proxy_common".
[STATE][GOV-710] conflict_mode.owner_domain = SECURITY.

### 7. Autonomous Systems and Deterrence

[STATE][GOV-720] autonomous_weapons_state_use_prevalence = "high".
[STATE][GOV-730] autonomous_weapons_state_use_prevalence.owner_domain = SECURITY.
[STATE][GOV-740] drone_swarm_platforms_are_military_core = true.
[STATE][GOV-750] drone_swarm_platforms_are_military_core.owner_domain = SECURITY.
[STATE][GOV-760] tactical_human_participation_level = "minimal".
[STATE][GOV-770] tactical_human_participation_level.owner_domain = SECURITY.
[STATE][GOV-780] strategic_force_decisions_by_humans = true.
[STATE][GOV-790] strategic_force_decisions_by_humans.owner_domain = GOVERNANCE.
[STATE][GOV-800] corporations_are_war_sovereigns = false.
[STATE][GOV-810] corporations_are_war_sovereigns.owner_domain = SECURITY.
[STATE][GOV-820] corporate_force_scope = "object_security_only".
[STATE][GOV-830] corporate_force_scope.owner_domain = SECURITY.

### 8. Cybersecurity and Infrastructure Security

[STATE][GOV-840] cybersecurity_centrality = "core_axis".
[STATE][GOV-850] cybersecurity_centrality.owner_domain = SECURITY.
[STATE][GOV-860] primary_attack_targets = ["energy", "ai_infrastructure", "finance", "logistics"].
[STATE][GOV-870] primary_attack_targets.owner_domain = SECURITY.
[STATE][GOV-880] cyber_defense_automation_level = "high".
[STATE][GOV-890] cyber_defense_automation_level.owner_domain = SECURITY.

### 9. Arms Control and AI Safety

[STATE][GOV-900] autonomous_weapons_arms_control_regimes_exist = true.
[STATE][GOV-910] autonomous_weapons_arms_control_regimes_exist.owner_domain = GOVERNANCE.
[STATE][GOV-920] arms_control_mode = "procedural_technological".
[STATE][GOV-930] arms_control_mode.owner_domain = GOVERNANCE.
[STATE][GOV-940] autonomous_weapons_total_ban = false.
[STATE][GOV-950] autonomous_weapons_total_ban.owner_domain = GOVERNANCE.
[STATE][GOV-960] arms_control_primary_goal = "prevent_uncontrolled_escalation_and_accidents".
[STATE][GOV-970] arms_control_primary_goal.owner_domain = GOVERNANCE.

### 10. Internal Security

[STATE][GOV-980] internal_security_stack = ["police", "ai_surveillance", "prevention"].
[STATE][GOV-980A] internal_security_stack.owner_domain = SECURITY.
[STATE][GOV-990] physical_crime_trend_vs_21c = "lower".
[STATE][GOV-990A] physical_crime_trend_vs_21c.owner_domain = SECURITY.
[STATE][GOV-990B] cybercrime_significance = "high".
[STATE][GOV-990C] cybercrime_significance.owner_domain = SECURITY.
[STATE][GOV-990D] economic_crime_significance = "high".
[STATE][GOV-990E] economic_crime_significance.owner_domain = SECURITY.
[STATE][GOV-990F] mass_violence_and_terrorism_frequency = "rare_not_eliminated".
[STATE][GOV-990G] mass_violence_and_terrorism_frequency.owner_domain = SECURITY.

## USAGE / RESOLUTION

[DECISION][GOV-990H] This document provides declarative governance and security state for downstream documents.
[FORBIDDEN][GOV-990J] Using this SSOT document for causal explanations of conflicts.
[FORBIDDEN][GOV-990K] Using this SSOT document for procedural law or enforcement detail.
[FORBIDDEN][GOV-990L] Using this SSOT document for escalation or war scenario modeling.

## OUTPUT CONTRACT

~~~yaml
doc_id: SSOT-GOVERNANCE-SECURITY-A-2215-0005
role_type: STATE
export:
  - metric: world_government_exists
    owner_domain: GOVERNANCE
    values:
      core: false
      p90: none
      range: none
    unit: none
  - metric: supranational_governance_mode
    owner_domain: GOVERNANCE
    values:
      core: treaties_standards_regimes
      p90: none
      range: none
    unit: none
  - metric: algorithmic_governance_prevalence
    owner_domain: GOVERNANCE
    values:
      core: high
      p90: none
      range: none
    unit: none
  - metric: human_final_authority_in_normative_decisions
    owner_domain: GOVERNANCE
    values:
      core: true
      p90: none
      range: none
    unit: none
  - metric: corporate_sovereignty
    owner_domain: GOVERNANCE
    values:
      core: false
      p90: none
      range: none
    unit: none
  - metric: dominant_conflict_domains
    owner_domain: SECURITY
    values:
      core: [cyber, economic, legal]
      p90: none
      range: none
    unit: none
  - metric: cybersecurity_centrality
    owner_domain: SECURITY
    values:
      core: core_axis
      p90: none
      range: none
    unit: none
  - metric: autonomous_weapons_state_use_prevalence
    owner_domain: SECURITY
    values:
      core: high
      p90: none
      range: none
    unit: none
  - metric: strategic_force_decisions_by_humans
    owner_domain: GOVERNANCE
    values:
      core: true
      p90: none
      range: none
    unit: none
  - metric: arms_control_mode
    owner_domain: GOVERNANCE
    values:
      core: procedural_technological
      p90: none
      range: none
    unit: none
  - metric: physical_crime_trend_vs_21c
    owner_domain: SECURITY
    values:
      core: lower
      p90: none
      range: none
    unit: none
  - metric: mass_violence_and_terrorism_frequency
    owner_domain: SECURITY
    values:
      core: rare_not_eliminated
      p90: none
      range: none
    unit: none
~~~

## FORBIDDEN

[FORBIDDEN][GOV-990M] Introducing new world metrics or numeric claims.
[FORBIDDEN][GOV-990N] Embedding causal chains or operational procedures.
[FORBIDDEN][GOV-990P] Using governance or security state as narrative directive.

## NON-NORMATIVE

~~~text
Empty by design.
~~~
~~~
</file>

<file path="ssot/SSOT-LAW-A-2215-0008.md">
~~~markdown
---
id: SSOT-LAW-A-2215-0008
title: >
  Law & Correction System — 2215 (Crime Mechanics)
class: ssot
status: fixed
doc_language: en-US
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

<file path="ssot/SSOT-LIFE-A-2215-0007.md">
~~~markdown
---
id: SSOT-LIFE-A-2215-0007
title: >
  Life, Body, and Daily Reality — Scenario A (2215, SSOT State)
class: ssot
status: draft
doc_language: en-US
inputs: []
depends_on:
  - SSOT-SCENARIO-A-2215-0001
  - SSOT-DEMOGRAPHY-A-2215-0002
  - SSOT-ECONOMY-A-2215-0003
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

## DEFINITIONS

[DEF][LIF-DEF-010] life = everyday practices, access to services, privacy regimes, and cultural norms.
[DEF][LIF-DEF-011] body = health, medicine, therapeutic augmentation, and human biological limits.

## INVARIANTS

[FACT][LIF-000] Applicable only to Scenario A.
[FACT][LIF-001] Human biological and psychological constraints persist.
[FACT][LIF-002] No default radical post-human discontinuity.
[FACT][LIF-003] No mass immortality.

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

### 2. Augmentation and limits

[STATE][LIF-030] therapeutic_augmentation_prevalence = "common"
[STATE][LIF-031] therapeutic_augmentation_prevalence.owner_domain = LIFE

[STATE][LIF-032] enhancement_augmentation_prevalence = "rare_socially_limited"
[STATE][LIF-033] enhancement_augmentation_prevalence.owner_domain = GOVERNANCE

[STATE][LIF-034] cognitive_implants_prevalence = "niche_professional"
[STATE][LIF-035] cognitive_implants_prevalence.owner_domain = LIFE

[STATE][LIF-036] radical_body_modification_norm = false
[STATE][LIF-037] radical_body_modification_norm.owner_domain = LIFE

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

### 5. Education and cognition

[STATE][LIF-080] lifelong_education_norm = true
[STATE][LIF-081] lifelong_education_norm.owner_domain = LIFE

[STATE][LIF-082] ai_tutors_are_standard = true
[STATE][LIF-083] ai_tutors_are_standard.owner_domain = LIFE

[STATE][LIF-084] knowledge_access_mode = "near_universal"
[STATE][LIF-085] knowledge_access_mode.owner_domain = GOVERNANCE

[STATE][LIF-086] diplomas_vs_competence_signal = "competence_over_diplomas"
[STATE][LIF-087] diplomas_vs_competence_signal.owner_domain = GOVERNANCE

### 6. Social structure and inequality (everyday)

[STATE][LIF-100] inequality_primary_dimensions = ["space", "privacy", "augmentations"]
[STATE][LIF-101] inequality_primary_dimensions.owner_domain = ECONOMY

[STATE][LIF-102] extreme_material_poverty_exists = false
[STATE][LIF-103] extreme_material_poverty_exists.owner_domain = ECONOMY

[STATE][LIF-104] everyday_status_differences_mode = "cultural_status_not_existential"
[STATE][LIF-105] everyday_status_differences_mode.owner_domain = LIFE

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

### 8. Culture, norms, and values

[STATE][LIF-140] cultural_orientation = ["sustainability", "security", "rationality"]
[STATE][LIF-141] cultural_orientation.owner_domain = LIFE

[STATE][LIF-142] extremist_ideologies_prevalence = "marginal"
[STATE][LIF-143] extremist_ideologies_prevalence.owner_domain = SECURITY

[STATE][LIF-144] social_norms_emphasis = ["responsibility", "compliance", "long_term_thinking"]
[STATE][LIF-145] social_norms_emphasis.owner_domain = GOVERNANCE

## USAGE / RESOLUTION

[FACT][LIF-900] Provides declarative LIFE and BODY state for downstream documents.

[FORBIDDEN][LIF-901] Using this SSOT document for:
- causal explanations of social behavior,
- selecting scene “tone” or aesthetics,
- feedback-loop or governance logic.

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

## FORBIDDEN

[FORBIDDEN][LIF-990] Introducing new world metrics or numeric claims outside SSOT.
[FORBIDDEN][LIF-991] Embedding causal chains, loops, or normative prescriptions.
[FORBIDDEN][LIF-992] Treating LIFE state as narrative directive.

## NON-NORMATIVE

(Empty by design)

~~~
</file>

<file path="ssot/SSOT-LOC-WEATHER-CHELNY-2215-0001.md">
~~~markdown
---
id: SSOT-LOC-WEATHER-CHELNY-2215-0001
title: >
  RU 2215 — Набережные Челны: Погодный режим (дефолты) — Scene-Consumed SSOT
class: ssot
status: draft
prefix: CHW
doc_language: en-US
inputs: []
depends_on:
  - SPEC-DOC_STYLE-2215-0001
scope: >
  Декларативные SSOT-метрики погодного режима для сцен в Набережных Челнах (2215).
  Документ предназначен для потребления генератором прозы как дефолт и не содержит
  причинности, объяснений, клише-ограничений или нарративной логики.
---

## LLM-INTENT

ROLE_TYPE: STATE
SCOPE: scene-consumed default weather metrics for Chelny-2215 (declarative only)
INPUTS: []
OUTPUTS: [weather_metrics]
FORBIDDEN: [causality, narrative_explanations, noir_tropes, utopia_sterility, implicit_overrides]

## DEFINITIONS

[FACT][CHW-010] `weather_profile` = набор метрик погодного режима, потребляемый сценой как дефолт.
[FACT][CHW-020] `scene_consumed` = документ, чьи exports используются генератором прозы как дефолтные ограничения.

## INVARIANTS

[DECISION][CHW-030] Этот документ экспортирует только STATE-метрики; любая интерпретация “почему так” FORBIDDEN.
[DECISION][CHW-031] Переопределение метрик `weather_profile` допускается только через Override/Scene по правилам приоритета корпуса.

## CONTENT

[STATE][CHW-040] chelny.weather_profile.mode = SOFT_GREY_COMFORT.
[STATE][CHW-041] chelny.weather_profile.sky_texture = TEXTURED_CONCRETE.
[STATE][CHW-042] chelny.weather_profile.temperature_c = [22, 24].
[STATE][CHW-043] chelny.weather_profile.wind = WARM_LIGHT_BREEZE.
[STATE][CHW-044] chelny.weather_profile.vibe = DECEPTIVE_CALM.

## USAGE / RESOLUTION

[DECISION][CHW-050] Любая сцена в RU-16/Челны MUST использовать `chelny.weather_profile.*` как дефолт, если не активирован явный инцидентный контур.
[FORBIDDEN][CHW-051] Подмена дефолтов на “постоянный дождь/мрак/кислотный неон” без явного Override/Scene.

## OUTPUT CONTRACT

~~~yaml
doc_id: SSOT-LOC-WEATHER-CHELNY-2215-0001
role_type: STATE
export:
  - metric: chelny.weather_profile.mode
    owner_domain: URBANISM
    values: { core: SOFT_GREY_COMFORT, p90: none, range: none }
    unit: none
  - metric: chelny.weather_profile.sky_texture
    owner_domain: URBANISM
    values: { core: TEXTURED_CONCRETE, p90: none, range: none }
    unit: none
  - metric: chelny.weather_profile.temperature_c
    owner_domain: URBANISM
    values: { core: none, p90: none, range: [22, 24] }
    unit: C
  - metric: chelny.weather_profile.wind
    owner_domain: URBANISM
    values: { core: WARM_LIGHT_BREEZE, p90: none, range: none }
    unit: none
  - metric: chelny.weather_profile.vibe
    owner_domain: URBANISM
    values: { core: DECEPTIVE_CALM, p90: none, range: none }
    unit: none
~~~

## FORBIDDEN

[FORBIDDEN][CHW-900] Добавление причинности/объяснений в этот документ.
[FORBIDDEN][CHW-901] Использование неэкспортируемых фрагментов как источника правил или фактов.
[FORBIDDEN][CHW-902] Введение новых погодных метрик без явного расширения OUTPUT CONTRACT.

## NON-NORMATIVE

~~~
</file>

<file path="ssot/SSOT-SCENARIO-A-2215-0001.md">
~~~markdown
---
id: SSOT-SCENARIO-A-2215-0001
title: >
  Scenario A — Macro World State for 2215 (SSOT)
class: ssot
status: draft
prefix: SCNA
doc_language: en-US
inputs: []
depends_on:
  - SPEC-DOC_STYLE-2215-0001
references: []
scope: >
  Canonical SSOT description of Scenario A as the sole admissible macro world
  state around ~2215. Contains only declarative assertions about world state
  and admissible metric ranges.
---

## LLM-INTENT

ROLE_TYPE: STATE
SCOPE: canonical macro world state for Scenario A in year ~2215
INPUTS: []
OUTPUTS: [metric_state]
FORBIDDEN: [resolution_logic, narrative_usage, priority_rules, causal_explanations]

## DEFINITIONS

[FACT][SCNA-010] `scenario_A` = cooperative techno-optimistic trajectory of global development,
  fixed as the sole admissible world branch for 2215.

## INVARIANTS

[DECISION][SCNA-020] Scenario A is the sole admissible scenario of macro world evolution in corpus 2215.
[DECISION][SCNA-030] All downstream documents MUST use only metrics and ranges declared in this document or in domain SSOT documents.

## CONTENT

### 1. Scenario Identity

[STATE][SCNA-100] scenario_id = "A".
[STATE][SCNA-110] scenario_name = "Cooperative Techno-optimism".
[STATE][SCNA-120] scenario_confidence_estimate_percent ≈ 25.
[STATE][SCNA-130] scenario_owner_domain = SCENARIO.

### 2. Global Qualitative State

[STATE][SCNA-140] global_cooperation_level = "high".
[STATE][SCNA-150] global_technological_progress_continuity = true.
[STATE][SCNA-160] automation_scaling_mode = "systemic_global".
[STATE][SCNA-170] climate_policy_persistence = "long_term_strict".
[STATE][SCNA-180] global_warfare_norm = false.

### 3. Population and Society

[STATE][SCNA-190] population_billion.core = 8.8.
[STATE][SCNA-200] population_billion.range = [8.0, 9.5].
[STATE][SCNA-210] population_billion.unit = billion.
[STATE][SCNA-220] population_billion.owner_domain = DEMOGRAPHY.
[STATE][SCNA-230] life_expectancy_years.core = 100.
[STATE][SCNA-240] life_expectancy_years.range = [95, 110].
[STATE][SCNA-250] life_expectancy_years.unit = years.
[STATE][SCNA-260] life_expectancy_years.owner_domain = LIFE.

### 4. Energy and Climate

[STATE][SCNA-270] primary_energy_TW.core = 30.
[STATE][SCNA-280] primary_energy_TW.p90 = 60.
[STATE][SCNA-290] primary_energy_TW.unit = TW.
[STATE][SCNA-300] primary_energy_TW.owner_domain = ENERGY.
[STATE][SCNA-310] low_carbon_share_percent.core = 95.
[STATE][SCNA-320] low_carbon_share_percent.range = [90, 98].
[STATE][SCNA-330] low_carbon_share_percent.unit = percent.
[STATE][SCNA-340] low_carbon_share_percent.owner_domain = ENERGY.
[STATE][SCNA-350] warming_C_vs_preindustrial.core = 2.5.
[STATE][SCNA-360] warming_C_vs_preindustrial.range = [2.0, 2.8].
[STATE][SCNA-370] warming_C_vs_preindustrial.unit = C.
[STATE][SCNA-380] warming_C_vs_preindustrial.owner_domain = CLIMATE.
[STATE][SCNA-390] sea_level_m.core = 1.7.
[STATE][SCNA-400] sea_level_m.range = [1.2, 2.2].
[STATE][SCNA-410] sea_level_m.unit = m.
[STATE][SCNA-420] sea_level_m.owner_domain = CLIMATE.

### 5. Economy

[STATE][SCNA-430] gdp_ppp_relative_to_2025.core = 30.
[STATE][SCNA-440] gdp_ppp_relative_to_2025.p90 = 40.
[STATE][SCNA-450] gdp_ppp_relative_to_2025.unit = multiplier.
[STATE][SCNA-460] gdp_ppp_relative_to_2025.owner_domain = ECONOMY.
[STATE][SCNA-470] global_gini_index.p90 = 0.4.
[STATE][SCNA-480] global_gini_index.unit = coefficient.
[STATE][SCNA-490] global_gini_index.owner_domain = ECONOMY.

### 6. AI and Automation

[STATE][SCNA-500] labor_automation_percent_tasks.core = 80.
[STATE][SCNA-510] labor_automation_percent_tasks.p90 = 90.
[STATE][SCNA-520] labor_automation_percent_tasks.unit = percent.
[STATE][SCNA-530] labor_automation_percent_tasks.owner_domain = AUTOMATION.
[STATE][SCNA-540] ai_compute_EJ_per_year.core = 75.
[STATE][SCNA-550] ai_compute_EJ_per_year.p90 = 200.
[STATE][SCNA-560] ai_compute_EJ_per_year.unit = EJ_per_year.
[STATE][SCNA-570] ai_compute_EJ_per_year.owner_domain = AUTOMATION.

## USAGE / RESOLUTION

[DECISION][SCNA-800] This document provides admissible values and ranges of metrics for downstream documents.
[FORBIDDEN][SCNA-810] Using this document for selecting core vs p90.
[FORBIDDEN][SCNA-820] Using this document for setting scene priorities.
[FORBIDDEN][SCNA-830] Using this document for resolving conflicts between domains.

## OUTPUT CONTRACT

~~~yaml
doc_id: SSOT-SCENARIO-A-2215-0001
role_type: STATE
export:
  - metric: scenario_id
    owner_domain: SCENARIO
    values:
      core: A
      p90: none
      range: none
    unit: none
  - metric: global_cooperation_level
    owner_domain: SCENARIO
    values:
      core: high
      p90: none
      range: none
    unit: none
  - metric: global_technological_progress_continuity
    owner_domain: SCENARIO
    values:
      core: true
      p90: none
      range: none
    unit: none
  - metric: automation_scaling_mode
    owner_domain: SCENARIO
    values:
      core: systemic_global
      p90: none
      range: none
    unit: none
  - metric: climate_policy_persistence
    owner_domain: SCENARIO
    values:
      core: long_term_strict
      p90: none
      range: none
    unit: none
  - metric: global_warfare_norm
    owner_domain: SCENARIO
    values:
      core: false
      p90: none
      range: none
    unit: none
  - metric: population_billion
    owner_domain: DEMOGRAPHY
    values:
      core: 8.8
      p90: none
      range: [8.0, 9.5]
    unit: billion
  - metric: life_expectancy_years
    owner_domain: LIFE
    values:
      core: 100
      p90: none
      range: [95, 110]
    unit: years
  - metric: primary_energy_TW
    owner_domain: ENERGY
    values:
      core: 30
      p90: 60
      range: none
    unit: TW
  - metric: low_carbon_share_percent
    owner_domain: ENERGY
    values:
      core: 95
      p90: none
      range: [90, 98]
    unit: percent
  - metric: warming_C_vs_preindustrial
    owner_domain: CLIMATE
    values:
      core: 2.5
      p90: none
      range: [2.0, 2.8]
    unit: C
  - metric: sea_level_m
    owner_domain: CLIMATE
    values:
      core: 1.7
      p90: none
      range: [1.2, 2.2]
    unit: m
  - metric: gdp_ppp_relative_to_2025
    owner_domain: ECONOMY
    values:
      core: 30
      p90: 40
      range: none
    unit: multiplier
  - metric: global_gini_index
    owner_domain: ECONOMY
    values:
      core: none
      p90: 0.4
      range: none
    unit: coefficient
  - metric: labor_automation_percent_tasks
    owner_domain: AUTOMATION
    values:
      core: 80
      p90: 90
      range: none
    unit: percent
  - metric: ai_compute_EJ_per_year
    owner_domain: AUTOMATION
    values:
      core: 75
      p90: 200
      range: none
    unit: EJ_per_year
~~~

## FORBIDDEN

[FORBIDDEN][SCNA-900] Introducing new metrics not declared in SSOT.
[FORBIDDEN][SCNA-910] Embedding causal logic or scenario comparison.
[FORBIDDEN][SCNA-920] Using this document as narrative directive.

## NON-NORMATIVE

~~~text
Empty by design.
~~~
~~~
</file>

<file path="ssot/SSOT-SPACE-INDUSTRY-A-2215-0006.md">
~~~markdown
---
id: SSOT-SPACE-INDUSTRY-A-2215-0006
title: >
  Space Industry and Orbital Infrastructure — Scenario A (2215, SSOT State)
class: ssot
status: draft
doc_language: en-US
inputs:
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

## DEFINITIONS

- Space industry — производственные, логистические и сервисные контуры,
  обеспечивающие орбитальную/цислунарную инфраструктуру.
- Orbital infrastructure — спутники, платформы, узлы связи/навигации/наблюдения,
  обслуживаемые и заменяемые индустриальными контурами.

## INVARIANTS

- [FACT][SPI-000] Документ применим только в рамках Scenario A.
- [FACT][SPI-001] Космос является инфраструктурным продолжением земной экономики,
  а не автономной цивилизацией.
- [FACT][SPI-002] Массовой космической колонизации не произошло.

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

### 2. Core Functions (Qualitative Set)

- [STATE][SPI-020] space_industry_core_functions = [
    "orbital_infrastructure_build_and_service",
    "limited_extraterrestrial_resource_processing",
    "niche_orbital_energy_support",
    "microgravity_vacuum_experiments"
  ]
- [STATE][SPI-021] space_functions_owner_domain = SPACE-INDUSTRY

### 3. Economic Role

- [STATE][SPI-030] space_industry_is_dominant_sector = false
- [STATE][SPI-031] space_industry_dominance_owner_domain = ECONOMY

- [STATE][SPI-032] space_economy_gdp_share_percent = "low_single_digit"
- [STATE][SPI-033] space_gdp_share_owner_domain = ECONOMY

- [STATE][SPI-034] primary_value_to_earth_infrastructure = ["communications", "navigation", "observation", "security_support"]
- [STATE][SPI-035] primary_value_owner_domain = SPACE-INDUSTRY

### 4. Automation and Labor

- [STATE][SPI-040] space_operations_automation_level = "very_high"
- [STATE][SPI-041] space_automation_owner_domain = AUTOMATION

- [STATE][SPI-042] dominant_operational_agents = ["robots", "drones", "autonomous_systems"]
- [STATE][SPI-043] dominant_agents_owner_domain = AUTOMATION

- [STATE][SPI-044] human_roles_in_space = ["supervision", "repair", "nonstandard_decisions", "science"]
- [STATE][SPI-045] human_roles_owner_domain = SPACE-INDUSTRY

- [STATE][SPI-046] human_access_mode = "specialized_training_and_clearance"
- [STATE][SPI-047] human_access_owner_domain = GOVERNANCE

### 5. Logistics and Transport

- [STATE][SPI-060] space_logistics_transport_mode = ["reusable_systems", "autonomous_tugs"]
- [STATE][SPI-061] space_transport_owner_domain = SPACE-INDUSTRY

- [STATE][SPI-062] inter_node_cargo_movement_automation = "high"
- [STATE][SPI-063] inter_node_cargo_automation_owner_domain = AUTOMATION

- [STATE][SPI-064] launch_cost_constraint_level = "material"
- [STATE][SPI-065] launch_cost_constraint_owner_domain = ECONOMY

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

### 7. Constraints and Limits (State)

- [STATE][SPI-100] scaling_constraints = ["logistics_cost", "radiation_risk", "life_support_complexity"]
- [STATE][SPI-101] scaling_constraints_owner_domain = SPACE-INDUSTRY

- [STATE][SPI-102] space_is_mass_migration_destination = false
- [STATE][SPI-103] space_migration_owner_domain = DEMOGRAPHY

- [STATE][SPI-104] project_filter = "economic_viability"
- [STATE][SPI-105] project_filter_owner_domain = ECONOMY

## USAGE / RESOLUTION

- [FACT][SPI-900] Документ предоставляет декларативные свойства космической индустрии
  и орбитальной инфраструктуры для downstream-документов.

- [FORBIDDEN][SPI-901] Использование данного документа для:
  - построения причинных цепочек и “почему так сложилось”,
  - описания операционных процедур или протоколов доступа,
  - романтизации колонизации как доминирующей нормы.

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

## FORBIDDEN

- [FORBIDDEN][SPI-990] Introducing new world metrics or numeric claims outside SSOT.
- [FORBIDDEN][SPI-991] Embedding causal chains or procedural logic.
- [FORBIDDEN][SPI-992] Treating space industry state as narrative directive.

## NON-NORMATIVE

(Empty by design)

~~~
</file>

<file path="ssot/SSOT-URBANISM-A-2215-0007.md">
~~~markdown
---
id: SSOT-URBANISM-A-2215-0007
title: >
  Urbanism and City Systems — Scenario A (2215, SSOT State)
class: ssot
status: fixed
prefix: URB
doc_language: en-US
inputs:
  - SSOT-DEMOGRAPHY-A-2215-0002
  - SSOT-SCENARIO-A-2215-0001
depends_on:
  - SPEC-DOC_STYLE-2215-0001
references: []
scope: >
  Canonical SSOT state of urban environment and agglomeration systems
  in 2215 under Scenario A: morphology, infrastructure, transport,
  sensory environment, management, and visual code (LEVEL-MID defaults).
  Local implementations (e.g., specific cities) MUST be encoded in
  BASELINE-* documents and may apply explicit exemptions to selected fields.
---

## LLM-INTENT

ROLE_TYPE: STATE
SCOPE: urban systems state for Scenario A in year ~2215 (LEVEL-MID defaults)
INPUTS:
  - SSOT-DEMOGRAPHY-A-2215-0002
  - SSOT-SCENARIO-A-2215-0001
OUTPUTS: [urbanism_state, visual_code]
FORBIDDEN: [causal_logic, resolution_rules, narrative_explanations, feedback_loops]

## DEFINITIONS

[FACT][URB-010] `urbanism` = settlement morphology and operational regimes of the urban "operating system".
[FACT][URB-020] `city_systems` = critical infrastructures and their standard behavioral regimes.

## INVARIANTS

[DECISION][URB-030] This document is applicable ONLY within Scenario A.
[DECISION][URB-040] The city is treated as an infrastructure life-support machine.
[DECISION][URB-050] Dense agglomerations are the base settlement form.
[DECISION][URB-060] The urban environment operates in 24/7 functional mode by default.
[DECISION][URB-070] `urban_population_share_percent` is owned and exported ONLY by this document (owner_domain = URBANISM).
[DECISION][URB-080] The city in 2215 is an operating system for millions: minimal cost of maintaining habitability +
  maximum predictability of access to base functions over centuries despite inevitable technology shifts.
[DECISION][URB-090] Key shift: the city is designed as a platform, not as an aggregate of projects.
[DECISION][URB-100] Continuous operation takes precedence over aesthetics; appearance is a byproduct of regulation, maintenance, and repair logistics.
[DECISION][URB-110] Platform uniformity takes precedence over uniqueness: long-lived elements MUST have standardized service interfaces.
[DECISION][URB-120] Topology is more stable than materials: access points, service routes, and responsibility zones persist across implementation changes.
[DECISION][URB-130] Social function takes precedence over spatial gestures: environment is evaluated by access guarantees and predictability, not by formal expressiveness.
[DECISION][URB-140] Norm takes precedence over taste: the city does not need to be liked; it needs to PASS thresholds of safety, accessibility, repairability, manageability.
[DECISION][URB-150] Aesthetics are permitted as a managed layer and mode that MUST NOT affect mass housing and infrastructure stock (G ≤ G_max).
[DECISION][URB-150A] Local city character (including green intensity, park prevalence, and aesthetic layering) MUST be encoded in BASELINE-URBANISM-* documents.
[DECISION][URB-150B] SSOT provides: (a) global defaults, (b) allowed modes, (c) constraints for local exemptions.

## CONTENT

### 1. Platform Contracts

[DECISION][URB-160] Environment is defined by access contracts: entries/exits, evacuation, service perimeters.
[DECISION][URB-170] Environment is defined by utility contracts: connection nodes, diagnostic interfaces, scheduled maintenance windows.
[DECISION][URB-180] Environment is defined by replacement contracts: modular replacement without "rebuilding the world".

### 2. Interface Convergence and Implementation Variance

[DECISION][URB-190] Service interfaces are unified; implementations are variable.
[DECISION][URB-200] Visual heterogeneity is a consequence of asynchronous upgrade cycles under a single platform contract.

### 3. Regulated Ordinary

[DECISION][URB-210] Housing and base infrastructure are background.
[DECISION][URB-220] "Spectacle" is permitted ONLY in designated modes/locations and MUST NOT disrupt operations or maintenance schedules.

### 4. Risk and Cost Governance

[DECISION][URB-230] Urbanism = risk and cost management over centuries: failure localization, cheaper recovery,
  administrative impossibility of operational stock degradation.

### 5. Social Attraction as Service Metric

[DECISION][URB-240] "Attraction" is treated as a service metric: access predictability, safety, base-function density
  within time radius, absence of stigma and environmental marginalization, low flow conflict.

### 6. Optimization Frame

[DECISION][URB-250] Urbanism 2215 is evaluated by maximizing U = B + A + P + S and minimizing K = C + R + G
  under constraints: B ≥ B_min, M ≤ M_max, S ≥ S_min, V permitted ONLY IF it does not increase R or decrease P, G ≤ G_max.

### 7. Element Application

[DECISION][URB-260] Quarter: repeatable service corridors and access points; courtyard is an operational space (safe, repairable, predictable).
[DECISION][URB-270] Street: service route + movement route; embedded standardized infrastructure; decorative layers MUST NOT violate maintenance schedules.
[DECISION][URB-280] Housing: platform with interfaces; shells change, service core is stable; status solutions are a separate mode, isolated from mass stock.

### 8. Canonicality Checks

[DECISION][URB-290] IF depiction resembles advertising render THEN FAIL.
[DECISION][URB-300] IF district requires "one big reconstruction" THEN FAIL.
[DECISION][URB-310] IF time is shown as dirt/decay baseline THEN FAIL (Scenario A baseline).
[DECISION][URB-320] IF time is shown as coexistence of generations under one contract THEN PASS.
[DECISION][URB-330] IF regulation and serviceability are legible everywhere in baseline layer THEN PASS.

### 9. Urbanization Level and Dominant Form

[STATE][URB-340] urban_population_share_percent.core = 82.
[STATE][URB-350] urban_population_share_percent.range = [80, 85].
[STATE][URB-360] dominant_settlement_form = "large_agglomerations_and_metapolises".
[STATE][URB-370] typical_urban_fabric_density = "high".
[STATE][URB-380] verticalization_norm = true.
[STATE][URB-390] low_density_suburbia_dominant = false.

### 10. City Morphology

[STATE][URB-400] mass_built_form = "platform_modular".
[STATE][URB-410] mixed_use_blocks_prevalence = "high".
[STATE][URB-420] urban_fabric_drifted_toward = ["logistics", "maintenance", "repairability", "energy_efficiency"].
[STATE][URB-430] architectural_uniqueness = "present_as_local_layers_not_mass_norm".

### 11. Green and Open Space

[STATE][URB-440] green_space_role.allowed = ["microclimate_stabilization", "thermal_load_reduction", "human_comfort"].
[STATE][URB-450] green_elements_integration.allowed = ["residential_blocks", "courtyards", "streets", "transport_corridors"].
[STATE][URB-460] parks_presence.core = "selective_designated".
[STATE][URB-460A] parks_presence.allowed = ["selective_designated", "pervasive_integrated"].
[STATE][URB-470] parks_as_voids_dominant.core = "situational".
[STATE][URB-470A] parks_as_voids_dominant.allowed = ["true", "false", "situational"].
[STATE][URB-480] daily_green_exposure.core = "non_guaranteed".
[STATE][URB-480A] daily_green_exposure.allowed = ["non_guaranteed", "baseline_expected"].
[STATE][URB-490] green_space_maintenance.allowed = ["standardized_infrastructure_layer", "mixed_regime"].

### 12. Infrastructure Baseline

[STATE][URB-500] city_energy_service = "stable_continuous".
[STATE][URB-510] infrastructure_resilience = "redundant_procedural_recovery".
[STATE][URB-520] water_service_continuity = true.
[STATE][URB-530] air_filtration_microclimate_layer = "present_selective".

### 13. Maintenance and Service Layer

[STATE][URB-540] city_maintenance_mode = "scheduled_with_priority_exemptions".
[STATE][URB-550] city_operations_telemetry = "continuous_on_critical_nodes__patchy_elsewhere".
[STATE][URB-560] service_agents = ["human_crews", "semi_autonomous_machines", "inspection_drones_limited"].
[STATE][URB-570] service_domains = ["cleaning", "repair", "delivery", "inspection"].
[STATE][URB-580] maintenance_visibility = "persistent_low_grade".

### 14. Transport and Mobility

[STATE][URB-590] urban_transport_automation = "high_on_trunks__partial_elsewhere".
[STATE][URB-600] public_transport_mode = "scheduled_with_dynamic_adjustments".
[STATE][URB-610] semi_public_mobility = ["shuttles", "carshare_pools", "service_capsules_limited"].
[STATE][URB-620] private_transport_necessity = "situational".
[STATE][URB-630] private_vehicle_share = "significant_but_declining".
[STATE][URB-640] manual_driving_mass_norm = "allowed_but_constrained".
[STATE][URB-650] street_space_managed = true.
[STATE][URB-660] mobility_predictability = "high_systemic__medium_local".

### 15. Public Space and Access Control

[STATE][URB-670] access_control = "situational_procedural".
[STATE][URB-680] public_spaces_safety = "high_predictability__low_violence".
[STATE][URB-690] access_levels = ["LEVEL-LOW", "LEVEL-MID", "LEVEL-HIGH"].
[STATE][URB-700] access_level_is_social_hierarchy = false.
[STATE][URB-710] privacy_mode = "protected_logged".
[STATE][URB-720] social_conflict_visibility = "managed_not_erased".
[STATE][URB-730] informal_use_tolerated = "within_predictable_bounds".

### 16. Interface Layer

[STATE][URB-740] environment_interfaces = "mostly_hidden".
[STATE][URB-750] user_ui_visual_requirement = false.
[STATE][URB-760] physical_screens_requirement = false.
[STATE][URB-770] operator_observability = "high_on_critical_nodes__situational_elsewhere".

### 17. Sensory Profile

[STATE][URB-780] ambient_sound = "low_intensity_infrastructure_noise_with_green_absorption".
[STATE][URB-790] sharp_noise_events = "present_localized_managed".
[STATE][URB-800] lighting_adaptive = true.
[STATE][URB-810] city_darkness_default = false.
[STATE][URB-820] indoor_air_smell = "filtered_low_odor".

### 18. Climate Adaptation

[STATE][URB-830] urban_climate_risk = "system_load".
[STATE][URB-840] adaptation_design_targets = ["heat_waves", "extreme_weather"].
[STATE][URB-850] critical_nodes_protection = true.
[STATE][URB-860] crisis_frequency_trend = "extremes_increasing__system_failures_decreasing".
[STATE][URB-870] load_shedding_as_normal = true.
[STATE][URB-880] localized_service_degradation = "expected_under_extremes".

### 19. Visual Code

[STATE][URB-890] baseline_visual_goal = "low_visual_noise__high_legibility".
[STATE][URB-900] visual_noise = "suppressed_in_baseline_layer".
[STATE][URB-910] facade_expressivity = "secondary_to_maintenance_and_thermal_rules".
[STATE][URB-920] palette_driver = ["thermal", "maintenance", "replacement_cycles", "green_integration"].
[STATE][URB-930] facade_decor = "restricted".
[STATE][URB-940] interior_decor = "allowed".

## USAGE / RESOLUTION

[DECISION][URB-950] This document provides declarative properties of the urban environment (LEVEL-MID defaults).
[DECISION][URB-960] Scenes MUST emphasize legibility of regulation and serviceability; visual variation appears as
  asynchronous implementation layers under stable contracts.

## OUTPUT CONTRACT

~~~yaml
doc_id: SSOT-URBANISM-A-2215-0007
role_type: STATE
export:
  - metric: urban_population_share_percent
    owner_domain: URBANISM
    values:
      core: 82
      p90: none
      range: [80, 85]
    unit: percent
  - metric: parks_presence
    owner_domain: URBANISM
    values:
      core: selective_designated
      p90: none
      range: none
    allowed: [selective_designated, pervasive_integrated]
    unit: none
  - metric: daily_green_exposure
    owner_domain: URBANISM
    values:
      core: non_guaranteed
      p90: none
      range: none
    allowed: [non_guaranteed, baseline_expected]
    unit: none
  - metric: city_operations_telemetry
    owner_domain: URBANISM
    values:
      core: continuous_on_critical_nodes__patchy_elsewhere
      p90: none
      range: none
    unit: none
  - metric: city_maintenance_mode
    owner_domain: URBANISM
    values:
      core: scheduled_with_priority_exemptions
      p90: none
      range: none
    unit: none
  - metric: infrastructure_resilience
    owner_domain: URBANISM
    values:
      core: redundant_procedural_recovery
      p90: none
      range: none
    unit: none
  - metric: urban_transport_automation
    owner_domain: URBANISM
    values:
      core: high_on_trunks__partial_elsewhere
      p90: none
      range: none
    unit: none
  - metric: public_transport_mode
    owner_domain: URBANISM
    values:
      core: scheduled_with_dynamic_adjustments
      p90: none
      range: none
    unit: none
  - metric: private_transport_necessity
    owner_domain: URBANISM
    values:
      core: situational
      p90: none
      range: none
    unit: none
  - metric: manual_driving_mass_norm
    owner_domain: URBANISM
    values:
      core: allowed_but_constrained
      p90: none
      range: none
    unit: none
  - metric: crisis_frequency_trend
    owner_domain: URBANISM
    values:
      core: extremes_increasing__system_failures_decreasing
      p90: none
      range: none
    unit: none
  - metric: public_spaces_safety
    owner_domain: URBANISM
    values:
      core: high_predictability__low_violence
      p90: none
      range: none
    unit: none
  - metric: facade_decor
    owner_domain: URBANISM
    values:
      core: restricted
      p90: none
      range: none
    unit: none
~~~

## FORBIDDEN

[FORBIDDEN][URB-970] Introducing new world metrics outside SSOT.
[FORBIDDEN][URB-980] Describing slums or chaotic decor in LEVEL-MID baseline layer as mass norm.
[FORBIDDEN][URB-990] Using narrative logic to replace SSOT state.

## NON-NORMATIVE

~~~text
This document encodes global (Scenario A) urban defaults and constraints.
City-specific choices (e.g., pervasive greenery) must live in BASELINE-URBANISM-* documents.
~~~
~~~
</file>

</architecture_docs>
