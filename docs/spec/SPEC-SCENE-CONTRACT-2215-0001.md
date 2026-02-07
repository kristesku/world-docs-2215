---
id: SPEC-SCENE-CONTRACT-2215-0001
title: >
  Scene Contract — 2215 (Inputs, Constraints, Overrides, Evidence)
class: spec
status: draft
version: 1.0.1
prefix: SCN
doc_language: ru-RU
prose_language: ru-RU
inputs: []
depends_on:
  - BASELINE-DAILYOPS-2215-0002
  - BASELINE-SOCIAL-CIVIC-2215-0001
  - CANON-CORE-GLOBAL-2215-0001
  - CANON-ARTIFACT-SNIPPETS-GLOBAL-2215-0001
  - CANON-ORDERS-GLOBAL-2215-0003
  - CANON-SYSTEMS-GLOBAL-2215-0001
  - SPEC-DOC-STYLE-2215-0001
  - SPEC-PRIORITY-RESOLUTION-2215-0001
scope: >
  Обязательный контракт сцены для романа 2215: какие источники считаются
  дефолтами, что сцена может/не может вводить, когда требуется explicit override,
  и как сцена должна проявлять причинность через артефакты/процедуры/ограничения
  без лекционной подачи. Контракт валидирует легальность и доказательность сцены.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: define scene-level constraints, required inputs, override triggers, and evidence discipline
INPUTS: [any_scene_request]
OUTPUTS: [scene_inputs_required, override_required_flags, forbidden_patterns]
FORBIDDEN: [world_parameter_binding, ssot_direct_usage, lecture_exposition, implicit_overrides]

## DEFINITIONS

[FACT][SCN-010] `scene` = локальный эпизод с ограниченным POV и частичной наблюдаемостью.
[FACT][SCN-011] `default_background` = набор значений/норм, получаемых из `CANON-CORE-GLOBAL-2215-0001` и baseline-документов.
[FACT][SCN-012] `explicit_override` = документ `class: override` с justification, локализацией и cost.
[FACT][SCN-013] `evidence_artifact` = процедурный фрагмент (лог/ордер/chain-of-custody), пригодный для проверки утверждений сцены.
[FACT][SCN-014] `level_mid` = стандартный городской режим без спец-лицензий и без экстерриториальных исключений.

## INVARIANTS

[DECISION][SCN-020] Scene MUST respect global resolution order from `SPEC-PRIORITY-RESOLUTION-2215-0001`; ELSE FAIL.
[DECISION][SCN-021] Scene MUST treat `CANON-CORE-GLOBAL-2215-0001` as the only default binder for world background values; ELSE FAIL.
[DECISION][SCN-022] Scene MUST apply baseline defaults unless explicitly overridden; ELSE FAIL.
[DECISION][SCN-023] Scene MUST show causality via: artifacts, procedures, measurable constraints, and consequences; ELSE FAIL.
[FORBIDDEN][SCN-024] Scene MUST NOT introduce new global metrics or new bindings.
[FORBIDDEN][SCN-025] Scene MUST NOT use SSOT directly as a scene background source.

## CONTENT

### 1) Mandatory Inputs (what every scene must assume)

[RULE][SCN-030] Every scene MUST assume background defaults from `scene_default_sources`; ELSE FAIL.
[RULE][SCN-031] IF scene references OSA actions OR admissibility THEN scene MUST additionally assume `scene_osa_required_sources`; ELSE FAIL.

~~~yaml
scene_default_sources:
  - CANON-CORE-GLOBAL-2215-0001
  - CANON-BASE-RULE-GLOBAL-2215-0001
  - BASELINE-SOCIAL-CIVIC-2215-0001
  - BASELINE-DAILYOPS-2215-0002

scene_osa_required_sources:
  - CANON-ORDERS-GLOBAL-2215-0003
  - CANON-ARTIFACT-SNIPPETS-GLOBAL-2215-0001
  - CANON-SYSTEMS-GLOBAL-2215-0001
~~~

### 2) Override Triggers (when explicit override is mandatory)

[RULE][SCN-040] IF scene uses any upper_tail_value (p90) OR non_core_regime THEN explicit_override_required MUST be true; ELSE PASS.
[RULE][SCN-041] IF scene depicts public_offline_status as non_suspect OR allows telemetry_jamming without consequences THEN explicit_override_required MUST be true; ELSE PASS.
[RULE][SCN-042] IF scene violates baseline defaults (SOCIAL-CIVIC OR DAILY-OPS) THEN explicit_override_required MUST be true; ELSE PASS.
[RULE][SCN-043] IF scene introduces an exception to access/queues/logging that is not procedural THEN explicit_override_required MUST be true; ELSE PASS.
[RULE][SCN-044] IF scene uses extraterritorial_regime OR special_license_level != MID THEN explicit_override_required MUST be true; ELSE PASS.
[RULE][SCN-045] IF explicit_override_required == true THEN any explicit_override MUST include `override_required_fields`; ELSE FAIL.

~~~yaml
override_required_fields:
  - locality
  - time_window
  - affected_system_or_service
  - procedural_basis
  - cost
~~~

### 3) Evidence Discipline (how the scene proves things without exposition)

[RULE][SCN-050] IF scene asserts a system decision (deny/access/freeze/restrict) THEN it MUST be grounded in artifact OR observable_procedure; ELSE FAIL.
[RULE][SCN-051] IF scene asserts escalation to OSA OR regulatory action THEN it MUST bind `osa_binding_min_fields`; ELSE FAIL.
[RULE][SCN-052] Scene MAY embed short artifact snippets, but MUST keep them partial (snippet), not full documents; ELSE FAIL.

~~~yaml
osa_binding_min_fields:
  - case_id_or_equivalent
  - scope
  - procedural_basis
  - minimal_chain_of_custody_if_evidence
~~~

### 4) Prohibited Patterns (hard bans)

[FORBIDDEN][SCN-060] Lecture paragraphs explaining macro-causality or world design.
[FORBIDDEN][SCN-061] “Because the system decided…” without an artifact/procedure.
[FORBIDDEN][SCN-062] Omniscient telemetry / perfect observability as default.
[FORBIDDEN][SCN-063] New global numbers not sourced through CORE/explicit_override.
[FORBIDDEN][SCN-064] Implicit override: exceptions presented as normal without explicit override reference.

## USAGE / RESOLUTION

[DECISION][SCN-070] This spec MUST be applied to any scene generation request; ELSE FAIL.
[DECISION][SCN-071] Any violation MUST be treated as invalid output, not as a creative choice; ELSE FAIL.
[DECISION][SCN-072] Conflict resolution follows `SPEC-PRIORITY-RESOLUTION-2215-0001`; ELSE FAIL.

## OUTPUT CONTRACT

~~~yaml
doc_id: SPEC-SCENE-CONTRACT-2215-0001
role_type: RULE
export:
  - rule_id: SCN-030
    intent: enforce mandatory background inputs
    inputs: [any_scene_request]
    outputs: [scene_inputs_required, scene_default_sources]
  - rule_id: SCN-040
    intent: require explicit override when upper-tail or non-core regime is used
    inputs: [scene_features]
    outputs: [override_required_flag]
  - rule_id: SCN-042
    intent: require explicit override when baseline defaults are violated
    inputs: [scene_features]
    outputs: [override_required_flag]
  - rule_id: SCN-050
    intent: require artifacts/procedures for system decisions
    inputs: [scene_assertions]
    outputs: [evidence_required_flag]
  - rule_id: SCN-060
    intent: forbid lecture exposition
    inputs: [scene_text]
    outputs: [violation_flag]
~~~

## FORBIDDEN

[FORBIDDEN][SCN-900] Selecting SSOT values or binding ranges in scene text (SSOT direct usage is forbidden).
[FORBIDDEN][SCN-901] Treating baseline defaults as optional without explicit override.
[FORBIDDEN][SCN-902] Presenting systemic decisions without artifacts/procedures.

## NON-NORMATIVE

~~~text
Contract goal: keep scenes auditable.
World is revealed through constraints and records, not explanation.
If something unusual happens, the scene must pay procedurally (override + cost), or it does not happen.
~~~
