---
id: SCENE-ACT-RU-2215-0002
title: >
  SCENE-CARDS — Акт II (Главы 11–15) —
  логистика расширяет кейс → первые контуры экстерриториальных режимов
class: scene
status: fixed
version: 1.1.0
inputs:
  - BASELINE-PHYSICALLEVELMID-2215-0001
  - CANON-BASE-RULE-GLOBAL-2215-0001
  - CANON-CONFLICT-GLOBAL-2215-0001
  - CANON-SYSTEMS-GLOBAL-2215-0001
  - PLAN-STORY-2215-0001
depends_on:
  - SCENE-ACT-RU-2215-0001
scope: >
  Полный комплект SCENE-CARDS для Акта II (главы 11–15): расширение кейса через логистику,
  проявление институциональных границ и первых экстерриториальных контуров; рост ставок
  и давления наблюдаемости. Без художественного текста.
---

## LLM-INTENT

ROLE_TYPE: INDEX
SCOPE: machine-readable scene cards for Act II as TYPE C inputs (no prose).
SCENE_FORMAT: scene_cards_kvline_v1
INPUTS: [BASELINE-PHYSICALLEVELMID-2215-0001, CANON-BASE-RULE-GLOBAL-2215-0001, CANON-CONFLICT-GLOBAL-2215-0001, CANON-SYSTEMS-GLOBAL-2215-0001, PLAN-STORY-2215-0001]
OUTPUTS: [scene_card_records]
FORBIDDEN: [prose, new_world_facts, new_macro_numbers, non-canon terminology, gap_filling, meta_diegesis]

## DEFINITIONS

[FACT][SCA2-DEF-010] `scene_card` = record fields: scene_id, chapter_id, time, where, pov, goal, measurable, artifact, cmc, output, hook, tags.
[FACT][SCA2-DEF-011] `cmc` = CAUSE → MECHANISM → CONSEQUENCE (single-line, procedural).
[FACT][SCA2-DEF-012] `measurable` = key=value list; numeric values MUST carry units when applicable.
[FACT][SCA2-DEF-013] `artifact` = CD|EL|CM|FM|RP|PRS|none plus subtype in parentheses.

## RULES

[DECISION][SCA2-RUL-010] No художественный текст; cards are operational scaffolding only.
[DECISION][SCA2-RUL-011] Each card MUST include: where, pov, goal, measurable, artifact, cmc, output, hook.
[DECISION][SCA2-RUL-012] Measurables MUST be traceable to baseline/override/artifact if they become plot-critical.
[DECISION][SCA2-RUL-020] Placeholder ellipsis ("..."/"…") is forbidden in cards; use UNKNOWN or omit the field.

## CONTENT

### CH-11 — Re-sorting

[FACT][SCA2-CH11-001] scene_id=SC-11.1; chapter_id=CH-11; time="10:00 (Peak)"; where="Central logistics hub"; pov="Analyst"; goal="show scale & priority power"; measurable="throughput=18.2k_containers/h; SLA=99.2%"; artifact="CM(priority_matrix: health/energy/security tiers)"; cmc="optimize throughput → flow redistribution → local shortages without 'errors'"; output="proved: algorithm decides"; hook="sensors/controllers downgraded in priority"; tags="industrial, restless, noise".
[FACT][SCA2-CH11-002] scene_id=SC-11.2; chapter_id=CH-11; time="10:45 (Peak)"; where="Logistics dispatcher console"; pov="Leader"; goal="find manual trace, not statistics"; measurable="manual_route_overrides=1"; artifact="EL(override_record + executor_id)"; cmc="manual intervention → shipment leaves schedule → nodes under-supplied"; output="concrete thread appears"; hook="rewritten 'by center directive'"; tags="investigation, flow".
[FACT][SCA2-CH11-003] scene_id=SC-11.3; chapter_id=CH-11; time="11:15 (Day)"; where="Bridges/corridors above node"; pov="Leader"; goal="fix ‘machine of scale’ in one beat"; measurable="noise=68dB; wind=15m/s"; artifact="CD(background movement telemetry/contours)"; cmc="scale → control distance → local executors powerless"; output="tone held"; hook="routing center access closed to region"; tags="wind, height, void".

### CH-12 — City over City

[FACT][SCA2-CH12-001] scene_id=SC-12.1; chapter_id=CH-12; time="18:30 (Sunset)"; where="Multi-level sky-links between megablocks"; pov="Field"; goal="architecture as transport + blind-zone generator"; measurable="transport_level=+40; traffic_flow=0.74"; artifact="CD(level-route map / wayfinding layer)"; cmc="vertical density → accelerated corridors → shadow routes emerge"; output="environment becomes case participant"; hook="containers move via upper corridor"; tags="traffic, vertical, restless".
[FACT][SCA2-CH12-002] scene_id=SC-12.2; chapter_id=CH-12; time="19:00 (Dusk)"; where="Public square / media facade"; pov="Analyst"; goal="pop-culture as derivative of data"; measurable="energy_flow_viz=real_time"; artifact="CD(public data installation: city ‘breath’)"; cmc="city telemetry → artistic broadcast → culture from infrastructure"; output="world feels alive"; hook="energy spike coincides with missing shipment"; tags="media, neon, flow".
[FACT][SCA2-CH12-003] scene_id=SC-12.3; chapter_id=CH-12; time="20:00 (Evening)"; where="OSA / link briefing"; pov="Leader"; goal="synthesis: regional level exhausted"; measurable="nodes=3; supplier=1; routing_center=1"; artifact="CM(link graph export)"; cmc="management concentration → single point → region lacks authority"; output="framed as 'above us'"; hook="need federal license registry access"; tags="briefing, office, restless".

### CH-13 — Witness

[FACT][SCA2-CH13-EXTRA] scene_id=SC-13.0; chapter_id=CH-13; time="20:30 (Evening)"; where="Квартира Лейсан (Жилой массив 'Sunlight')"; pov="Лейсан"; goal="попытка нормальности"; measurable="stress_level=high; conversation_depth=shallow"; artifact="none"; cmc="парень спрашивает про работу → она не может рассказать детали (NDA) → стена молчания"; output="разрыв между мирами"; hook="Парень: 'Ты снова там, а не здесь'"; tags="home, romance, velvet".
[FACT][SCA2-CH13-001] scene_id=SC-13.1; chapter_id=CH-13; time="22:15 (Night)"; where="Contractor tech yard"; pov="Field"; goal="find human link in chain"; measurable="night_adjustments=true; observability_gap=11m"; artifact="EL(technician tablet local cache)"; cmc="verbal directives → manual route edits → reports stay clean"; output="witness + mechanism appear"; hook="contract fear"; tags="stealth, shadow, velvet".
[FACT][SCA2-CH13-002] scene_id=SC-13.2; chapter_id=CH-13; time="22:45 (Night)"; where="Stairwell / narrow corridor"; pov="Leader"; goal="extract exact ID without threats/pose"; measurable="id_transfer=true"; artifact="EL(container_or_flight_id transfer record)"; cmc="fear → cooperation → precise route"; output="trace becomes verifiable"; hook="destination=accelerated_regime/extraterritory"; tags="intimidation, noir, velvet".
[FACT][SCA2-CH13-003] scene_id=SC-13.3; chapter_id=CH-13; time="23:30 (Night)"; where="OSA / registry lookup"; pov="Analyst"; goal="jurisdiction collision"; measurable="license_scope=federal; regional_competence=limited"; artifact="EL(state license registry entry)"; cmc="license issued by center → region cannot act → dead end"; output="need federal warrant/signature"; hook="without Moscow loop won't close"; tags="bureaucracy, deadlock, restless".

### CH-14 — Club “Contour”

[FACT][SCA2-CH14-001] scene_id=SC-14.1; chapter_id=CH-14; time="01:15 (Deep Night)"; where="Underground club / repurposed parking"; pov="Leader"; goal="meet informant + cultural layer"; measurable="BPM=122; SPL=96dB"; artifact="CD(fixed set record: non-adaptive)"; cmc="people choose fixed form → collective rhythm → human layer near algorithms"; output="pop-layer integrated"; hook="informant carries critical dump"; tags="club, bass, kinetic".
[FACT][SCA2-CH14-002] scene_id=SC-14.2; chapter_id=CH-14; time="01:45 (Deep Night)"; where="Edge of hall / technical corner"; pov="Leader"; goal="key fact: how ‘clean reports’ are made"; measurable="observability_gap=11m; aligns_with=preaudit_cleanup"; artifact="EL(dump: model seed/version or local decision cache)"; cmc="pre-audit edits → perfect reporting → harm exported beyond KPI"; output="provable evasion mechanism"; hook="major convoy departs tomorrow"; tags="secret, corner, velvet".
[FACT][SCA2-CH14-003] scene_id=SC-14.3; chapter_id=CH-14; time="02:10 (Deep Night)"; where="Exit / night air"; pov="Field"; goal="switch to operation mode"; measurable="time_to_convoy_start=7h"; artifact="CD(convoy route)"; cmc="data obtained → physical evidence needed → interception plan"; output="operation inevitable"; hook="security is private, 'not regional'"; tags="street, cold, restless".

### CH-15 — Convoy 7-Delta

[FACT][SCA2-CH15-001] scene_id=SC-15.1; chapter_id=CH-15; time="04:30 (Pre-dawn)"; where="Upper autonomous corridor (agglomeration)"; pov="Field"; goal="deploy operation; set time window"; measurable="block_window=150s"; artifact="CD(stop mandate/authorization)"; cmc="suspicious route → stop → conflict with private security"; output="contact; disruption risk"; hook="attempt to pull vehicles out of window"; tags="highway, ambush, kinetic".
[FACT][SCA2-CH15-002] scene_id=SC-15.2; chapter_id=CH-15; time="04:40 (Pre-dawn)"; where="Container perimeter"; pov="Leader"; goal="short hard action, no heroism"; measurable="duration=45–60s"; artifact="CD(coercion use record)"; cmc="resistance → neutralization → perimeter control"; output="access to cargo"; hook="not just metal inside"; tags="breach, action, kinetic".
[FACT][SCA2-CH15-003] scene_id=SC-15.3; chapter_id=CH-15; time="05:00 (Dawn)"; where="Opening / primary identification"; pov="Analyst"; goal="federal-scale evidence"; measurable="label=accelerated_regime; license_scope=federal"; artifact="EL(RFID + license token / route ID)"; cmc="shipment goes to special regime → region not competent → federal warrant required"; output="formal need for Moscow contour"; hook="Act II end: Moscow is unavoidable"; tags="revelation, fog, void".

## USAGE / RESOLUTION

[DECISION][SCA2-USE-010] This document is TYPE C (scene inputs). Statements herein are CARD records, not world facts.
[DECISION][SCA2-USE-020] The prose engine may only consume data declared in OUTPUT CONTRACT.
[DECISION][SCA2-USE-030] Any missing/UNKNOWN values must remain UNKNOWN (no invention).

## OUTPUT CONTRACT

~~~yaml
EXPORTS:
  - scene_card_records:
      source_section: "## CONTENT"
      container: "kvline_semicolon"
      record_start_pattern: '^\\[FACT\\]\\[SCA2-CH[0-9]{2}-[0-9]{3}\\]\s+scene_id=SC-[0-9]{2}\.[0-9]+;'
      required_fields: ["scene_id","chapter_id","time","where","pov","goal","measurable","artifact","cmc","output","hook","tags"]
      field_patterns:
        scene_id: 'scene_id=SC-[0-9]{2}\.[0-9]+'
        chapter_id: 'chapter_id=CH-[0-9]{2}'
        time: 'time="[^"]+"'
        where: 'where="[^"]+"'
        pov: 'pov="[^"]+"'
        goal: 'goal="[^"]+"'
        measurable: 'measurable="[^"]*"'
        artifact: 'artifact="[^"]+"'
        cmc: 'cmc="[^"]+"'
        output: 'output="[^"]+"'
        hook: 'hook="[^"]+"'
        tags: 'tags="[^"]+"'
READER:
  - ignore all sections outside exported blocks
~~~

## FORBIDDEN

[FORBIDDEN][SCA2-FBD-010] Treat scene card items as new SSOT/baseline facts.
[FORBIDDEN][SCA2-FBD-020] Fill in unspecified instruments/locations/actors not present in corpus STATE/ENTITIES/PROCEDURES.
[FORBIDDEN][SCA2-FBD-030] Emit any doc ids, file paths, YAML tokens, or protocol/spec/registry terms in diegetic prose.

## NON-NORMATIVE

(empty)