---
id: CANON-BASE-RULE-GLOBAL-2215-0001
title: >
  Canon Base — Executable Canon Ruleset (2215)
class: canon
status: fixed
version: 1.0.0
inputs: []
depends_on:
  - CANON-CORE-GLOBAL-2215-0001
  - SSOT-CONSISTENCY-A-2215-0009
  - SPEC-DOC-STYLE-2215-0001
scope: >
  Исполняемый канонический ruleset. Нормативные ограничения интерпретации,
  причинности и допустимых конфликтов. Не содержит описательного канона.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: canon-wide narrative and institutional constraints
INPUTS: [CANON-CORE-GLOBAL-2215-0001, SSOT-CONSISTENCY-A-2215-0009]
OUTPUTS: [rule_id, applicability, forbidden_patterns]
FORBIDDEN: [world_parameter_binding, p90_selection, baseline_definition, implicit_override]

---

## DEFINITIONS

[DECISION][BASE-R-001] `explicit_override` = документ с `class: override`,
явно задающий локальное отклонение и его стоимость.

[DECISION][BASE-R-002] `background_default` = любое состояние мира,
используемое без `explicit_override`.

---

## INVARIANTS

[DECISION][BASE-R-010] Все `background_default` в романе MUST быть SSOT-consistent.
[DECISION][BASE-R-011] CANON-CORE-GLOBAL-2215-0001 MUST быть единственным источником
`background_default` параметров мира.
[DECISION][BASE-R-012] SSOT MUST использоваться ONLY как диапазоны и структуры.
[FORBIDDEN][BASE-R-013] Использование p90 / upper-tail как `background_default`
без `explicit_override`.

---

## CONTENT

[RULE][BASE-R-020] All system-level claims MUST be tagged as:
FACT | ASSUMPTION | PROJECTION | UNKNOWN.

[RULE][BASE-R-021] Any causal explanation MUST be decomposed into
CAUSE → MECHANISM → CONSEQUENCE.

[FORBIDDEN][BASE-R-022] Lecture-style causal exposition inside scenes.

[RULE][BASE-R-030] Scene causality MUST be shown via artifacts, procedures,
measurable constraints, or access regimes.

[FORBIDDEN][BASE-R-031] Direct use of SSOT as a scene-generation source.

[RULE][BASE-R-040] Interpretation priority MUST follow:
override → scene → plan → canon → baseline → ssot.

[FORBIDDEN][BASE-R-041] Implicit override derived from scene depiction.

[RULE][BASE-R-050] Flashback usage MUST NOT alter global baseline defaults.

[RULE][BASE-R-060] Everyday reality MUST be interpreted as comfortable and stable
unless overridden.

[RULE][BASE-R-061] Deficit MUST be interpreted ONLY as
allocation_under_constraints.

[FORBIDDEN][BASE-R-062] Framing conflict as struggle for basic survival
as default interpretation.

[RULE][BASE-R-070] Supranational influence MUST operate ONLY via
standards | audits | reputation | market_pressure.

[RULE][BASE-R-080] Corporate influence MUST operate ONLY via
law | arbitration | contracts | access_regimes | compliance.

[FORBIDDEN][BASE-R-081] Direct corporate military or police dominance.

[RULE][BASE-R-090] Extraterritorial regimes MUST be licensed, bounded,
auditable, and revocable.

[RULE][BASE-R-091] OSA deployment MUST be limited to threats against
core state functions.

[RULE][BASE-R-100] Transhumanism MUST be constrained to moderate mode.

[FORBIDDEN][BASE-R-101] Inborn superhuman abilities.

[FORBIDDEN][BASE-R-102] Everyday combat cybernetics.

[RULE][BASE-R-110] Physical superiority MUST be achieved via
equipment | energy | procedure | access_window.

[RULE][BASE-R-120] Pressure on OSA MUST be procedural-only.

[FORBIDDEN][BASE-R-121] Personal calls or direct regional orders to OSA.

[RULE][BASE-R-130] High GDP MUST NOT imply local abundance.

[FORBIDDEN][BASE-R-131] Explaining local deficits by
“energy taken by AI”.

[RULE][BASE-R-140] UNKNOWN elements MAY enter narrative ONLY IF they
create_stakes OR affect_jurisdiction OR manifest_as_anomaly.

[RULE][BASE-R-150] Human grounding beats MUST appear every 4–5
functional/action scenes.

[FORBIDDEN][BASE-R-151] Using grounding beats for exposition or plot advancement.

---

## USAGE / RESOLUTION

[DECISION][BASE-R-180] All downstream documents MUST apply these rules
before interpreting STATE or BIND outputs.

[DECISION][BASE-R-181] Any deviation from CANON-CORE-GLOBAL-2215-0001
REQUIRES `explicit_override`.

---

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-BASE-RULE-GLOBAL-2215-0001
role_type: RULE
export:
  - rule_id: BASE-R-010
    intent: enforce ssot-consistent background defaults
    inputs: [SSOT-CONSISTENCY-A-2215-0009]
    outputs: [ssot_consistent]
  - rule_id: BASE-R-040
    intent: enforce interpretation priority order
    inputs: []
    outputs: [resolution_order]
~~~

---

## FORBIDDEN

[FORBIDDEN][BASE-R-190] Mixing ROLE_TYPEs inside this document.
[FORBIDDEN][BASE-R-191] Introducing STATE or BIND statements here.
[FORBIDDEN][BASE-R-192] Using softeners or vague language.
[FORBIDDEN][BASE-R-193] Adding narrative examples outside NON-NORMATIVE.

---

## NON-NORMATIVE

(Empty by design)
