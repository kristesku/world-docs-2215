---
id: CANON-VIBE-ROUTER-GLOBAL-2215-0001
title: >
  Atmosphere Auto-Router — Deterministic Vibe Selection (Global 2215)
class: canon
status: draft
version: 1.0.0
prefix: VRO
doc_language: ru-RU
prose_language: ru-RU
inputs:
  - CANON-VIBE-FLOW-GLOBAL-2215-0001
  - CANON-VIBE-KINETIC-GLOBAL-2215-0001
  - CANON-VIBE-RESTLESS-GLOBAL-2215-0001
  - CANON-VIBE-VELVET-GLOBAL-2215-0001
  - CANON-VIBE-VOID-GLOBAL-2215-0001
depends_on:
  - SPEC-DOC-ID-2215-0001
  - SPEC-DOC-STYLE-2215-0001
  - SPEC-PRIORITY-RESOLUTION-2215-0001
scope: >
  RULE-канон для автоматического выбора атмосферного профиля (VIBE) на основе
  метаданных сцены, если VIBE не задан явно. Алгоритм детерминированный:
  FIRST_MATCH_WINS по фиксированному стеку приоритетов. Документ не вводит
  SSOT-метрики и не подменяет правила конкретных VIBE-доков.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: deterministically derive effective_vibe when scene.tag.VIBE is not explicitly set
INPUTS: [scene.tag.VIBE, scene.tag.ZONE, scene.tag.TYPE, scene.tag.STATE, scene.tag.EVENT, scene.context, scene.inputs]
OUTPUTS: [effective_vibe, router_priority_stack, vibe_doc_id_map]
FORBIDDEN: [ambiguous_selection, multiple_vibes_active, heuristic_guessing, freeform_tags]

## DEFINITIONS

[FACT][VRO-010] `defined_token(x)` = PASS IFF `x` exists AND `x != ""`; ELSE FAIL.
[FACT][VRO-020] `effective_vibe` = результирующий VIBE-токен сцены (ровно один).
[FACT][VRO-030] `vibe_token` ∈ {"VOID","KINETIC","VELVET","FLOW","RESTLESS"}.
[FACT][VRO-040] `vibe_doc_id` ∈ {"CANON-VIBE-VOID-GLOBAL-2215-0001","CANON-VIBE-KINETIC-GLOBAL-2215-0001","CANON-VIBE-VELVET-GLOBAL-2215-0001","CANON-VIBE-FLOW-GLOBAL-2215-0001","CANON-VIBE-RESTLESS-GLOBAL-2215-0001"}.
[FACT][VRO-050] `router_mode` ∈ {"EXPLICIT_TAG","EXPLICIT_INPUT","AUTO"}.
[FACT][VRO-060] `has_any_vibe_doc_input(scene.inputs)` = PASS IFF ∃d∈scene.inputs: d ∈ vibe_doc_id; ELSE FAIL.
[FACT][VRO-070] `vibe_doc_inputs_count(scene.inputs)` = количество элементов d∈scene.inputs, где d ∈ vibe_doc_id.

[FACT][VRO-080] `router_mode(scene)` = "EXPLICIT_TAG" IFF defined_token(scene.tag.VIBE).
  "EXPLICIT_INPUT" IFF NOT defined_token(scene.tag.VIBE) AND vibe_doc_inputs_count(scene.inputs) == 1.
  "AUTO" IFF NOT defined_token(scene.tag.VIBE) AND vibe_doc_inputs_count(scene.inputs) == 0.

[FACT][VRO-090] `void_match(scene)` = PASS IFF
  (defined_token(scene.tag.ZONE) AND scene.tag.ZONE ∈ {"DEEP_ZONE","FORBIDDEN_ZONE","ABANDONED_NODE"})
  OR (defined_token(scene.tag.TYPE) AND scene.tag.TYPE ∈ {"HORROR","ISOLATION","COLLAPSE","AWE"})
  OR (defined_token(scene.tag.EVENT) AND scene.tag.EVENT ∈ {"FATAL_LOSS","IRREVERSIBLE_ERROR","MEGASTRUCTURE_BREATH"}); ELSE FAIL.

[FACT][VRO-100] `kinetic_match(scene)` = PASS IFF
  defined_token(scene.context) AND (scene.context intersects {"NIGHT_TRANSIT","HIGH_AUTOMATION_DENSITY","CLUB","TECH_TRANCE"}); ELSE FAIL.

[FACT][VRO-110] `velvet_match(scene)` = PASS IFF
  (defined_token(scene.tag.TYPE) AND scene.tag.TYPE ∈ {"INTIMACY","SEDUCTION","CONFESSION","RECOVERY","TRUST_ENGINEERING"})
  OR (defined_token(scene.tag.STATE) AND scene.tag.STATE ∈ {"EMOTIONAL_OPENNESS","SEDATION","CONTROLLED_TRUST"})
  OR (defined_token(scene.tag.ZONE) AND scene.tag.ZONE ∈ {"SAFE_HOUSE","VIP_SECTOR","BLIND_ZONE"}); ELSE FAIL.

[FACT][VRO-120] `flow_match(scene)` = PASS IFF
  defined_token(scene.context) AND (scene.context intersects {"INSIGHT","DEDUCTION","EXECUTION","REFLECTION","PLANNING","CREATION","CODING"}); ELSE FAIL.

## INVARIANTS

[RULE][VRO-200] PASS IFF effective_vibe ∈ {"VOID","KINETIC","VELVET","FLOW","RESTLESS"}; ELSE FAIL.
[RULE][VRO-210] PASS IFF router_mode(scene) ∈ {"EXPLICIT_TAG","EXPLICIT_INPUT","AUTO"}; ELSE FAIL.
[RULE][VRO-220] PASS IFF vibe_doc_inputs_count(scene.inputs) ∈ [0,1]; ELSE FAIL.
[RULE][VRO-230] PASS IFF NOT (defined_token(scene.tag.VIBE) AND has_any_vibe_doc_input(scene.inputs)); ELSE FAIL.

## CONTENT

### 1) Router priority stack and doc mapping

~~~yaml
router_priority_stack:
  - VOID
  - KINETIC
  - VELVET
  - FLOW
  - RESTLESS

vibe_doc_id_map:
  VOID: CANON-VIBE-VOID-GLOBAL-2215-0001
  KINETIC: CANON-VIBE-KINETIC-GLOBAL-2215-0001
  VELVET: CANON-VIBE-VELVET-GLOBAL-2215-0001
  FLOW: CANON-VIBE-FLOW-GLOBAL-2215-0001
  RESTLESS: CANON-VIBE-RESTLESS-GLOBAL-2215-0001
~~~

### 2) Explicit selection (tag)

[RULE][VRO-300] IF router_mode(scene) == "EXPLICIT_TAG" THEN PASS IFF effective_vibe == scene.tag.VIBE; ELSE FAIL.
[RULE][VRO-310] IF router_mode(scene) == "EXPLICIT_TAG" THEN PASS IFF scene.tag.VIBE ∈ {"VOID","KINETIC","VELVET","FLOW","RESTLESS"}; ELSE FAIL.

### 3) Explicit selection (scene.inputs)

[RULE][VRO-320] IF router_mode(scene) == "EXPLICIT_INPUT" THEN PASS IFF ("CANON-VIBE-VOID-GLOBAL-2215-0001" IN scene.inputs) IMPLIES (effective_vibe == "VOID"); ELSE FAIL.
[RULE][VRO-330] IF router_mode(scene) == "EXPLICIT_INPUT" THEN PASS IFF ("CANON-VIBE-KINETIC-GLOBAL-2215-0001" IN scene.inputs) IMPLIES (effective_vibe == "KINETIC"); ELSE FAIL.
[RULE][VRO-340] IF router_mode(scene) == "EXPLICIT_INPUT" THEN PASS IFF ("CANON-VIBE-VELVET-GLOBAL-2215-0001" IN scene.inputs) IMPLIES (effective_vibe == "VELVET"); ELSE FAIL.
[RULE][VRO-350] IF router_mode(scene) == "EXPLICIT_INPUT" THEN PASS IFF ("CANON-VIBE-FLOW-GLOBAL-2215-0001" IN scene.inputs) IMPLIES (effective_vibe == "FLOW"); ELSE FAIL.
[RULE][VRO-360] IF router_mode(scene) == "EXPLICIT_INPUT" THEN PASS IFF ("CANON-VIBE-RESTLESS-GLOBAL-2215-0001" IN scene.inputs) IMPLIES (effective_vibe == "RESTLESS"); ELSE FAIL.

### 4) Auto routing (FIRST_MATCH_WINS)

[RULE][VRO-400] IF router_mode(scene) == "AUTO" AND void_match(scene) THEN PASS IFF effective_vibe == "VOID"; ELSE PASS.
[RULE][VRO-410] IF router_mode(scene) == "AUTO" AND NOT void_match(scene) AND kinetic_match(scene) THEN PASS IFF effective_vibe == "KINETIC"; ELSE PASS.
[RULE][VRO-420] IF router_mode(scene) == "AUTO" AND NOT void_match(scene) AND NOT kinetic_match(scene) AND velvet_match(scene) THEN PASS IFF effective_vibe == "VELVET"; ELSE PASS.
[RULE][VRO-430] IF router_mode(scene) == "AUTO" AND NOT void_match(scene) AND NOT kinetic_match(scene) AND NOT velvet_match(scene) AND flow_match(scene) THEN PASS IFF effective_vibe == "FLOW"; ELSE PASS.
[RULE][VRO-440] IF router_mode(scene) == "AUTO" AND NOT void_match(scene) AND NOT kinetic_match(scene) AND NOT velvet_match(scene) AND NOT flow_match(scene) THEN PASS IFF effective_vibe == "RESTLESS"; ELSE FAIL.

### 5) Activation contract (how to consume)

[RULE][VRO-500] IF effective_vibe == "VOID" THEN active_vibe_doc_id MUST be "CANON-VIBE-VOID-GLOBAL-2215-0001"; ELSE PASS.
[RULE][VRO-510] IF effective_vibe == "KINETIC" THEN active_vibe_doc_id MUST be "CANON-VIBE-KINETIC-GLOBAL-2215-0001"; ELSE PASS.
[RULE][VRO-520] IF effective_vibe == "VELVET" THEN active_vibe_doc_id MUST be "CANON-VIBE-VELVET-GLOBAL-2215-0001"; ELSE PASS.
[RULE][VRO-530] IF effective_vibe == "FLOW" THEN active_vibe_doc_id MUST be "CANON-VIBE-FLOW-GLOBAL-2215-0001"; ELSE PASS.
[RULE][VRO-540] IF effective_vibe == "RESTLESS" THEN active_vibe_doc_id MUST be "CANON-VIBE-RESTLESS-GLOBAL-2215-0001"; ELSE PASS.

## USAGE / RESOLUTION

[DECISION][VRO-600] Router MUST be evaluated before prose generation and before applying vibe constraints; ELSE FAIL.
[DECISION][VRO-610] IF router_mode(scene) == "EXPLICIT_TAG" OR router_mode(scene) == "EXPLICIT_INPUT" THEN AUTO routing MUST NOT be applied; ELSE PASS.
[DECISION][VRO-620] Conflicts between vibe docs MUST be prevented by VRO-220 and VRO-230; ELSE FAIL.
[DECISION][VRO-630] Conflict resolution between documents MUST follow SPEC-PRIORITY-RESOLUTION-2215-0001; ELSE FAIL.

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-VIBE-ROUTER-GLOBAL-2215-0001
role_type: RULE
export:
  - rule_id: VRO-080
    intent: "define router_mode(scene) selection: EXPLICIT_TAG | EXPLICIT_INPUT | AUTO"
    inputs: [scene.tag.VIBE, scene.inputs]
    outputs: [router_mode]
  - rule_id: VRO-220
    intent: "enforce single vibe doc in scene.inputs (0..1)"
    inputs: [scene.inputs]
    outputs: [vibe_selection_validity]
  - rule_id: VRO-400
    intent: "auto-route to VOID if void_match is true"
    inputs: [scene.tag.ZONE, scene.tag.TYPE, scene.tag.EVENT, scene.tag.VIBE, scene.inputs]
    outputs: [effective_vibe]
  - rule_id: VRO-410
    intent: "auto-route to KINETIC if VOID does not match and kinetic_match is true"
    inputs: [scene.context, scene.tag.VIBE, scene.inputs]
    outputs: [effective_vibe]
  - rule_id: VRO-420
    intent: "auto-route to VELVET if higher matches fail and velvet_match is true"
    inputs: [scene.tag.ZONE, scene.tag.TYPE, scene.tag.STATE, scene.tag.VIBE, scene.inputs]
    outputs: [effective_vibe]
  - rule_id: VRO-430
    intent: "auto-route to FLOW if higher matches fail and flow_match is true"
    inputs: [scene.context, scene.tag.VIBE, scene.inputs]
    outputs: [effective_vibe]
  - rule_id: VRO-440
    intent: "default route to RESTLESS if no match"
    inputs: [scene.tag.VIBE, scene.inputs, scene.context]
    outputs: [effective_vibe]
  - rule_id: VRO-500
    intent: "map effective_vibe to active_vibe_doc_id"
    inputs: [effective_vibe]
    outputs: [active_vibe_doc_id]
~~~

## FORBIDDEN

[FORBIDDEN][VRO-900] Returning more than one effective_vibe for a single scene.
[FORBIDDEN][VRO-910] Applying AUTO routing when router_mode(scene) != "AUTO".
[FORBIDDEN][VRO-920] Using freeform vibe tokens outside {"VOID","KINETIC","VELVET","FLOW","RESTLESS"}.
[FORBIDDEN][VRO-930] Allowing more than one vibe doc in scene.inputs.

## NON-NORMATIVE

~~~text
Notes (non-normative):
- Router selects effective_vibe only. Each VIBE doc still enforces its own gates.
- If scene lacks scene.context and lacks VOID/VELVET tag evidence, AUTO defaults to RESTLESS deterministically.
~~~
