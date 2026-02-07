---
id: CANON-METRICS-GLOBAL-2215-0002
title: >
  Метрики романа (2215) — правила использования чисел и upper-tail случаев
class: canon
status: draft
version: 2.2.0
inputs:
  - CANON-CORE-GLOBAL-2215-0001
  - SSOT-CONSISTENCY-A-2215-0009
depends_on:
  - SPEC-PRIORITY-RESOLUTION-2215-0001
scope: >
  RULE-канон использования числовых метрик в тексте: откуда берутся дефолты,
  как оформляются upper-tail случаи и какие процедурные последствия обязательны.
  Документ НЕ выбирает значения метрик и НЕ является точкой BIND.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: regulate narrative usage of numeric world metrics and enforce procedural reaction to upper-tail cases
INPUTS:
  - CANON-CORE-GLOBAL-2215-0001
  - SSOT-CONSISTENCY-A-2215-0009
  - SPEC-PRIORITY-RESOLUTION-2215-0001
OUTPUTS:
  - numeric_source_rules
  - upper_tail_rules
  - procedural_reaction_requirements
FORBIDDEN:
  - selected_value_definition
  - ssot_binding
  - invent_metrics
  - narrative_numbers_as_defaults

---

## DEFINITIONS

[FACT][MET-DEF-010] default_metric_value =
значение метрики, зафиксированное в CANON-CORE-GLOBAL-2215-0001.

[FACT][MET-DEF-011] narrative_number =
числовое утверждение о состоянии мира в сцене.

[FACT][MET-DEF-012] upper_tail_value =
значение метрики уровня p90 или иного верхнего хвоста.

[FACT][MET-DEF-013] upper_tail_case =
использование upper_tail_value через class: override
с обязательными процедурными последствиями.

[FACT][MET-DEF-014] narrative_lock =
флаг SSOT-CONSISTENCY, запрещающий upper-tail как фон
независимо от статуса DUAL_ALLOWED.

---

## INVARIANTS

[DECISION][MET-INV-001] Default metric values MUST be taken only from CANON-CORE-GLOBAL-2215-0001.

[DECISION][MET-INV-002] SSOT documents MUST NOT be used as direct sources
of background numeric defaults for scenes.

[DECISION][MET-INV-003] Any metric listed in
`CANON-CORE-GLOBAL-2215-0001.override_required_registry`
MUST NOT appear in narrative without an explicit `class: override` document.

[DECISION][MET-INV-004] Upper-tail values MUST NOT be used as neutral everyday background.

[DECISION][MET-INV-005] If SSOT metric has `narrative_lock = true`
THEN it MUST be treated as CANON for default usage,
even if SSOT status is DUAL_ALLOWED.

[DECISION][MET-INV-006] Any upper-tail usage under `narrative_lock = true`
MUST be handled as upper_tail_case with explicit override.

[FORBIDDEN][MET-INV-007] Introducing new global numeric metrics
not declared in SSOT or CANON-CORE-GLOBAL-2215-0001.

[FORBIDDEN][MET-INV-008] Implicit fallback to SSOT ranges
when CORE default is missing.

---

## CONTENT

### 1. Narrative number admissibility

[RULE][MET-010] IF narrative_number is present
THEN it MUST be tied to artifact OR log OR report
OR procedural action OR procedural consequence.

[RULE][MET-011] IF number is provided as author explanation
THEN it MUST NOT be included.

[RULE][MET-012] IF metric_value is mentioned
THEN source MUST be one of {class: override, CANON-CORE-GLOBAL-2215-0001}.

---

### 2. Upper-tail handling

[RULE][MET-020] IF value_category = upper_tail_value
THEN override_required = true.

[RULE][MET-021] IF metric has `narrative_lock = true`
AND value_category ≠ core
THEN override_required = true.

[RULE][MET-022] IF upper_tail_case = true
THEN localization MUST include
{place, time_window, regime, affected_system}.

[RULE][MET-023] IF upper_tail_case = true
THEN procedural_reaction MUST include ≥1 of
{order, audit, investigation, mode_restriction, jurisdiction_escalation}.

[RULE][MET-024] IF upper_tail_case = true
AND procedural_reaction is absent
THEN output MUST be treated as invalid.

---

### 3. Source precedence (numbers)

[RULE][MET-030] IF numeric_value_conflict = true
THEN resolution_order MUST follow SPEC-PRIORITY-RESOLUTION-2215-0001.

[RULE][MET-031] IF numeric_default_needed = true
THEN CANON-CORE-GLOBAL-2215-0001 MUST be the only default source.

[RULE][MET-032] IF SSOT is referenced for numbers
THEN it MAY be used only as admissible_range_context
AND MUST NOT set defaults.

---

## USAGE / RESOLUTION

[DECISION][MET-USE-010] Документ применяется ко всем сценам романа 2215
независимо от POV.

[DECISION][MET-USE-011] Любое нарушение правил этого документа
MUST трактоваться как ошибка генерации.

---

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-METRICS-GLOBAL-2215-0002
role_type: RULE
export:
  - rule_id: MET-INV-003
    intent: "Block usage of metrics requiring override without class: override doc"
    inputs: [override_required_registry, narrative_numbers]
    outputs: [override_violation]
  - rule_id: MET-INV-005
    intent: "Treat narrative_lock metrics as CANON defaults"
    inputs: [SSOT-CONSISTENCY]
    outputs: [default_usage_policy]
  - rule_id: MET-020
    intent: "Require override for any upper-tail value usage"
    inputs: [numeric_value, value_category]
    outputs: [override_required]
  - rule_id: MET-023
    intent: "Enforce procedural reaction for upper-tail cases"
    inputs: [upper_tail_case]
    outputs: [procedural_reaction_required]
~~~

---

## FORBIDDEN

[FORBIDDEN][MET-FBD-900] Selecting metric values (core/p90/range) in this document.
[FORBIDDEN][MET-FBD-901] Using SSOT as background default numeric source for scenes.
[FORBIDDEN][MET-FBD-902] Using upper-tail values without explicit override.
[FORBIDDEN][MET-FBD-903] Numeric infodumps outside procedural context.

---

## NON-NORMATIVE

(Empty by design)
