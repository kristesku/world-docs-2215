---
id: CANON-METRICS-0002
title: >
  Метрики романа (2215) — выбор режима (core vs upper-tail) и правила использования чисел
class: canon
status: draft
version: 0.1.0
inputs:
  - SSOT-SCENARIO-A-2215-0001
  - SSOT-ENERGY-A-2215-0004
  - SSOT-CLIMATE-A-2215-0004
  - SSOT-AUTOMATION-A-2215-0004
  - SSOT-ECONOMY-A-2215-0003
  - SSOT-DEMOGRAPHY-A-2215-0002
depends_on:
  - CANON-BASE-0001
  - CANON-SYSTEMS-0001
scope: >
  Каноническое закрытие количественных развилок SSOT (core vs p90) для романа:
  какие значения являются дефолтом сцены, какие допустимы только как редкие
  «upper-tail cases», и как в тексте обращаться с числами.
---

## 0. Rules (roman-safe numerics)

- [CANON DECISION] В тексте романа числа используются как редкие якоря.
  По умолчанию сцены опираются на качественные следствия метрик, а не на сами цифры.
- [CANON DECISION] При любом числовом упоминании обязан быть контекст:
  что измеряется, кто измеряет, и зачем это в сцене.
- [CANON CONSTRAINT] Запрещено вводить новые макро-числа, не существующие в SSOT.

## 1. Canon-default regime for the novel (baseline values)

- [CANON DECISION] Дефолтный режим романа = core_metrics_2215 как фон.
  Upper-tail (p90) допускается только как локальный/редкий режим и должен быть
  явно обозначен в каноне сцены или в override локации.

### 1.1 Earth system (climate)

- [CANON DECISION] Потепление: ~2–2.5°C (фон стабилизированного климата).
- [CANON DECISION] Уровень моря: ~1.5–2.0 м.

### 1.2 Energy

- [CANON DECISION] Primary energy: ~30 TW как дефолтный фон мира романа.
- [CANON DECISION] Low-carbon share: ~90–95% (в тексте допускается «почти всё низкоуглеродное»).
- [CANON DECISION] Верхний хвост (p90) по энергии (до ~60 TW) допускается только:
  - для отдельных супер-узлов,
  - или как “режим мобилизации/пиковых программ”,
  и не является бытовой нормой сцены.

### 1.3 AI / compute and automation

- [CANON DECISION] ai_compute_EJ_per_year: ~75 EJ/год как дефолт.
- [CANON DECISION] Upper-tail compute (~150–200 EJ/год) допустим только как:
  - редкая концентрация (узлы/экстерритории/кластеры),
  - или как предмет расследования (аномальная нагрузка, необычный режим).
- [CANON DECISION] labor_automation_percent_tasks: ~80% как дефолт, ~90% — верхний хвост для отдельных доменов/операторов.

### 1.4 Economy and population

- [CANON DECISION] GDP (PPP) relative to 2025: ~30× как дефолт; p90-диапазон (выше) — только как «богатый хвост» и без точных цифр в сценах.
- [CANON DECISION] Population: ~8–9 млрд как фон.
- [CANON DECISION] Life expectancy: ~100 лет как фон.

## 2. How numbers appear in scenes (allowed manifestations)

- [CANON DECISION] Числа проявляются через артефакты:
  - отчёт оператора/регулятора,
  - KPI-дашборд,
  - страховку/сертификацию,
  - протокол инцидента,
  - график нагрузки/лимитов.
- [CANON DECISION] Upper-tail значения появляться могут, но только как:
  - “аномалия”, “эксперимент”, “особый режим”, “экстерритория”,
  - и всегда как причина процедурной реакции.

## 3. Binding to existing CANON docs

- [FACT] География/масштаб/тон задаются CANON-BASE-0001.
- [FACT] Механика антагониста как KPI/контуры исключений — CANON-CONFLICT-0001.
- [FACT] Операторы/экстерритории/наблюдаемость — CANON-SYSTEMS-0001.
