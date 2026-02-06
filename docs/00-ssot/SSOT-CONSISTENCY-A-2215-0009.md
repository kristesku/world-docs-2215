---
id: SSOT-CONSISTENCY-A-2215-0009
title: >
  Consistency Matrix — Scenario A (2215)
class: ssot
status: draft
version: 0.1.0
inputs: []
depends_on:
  - SPEC-DOC-0001
  - SSOT-SCENARIO-A-2215-0001
  - SSOT-ECONOMY-A-2215-0003
  - SSOT-DEMOGRAPHY-A-2215-0002
  - SSOT-AUTOMATION-A-2215-0004
  - SSOT-ENERGY-A-2215-0004
  - SSOT-CLIMATE-A-2215-0004
  - SSOT-GOVERNANCE-SECURITY-A-2215-0005
  - SSOT-URBANISM-A-2215-0007
scope: >
  Единая матрица согласованности SSOT корпуса 2215 (Scenario A): перечень
  ключевых метрик/инвариантов, их допустимые значения и статусы
  согласования (CANON / DUAL-ALLOWED / CONFLICT), плюс правила
  использования в downstream-документах (baseline/canon/override).
---

## 0. Scope and invariants

- [FACT] Документ применим только к ветке Scenario A (2215).
- [FACT] Документ не вводит новые факты мира; он фиксирует согласованность уже существующих SSOT.
- [FACT] Документ является точкой учёта расхождений и допускаемых «двойных» представлений (core vs p90).
- [FACT] Любая новая числовая метрика, добавленная в SSOT, должна быть внесена в матрицу.

## 1. Consistency status model

- [FACT] Статусы согласованности метрики:
  - [FACT] CANON: единственное значение/диапазон; другие SSOT не противоречат.
  - [FACT] DUAL-ALLOWED: допускается сосуществование двух представлений (обычно core_metrics_2215 vs p90-допуск Scenario A).
  - [FACT] CONFLICT: два SSOT утверждают несовместимые значения без явного допуска; требует закрытия canon/override.

- [FACT] Политика downstream-использования (до появления canon/override):
  - [FACT] Для baseline по умолчанию используется core_metrics_2215 из SSOT-SCENARIO, если метрика имеет статус DUAL-ALLOWED.
  - [FACT] p90-допуск Scenario A может использоваться только при явном указании в canon/override или при формализации как «upper-tail case».

## 2. Master metrics (2215) — numeric

| metric_key | value (core) | value (upper-tail / p90) | status | authoritative_source | secondary_sources | notes |
| --- | --- | --- | --- | --- | --- | --- |
| population_billion | ~8.8 (≈8–9) | n/a | CANON | SSOT-SCENARIO | SSOT-DEMOGRAPHY | демографическая стабильность; пик пройден |
| life_expectancy_years | ~100 | n/a | CANON | SSOT-SCENARIO | SSOT-DEMOGRAPHY, SSOT-LIFE | longevity = инфраструктурная норма |
| warming_C_vs_preindustrial | ~2.5 (≈2–2.5) | n/a | CANON | SSOT-SCENARIO | SSOT-CLIMATE | климат стабилизирован на новом уровне |
| sea_level_m | ~1.7 (≈1.5–2.0) | n/a | CANON | SSOT-SCENARIO | SSOT-CLIMATE | береговая адаптация обязательна |
| primary_energy_TW | ~30 (p50≈30) | p90≈60 (допуск диапазона) | DUAL-ALLOWED | SSOT-SCENARIO | SSOT-ENERGY, SSOT-ECONOMY | в corpus используется 30 TW как рабочий core |
| low_carbon_share_percent | ~95 (≈90–95) | n/a | CANON | SSOT-SCENARIO | SSOT-ENERGY, SSOT-ECONOMY | доля «чистой» энергии — инвариант Scenario A |
| ai_compute_EJ_per_year | ~75 | ~150–200 | DUAL-ALLOWED | SSOT-SCENARIO (core) | SSOT-AUTOMATION, SSOT-ENERGY | core vs upper-tail допускается до canon/override |
| labor_automation_percent_tasks | ~80 | ~90 | DUAL-ALLOWED | SSOT-SCENARIO (core) | SSOT-AUTOMATION, SSOT-ECONOMY | core vs upper-tail допускается до canon/override |
| gdp_ppp_relative_to_2025 | ~30 | ~30–50 (p90) | DUAL-ALLOWED | SSOT-SCENARIO (core) | SSOT-ECONOMY | core=30 как рабочий; p90 — «богатый хвост» |

## 3. Domain invariants — non-numeric (must not drift)

### 3.1 Energy system invariants

- [FACT] Генерация и сети трактуются как критическая инфраструктура с резервированием и восстановлением.
- [FACT] Сети/распределение/накопители могут быть ограничителем качества энергоснабжения при отсутствии глобального дефицита генерации.
- [FACT] Доли по типам генерации (ВИЭ/атом/источники нового поколения) заданы качественно; точные проценты не фиксируются без canon/override.

### 3.2 Climate invariants

- [FACT] Климат — фон стабилизации, а не сюжет коллапса.
- [FACT] Экстремальные явления остаются повышенными относительно XX века и проектируются как управляемый риск-профиль.
- [FACT] Адаптация опирается на водные системы, береговую защиту и устойчивость агросистем; региональная неравномерность сохраняется.

### 3.3 Urbanism invariants (dependencies on energy/climate)

- [FACT] Городская среда по умолчанию 24/7 функциональна и опирается на непрерывные сервисы.
- [FACT] Климатические экстремумы нагружают инфраструктуры, но не «ломают» города системно в Scenario A.
- [FACT] Сбойные сценарии проявляются как локальная деградация сервисов и перераспределение приоритетов, а не как тотальный коллапс.

### 3.4 Governance/Security invariants (coupling to infra)

- [FACT] Надгосударственная координация реализуется через договоры, стандарты и режимы (без мирового правительства).
- [FACT] Классические большие межгосударственные войны не являются нормой.
- [FACT] Кибер- и инфраструктурная безопасность является центральной осью конфликтов и давления.

## 4. Open consistency risks (tracked here until resolved)

- [UNKNOWN] Какой режим будет каноническим для сцен: ai_compute_EJ_per_year = ~75 (core) или upper-tail ~150–200.
- [UNKNOWN] Какой режим будет каноническим для сцен: labor_automation_percent_tasks = ~80 (core) или upper-tail ~90.
- [UNKNOWN] Является ли primary_energy_TW фиксируемым как «~30» для романа или допускается «энергоизобилие ближе к p90» как фон для ключевых локаций.

## 5. Closure paths (how UNKNOWN becomes closed)

- [FACT] Закрытие DUAL-ALLOWED и UNKNOWN выполняется через документы класса canon или override.
- [FACT] После закрытия:
  - [FACT] статус метрики меняется на CANON;
  - [FACT] downstream (baseline/canon) обновляются под выбранное значение;
  - [FACT] альтернативное значение остаётся допустимым только как явно помеченный «upper-tail case» (если требуется).
