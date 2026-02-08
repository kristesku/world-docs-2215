---
id: CANON-VIBE-VOID-GLOBAL-2215-0001
title: >
  Atmosphere Reference — Lorn ("Void / Dread" Profile)
class: canon
status: draft
version: 1.0.2
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
SCOPE: enforce void constraints when scene.vibe == "VOID"
INPUTS: [scene.vibe, scene.tag.VIBE, scene.tag.ZONE, scene.tag.TYPE, scene.tag.EVENT, prose.text]
OUTPUTS: [void_zone_token, void_type_token, void_event_token, void_forbidden_lexeme_pool_ru, void_requirements]
FORBIDDEN: [heroic_tone, warmth, cozy_details, neon_show, fast_banter]

## DEFINITIONS

[FACT][VOI-010] `scene.vibe` = строковый токен активного vibe-профиля сцены.
[FACT][VOI-011] `scene.tag.VIBE` = строковый alias; PASS IFF NOT is_defined(scene.tag.VIBE) OR (scene.tag.VIBE == scene.vibe); ELSE FAIL.
[FACT][VOI-020] `scene.tag.ZONE` = строковый тег зоны сцены.
[FACT][VOI-030] `scene.tag.TYPE` = строковый тег типа сцены.
[FACT][VOI-040] `scene.tag.EVENT` = строковый тег события сцены.
[FACT][VOI-050] `prose.text` = диетический текст сцены как строка.
[FACT][VOI-060] `prose_text` = строка, равная `prose.text`.

[FACT][VOI-070] `vibe_token` ∈ {"RESTLESS","KINETIC","FLOW","VELVET","VOID"}.
[FACT][VOI-080] `is_defined(x)` = true IFF `x` существует AND `x != ""`; ELSE false.
[FACT][VOI-090] `contains_substring(text, token)` = true IFF `text` содержит `token` как подстроку; ELSE false.
[FACT][VOI-100] `any_token_in_text(text, pool)` = true IFF ∃`t`∈`pool`: `contains_substring(text,t)`; ELSE false.
[FACT][VOI-110] `no_token_in_text(text, pool)` = true IFF ∀`t`∈`pool`: NOT `contains_substring(text,t)`; ELSE false.

[FACT][VOI-120] `void_zone_token` ∈ {"DEEP_ZONE","FORBIDDEN_ZONE","ABANDONED_NODE"}.
[FACT][VOI-130] `void_type_token` ∈ {"HORROR","ISOLATION","COLLAPSE","AWE"}.
[FACT][VOI-140] `void_event_token` ∈ {"FATAL_LOSS","IRREVERSIBLE_ERROR","MEGASTRUCTURE_BREATH"}.

## INVARIANTS

[RULE][VOI-200] PASS IFF `scene.vibe ∈ vibe_token`; ELSE FAIL.
[RULE][VOI-201] PASS IFF NOT is_defined(scene.tag.VIBE) OR (scene.tag.VIBE == scene.vibe); ELSE FAIL.

[RULE][VOI-210] PASS IFF (scene.vibe != "VOID") OR is_defined(scene.tag.ZONE); ELSE FAIL.
[RULE][VOI-220] PASS IFF (scene.vibe != "VOID") OR is_defined(scene.tag.TYPE); ELSE FAIL.
[RULE][VOI-230] PASS IFF (scene.vibe != "VOID") OR is_defined(scene.tag.EVENT); ELSE FAIL.

[RULE][VOI-240] PASS IFF (scene.vibe != "VOID") OR (scene.tag.ZONE in void_zone_token); ELSE FAIL.
[RULE][VOI-250] PASS IFF (scene.vibe != "VOID") OR (scene.tag.TYPE in void_type_token); ELSE FAIL.
[RULE][VOI-260] PASS IFF (scene.vibe != "VOID") OR (scene.tag.EVENT in void_event_token); ELSE FAIL.
[RULE][VOI-270] PASS IFF (scene.vibe != "VOID") OR (scene.tag.TYPE not in {"COMBAT","CHASE","CLUB"}); ELSE FAIL.

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

[RULE][VOI-300] PASS IFF (scene.vibe != "VOID") OR (NOT is_defined(prose_text)) OR any_token_in_text(prose_text, void_sound_token_pool); ELSE FAIL.
[RULE][VOI-310] PASS IFF (scene.vibe != "VOID") OR (NOT is_defined(prose_text)) OR any_token_in_text(prose_text, void_scale_token_pool); ELSE FAIL.
[RULE][VOI-320] PASS IFF (scene.vibe != "VOID") OR (NOT is_defined(prose_text)) OR any_token_in_text(prose_text, void_light_token_pool); ELSE FAIL.
[RULE][VOI-330] PASS IFF (scene.vibe != "VOID") OR (NOT is_defined(prose_text)) OR no_token_in_text(prose_text, void_forbidden_lexeme_pool_ru); ELSE FAIL.

## USAGE / RESOLUTION

[DECISION][VOI-400] This document applies ONLY IF `scene.vibe == "VOID"`; ELSE PASS.
[DECISION][VOI-410] Conflict resolution MUST follow `SPEC-PRIORITY-RESOLUTION-2215-0001`; ELSE FAIL.
[DECISION][VOI-420] This doc MUST NOT weaken CANON-VIBE-RESTLESS-GLOBAL-2215-0001 outside scenes where `scene.vibe == "VOID"`; ELSE FAIL.

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-VIBE-VOID-GLOBAL-2215-0001
role_type: RULE
export:
  - rule_id: VOI-240
    intent: "gate: VOID requires ZONE in void_zone_token"
    inputs: [scene.vibe, scene.tag.ZONE]
    outputs: [void_requirements, void_zone_token]
  - rule_id: VOI-250
    intent: "gate: VOID requires TYPE in void_type_token"
    inputs: [scene.vibe, scene.tag.TYPE]
    outputs: [void_requirements, void_type_token]
  - rule_id: VOI-260
    intent: "gate: VOID requires EVENT in void_event_token"
    inputs: [scene.vibe, scene.tag.EVENT]
    outputs: [void_requirements, void_event_token]
  - rule_id: VOI-330
    intent: "forbid cozy/heroic/neon lexemes in void prose when prose_text is defined"
    inputs: [scene.vibe, prose.text]
    outputs: [void_forbidden_lexeme_pool_ru, void_requirements]
config:
  void_zone_token_ref: "DEFINITIONS.void_zone_token"
  void_type_token_ref: "DEFINITIONS.void_type_token"
  void_event_token_ref: "DEFINITIONS.void_event_token"
  void_forbidden_lexeme_pool_ru_ref: "CONTENT.void_forbidden_lexeme_pool_ru"
  vibe_field: "scene.vibe"
  vibe_alias_field: "scene.tag.VIBE"
~~~

## FORBIDDEN

[FORBIDDEN][VOI-900] Treating this doc as applicable when `scene.vibe != "VOID"`.
[FORBIDDEN][VOI-910] Consuming NON-NORMATIVE content as constraints or facts.

## NON-NORMATIVE

~~~text
Example only (non-normative):
«Темнота здесь не была отсутствием света. Она была массой. Где-то внизу что-то огромное провернулось со скрежетом, и вибрация прошла через подошвы в зубы. Он почувствовал себя песчинкой внутри монолита».
~~~
