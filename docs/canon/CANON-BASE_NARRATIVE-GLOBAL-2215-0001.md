---
id: CANON-BASE_NARRATIVE-GLOBAL-2215-0001
title: >
  Canon Base — Narrative and Institutional Anchor (2215)
class: canon
status: fixed
version: 1.1.0
prefix: NAR
doc_language: en-US
prose_language: ru-RU
inputs: []
depends_on:
  - CANON-BASE_RULE-GLOBAL-2215-0001
  - CANON-CORE-GLOBAL-2215-0001
scope: >
  Якорный канонический документ интерфейсного типа.
  Фиксирует нарративную, институциональную и временную инерцию мира 2215.
  Не является исполняемым и не участвует в разрешении конфликтов.
---

## LLM-INTENT

ROLE_TYPE: INTERFACE
SCOPE: human-readable narrative anchor for institutional stability and temporal rhythm
INPUTS: [CANON-BASE_RULE-GLOBAL-2215-0001, CANON-CORE-GLOBAL-2215-0001]
OUTPUTS: [narrative_anchor, narrative_rhythm_profile]
FORBIDDEN: [llm_execution, world_parameter_binding, rule_enforcement]

## DEFINITIONS

[FACT][NAR-DEF-010] `anchor_document` = канонический текст,
  используемый автором для поддержания согласованности нарратива.

[FACT][NAR-DEF-020] `non_executable` = свойство документа,
  означающее отсутствие нормативной или разрешающей силы.

[FACT][NAR-DEF-030] `narrative_rhythm` = устойчивый профиль
  темпа, пауз и накопления последствий в повествовании.

## INVARIANTS

[DECISION][NAR-INV-010] Документ MUST сохранять нарративную и институциональную инерцию мира.

[DECISION][NAR-INV-020] Документ MUST NOT переопределять значения,
  зафиксированные в RULE или BIND документах корпуса.

[DECISION][NAR-INV-030] При любом конфликте интерпретаций
  приоритет имеет CANON-BASE_RULE-GLOBAL-2215-0001.

## CONTENT

### Institutional Background

[DECISION][NAR-100] Мир 2215 MUST восприниматься
  как институционально стабильный и нормативно насыщенный.

[DECISION][NAR-110] Конфликт MUST возникать
  из процедур, распределений и ограничений,
  а не из тотального коллапса среды.

[DECISION][NAR-120] Государства MUST сохранять суверенитет,
  действуя в плотной сети стандартов, аудита и отчётности.

[DECISION][NAR-130] Корпорации MUST рассматриваться
  как системные операторы,
  реализующие влияние через право и доступ.

[DECISION][NAR-140] Экстерриториальные режимы MUST трактоваться
  как лицензируемые и отзывные зоны исключения.

### Anthropological Baseline

[DECISION][NAR-200] Технологии MUST быть глубоко интегрированы в быт,
  не устраняя человеческие ограничения и телесность.

[DECISION][NAR-210] Трансгуманизм MUST присутствовать
  в умеренной и функциональной форме,
  без повседневного сверхчеловеческого превосходства.

[DECISION][NAR-220] Дефицит MUST переживаться
  как вопрос распределения и окон доступа,
  а не как угроза выживанию.

[DECISION][NAR-230] Повседневность персонажей MUST включать
  нефункциональные аспекты существования,
  не сводимые к их институциональной роли.

### Narrative Rhythm

[DECISION][NAR-300] Нарратив MUST разворачиваться
  в длительном временном масштабе (недели–месяцы).

[DECISION][NAR-310] Паузы между активными фазами кейсов MUST
  рассматриваться как нормальное состояние мира.

[DECISION][NAR-320] Существенные сюжетные сдвиги MUST возникать
  из накопления мелких изменений и решений,
  а не из единичных драматических актов.

[DECISION][NAR-330] Параллельное существование
  нескольких незавершённых процессов MUST быть нормой.

[DECISION][NAR-340] Отсутствие немедленного результата
  после действий институтов MUST NOT трактоваться как провал.

### Temporal Texture

[DECISION][NAR-400] Сцены MAY включать временные разрывы,
  в которых отсутствуют явные события,
  но сохраняется напряжение ожидания.

[DECISION][NAR-410] Повторяемость рутинных действий MUST формировать
  ощущение инерционного и тяжёлого мира.

[DECISION][NAR-420] Экстренные эпизоды MUST быть редкими
  и контрастировать с общей медленной ритмикой.

### Narrative Consequences

[DECISION][NAR-500] Институциональные победы MUST быть частичными
  и сопровождаться остаточным риском.

[DECISION][NAR-510] Даже успешные разрешения ситуаций MUST
  оставлять следы в виде политических, технических
  или человеческих последствий.

[DECISION][NAR-520] Нарратив MUST избегать ощущения
  полного очищения мира после завершения кейса.

## USAGE / RESOLUTION

[DECISION][NAR-USE-010] Документ используется автором
  как ориентир при построении сцен, эпизодов и диалогов.

[DECISION][NAR-USE-020] Любые формальные ограничения MUST
  извлекаться исключительно из RULE документов корпуса.

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-BASE_NARRATIVE-GLOBAL-2215-0001
role_type: INTERFACE
export:
  - owns:
      - narrative_anchor
      - narrative_rhythm_profile
  - consumes:
      - CANON-BASE_RULE-GLOBAL-2215-0001
      - CANON-CORE-GLOBAL-2215-0001
  - forbids:
      - rule_enforcement
      - world_parameter_binding
      - conflict_resolution
~~~

## FORBIDDEN

[FORBIDDEN][NAR-FBD-010] Использование документа
  как источника правил или параметров мира.

[FORBIDDEN][NAR-FBD-020] Разрешение конфликтов
  или выбор значений метрик на основе данного документа.

[FORBIDDEN][NAR-FBD-030] Чтение документа
  как исполняемого или нормативного.

## NON-NORMATIVE

Документ допускает ритмическую тяжеловесность,
повторы и отсутствие динамики.
Это является осознанным эффектом,
а не дефектом нарратива.
