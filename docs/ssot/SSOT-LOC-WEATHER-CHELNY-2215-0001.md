---
id: SSOT-LOC-WEATHER-CHELNY-2215-0001
title: >
  RU 2215 — Набережные Челны: Погодный режим (дефолты) — Scene-Consumed SSOT
class: ssot
status: draft
version: 0.1.0
prefix: CHW
doc_language: ru-RU
prose_language: ru-RU
inputs: []
depends_on:
  - SPEC-DOC-STYLE-2215-0001
scope: >
  Декларативные SSOT-метрики погодного режима для сцен в Набережных Челнах (2215).
  Документ предназначен для потребления генератором прозы как дефолт и не содержит
  причинности, объяснений, клише-ограничений или нарративной логики.
---

## LLM-INTENT

ROLE_TYPE: STATE
SCOPE: scene-consumed default weather metrics for Chelny-2215 (declarative only)
INPUTS: []
OUTPUTS: [weather_metrics]
FORBIDDEN: [causality, narrative_explanations, noir_tropes, utopia_sterility, implicit_overrides]

## DEFINITIONS

[FACT][CHW-010] `weather_profile` = набор метрик погодного режима, потребляемый сценой как дефолт.
[FACT][CHW-020] `scene_consumed` = документ, чьи exports используются генератором прозы как дефолтные ограничения.

## INVARIANTS

[DECISION][CHW-030] Этот документ экспортирует только STATE-метрики; любая интерпретация “почему так” FORBIDDEN.
[DECISION][CHW-031] Переопределение метрик `weather_profile` допускается только через Override/Scene по правилам приоритета корпуса.

## CONTENT

[STATE][CHW-040] chelny.weather_profile.mode = SOFT_GREY_COMFORT.
[STATE][CHW-041] chelny.weather_profile.sky_texture = TEXTURED_CONCRETE.
[STATE][CHW-042] chelny.weather_profile.temperature_c = [22, 24].
[STATE][CHW-043] chelny.weather_profile.wind = WARM_LIGHT_BREEZE.
[STATE][CHW-044] chelny.weather_profile.vibe = DECEPTIVE_CALM.

## USAGE / RESOLUTION

[DECISION][CHW-050] Любая сцена в RU-16/Челны MUST использовать `chelny.weather_profile.*` как дефолт, если не активирован явный инцидентный контур.
[FORBIDDEN][CHW-051] Подмена дефолтов на “постоянный дождь/мрак/кислотный неон” без явного Override/Scene.

## OUTPUT CONTRACT

~~~yaml
doc_id: SSOT-LOC-WEATHER-CHELNY-2215-0001
role_type: STATE
export:
  - metric: chelny.weather_profile.mode
    owner_domain: URBANISM
    values: { core: SOFT_GREY_COMFORT, p90: none, range: none }
    unit: none
  - metric: chelny.weather_profile.sky_texture
    owner_domain: URBANISM
    values: { core: TEXTURED_CONCRETE, p90: none, range: none }
    unit: none
  - metric: chelny.weather_profile.temperature_c
    owner_domain: URBANISM
    values: { core: none, p90: none, range: [22, 24] }
    unit: C
  - metric: chelny.weather_profile.wind
    owner_domain: URBANISM
    values: { core: WARM_LIGHT_BREEZE, p90: none, range: none }
    unit: none
  - metric: chelny.weather_profile.vibe
    owner_domain: URBANISM
    values: { core: DECEPTIVE_CALM, p90: none, range: none }
    unit: none
~~~

## FORBIDDEN

[FORBIDDEN][CHW-900] Добавление причинности/объяснений в этот документ.
[FORBIDDEN][CHW-901] Использование неэкспортируемых фрагментов как источника правил или фактов.
[FORBIDDEN][CHW-902] Введение новых погодных метрик без явного расширения OUTPUT CONTRACT.

## NON-NORMATIVE
