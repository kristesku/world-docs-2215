---
id: SSOT-CONSISTENCY-A-2215-0009
title: >
  Consistency Ruleset — Scenario A (2215)
class: ssot
status: draft
version: 1.1.0
inputs: []
depends_on:
  - SPEC-DOC-STYLE-2215-0001
  - SSOT-SCENARIO-A-2215-0001
  - SSOT-ECONOMY-A-2215-0003
  - SSOT-DEMOGRAPHY-A-2215-0002
  - SSOT-AUTOMATION-A-2215-0004
  - SSOT-ENERGY-A-2215-0004
  - SSOT-CLIMATE-A-2215-0004
  - SSOT-GOVERNANCE-SECURITY-A-2215-0005
  - SSOT-URBANISM-A-2215-0007
scope: >
  SSOT RULE-документ согласованности корпуса 2215 (Scenario A).
  Определяет статусы метрик (CANON | DUAL_ALLOWED | CONFLICT | UNKNOWN),
  правила интерпретации и обязательства downstream-документов.
  Не вводит новые метрики и не выбирает значения.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: consistency validation and interpretation rules for SSOT corpus (Scenario A)
INPUTS:
  - SSOT-SCENARIO-A-2215-0001
  - SSOT-ECONOMY-A-2215-0003
  - SSOT-DEMOGRAPHY-A-2215-0002
  - SSOT-AUTOMATION-A-2215-0004
  - SSOT-ENERGY-A-2215-0004
  - SSOT-CLIMATE-A-2215-0004
  - SSOT-GOVERNANCE-SECURITY-A-2215-0005
  - SSOT-URBANISM-A-2215-0007
OUTPUTS:
  - metric_status
  - allowed_values
  - downstream_constraints
FORBIDDEN:
  - introduce_world_facts
  - select_values
  - narrative_reasoning

---

## DEFINITIONS

[DEF][CONS-DEF-010] metric_status ∈ {CANON, DUAL_ALLOWED, CONFLICT, UNKNOWN}.

[DEF][CONS-DEF-011] CANON = exactly one allowed value/range for downstream default usage.

[DEF][CONS-DEF-012] DUAL_ALLOWED = core allowed as default; upper-tail (p90) allowed only as explicitly localized upper-tail case (override).

[DEF][CONS-DEF-013] CONFLICT = incompatible SSOT STATE declarations without an explicit resolving rule.

[DEF][CONS-DEF-014] UNKNOWN = referenced downstream but not declared in any SSOT STATE document.

[DEF][CONS-DEF-015] downstream_docs = {baseline, canon, plan, scene}.

[DEF][CONS-DEF-016] narrative_lock = rule-level constraint that forces downstream to treat a metric as CANON even if SSOT declares core+p90.

---

## INVARIANTS

[RULE][CONS-INV-010] CONSISTENCY MUST NOT introduce new metrics or values.
[RULE][CONS-INV-011] CONSISTENCY interprets SSOT STATE but never overrides it.
[RULE][CONS-INV-012] Any metric used downstream MUST have a defined status.

---

## CONTENT

### 1. Metric status derivation rules

[RULE][CONS-010] IF a metric has exactly one declared value or range across all SSOT STATE docs THEN status = CANON.

[RULE][CONS-011] IF a metric has declared `core` and `p90` (or equivalent upper-tail) values AND no rule forbids coexistence THEN status = DUAL_ALLOWED.

[RULE][CONS-012] IF two or more SSOT STATE docs declare incompatible values AND no DUAL_ALLOWED rule exists THEN status = CONFLICT.

[RULE][CONS-013] IF a metric is referenced downstream but not declared in any SSOT STATE THEN status = UNKNOWN.

---

### 2. Downstream usage rules by status

[RULE][CONS-020] IF metric status = CANON THEN downstream MUST use the canonical value/range only.

[RULE][CONS-021] IF metric status = DUAL_ALLOWED THEN downstream MUST use `core` as default background.

[RULE][CONS-022] IF metric status = DUAL_ALLOWED THEN upper-tail (`p90`) usage is override_only and MUST satisfy localization + procedural cost rules (see CANON-METRICS-GLOBAL-2215-0002 where applicable).

[RULE][CONS-023] IF metric status = CONFLICT THEN any downstream usage is FORBIDDEN until resolved by class: canon or class: override.

[RULE][CONS-024] IF metric status = UNKNOWN THEN any downstream usage is FORBIDDEN.

---

### 3. Narrative lock rules

[RULE][CONS-030] A metric MAY be marked as narrative_lock by a RULE or CANON document.

[RULE][CONS-031] IF metric has narrative_lock = true THEN downstream MUST treat it as CANON (default background), even if SSOT status is DUAL_ALLOWED.

[RULE][CONS-032] IF narrative_lock = true THEN upper-tail values MAY ONLY be used via explicit override with localization and cost.

---

### 4. Location-specific constraints (policy gates)

[RULE][CONS-040] IF location = RU-16/CHELNY AND metric = primary_energy_TW THEN upper-tail (p90) values are FORBIDDEN as default background.

---

### 5. Closure rules (status finalization)

[RULE][CONS-050] DUAL_ALLOWED or UNKNOWN metrics MAY be closed only by:
- class: canon
- class: override

[RULE][CONS-051] AFTER closure, metric status MUST be updated to CANON (or remain FORBIDDEN if removed).

---

## USAGE / RESOLUTION

[RULE][CONS-090] CONSISTENCY rules MUST be applied before any baseline/canon generation that references SSOT metrics.
[RULE][CONS-091] Any violation of CONSISTENCY rules MUST be treated as a generation error, not as a creative choice.

---

## OUTPUT CONTRACT

~~~yaml
doc_id: SSOT-CONSISTENCY-A-2215-0009
role_type: RULE
export:
  - metric: <metric_key>
    status: CANON | DUAL_ALLOWED | CONFLICT | UNKNOWN
    narrative_lock: true | false
    allowed_usage:
      downstream_default: core | canon | forbidden
      upper_tail: allowed | forbidden | override_only
~~~

---

## FORBIDDEN

[FORBIDDEN][CONS-100] Selecting values for narrative use.
[FORBIDDEN][CONS-101] Repeating SSOT STATE data (numbers/ranges) inside this document.
[FORBIDDEN][CONS-102] Implicit resolution without class: canon or class: override.

---

## NON-NORMATIVE

(Empty by design)
