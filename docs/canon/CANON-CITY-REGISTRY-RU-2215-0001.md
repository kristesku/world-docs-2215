---
id: CANON-CITY-REGISTRY-RU-2215-0001
title: >
  RU 2215 — City Anchors Registry: Chelny / Chelny–Yelabuga / Moscow (Token Pools)
class: canon
status: draft
version: 0.1.0
prefix: CITYA
doc_language: ru-RU
prose_language: ru-RU
inputs: []
depends_on:
  - SPEC-DOC-STYLE-2215-0001
  - SPEC-PRIORITY-RESOLUTION-2215-0001
scope: >
  STATE-реестр токенов city anchors: нормализованные пулы якорей для сцен
  (Chelny / Chelny–Yelabuga / Moscow + contrast). Не содержит правил применения
  (это в CANON-CITY-RU-2215-0007 / RULE-доках) и не вводит SSOT-метрики.
---

## LLM-INTENT

ROLE_TYPE: STATE
SCOPE: define canonical city anchor token pools as state registry (no rules, no prose)
INPUTS: []
OUTPUTS: [city_anchor_pools]
FORBIDDEN: [implicit_defaults, rule_definition, narrative_prose, numeric_city_metrics]

## DEFINITIONS

[FACT][CITYA-010] `city_key` ∈ {CHELNY, CHELNY_YELABUGA, MOSCOW, CONTRAST}.
[FACT][CITYA-020] `city_anchor_token` = UPPER_SNAKE_CASE token used to anchor scene perception without exposition.
[FACT][CITYA-030] `city_anchor_pool` = map {city_key -> set(city_anchor_token)}.
[FACT][CITYA-040] `token_pool_owner_domain` = "CITY_ANCHORS_RU".

## INVARIANTS

[DECISION][CITYA-050] This document MUST define city_anchor_pool for all city_key values; ELSE FAIL.
[DECISION][CITYA-060] Tokens MUST be UPPER_SNAKE_CASE; ELSE FAIL.
[FORBIDDEN][CITYA-070] Defining application rules or budgets here (belongs to RULE/INTERFACE); ELSE FAIL.
[FORBIDDEN][CITYA-080] Numeric city metrics in this document; ELSE FAIL.

## CONTENT

[STATE][CITYA-100] city_anchor_pool.CHELNY.tokens = {SEASON_SUMMER_WARM_NOT_SUNNY, SKY_GREY_OVERCAST, LIGHT_DIFFUSE_LOW_CONTRAST, MATERIALS_MATTE_MICROTEXTURE, GLASS_LOW_GLARE_NOT_MIRROR, FORMS_CALM_LARGE_RADII, PRINCIPLE_EVERYTHING_LARGER, VOID_COMFORT_LARGE_SPACES, RESIDENTS_EASIER_THAN_VISITORS, AWE_WITHOUT_DESIRE}.
[STATE][CITYA-110] city_anchor_pool.CHELNY_YELABUGA.tokens = {TWO_CORE_AGGLOMERATION, KAMA_CORRIDOR_FUNCTION_DENSE, INTENTIONAL_BREAKS_VOID, TRANSITION_FEELS_CITY_TYPE_SWITCH}.
[STATE][CITYA-120] city_anchor_pool.MOSCOW.tokens = {ROLE_EDGE_OF_TIME, MODE_CONTINUOUS_DEPLOYMENT, POSSIBILITIES_DENSITY_MAX, COGNITIVE_LOAD_HIGH, NOT_DUBAI_SHOWOFF, OVERCARING_RICH_PARENT_VIBE}.
[STATE][CITYA-130] city_anchor_pool.CONTRAST.tokens = {CHELNY_FUTURE_AS_BACKGROUND, MOSCOW_FUTURE_AS_EVENT}.

## USAGE / RESOLUTION

[DECISION][CITYA-200] Consumers MUST treat only OUTPUT CONTRACT exports as consumable semantics; ELSE FAIL.
[DECISION][CITYA-210] Conflict resolution MUST follow SPEC-PRIORITY-RESOLUTION-2215-0001; ELSE FAIL.

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-CITY-REGISTRY-RU-2215-0001
role_type: STATE
export:
  - metric: city_anchor_pool.CHELNY.tokens
    owner_domain: CITY_ANCHORS_RU
    values:
      core:
        - SEASON_SUMMER_WARM_NOT_SUNNY
        - SKY_GREY_OVERCAST
        - LIGHT_DIFFUSE_LOW_CONTRAST
        - MATERIALS_MATTE_MICROTEXTURE
        - GLASS_LOW_GLARE_NOT_MIRROR
        - FORMS_CALM_LARGE_RADII
        - PRINCIPLE_EVERYTHING_LARGER
        - VOID_COMFORT_LARGE_SPACES
        - RESIDENTS_EASIER_THAN_VISITORS
        - AWE_WITHOUT_DESIRE
      p90: none
      range: none
    unit: none
  - metric: city_anchor_pool.CHELNY_YELABUGA.tokens
    owner_domain: CITY_ANCHORS_RU
    values:
      core:
        - TWO_CORE_AGGLOMERATION
        - KAMA_CORRIDOR_FUNCTION_DENSE
        - INTENTIONAL_BREAKS_VOID
        - TRANSITION_FEELS_CITY_TYPE_SWITCH
      p90: none
      range: none
    unit: none
  - metric: city_anchor_pool.MOSCOW.tokens
    owner_domain: CITY_ANCHORS_RU
    values:
      core:
        - ROLE_EDGE_OF_TIME
        - MODE_CONTINUOUS_DEPLOYMENT
        - POSSIBILITIES_DENSITY_MAX
        - COGNITIVE_LOAD_HIGH
        - NOT_DUBAI_SHOWOFF
        - OVERCARING_RICH_PARENT_VIBE
      p90: none
      range: none
    unit: none
  - metric: city_anchor_pool.CONTRAST.tokens
    owner_domain: CITY_ANCHORS_RU
    values:
      core:
        - CHELNY_FUTURE_AS_BACKGROUND
        - MOSCOW_FUTURE_AS_EVENT
      p90: none
      range: none
    unit: none
~~~

## FORBIDDEN

[FORBIDDEN][CITYA-900] Treating this registry as scene defaults without explicit applicability logic in INTERFACE/RULE docs.
[FORBIDDEN][CITYA-910] Introducing new city_key values.
[FORBIDDEN][CITYA-920] Consuming NON-NORMATIVE as semantics.

## NON-NORMATIVE

~~~text
This file is STATE-only: token pools, no rules.
Application rules live in CANON-CITY-RU-2215-0007 (INTERFACE) and related RULE docs.
~~~
