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
