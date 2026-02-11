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
