---
id: SPEC-METHODOLOGY-2215-0001
title: >
  Corpus Methodology — Minimal Set for Prose Generation (2215)
class: spec
status: draft
prefix: METH
doc_language: en-US
prose_language: ru-RU
inputs: []
depends_on:
  - IDX-CORPUS-0001
  - SPEC-DOC_ID-2215-0001
  - SPEC-DOC_STYLE-2215-0001
  - SPEC-PRIORITY_RESOLUTION-2215-0001
references: []
scope: >
  Норматив методологии корпуса 2215. Определяет допустимые типы документов,
  их роли, границы ответственности и правила потребления LLM.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: define corpus artifact classes and deterministic consumption rules
INPUTS: [IDX-CORPUS-0001, SPEC-DOC_ID-2215-0001, SPEC-DOC_STYLE-2215-0001, SPEC-PRIORITY_RESOLUTION-2215-0001]
OUTPUTS: [artifact_classes, applicability_rules, consumption_contract]
FORBIDDEN: [override_mechanism, alternative_precedence_orders, consuming_non_export_content]

## DEFINITIONS

[FACT][METH-010] `corpus` = множество документов, перечисленных в IDX-CORPUS-0001.
[FACT][METH-020] `doc_class` = значение YAML `class:` документа.
[FACT][METH-030] `active_classes` = {ssot, baseline, canon, plan, scene, idx, protocol, spec, registry}.
[FACT][METH-040] `knowledge_classes` = {ssot, baseline, canon, plan, scene}.
[FACT][METH-050] `constraint_bearing_classes` = {ssot, baseline, canon}.
[FACT][METH-060] `export_surface` = OUTPUT CONTRACT.export.

## INVARIANTS

[DECISION][METH-100] Only `active_classes` are permitted in the corpus.
[DECISION][METH-110] Any document without OUTPUT CONTRACT is NON-COMPLIANT.
[DECISION][METH-120] LLM MUST consume documents ONLY via `export_surface`.
[DECISION][METH-130] `idx` is the sole membership authority for the corpus.
[DECISION][METH-140] Override mechanism is NOT supported in any form.
[DECISION][METH-150] LLM MUST NOT invent values; allowed outcomes are omission or UNKNOWN.

## CONTENT

### Document class semantics

[DECISION][METH-200] `ssot` defines declarative metric ranges and invariants.
[DECISION][METH-210] `baseline` defines default operational values and policies and MAY be constrained by canon.
[DECISION][METH-220] `canon` defines admissibility, legality, and hard world constraints.
[DECISION][METH-230] `plan` defines narrative directives and required beats and MUST NOT define numeric values.
[DECISION][METH-240] `scene` records runtime facts and violations as events and MUST NOT create admissibility.
[DECISION][METH-250] `protocol` defines interface contracts only.
[DECISION][METH-260] `spec` defines corpus rules and consumption semantics.
[DECISION][METH-270] `registry` defines lookup sets and enumerations and introduces no rules.

### Applicability

[DECISION][METH-300] Scene context MUST be compiled using applicability order from SPEC-PRIORITY_RESOLUTION-2215-0001.
[FORBIDDEN][METH-310] Scene or Plan MUST NOT weaken constraints from Canon, Baseline, or SSOT.
[FORBIDDEN][METH-320] Direct use of SSOT as scene defaults.

### Document consumption

[DECISION][METH-400] Documents with status `fixed` take precedence over `draft`.
[DECISION][METH-410] IF operator_draft_allowed=false THEN draft documents MUST be ignored.
[DECISION][METH-420] IF operator_draft_allowed=true THEN draft documents MUST satisfy full COMPLIANCE to be consumed.
[DECISION][METH-430] Deprecated documents MUST NOT be consumed.

### Stop policy

[DECISION][METH-500] Corpus is closed-world.
[DECISION][METH-510] On contradiction or insufficient data, LLM MUST stop and request source correction.

## USAGE / RESOLUTION

[DECISION][METH-600] In conflicts, SPEC-DOC-ID and SPEC-DOC-STYLE take precedence over this document.

## OUTPUT CONTRACT

~~~yaml
doc_id: SPEC-METHODOLOGY-2215-0001
role_type: RULE
export:
  - rule_id: METH-200
    intent: define ssot semantics as declarative metric ranges
    inputs: []
    outputs: [ssot_class_semantics]
  - rule_id: METH-210
    intent: define baseline semantics as default operational values
    inputs: []
    outputs: [baseline_class_semantics]
  - rule_id: METH-220
    intent: define canon semantics as admissibility constraints
    inputs: []
    outputs: [canon_class_semantics]
  - rule_id: METH-230
    intent: define plan semantics as narrative directives
    inputs: []
    outputs: [plan_class_semantics]
  - rule_id: METH-240
    intent: define scene semantics as runtime event records
    inputs: []
    outputs: [scene_class_semantics]
  - rule_id: METH-300
    intent: define applicability order dependency on SPEC-PRIORITY-RESOLUTION
    inputs: [SPEC-PRIORITY_RESOLUTION-2215-0001]
    outputs: [applicability_rule]
  - rule_id: METH-120
    intent: enforce export-only consumption
    inputs: []
    outputs: [consumption_contract]
  - rule_id: METH-140
    intent: forbid override mechanism
    inputs: []
    outputs: [override_prohibition]
~~~

## FORBIDDEN

[FORBIDDEN][METH-900] Introducing new doc_class outside `active_classes`.
[FORBIDDEN][METH-910] Any form of override or precedence bypass.
[FORBIDDEN][METH-920] Using protocol as world knowledge.

## NON-NORMATIVE

(Empty by design)
