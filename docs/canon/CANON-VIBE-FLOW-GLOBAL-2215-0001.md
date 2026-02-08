---
id: CANON-VIBE-FLOW-GLOBAL-2215-0001
title: >
  Atmosphere Reference — Nujabes & Logic ("Solar Flow" Profile)
class: canon
status: draft
version: 1.0.2
prefix: FLOW
doc_language: ru-RU
prose_language: ru-RU
inputs:
  - CANON-VIBE-RESTLESS-GLOBAL-2215-0001
depends_on:
  - SPEC-DOC-ID-2215-0001
  - SPEC-DOC-STYLE-2215-0001
  - SPEC-PRIORITY-RESOLUTION-2215-0001
scope: >
  RULE-канон для сцен ясности, синхронизации мышления и исполнения без надрыва.
  Профиль активируется только при `scene.vibe == "FLOW"`. Без SSOT-метрик и
  без инфодампа.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: enforce flow constraints when scene.vibe == "FLOW"
INPUTS: [scene.inputs, scene.vibe, scene.tag.VIBE, scene.tag.TYPE, scene.sound_markers, scene.visual_markers, scene.directives, prose.text]
OUTPUTS: [flow_requirements, flow_marker_pools]
FORBIDDEN: [noir_cliches, gritty_bass_dominance, choppy_fragmentation, emotional_monologue_explaining_insight]

## DEFINITIONS

[FACT][FLOW-010] `scene.inputs` = список doc_id, явно подключённых сценой как входы.
[FACT][FLOW-011] `scene.vibe` = строковый токен активного vibe-профиля сцены.
[FACT][FLOW-012] `scene.tag.VIBE` = строковый alias; PASS IFF `scene.tag.VIBE == ""` OR `scene.tag.VIBE == scene.vibe`; ELSE FAIL.
[FACT][FLOW-013] `scene.tag.TYPE` = строковый токен подтипа FLOW-сцены.
[FACT][FLOW-014] `scene.sound_markers` = список токенов звуковых приёмов сцены.
[FACT][FLOW-015] `scene.visual_markers` = список токенов визуальных приёмов сцены.
[FACT][FLOW-016] `scene.directives` = список директив генерации прозы сцены.
[FACT][FLOW-017] `prose_text` = строка, равная `prose.text`.

[FACT][FLOW-030] `vibe_token` ∈ {"RESTLESS","KINETIC","FLOW","VELVET","VOID"}.
[FACT][FLOW-031] `is_defined(x)` = true IFF `x` существует AND `x != ""`; ELSE false.
[FACT][FLOW-032] `count(xs)` = целое число элементов в `xs`.
[FACT][FLOW-033] `contains(xs, x)` = true IFF `x` содержится в `xs`; ELSE false.
[FACT][FLOW-034] `all_in(xs, pool)` = true IFF ∀`e`∈`xs`: `e`∈`pool`; ELSE false.
[FACT][FLOW-035] `is_subset(required, actual)` = true IFF ∀`e`∈`required`: `contains(actual,e)`; ELSE false.
[FACT][FLOW-036] `contains_substring(text, token)` = true IFF `text` содержит `token` как подстроку; ELSE false.
[FACT][FLOW-037] `contains_none(text, pool)` = true IFF ∀`t`∈`pool`: NOT `contains_substring(text,t)`; ELSE false.
[FACT][FLOW-038] `in_inputs(inputs, doc_id)` = true IFF `doc_id` содержится в `inputs`; ELSE false.

## INVARIANTS

[RULE][FLOW-020] PASS IFF `scene.vibe ∈ vibe_token`; ELSE FAIL.
[RULE][FLOW-021] PASS IFF (`scene.tag.VIBE == ""`) OR (`scene.tag.VIBE == scene.vibe`); ELSE FAIL.
[RULE][FLOW-022] PASS IFF (NOT in_inputs(scene.inputs, "CANON-VIBE-FLOW-GLOBAL-2215-0001")) OR (scene.vibe == "FLOW"); ELSE FAIL.
[RULE][FLOW-023] PASS IFF (scene.vibe != "FLOW") OR is_defined(scene.tag.TYPE); ELSE FAIL.
[RULE][FLOW-024] PASS IFF (scene.vibe != "FLOW") OR (scene.tag.TYPE in flow_type_token_pool); ELSE FAIL.

## CONTENT

### 1) Pools (normative tokens)

~~~yaml
flow_type_token_pool:
  - INSIGHT
  - EXECUTION
  - REFLECTION

sound_marker_pool:
  - ORDERED_AMBIENT_TONES
  - CLEAN_TRANSIENTS_NO_GRIT
  - SOFT_REPEATABLE_TEXTURES

visual_marker_pool:
  - LOW_SUN_WARM_REFLECTION
  - MASSIVE_STABLE_MATERIALS
  - LOW_CONTRAST_CLARITY

required_directive_pool:
  - SENTENCE_MEDIUM_LONG_ALLOWED
  - LOGICAL_CASCADE_ALLOWED
  - FRAGMENTATION_FORBIDDEN
  - DIALOGUE_SHARED_CONTEXT_NO_EXPOSITION
  - HESITATION_MARKERS_FORBIDDEN

forbidden_lexeme_pool_ru:
  - "кислотный неон"
  - "грязный бас"
  - "тренч"
  - "гнилая подворотня"
~~~

### 2) Marker constraints

[RULE][FLOW-110] PASS IFF (scene.vibe != "FLOW") OR (count(scene.sound_markers) ∈ [1,2]); ELSE FAIL.
[RULE][FLOW-111] PASS IFF (scene.vibe != "FLOW") OR all_in(scene.sound_markers, sound_marker_pool); ELSE FAIL.

[RULE][FLOW-120] PASS IFF (scene.vibe != "FLOW") OR (count(scene.visual_markers) ∈ [1,2]); ELSE FAIL.
[RULE][FLOW-121] PASS IFF (scene.vibe != "FLOW") OR all_in(scene.visual_markers, visual_marker_pool); ELSE FAIL.

### 3) Directive constraints

[RULE][FLOW-130] PASS IFF (scene.vibe != "FLOW") OR is_subset(required_directive_pool, scene.directives); ELSE FAIL.

### 4) Lexeme constraints (decidable on prose_text)

[RULE][FLOW-140] PASS IFF (scene.vibe != "FLOW") OR (NOT is_defined(prose_text)) OR contains_none(prose_text, forbidden_lexeme_pool_ru); ELSE FAIL.

## USAGE / RESOLUTION

[DECISION][FLOW-200] This document applies ONLY IF `scene.vibe == "FLOW"`; ELSE PASS.
[DECISION][FLOW-201] Conflict resolution MUST follow `SPEC-PRIORITY-RESOLUTION-2215-0001`; ELSE FAIL.
[DECISION][FLOW-202] This doc MUST NOT change locality constraints; locality rules MUST be applied by location docs; ELSE FAIL.

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-VIBE-FLOW-GLOBAL-2215-0001
role_type: RULE
export:
  - rule_id: FLOW-022
    intent: "applicability bound to explicit scene.inputs + scene.vibe"
    inputs: [scene.inputs, scene.vibe]
    outputs: [flow_requirements]
  - rule_id: FLOW-024
    intent: "gate: FLOW requires scene.tag.TYPE in flow_type_token_pool"
    inputs: [scene.vibe, scene.tag.TYPE]
    outputs: [flow_requirements]
  - rule_id: FLOW-111
    intent: "restrict sound markers to pool and count 1..2"
    inputs: [scene.vibe, scene.sound_markers]
    outputs: [flow_requirements, flow_marker_pools]
  - rule_id: FLOW-121
    intent: "restrict visual markers to pool and count 1..2"
    inputs: [scene.vibe, scene.visual_markers]
    outputs: [flow_requirements, flow_marker_pools]
  - rule_id: FLOW-130
    intent: "require directive subset for FLOW prose/dialogue behavior"
    inputs: [scene.vibe, scene.directives]
    outputs: [flow_requirements]
  - rule_id: FLOW-140
    intent: "forbid noir lexemes in FLOW prose when prose_text is defined"
    inputs: [scene.vibe, prose.text]
    outputs: [flow_requirements]
config:
  flow_type_token_pool_ref: "CONTENT.flow_type_token_pool"
  sound_marker_pool_ref: "CONTENT.sound_marker_pool"
  visual_marker_pool_ref: "CONTENT.visual_marker_pool"
  required_directive_pool_ref: "CONTENT.required_directive_pool"
  forbidden_lexeme_pool_ru_ref: "CONTENT.forbidden_lexeme_pool_ru"
  vibe_field: "scene.vibe"
  vibe_alias_field: "scene.tag.VIBE"
~~~

## FORBIDDEN

[FORBIDDEN][FLOW-900] Consuming NON-NORMATIVE examples as rules.
[FORBIDDEN][FLOW-901] Applying FLOW constraints without `scene.vibe == "FLOW"`.

## NON-NORMATIVE

~~~text
Example intent (not normative):
- Insight resolves as a clean chain, not as emotional confession.
- The scene feels warm and clear, but not “touristic futurism”.
~~~
