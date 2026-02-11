---
id: SSOT-CONSISTENCY-A-2215-0009
title: >
  Consistency Ruleset — Scenario A (2215)
class: ssot
status: draft
prefix: CON
doc_language: en-US
inputs: []
depends_on:
  - SPEC-DOC_STYLE-2215-0001
  - SSOT-AUTOMATION-A-2215-0004
  - SSOT-CLIMATE-A-2215-0004
  - SSOT-DEMOGRAPHY-A-2215-0002
  - SSOT-ECONOMY-A-2215-0003
  - SSOT-ENERGY-A-2215-0004
  - SSOT-GOVERNANCE-SECURITY-A-2215-0005
  - SSOT-SCENARIO-A-2215-0001
  - SSOT-URBANISM-A-2215-0007
references: []
scope: >
  SSOT RULE document for corpus consistency in 2215 (Scenario A).
  Defines metric statuses (CANON, DUAL_ALLOWED, CONFLICT, UNKNOWN),
  interpretation rules, and downstream document obligations.
  Does not introduce new metrics or select values.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: consistency validation and interpretation rules for SSOT corpus (Scenario A)
INPUTS: []
OUTPUTS: [metric_status, allowed_values, downstream_constraints]
FORBIDDEN: [introduce_world_facts, select_values, narrative_reasoning]

## DEFINITIONS

[FACT][CON-010] `metric_status` ∈ {CANON, DUAL_ALLOWED, CONFLICT, UNKNOWN}.
[FACT][CON-020] CANON = exactly one allowed value/range for downstream default usage.
[FACT][CON-030] DUAL_ALLOWED = core allowed as default; upper-tail (p90) allowed ONLY as explicitly localized upper-tail case (exemption).
[FACT][CON-040] CONFLICT = incompatible SSOT STATE declarations without an explicit resolving rule.
[FACT][CON-050] UNKNOWN = referenced downstream but not declared in any SSOT STATE document.
[FACT][CON-060] `downstream_docs` = {baseline, canon, plan, scene}.
[FACT][CON-070] `narrative_lock` = rule-level constraint that forces downstream to treat a metric as CANON even if SSOT declares core+p90.

## INVARIANTS

[DECISION][CON-080] This document MUST NOT introduce new metrics or values.
[DECISION][CON-090] This document interprets SSOT STATE but MUST NOT replace it.
[DECISION][CON-100] Any metric used downstream MUST have a defined status.

## CONTENT

### 1. Metric Status Derivation Rules

[RULE][CON-200] IF a metric has exactly one declared value or range across all SSOT STATE docs THEN status MUST be CANON; ELSE FAIL.
[RULE][CON-210] IF a metric has declared `core` and `p90` values AND no rule forbids coexistence THEN status MUST be DUAL_ALLOWED; ELSE FAIL.
[RULE][CON-220] IF two or more SSOT STATE docs declare incompatible values AND no DUAL_ALLOWED rule exists THEN status MUST be CONFLICT; ELSE FAIL.
[RULE][CON-230] IF a metric is referenced downstream but not declared in any SSOT STATE THEN status MUST be UNKNOWN; ELSE FAIL.

### 2. Downstream Usage Rules by Status

[RULE][CON-240] IF metric status = CANON THEN downstream MUST use the canonical value/range only; ELSE FAIL.
[RULE][CON-250] IF metric status = DUAL_ALLOWED THEN downstream MUST use `core` as default background; ELSE FAIL.
[RULE][CON-260] IF metric status = DUAL_ALLOWED THEN upper-tail (`p90`) usage MUST be exemption_only AND MUST satisfy localization
  and procedural cost rules; ELSE FAIL.
[RULE][CON-270] IF metric status = CONFLICT THEN any downstream usage MUST be FORBIDDEN until resolved by class: canon; ELSE FAIL.
[RULE][CON-280] IF metric status = UNKNOWN THEN any downstream usage MUST be FORBIDDEN; ELSE FAIL.

### 3. Narrative Lock Rules

[RULE][CON-300] IF a RULE or CANON document marks a metric as narrative_lock = true THEN that marking MUST be applied; ELSE FAIL.
[RULE][CON-310] IF metric has narrative_lock = true THEN downstream MUST treat it as CANON (default background),
  even if SSOT status is DUAL_ALLOWED; ELSE FAIL.
[RULE][CON-320] IF narrative_lock = true THEN upper-tail values MUST be used ONLY via explicit exemption with localization and cost; ELSE FAIL.

### 4. Location-Specific Constraints

[RULE][CON-400] IF location = RU-16/CHELNY AND metric = primary_energy_TW THEN upper-tail (p90) values MUST be FORBIDDEN
  as default background; ELSE FAIL.

### 5. Closure Rules

[RULE][CON-500] IF metric status = DUAL_ALLOWED OR metric status = UNKNOWN THEN closure MUST be performed ONLY by a class: canon document; ELSE FAIL.
[RULE][CON-510] IF closure is performed THEN metric status MUST be updated to CANON (or MUST remain FORBIDDEN if removed); ELSE FAIL.

## USAGE / RESOLUTION

[DECISION][CON-800] Consistency rules MUST be applied before any baseline/canon generation that references SSOT metrics.
[DECISION][CON-810] Any violation of consistency rules MUST be treated as a generation error, not as a creative choice.

## OUTPUT CONTRACT

~~~yaml
doc_id: SSOT-CONSISTENCY-A-2215-0009
role_type: RULE
export:
  - rule_id: CON-200
    intent: "derive CANON status for single-value metrics"
    inputs: [metric_declarations]
    outputs: [metric_status]
  - rule_id: CON-210
    intent: "derive DUAL_ALLOWED status for core+p90 metrics"
    inputs: [metric_declarations]
    outputs: [metric_status]
  - rule_id: CON-240
    intent: "enforce canonical-only usage for CANON metrics"
    inputs: [metric_status]
    outputs: [downstream_constraint]
  - rule_id: CON-260
    intent: "restrict p90 usage to exemption-only for DUAL_ALLOWED"
    inputs: [metric_status]
    outputs: [downstream_constraint]
  - rule_id: CON-300
    intent: "apply narrative_lock from RULE/CANON documents"
    inputs: [metric, narrative_lock]
    outputs: [downstream_constraint]
  - rule_id: CON-500
    intent: "restrict closure authority to class: canon"
    inputs: [metric_status]
    outputs: [closure_constraint]
~~~

## FORBIDDEN

[FORBIDDEN][CON-900] Selecting values for narrative use.
[FORBIDDEN][CON-910] Repeating SSOT STATE data (numbers/ranges) inside this document.
[FORBIDDEN][CON-920] Implicit resolution without class: canon.

## NON-NORMATIVE

~~~text
Empty by design.
~~~