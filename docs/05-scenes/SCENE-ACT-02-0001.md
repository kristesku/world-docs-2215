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
