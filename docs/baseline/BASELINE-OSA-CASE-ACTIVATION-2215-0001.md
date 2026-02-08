---
id: BASELINE-OSA-CASE-ACTIVATION-2215-0001
title: >
  ОСА — Активация кейса — intake, triage, пороги и немедленные эффекты (2215)
class: baseline
status: draft
version: 1.0.0
prefix: OCA
doc_language: ru-RU
prose_language: ru-RU
inputs:
  - PROCESS-CASE-ACTIVATION-OSA-2215-0001
depends_on:
  - CANON-OSA-GLOBAL-2215-0005
  - CANON-SYSTEM-ONTOLOGY-2215-0001
  - SPEC-DOC-ID-2215-0001
  - SPEC-DOC-STYLE-2215-0001
  - SPEC-PRIORITY-RESOLUTION-2215-0001
scope: >
  RULE-baseline процедуры активации кейса ОСА: intake → triage → activation → assignment.
  Задаёт пороги кейса (Safety_Impact / Sovereignty_Impact) и немедленные эффекты (preservation window).
  Не описывает региональные конвейеры и локации.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: define baseline procedure for OSA case activation from intake to assignment with impact thresholds and immediate safeguards
INPUTS: [PROCESS-CASE-ACTIVATION-OSA-2215-0001]
OUTPUTS: [activation_flow, activation_thresholds, decision_authority, immediate_effects]
FORBIDDEN: [scene_text, narrative_prose, undefined_terms, regional_specifics]

## DEFINITIONS

[FACT][OCA-010] `intake_signal` = входящий сигнал/инцидент, требующий triage на предмет юрисдикции и порогов кейса.
[FACT][OCA-020] `triage` = процедура квалификации `intake_signal` по OSA-JUR-010 и оценке Impact.
[FACT][OCA-030] `activation` = перевод `intake_signal` в `case` с назначением `case_owner` и фиксацией формы.
[FACT][OCA-040] `case_threshold` = порог, при котором Impact считается достаточным для активации кейса.
[FACT][OCA-050] `preservation_window` = немедленный режим защиты данных/следов до стабилизации Systemic_Channel и фиксации артефактов.

## INVARIANTS

[DECISION][OCA-100] `activation` MUST be gated by OSA-JUR-010 (см. CANON-OSA-GLOBAL-2215-0005).
[DECISION][OCA-110] `triage` MUST produce an explicit record: {Systemic_Asset, Systemic_Channel, Safety_Impact, Sovereignty_Impact}.
[DECISION][OCA-120] `activation` MUST assign `case_owner`.
[FORBIDDEN][OCA-130] Активация кейса без фиксируемой процедурной формы (mandate/order/emergency).
[FORBIDDEN][OCA-140] Деактивация активированного кейса политическим давлением как нормальная практика.

## CONTENT

### 1. Intake → Triage

[RULE][OCA-200] IF `intake_signal.received` = true THEN `triage.required` MUST be true; ELSE FAIL.
[RULE][OCA-210] IF `triage.required` = true THEN `triage.record` MUST include {Systemic_Asset,Systemic_Channel,Safety_Impact,Sovereignty_Impact}; ELSE FAIL.
[RULE][OCA-220] IF `triage.required` = true THEN `triage.must_evaluate_jurisdiction` MUST be true; ELSE FAIL.

### 2. Jurisdiction Gate

[RULE][OCA-300] IF OSA-300 FAIL THEN `activation.permitted` MUST be false; ELSE FAIL.
[RULE][OCA-310] IF `activation.permitted` = false THEN `intake_signal.route` MUST be "transfer_by_competence"; ELSE FAIL.

### 3. Impact Threshold Gate

[RULE][OCA-400] PASS IFF (`triage.Safety_Impact` >= `case_threshold`) OR (`triage.Sovereignty_Impact` >= `case_threshold`); ELSE FAIL.
[RULE][OCA-410] IF OCA-400 FAIL THEN `activation.permitted` MUST be false; ELSE FAIL.

### 4. Decision Authority

[DECISION][OCA-500] `activation.decision_authority` MUST be human.
[RULE][OCA-510] IF `activation.permitted` = true THEN `activation.decision_authority` MUST be human; ELSE FAIL.
[RULE][OCA-520] IF `activation.permitted` = true THEN `activation.ai_may_recommend` MUST be true AND `activation.ai_must_not_activate` MUST be true; ELSE FAIL.

### 5. Activation Form and Assignment

[RULE][OCA-600] IF `activation.permitted` = true THEN `activation.form` MUST be one of {mandate, order, emergency}; ELSE FAIL.
[RULE][OCA-610] IF `activation.permitted` = true THEN `case.created` MUST be true; ELSE FAIL.
[RULE][OCA-620] IF `case.created` = true THEN `case_owner.assigned` MUST be true; ELSE FAIL.

### 6. Immediate Effects (Preservation Window)

[DECISION][OCA-700] `preservation_window.effects_min` MUST include {data_protection, evidence_preservation, access_control_tightening, logging_intensification}.
[RULE][OCA-710] IF `case.created` = true THEN `preservation_window.active` MUST be true; ELSE FAIL.
[RULE][OCA-720] IF `preservation_window.active` = true THEN `preservation_window.effects` MUST include `preservation_window.effects_min`; ELSE FAIL.

### 7. Deactivation Constraints

[RULE][OCA-800] IF `case.created` = true THEN `case.deactivation.requires_recorded_basis` MUST be true; ELSE FAIL.
[RULE][OCA-810] IF `case.created` = true THEN `case.deactivation.basis` MUST be one of {channel_stabilized, asset_stabilized, transferred_by_competence, judicial_stop}; ELSE FAIL.

## USAGE / RESOLUTION

[DECISION][OCA-900] Любая сцена, где активируется кейс ОСА, MUST следовать OCA-200..OCA-810; ELSE FAIL.
[DECISION][OCA-910] Conflict resolution MUST follow SPEC-PRIORITY-RESOLUTION-2215-0001; ELSE FAIL.

## OUTPUT CONTRACT

~~~yaml
doc_id: BASELINE-OSA-CASE-ACTIVATION-2215-0001
role_type: RULE
export:
  - rule_id: OCA-200
    intent: require triage on intake
    inputs: [intake_signal.received]
    outputs: [triage.required]
  - rule_id: OCA-300
    intent: jurisdiction gate
    inputs: [OSA-300]
    outputs: [activation.permitted]
  - rule_id: OCA-400
    intent: impact threshold gate
    inputs: [triage.Safety_Impact, triage.Sovereignty_Impact, case_threshold]
    outputs: [activation.permitted]
  - rule_id: OCA-620
    intent: require case owner assignment on activation
    inputs: [case.created]
    outputs: [case_owner.assigned]
  - rule_id: OCA-720
    intent: enforce preservation window effects
    inputs: [preservation_window.active]
    outputs: [preservation_window.effects]
~~~

## FORBIDDEN

[FORBIDDEN][OCA-980] Региональные детали конвейера решений (ГОРОД-1/ГОРОД-2, human gate) в этом документе; ELSE FAIL.
[FORBIDDEN][OCA-981] Подмена порогов кейса “по ощущению” без прохождения OCA-400; ELSE FAIL.
[FORBIDDEN][OCA-982] Активация кейса ИИ-системой без решения человека; ELSE FAIL.

## NON-NORMATIVE

~~~text
Этот baseline описывает только “как кейс появляется” и какие немедленные эффекты включаются.
Региональный конвейер RU-16 (включая human gate и ГОРОД-1/2) фиксируется в CANON-OSA-REGIONAL-RU16-2215-0001.
Whitelist low-impact автономии фиксируется в REG-OSA-AUTO-LOWIMPACT-2215-0001.
~~~
