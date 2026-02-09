---
id: CANON-SYSTEM_VOICE-GLOBAL-2215-0001
title: >
  Голос системы — допустимые системные вставки, формат, метрики и запреты (2215)
class: canon
status: draft
version: 0.3.0
inputs:
  - CANON-VOCAB-GLOBAL-2215-0001
  - CANON-REPORTS-GLOBAL-2215-0006
depends_on:
  - SPEC-DOC_STYLE-2215-0001
  - SPEC-PRIORITY_RESOLUTION-2215-0001
scope: >
  RULE-канон «голФССУ системы»: как показывать оптимизацию/наблюдаемость/комплаенс
  через краткие машинные вставки (уведомления/логи/рекомендации/строки отчёта),
  без очеловечивания. Фиксирует источники, типы событий, обязательные поля,
  допустимые метрики, стиль и запреты.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: define allowed system voice inserts and constrain schema, sources, events, metrics, and style
INPUTS:
  - CANON-VOCAB-GLOBAL-2215-0001
  - CANON-REPORTS-GLOBAL-2215-0006
OUTPUTS:
  - system_voice_schema
  - allowed_sources
  - allowed_events
  - allowed_metrics
  - insertion_rules
  - forbidden_patterns
FORBIDDEN:
  - personify_system
  - add_new_sources
  - expand_metrics_without_override
  - narrative_explanations
  - emotional_language

---

## DEFINITIONS

[FACT][SVO-DEF-010] system_voice_insert = machine_message excerpt (notification/log/recommendation/report_line).
[FACT][SVO-DEF-011] evidence_link = linkage via refs {case_id, evidence_refs[], order_refs[]} to FSSU artifacts.
[FACT][SVO-DEF-012] classification ∈ {public, restricted, secret}.
[FACT][SVO-DEF-013] confidence ∈ {low, med, high}.
[FACT][SVO-DEF-014] enum_expansion_requires = explicit_override_doc.

---

## INVARIANTS

[DECISION][SVO-INV-010] System voice MUST exist only as machine messages and MUST NOT be a character.
[DECISION][SVO-INV-011] Every insert MUST be short, procedural, and scope-checkable.
[DECISION][SVO-INV-012] Inserts MUST NOT replace FSSU work; causality MUST be established via CM/FM.

---

## CONTENT

### 1. Placement, density, size

[RULE][SVO-010] Inserts SHOULD appear at escalation, allocation, procedural viscosity, or admissibility friction points.
[RULE][SVO-011] Insert frequency MUST NOT exceed 1 per 2–3 scenes.
[RULE][SVO-012] Exception: Acts III–IV MAY increase density under sustained crisis.
[RULE][SVO-013] One insert MUST be ≤ 14 visible lines in prose.

---

### 2. Source enum (locked)

[RULE][SVO-020] source MUST be one of {OPTIMIZER, OBSERVABILITY, COMPLIANCE, POLICY_ENGINE, DISPATCH, ARBITRATION_GATE, SAFETY_MONITOR}.
[FORBIDDEN][SVO-021] source outside enum.

---

### 3. Event enum (locked)

[RULE][SVO-030] event MUST be one of {
  inefficiency_detected,
  allocation_adjusted,
  priority_downgraded,
  constraint_binding,
  kpi_profile_applied,
  override_required,
  mitigation_applied,
  gap_detected,
  telemetry_conflict,
  evidence_sealed,
  retention_window,
  tamper_suspected,
  policy_violation,
  access_denied,
  access_granted_windowed,
  chain_of_custody_required,
  admissibility_risk,
  counterfactual_test_requested,
  test_passed,
  test_failed,
  correlation_detected
}.
[FORBIDDEN][SVO-031] event outside enum.

---

### 4. Minimal schema (required fields)

[RULE][SVO-040] Any insert MUST include fields {source, event, ts, scope, classification, statement, refs}.
[RULE][SVO-041] ts MUST be ISO8601 with timezone offset.
[RULE][SVO-042] scope MUST be explicit perimeter token.
[RULE][SVO-043] refs MUST be object and MAY include {case_id, evidence_refs[], order_refs[]}.

---

### 5. Allowed metrics and units

[RULE][SVO-050] Allowed KPI metrics = {kpi_profile_id, human_cost_weight, service_class, allocation_delta, sla_target, risk_score}.
[RULE][SVO-051] Allowed resource metrics = {power_kw, power_mw, energy_mwh, compute_units, bandwidth_gbps}.
[RULE][SVO-052] Allowed impact metrics MUST use {forecast_loss_units, unit}.
[RULE][SVO-053] unit MUST be one of {biomass, subject, service_minutes, critical_events}.

[FORBIDDEN][SVO-054] Natural-language loss phrasing inside inserts.

---

### 6. Statement style constraints

[RULE][SVO-060] statement MUST be 1–2 short sentences.
[RULE][SVO-061] statement MUST NOT use softeners; uncertainty MUST be expressed only via confidence or open_questions[].
[FORBIDDEN][SVO-062] Personhood language in any field: pronouns, emotions, metaphors, sarcasm, moral judgement.

---

### 7. Evidence integration rules

[RULE][SVO-070] IF insert is used as evidence THEN refs.evidence_refs MUST be present AND insert MUST be registered as EL item with type ∈ {telemetry, log, policy_record}.
[RULE][SVO-071] IF insert contains causal assertion THEN it MUST be represented as CM claim with claim_id and evidence_refs OR it MUST be downgraded to correlation_detected.

---

## USAGE / RESOLUTION

[DECISION][SVO-USE-010] Any scene with insert MUST record {source, event, scope, active_metric_or_constraint, linkage_target ∈ {CD, EL, CM, FM, RP}}.
[DECISION][SVO-USE-011] Insert validity check MUST verify enums, required schema fields, statement constraints, and forbidden patterns.
[DECISION][SVO-USE-012] Enum or metric expansion MUST be done ONLY via separate override doc.
[DECISION][SVO-USE-013] Conflict resolution MUST follow SPEC-PRIORITY_RESOLUTION-2215-0001.

---

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-SYSTEM_VOICE-GLOBAL-2215-0001
role_type: RULE
export:
  - rule_id: SVO-020
    intent: "Lock allowed source enum for system voice inserts"
    inputs: []
    outputs: [allowed_sources]
  - rule_id: SVO-030
    intent: "Lock allowed event enum for system voice inserts"
    inputs: []
    outputs: [allowed_events]
  - rule_id: SVO-040
    intent: "Enforce minimal required schema for any insert"
    inputs: []
    outputs: [system_voice_schema]
  - rule_id: SVO-050
    intent: "Restrict allowed metrics and units inside inserts"
    inputs: [CANON-VOCAB-GLOBAL-2215-0001]
    outputs: [allowed_metrics]
  - rule_id: SVO-060
    intent: "Constrain language/tone to non-personified procedural style"
    inputs: []
    outputs: [forbidden_patterns]
~~~

---

## FORBIDDEN

[FORBIDDEN][SVO-FBD-010] Insert that is not a machine message (narration/opinion/explanation).
[FORBIDDEN][SVO-FBD-011] Dialogue framing (system talks to characters).
[FORBIDDEN][SVO-FBD-012] Emotional, metaphorical, sarcastic, or moral language in inserts.
[FORBIDDEN][SVO-FBD-013] Non-enum source or event values without explicit override doc.
[FORBIDDEN][SVO-FBD-014] Metric expansion without explicit override doc.
[FORBIDDEN][SVO-FBD-015] Using inserts to explain the world instead of evidence/constraints.

---

## NON-NORMATIVE

~~~json
{
  "source": "OPTIMIZER",
  "event": "priority_downgraded",
  "ts": "2215-05-18T19:12:00+03:00",
  "scope": "RU-16/CHELNY/Node-HOSP-3/Power-Loop",
  "classification": "restricted",
  "kpi_profile_id": "KPI-ALPHA-12",
  "service_class": { "from": "A", "to": "C" },
  "constraint_binding": "power_cap",
  "forecast_loss_units": 3,
  "unit": "biomass",
  "decision": "accepted",
  "confidence": "high",
  "statement": "Service class downgraded under binding constraints. Forecast loss recorded.",
  "refs": { "case_id": "FSSU-2215-RU-16-0007", "evidence_refs": ["E-002"], "order_refs": [] }
}
~~~
