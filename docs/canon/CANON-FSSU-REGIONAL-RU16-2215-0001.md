---
id: CANON-FSSU-REGIONAL-RU16-2215-0001
title: >
  ФССУ — Регион RU-16 (Набережные Челны) — структура, конвейер решений и human gate (2215)
class: canon
status: draft
version: 1.0.0
prefix: OSR
doc_language: ru-RU
prose_language: ru-RU
inputs: []
depends_on:
  - CANON-FSSU-GLOBAL-2215-0005
  - CANON-SYSTEM-ONTOLOGY-2215-0001
  - SPEC-DOC-ID-2215-0001
  - SPEC-DOC-STYLE-2215-0001
  - SPEC-PRIORITY-RESOLUTION-2215-0001
scope: >
  RULE-канон регионального отдела ФССУ для RU-16/CHELNY.
  Определяет: роль Центра (Москва) как внешнего контура отчётности/аудита,
  региональный конвейер решений (ГОРОД-1 → human gate → ГОРОД-2 → флагманская команда),
  и ответственность human gate (группа интерпретации и ответственности / куратор ИИ-исправлений).
  Локация офиса вынесена в CANON-LOC-FSSU-OFFICE-CHELNY-2215-0001.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: define RU-16 regional FSSU structure, decision conveyor, and human gate accountability
INPUTS: []
OUTPUTS: [center_relation, regional_conveyor, human_gate_responsibility, flagship_team_presence]
FORBIDDEN: [office_architecture_details, scene_text, narrative_prose, undefined_terms]

## DEFINITIONS

[FACT][OSR-010] `FSSU_ru16_dept` = региональный отдел ФССУ, ведущий кейсы и операции в RU-16/CHELNY.
[FACT][OSR-020] `FSSU_center` = федеральный контур ФССУ (Москва), принимающий отчётность и проводящий аудит.
[FACT][OSR-030] `city_view_1` = ГОРОД-1, аналитическое представление потока инцидентов (термин уровня RU-16).
[FACT][OSR-040] `city_view_2` = ГОРОД-2, исполнительное представление действий low-impact (термин уровня RU-16).
[FACT][OSR-050] `human_gate` = группа интерпретации и ответственности (синоним: куратор ИИ-исправлений), несущая персональную ответственность за визирование решений, влияющих на кейсы/действия.

## INVARIANTS

[DECISION][OSR-100] Для RU-16/CHELNY `FSSU_center.relation` MUST be "external_reporting_and_audit_pressure_not_ops_hq".
[DECISION][OSR-110] Для RU-16/CHELNY `FSSU_ru16_dept.has_flagship_team` MUST be true.
[DECISION][OSR-120] Региональный конвейер MUST включать последовательность `city_view_1 → human_gate → city_view_2 → flagship_team`.
[DECISION][OSR-130] `human_gate` MUST быть единым контуром ответственности за решения между `city_view_1` и `city_view_2`.
[FORBIDDEN][OSR-140] Подмена `FSSU_center` на "оперативный штаб, управляющий тактикой на земле".

## CONTENT

### 1. Center–Region Relation

[DECISION][OSR-200] `FSSU_center.primary_function` = "audit_and_accountability".
[DECISION][OSR-210] `FSSU_center.interface` MUST include {"reports","audit_requests","policy_constraints"}.

[RULE][OSR-220] IF `FSSU_center.requests` contains "tactical_micro_management" THEN `FSSU_ru16_dept.must_reject_request` = true; ELSE FAIL.

### 2. Regional Intake and Filtering

[DECISION][OSR-300] `FSSU_ru16_dept.intake.mode` = "continuous_signal_processing".
[DECISION][OSR-310] `FSSU_ru16_dept.case_rate_profile` = "rare_cases_most_incidents_not_escalated".

### 3. Decision Conveyor (RU-16)

[DECISION][OSR-400] `regional_conveyor.stages` = ["city_view_1","human_gate","city_view_2","flagship_team"].

[RULE][OSR-410] PASS IFF stage_order = ["city_view_1","human_gate","city_view_2","flagship_team"]; ELSE FAIL.

[RULE][OSR-420] IF `city_view_1.output` = "recommend_action_or_escalate" THEN `human_gate.review_required` = true; ELSE FAIL.

[RULE][OSR-430] IF `human_gate.review_required` = true THEN `human_gate.visa` MUST be true; ELSE FAIL.

### 4. Human Gate Responsibility

[DECISION][OSR-500] `human_gate.aliases` MUST include {"interpretation_and_accountability_group","ai_fix_curator"}.
[DECISION][OSR-510] `human_gate.accountability.scope` MUST include {"case_activation_support","action_visa","risk_acceptance_record"}.

[RULE][OSR-520] IF `decision.affects_case_status` = true OR `decision.affects_legal_significance` = true THEN `human_gate.visa` MUST be true; ELSE FAIL.

### 5. Flagship Team Presence

[DECISION][OSR-600] `FSSU_ru16_dept.flagship_team.role` = "solve_active_cases_on_ground".
[DECISION][OSR-610] `FSSU_ru16_dept.flagship_team.default_case_owner_role` = "case_owner".

## USAGE / RESOLUTION

[DECISION][OSR-900] Любая сцена RU-16/CHELNY с ФССУ MUST трактовать регион через OSR-100..OSR-130; ELSE FAIL.
[DECISION][OSR-910] Conflict resolution MUST follow SPEC-PRIORITY-RESOLUTION-2215-0001; ELSE FAIL.

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-FSSU-REGIONAL-RU16-2215-0001
role_type: RULE
export:
  - rule_id: OSR-100
    intent: define center relation for RU-16
    inputs: []
    outputs: [FSSU_center.relation]
  - rule_id: OSR-410
    intent: enforce regional conveyor stage order
    inputs: [stage_order]
    outputs: [conveyor_ok]
  - rule_id: OSR-520
    intent: require human gate visa for case/legal-significant decisions
    inputs: [decision.affects_case_status, decision.affects_legal_significance]
    outputs: [human_gate.visa]
~~~

## FORBIDDEN

[FORBIDDEN][OSR-980] Региональные локационные детали офиса (этажи/архитектура/материалы) в этом документе; ELSE FAIL.
[FORBIDDEN][OSR-981] Представление `human_gate` как автоматического контура без персональной ответственности; ELSE FAIL.
[FORBIDDEN][OSR-982] Представление `FSSU_center` как тактического командования на земле; ELSE FAIL.

## NON-NORMATIVE

~~~text

Термины ГОРОД-1/ГОРОД-2 здесь фиксируются как региональные ярлыки (RU-16);
детальные свойства их автономии и ограничения будут вынесены в отдельный документ CITYVIEW.
~~~
