---
id: CANON-FSSU-CITYVIEW-RU16-2215-0001
title: >
  ФССУ — RU-16 — ГОРОД-1 / ГОРОД-2 — представления System, границы автономии и эскалация (2215)
class: canon
status: draft
version: 1.0.0
prefix: OCV
doc_language: ru-RU
prose_language: ru-RU
inputs: []
depends_on:
  - CANON-FSSU-GLOBAL-2215-0005
  - CANON-FSSU-REGIONAL-RU16-2215-0001
  - CANON-FSSU-DEPT-STRUCT-RU16-2215-0001
  - CANON-SYSTEM-ONTOLOGY-2215-0001
  - REG-FSSU-AUTO-LOWIMPACT-2215-0001
  - SPEC-DOC-ID-2215-0001
  - SPEC-DOC-STYLE-2215-0001
  - SPEC-PRIORITY-RESOLUTION-2215-0001
scope: >
  RULE-канон региональных представлений ГОРОД-1 и ГОРОД-2 в RU-16/CHELNY.
  Фиксирует: что это за представления (не субъект и не “разум”), назначение, границы автономии,
  запрет юридически значимых решений без человека, условия обязательной эскалации и окно критичности.
  Не описывает детали реализации моделей и не задаёт офис/локацию.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: define CITYVIEW_1 and CITYVIEW_2 as regional representations with autonomy boundaries and mandatory escalation rules
INPUTS: []
OUTPUTS: [cityview_definitions, autonomy_limits, escalation_rules, responsibility_constraints]
FORBIDDEN: [implementation_details, model_architecture, narrative_prose, scene_text]

## DEFINITIONS

[FACT][OCV-010] `city_view_1` = ГОРОД-1: аналитическое представление потока сигналов/инцидентов, предназначенное для корреляции и генерации гипотез.
[FACT][OCV-020] `city_view_2` = ГОРОД-2: исполнительное представление low-impact действий и маршрутизации, ограниченное whitelist.
[FACT][OCV-030] `managed_system` = System, наблюдаемая/затрагиваемая ФССУ (см. SONT-010).
[FACT][OCV-040] `FSSU_ai_stack` = ИИ-контур ФССУ, независимый от `managed_system` (см. CANON-FSSU-GLOBAL-2215-0005).
[FACT][OCV-050] `critical_window` = ограниченное время, в течение которого промедление приводит к необратимому росту Impact или потере артефактов.
[FACT][OCV-060] `mandatory_escalation` = обязательная передача в human gate/кейс при выполнении условий эскалации.

## INVARIANTS

[FORBIDDEN][OCV-100] Трактовка ГОРОД-1/ГОРОД-2 как субъекта, воли, намеренного врага или “персонифицированного антагониста”.

[DECISION][OCV-110] ГОРОД-1/ГОРОД-2 MUST быть частью `FSSU_ai_stack` и MUST NOT входить в контуры `managed_system`.

[DECISION][OCV-120] ГОРОД-1/ГОРОД-2 MUST быть независимы от управляемой System по доступам и контурам принятия решений.

[FORBIDDEN][OCV-130] ГОРОД-1/ГОРОД-2 принимают юридически значимые решения без визы человека.

[DECISION][OCV-140] Любое действие ГОРОД-2 MUST быть ограничено whitelist REG-FSSU-AUTO-LOWIMPACT-2215-0001.

[DECISION][OCV-150] При наступлении `critical_window` MUST выполняться `mandatory_escalation`.

## CONTENT

### 1. Purpose Split

[DECISION][OCV-200] `city_view_1.purpose` MUST include {correlation, hypothesis_generation, impact_estimation, route_recommendation}.
[DECISION][OCV-210] `city_view_2.purpose` MUST include {lowimpact_execution, routing_outcomes_emission, escalation_triggering}.

[FORBIDDEN][OCV-220] ГОРОД-2 выполняет high-impact действия или меняет режим Systemic_Asset без активного кейса.

### 2. Local Adaptation

[DECISION][OCV-300] `FSSU_ai_stack.local_adaptation` MAY include "ru16_local_finetune_on_observability_patterns".
[FORBIDDEN][OCV-310] Локальная адаптация MUST NOT изменять значения определений SONT-010..060.

### 3. Autonomy Boundaries

[RULE][OCV-400] IF `city_view_1.outputs` produced THEN `human_gate.review_required` MUST be true; ELSE FAIL.
[RULE][OCV-410] IF `human_gate.review_required` = true THEN `human_gate.visa` MUST be true; ELSE FAIL.

[RULE][OCV-420] IF `city_view_2.executes_action` = true THEN `action.type` MUST be in whitelist(REG-FSSU-AUTO-LOWIMPACT-2215-0001); ELSE FAIL.
[RULE][OCV-430] IF `city_view_2.executes_action` = true THEN `execution.logging_required` MUST be true; ELSE FAIL.

### 4. Mandatory Escalation

[DECISION][OCV-500] `mandatory_escalation.conditions.min_set` MUST include {impact_threshold_reached, critical_window_detected, channel_unbounded, evidence_purge_risk, sovereignty_indicator}.

[RULE][OCV-510] IF `impact_threshold_reached` = true THEN `mandatory_escalation` MUST be true; ELSE FAIL.
[RULE][OCV-520] IF `critical_window_detected` = true THEN `mandatory_escalation` MUST be true; ELSE FAIL.
[RULE][OCV-530] IF `evidence_purge_risk` = true THEN `mandatory_escalation` MUST be true; ELSE FAIL.
[RULE][OCV-540] IF `sovereignty_indicator` = true THEN `mandatory_escalation` MUST be true; ELSE FAIL.

[RULE][OCV-550] IF `mandatory_escalation` = true THEN `routing_outcome` MUST be CASE_ESCALATION; ELSE FAIL.
[RULE][OCV-560] IF `routing_outcome` = CASE_ESCALATION THEN `activation_flow.required` MUST be true; ELSE FAIL.

### 5. Naming and Representation Constraint

[DECISION][OCV-600] “ГОРОД-1/ГОРОД-2” являются рабочими ярлыками представлений и MUST NOT трактоваться как имена субъектов.
[FORBIDDEN][OCV-610] Представление “ГОРОД-1/2” как автономной власти, принимающей решения “вместо людей”.

## USAGE / RESOLUTION

[DECISION][OCV-900] Любая сцена RU-16, использующая ГОРОД-1/ГОРОД-2, MUST следовать OCV-100..OCV-610; ELSE FAIL.
[DECISION][OCV-910] Conflict resolution MUST follow SPEC-PRIORITY-RESOLUTION-2215-0001; ELSE FAIL.

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-FSSU-CITYVIEW-RU16-2215-0001
role_type: RULE
export:
  - rule_id: OCV-110
    intent: enforce independence of FSSU AI stack from managed system
    inputs: [FSSU_ai_stack, managed_system]
    outputs: [independence_ok]
  - rule_id: OCV-420
    intent: restrict CITYVIEW-2 execution to low-impact whitelist
    inputs: [city_view_2.executes_action, action.type]
    outputs: [action.allowed]
  - rule_id: OCV-520
    intent: mandate escalation on critical window
    inputs: [critical_window_detected]
    outputs: [mandatory_escalation]
  - rule_id: OCV-550
    intent: enforce routing outcome on mandatory escalation
    inputs: [mandatory_escalation]
    outputs: [routing_outcome]
  - rule_id: OCV-560
    intent: require activation flow on escalation
    inputs: [routing_outcome]
    outputs: [activation_flow.required]
~~~

## FORBIDDEN

[FORBIDDEN][OCV-980] Описание внутренних архитектур моделей/весов/датасетов/алгоритмов; ELSE FAIL.
[FORBIDDEN][OCV-981] Принятие юридически значимых решений ГОРОД-1/ГОРОД-2 без визы человека; ELSE FAIL.
[FORBIDDEN][OCV-982] Исполнение ГОРОД-2 действий вне whitelist; ELSE FAIL.
[FORBIDDEN][OCV-983] Персонификация ГОРОД-1/ГОРОД-2 как “антагониста”; ELSE FAIL.

## NON-NORMATIVE

~~~text

ГОРОД-1/ГОРОД-2 фиксируются как региональные представления контуров ФССУ:
аналитика → human gate → low-impact исполнение/маршрутизация → эскалация.
Требования к недопущению юридически значимых решений ИИ без человека согласованы с CANON-FSSU-GLOBAL-2215-0005.
~~~
