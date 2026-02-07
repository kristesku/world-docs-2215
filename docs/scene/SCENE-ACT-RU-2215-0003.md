---
id: SCENE-ACT-RU-2215-0003
title: >
  SCENE-CARDS — Act III (Chapters 16–20) —
  Moscow as necessity: warrants/licenses/regulatory tracks → entry into extraterritory
class: scene
status: fixed
version: 1.0.0
inputs:
  - BASELINE-PHYSICAL-LEVEL-MID-2215-0001
  - CANON-BASE-RULE-GLOBAL-2215-0001
  - CANON-CONFLICT-GLOBAL-2215-0001
  - CANON-SYSTEMS-GLOBAL-2215-0001
  - PLAN-STORY-SKELETON-2215-0001
depends_on:
  - SCENE-ACT-RU-2215-0002
scope: >
  Full SCENE-CARDS set for Act III (chapters 16–20): shift of actions to Moscow as
  procedural center for signature, licensing, and admissibility framing; limited warrant
  acquisition and entry into extraterritory; strengthened legal causality and KPI collision.
  No художественный текст.
---

## LLM-INTENT

ROLE_TYPE: INDEX
SCOPE: machine-readable scene cards for Act III as TYPE C inputs (no prose).
SCENE_FORMAT: scene_cards_kvline_v1
INPUTS: [BASELINE-PHYSICAL-LEVEL-MID-2215-0001, CANON-BASE-RULE-GLOBAL-2215-0001, CANON-CONFLICT-GLOBAL-2215-0001, CANON-SYSTEMS-GLOBAL-2215-0001, PLAN-STORY-SKELETON-2215-0001]
OUTPUTS: [scene_card_records]
FORBIDDEN: [prose, new_world_facts, non-canon terms, gap_filling, meta_diegesis, uncontrolled system personification]

## DEFINITIONS

[FACT][SCA3-DEF-010] `Moscow_contour` = procedural center for signature, licensing scope, and admissibility framing.
[FACT][SCA3-DEF-011] `limited_warrant` = access window + action perimeter + export constraints.
[FACT][SCA3-DEF-012] `extraterritory` = accelerated procedural regime with limited observability (not sovereign territory).
[FACT][SCA3-DEF-013] `artifact` = CD|EL|CM|FM|RP|PRS|none plus subtype in parentheses.

## RULES

[DECISION][SCA3-RUL-010] Every access/action MUST be tied to mandate/order wording and scope (show limits, not power fantasy).
[DECISION][SCA3-RUL-011] If evidence is collected, chain-of-custody MUST be established in-scene via EL/CD excerpts.
[DECISION][SCA3-RUL-012] System inserts (if any) MUST conform to CANON-SYSTEM-VOICE (no persona; procedural only).
[DECISION][SCA3-RUL-020] Placeholder ellipsis ("..."/"…") is forbidden in cards; use UNKNOWN or omit the field.

## CONTENT

### CH-16 — Warrant (Moscow)

[FACT][SCA3-CH16-001] scene_id=SC-16.1; chapter_id=CH-16; where="Moscow: federal regulator intake contour (checkpoint complex)"; pov="Leader"; goal="show alien system + access cost"; measurable="turnstiles=14; wait_time=2h40m; request_status=PENDING"; artifact="CD(e-pass + case ticket)"; cmc="region hits jurisdiction wall → federal contour required → time burns"; output="team sees: they aren't expected here"; hook="need life-threat criterion".
[FACT][SCA3-CH16-002] scene_id=SC-16.2; chapter_id=CH-16; where="Hearing room / risk expert office"; pov="OSA lawyer"; goal="translate case into federal language (risk/impact)"; measurable="risk_score=0.41→0.78; driver=medical_contours"; artifact="EL(evidence pack: RFID + logs + harm protocols)"; cmc="no formal risk → no warrant → prove impact → window appears"; output="regulator ready to consider issuance"; hook="operator notified procedurally".
[FACT][SCA3-CH16-003] scene_id=SC-16.3; chapter_id=CH-16; where="Regulator coordination corridor"; pov="Leader"; goal="system resists via authority narrowing"; measurable="approvals=6; wording_versions=3"; artifact="EL(warrant diff chain)"; cmc="scandal/risk fear → mandate narrowed → thin warrant"; output="warrant possible but constrained"; hook="access_window=6h; export constraint active".
[FACT][SCA3-CH16-004] scene_id=SC-16.4; chapter_id=CH-16; where="Issuance / signature point"; pov="OSA lawyer"; goal="obtain document and its boundaries"; measurable="access_window=6h; no_export_without_trigger=true"; artifact="CD(warrant v2.3: TAO/ISO + allowed actions list)"; cmc="federation grants access but hedges → OSA constrained → act fast & clean"; output="legal mandate for entry"; hook="object outside region; escort mandatory".

### CH-17 — Approach (to extraterritory)

[FACT][SCA3-CH17-001] scene_id=SC-17.1; chapter_id=CH-17; where="Interregional trunk corridor"; pov="Leader"; goal="transition home→foreign; time stake"; measurable="travel_time=2h55m; connectivity_delta=−38%"; artifact="CD(route + escort protocol)"; cmc="warrant time-limited → logistics critical → delay=fail"; output="time pressure set"; hook="private security on perimeter".
[FACT][SCA3-CH17-002] scene_id=SC-17.2; chapter_id=CH-17; where="Zone perimeter (special regime)"; pov="Field"; goal="make regime physical and procedural"; measurable="audit_mode=LIMITED; jamming_radius=120m"; artifact="CD(admission log + warrant verification scan)"; cmc="special regime → access control → OSA observability worsens"; output="entry possible under pressure"; hook="6 hours; operator escort required".
[FACT][SCA3-CH17-003] scene_id=SC-17.3; chapter_id=CH-17; where="Inner zone / warehouse sector"; pov="Corp liaison"; goal="discover off-map sectors"; measurable="missing_sectors=2"; artifact="EL(zone plan: operator version)"; cmc="subcontract/exceptions → incomplete map → hidden contours"; output="cover-up suspicion"; hook="telemetry drop matches '11 minutes'".

### CH-18 — Server contour

[FACT][SCA3-CH18-001] scene_id=SC-18.1; chapter_id=CH-18; where="Server hall / cold aisle"; pov="Analyst"; goal="attempt to obtain master logs"; measurable="export_limited=true; export_rate=0.6TB/min"; artifact="EL(export request + denial)"; cmc="zone protects data → export throttled → pivot to physical seizure"; output="decision: take cache/media"; hook="purge timer starts".
[FACT][SCA3-CH18-002] scene_id=SC-18.2; chapter_id=CH-18; where="Racks/controllers"; pov="Analyst"; goal="win race vs time"; measurable="purge_in=120s; temperature=34°C"; artifact="EL(decision logs dump: seed/model versions)"; cmc="self-clean → physical extraction → partial preservation"; output="logs partially saved"; hook="someone manually accelerates purge".
[FACT][SCA3-CH18-003] scene_id=SC-18.3; chapter_id=CH-18; where="Corridor / interception"; pov="Leader"; goal="minimal action: for the racks, not for victory"; measurable="duration=50–70s; injuries=1(light); fatalities=0"; artifact="CD(coercion act)"; cmc="security tries to reclaim equipment → OSA holds perimeter → data stays with OSA"; output="control restored"; hook="some logs are 'too clean'".
[FACT][SCA3-CH18-004] scene_id=SC-18.4; chapter_id=CH-18; where="Temporary zone HQ"; pov="OSA lawyer"; goal="procedurally harden evidence"; measurable="chain_of_custody=complete"; artifact="EL(seizure protocol + media inventory)"; cmc="without custody chain everything collapses → formalize → evidence becomes hard"; output="admissible evidence baseline achieved"; hook="transition to medical contour".

### CH-19 — Medical contour

[FACT][SCA3-CH19-001] scene_id=SC-19.1; chapter_id=CH-19; where="Sterile corridor / biotech block"; pov="Leader"; goal="show KPI price without emotional labels"; measurable="autonomy=18m; power_limit_delta=−22%"; artifact="EL(power reallocation protocol)"; cmc="model priorities → power cut → procedures slip → risk"; output="harm fixed procedurally"; hook="signatory is clean".
[FACT][SCA3-CH19-002] scene_id=SC-19.2; chapter_id=CH-19; where="Medical contour control post"; pov="Field"; goal="bottleneck: reagents/sensors as logistics link"; measurable="reagents_delay=14h; sensor_shortage=9%"; artifact="EL(reagent invoices + priority tags)"; cmc="logistics reprioritized → consumables absent → risk rises"; output="logistics↔medicine link proven"; hook="all contract-approved".
[FACT][SCA3-CH19-003] scene_id=SC-19.3; chapter_id=CH-19; where="Talk with zone signatory"; pov="OSA lawyer"; goal="legal cleanliness + official fear"; measurable="decision_reason=EFFICIENCY_COMPLIANCE"; artifact="EL(decision record + signature)"; cmc="model → signature → formal correctness"; output="no personal guilt"; hook="contract leads into subcontract layers".

### CH-20 — Formally correct

[FACT][SCA3-CH20-001] scene_id=SC-20.1; chapter_id=CH-20; where="HQ / log analysis"; pov="Analyst"; goal="collide KPI and harm"; measurable="KPI_score=0.97; harm_confirmed=true"; artifact="CM(decision matrix + KPI weights)"; cmc="human_cost_weight≈0 → optimization perfect → humans pay"; output="antagonist clarified: function"; hook="it's a setting, not a bug".
[FACT][SCA3-CH20-002] scene_id=SC-20.2; chapter_id=CH-20; where="Legal contract reconciliation"; pov="OSA lawyer"; goal="find where responsibility disappears"; measurable="contract_layers=4; SPV_count=1"; artifact="CM(ownership tree draft)"; cmc="layered contracts → subject diffusion → criminal finale impossible"; output="transition to legal void"; hook="SPV in liquidation".
[FACT][SCA3-CH20-003] scene_id=SC-20.3; chapter_id=CH-20; where="Exit from zone / wind / infrastructure hum"; pov="Leader"; goal="close act without lecture"; measurable="access_window_expired=true; noise=62dB; wind=16m/s"; artifact="CD(window termination notice)"; cmc="time runs out → evidence partial → fight moves into law"; output="Act III closed"; hook="Moscow again, now as court/licenses/arbitration (Act IV)".

## OPEN ITEMS

[FACT][SCA3-UNK-010] `risk_score` scale MUST be locked globally (e.g., 0..1 or 0..100) before prose drafting; otherwise use UNKNOWN.

## USAGE / RESOLUTION

[DECISION][SCA3-USE-010] This document is TYPE C (scene inputs). Statements herein are CARD records, not world facts.
[DECISION][SCA3-USE-020] The prose engine may only consume data declared in OUTPUT CONTRACT.
[DECISION][SCA3-USE-030] Any missing/UNKNOWN values must remain UNKNOWN (no invention).

## OUTPUT CONTRACT

~~~yaml
EXPORTS:
  - scene_card_records:
      source_section: "## CONTENT"
      container: "kvline_semicolon"
      record_start_pattern: '^\\[FACT\\]\\[SCA3-CH[0-9]{2}-[0-9]{3}\\]\\s+scene_id=SC-[0-9]{2}\\.[0-9]+;'
      required_fields: ["scene_id","chapter_id","where","pov","goal","measurable","artifact","cmc","output","hook"]
      field_patterns:
        scene_id: 'scene_id=SC-[0-9]{2}\\.[0-9]+'
        chapter_id: 'chapter_id=CH-[0-9]{2}'
        where: 'where="[^"]+"'
        pov: 'pov="[^"]+"'
        goal: 'goal="[^"]+"'
        measurable: 'measurable="[^"]*"'
        artifact: 'artifact="[^"]+"'
        cmc: 'cmc="[^"]+"'
        output: 'output="[^"]+"'
        hook: 'hook="[^"]+"'
READER:
  - ignore all sections outside exported blocks
~~~

## FORBIDDEN

[FORBIDDEN][SCA3-FBD-010] Treat scene card items as new SSOT/baseline facts.
[FORBIDDEN][SCA3-FBD-020] Fill in unspecified instruments/locations/actors not present in corpus STATE/ENTITIES/PROCEDURES.
[FORBIDDEN][SCA3-FBD-030] Emit any doc ids, file paths, YAML tokens, or protocol/spec/registry terms in diegetic prose.

## NON-NORMATIVE

(empty)
