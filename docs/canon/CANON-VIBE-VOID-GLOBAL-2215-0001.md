---
id: CANON-VIBE-VOID-GLOBAL-2215-0001
title: >
  Atmosphere Reference — Lorn ("Void / Dread" Profile)
class: canon
status: draft
version: 1.0.1
prefix: VOI
doc_language: ru-RU
prose_language: ru-RU
inputs:
  - CANON-VIBE-RESTLESS-GLOBAL-2215-0001
depends_on:
  - SPEC-DOC-ID-2215-0001
  - SPEC-DOC-STYLE-2215-0001
  - SPEC-PRIORITY-RESOLUTION-2215-0001
scope: >
  RULE-канон для сцен экзистенциального ужаса, изоляции, фатальных сбоев и
  столкновения с мегаструктурным масштабом: решаемые требования к тегам и
  лексическим маркерам. Без SSOT-метрик и без инфодампа.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: enforce void constraints when scene.tag.VIBE == "VOID"
INPUTS: [scene.tag.VIBE, scene.tag.ZONE, scene.tag.TYPE, scene.tag.EVENT, prose.text]
OUTPUTS: [void_zone_token, void_type_token, void_event_token, void_forbidden_lexeme_pool_ru, void_requirements]
FORBIDDEN: [heroic_tone, warmth, cozy_details, neon_show, fast_banter]

## DEFINITIONS

[FACT][VOI-010] `scene.tag.VIBE` = строковый тег вайба сцены.
[FACT][VOI-020] `scene.tag.ZONE` = строковый тег зоны сцены.
[FACT][VOI-030] `scene.tag.TYPE` = строковый тег типа сцены.
[FACT][VOI-040] `scene.tag.EVENT` = строковый тег события сцены.
[FACT][VOI-050] `prose.text` = диетический текст сцены как строка.
[FACT][VOI-060] `prose_text` = строка, равная `prose.text`.

[FACT][VOI-070] `defined_token(x)` = PASS IFF `x` существует AND `x != ""`; ELSE FAIL.
[FACT][VOI-080] `token_in_text(text, token)` = PASS IFF `text` содержит `token` как подстроку; ELSE FAIL.
[FACT][VOI-090] `any_token_in_text(text, pool)` = PASS IFF ∃`t`∈`pool`: `token_in_text(text,t)`; ELSE FAIL.
[FACT][VOI-100] `no_token_in_text(text, pool)` = PASS IFF ∀`t`∈`pool`: NOT `token_in_text(text,t)`; ELSE FAIL.

[FACT][VOI-110] `void_zone_token` ∈ {"DEEP_ZONE","FORBIDDEN_ZONE","ABANDONED_NODE"}.
[FACT][VOI-120] `void_type_token` ∈ {"HORROR","ISOLATION","COLLAPSE","AWE"}.
[FACT][VOI-130] `void_event_token` ∈ {"FATAL_LOSS","IRREVERSIBLE_ERROR","MEGASTRUCTURE_BREATH"}.

## INVARIANTS

[RULE][VOI-200] PASS IFF scene.tag.VIBE != "VOID" OR defined_token(scene.tag.ZONE); ELSE FAIL.
[RULE][VOI-210] PASS IFF scene.tag.VIBE != "VOID" OR defined_token(scene.tag.TYPE); ELSE FAIL.
[RULE][VOI-220] PASS IFF scene.tag.VIBE != "VOID" OR defined_token(scene.tag.EVENT); ELSE FAIL.

[RULE][VOI-230] PASS IFF scene.tag.VIBE != "VOID" OR scene.tag.ZONE ∈ {"DEEP_ZONE","FORBIDDEN_ZONE","ABANDONED_NODE"}; ELSE FAIL.
[RULE][VOI-240] PASS IFF scene.tag.VIBE != "VOID" OR scene.tag.TYPE ∈ {"HORROR","ISOLATION","COLLAPSE","AWE"}; ELSE FAIL.
[RULE][VOI-250] PASS IFF scene.tag.VIBE != "VOID" OR scene.tag.EVENT ∈ {"FATAL_LOSS","IRREVERSIBLE_ERROR","MEGASTRUCTURE_BREATH"}; ELSE FAIL.
[RULE][VOI-260] PASS IFF scene.tag.VIBE != "VOID" OR scene.tag.TYPE NOT IN {"COMBAT","CHASE","CLUB"}; ELSE FAIL.

## CONTENT

### 1) Token pools (lexical anchors)

~~~yaml
void_sound_token_pool:
  - "гул"
  - "вибрация"
  - "скрежет"
  - "удар"
  - "инфразвук"

void_scale_token_pool:
  - "монолит"
  - "шахта"
  - "километр"
  - "без потолка"
  - "без дна"
  - "масштаб"

void_light_token_pool:
  - "холодный свет"
  - "недостаточно света"
  - "чёрное"
  - "белое"
  - "провал"

void_forbidden_lexeme_pool_ru:
  - "уют"
  - "тепло"
  - "милый"
  - "смешно"
  - "героизм"
  - "неон"
  - "голограмма"
~~~

### 2) Prose constraints (decidable on prose_text)

[RULE][VOI-300] PASS IFF scene.tag.VIBE != "VOID" OR any_token_in_text(prose_text, void_sound_token_pool); ELSE FAIL.
[RULE][VOI-310] PASS IFF scene.tag.VIBE != "VOID" OR any_token_in_text(prose_text, void_scale_token_pool); ELSE FAIL.
[RULE][VOI-320] PASS IFF scene.tag.VIBE != "VOID" OR any_token_in_text(prose_text, void_light_token_pool); ELSE FAIL.
[RULE][VOI-330] PASS IFF scene.tag.VIBE != "VOID" OR no_token_in_text(prose_text, void_forbidden_lexeme_pool_ru); ELSE FAIL.

## USAGE / RESOLUTION

[DECISION][VOI-400] IF scene.tag.VIBE == "VOID" THEN VOI-200..VOI-330 MUST be evaluated as constraints; ELSE PASS.
[DECISION][VOI-410] Conflict resolution MUST follow SPEC-PRIORITY-RESOLUTION-2215-0001; ELSE FAIL.
[DECISION][VOI-420] This doc MUST NOT weaken CANON-VIBE-RESTLESS-GLOBAL-2215-0001 outside scenes where scene.tag.VIBE == "VOID"; ELSE FAIL.

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-VIBE-VOID-GLOBAL-2215-0001
role_type: RULE
export:
  - rule_id: VOI-230
    intent: "gate: VOID requires ZONE in void_zone_token"
    inputs: [scene.tag.ZONE, scene.tag.VIBE]
    outputs: [void_requirements]
  - rule_id: VOI-240
    intent: "gate: VOID requires TYPE in void_type_token"
    inputs: [scene.tag.TYPE, scene.tag.VIBE]
    outputs: [void_requirements]
  - rule_id: VOI-250
    intent: "gate: VOID requires EVENT in void_event_token"
    inputs: [scene.tag.EVENT, scene.tag.VIBE]
    outputs: [void_requirements]
  - rule_id: VOI-330
    intent: "forbid cozy/heroic/neon lexemes in void prose"
    inputs: [prose.text, scene.tag.VIBE]
    outputs: [void_forbidden_lexeme_pool_ru, void_requirements]
~~~

## FORBIDDEN

[FORBIDDEN][VOI-900] Treating this doc as applicable when scene.tag.VIBE != "VOID".
[FORBIDDEN][VOI-910] Consuming NON-NORMATIVE content as constraints or facts.

## NON-NORMATIVE

~~~text
Example only (non-normative):
«Темнота здесь не была отсутствием света. Она была массой. Где-то внизу что-то огромное провернулось со скрежетом, и вибрация прошла через подошвы в зубы. Он почувствовал себя песчинкой внутри монолита».
~~~
