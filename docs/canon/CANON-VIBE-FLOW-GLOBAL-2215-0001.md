---
id: CANON-VIBE-FLOW-GLOBAL-2215-0001
title: >
  Atmosphere Reference — Nujabes & Logic ("Solar Flow" Profile)
class: canon
status: draft
version: 1.0.1
prefix: FLO
doc_language: ru-RU
prose_language: ru-RU
inputs:
  - CANON-VIBE-RESTLESS-GLOBAL-2215-0001
depends_on:
  - SPEC-DOC-ID-2215-0001
  - SPEC-DOC-STYLE-2215-0001
  - SPEC-PRIORITY-RESOLUTION-2215-0001
scope: >
  RULE-канон для “flow” сцен: инсайт, аккуратное исполнение, ясная рефлексия.
  Документ ограничивает ритм/саундскейп/визуальные маркеры через решаемые
  токены сцены. Без SSOT-метрик и без инфодампа.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: enforce FLOW vibe constraints when scene.vibe == "FLOW"
INPUTS: [CANON-VIBE-RESTLESS-GLOBAL-2215-0001, scene.inputs, scene.vibe, scene.context, scene.directives, scene.sound_markers, scene.visual_markers]
OUTPUTS: [sound_marker_pool, visual_marker_pool, flow_requirements]
FORBIDDEN: [noir_cliches, gritty_bass_dominance, choppy_fragmentation, emotional_monologue_exposition, music_reference_in_prose]

## DEFINITIONS

[FACT][FLO-010] `scene.inputs` = список doc_id, явно подключённых сценой как входы.
[FACT][FLO-011] `scene.vibe` = строковый тег профиля атмосферы сцены.
[FACT][FLO-012] `scene.context` = набор контекстных токенов сцены (UPPER_SNAKE_CASE).
[FACT][FLO-013] `scene.directives` = набор директив генерации сцены (UPPER_SNAKE_CASE).
[FACT][FLO-014] `scene.sound_markers` = список звуковых токенов сцены (UPPER_SNAKE_CASE).
[FACT][FLO-015] `scene.visual_markers` = список визуальных токенов сцены (UPPER_SNAKE_CASE).

## INVARIANTS

[RULE][FLO-020] IF "CANON-VIBE-FLOW-GLOBAL-2215-0001" IN scene.inputs THEN PASS IFF scene.vibe == "FLOW"; ELSE PASS.
[RULE][FLO-030] IF scene.vibe == "FLOW" THEN PASS IFF scene.context intersects {"INSIGHT","EXECUTION","REFLECTION","PLANNING","CREATION"}; ELSE PASS.
[RULE][FLO-040] IF scene.vibe == "FLOW" THEN PASS IFF "NOIR_DEFAULT" NOT IN scene.context; ELSE PASS.

## CONTENT

### A. Pools (normative tokens)

~~~yaml
sound_marker_pool:
  - ORDERED_AMBIENT_TONES
  - SOFT_LOOP_BEAT
  - CLEAN_LOW_END
  - QUIET_TRANSIENTS
  - CONTROLLED_REVERB_SPACE

sound_marker_required:
  - ORDERED_AMBIENT_TONES
  - SOFT_LOOP_BEAT

visual_marker_pool:
  - WARM_REFLECTION_ON_MASS
  - MATTE_STABLE_SURFACES
  - LOW_GLARE_GLASS
  - SUN_AS_REFLECTION_NOT_SPOTLIGHT
  - CLEAN_VOLUME_READABILITY

visual_marker_required:
  - MATTE_STABLE_SURFACES
  - WARM_REFLECTION_ON_MASS

directive_required:
  - SENTENCE_PROFILE_MEDIUM_LONG
  - NO_RHETORICAL_FRAGMENTATION
  - LOGICAL_CHAIN_VISIBLE
  - DIALOGUE_HIGH_SIGNAL_LOW_NOISE
  - SHARED_CONTEXT_NO_EXPOSITION

forbidden_directives:
  - EMOTION_MONOLOGUE_EXPLAINS_INSIGHT
  - MUSIC_REFERENCE_IN_PROSE
  - NOIR_CLICHE_STACK
~~~

### B. Soundscape constraints

[RULE][FLO-110] IF scene.vibe == "FLOW" THEN PASS IFF scene.sound_markers.count ∈ [1,3]; ELSE PASS.
[RULE][FLO-120] IF scene.vibe == "FLOW" THEN PASS IFF every(scene.sound_markers) ∈ sound_marker_pool; ELSE FAIL.
[RULE][FLO-130] IF scene.vibe == "FLOW" THEN PASS IFF "ORDERED_AMBIENT_TONES" IN scene.sound_markers; ELSE FAIL.
[RULE][FLO-140] IF scene.vibe == "FLOW" THEN PASS IFF "SOFT_LOOP_BEAT" IN scene.sound_markers; ELSE FAIL.

### C. Visual constraints

[RULE][FLO-210] IF scene.vibe == "FLOW" THEN PASS IFF scene.visual_markers.count ∈ [1,3]; ELSE PASS.
[RULE][FLO-220] IF scene.vibe == "FLOW" THEN PASS IFF every(scene.visual_markers) ∈ visual_marker_pool; ELSE FAIL.
[RULE][FLO-230] IF scene.vibe == "FLOW" THEN PASS IFF "MATTE_STABLE_SURFACES" IN scene.visual_markers; ELSE FAIL.
[RULE][FLO-240] IF scene.vibe == "FLOW" THEN PASS IFF "WARM_REFLECTION_ON_MASS" IN scene.visual_markers; ELSE FAIL.

### D. Prose/dialogue directives constraints

[RULE][FLO-310] IF scene.vibe == "FLOW" THEN PASS IFF "SENTENCE_PROFILE_MEDIUM_LONG" IN scene.directives; ELSE FAIL.
[RULE][FLO-320] IF scene.vibe == "FLOW" THEN PASS IFF "NO_RHETORICAL_FRAGMENTATION" IN scene.directives; ELSE FAIL.
[RULE][FLO-330] IF scene.vibe == "FLOW" THEN PASS IFF "LOGICAL_CHAIN_VISIBLE" IN scene.directives; ELSE FAIL.
[RULE][FLO-340] IF scene.vibe == "FLOW" THEN PASS IFF "DIALOGUE_HIGH_SIGNAL_LOW_NOISE" IN scene.directives; ELSE FAIL.
[RULE][FLO-350] IF scene.vibe == "FLOW" THEN PASS IFF "SHARED_CONTEXT_NO_EXPOSITION" IN scene.directives; ELSE FAIL.
[RULE][FLO-360] IF scene.vibe == "FLOW" THEN PASS IFF every(forbidden_directives) NOT IN scene.directives; ELSE FAIL.

## USAGE / RESOLUTION

[DECISION][FLO-400] Scenes MUST treat this doc as applicable ONLY IF scene.vibe == "FLOW".
[DECISION][FLO-410] Conflict resolution MUST follow SPEC-PRIORITY-RESOLUTION-2215-0001; ELSE FAIL.
[DECISION][FLO-420] This doc MUST NOT override locality constraints; locality MUST be constrained by location canon/docs; ELSE FAIL.
[DECISION][FLO-430] This doc MUST NOT be consumed as a default substitute for CANON-VIBE-RESTLESS-GLOBAL-2215-0001; ELSE FAIL.

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-VIBE-FLOW-GLOBAL-2215-0001
role_type: RULE
export:
  - rule_id: FLO-020
    intent: "applicability bound to explicit scene.inputs + scene.vibe"
    inputs: [scene.inputs, scene.vibe]
    outputs: [flow_requirements]
  - rule_id: FLO-120
    intent: "sound markers must be selected from allowed pool"
    inputs: [scene.sound_markers]
    outputs: [sound_marker_pool, flow_requirements]
  - rule_id: FLO-230
    intent: "require matte stable surfaces visual marker"
    inputs: [scene.visual_markers]
    outputs: [visual_marker_pool, flow_requirements]
  - rule_id: FLO-310
    intent: "require medium-long sentence profile directive"
    inputs: [scene.directives]
    outputs: [flow_requirements]
  - rule_id: FLO-360
    intent: "forbid prohibited directives under FLOW"
    inputs: [scene.directives]
    outputs: [flow_requirements]
~~~

## FORBIDDEN

[FORBIDDEN][FLO-900] Using noir-by-default framing as FLOW baseline.
[FORBIDDEN][FLO-910] Treating music references as diegetic content in generated prose.
[FORBIDDEN][FLO-920] Consuming NON-NORMATIVE examples as rules.

## NON-NORMATIVE

(empty)
