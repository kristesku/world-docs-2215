---
id: SSOT-LOC-WEATHER-CHELNY-2215-0001
title: >
  RU 2215 — Naberezhnye Chelny: Weather Defaults (Scene-Consumed SSOT)
class: ssot
status: draft
prefix: CHW
doc_language: en-US
inputs: []
depends_on:
  - SPEC-DOC_STYLE-2215-0001
references: []
scope: >
  Declarative SSOT metrics for default weather profile in Naberezhnye Chelny (2215),
  intended to be consumed by scene generation as defaults. Contains no causality,
  explanations, trope constraints, or narrative logic.
---

## LLM-INTENT

ROLE_TYPE: STATE
SCOPE: scene-consumed default weather metrics for Chelny-2215 (declarative only)
INPUTS: []
OUTPUTS: [weather_metrics]
FORBIDDEN: [causality, narrative_explanations, noir_tropes, utopia_sterility, implicit_overrides]

## DEFINITIONS

[FACT][CHW-010] weather_profile = a set of weather-regime metrics consumed by a scene as defaults.
[FACT][CHW-020] scene_consumed = a document whose exports are used by prose generators as default constraints.

## INVARIANTS

[DECISION][CHW-030] This document exports STATE metrics only; any “why” interpretation is forbidden.
[DECISION][CHW-040] Overriding weather_profile metrics is allowed only via Override/Scene per corpus precedence rules.

## CONTENT

[STATE][CHW-100] chelny.weather_profile.mode = SOFT_GREY_COMFORT
[STATE][CHW-110] chelny.weather_profile.sky_texture = TEXTURED_CONCRETE
[STATE][CHW-120] chelny.weather_profile.temperature_c = [22, 24]
[STATE][CHW-130] chelny.weather_profile.wind = WARM_LIGHT_BREEZE
[STATE][CHW-140] chelny.weather_profile.vibe = DECEPTIVE_CALM

## OUTPUT CONTRACT

~~~yaml
doc_id: SSOT-LOC-WEATHER-CHELNY-2215-0001
role_type: STATE
export:
  - metric: chelny.weather_profile.mode
    owner_domain: URBANISM
    values:
      core: SOFT_GREY_COMFORT
      p90: none
      range: none
    unit: none
  - metric: chelny.weather_profile.sky_texture
    owner_domain: URBANISM
    values:
      core: TEXTURED_CONCRETE
      p90: none
      range: none
    unit: none
  - metric: chelny.weather_profile.temperature_c
    owner_domain: URBANISM
    values:
      core: none
      p90: none
      range: [22, 24]
    unit: C
  - metric: chelny.weather_profile.wind
    owner_domain: URBANISM
    values:
      core: WARM_LIGHT_BREEZE
      p90: none
      range: none
    unit: none
  - metric: chelny.weather_profile.vibe
    owner_domain: URBANISM
    values:
      core: DECEPTIVE_CALM
      p90: none
      range: none
    unit: none
~~~

## FORBIDDEN

[FORBIDDEN][CHW-900] Adding causality or explanations to this document.
[FORBIDDEN][CHW-910] Using non-exported fragments as sources of rules or facts.
[FORBIDDEN][CHW-920] Introducing new weather metrics without explicit OUTPUT CONTRACT extension.

## NON-NORMATIVE

~~~text
Empty by design.
~~~
