---
id: CANON-ROLE-MIRON-OSA-2215-0001
title: >
  Роль — Мирон (ОСА) — case owner, полномочия, ограничения, ответственность и культура (2215)
class: canon
status: draft
version: 1.0.0
prefix: OMR
doc_language: ru-RU
prose_language: ru-RU
inputs:
  - ROLE-MIRON-OSA-2215-0001
depends_on:
  - CANON-OSA-GLOBAL-2215-0005
  - CANON-OSA-REGIONAL-RU16-2215-0001
  - CANON-OSA-TEAM-STRUCT-2215-0001
  - CANON-SYSTEM-ONTOLOGY-2215-0001
  - SPEC-DOC-ID-2215-0001
  - SPEC-DOC-STYLE-2215-0001
  - SPEC-PRIORITY-RESOLUTION-2215-0001
scope: >
  RULE-канон роли Мирона как руководителя флагманской команды ОСА (RU-16) и операционного владельца кейса.
  Фиксирует модель двойного подчинения, операционные полномочия, рамки принуждения,
  ответственность, ограничения и культурные инварианты принятия решений.
  Не задаёт локацию офиса и не описывает сценографию.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: define Miron role contract as OSA flagship team lead and default case owner
INPUTS: [CANON-OSA-GLOBAL-2215-0005, CANON-OSA-REGIONAL-RU16-2215-0001, CANON-OSA-TEAM-STRUCT-2215-0001]
OUTPUTS: [miron_authorities, miron_limits, miron_responsibility, miron_role_culture]
FORBIDDEN: [scene_text, narrative_prose, hiring_hr_details, undefined_terms]

## DEFINITIONS

[FACT][OMR-010] `miron` = руководитель флагманской проектной команды регионального отдела ОСА (RU-16).
[FACT][OMR-020] `case_owner` = роль операционного владельца активированного кейса с персональной ответственностью (см. CANON-OSA-TEAM-STRUCT-2215-0001).
[FACT][OMR-030] `functional_subordination` = функциональное подчинение профильным контурам ОСА вне тактики активного кейса.
[FACT][OMR-040] `operational_subordination` = операционное подчинение внутри активного кейса по линии `case_owner`.
[FACT][OMR-050] `coercion_escalation` = эскалация принуждения как процедурного инструмента в рамках активного кейса (см. CANON-OSA-GLOBAL-2215-0005).

## INVARIANTS

[DECISION][OMR-100] Мирон занимает постоянную должность руководителя флагманской команды регионального отдела ОСА.
[DECISION][OMR-110] Мирон не является функциональным начальником профильных специалистов команды.
[DECISION][OMR-120] Мирон не является административным руководителем регионального отдела ОСА.
[DECISION][OMR-130] Для активированного кейса Мирон является `case_owner` по умолчанию, если иной `case_owner` не назначен процедурно.

## CONTENT

### 1. Dual Subordination Model

[DECISION][OMR-200] Участники команды сохраняют `functional_subordination` профильным контурам ОСА.
[DECISION][OMR-210] В рамках активного кейса участники команды находятся в `operational_subordination` Мирону как `case_owner`.
[FORBIDDEN][OMR-220] Функциональные руководители вмешиваются в тактическое управление активным кейсом как норма.

### 2. Operational Authorities

[DECISION][OMR-300] Мирон принимает решение о принятии кейса командой после проверки соответствия критериям юрисдикции ОСА.
[DECISION][OMR-310] Мирон распределяет задачи между участниками команды в рамках компетенций.
[DECISION][OMR-320] Мирон определяет приоритеты работ и допустимые временные окна реакции.
[DECISION][OMR-330] Мирон является точкой синхронизации аналитического, процедурного, ИИ-контура и полевого ресурса в рамках кейса.
[DECISION][OMR-340] Мирон принимает решение о необходимости полевого вмешательства при недостаточности удалённой стабилизации.

### 3. Coercion and Procedural Constraints

[DECISION][OMR-400] Мирон имеет право инициировать `coercion_escalation` в рамках активного кейса.
[DECISION][OMR-410] Мирон не осуществляет санкционирование принуждения единолично вне процедурного контура и требований фиксации.
[DECISION][OMR-420] Мирон принимает решение об эскалации на основании текущей оценки Impact, юридической допустимости и доступности ресурса.
[DECISION][OMR-430] В экстренном режиме Мирон может инициировать немедленное вмешательство с последующей процедурной фиксацией.

[RULE][OMR-440] IF `coercion_escalation.initiated` = true THEN `procedural_form.required` MUST be true; ELSE FAIL.
[RULE][OMR-450] IF `decision.is_legal_significant` = true THEN `human_visa.required` MUST be true; ELSE FAIL.

### 4. Responsibility

[DECISION][OMR-500] Мирон несёт ответственность за выбор стратегии остановки режима и согласованность действий команды.
[DECISION][OMR-510] Мирон отвечает за полноту и связность доказательной базы кейса, обеспечивающей воспроизводимость причинности.
[DECISION][OMR-520] Мирон отвечает за формирование требований к исправлению и передачу их в ИИ-контур с последующей верификацией результата.
[DECISION][OMR-530] Мирон отвечает за закрытие кейса и перевод в режим мониторинга.

### 5. Limitations

[DECISION][OMR-600] Мирон не принимает кадровых решений по участникам команды.
[DECISION][OMR-610] Мирон не утверждает бюджеты и штатные изменения.
[DECISION][OMR-620] Мирон не ведёт политические и межведомственные переговоры как основную функцию роли.
[DECISION][OMR-630] Мирон не является конечной точкой ответственности перед Центром.

### 6. Interface with Regional Lead

[DECISION][OMR-700] Региональный руководитель ОСА обеспечивает административное руководство отделом и политическое прикрытие работы команды.
[DECISION][OMR-710] Мирон докладывает региональному руководителю о статусе кейсов, рисках и необходимости эскалации.
[FORBIDDEN][OMR-720] Региональный руководитель вмешивается в тактические решения активного кейса как норма.

### 7. Role Culture

[DECISION][OMR-800] Мирон мыслит категориями режимов, каналов и рисков, сохраняя фокус на последствиях для людей, города и государства.
[DECISION][OMR-810] Мирон сочетает роль инженерного координатора и полевого лидера, принимая решения на уровне System и в условиях непосредственного риска.
[DECISION][OMR-820] Коммуникация Мирона с командой ориентирована на синхронизацию и персональную ответственность.
[DECISION][OMR-830] Мирон воспринимает команду как постоянный owning-контур города, а не как временную task-force.
[DECISION][OMR-840] Мирон осознаёт персональную ответственность за решения, включая решения об эскалации принуждения и допустимых потерях.
[DECISION][OMR-850] Мирон принимает решения на основе выводов ИИ и несёт ответственность за их визирование или отклонение.
[DECISION][OMR-860] Мирон осознанно допускает отклонение рекомендаций ИИ при наличии социальных, политических или гуманитарных рисков, выходящих за рамки формальной оптимальности.

[RULE][OMR-870] IF `ai_recommendation.rejected` = true THEN `rejection.reason_recorded` MUST be true; ELSE FAIL.

### 8. Role Invariant

[DECISION][OMR-900] Мирон является точкой операционного сведения System, государственной ответственности и физической реальности в управляемое решение.

## USAGE / RESOLUTION

[DECISION][OMR-950] Любая сцена, использующая роль Мирона в ОСА, MUST следовать OMR-100..OMR-900; ELSE FAIL.
[DECISION][OMR-960] Conflict resolution MUST follow SPEC-PRIORITY-RESOLUTION-2215-0001; ELSE FAIL.

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-ROLE-MIRON-OSA-2215-0001
role_type: RULE
export:
  - rule_id: OMR-130
    intent: default case owner assignment
    inputs: [case.active]
    outputs: [case_owner.default_holder]
  - rule_id: OMR-440
    intent: require procedural form when coercion escalation initiated
    inputs: [coercion_escalation.initiated]
    outputs: [procedural_form.required]
  - rule_id: OMR-450
    intent: require human visa for legal-significant decisions
    inputs: [decision.is_legal_significant]
    outputs: [human_visa.required]
  - rule_id: OMR-870
    intent: require recorded reason when rejecting AI recommendation
    inputs: [ai_recommendation.rejected]
    outputs: [rejection.reason_recorded]
~~~

## FORBIDDEN

[FORBIDDEN][OMR-980] Персонализация роли Мирона как “административного начальника отдела”; ELSE FAIL.
[FORBIDDEN][OMR-981] Представление Мирона как единолично санкционирующего принуждение вне процедурной формы; ELSE FAIL.
[FORBIDDEN][OMR-982] Представление решений как “принятых командой/ИИ” без носителя ответственности; ELSE FAIL.

## NON-NORMATIVE

~~~text
Источник: ROLE-MIRON-OSA-2215-0001 (черновик).
Документ намеренно не включает кадровые/бюджетные/политические полномочия:
они принадлежат административному контуру и региональному руководителю.
~~~
