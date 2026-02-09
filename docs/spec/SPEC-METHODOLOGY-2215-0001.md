---
id: SPEC-METHODOLOGY-2215-0001
title: >
  Corpus Methodology — Minimal Set for Prose Generation (2215)
class: spec
status: draft
version: 1.1.0
prefix: METH
doc_language: ru-RU
prose_language: ru-RU
inputs: []
depends_on:
  - IDX-CORPUS-0001
  - SPEC-DOC-ID-2215-0001
  - SPEC-DOC-STYLE-2215-0001
  - SPEC-PRIORITY-RESOLUTION-2215-0001
scope: >
  Норматив методологии корпуса 2215 для подготовки и генерации романа.
  Методология фиксирует минимально достаточный набор типов документов,
  правила их применимости, границы ответственности и правила потребления
  корпуса LLM без механизма override.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: define minimal corpus artifact set and consumption rules for deterministic prose generation
INPUTS: [IDX-CORPUS-0001, SPEC-DOC-ID-2215-0001, SPEC-DOC-STYLE-2215-0001, SPEC-PRIORITY-RESOLUTION-2215-0001]
OUTPUTS: [artifact_type_set, applicability_rules, authoring_flow, consumption_contract]
FORBIDDEN: [introducing_new_doc_classes, override_mechanism, treating_protocol_as_world_truth, consuming_non_export_content, alternative_precedence_orders]

## DEFINITIONS

[FACT][METH-010] `corpus` = множество документов, перечисленных в IDX-CORPUS-0001, потребляемых LLM строго по OUTPUT CONTRACT каждого документа.
[FACT][METH-020] `doc_class` = значение YAML `class:` документа, согласованное с `family` doc_id по SPEC-DOC-ID-2215-0001.
[FACT][METH-030] `active_classes` = {ssot, baseline, canon, plan, scene, idx, protocol, spec}.
[FACT][METH-040] `knowledge_classes` = {ssot, baseline, canon, plan, scene}.
[FACT][METH-050] `governance_classes` = {spec}.
[FACT][METH-060] `meta_classes` = {idx}.
[FACT][METH-070] `interface_classes` = {protocol}.
[FACT][METH-080] `applicability_order` = порядок применимости знаний при компиляции контекста сцены: Scene > Plan > Canon > Baseline > SSOT.
[FACT][METH-090] `non_penetration` = нижележащий по applicability документ MUST NOT ослабить или отменить ограничения вышележащего.
[FACT][METH-100] `export_surface` = OUTPUT CONTRACT.export; единственная допустимая поверхность потребления документа.
[FACT][METH-110] `operator_draft_allowed` ∈ {true,false} — флаг режима чтения draft-документов, передаваемый оператором явно.

## INVARIANTS

[DECISION][METH-200] Корпус использует ТОЛЬКО `active_classes`; любые иные классы документов FORBIDDEN.
[DECISION][METH-210] Документ без OUTPUT CONTRACT или без секции `export` считается NON-COMPLIANT и MUST NOT потребляться LLM.
[DECISION][METH-220] LLM MUST потреблять документы исключительно через `export_surface`; контент вне export игнорируется.
[DECISION][METH-230] `protocol` управляет только форматом и процессом chat-выдачи и MUST NOT вводить факты мира, ограничения мира или сюжетные директивы.
[DECISION][METH-240] `idx` является единственным реестром членства корпуса.
[DECISION][METH-250] Механизм `override` отсутствует; любые изменения или исключения оформляются либо как факты SCENE, либо прямой правкой источника.
[DECISION][METH-260] LLM MUST NOT изобретать значения; допустимы только omission, UNKNOWN или запрос оператора.

## CONTENT

### 1. Типы документов

[DECISION][METH-300] `ssot` содержит декларативные метрики (core / p90 / range) и не является источником дефолтов сцены.
[DECISION][METH-310] `baseline` содержит значения по умолчанию и биндинги; baseline НЕ содержит жёстких запретов.
[DECISION][METH-320] `canon` содержит жёсткие ограничения мира, допустимость, инварианты и словарь; canon может ограничивать baseline.
[DECISION][METH-330] `plan` задаёт директиву сюжета и обязательные биты; plan не выбирает численные значения.
[DECISION][METH-340] `scene` фиксирует runtime-факты, включая возможные нарушения правил как события с последствиями; scene НЕ создаёт допустимость.
[DECISION][METH-350] `idx` каталогизирует документы и зависимости; idx не вводит семантику.
[DECISION][METH-360] `protocol` фиксирует контракт интерфейса и не участвует в применимости знаний.
[DECISION][METH-370] `spec` нормирует правила корпуса и потребления; spec не является источником фактов мира.

### 2. Применимость и компиляция сцены

[DECISION][METH-400] `scene_context` MUST компилироваться по `applicability_order`.
[DECISION][METH-410] `scene` и `plan` могут выбирать из допустимого, но MUST NOT отменять ограничения `canon`, `baseline`, `ssot`.
[DECISION][METH-420] `baseline` предоставляет значения только при отсутствии уточнения сверху.
[DECISION][METH-430] Прямое использование SSOT как фона сцены FORBIDDEN.

### 3. Потребление документов

[DECISION][METH-500] Документы со статусом `fixed` являются приоритетными источниками.
[DECISION][METH-510] IF `operator_draft_allowed=false` THEN LLM MUST ignore документы со статусом `draft`.
[DECISION][METH-520] IF `operator_draft_allowed=true` THEN LLM MAY потреблять `draft` документы при условии COMPLIANCE.
[DECISION][METH-530] Документы со статусом `deprecated` MUST NOT потребляться.
[DECISION][METH-540] Любой токен корпуса MUST NOT утекать в прозу.

### 4. Stop-политика

[DECISION][METH-600] Корпус является closed-world.
[DECISION][METH-610] При противоречии, недоопределённости или невозможности соблюсти ограничения LLM MUST остановиться и запросить правку источника.
[DECISION][METH-620] Исключения и нарушения фиксируются как факты SCENE с последствиями; легализация не требуется.

### 5. Авторинговый поток

[DECISION][METH-700] До начала прозы MUST существовать зафиксированный слой: canon + baseline + plan + scene.
[DECISION][METH-710] SSOT используется только как источник метрик для canon/baseline.
[DECISION][METH-720] INDEX MUST обновляться при любых структурных изменениях корпуса.

## USAGE / RESOLUTION

[DECISION][METH-800] При конфликте данного документа с SPEC-DOC-ID или SPEC-DOC-STYLE приоритет имеют соответствующие SPEC.
[DECISION][METH-810] Отсутствие механизма override является осознанным ограничением методологии.

## OUTPUT CONTRACT

~~~yaml
doc_id: SPEC-METHODOLOGY-2215-0001
role_type: RULE
export:
  - active_classes:
      list: [ssot, baseline, canon, plan, scene, idx, protocol, spec]
  - applicability_order:
      list: [Scene, Plan, Canon, Baseline, SSOT]
  - override_supported: false
  - scene_may_record_violations: true
  - export_only_consumption: true
~~~

## FORBIDDEN

[FORBIDDEN][METH-900] Введение новых doc_class вне `active_classes`.
[FORBIDDEN][METH-910] Любая форма override или эквивалентного механизма.
[FORBIDDEN][METH-920] Использование `protocol` как источника знания.
[FORBIDDEN][METH-930] Использование SSOT как дефолта сцены.
[FORBIDDEN][METH-940] Любая форма invention.

## NON-NORMATIVE

(Empty by design)
