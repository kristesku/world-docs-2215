---
id: SPEC-OVERRIDE-CHECKLIST-2215-0001
title: >
  Override Checklist & Validation Rules — 2215
class: spec
status: draft
version: 1.0.0
inputs: []
depends_on:
  - SPEC-PRIORITY-RESOLUTION-2215-0001
  - CANON-CORE-GLOBAL-2215-0001
scope: >
  Норматив структуры и валидации документов `class: override` корпуса 2215.
  Запрещает implicit override и неоформленные исключения baseline/canon.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: mandatory schema + decidable validation rules for override documents
INPUTS: [override_document]
OUTPUTS: [override_validity, violation_flags]
FORBIDDEN: [implicit_override, narrative_justification, heuristic_validation]

## DEFINITIONS

[DEF][OVR-DEF-010] override_doc = document with `class: override`.

[DEF][OVR-DEF-011] anchor = explicit override target (metric|rule|block) with ID.

[DEF][OVR-DEF-012] cost = observable negative consequence (delay|audit|resource|legal|reputation).

## INVARIANTS

[DECISION][OVR-INV-001] Override MUST be explicit and scope-limited.

[DECISION][OVR-INV-002] Override MUST NOT become a default background.

[DECISION][OVR-INV-003] Override MUST NOT weaken upper-level FORBIDDEN or INVARIANTS.

[DECISION][OVR-INV-004] Override MUST declare cost; otherwise invalid.

## CONTENT

[RULE][OVR-REQ-010] IF doc.class = override THEN doc MUST contain `override_target`.

[RULE][OVR-REQ-011] IF doc.class = override THEN `override_target.target_doc` MUST be set.

[RULE][OVR-REQ-012] IF doc.class = override THEN `override_target.anchor_id` MUST be set.

[RULE][OVR-REQ-020] IF doc.class = override THEN doc MUST contain `scope`.

[RULE][OVR-REQ-021] IF doc.class = override THEN `scope.applies_to` MUST include location and system.

[RULE][OVR-REQ-022] IF doc.class = override THEN `scope.time_window` MUST be finite.

[FORBIDDEN][OVR-REQ-023] Global or timeless override scopes.

[RULE][OVR-REQ-030] IF doc.class = override THEN doc MUST contain `justification`.

[RULE][OVR-REQ-031] IF doc.class = override THEN `justification.rule_reference` MUST be a corpus rule/decision ID.

[FORBIDDEN][OVR-REQ-032] Justification by narrative needs without normative reference.

[RULE][OVR-REQ-040] IF doc.class = override THEN doc MUST contain `override_payload`.

[RULE][OVR-REQ-041] IF `override_payload.metric` is set THEN `override_payload.value` MUST be explicit (not implicit range).

[RULE][OVR-REQ-042] IF `override_payload.value_category` = p90 OR range THEN doc MUST declare explicit localization and cost.

[RULE][OVR-REQ-050] IF doc.class = override THEN doc MUST contain `cost`.

[RULE][OVR-REQ-051] IF doc.class = override THEN `cost[]` MUST be non-empty.

[RULE][OVR-REQ-052] IF `cost[].type` is set THEN it MUST be one of: procedural_delay|audit|resource|legal|reputation.

[RULE][OVR-REQ-060] IF doc.class = override THEN doc MUST contain `downstream_effects`.

[RULE][OVR-REQ-061] IF doc.class = override THEN `downstream_effects.forbidden_as_default` MUST be true.

[RULE][OVR-VAL-010] IF any OVR-REQ-* rule fails THEN override_validity = invalid.

[RULE][OVR-VAL-011] IF scope.time_window is missing THEN override_validity = invalid.

[RULE][OVR-VAL-012] IF cost is missing OR empty THEN override_validity = invalid.

[RULE][OVR-VAL-013] IF override_target is missing THEN override_validity = invalid.

## USAGE / RESOLUTION

[DECISION][OVR-USE-010] This SPEC applies to every document with `class: override`.

[DECISION][OVR-USE-011] Override conflicts are resolved only by SPEC-PRIORITY-RESOLUTION-2215-0001.

[DECISION][OVR-USE-012] Invalid override documents MUST be treated as forbidden inputs downstream.

## OUTPUT CONTRACT

~~~yaml
doc_id: SPEC-OVERRIDE-CHECKLIST-2215-0001
role_type: RULE
export:
  - rule_id: OVR-REQ-010
    intent: "Override documents require override_target"
    inputs: [override_document]
    outputs: [override_validity]
  - rule_id: OVR-REQ-020
    intent: "Override documents require finite scope"
    inputs: [override_document]
    outputs: [override_validity]
  - rule_id: OVR-REQ-050
    intent: "Override documents require explicit cost"
    inputs: [override_document]
    outputs: [override_validity]
  - rule_id: OVR-VAL-010
    intent: "Any missing required section invalidates override"
    inputs: [override_document]
    outputs: [override_validity]
~~~

## FORBIDDEN

[FORBIDDEN][OVR-FBD-010] Implicit override.

[FORBIDDEN][OVR-FBD-011] Override without cost.

[FORBIDDEN][OVR-FBD-012] Override used as default background.

[FORBIDDEN][OVR-FBD-013] Narrative justification replacing normative rule reference.

## NON-NORMATIVE

~~~yaml
# Example minimal override payload (illustrative only)
override_target:
  target_doc: CANON-CORE-GLOBAL-2215-0001
  anchor_id: CORE-BIND-DEM-004
scope:
  applies_to:
    - location: RU-16/CHELNY
    - system: urban_health_registry
  time_window:
    from: 2215-06
    to: 2215-09
justification:
  rule_reference: CORE-INV-004
  rationale: "Metric closed as selected_value: override; localized closure required"
override_payload:
  metric: total_fertility_rate
  value: 1.2
  unit: children_per_woman
  value_category: override
cost:
  - type: audit
    description: "Manual audit trail required"
downstream_effects:
  affects: [scene, plan]
  forbidden_as_default: true
~~~
