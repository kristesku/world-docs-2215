---
id: SPEC-SCENE-CONTRACT-2215-0001
title: >
  Scene Contract — 2215 (Inputs, Constraints, Overrides, Evidence)
class: spec
status: draft
version: 1.0.0
inputs: []
depends_on:
  - SPEC-PRIORITY-RESOLUTION-2215-0001
  - CANON-2215-CORE-0001
  - CANON-BASE-0001
  - CANON-SYSTEMS-0001
  - CANON-ORDERS-0003
  - CANON-ARTIFACT-SNIPPETS-0001
  - BASELINE-SOCIAL-CIVIC-2215-0001
  - BASELINE-DAILY-OPS-2215-0002
scope: >
  Обязательный контракт сцены для романа 2215: какие документы считаются
  источниками дефолтов, что сцена может/не может вводить, когда требуется
  explicit override, и как сцена должна проявлять причинность через
  артефакты/процедуры/ограничения без лекционной подачи.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: define scene-level constraints, required inputs, override triggers, and evidence discipline
INPUTS: [any_scene_request]
OUTPUTS: [scene_inputs_required, override_required_flags, forbidden_patterns]
FORBIDDEN: [world_parameter_binding, ssot_direct_usage, lecture_exposition, implicit_overrides]

---

## DEFINITIONS

[FACT][SCN-DEF-010] Scene = локальный эпизод с ограниченным POV и частичной наблюдаемостью.
[FACT][SCN-DEF-011] Default background = набор значений/норм, получаемых из CANON-2215-CORE и baseline.
[FACT][SCN-DEF-012] Explicit override = `class: override` документ с justification, локализацией и cost.
[FACT][SCN-DEF-013] Evidence artifact = процедурный фрагмент (лог/ордер/chain-of-custody), пригодный для проверки.
[FACT][SCN-DEF-014] Level-MID = стандартный городской режим без спец-лицензий и без экстерриториальных исключений.

---

## INVARIANTS

[DECISION][SCN-INV-010] Scene MUST respect global resolution order from SPEC-PRIORITY-RESOLUTION-2215-0001.
[DECISION][SCN-INV-011] Scene MUST treat CANON-2215-CORE-0001 as the only default binder for world background values.
[DECISION][SCN-INV-012] Scene MUST apply baseline defaults unless explicitly overridden.
[DECISION][SCN-INV-013] Scene MUST show causality via: artifacts, procedures, measurable constraints, and consequences.
[FORBIDDEN][SCN-INV-014] Scene MUST NOT introduce new global metrics or new bindings.
[FORBIDDEN][SCN-INV-015] Scene MUST NOT use SSOT directly as a scene background source.

---

## CONTENT

### 1) Mandatory Inputs (What every scene must assume)

[RULE][SCN-IN-010] Every scene MUST assume background defaults from:
- CANON-2215-CORE-0001 (values/bindings),
- CANON-BASE-0001 (narrative & institutional constraints),
- BASELINE-SOCIAL-CIVIC-2215-0001 (civic/bio-ethical defaults for MID),
- BASELINE-DAILY-OPS-2215-0002 (ops/queues/access/logging defaults for MID).

[RULE][SCN-IN-011] If scene references OSA actions or admissibility, it MUST additionally assume:
- CANON-ORDERS-0003
- CANON-ARTIFACT-SNIPPETS-0001
- CANON-SYSTEMS-0001

---

### 2) Override Triggers (When explicit override is mandatory)

[RULE][SCN-OVR-010] IF scene uses any upper-tail (`p90`) value OR non-core regime THEN explicit override is REQUIRED.
[RULE][SCN-OVR-011] IF scene depicts public offline status as non-suspect OR allows telemetry jamming without consequences THEN explicit override is REQUIRED.
[RULE][SCN-OVR-012] IF scene violates baseline defaults (SOCIAL-CIVIC or DAILY-OPS) THEN explicit override is REQUIRED.
[RULE][SCN-OVR-013] IF scene introduces an exception to access/queues/logging that is not procedural THEN explicit override is REQUIRED.
[RULE][SCN-OVR-014] IF scene uses extraterritorial regime OR special license level (not MID) THEN explicit override is REQUIRED.

[RULE][SCN-OVR-015] Any explicit override MUST include:
- locality (where),
- time window (when),
- affected system/service (what),
- procedural basis (order/mandate/exception if applicable),
- cost (constraints, delays, audits, enforcement, reputational damage, etc.).

---

### 3) Evidence Discipline (How the scene proves things without exposition)

[RULE][SCN-EVD-010] If a scene asserts a system decision (deny/access/freeze/restrict), it MUST be grounded in:
- an artifact (log/notice/order snippet), OR
- an observable procedure (scan, token rejection, queue downgrade, sealed export).

[RULE][SCN-EVD-011] If a scene asserts escalation to OSA or regulatory action, it MUST bind:
- case_id (or equivalent),
- scope (zone/node/mode),
- procedural basis (order/mandate/emergency_exception),
- minimal chain-of-custody if evidence is produced.

[RULE][SCN-EVD-012] Scene MAY embed short artifact snippets, but MUST keep them partial (snippet), not full documents.

---

### 4) Prohibited Patterns (Hard bans)

[FORBIDDEN][SCN-FBD-010] Lecture paragraphs explaining macro-causality or world design.
[FORBIDDEN][SCN-FBD-011] “Because the system decided…” without an artifact/procedure.
[FORBIDDEN][SCN-FBD-012] Omniscient telemetry / perfect observability as default.
[FORBIDDEN][SCN-FBD-013] New global numbers not sourced through CORE/override.
[FORBIDDEN][SCN-FBD-014] Implicit override: exceptions presented as normal without explicit override reference.

---

## USAGE / RESOLUTION

[DECISION][SCN-USE-010] This spec MUST be applied to any scene generation request.
[DECISION][SCN-USE-011] Any violation MUST be treated as invalid output, not as a creative choice.
[DECISION][SCN-USE-012] Conflict resolution follows SPEC-PRIORITY-RESOLUTION-2215-0001.

---

## OUTPUT CONTRACT

~~~yaml
doc_id: SPEC-SCENE-CONTRACT-2215-0001
role_type: RULE
export:
  - rule_id: SCN-IN-010
    intent: enforce mandatory background inputs
    inputs: [any_scene_request]
    outputs: [scene_inputs_required]
  - rule_id: SCN-OVR-012
    intent: require explicit override when baseline is violated
    inputs: [scene_features]
    outputs: [override_required_flag]
  - rule_id: SCN-EVD-010
    intent: require artifacts/procedures for system decisions
    inputs: [scene_assertions]
    outputs: [evidence_required_flag]
  - rule_id: SCN-FBD-010
    intent: forbid lecture exposition
    inputs: [scene_text]
    outputs: [violation_flag]
~~~

---

## FORBIDDEN

- [FORBIDDEN][SCN-900] Selecting SSOT values or binding ranges in scene text.
- [FORBIDDEN][SCN-901] Treating baseline defaults as optional without override.
- [FORBIDDEN][SCN-902] Presenting systemic decisions without artifacts/procedures.

---

## NON-NORMATIVE

~~~markdown
This contract is meant to keep scenes “auditable”: the world is revealed through
constraints and records, not explanation. If something unusual happens, the scene
must pay for it procedurally (override + cost), or it does not happen.
~~~
