---
id: CANON-VIBE_VELVET-GLOBAL-2215-0001
title: >
  Atmosphere Reference — Melody Gardot ("Velvet / Noir" Profile)
class: canon
status: draft
version: 1.0.2
prefix: VEL
doc_language: en-US
prose_language: ru-RU
inputs:
  - CANON-VIBE_RESTLESS-GLOBAL-2215-0001
depends_on:
  - SPEC-DOC_ID-2215-0001
  - SPEC-DOC_STYLE-2215-0001
  - SPEC-PRIORITY_RESOLUTION-2215-0001
scope: >
  RULE-канон для сцен глубокой интимности, “дорогого” нуара, уязвимости и
  аналоговой теплоты: решаемые требования к лексике и тегам сцены.
  Без SSOT-метрик и без инфодампа.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: enforce velvet constraints when scene.vibe == "VELVET"
INPUTS: [scene.vibe, scene.tag.VIBE, scene.tag.ZONE, scene.tag.TYPE, scene.tag.STATE, prose.text]
OUTPUTS: [velvet_zone_token, velvet_type_token, velvet_state_token, velvet_forbidden_lexeme_pool_ru, velvet_requirements]
FORBIDDEN: [industrial_noise_dominance, haste, synthetic_pop_dominance, bureaucratic_language_dominance]

## DEFINITIONS

[FACT][VEL-010] `scene.vibe` = строковый токен активного vibe-профиля сцены.
[FACT][VEL-011] `scene.tag.VIBE` = строковый alias; PASS IFF NOT is_defined(scene.tag.VIBE) OR (scene.tag.VIBE == scene.vibe); ELSE FAIL.
[FACT][VEL-020] `scene.tag.ZONE` = строковый тег зоны сцены.
[FACT][VEL-030] `scene.tag.TYPE` = строковый тег типа сцены.
[FACT][VEL-040] `scene.tag.STATE` = строковый тег состояния сцены.
[FACT][VEL-050] `prose.text` = диетический текст сцены как строка.
[FACT][VEL-060] `prose_text` = строка, равная `prose.text`.

[FACT][VEL-070] `vibe_token` ∈ {"RESTLESS","KINETIC","FLOW","VELVET","VOID"}.
[FACT][VEL-080] `is_defined(x)` = true IFF `x` существует AND `x != ""`; ELSE false.
[FACT][VEL-090] `contains_substring(text, token)` = true IFF `text` содержит `token` как подстроку; ELSE false.
[FACT][VEL-100] `any_token_in_text(text, pool)` = true IFF ∃`t`∈`pool`: `contains_substring(text,t)`; ELSE false.
[FACT][VEL-110] `no_token_in_text(text, pool)` = true IFF ∀`t`∈`pool`: NOT `contains_substring(text,t)`; ELSE false.

[FACT][VEL-120] `velvet_zone_token` ∈ {"SAFE_HOUSE","VIP_SECTOR","BLIND_ZONE"}.
[FACT][VEL-130] `velvet_type_token` ∈ {"INTIMACY","SEDUCTION","CONFESSION","RECOVERY","TRUST_ENGINEERING"}.
[FACT][VEL-140] `velvet_state_token` ∈ {"EMOTIONAL_OPENNESS","SEDATION","CONTROLLED_TRUST"}.

## INVARIANTS

[RULE][VEL-200] PASS IFF `scene.vibe ∈ vibe_token`; ELSE FAIL.
[RULE][VEL-201] PASS IFF NOT is_defined(scene.tag.VIBE) OR (scene.tag.VIBE == scene.vibe); ELSE FAIL.

[RULE][VEL-210] PASS IFF (scene.vibe != "VELVET") OR is_defined(scene.tag.ZONE); ELSE FAIL.
[RULE][VEL-220] PASS IFF (scene.vibe != "VELVET") OR is_defined(scene.tag.TYPE); ELSE FAIL.
[RULE][VEL-230] PASS IFF (scene.vibe != "VELVET") OR is_defined(scene.tag.STATE); ELSE FAIL.

[RULE][VEL-240] PASS IFF (scene.vibe != "VELVET") OR (scene.tag.ZONE in velvet_zone_token); ELSE FAIL.
[RULE][VEL-250] PASS IFF (scene.vibe != "VELVET") OR (scene.tag.TYPE in velvet_type_token); ELSE FAIL.
[RULE][VEL-260] PASS IFF (scene.vibe != "VELVET") OR (scene.tag.STATE in velvet_state_token); ELSE FAIL.
[RULE][VEL-270] PASS IFF (scene.vibe != "VELVET") OR (scene.tag.TYPE not in {"COMBAT","BUREAUCRACY","INDUSTRIAL_FIELD"}); ELSE FAIL.

## CONTENT

### 1) Token pools (lexical anchors)

~~~yaml
velvet_closeup_sound_token_pool:
  - "лёд"
  - "стекло"
  - "дыхание"
  - "шорох"
  - "ткань"
  - "капли"
  - "приглушённый гул"

velvet_tactile_token_pool:
  - "тёплый"
  - "мягкий"
  - "влажный"
  - "шероховатый"
  - "бархат"
  - "липкий"

velvet_light_token_pool:
  - "янтарный"
  - "лампа"
  - "тёплый свет"
  - "мягкая тень"
  - "полумрак"

velvet_dialogue_token_pool:
  - "шёпотом"
  - "тихо"
  - "почти не слышно"

velvet_forbidden_lexeme_pool_ru:
  - "баг"
  - "глитч"
  - "лаг"
  - "биткраш"
  - "клиппинг"
  - "протокол"
  - "регламент"
  - "бюрократ"
~~~

### 2) Prose constraints (decidable on prose_text)

[RULE][VEL-300] PASS IFF (scene.vibe != "VELVET") OR (NOT is_defined(prose_text)) OR any_token_in_text(prose_text, velvet_tactile_token_pool); ELSE FAIL.
[RULE][VEL-310] PASS IFF (scene.vibe != "VELVET") OR (NOT is_defined(prose_text)) OR any_token_in_text(prose_text, velvet_closeup_sound_token_pool); ELSE FAIL.
[RULE][VEL-320] PASS IFF (scene.vibe != "VELVET") OR (NOT is_defined(prose_text)) OR any_token_in_text(prose_text, velvet_light_token_pool); ELSE FAIL.
[RULE][VEL-330] PASS IFF (scene.vibe != "VELVET") OR (NOT is_defined(prose_text)) OR any_token_in_text(prose_text, velvet_dialogue_token_pool); ELSE FAIL.
[RULE][VEL-340] PASS IFF (scene.vibe != "VELVET") OR (NOT is_defined(prose_text)) OR no_token_in_text(prose_text, velvet_forbidden_lexeme_pool_ru); ELSE FAIL.

## USAGE / RESOLUTION

[DECISION][VEL-400] This document applies ONLY IF `scene.vibe == "VELVET"`; ELSE PASS.
[DECISION][VEL-410] Conflict resolution MUST follow `SPEC-PRIORITY_RESOLUTION-2215-0001`; ELSE FAIL.
[DECISION][VEL-420] This doc MUST NOT weaken CANON-VIBE_RESTLESS-GLOBAL-2215-0001 outside scenes where `scene.vibe == "VELVET"`; ELSE FAIL.

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-VIBE_VELVET-GLOBAL-2215-0001
role_type: RULE
export:
  - rule_id: VEL-240
    intent: "gate: VELVET requires ZONE in velvet_zone_token"
    inputs: [scene.vibe, scene.tag.ZONE]
    outputs: [velvet_requirements, velvet_zone_token]
  - rule_id: VEL-250
    intent: "gate: VELVET requires TYPE in velvet_type_token"
    inputs: [scene.vibe, scene.tag.TYPE]
    outputs: [velvet_requirements, velvet_type_token]
  - rule_id: VEL-260
    intent: "gate: VELVET requires STATE in velvet_state_token"
    inputs: [scene.vibe, scene.tag.STATE]
    outputs: [velvet_requirements, velvet_state_token]
  - rule_id: VEL-340
    intent: "forbid digital/bureaucratic lexemes in velvet prose when prose_text is defined"
    inputs: [scene.vibe, prose.text]
    outputs: [velvet_forbidden_lexeme_pool_ru, velvet_requirements]
config:
  velvet_zone_token_ref: "DEFINITIONS.velvet_zone_token"
  velvet_type_token_ref: "DEFINITIONS.velvet_type_token"
  velvet_state_token_ref: "DEFINITIONS.velvet_state_token"
  velvet_forbidden_lexeme_pool_ru_ref: "CONTENT.velvet_forbidden_lexeme_pool_ru"
  vibe_field: "scene.vibe"
  vibe_alias_field: "scene.tag.VIBE"
~~~

## FORBIDDEN

[FORBIDDEN][VEL-900] Treating this doc as applicable when `scene.vibe != "VELVET"`.
[FORBIDDEN][VEL-910] Consuming NON-NORMATIVE content as constraints or facts.

## NON-NORMATIVE

~~~text
Example only (non-normative):
«Она смотрела сквозь бокал, и свет лампы плавился в янтаре. Звук города остался где-то за стеклом, превратившись в приглушённый гул. В комнате слышно было только дыхание и шорох ткани».
~~~
