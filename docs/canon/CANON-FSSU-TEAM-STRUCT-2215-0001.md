---
id: CANON-FSSU-TEAM-STRUCT-2215-0001
title: >
  ФССУ — Флагманская команда (RU-16) — роли, матрица подчинения, артефакты и культура работы (2215)
class: canon
status: draft
version: 1.0.0
prefix: OST
doc_language: ru-RU
prose_language: ru-RU
inputs: []
depends_on:
  - CANON-FSSU-GLOBAL-2215-0005
  - CANON-FSSU-REGIONAL-RU16-2215-0001
  - CANON-SYSTEM-ONTOLOGY-2215-0001
  - SPEC-DOC-ID-2215-0001
  - SPEC-DOC-STYLE-2215-0001
  - SPEC-PRIORITY-RESOLUTION-2215-0001
scope: >
  RULE-канон структуры флагманской команды ФССУ (регион RU-16).
  Определяет: внутренние роли (case_owner и функциональные контуры), матричность подчинения,
  владение кейсом, обязательные артефакты/лог-первичность и культурные инварианты команды.
  Не персонализирует роли на конкретных персонажей (персонализация — отдельные ROLE-доки).
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: define flagship team structure, roles, responsibilities, artifacts and cultural invariants for FSSU field case work
INPUTS: []
OUTPUTS: [team_roles, case_ownership_rules, artifact_rules, culture_invariants]
FORBIDDEN: [scene_text, narrative_prose, hiring_hr_details, undefined_terms]

## DEFINITIONS

[FACT][OST-010] `flagship_team` = флагманская проектная команда регионального отдела ФССУ, ведущая активированные кейсы на земле.
[FACT][OST-020] `case_owner` = роль операционного владельца кейса с персональной ответственностью за стратегию и координацию.
[FACT][OST-030] `functional_role` = специализированная роль внутри команды (наблюдаемость, право, полевое ядро, human gate и др.).
[FACT][OST-040] `human_gate` = функция визирования/ответственности за юридически значимые решения между анализом и исполнением (см. CANON-FSSU-REGIONAL-RU16-2215-0001).
[FACT][OST-050] `artifact_min_set` = минимальный набор артефактов кейса (логи/телеметрия + цепочка хранения + процедурные формы).

## INVARIANTS

[DECISION][OST-100] `flagship_team` MUST вести работу ONLY по активированным кейсам или по формальной эскалации.
[DECISION][OST-110] Для каждого активированного кейса MUST быть назначен ровно один `case_owner`.
[DECISION][OST-120] `case_owner` несёт персональную ответственность за стратегию, координацию и качество артефактов.
[DECISION][OST-130] Команда MUST быть матричной: операционное подчинение по кейсу и функциональное подчинение по домену.
[DECISION][OST-140] Логи и телеметрия MUST быть первичными артефактами (см. CANON-FSSU-GLOBAL-2215-0005).
[FORBIDDEN][OST-150] Коллективная безответственность: “решение приняла команда/система” без носителя ответственности.

## CONTENT

### 1. Role Set

[DECISION][OST-200] `team.roles.min_set` MUST include {case_owner, observability_engineer, legal_counsel, field_core, human_gate}.
[DECISION][OST-210] `team.roles.optional_set` MAY include {case_intake_specialist, evidence_ledger_specialist, interface_negotiator}.

[RULE][OST-220] IF `case.active` = true THEN `case_owner.assigned` MUST be true; ELSE FAIL.

### 2. Case Ownership and Coordination

[RULE][OST-300] IF `case.active` = true THEN `case_owner.count` MUST be 1; ELSE FAIL.
[RULE][OST-310] IF `case.active` = true THEN `case_owner.responsibility` MUST include {strategy, coordination, artifact_quality, escalation_decisions}; ELSE FAIL.
[RULE][OST-320] IF `case.active` = true THEN `team.operational_chain` MUST be "case_owner_leads"; ELSE FAIL.

### 3. Matrix Subordination

[DECISION][OST-400] `team.subordination.model` = "matrix".
[DECISION][OST-410] `team.subordination.axes` = {operational_case, functional_domain}.

[RULE][OST-420] IF `conflict.operational_vs_functional` = true THEN `resolution_priority` MUST be "case_safety_and_admissibility_first"; ELSE FAIL.

### 4. Human Gate Inside the Team

[DECISION][OST-500] `human_gate` MAY быть выделенной ролью или делегируемой функцией в составе команды, но ответственность MUST быть персональной.

[RULE][OST-510] IF `decision.is_legal_significant` = true OR `decision.affects_case_status` = true THEN `human_gate.visa` MUST be true; ELSE FAIL.
[RULE][OST-520] IF `human_gate.visa` = true THEN `visa.recorded` MUST be true; ELSE FAIL.

### 5. Artefacts and Log Primacy

[DECISION][OST-600] `artifact_min_set` MUST include {telemetry_logs, evidence_ledger_chain_of_custody, procedural_forms, case_docket}.
[DECISION][OST-610] `telemetry_logs` MUST be considered primary; `documents` MUST be considered derived.

[RULE][OST-620] IF `case.active` = true THEN `artifact_min_set.present` MUST be true; ELSE FAIL.
[RULE][OST-630] IF `evidence_item.collected` = true THEN `chain_of_custody.entry_created` MUST be true; ELSE FAIL.

### 6. Culture Invariants

[DECISION][OST-700] Команда MUST предпочитать остановку режима через процедурные рычаги, а не через “героическое вмешательство”.
[DECISION][OST-710] Команда MUST допускать осознанное отклонение рекомендаций ИИ при наличии записанной причины.
[DECISION][OST-720] Команда MUST считать “устранение человека” недостаточным результатом без стабилизации Channel/Asset (см. CANON-FSSU-GLOBAL-2215-0005).

[RULE][OST-730] IF `ai_recommendation.rejected` = true THEN `rejection.reason_recorded` MUST be true; ELSE FAIL.

## USAGE / RESOLUTION

[DECISION][OST-900] Любая сцена с флагманской командой ФССУ MUST трактовать структуру и роли через OST-200..OST-730; ELSE FAIL.
[DECISION][OST-910] Conflict resolution MUST follow SPEC-PRIORITY-RESOLUTION-2215-0001; ELSE FAIL.

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-FSSU-TEAM-STRUCT-2215-0001
role_type: RULE
export:
  - rule_id: OST-220
    intent: require case owner assignment
    inputs: [case.active]
    outputs: [case_owner.assigned]
  - rule_id: OST-300
    intent: enforce single case owner
    inputs: [case.active]
    outputs: [case_owner.count]
  - rule_id: OST-510
    intent: require human gate visa for legal/case-significant decisions
    inputs: [decision.is_legal_significant, decision.affects_case_status]
    outputs: [human_gate.visa]
  - rule_id: OST-620
    intent: require minimum artifact set for active case
    inputs: [case.active]
    outputs: [artifact_min_set.present]
  - rule_id: OST-730
    intent: require recorded reason when rejecting AI recommendation
    inputs: [ai_recommendation.rejected]
    outputs: [rejection.reason_recorded]
~~~

## FORBIDDEN

[FORBIDDEN][OST-980] Персонализация ролей на конкретных персонажей в этом документе; ELSE FAIL.
[FORBIDDEN][OST-981] Представление команды как не имеющей `case_owner`; ELSE FAIL.
[FORBIDDEN][OST-982] Представление решений как “принятых ИИ” без человеческой визы в юридически значимых случаях; ELSE FAIL.
[FORBIDDEN][OST-983] Подмена артефактов кейса “устной договорённостью” без ledger/логов; ELSE FAIL.

## NON-NORMATIVE

~~~text
Персональные профили (Мирон, Ринат и др.) фиксируются отдельными документами ROLE-*.
Региональный конвейер (ГОРОД-1/2 и human gate как контур отдела) фиксируется в CANON-FSSU-REGIONAL-RU16-2215-0001.
~~~
