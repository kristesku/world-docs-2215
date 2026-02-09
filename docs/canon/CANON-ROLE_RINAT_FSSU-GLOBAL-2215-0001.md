---
id: CANON-ROLE_RINAT_FSSU-GLOBAL-2215-0001
title: >
  Роль — Ринат (ФССУ) — regional chief, политическое прикрытие, рамки риска и интерфейсы (2215)
class: canon
status: draft
version: 1.0.0
prefix: ORI
doc_language: en-US
prose_language: ru-RU
inputs: []
depends_on:
  - CANON-FSSU-GLOBAL-2215-0005
  - CANON-FSSU_REGIONAL-RU16-2215-0001
  - CANON-FSSU_TEAM_STRUCT-GLOBAL-2215-0001
  - SPEC-DOC_ID-2215-0001
  - SPEC-DOC_STYLE-2215-0001
  - SPEC-PRIORITY_RESOLUTION-2215-0001
scope: >
  RULE-канон роли Рината как руководителя регионального отдела ФССУ (RU-16/CHELNY).
  Фиксирует: административные полномочия, политическое прикрытие флагманской команды,
  рамки допустимого риска, правила вмешательства в кейсы, интерфейсы с Центром и внешними контурами.
  Не описывает тактику активного кейса (она принадлежит case_owner).
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: define Rinat role contract as regional chief providing political shield and administrative governance for RU-16 FSSU
INPUTS: [CANON-FSSU-GLOBAL-2215-0005, CANON-FSSU_REGIONAL-RU16-2215-0001, CANON-FSSU_TEAM_STRUCT-GLOBAL-2215-0001]
OUTPUTS: [rinat_authorities, rinat_limits, rinat_shield_rules, rinat_case_involvement_rules]
FORBIDDEN: [scene_text, narrative_prose, tactical_micro_management, undefined_terms]

## DEFINITIONS

[FACT][ORI-010] `rinat` = руководитель регионального отдела ФССУ в RU-16/CHELNY.
[FACT][ORI-020] `regional_chief` = роль административного управления отделом и внешних коммуникаций, обеспечивающая политическое прикрытие поля.
[FACT][ORI-030] `political_shield` = функция поглощения/переработки внешнего давления и легализации рамок работы флагманской команды.
[FACT][ORI-040] `risk_frame` = формализованная рамка допустимого риска (Safety_Impact / Sovereignty_Impact / политико-правовые ограничения).
[FACT][ORI-050] `tactical_micro_management` = вмешательство руководителя отдела в тактические решения активного кейса.

## INVARIANTS

[DECISION][ORI-100] Ринат MUST быть `regional_chief` регионального отдела ФССУ RU-16.
[DECISION][ORI-110] Основная функция Рината MUST быть `political_shield` для флагманской команды.
[FORBIDDEN][ORI-120] `tactical_micro_management` активного кейса как нормальная практика.
[DECISION][ORI-130] Ринат MUST быть основной внешней точкой коммуникации отдела с мэрией, регуляторами, операторами и Центром.

## CONTENT

### 1. Administrative Authorities

[DECISION][ORI-200] Ринат определяет административные рамки работы отдела: ресурсы, режимность, приоритеты портфеля кейсов.
[DECISION][ORI-210] Ринат утверждает `risk_frame` для работы отдела на горизонте недель/месяцев.
[DECISION][ORI-220] Ринат обеспечивает выполнение требований отчётности и аудита со стороны Центра без передачи тактического управления.

[RULE][ORI-230] IF `FSSU_center.request` = "tactical_micro_management" THEN `rinat.must_reject_request` MUST be true; ELSE FAIL.

### 2. Political Shield Function

[DECISION][ORI-300] Ринат принимает на себя внешние конфликты: политические, межведомственные и корпоративные.
[DECISION][ORI-310] Ринат обеспечивает “легальный периметр” работы команды: корректность форм, рамки доступа, режимность и публичные объяснения без раскрытия критичных деталей.

[RULE][ORI-320] IF `political_pressure_event` = true THEN `rinat.absorbs_pressure` MUST be true; ELSE FAIL.
[RULE][ORI-330] IF `political_pressure_event` = true THEN `field_team.tactics` MUST remain "case_owner_controlled"; ELSE FAIL.

### 3. Risk Frame Governance

[DECISION][ORI-400] Ринат устанавливает допустимые компромиссы между скоростью остановки режима и процедурной допустимостью.
[DECISION][ORI-410] Ринат фиксирует решения о принятии остаточного риска на уровне отдела, когда остановка режима частична.

[RULE][ORI-420] IF `case.requires_residual_risk_acceptance` = true THEN `risk_frame.acceptance_recorded` MUST be true; ELSE FAIL.

### 4. Case Intake Interface

[DECISION][ORI-500] Ринат является входным интерфейсом для части сигналов/кейсов через внешние контуры (мэрия, регуляторы, операторы, Центр).
[DECISION][ORI-510] Ринат перенаправляет входящие обращения в triage/конвейер отдела без подмены юрисдикционного критерия.

[RULE][ORI-520] IF `external_request.received` = true THEN `request.sent_to_triage` MUST be true; ELSE FAIL.
[RULE][ORI-530] IF `external_request.received` = true THEN `jurisdiction_gate` MUST remain "FSSU-300"; ELSE FAIL.

### 5. Case Involvement Rules

[DECISION][ORI-600] Участие Рината в активном кейсе является редким и происходит только при необходимости политико-правового решения или высокого суверенного риска.
[DECISION][ORI-610] Ринат вмешивается не в тактику, а в рамки: формы, доступы, межведомственные согласования, публичные последствия.

[RULE][ORI-620] IF `rinat.participates_in_case` = true THEN `participation.scope` MUST be one of {legal_frame, interagency_interface, political_shield, risk_frame}; ELSE FAIL.
[RULE][ORI-630] IF `rinat.participates_in_case` = true THEN `participation.scope` MUST NOT include "tactics"; ELSE FAIL.

### 6. Interface with Case Owner (Miron)

[DECISION][ORI-700] Ринат получает от `case_owner` статус, риски и запросы на эскалацию форм/ресурса.
[DECISION][ORI-710] Ринат обеспечивает для `case_owner` внешние условия работы: доступы, прикрытие, межведомственный ресурс.

[RULE][ORI-720] IF `case_owner.requests_escalation` = true THEN `rinat.must_review_request` MUST be true; ELSE FAIL.

## USAGE / RESOLUTION

[DECISION][ORI-950] Любая сцена, использующая роль Рината в ФССУ, MUST следовать ORI-100..ORI-720; ELSE FAIL.
[DECISION][ORI-960] Conflict resolution MUST follow SPEC-PRIORITY_RESOLUTION-2215-0001; ELSE FAIL.

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-ROLE_RINAT_FSSU-GLOBAL-2215-0001
role_type: RULE
export:
  - rule_id: ORI-230
    intent: reject tactical micro-management requests from center
    inputs: [FSSU_center.request]
    outputs: [rinat.must_reject_request]
  - rule_id: ORI-320
    intent: absorb political pressure
    inputs: [political_pressure_event]
    outputs: [rinat.absorbs_pressure]
  - rule_id: ORI-420
    intent: require recorded risk acceptance
    inputs: [case.requires_residual_risk_acceptance]
    outputs: [risk_frame.acceptance_recorded]
  - rule_id: ORI-620
    intent: constrain scope of Rinat participation in case
    inputs: [rinat.participates_in_case]
    outputs: [participation.scope]
~~~

## FORBIDDEN

[FORBIDDEN][ORI-980] Представление Рината как тактического руководителя активного кейса; ELSE FAIL.
[FORBIDDEN][ORI-981] Представление “политического прикрытия” как отмены процедурной формы или ответственности; ELSE FAIL.
[FORBIDDEN][ORI-982] Подмена юрисдикционного критерия ФССУ внешним запросом/давлением; ELSE FAIL.

## NON-NORMATIVE

~~~text
Роль Рината — “щит и рамки”, а не “тактика и штурм”: он держит внешние контуры и риск-политику,
оставляя ведение кейса case_owner и флагманской команде.
~~~
