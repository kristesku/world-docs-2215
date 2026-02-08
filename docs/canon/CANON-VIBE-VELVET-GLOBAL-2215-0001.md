---
id: CANON-VIBE-VELVET-GLOBAL-2215-0001
title: >
  Atmosphere Reference — Melody Gardot ("Velvet / Noir" Profile)
class: canon
status: draft
version: 1.0.1
prefix: VEL
doc_language: ru-RU
prose_language: ru-RU
inputs:
  - CANON-VIBE-RESTLESS-GLOBAL-2215-0001
depends_on:
  - SPEC-DOC-ID-2215-0001
  - SPEC-DOC-STYLE-2215-0001
  - SPEC-PRIORITY-RESOLUTION-2215-0001
scope: >
  RULE-канон для сцен глубокой интимности, “дорогого” нуара, уязвимости и
  аналоговой теплоты: решаемые требования к лексике и тегам сцены.
  Без SSOT-метрик и без инфодампа.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: enforce velvet constraints when scene.tag.VIBE == "VELVET"
INPUTS: [scene.tag.VIBE, scene.tag.ZONE, scene.tag.TYPE, scene.tag.STATE, prose.text]
OUTPUTS: [velvet_zone_token, velvet_type_token, velvet_state_token, velvet_forbidden_lexeme_pool_ru, velvet_requirements]
FORBIDDEN: [industrial_noise_dominance, haste, synthetic_pop_dominance, bureaucratic_language_dominance]

## DEFINITIONS

[FACT][VEL-010] `scene.tag.VIBE` = строковый тег вайба сцены.
[FACT][VEL-020] `scene.tag.ZONE` = строковый тег зоны сцены.
[FACT][VEL-030] `scene.tag.TYPE` = строковый тег типа сцены.
[FACT][VEL-040] `scene.tag.STATE` = строковый тег состояния сцены.
[FACT][VEL-050] `prose.text` = диетический текст сцены как строка.
[FACT][VEL-060] `prose_text` = строка, равная `prose.text`.

[FACT][VEL-070] `defined_token(x)` = PASS IFF `x` существует AND `x != ""`; ELSE FAIL.
[FACT][VEL-080] `token_in_text(text, token)` = PASS IFF `text` содержит `token` как подстроку; ELSE FAIL.
[FACT][VEL-090] `any_token_in_text(text, pool)` = PASS IFF ∃`t`∈`pool`: `token_in_text(text,t)`; ELSE FAIL.
[FACT][VEL-100] `no_token_in_text(text, pool)` = PASS IFF ∀`t`∈`pool`: NOT `token_in_text(text,t)`; ELSE FAIL.

[FACT][VEL-110] `velvet_zone_token` ∈ {"SAFE_HOUSE","VIP_SECTOR","BLIND_ZONE"}.
[FACT][VEL-120] `velvet_type_token` ∈ {"INTIMACY","SEDUCTION","CONFESSION","RECOVERY","TRUST_ENGINEERING"}.
[FACT][VEL-130] `velvet_state_token` ∈ {"EMOTIONAL_OPENNESS","SEDATION","CONTROLLED_TRUST"}.

## INVARIANTS

[RULE][VEL-200] PASS IFF scene.tag.VIBE != "VELVET" OR defined_token(scene.tag.ZONE); ELSE FAIL.
[RULE][VEL-210] PASS IFF scene.tag.VIBE != "VELVET" OR defined_token(scene.tag.TYPE); ELSE FAIL.
[RULE][VEL-220] PASS IFF scene.tag.VIBE != "VELVET" OR defined_token(scene.tag.STATE); ELSE FAIL.

[RULE][VEL-230] PASS IFF scene.tag.VIBE != "VELVET" OR scene.tag.ZONE ∈ {"SAFE_HOUSE","VIP_SECTOR","BLIND_ZONE"}; ELSE FAIL.
[RULE][VEL-240] PASS IFF scene.tag.VIBE != "VELVET" OR scene.tag.TYPE ∈ {"INTIMACY","SEDUCTION","CONFESSION","RECOVERY","TRUST_ENGINEERING"}; ELSE FAIL.
[RULE][VEL-250] PASS IFF scene.tag.VIBE != "VELVET" OR scene.tag.STATE ∈ {"EMOTIONAL_OPENNESS","SEDATION","CONTROLLED_TRUST"}; ELSE FAIL.
[RULE][VEL-260] PASS IFF scene.tag.VIBE != "VELVET" OR scene.tag.TYPE NOT IN {"COMBAT","BUREAUCRACY","INDUSTRIAL_FIELD"}; ELSE FAIL.

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

[RULE][VEL-300] PASS IFF scene.tag.VIBE != "VELVET" OR any_token_in_text(prose_text, velvet_tactile_token_pool); ELSE FAIL.
[RULE][VEL-310] PASS IFF scene.tag.VIBE != "VELVET" OR any_token_in_text(prose_text, velvet_closeup_sound_token_pool); ELSE FAIL.
[RULE][VEL-320] PASS IFF scene.tag.VIBE != "VELVET" OR any_token_in_text(prose_text, velvet_light_token_pool); ELSE FAIL.
[RULE][VEL-330] PASS IFF scene.tag.VIBE != "VELVET" OR any_token_in_text(prose_text, velvet_dialogue_token_pool); ELSE FAIL.
[RULE][VEL-340] PASS IFF scene.tag.VIBE != "VELVET" OR no_token_in_text(prose_text, velvet_forbidden_lexeme_pool_ru); ELSE FAIL.

## USAGE / RESOLUTION

[DECISION][VEL-400] IF scene.tag.VIBE == "VELVET" THEN VEL-200..VEL-340 MUST be evaluated as constraints; ELSE PASS.
[DECISION][VEL-410] Conflict resolution MUST follow SPEC-PRIORITY-RESOLUTION-2215-0001; ELSE FAIL.
[DECISION][VEL-420] This doc MUST NOT weaken CANON-VIBE-RESTLESS-GLOBAL-2215-0001 outside scenes where scene.tag.VIBE == "VELVET"; ELSE FAIL.

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-VIBE-VELVET-GLOBAL-2215-0001
role_type: RULE
export:
  - rule_id: VEL-230
    intent: "gate: VELVET requires ZONE in velvet_zone_token"
    inputs: [scene.tag.ZONE, scene.tag.VIBE]
    outputs: [velvet_requirements]
  - rule_id: VEL-240
    intent: "gate: VELVET requires TYPE in velvet_type_token"
    inputs: [scene.tag.TYPE, scene.tag.VIBE]
    outputs: [velvet_requirements]
  - rule_id: VEL-250
    intent: "gate: VELVET requires STATE in velvet_state_token"
    inputs: [scene.tag.STATE, scene.tag.VIBE]
    outputs: [velvet_requirements]
  - rule_id: VEL-340
    intent: "forbid digital/bureaucratic lexemes in velvet prose"
    inputs: [prose.text, scene.tag.VIBE]
    outputs: [velvet_forbidden_lexeme_pool_ru, velvet_requirements]
~~~

## FORBIDDEN

[FORBIDDEN][VEL-900] Treating this doc as applicable when scene.tag.VIBE != "VELVET".
[FORBIDDEN][VEL-910] Consuming NON-NORMATIVE content as constraints or facts.

## NON-NORMATIVE

~~~text
Example only (non-normative):
«Она смотрела сквозь бокал, и свет лампы плавился в янтаре. Звук города остался где-то за стеклом, превратившись в приглушённый гул. В комнате слышно было только дыхание и шорох ткани».
~~~
