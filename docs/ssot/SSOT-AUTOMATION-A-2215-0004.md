---
id: SSOT-AUTOMATION-A-2215-0004
title: >
  AI, Automation, and Robotics — Scenario A (2215, SSOT State)
class: ssot
status: draft
version: 1.1.0
inputs: []
depends_on:
  - SPEC-DOC_STYLE-2215-0001
  - SSOT-SCENARIO-A-2215-0001
scope: >
  SSOT-состояние ИИ, автоматизации и роботизации мира в 2215 году (Scenario A).
  Документ содержит только декларативные метрики (core/p90/range) и качественные состояния.
  Не содержит причинности, правил разрешения конфликтов и моделей управления.
---

## LLM-INTENT

ROLE_TYPE: STATE
SCOPE: declarative AI/automation/robotics state for Scenario A around year 2215
INPUTS: []
OUTPUTS:
  - automation_metric_state
FORBIDDEN:
  - causal_logic
  - resolution_rules
  - governance_models
  - narrative_explanations

---

## DEFINITIONS

[DEF][AUT-DEF-010] automation = AI systems + robotics + autonomous execution loops used across economy and infrastructure.

---

## INVARIANTS

[FACT][AUT-000] Applicable only to Scenario A.
[FACT][AUT-001] AI is treated as infrastructure (utility contour), not a unified subject.
[FACT][AUT-002] AI-tyranny scenarios are excluded unless explicitly enabled by an override doc.

---

## CONTENT

### 1. Automation level (global)

[STATE][AUT-010] labor_automation_percent_tasks.core = 80
[STATE][AUT-011] labor_automation_percent_tasks.p90 = 90
[STATE][AUT-012] labor_automation_percent_tasks.range = null
[STATE][AUT-013] labor_automation_percent_tasks.unit = percent
[STATE][AUT-014] labor_automation_percent_tasks.owner_domain = AUTOMATION

[STATE][AUT-015] automation_execution_mode = "systemic_global"
[STATE][AUT-016] automation_execution_mode.owner_domain = AUTOMATION

---

### 2. Compute and energy use

[STATE][AUT-020] ai_compute_EJ_per_year.core = 75
[STATE][AUT-021] ai_compute_EJ_per_year.p90 = 200
[STATE][AUT-022] ai_compute_EJ_per_year.range = null
[STATE][AUT-023] ai_compute_EJ_per_year.unit = EJ_per_year
[STATE][AUT-024] ai_compute_EJ_per_year.owner_domain = AUTOMATION

[STATE][AUT-025] ai_energy_share_percent.core = null
[STATE][AUT-026] ai_energy_share_percent.p90 = 20
[STATE][AUT-027] ai_energy_share_percent.range = null
[STATE][AUT-028] ai_energy_share_percent.unit = percent
[STATE][AUT-029] ai_energy_share_percent.owner_domain = AUTOMATION

---

### 3. Robotics density and presence

[STATE][AUT-030] robots_per_human.core = null
[STATE][AUT-031] robots_per_human.p90 = 1.0
[STATE][AUT-032] robots_per_human.range = null
[STATE][AUT-033] robots_per_human.unit = ratio
[STATE][AUT-034] robots_per_human.owner_domain = AUTOMATION

[STATE][AUT-035] robotics_presence_mode = "ubiquitous_infrastructure"
[STATE][AUT-036] robotics_presence_mode.owner_domain = AUTOMATION

---

### 4. Domains of application (qualitative state)

[STATE][AUT-040] transport_automation_level = "near_total"
[STATE][AUT-041] transport_automation_level.owner_domain = AUTOMATION

[STATE][AUT-042] manufacturing_automation_level = "lights_out"
[STATE][AUT-043] manufacturing_automation_level.owner_domain = AUTOMATION

[STATE][AUT-044] medical_ai_routine_use = true
[STATE][AUT-045] medical_ai_routine_use.owner_domain = LIFE

[STATE][AUT-046] education_ai_routine_use = true
[STATE][AUT-047] education_ai_routine_use.owner_domain = GOVERNANCE

[STATE][AUT-048] urban_systems_ai_coordination = "continuous"
[STATE][AUT-049] urban_systems_ai_coordination.owner_domain = URBANISM

---

### 5. Human participation (state)

[STATE][AUT-050] human_execution_role = "minority_niche"
[STATE][AUT-051] human_execution_role.owner_domain = SOCIETY

[STATE][AUT-052] human_legitimation_role = "required"
[STATE][AUT-053] human_legitimation_role.owner_domain = GOVERNANCE

---

## USAGE / RESOLUTION

[FACT][AUT-090] Defines allowed numeric ranges and qualitative states for downstream documents.

[FORBIDDEN][AUT-091] Using this SSOT document for:
- causal explanations of social/political conflict,
- modeling failures/accidents,
- selecting scene modes or outcomes.

---

## OUTPUT CONTRACT

~~~yaml
doc_id: SSOT-AUTOMATION-A-2215-0004
role_type: STATE
export:
  - metric: labor_automation_percent_tasks
    owner_domain: AUTOMATION
    values: {core: 80, p90: 90, range: null}
    unit: percent

  - metric: ai_compute_EJ_per_year
    owner_domain: AUTOMATION
    values: {core: 75, p90: 200, range: null}
    unit: EJ_per_year

  - metric: ai_energy_share_percent
    owner_domain: AUTOMATION
    values: {core: null, p90: 20, range: null}
    unit: percent

  - metric: robots_per_human
    owner_domain: AUTOMATION
    values: {core: null, p90: 1.0, range: null}
    unit: ratio

  - state: automation_execution_mode
    owner_domain: AUTOMATION
    value: systemic_global

  - state: robotics_presence_mode
    owner_domain: AUTOMATION
    value: ubiquitous_infrastructure

  - state: transport_automation_level
    owner_domain: AUTOMATION
    value: near_total

  - state: manufacturing_automation_level
    owner_domain: AUTOMATION
    value: lights_out

  - state: medical_ai_routine_use
    owner_domain: LIFE
    value: true

  - state: education_ai_routine_use
    owner_domain: GOVERNANCE
    value: true

  - state: urban_systems_ai_coordination
    owner_domain: URBANISM
    value: continuous

  - state: human_execution_role
    owner_domain: SOCIETY
    value: minority_niche

  - state: human_legitimation_role
    owner_domain: GOVERNANCE
    value: required
~~~

---

## FORBIDDEN

[FORBIDDEN][AUT-100] Introducing new automation metrics outside SSOT.
[FORBIDDEN][AUT-101] Embedding causal chains, resolution rules, or governance logic.
[FORBIDDEN][AUT-102] Treating qualitative states as narrative drivers.

---

## NON-NORMATIVE

(Empty by design)
