---
id: CANON-FSSU-DEPT-STRUCT-RU16-2215-0001
title: >
  ФССУ — Регион RU-16 — Структура отдела и конвейер решений (ГОРОД-1/GO-NOGO/ГОРОД-2) (2215)
class: canon
status: draft
version: 1.0.0
prefix: ODS
doc_language: ru-RU
prose_language: ru-RU
inputs: []
depends_on:
  - CANON-FSSU-GLOBAL-2215-0005
  - CANON-FSSU-REGIONAL-RU16-2215-0001
  - CANON-SYSTEM-ONTOLOGY-2215-0001
  - REG-FSSU-AUTO-LOWIMPACT-2215-0001
  - SPEC-DOC-ID-2215-0001
  - SPEC-DOC-STYLE-2215-0001
  - SPEC-PRIORITY-RESOLUTION-2215-0001
scope: >
  RULE-канон операционной структуры регионального отдела ФССУ (RU-16/CHELNY).
  Определяет конвейер решений: ГОРОД-1 → human_gate → ГОРОД-2 → outcome (auto_resolve/escalate/reject)
  и точку передачи кейса флагманской команде.
  Не описывает архитектуру офиса, личные роли персонажей и не задаёт детализацию алгоритмов ИИ.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: define RU-16 FSSU department decision conveyor stages, routing outcomes and handoff to flagship team
INPUTS: []
OUTPUTS: [conveyor_stages, routing_outcomes, handoff_rules, intake_sources]
FORBIDDEN: [office_architecture_details, narrative_prose, scene_text, undefined_terms]

## DEFINITIONS

[FACT][ODS-010] `dept_ru16` = региональный отдел ФССУ RU-16/CHELNY как конвейер обработки сигналов и эскалации в кейсы.
[FACT][ODS-020] `city_view_1` = ГОРОД-1: аналитическое представление потока инцидентов/сигналов (без юридических решений).
[FACT][ODS-030] `human_gate` = группа интерпретации и ответственности / куратор ИИ-исправлений (см. CANON-FSSU-REGIONAL-RU16-2215-0001).
[FACT][ODS-040] `city_view_2` = ГОРОД-2: исполнительное представление low-impact действий и маршрутизации (ограничено whitelist).
[FACT][ODS-050] `flagship_team` = флагманская команда, ведущая активированные кейсы на земле (см. CANON-FSSU-TEAM-STRUCT-2215-0001).
[FACT][ODS-060] `routing_outcome` = один из {AUTO_RESOLVE, CASE_ESCALATION, REJECT_CLOSE}.
[FACT][ODS-070] `auto_resolve` = автономное low-impact исполнение, разрешённое whitelist REG-FSSU-AUTO-LOWIMPACT-2215-0001.
[FACT][ODS-080] `case_escalation` = эскалация в активацию кейса по BASELINE-FSSU-CASE-ACTIVATION-2215-0001 и/или передача флагманской команде.
[FACT][ODS-090] `reject_close` = закрытие сигнала как не относящегося к юрисдикции/порогам/валидности, с фиксацией причины.

## INVARIANTS

[DECISION][ODS-100] `dept_ru16.conveyor.stage_order` MUST be ["city_view_1","human_gate","city_view_2","routing_outcome"].
[DECISION][ODS-110] `human_gate` MUST be the only нормативная точка персональной ответственности между `city_view_1` и `city_view_2`.
[FORBIDDEN][ODS-120] Прямой переход `city_view_1 → city_view_2` без `human_gate` как норма.
[DECISION][ODS-130] Любой `AUTO_RESOLVE` MUST быть ограничен whitelist REG-FSSU-AUTO-LOWIMPACT-2215-0001.
[DECISION][ODS-140] Любая `CASE_ESCALATION` MUST запускать процедуру активации кейса или передачу по компетенции согласно CANON-FSSU-GLOBAL-2215-0005.
[DECISION][ODS-150] Любой `REJECT_CLOSE` MUST иметь фиксируемую причину и MUST NOT уничтожать входные артефакты наблюдаемости.
[FORBIDDEN][ODS-160] Юридически значимые решения ИИ-контуром без визы человека.

## CONTENT

### 1. Intake Sources

[DECISION][ODS-200] `dept_ru16.intake.sources` MUST include {state_observability_signals, regulator_flags, operator_reports_via_state_circuit, field_observations, interagency_referrals}.
[FORBIDDEN][ODS-210] Прямой приём “сырой телеметрии” от компаний минуя государственный контур как норма (см. CANON-FSSU-GLOBAL-2215-0005).

### 2. Stage 1 — ГОРОД-1 (city_view_1)

[DECISION][ODS-300] `city_view_1.outputs.min_set` MUST include {correlation, hypotheses, asset_candidate, channel_candidate, impact_estimate, recommended_route}.
[FORBIDDEN][ODS-310] `city_view_1` активирует кейсы или санкционирует действия.

### 3. Stage 2 — Human Gate

[RULE][ODS-400] IF `city_view_1.output.recommended_route` exists THEN `human_gate.review_required` MUST be true; ELSE FAIL.
[RULE][ODS-410] IF `human_gate.review_required` = true THEN `human_gate.visa` MUST be true; ELSE FAIL.
[RULE][ODS-420] IF `human_gate.visa` = true THEN `visa.recorded` MUST be true; ELSE FAIL.

### 4. Stage 3 — ГОРОД-2 (city_view_2)

[DECISION][ODS-500] `city_view_2.may_execute` MUST be limited to `auto_resolve` actions.
[RULE][ODS-510] IF `routing_outcome` = AUTO_RESOLVE THEN `action.type` MUST be in whitelist(REG-FSSU-AUTO-LOWIMPACT-2215-0001); ELSE FAIL.
[RULE][ODS-520] IF `routing_outcome` = AUTO_RESOLVE THEN `execution.logging_required` MUST be true; ELSE FAIL.

### 5. Routing Outcomes

[RULE][ODS-600] PASS IFF `routing_outcome` in {AUTO_RESOLVE, CASE_ESCALATION, REJECT_CLOSE}; ELSE FAIL.

[RULE][ODS-610] IF `routing_outcome` = CASE_ESCALATION THEN `activation_flow.required` MUST be true; ELSE FAIL.
[RULE][ODS-620] IF `routing_outcome` = CASE_ESCALATION THEN `handoff.to_flagship_team` MUST be true OR `handoff.transfer_by_competence` MUST be true; ELSE FAIL.

[RULE][ODS-630] IF `routing_outcome` = REJECT_CLOSE THEN `reject_close.reason_recorded` MUST be true; ELSE FAIL.
[RULE][ODS-640] IF `routing_outcome` = REJECT_CLOSE THEN `artifacts.preserved_min` MUST be true; ELSE FAIL.

### 6. Handoff to Flagship Team

[DECISION][ODS-700] `handoff.to_flagship_team` MUST represent transfer of an activated case or an explicit escalation request.
[RULE][ODS-710] IF `handoff.to_flagship_team` = true THEN `case_owner.assignment.required` MUST be true; ELSE FAIL.

## USAGE / RESOLUTION

[DECISION][ODS-900] Любая сцена RU-16, описывающая работу отдела как конвейер, MUST следовать ODS-100..ODS-710; ELSE FAIL.
[DECISION][ODS-910] Conflict resolution MUST follow SPEC-PRIORITY-RESOLUTION-2215-0001; ELSE FAIL.

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-FSSU-DEPT-STRUCT-RU16-2215-0001
role_type: RULE
export:
  - rule_id: ODS-100
    intent: enforce stage order
    inputs: [dept_ru16.conveyor.stage_order]
    outputs: [stage_order_ok]
  - rule_id: ODS-410
    intent: require human gate visa when review required
    inputs: [human_gate.review_required]
    outputs: [human_gate.visa]
  - rule_id: ODS-510
    intent: restrict auto_resolve to whitelist
    inputs: [routing_outcome, action.type]
    outputs: [auto_resolve_allowed]
  - rule_id: ODS-610
    intent: require activation flow on escalation
    inputs: [routing_outcome]
    outputs: [activation_flow.required]
  - rule_id: ODS-630
    intent: require recorded reason on reject/close
    inputs: [routing_outcome]
    outputs: [reject_close.reason_recorded]
  - rule_id: ODS-710
    intent: require case owner assignment on handoff
    inputs: [handoff.to_flagship_team]
    outputs: [case_owner.assignment.required]
~~~

## FORBIDDEN

[FORBIDDEN][ODS-980] Описание архитектуры офиса/этажей/интерьеров в этом документе; ELSE FAIL.
[FORBIDDEN][ODS-981] Представление `human_gate` как “автоматического” без персональной ответственности; ELSE FAIL.
[FORBIDDEN][ODS-982] `AUTO_RESOLVE` без whitelist-ограничения; ELSE FAIL.
[FORBIDDEN][ODS-983] Уничтожение/потеря артефактов при `REJECT_CLOSE`; ELSE FAIL.

## NON-NORMATIVE

~~~text
Этот документ фиксирует “как отдел работает как конвейер”, отделяя операционный интерфейс
(стадии, маршрутизация, handoff) от регионального описания (отношение Центра, наличие флагманской команды)
и от описания самих представлений ГОРОД-1/ГОРОД-2 (это отдельный документ CITYVIEW).
~~~
