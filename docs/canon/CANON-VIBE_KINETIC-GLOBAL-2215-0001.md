---
id: CANON-VIBE_KINETIC-GLOBAL-2215-0001
title: >
  Atmosphere Reference — Benny Benassi & Dhany ("Kinetic / Pumping" Profile)
class: canon
status: draft
version: 1.0.1
prefix: KIN
doc_language: en-US
prose_language: ru-RU
inputs:
  - CANON-LOC-CHELNY-2215-0001
depends_on:
  - SPEC-DOC_ID-2215-0001
  - SPEC-DOC_STYLE-2215-0001
  - SPEC-PRIORITY_RESOLUTION-2215-0001
scope: >
  RULE-канон для сцен ночного драйва, высокоскоростного транзита, клубов и
  зон высокой плотности автоматики: ритм, свет, синтетические текстуры и
  роботизированная оптика. Без SSOT-метрик и без инфодампа.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: enforce kinetic/pumping constraints when scene.tag.VIBE == "KINETIC"
INPUTS: [scene.inputs, scene.tag.VIBE, scene.context, scene.sound_markers, scene.visual_markers, scene.directives, scene.affect.external, scene.affect.internal, prose.text]
OUTPUTS: [sound_marker_pool, visual_marker_pool, forbidden_lexeme_pool_ru, kinetic_requirements]
FORBIDDEN: [acoustic_warmth, irregular_rhythm, organic_chaos, comfort_silence, narrative_prose]

## DEFINITIONS

[FACT][KIN-010] `scene.inputs` = список doc_id, явно подключённых сценой как входы.
[FACT][KIN-011] `scene.tag.VIBE` = строковый тег профиля атмосферы сцены.
[FACT][KIN-012] `scene.context` = множество контекстных токенов сцены.
[FACT][KIN-013] `scene.sound_markers` = список токенов звуковых приёмов сцены.
[FACT][KIN-014] `scene.visual_markers` = список токенов визуальных приёмов сцены.
[FACT][KIN-015] `scene.directives` = список директив генерации прозы сцены.
[FACT][KIN-016] `prose_text` = строка, равная `prose.text`.
[FACT][KIN-017] `scene.affect.external` = внешний режим поведения персонажа (токен).
[FACT][KIN-018] `scene.affect.internal` = внутренний режим (токен).

[FACT][KIN-030] `defined_token(x)` = PASS IFF `x` существует и `x != ""`; ELSE FAIL.
[FACT][KIN-031] `list_count(xs)` = количество элементов в `xs`.
[FACT][KIN-032] `list_contains(xs, x)` = PASS IFF `x` содержится в `xs`; ELSE FAIL.
[FACT][KIN-033] `all_in_pool(xs, pool)` = PASS IFF ∀`e`∈`xs`: `e`∈`pool`; ELSE FAIL.
[FACT][KIN-034] `intersects(a, b)` = PASS IFF ∃`t`: `t`∈`a` AND `t`∈`b`; ELSE FAIL.
[FACT][KIN-035] `token_in_text(text, token)` = PASS IFF `text` содержит `token` как подстроку; ELSE FAIL.
[FACT][KIN-036] `no_token_in_text(text, pool)` = PASS IFF ∀`t`∈`pool`: NOT `token_in_text(text,t)`; ELSE FAIL.
[FACT][KIN-037] `doc_in_inputs(inputs, doc_id)` = PASS IFF `doc_id` содержится в `inputs`; ELSE FAIL.

## INVARIANTS

[RULE][KIN-020] PASS IFF (NOT doc_in_inputs(scene.inputs, "CANON-VIBE_KINETIC-GLOBAL-2215-0001")) OR (scene.tag.VIBE == "KINETIC"); ELSE FAIL.
[RULE][KIN-021] PASS IFF (scene.tag.VIBE != "KINETIC") OR intersects(scene.context, allowed_context_pool); ELSE FAIL.
[RULE][KIN-022] PASS IFF (scene.tag.VIBE != "KINETIC") OR (defined_token(prose_text) MUST PASS); ELSE FAIL.

## CONTENT

### 1. Pools (normative tokens)

~~~yaml
allowed_context_pool:
  - NIGHT_TRANSIT
  - HIGH_AUTOMATION_DENSITY
  - CLUB
  - TECH_TRANCE

sound_marker_pool:
  - SIDECHAIN_DUCKING_BACKGROUND
  - FOUR_ON_FLOOR_GRID
  - CLIPPED_TRANSIENTS
  - BITCRUSH_TEXTURE
  - MECHANICAL_SUBBASS
  - PROCEDURAL_BEEPS_AS_PERCUSSION

visual_marker_pool:
  - STROBE_OR_INTERMITTENT_LIGHT
  - SHARP_MOVING_SHADOWS
  - HIGH_GLOSS_COATED_METAL
  - WET_SURFACE_REFLECTIONS
  - HIGH_SATURATION_ACCENTS_ON_BLACK
  - CHROME_GLINTS_AS_SIGNAL

required_directive_pool:
  - STACCATO_SENTENCES
  - HOOK_LOOP_X3
required_hook_anchor_pool:
  - HOOK_ANCHOR_SOUND
  - HOOK_ANCHOR_LIGHT
  - HOOK_ANCHOR_MOTION
  - HOOK_ANCHOR_INTERFACE

forbidden_lexeme_pool_ru:
  - "мягкий"
  - "уютный"
  - "плавный"
  - "естественный"

comfort_silence_lexeme_pool_ru:
  - "успокаивающая тишина"
  - "тишина как отдых"
  - "тишина как покой"
~~~

### 2. Soundscape constraints

[RULE][KIN-110] PASS IFF (scene.tag.VIBE != "KINETIC") OR (list_count(scene.sound_markers) >= 1 AND list_count(scene.sound_markers) <= 3); ELSE FAIL.
[RULE][KIN-111] PASS IFF (scene.tag.VIBE != "KINETIC") OR all_in_pool(scene.sound_markers, sound_marker_pool); ELSE FAIL.
[RULE][KIN-112] PASS IFF (scene.tag.VIBE != "KINETIC") OR list_contains(scene.sound_markers, "SIDECHAIN_DUCKING_BACKGROUND"); ELSE FAIL.
[RULE][KIN-113] PASS IFF (scene.tag.VIBE != "KINETIC") OR list_contains(scene.sound_markers, "FOUR_ON_FLOOR_GRID"); ELSE FAIL.

### 3. Visual constraints

[RULE][KIN-120] PASS IFF (scene.tag.VIBE != "KINETIC") OR (list_count(scene.visual_markers) >= 1 AND list_count(scene.visual_markers) <= 3); ELSE FAIL.
[RULE][KIN-121] PASS IFF (scene.tag.VIBE != "KINETIC") OR all_in_pool(scene.visual_markers, visual_marker_pool); ELSE FAIL.
[RULE][KIN-122] PASS IFF (scene.tag.VIBE != "KINETIC") OR list_contains(scene.visual_markers, "STROBE_OR_INTERMITTENT_LIGHT"); ELSE FAIL.

### 4. Prose rhythm constraints (directive-driven)

[RULE][KIN-130] PASS IFF (scene.tag.VIBE != "KINETIC") OR list_contains(scene.directives, "STACCATO_SENTENCES"); ELSE FAIL.
[RULE][KIN-131] PASS IFF (scene.tag.VIBE != "KINETIC") OR list_contains(scene.directives, "HOOK_LOOP_X3"); ELSE FAIL.
[RULE][KIN-132] PASS IFF (scene.tag.VIBE != "KINETIC") OR intersects(scene.directives, required_hook_anchor_pool); ELSE FAIL.

### 5. Emotional framing constraints

[RULE][KIN-140] PASS IFF (scene.tag.VIBE != "KINETIC") OR (scene.affect.external == "ROBOTIC_PRECISION"); ELSE FAIL.
[RULE][KIN-141] PASS IFF (scene.tag.VIBE != "KINETIC") OR (scene.affect.internal == "HIGH_HEAT_UNDER_CONTROL"); ELSE FAIL.

### 6. Lexeme constraints (decidable on prose_text)

[RULE][KIN-150] PASS IFF (scene.tag.VIBE != "KINETIC") OR no_token_in_text(prose_text, forbidden_lexeme_pool_ru); ELSE FAIL.
[RULE][KIN-151] PASS IFF (scene.tag.VIBE != "KINETIC") OR no_token_in_text(prose_text, comfort_silence_lexeme_pool_ru); ELSE FAIL.

## USAGE / RESOLUTION

[DECISION][KIN-200] Scenes MUST treat this doc as applicable ONLY IF `scene.tag.VIBE == "KINETIC"`; ELSE PASS.
[DECISION][KIN-201] Conflict resolution MUST follow `SPEC-PRIORITY_RESOLUTION-2215-0001`; ELSE FAIL.
[DECISION][KIN-202] This doc MUST NOT override locality constraints; locality rules MUST be applied by location docs; ELSE FAIL.

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-VIBE_KINETIC-GLOBAL-2215-0001
role_type: RULE
export:
  - rule_id: KIN-020
    intent: "applicability: explicit scene.inputs implies VIBE==KINETIC"
    inputs: [scene.inputs, scene.tag.VIBE]
    outputs: [kinetic_requirements]
  - rule_id: KIN-021
    intent: "gate: kinetic allowed only for allowed_context_pool"
    inputs: [scene.tag.VIBE, scene.context]
    outputs: [kinetic_requirements]
  - rule_id: KIN-112
    intent: "require SIDECHAIN_DUCKING_BACKGROUND"
    inputs: [scene.sound_markers]
    outputs: [kinetic_requirements]
  - rule_id: KIN-122
    intent: "require STROBE_OR_INTERMITTENT_LIGHT"
    inputs: [scene.visual_markers]
    outputs: [kinetic_requirements]
  - rule_id: KIN-131
    intent: "require HOOK_LOOP_X3 directive"
    inputs: [scene.directives]
    outputs: [kinetic_requirements]
  - rule_id: KIN-150
    intent: "forbid comfort lexemes in kinetic prose"
    inputs: [prose.text]
    outputs: [forbidden_lexeme_pool_ru]
~~~

## FORBIDDEN

[FORBIDDEN][KIN-900] Consuming NON-NORMATIVE examples as rules.
[FORBIDDEN][KIN-901] Applying KINETIC constraints without `scene.tag.VIBE == "KINETIC"`.
[FORBIDDEN][KIN-902] Mixing multiple vibe profiles in one scene is forbidden by design intent (one scene = one vibe); violations MUST be rejected by scene schema gate.

## NON-NORMATIVE

~~~text
Reference mapping (examples only):
- "Satisfaction": mechanical push/pull + subbass dominance.
- "Hit My Heart": internal heat under robotic control.
- "Every Single Day": HOOK_LOOP_X3 with variation.
~~~
