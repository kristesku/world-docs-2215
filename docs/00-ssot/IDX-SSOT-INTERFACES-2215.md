---
id: IDX-SSOT-INTERFACES-2215
title: >
  SSOT Interfaces Index — 2215 (Scenario A)
class: idx
status: draft
version: 0.1.0
inputs: []
depends_on:
  - SPEC-DOC-0001
  - SSOT-SCENARIO-A-2215-0001
  - SSOT-CONSISTENCY-A-2215-0009
  - SSOT-ECONOMY-A-2215-0003
  - SSOT-DEMOGRAPHY-A-2215-0002
  - SSOT-AUTOMATION-A-2215-0004
  - SSOT-ENERGY-A-2215-0004
  - SSOT-CLIMATE-A-2215-0004
  - SSOT-GOVERNANCE-SECURITY-A-2215-0005
  - SSOT-LIFE-A-2215-0007
  - SSOT-URBANISM-A-2215-0007
  - SSOT-SPACE-INDUSTRY-A-2215-0006
scope: >
  Ручной семантический индекс интерфейсов SSOT-доменов корпуса 2215 (Scenario A):
  кто что определяет, что потребляет, и что запрещено определять (чтобы
  исключить протечки между доменами и дублирование источников истины).
---

## 0. Rules

- [DECISION] Этот индекс задаёт границы доменов SSOT и является нормативным для baseline/canon/override.
- [DECISION] Любая новая SSOT-метрика обязана:
  - быть отнесена к одному “defines” домену;
  - быть добавлена в SSOT-CONSISTENCY.
- [DECISION] Если два SSOT начинают определять одну и ту же метрику — это ошибка, пока не оформлено как DUAL-ALLOWED в SSOT-CONSISTENCY.
- [DECISION] Baseline не имеет права “выдумывать” метрики: только ссылаться на SSOT и задавать DEFAULT/FORBIDDEN.

## 1. SSOT domain interface matrix

| domain (SSOT) | defines (owns truth) | consumes (reads) | must NOT define (forbidden drift) | typical outputs to downstream |
| --- | --- | --- | --- | --- |
| SCENARIO | core_metrics_2215; p10/p50/p90 рамки; допустимые “upper-tail cases” | — | локальные детали среды; институциональные механики; бытовые нормы | baseline/canon ориентиры и диапазоны |
| CONSISTENCY | статусы CANON/DUAL/CONFLICT для метрик; правила выбора core vs p90 | все SSOT | новые факты мира; новые числа | выбор значений для baseline/canon |
| ENERGY | первичная энергия (TW); надежность/сети/накопители; energy failure modes; качественная структура генерации | SCENARIO, ECONOMY, CLIMATE, AUTOMATION | GDP; демография; политические режимы; климатические числа | baseline энергогарантий, ограничения сцен |
| CLIMATE | °C; sea level; режим экстремумов; adaptation layer (вода/берег/агро) как фон | SCENARIO, ENERGY | energy mix; автоматизация; GDP | baseline климат-фона и рисков |
| ECONOMY | GDP x2025; режим роста; распределение/неравенство; структура производства | SCENARIO, ENERGY, AUTOMATION, DEMOGRAPHY | климатические числа; энергетическая физика; городские сенсорные дефолты | canon конфликтов “ресурсы/приоритеты/цепочки” |
| AUTOMATION | доля автоматизации задач; compute-energy coupling (как требование); роботизация как инфраструктура; automation failure modes | SCENARIO, ENERGY, ECONOMY | первичная энергия; климат; правовые режимы | baseline “что автоматизировано по умолчанию” |
| DEMOGRAPHY | население; TFR; урбанизация как доля; миграция как контур (качественно) | SCENARIO, ECONOMY, LIFE, CLIMATE | GDP; энергетика; “как устроен город” | baseline демо-фона, ограничения кастинга/масштабов |
| URBANISM | морфология города; режим доступа/логирования на уровне среды; транспорт как городской слой | SCENARIO, DEMOGRAPHY, ENERGY, CLIMATE, AUTOMATION, GOVERNANCE | глобальные метрики энергии/климата; макроэкономика | baseline городской среды (через LEVEL-*) |
| GOVERNANCE/SECURITY | модель суверенитета; наднациональные режимы; безопасность как контур; пределы насилия | SCENARIO, ECONOMY, ENERGY, AUTOMATION | бытовые нормы; городские дефолты сенсорики | canon процедур, ордеров, аудита, комплаенса |
| LIFE | повседневные нормы; тело/здоровье как практика; приватность как контракт | SCENARIO, DEMOGRAPHY, ECONOMY, GOVERNANCE, URBANISM | глобальные метрики; политические режимы; энергетическая физика | baseline “как живут люди” без художественности |
| SPACE-INDUSTRY | масштабы орбитальной инфраструктуры; численность; функции; ограничения | SCENARIO, ECONOMY, GOVERNANCE | “колонизация”; большие войны как норма; глобальный энергетический баланс | вспомогательные детали для canon/scene |

## 2. Common violation patterns (what to block)

- [DECISION] Запрещено вводить новые численные значения энергии/климата/compute вне доменов-владельцев.
- [DECISION] Запрещено описывать “как выглядит” в SSOT (это baseline), кроме системных инвариантов.
- [DECISION] Если текст объясняет механизм, но нет владельца метрики → переносить в домен-владелец либо в canon.
- [DECISION] Любой “dual” обязан быть отмечен как DUAL-ALLOWED в SSOT-CONSISTENCY.

## 3. Downstream usage rules (baseline / canon / override)

- [DECISION] Baseline:
  - обязан ссылаться на домен-владельца (ENERGY/CLIMATE/URBANISM/…);
  - использует core_metrics_2215 при DUAL-ALLOWED, если не задано иначе canon/override.
- [DECISION] Canon:
  - закрывает DUAL-ALLOWED выбором (или фиксирует “upper-tail case” как отдельный режим).
- [DECISION] Override:
  - локально переопределяет baseline/ssot только по правилам корпуса и с явной ссылкой на точку переопределения.
