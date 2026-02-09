---
id: CANON-SYSTEM_ONTOLOGY-GLOBAL-2215-0001
title: >
  System Ontology — Definitions and World Invariants (2215)
class: canon
status: draft
version: 1.0.0
prefix: SONT
doc_language: en-US
prose_language: ru-RU
inputs:
  - CANON-CONFLICT-GLOBAL-2215-0001
  - CANON-SYSTEMS-GLOBAL-2215-0001
depends_on:
  - SPEC-DOC_STYLE-2215-0001
  - SPEC-PRIORITY_RESOLUTION-2215-0001
scope: >
  STATE-канон. Формальные определения примитивов System и инварианты среды.
  Не содержит процедур, полномочий, baseline-логики и причинно-следственных объяснений.
---

## LLM-INTENT

ROLE_TYPE: STATE
SCOPE: define System primitives and world invariants
INPUTS: [CANON-CONFLICT-GLOBAL-2215-0001, CANON-SYSTEMS-GLOBAL-2215-0001]
OUTPUTS: [system_primitives, world_invariants]
FORBIDDEN: [procedures, mandates, activation_logic, narrative_prose, numeric_parameters]

## DEFINITIONS

[FACT][SONT-010] `System` = критический социотехнический контур управления регионом или городом, включающий инфраструктуру, алгоритмы, KPI, автоматизацию, наблюдаемость и контуры доступа.
[FACT][SONT-020] `Systemic_Asset` = компонент System, нарушение которого изменяет Safety_Impact или Sovereignty_Impact.
[FACT][SONT-030] `Systemic_Channel` = способ воздействия на System через интерфейс, доступ, уязвимость, данные или цепочку поставки.
[FACT][SONT-040] `Systemic_Hazard` = режим System, при котором она производит или усиливает ущерб либо теряет управляемость.
[FACT][SONT-050] `Safety_Impact` = ущерб людям, организациям или инфраструктуре, вызванный Systemic_Hazard.
[FACT][SONT-060] `Sovereignty_Impact` = подрыв государственного суверенитета через потерю управляемости или доверенной наблюдаемости System.

## INVARIANTS

[DECISION][SONT-100] Примитивы SONT-010..SONT-060 MUST использоваться как базовые определения по всему корпусу.
[FORBIDDEN][SONT-110] Переопределение SONT-010..SONT-060 в других документах.
[FORBIDDEN][SONT-120] Трактовка System как субъекта, воли или намеренного врага.
[FORBIDDEN][SONT-130] Трактовка System как тождественной государству.
[DECISION][SONT-140] Любое вмешательство в System MUST трактоваться как изменение режимов System.
[DECISION][SONT-150] Устранение отдельного актора MUST NOT трактоваться как устранение Systemic_Hazard.

## CONTENT

### System

[STATE][SONT-200] System является доминирующей средой рисков и конфликтов.
[STATE][SONT-210] Сложность и связность System превышают возможности полного централизованного контроля.

### State

[STATE][SONT-300] Государство является легитимным регулятором System.
[STATE][SONT-310] Государство не обладает полнотой управления System.

### Corporations

[STATE][SONT-400] Корпорации адаптируются к режимам System и не контролируют её целиком.

### Society

[STATE][SONT-500] Люди являются операторами и носителями режимов System.
[STATE][SONT-510] Человек может выступать активным узлом Systemic_Channel.

### Hazard Origin

[STATE][SONT-600] Источник Systemic_Hazard может находиться как внутри государственных контуров, так и вне их.

## USAGE / RESOLUTION

[DECISION][SONT-800] Документы корпуса, использующие примитивы SONT-010..SONT-060, MUST разрешать их смысл через этот документ.
[DECISION][SONT-810] Разрешение конфликтов MUST следовать SPEC-PRIORITY_RESOLUTION-2215-0001.

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-SYSTEM_ONTOLOGY-GLOBAL-2215-0001
role_type: STATE
export:
  - metric: system_primitives
    owner_domain: SYSTEM
    values:
      core: "SONT-010..SONT-060"
      p90: none
      range: none
    unit: none
  - metric: world_invariants
    owner_domain: SYSTEM
    values:
      core: "SONT-200..SONT-600"
      p90: none
      range: none
    unit: none
~~~

## FORBIDDEN

[FORBIDDEN][SONT-900] Процедуры, полномочия, ордера, процессы активации кейсов.
[FORBIDDEN][SONT-910] Baseline-значения, числовые параметры, эксплуатационные нормы.
[FORBIDDEN][SONT-920] Каузальные объяснения, нарративные описания и сценография.

## NON-NORMATIVE

~~~text
Источник: THESIS-SYSTEM-2215-0001, THESIS-STATE-SOCIETY-2215-0001.
Назначение: единый источник онтологических определений и инвариантов.
~~~
