---
id: CANON-VIBE-RESTLESS-GLOBAL-2215-0001
title: >
  Atmosphere Reference — UNKLE ("Restless" Profile)
class: canon
status: draft
version: 0.2.1
prefix: RST
doc_language: ru-RU
prose_language: ru-RU
inputs:
  - CANON-ARTIFACT-SNIPPETS-GLOBAL-2215-0001
  - CANON-LOC-CHELNY-2215-0001
  - CANON-SYSTEM-VOICE-GLOBAL-2215-0001
depends_on:
  - SPEC-DOC-ID-2215-0001
  - SPEC-DOC-STYLE-2215-0001
  - SPEC-PRIORITY-RESOLUTION-2215-0001
scope: >
  RULE-канон базового “driving fatigue” профиля: поток действий + износ без
  мелодрамы, процедурность, инфраструктурный низкочастотный фон. Профиль
  активируется только при `scene.vibe == "RESTLESS"`. Без SSOT-метрик и
  без художественных объяснений.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: enforce restless constraints when scene.vibe == "RESTLESS"
INPUTS: [scene.inputs, scene.vibe, scene.tag.VIBE, scene.context, scene.sound_markers, scene.directives, prose.text]
OUTPUTS: [restless_requirements, restless_marker_pools]
FORBIDDEN: [lyrics_quotes, noir_cliches_as_default, essay_mode, system_anthropomorphism]

## DEFINITIONS

[FACT][RST-010] `scene.inputs` = список doc_id, явно подключённых сценой как входы.
[FACT][RST-011] `scene.vibe` = строковый токен активного vibe-профиля сцены.
[FACT][RST-012] `scene.tag.VIBE` = строковый alias; PASS IFF `scene.tag.VIBE == ""` OR `scene.tag.VIBE == scene.vibe`; ELSE FAIL.
[FACT][RST-013] `scene.context` = множество контекстных токенов сцены.
[FACT][RST-014] `scene.sound_markers` = список токенов звуковых приёмов сцены.
[FACT][RST-015] `scene.directives` = список директив генерации прозы сцены.
[FACT][RST-016] `prose_text` = строка, равная `prose.text`.

[FACT][RST-030] `vibe_token` ∈ {"RESTLESS","KINETIC","FLOW","VELVET","VOID"}.
[FACT][RST-031] `is_defined(x)` = true IFF `x` существует AND `x != ""`; ELSE false.
[FACT][RST-032] `count(xs)` = целое число элементов в `xs`.
[FACT][RST-033] `contains(xs, x)` = true IFF `x` содержится в `xs`; ELSE false.
[FACT][RST-034] `all_in(xs, pool)` = true IFF ∀`e`∈`xs`: `e`∈`pool`; ELSE false.
[FACT][RST-035] `is_subset(required, actual)` = true IFF ∀`e`∈`required`: `contains(actual,e)`; ELSE false.
[FACT][RST-036] `contains_substring(text, token)` = true IFF `text` содержит `token` как подстроку; ELSE false.
[FACT][RST-037] `contains_none(text, pool)` = true IFF ∀`t`∈`pool`: NOT `contains_substring(text,t)`; ELSE false.
[FACT][RST-038] `in_inputs(inputs, doc_id)` = true IFF `doc_id` содержится в `inputs`; ELSE false.

## INVARIANTS

[RULE][RST-020] PASS IFF `scene.vibe ∈ vibe_token`; ELSE FAIL.
[RULE][RST-021] PASS IFF (`scene.tag.VIBE == ""`) OR (`scene.tag.VIBE == scene.vibe`); ELSE FAIL.
[RULE][RST-022] PASS IFF (NOT in_inputs(scene.inputs, "CANON-VIBE-RESTLESS-GLOBAL-2215-0001")) OR (scene.vibe == "RESTLESS"); ELSE FAIL.

## CONTENT

### 1) Pools (normative tokens)

~~~yaml
sound_marker_pool:
  - INFRA_LOW_END_HUM
  - PROCEDURAL_TICK
  - FILTERED_INTERFACE_VOCALS

required_directive_pool:
  - SHORT_SENTENCES_DOMINANT
  - ACTION_PARAGRAPHS_1_TO_4_SENTENCES
  - BEND_RESEND_LOOP_ON_DENY
  - EXPLANATION_BLOCKS_FORBIDDEN
  - TEAM_DIALOGUE_UTILITARIAN

forbidden_lexeme_pool_ru:
  - "каждую ночь дождь"
  - "кислотный неон"
  - "тренч"
  - "город как живой"
  - "система злится"
~~~

### 2) Marker constraints

[RULE][RST-110] PASS IFF (scene.vibe != "RESTLESS") OR (count(scene.sound_markers) ∈ [1,3]); ELSE FAIL.
[RULE][RST-111] PASS IFF (scene.vibe != "RESTLESS") OR all_in(scene.sound_markers, sound_marker_pool); ELSE FAIL.
[RULE][RST-112] PASS IFF (scene.vibe != "RESTLESS") OR contains(scene.sound_markers, "INFRA_LOW_END_HUM"); ELSE FAIL.

### 3) Directive constraints

[RULE][RST-120] PASS IFF (scene.vibe != "RESTLESS") OR is_subset(required_directive_pool, scene.directives); ELSE FAIL.

### 4) Integration gates (explicit via directives)

[RULE][RST-130] PASS IFF (scene.vibe != "RESTLESS") OR (NOT contains(scene.directives, "USES_SYSTEM_INSERTS")) OR in_inputs(scene.inputs, "CANON-SYSTEM-VOICE-GLOBAL-2215-0001"); ELSE FAIL.
[RULE][RST-131] PASS IFF (scene.vibe != "RESTLESS") OR (NOT contains(scene.directives, "USES_ARTIFACT_SNIPPETS")) OR in_inputs(scene.inputs, "CANON-ARTIFACT-SNIPPETS-GLOBAL-2215-0001"); ELSE FAIL.
[RULE][RST-132] PASS IFF (scene.vibe != "RESTLESS") OR in_inputs(scene.inputs, "CANON-LOC-CHELNY-2215-0001"); ELSE FAIL.

### 5) Lexeme constraints (decidable on prose_text)

[RULE][RST-140] PASS IFF (scene.vibe != "RESTLESS") OR (NOT is_defined(prose_text)) OR contains_none(prose_text, forbidden_lexeme_pool_ru); ELSE FAIL.

## USAGE / RESOLUTION

[DECISION][RST-200] This document applies ONLY IF `scene.vibe == "RESTLESS"`; ELSE PASS.
[DECISION][RST-201] Conflict resolution MUST follow `SPEC-PRIORITY-RESOLUTION-2215-0001`; ELSE FAIL.
[DECISION][RST-202] If a scene must not be RESTLESS THEN it MUST set `scene.vibe` explicitly (or be routed by CANON-VIBE-ROUTER); ELSE PASS.

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-VIBE-RESTLESS-GLOBAL-2215-0001
role_type: RULE
export:
  - rule_id: RST-022
    intent: "applicability bound to explicit scene.inputs + scene.vibe"
    inputs: [scene.inputs, scene.vibe]
    outputs: [restless_requirements]
  - rule_id: RST-111
    intent: "restrict sound markers to pool and count 1..3"
    inputs: [scene.vibe, scene.sound_markers]
    outputs: [restless_requirements, restless_marker_pools]
  - rule_id: RST-120
    intent: "require directive subset for restless prose/dialogue structure"
    inputs: [scene.vibe, scene.directives]
    outputs: [restless_requirements]
  - rule_id: RST-130
    intent: "require system-voice doc when USES_SYSTEM_INSERTS directive is present"
    inputs: [scene.vibe, scene.directives, scene.inputs]
    outputs: [restless_requirements]
  - rule_id: RST-132
    intent: "require Chelny locality doc for RESTLESS scenes"
    inputs: [scene.vibe, scene.inputs]
    outputs: [restless_requirements]
  - rule_id: RST-140
    intent: "forbid noir/system-anthropomorphism lexemes in RESTLESS prose when prose_text is defined"
    inputs: [scene.vibe, prose.text]
    outputs: [restless_requirements]
config:
  sound_marker_pool_ref: "CONTENT.sound_marker_pool"
  required_directive_pool_ref: "CONTENT.required_directive_pool"
  forbidden_lexeme_pool_ru_ref: "CONTENT.forbidden_lexeme_pool_ru"
  vibe_field: "scene.vibe"
  vibe_alias_field: "scene.tag.VIBE"
~~~

## FORBIDDEN

[FORBIDDEN][RST-900] Quoting lyrics or reproducing track text (any length).
[FORBIDDEN][RST-901] Consuming NON-NORMATIVE examples as rules.
[FORBIDDEN][RST-902] Applying RESTLESS constraints without `scene.vibe == "RESTLESS"`.

## NON-NORMATIVE

~~~text
Design intent (not normative):
- “Flow + wear”: actions continue, but every win leaves a residual constraint.
- Team dialogue is routing and confirmation, not bonding.
~~~
