---
id: CANON-SCENE_RULESET-GLOBAL-2215-0001
title: >
  Scene Ruleset Canon — deterministic semantics for TYPE C scene inputs (2215)
class: canon
status: draft
version: 0.1.0
inputs: []
depends_on:
  - SPEC-PRIORITY_RESOLUTION-2215-0001
  - SPEC-SCENE_CONTRACT-2215-0001
scope: >
  Normative RULE-set for interpreting class: scene documents as TYPE C inputs only.
  Defines non-diegetic invariants, placeholder policy, consumption boundaries, and
  leakage forbiddance. Contains no world facts and no story content.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: enforce deterministic interpretation and consumption of TYPE C scene cards
INPUTS: [SPEC-PRIORITY_RESOLUTION-2215-0001, SPEC-SCENE_CONTRACT-2215-0001]
OUTPUTS: [scene_input_semantics, placeholder_policy, export_only_consumption, forbidden_patterns]
FORBIDDEN: [invention, gap_filling, treating_scene_as_state, meta_diegesis, consuming_outside_exports]

## DEFINITIONS

[DECISION][SC-RULE-001] TYPE C = documents with `class: scene` used only as prose-engine inputs.
[DECISION][SC-RULE-002] CARD record = a statement inside TYPE C that constrains generation but does not define world truth.
[DECISION][SC-RULE-003] Meta-diegesis = any reference in prose to corpus artifacts (doc ids, YAML keys, file paths, section headers).
[DECISION][SC-RULE-004] Export-only consumption = the prose engine may consume only what the scene doc OUTPUT CONTRACT exports.
[DECISION][SC-RULE-005] Placeholder = a field value that signals missing data; allowed placeholder tokens are defined in this doc.

## INVARIANTS

[RULE][SC-RULE-010] IF `class: scene` THEN document role is TYPE C input ONLY; it MUST NOT be treated as TYPE B state.
[RULE][SC-RULE-020] IF consuming a TYPE C document THEN ONLY exported fields (per its OUTPUT CONTRACT) are consumable inputs.
[RULE][SC-RULE-030] IF a TYPE C value is not declared in ENTITIES/STATE/PROCEDURES THEN it MUST remain UNKNOWN or be omitted; it MUST NOT be invented.
[RULE][SC-RULE-040] IF content is under `## NON-NORMATIVE` THEN it is ignored for prose generation and ignored for binding decisions.

## CONTENT

### C1. Scene record semantics

[RULE][SC-RULE-100] Markers `[FACT]` and `[STATE]` inside TYPE C are interpreted as CARD records, not as world truth.
[RULE][SC-RULE-110] TYPE C statements may constrain prose (sequence, POV, location tokens, measurable fields) but MUST NOT introduce new canon facts.
[FORBIDDEN][SC-RULE-115] A prose engine MUST NOT promote any TYPE C statement into SSOT/BASELINE/CANON truth.

### C2. Placeholders and missing data

[RULE][SC-RULE-120] Ellipsis placeholders (`...` or `…`) are invalid anywhere inside TYPE C exported content.
[RULE][SC-RULE-121] Allowed placeholder token for missing scalar values is `UNKNOWN` (uppercase).
[RULE][SC-RULE-122] IF a field is optional AND missing data would cause invention risk THEN remove the field rather than provide a placeholder.
[FORBIDDEN][SC-RULE-125] Any placeholder other than `UNKNOWN` inside TYPE C exported content.

### C3. Non-diegetic boundary and leakage prevention

[RULE][SC-RULE-200] Corpus artifacts (doc ids, YAML keys, file paths, section header names) do not exist in the story world and MUST NOT appear in prose.
[RULE][SC-RULE-210] Forbidden token class for prose includes any identifier matching:
`(SSOT|CANON|SPEC|IDX|REG|PLAN|OVERRIDE)-[A-Z0-9-]+`.
[RULE][SC-RULE-220] Forbidden token class for prose includes YAML keys and delimiters: `id:`, `class:`, `status:`, `version:`, `inputs:`, `depends_on:`, `---`.
[RULE][SC-RULE-230] Forbidden token class for prose includes corpus UI headers: `LLM-INTENT`, `OUTPUT CONTRACT`, `USAGE / RESOLUTION`, `NON-NORMATIVE`.
[RULE][SC-RULE-240] Forbidden token class for prose includes file/path fragments: `.md`, `docs/`, `~~~`.

## USAGE / RESOLUTION

[DECISION][SC-RULE-300] Global document-class resolution order MUST be taken ONLY from `SPEC-PRIORITY_RESOLUTION-2215-0001`.
[FORBIDDEN][SC-RULE-301] Introducing an alternative global precedence chain in any TYPE C document or in this ruleset.
[RULE][SC-RULE-310] Intra-document reading order notes inside a scene doc are non-authoritative and MUST NOT override global resolution.
[RULE][SC-RULE-320] This ruleset constrains interpretation of TYPE C inputs; it does not define any world-state values.

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-SCENE_RULESET-GLOBAL-2215-0001
role_type: RULE
export:
  - rule_id: SC-RULE-010
    intent: classify class: scene as TYPE C inputs only
    inputs: [scene_doc]
    outputs: [type_classification]
  - rule_id: SC-RULE-020
    intent: export-only consumption for TYPE C
    inputs: [scene_doc, scene_output_contract]
    outputs: [consumable_fields]
  - rule_id: SC-RULE-030
    intent: no invention; unknown-or-omit policy for missing declarations
    inputs: [type_c_value, entities_state_procedures]
    outputs: [unknown_or_omit]
  - rule_id: SC-RULE-120
    intent: forbid ellipsis placeholders in TYPE C exported content
    inputs: [scene_exported_content]
    outputs: [lint_violation]
  - rule_id: SC-RULE-200
    intent: forbid meta-diegesis leakage tokens in prose
    inputs: [prose_output]
    outputs: [lint_violation]
~~~

## FORBIDDEN

[FORBIDDEN][SC-RULE-900] Treating any TYPE C scene-card statement as a new SSOT/BASELINE/CANON fact.
[FORBIDDEN][SC-RULE-901] Consuming any part of a TYPE C document that is not exported by its OUTPUT CONTRACT.
[FORBIDDEN][SC-RULE-902] Filling gaps (entities, instruments, locations, procedures, numbers) not present in ENTITIES/STATE/PROCEDURES.
[FORBIDDEN][SC-RULE-903] Emitting doc ids, file paths, YAML tokens, or corpus section names in diegetic prose.
[FORBIDDEN][SC-RULE-904] Using `...` or `…` placeholders in TYPE C exported content.

## NON-NORMATIVE

(empty)
