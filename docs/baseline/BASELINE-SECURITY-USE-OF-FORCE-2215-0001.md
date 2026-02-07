---
id: BASELINE-SECURITY-USE-OF-FORCE-2215-0001
title: >
  Security Baseline — 2215 (Use of Force, Detention, Jurisdiction)
class: baseline
status: fixed
version: 1.0.0
inputs:
  - SSOT-GOVERNANCE-SECURITY-A-2215-0005
  - SSOT-SCENARIO-A-2215-0001
depends_on:
  - CANON-BASE-RULE-GLOBAL-2215-0001
  - BASELINE-URBAN-OBSERVABILITY-2215-0001
  - BASELINE-DIGITALIDENTITY-2215-0001
  - BASELINE-SOCIAL-CIVIC-2215-0001
scope: >
  Исполняемый baseline применения силы и процедур безопасности (LEVEL-MID) в 2215 году.
  Определяет допустимые триггеры, ступени эскалации, задержание, юрисдикцию
  и процедурные ограничения для law_enforcement и ОSA. Не выбирает параметры мира.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: enforceable security and use-of-force defaults (LEVEL-MID)
INPUTS:
  - SSOT-GOVERNANCE-SECURITY-A-2215-0005
  - SSOT-SCENARIO-A-2215-0001
  - CANON-BASE-RULE-GLOBAL-2215-0001
  - BASELINE-URBAN-OBSERVABILITY-2215-0001
  - BASELINE-DIGITALIDENTITY-2215-0001
  - BASELINE-SOCIAL-CIVIC-2215-0001
OUTPUTS: [rule_id, escalation_state, detention_state, jurisdiction_outcome]
FORBIDDEN: [prose, cultural_exposition, heroic_myth, mixed_role_types, vigilante_logic]

---

## DEFINITIONS

[FACT][SEC-DEF-010] LEVEL-MID = стандартные городские условия без специальных лицензий.
[FACT][SEC-DEF-011] law_enforcement = государственные полицейские/следственные органы в рамках обычной юрисдикции.
[FACT][SEC-DEF-012] OSA = федеральная межведомственная структура; применение ограничено угрозой базовым функциям государства.
[FACT][SEC-DEF-013] use_of_force = применение физического воздействия, ограничений, устройств или оружия.
[FACT][SEC-DEF-014] escalation_state = deescalate | restrain | incapacitate | lethal.
[FACT][SEC-DEF-015] detention = временное ограничение свободы до процессуального решения.
[FACT][SEC-DEF-016] warrant = процессуальный допуск (суд/прокурор/уполномоченный контур) на действие с правами.

[DECISION][SEC-DEF-020] Time limits MUST be expressed in minutes or hours.
[DECISION][SEC-DEF-021] Any duration range MUST use x ∈ [a, b] with units.

---

## INVARIANTS

[DECISION][SEC-INV-010] This document MUST be treated as executable baseline for LEVEL-MID.
[DECISION][SEC-INV-011] Security actions MUST be procedural, auditable, and role-bound.
[DECISION][SEC-INV-012] Escalation MUST be stepwise unless immediate threat is present.
[FORBIDDEN][SEC-INV-013] Depicting baseline security as ad-hoc personal discretion without procedure.
[FORBIDDEN][SEC-INV-014] Depicting OSA as a direct-command chain subject to personal calls.

---

## CONTENT

### 1. Triggers (Initiation Conditions)

[RULE][SEC-TRG-010] IF telemetry_event.class = safety_anomaly THEN response MUST be initiated.
[RULE][SEC-TRG-011] IF legal_status = suspect THEN identity_check MUST be initiated.
[RULE][SEC-TRG-012] IF crime_class = criminal_offense THEN detention MAY be initiated.

[FORBIDDEN][SEC-TRG-020] Initiating force without a trigger or immediate threat.

### 2. Escalation Ladder (Use of Force)

[RULE][SEC-UOF-010] IF immediate_threat = false THEN escalation_state MUST start at deescalate.
[RULE][SEC-UOF-011] IF compliance = false AND immediate_threat = false THEN escalation_state MAY move to restrain.
[RULE][SEC-UOF-012] IF weapon_present = true OR immediate_threat = true THEN escalation_state MAY move to incapacitate.
[RULE][SEC-UOF-013] IF lethal_threat = true THEN escalation_state MAY move to lethal.

[FORBIDDEN][SEC-UOF-020] Skipping escalation steps without immediate_threat OR lethal_threat.
[FORBIDDEN][SEC-UOF-021] Lethal force without lethal_threat.

### 3. Non-Lethal Defaults

[RULE][SEC-NLT-010] IF escalation_state = restrain THEN non_lethal_means MUST be preferred.
[RULE][SEC-NLT-011] IF escalation_state = incapacitate THEN non_lethal_means MUST be preferred unless lethal_threat = true.

[FORBIDDEN][SEC-NLT-020] Baseline depiction of casual lethal solutions.

### 4. Detention and Time Windows

[RULE][SEC-DTN-010] IF detention = initiated THEN custody_log MUST be created.
[RULE][SEC-DTN-011] IF detention = initiated THEN person_rights_notice MUST be delivered.
[RULE][SEC-DTN-012] IF detention = initiated THEN detention_time_limit_hours MUST satisfy x ∈ [6, 24] hours.

[RULE][SEC-DTN-013] IF detention_time_limit_hours exceeded THEN release OR formal_charge MUST occur.

[FORBIDDEN][SEC-DTN-020] Indefinite detention at LEVEL-MID baseline.

### 5. Identity, Devices, and Access

[RULE][SEC-IDV-010] IF identity_check = initiated THEN BAN_ID verification MUST be performed.
[RULE][SEC-IDV-011] IF BAN_ID verification fails THEN detention MAY be initiated.

[RULE][SEC-IDV-012] IF device_access_requested = true THEN warrant MUST be required.
[RULE][SEC-IDV-013] IF warrant = absent THEN device_access MUST be forbidden.

[FORBIDDEN][SEC-IDV-020] Casual device inspection without warrant at LEVEL-MID.

### 6. Audit and Accountability

[RULE][SEC-AUD-010] IF use_of_force = true THEN audit_log MUST record event.
[RULE][SEC-AUD-011] IF escalation_state = lethal THEN incident_review MUST be mandatory.
[RULE][SEC-AUD-012] IF detention = initiated THEN custody_log MUST be immutable.

[FORBIDDEN][SEC-AUD-020] Unlogged use_of_force actions.
[FORBIDDEN][SEC-AUD-021] Deleting or editing custody_log.

### 7. Jurisdiction and OSA Invocation

[RULE][SEC-JUR-010] IF threat_to_core_state_functions = false THEN law_enforcement MUST retain jurisdiction.
[RULE][SEC-JUR-011] IF threat_to_core_state_functions = true THEN OSA MAY be invoked.
[RULE][SEC-JUR-012] IF OSA invoked = true THEN interagency_notification MUST be mandatory.
[RULE][SEC-JUR-013] IF OSA invoked = true THEN scope MUST be limited to threat containment.

[FORBIDDEN][SEC-JUR-020] OSA acting as routine city police at LEVEL-MID baseline.
[FORBIDDEN][SEC-JUR-021] OSA invocation without threat_to_core_state_functions.

### 8. De-escalation and Exit Conditions

[RULE][SEC-EXT-010] IF compliance = true AND immediate_threat = false THEN escalation_state MUST return to deescalate.
[RULE][SEC-EXT-011] IF suspect_cleared = true THEN detention MUST end.

[FORBIDDEN][SEC-EXT-020] Continuing force after compliance and threat cessation.

---

## USAGE / RESOLUTION

[DECISION][SEC-USE-010] Any urban security scene MUST apply SEC-TRG-* and SEC-UOF-* unless overridden.
[DECISION][SEC-USE-011] Any detention scene MUST apply SEC-DTN-* and SEC-AUD-* unless overridden.
[DECISION][SEC-USE-012] Any device access scene MUST apply SEC-IDV-* unless overridden.
[DECISION][SEC-USE-013] Any OSA appearance MUST apply SEC-JUR-* unless overridden.
[FORBIDDEN][SEC-USE-014] Depicting vigilante enforcement as baseline legitimacy at LEVEL-MID.

---

## OUTPUT CONTRACT

~~~yaml
doc_id: BASELINE-SECURITY-USE-OF-FORCE-2215-0001
role_type: RULE
export:
  - rule_id: SEC-UOF-010
    intent: start escalation at deescalate when no immediate threat
    inputs: [immediate_threat]
    outputs: [escalation_state]
  - rule_id: SEC-DTN-012
    intent: bound detention window at LEVEL-MID
    inputs: [detention]
    outputs: [detention_time_limit_hours]
  - rule_id: SEC-IDV-012
    intent: require warrant for device access
    inputs: [device_access_requested]
    outputs: [warrant_required]
  - rule_id: SEC-JUR-011
    intent: allow OSA invocation only for threats to core state functions
    inputs: [threat_to_core_state_functions]
    outputs: [OSA_invocation]
~~~

---

## FORBIDDEN

[FORBIDDEN][SEC-FBD-010] Heroic or mythic framing of force as baseline norm.
[FORBIDDEN][SEC-FBD-011] Ad-hoc, unaudited enforcement as baseline.
[FORBIDDEN][SEC-FBD-012] Mixed ROLE_TYPE content inside this document.
[FORBIDDEN][SEC-FBD-013] Floating bullets without statement IDs.
[FORBIDDEN][SEC-FBD-014] Vigilante logic presented as legitimate baseline.

---

## NON-NORMATIVE

This baseline encodes security as procedure, audit, and bounded escalation.
Tension MUST come from windows, jurisdiction, and paperwork—not lawless violence.
