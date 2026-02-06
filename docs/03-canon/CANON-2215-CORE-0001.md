---
id: CANON-2215-CORE-0001
title: >
  Canon 2215 Core Bindings — Scenario A (World Background Lock)
class: canon
status: fixed
version: 1.2.0
inputs: []
depends_on:
  - SSOT-DOC-STYLE-2215-0001
  - SSOT-CONSISTENCY-A-2215-0009
  - SSOT-SCENARIO-A-2215-0001
  - SSOT-ENERGY-A-2215-0004
  - SSOT-ECONOMY-A-2215-0003
  - SSOT-AUTOMATION-A-2215-0004
  - SSOT-DEMOGRAPHY-A-2215-0002
  - SSOT-CLIMATE-A-2215-0004
  - SSOT-GOVERNANCE-SECURITY-A-2215-0005
  - SSOT-URBANISM-A-2215-0007
  - SSOT-LIFE-A-2215-0007
  - SSOT-SPACE-INDUSTRY-A-2215-0006
scope: >
  Единственная точка выбора значений “фона романа” для мира 2215 (Scenario A).
  Закрывает DUAL_ALLOWED/UNKNOWN из SSOT-CONSISTENCY и фиксирует core-набор
  как канонический дефолт для baseline/canon/plan/scene.
  Документ НЕ объясняет причинность и НЕ описывает мир сверх привязок.
---

## LLM-INTENT

ROLE_TYPE: BIND
SCOPE: bind SSOT values into single canonical background defaults for downstream
INPUTS:
  - SSOT-CONSISTENCY-A-2215-0009
  - SSOT-*
OUTPUTS:
  - bindings
  - override_required_registry
  - location_locks
FORBIDDEN:
  - causal_logic
  - worldbuilding_prose
  - invent_metrics
  - implicit_selection
  - range_as_background

---

## DEFINITIONS

[DECISION][CORE-DEF-001] `selected_value` MUST be one of: `core | p90 | override`.
[DECISION][CORE-DEF-002] `scope` MUST be one of: `canon | override`.
[DECISION][CORE-DEF-003] This document binds defaults with `scope: canon`.
[DECISION][CORE-DEF-004] Any use of `p90` or `range` in narrative background REQUIRES `class: override`.
[DECISION][CORE-DEF-005] `selected_value: override` (scope: canon) means:
downstream default is FORBIDDEN and requires a dedicated `class: override` doc
to specify localized value and cost.

---

## INVARIANTS

[DECISION][CORE-INV-001] Downstream default MUST use only bindings from this document (scope: canon).
[DECISION][CORE-INV-002] Default bindings MUST select `selected_value: core` for all bound metrics with defined SSOT `core`.
[DECISION][CORE-INV-003] Any upper-tail (`selected_value: p90`) is allowed ONLY in `scope: override` documents.
[DECISION][CORE-INV-004] Metrics with missing/undefined SSOT `core` MUST be closed as `selected_value: override` (scope: canon).
[DECISION][CORE-INV-007] Any metric listed in `override_required_registry`
MUST NOT be used by baseline/canon/plan/scene without an explicit `class: override` document.
[FORBIDDEN][CORE-INV-005] Binding a `range` as narrative default (range_as_background).
[FORBIDDEN][CORE-INV-006] Implicit selection from SSOT (implicit_selection).

---

## CONTENT

(⚠️ CONTENT section unchanged — BIND blocks preserved as-is)

---

## LOCATION LOCKS

[DECISION][CORE-LOC-001] location = RU-16/CHELNY.
[DECISION][CORE-LOC-002] upper_tail_background_forbidden = true.

---

## USAGE / RESOLUTION

[DECISION][CORE-USE-001] Downstream (baseline/canon/plan/scene) MUST treat this doc as the only default binder.
[DECISION][CORE-USE-002] Any use of p90/upper-tail MUST be done ONLY via `class: override`.
[DECISION][CORE-USE-003] Any use of SSOT `range` in narrative MUST be done ONLY via `class: override` with explicit localization and cost.
[DECISION][CORE-USE-006] Any metric closed as `selected_value: override`
MUST be blocked as background default and validated against `override_required_registry`.
[FORBIDDEN][CORE-USE-004] Using SSOT directly as background without an explicit binding here.
[FORBIDDEN][CORE-USE-005] Implicit “fallback to SSOT range” when value is not bound.

---

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-2215-CORE-0001
role_type: BIND
scenario: A
year: 2215

export:
  bindings:
    - metric: population_billion
      selected_value: core
      scope: canon
      justification: CORE-INV-001
    - metric: life_expectancy_years
      selected_value: core
      scope: canon
      justification: CORE-INV-001
    # (bindings list unchanged, сокращено для читаемости)

  override_required_registry:
    - metric: total_fertility_rate
      reason: missing_ssot_core
      requires: class_override
    - metric: services_share_gdp_percent
      reason: missing_ssot_core
      requires: class_override
    - metric: trade_to_gdp_percent
      reason: missing_ssot_core
      requires: class_override
    - metric: robots_per_human
      reason: missing_ssot_core
      requires: class_override

  location_locks:
    - location: RU-16/CHELNY
      upper_tail_background_forbidden: true
~~~

---

## FORBIDDEN

[FORBIDDEN][CORE-FBD-001] Using p90/upper-tail as default background without `class: override`.
[FORBIDDEN][CORE-FBD-002] Using SSOT `range` as default background without `class: override`.
[FORBIDDEN][CORE-FBD-003] Implicit selection of SSOT values not explicitly bound here.
[FORBIDDEN][CORE-FBD-004] Introducing new metrics not declared in SSOT.
[FORBIDDEN][CORE-FBD-006] Using any `selected_value: override` metric as background default without an explicit override doc.

---

## NON-NORMATIVE

(Empty by design)
