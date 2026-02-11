---
id: SSOT-LIFE-A-2215-0007
title: >
  Life, Body, and Daily Reality — Scenario A (2215, SSOT State)
class: ssot
status: draft
prefix: LIFE
doc_language: en-US
prose_language: en-US
inputs: []
depends_on:
  - SSOT-SCENARIO-A-2215-0001
  - SSOT-DEMOGRAPHY-A-2215-0002
  - SSOT-ECONOMY-A-2215-0003
  - SPEC-DOC_STYLE-2215-0001
references: []
scope: >
  SSOT state of everyday life, bodily condition, and socio-technological
  human reality in 2215 under Scenario A. Contains declarative binary
  and categorical properties and minimal quantitative anchors only.
  No causality, procedures, governance logic, or narrative directives.
---

## LLM-INTENT

ROLE_TYPE: STATE
SCOPE: human daily life and body-related state for Scenario A around year 2215
INPUTS: []
OUTPUTS:
  - life_state
FORBIDDEN:
  - causal_logic
  - resolution_rules
  - narrative_explanations
  - feedback_loops

## DEFINITIONS

[FACT][LIF-DEF-010] life = everyday practices, service access regimes, privacy structures, and dominant social norms.
[FACT][LIF-DEF-020] body = health condition, medical infrastructure, therapeutic augmentation, and human biological limits.

## INVARIANTS

[DECISION][LIF-INV-000] Applicable only within Scenario A.
[DECISION][LIF-INV-010] Human biological and psychological constraints persist.
[DECISION][LIF-INV-020] No default radical post-human discontinuity.
[DECISION][LIF-INV-030] No mass immortality.

## CONTENT

### 1. Health and Longevity

[STATE][LIF-010] life_expectancy_years.core = 100
[STATE][LIF-011] life_expectancy_years.range = [95, 110]
[STATE][LIF-012] life_expectancy_years.unit = years

[STATE][LIF-014] longevity_mode = prevention_and_chronic_management
[STATE][LIF-016] medical_care_personalization = high
[STATE][LIF-018] medical_automation_level = high
[STATE][LIF-020] robotic_surgery_is_standard = true
[STATE][LIF-022] ai_diagnostics_is_standard = true
[STATE][LIF-024] primary_mortality_shift = late_ages

### 2. Augmentation and Limits

[STATE][LIF-030] therapeutic_augmentation_prevalence = common
[STATE][LIF-032] enhancement_augmentation_prevalence = rare_socially_limited
[STATE][LIF-034] cognitive_implants_prevalence = niche_professional
[STATE][LIF-036] radical_body_modification_norm = false

### 3. Perception, AR/VR, and Media

[STATE][LIF-040] ar_interfaces_daily_use = true
[STATE][LIF-042] ar_device_forms = [wearable, implantable]
[STATE][LIF-044] vr_widespread_use = true
[STATE][LIF-046] vr_full_immersion_is_dominant_lifestyle = false
[STATE][LIF-048] vr_primary_use_cases = [work, education, therapy, entertainment]

### 4. Work, Time, and Meaning

[STATE][LIF-060] routine_human_labor_necessity = low
[STATE][LIF-062] work_as_primary_identity_norm = false
[STATE][LIF-064] common_human_activity_domains = [creative, care, education, governance, civic_activity]
[STATE][LIF-066] basic_material_needs_provision_mode = decoupled_from_labor_market
[STATE][LIF-068] meaning_identity_crisis_prevalence = present_nonzero

### 5. Education and Cognition

[STATE][LIF-080] lifelong_education_norm = true
[STATE][LIF-082] ai_tutors_are_standard = true
[STATE][LIF-084] knowledge_access_mode = near_universal
[STATE][LIF-086] diplomas_vs_competence_signal = competence_over_diplomas

### 6. Social Structure and Inequality

[STATE][LIF-100] inequality_primary_dimensions = [space, privacy, augmentations]
[STATE][LIF-102] extreme_material_poverty_exists = false
[STATE][LIF-104] everyday_status_differences_mode = cultural_status_not_existential

### 7. Surveillance, Privacy, and Autonomy

[STATE][LIF-120] ubiquitous_digital_surveillance = true
[STATE][LIF-122] surveillance_operation_mode = automated_procedural
[STATE][LIF-124] privacy_mode = regulated_contractual
[STATE][LIF-126] surveillance_social_acceptance = high
[STATE][LIF-128] full_anonymity_availability = limited_legal_regimes

### 8. Culture, Norms, and Values

[STATE][LIF-140] cultural_orientation = [sustainability, security, rationality]
[STATE][LIF-142] extremist_ideologies_prevalence = marginal
[STATE][LIF-144] social_norms_emphasis = [responsibility, compliance, long_term_thinking]

## OUTPUT CONTRACT

~~~yaml
doc_id: SSOT-LIFE-A-2215-0007
role_type: STATE
export:
  - metric: life_expectancy_years
    owner_domain: LIFE
    values:
      core: 100
      p90: null
      range: [95, 110]
    unit: years

  - metric: therapeutic_augmentation_prevalence
    owner_domain: LIFE
    values:
      core: common
      p90: null
      range: null
    unit: none

  - metric: ubiquitous_digital_surveillance
    owner_domain: SECURITY
    values:
      core: true
      p90: null
      range: null
    unit: none

  - metric: privacy_mode
    owner_domain: GOVERNANCE
    values:
      core: regulated_contractual
      p90: null
      range: null
    unit: none

  - metric: ar_interfaces_daily_use
    owner_domain: LIFE
    values:
      core: true
      p90: null
      range: null
    unit: none
~~~

## FORBIDDEN

[FORBIDDEN][LIF-990] Introducing new world metrics or numeric claims outside SSOT.
[FORBIDDEN][LIF-991] Embedding causal chains, loops, or normative prescriptions.
[FORBIDDEN][LIF-992] Treating LIFE state as narrative directive.

## NON-NORMATIVE

~~~text
Empty by design.
~~~
