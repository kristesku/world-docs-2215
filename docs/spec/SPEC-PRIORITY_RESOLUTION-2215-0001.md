---
id: SPEC-PRIORITY_RESOLUTION-2215-0001
title: >
  Resolution Order & Precedence Rules — 2215
class: spec
status: fixed
prefix: RES
doc_language: en-US
inputs: []
depends_on: []
references: []
scope: >
  Канонический порядок применимости документов корпуса 2215 и правила
  непробиваемости ограничений между уровнями.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: define global document-class applicability order and non-penetration rules
INPUTS: []
OUTPUTS: [resolution_order, non_penetration_rules]
FORBIDDEN: [implicit_precedence, heuristic_resolution, narrative_reasoning, override_mechanism]

## DEFINITIONS

[FACT][RES-010] `resolution_order` = линейный порядок применимости классов документов при компиляции контекста.
[FACT][RES-020] `higher_layer` = документ, стоящий выше в `resolution_order`.
[FACT][RES-030] `lower_layer` = документ, стоящий ниже в `resolution_order`.

## INVARIANTS

[DECISION][RES-100] Applicability order MUST be globally unique for the corpus.
[DECISION][RES-110] No document may introduce an alternative applicability order.

## CONTENT

### Resolution order

[DECISION][RES-200] Global document-class applicability order MUST be:
[DECISION][RES-201] Order = Scene → Plan → Canon → Baseline → SSOT.

[DECISION][RES-210] Applicability order defines read/merge precedence only.
[DECISION][RES-211] Applicability order MUST NOT be interpreted as semantic authority order.

### Non-penetration (constraints)

[DECISION][RES-300] Constraint-bearing layers are: Canon, Baseline, SSOT.
[DECISION][RES-310] Scene and Plan are NOT constraint-bearing layers.

[FORBIDDEN][RES-320] Any lower_layer constraint-bearing document MUST NOT weaken or override constraints from a higher_layer constraint-bearing document.
[FORBIDDEN][RES-330] Scene or Plan MUST NOT introduce admissibility, legality, or world-constraint expansions.

[DECISION][RES-340] Violations of constraints are representable ONLY as Scene facts with consequences and MUST NOT modify admissibility.

## USAGE / RESOLUTION

[DECISION][RES-400] In any conflict, this SPEC is the sole source of document-class applicability order.
[DECISION][RES-410] Consumers MUST apply this order before evaluating ROLE_TYPE semantics.

## OUTPUT CONTRACT

~~~yaml
doc_id: SPEC-PRIORITY_RESOLUTION-2215-0001
role_type: RULE
export:
  - rule_id: RES-200
    intent: define global document-class applicability order
    inputs: []
    outputs: [resolution_order]
  - rule_id: RES-300
    intent: define constraint-bearing layer membership
    inputs: []
    outputs: [constraint_bearing_layers]
  - rule_id: RES-320
    intent: forbid lower_layer weakening of higher_layer constraints
    inputs: []
    outputs: [non_penetration_rule]
  - rule_id: RES-330
    intent: forbid Scene/Plan from introducing admissibility expansions
    inputs: []
    outputs: [scene_plan_limitation]
config:
  resolution_order:
    - Scene
    - Plan
    - Canon
    - Baseline
    - SSOT
  constraint_bearing_layers:
    - Canon
    - Baseline
    - SSOT
~~~

## FORBIDDEN

[FORBIDDEN][RES-900] Introducing Override or any equivalent precedence-bypass mechanism.
[FORBIDDEN][RES-910] Inferring precedence from document class outside this SPEC.
[FORBIDDEN][RES-920] Narrative or heuristic conflict resolution.

## NON-NORMATIVE

(Empty by design)
