---
id: CANON-LOC-CHELNY-2215-0001
title: >
  RU 2215 — Naberezhnye Chelny: Sensory Profile, Everyday Interfaces, and “Maintenance Dirt” (Scene Canon)
class: canon
status: draft
version: 0.2.0
inputs:
  - CANON-CITY-RU-2215-0007
  - CANON-CITY-BOUNDARY-RU-2215-0008
  - BASELINE-PHYSICAL-LEVEL-MID-2215-0001
  - SSOT-URBANISM-A-2215-0007
depends_on:
  - SSOT-DOC-STYLE-2215-0001
  - CANON-BASE-0001
scope: >
  Scene-level canonical RULES for RU-16/CHELNY (2215): sensory defaults
  (light/air/smell/sound/materials), how infrastructure contours surface
  without infodump, and how to show “dirt of stability” (limits, access,
  maintenance) without noir clichés or utopia sterility.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: scene defaults for Chel(n)y 2215 sensory + infrastructure cues (non-noir, non-utopia)
INPUTS: [CANON-CITY-RU-2215-0007, CANON-CITY-BOUNDARY-RU-2215-0008, BASELINE-PHYSICAL-LEVEL-MID-2215-0001, SSOT-URBANISM-A-2215-0007]
OUTPUTS: [sensory_defaults, allowed_scene_markers, infrastructure_cue_rules, anchor_snippet_pool, open_items]
FORBIDDEN: [gotham_noir_defaults, sterile_utopia, infodump_explanations, total_surveillance_assumption, plastic_futurism]
 
## DEFINITIONS

[RULE][CHELNY-DEF-001] term.sensory_marker = a short, concrete sensory cue (smell/sound/light/tactile) used to imply a system contour.
[RULE][CHELNY-DEF-002] term.contour = an operational system layer (energy, logistics, observability, access, audit) visible only via artifacts/cues.
[RULE][CHELNY-DEF-003] term.maintenance_dirt = non-poverty wear: seals, service seams, temporary routing, “sealed/closed” signage, frequent maintenance traces.
[RULE][CHELNY-DEF-004] term.scene_anchor_snippet = 1–2 sentences that can be inserted without explanation; must imply contour or human cost.

## INVARIANTS

[RULE][CHELNY-INV-001] Chel(n)y 2215 baseline MUST be functional 24/7 (LEVEL-MID default) unless scene explicitly activates an incident contour.
[RULE][CHELNY-INV-002] Sensory tone MUST be “mature infrastructure discipline” (scale + matte + procedural cues), not “noir weather aesthetic”.
[RULE][CHELNY-INV-003] Any atmospheric detail MUST imply either (a) a contour, or (b) a human cost of allocation/procedure.
[RULE][CHELNY-INV-004] “Comfort baseline” MUST hold: бытовые контуры комфортны; конфликт = allocation-under-constraints (windows/tier/access/KPI), not survival poverty.

## CONTENT

### A. Light (default)

[RULE][CHELNY-010] Default exterior light MUST be diffuse (overcast / scattered), low-contrast; sharp shadows MUST NOT be default.
[RULE][CHELNY-011] Interior light MUST be layered: (a) base ambient + (b) local procedural/task pools (work zones, terminals, checkpoints).
[RULE][CHELNY-012] Night lighting MUST be “low-glare infrastructure”: contour/path highlighting > advertisement spectacle.
[FORBIDDEN][CHELNY-013] Neon-noir lighting as default city identity.

### B. Air / temperature (default)

[RULE][CHELNY-020] Summer air MUST read as “warm but industrial”: теплотa без праздничности; the city feels like it “runs” continuously.
[RULE][CHELNY-021] Indoor air MUST read as “correct but disciplined”: slightly dry conditioning is allowed as a subtle cue.

### C. Smell markers (allowed set)

[RULE][CHELNY-030] Per scene, LLM MUST use smell_markers_count ∈ [0, 2].
[RULE][CHELNY-031] Allowed smell marker set (choose from):
- ozone/electric near power nodes and service corridors;
- warmed composite / polymer shells of infrastructure (not “cheap plastic”);
- river moisture / algae / wet concrete near Kama + service drains;
- dust + warm metal near logistics belts;
- faint cleaning chemistry in shared/public spaces (maintenance regime cue).
[FORBIDDEN][CHELNY-032] Using “stench of decay/rot/garbage” as a default smell identity of the city.

### D. Soundscape (default)

[RULE][CHELNY-040] City sound MUST be low-frequency continuous (distant logistics hum, ventilation/heat-exchange) with rare dry procedural beeps.
[RULE][CHELNY-041] Silence MUST be treated as a signal: IF “silence described” THEN it IMPLIES anomaly/special режим/incident, not normal comfort.
[FORBIDDEN][CHELNY-042] Total cinematic silence as default baseline.

### E. Tactile / materials (default)

[RULE][CHELNY-050] Surfaces MUST be matte, micro-textured, low-slip; “quiet to touch”.
[RULE][CHELNY-051] Metal MUST read as coated/anodized; composites MUST read as deep/structural, not glossy consumer plastic.
[RULE][CHELNY-052] Service seams MUST be visible: access hatches, maintenance joints, sealed panels; city is continuously serviced.

### F. Kama & embankments (water as regime boundary)

[RULE][CHELNY-060] Kama MUST be shown as managed infrastructure, not postcard wilderness (reinforced banks, controlled access pockets).
[RULE][CHELNY-061] Embankments MUST read as routes (movement + service corridors) with sparse “rest pockets”.
[RULE][CHELNY-062] West bank “nature” MUST read as controlled nature: leaving the systemic city → entering regulated nature.
[FORBIDDEN][CHELNY-063] Romantic “wild river” framing as default.

### G. KAMAZ-trace (historical layer → operational node)

[RULE][CHELNY-070] “KAMAZ” reference MUST be a system-layer (historical + infrastructure meta-node), not nostalgia-only decoration.
[RULE][CHELNY-071] Allowed KAMAZ manifestations (choose ≤1 per scene unless plot requires):
- automated production/repair contour (quiet, huge);
- logistics megahub (sorting corridors, service gates);
- museum+active hybrid (public shell + restricted zones).
[RULE][CHELNY-072] Visual cue set for KAMAZ-layer: large spans, calm masses, minimal ornament, many service gates/hatches/routes.

### H. “Maintenance dirt” (show limits without poverty)

[RULE][CHELNY-080] “Dirt” MUST be maintenance_dirt, not slum grime: frequent servicing traces, worn high-traffic spots, temporary fences, reroutes, seals.
[RULE][CHELNY-081] Conflict cues MUST map to allocation/procedure:
- service windows;
- power windows / peak capacity;
- supply classes;
- access tiers;
- audit/legal admissibility gates.
[FORBIDDEN][CHELNY-082] Poverty-as-default framing (“people survive on streets”) unless explicit plot override.

### I. Public space friction (friendly to locals, procedural to visitors)

[RULE][CHELNY-090] Public spaces MUST be safe + maintained; friction MUST be procedural (badges/windows/routing), not violence.
[RULE][CHELNY-091] Visitor perception MUST include at least one of: too big / too procedural / too confident in its rules.
[RULE][CHELNY-092] Street commerce MUST be restrained-functional: service points > festival bazaar.

### J. Mobility (layers, not racing)

[RULE][CHELNY-100] Movement MUST be described as switching layers: pedestrian layer → autonomous mobility layer → service/restricted layer.
[RULE][CHELNY-101] Traffic jams MUST NOT be the primary city feel; primary friction = access/perimeter/window.
[FORBIDDEN][CHELNY-102] Action scenes framed as “car chase culture” baseline.

### K. Observability & privacy (no omniscience)

[RULE][CHELNY-110] Observability MUST be rich-but-fragmented: blind zones exist; aggregation and delay exist; primary logs are gated by procedure.
[RULE][CHELNY-111] In-text observability cues MUST appear as artifacts/constraints:
- “no primary logs, only aggregates”;
- “log window closes in N hours”;
- “requires order / JAP / chain-of-custody”.
[FORBIDDEN][CHELNY-112] Assuming total omniscient surveillance without showing the procedural gates.

### L. Weather

[STATE][LOC-ATM-020] weather_mode = "Soft Grey Comfort".
[STATE][LOC-ATM-021] sky_texture = "Textured Concrete". Небо затянуто фактурными серыми облаками (не грозовыми, а спокойными).
[STATE][LOC-ATM-022] temperature = "Perfect Neutral" (22–24°C). Теплый ветер, отсутствие жары и холода.
[STATE][LOC-ATM-023] vibe = "Deceptive Calm". На улице так приятно, что ужас перед Системой кажется иррациональным.

## USAGE / RESOLUTION

[RULE][CHELNY-USE-001] Scenes set in RU-16/CHELNY MUST apply this doc as default sensory + cue layer unless overridden by SCENE tags or explicit incident contours.
[RULE][CHELNY-USE-002] Precedence for generation MUST follow CANON-BASE-0001:
Override > Scene > Plan > Canon > Baseline > SSOT.
[RULE][CHELNY-USE-003] IF a scene needs “darker tone” THEN apply CHELNY-080/081 (maintenance dirt + allocation), NOT noir weather tropes.
[RULE][CHELNY-USE-004] IF a scene needs “system presence” THEN use CHELNY-040/052/111 cues, NOT exposition paragraphs.

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-LOC-CHELNY-2215-0001
role_type: RULE
export:
  - rule_id: CHELNY-010
    intent: "exterior light default is diffuse/low-contrast"
    inputs: [CANON-CITY-RU-2215-0007]
    outputs: [scene_light_profile]
  - rule_id: CHELNY-030
    intent: "smell markers per scene limited to 0..2 from allowed set"
    inputs: []
    outputs: [smell_marker_pool, smell_marker_count]
  - rule_id: CHELNY-080
    intent: "show maintenance dirt, not poverty or decay"
    inputs: [CANON-BASE-0001]
    outputs: [maintenance_dirt_cues]
  - rule_id: CHELNY-110
    intent: "observability is rich-but-fragmented; must surface via procedural artifacts"
    inputs: [CANON-ORDERS-0003, CANON-SYSTEMS-0001]
    outputs: [observability_cues, artifact_prompts]
open_items:
  - CHELNY-OI-001: "Exact canonical status of KAMAZ-node (prod vs hub vs hybrid) for plot-critical scenes."
  - CHELNY-OI-002: "Seasonal variant: winter sensory profile (only if winter scenes appear)."
  - CHELNY-OI-003: "Which residential districts serve as repeated бытовой baseline for OSA team."
~~~

## FORBIDDEN

[FORBIDDEN][CHELNY-FBD-001] Gotham-noir defaults (constant rain, acid neon, trenchcoat aesthetics) as baseline.
[FORBIDDEN][CHELNY-FBD-002] Sterile utopia framing (no wear, no maintenance, no procedural friction).
[FORBIDDEN][CHELNY-FBD-003] Infodump explanations of systems; contours MUST be implied via cues/artifacts.
[FORBIDDEN][CHELNY-FBD-004] Total surveillance assumption without procedural gates, blind zones, aggregation, or delays.
[FORBIDDEN][CHELNY-FBD-005] Plastic-futurism visual language as default material identity.

## NON-NORMATIVE (optional)

### Anchor snippet pool (examples only; not rules)

- “Матовая поверхность перил тёплая — как будто город всё время чуть подогревает себя изнутри.”
- “В переходе пахнет озоном и моющим — как в серверной, только с людьми.”
- “Над Камой свет рассеянный, а бетон берега выглядит обслуженным, как корпус оборудования.”
- “Вдали гудит контур — не машины, а режим.”
- “Тишина здесь не отдых: тишина означает, что слой отключён.”

### Micro-pattern (cue without explanation)

- “Нет первички, только агрегаты. Окно логов закрывается через 6 часов. Нужен ордер.”
