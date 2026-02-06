---
id: SSOT-LIFE-A-2215-0007
title: >
  Life, Body, and Daily Reality — Scenario A (2215, SSOT State)
class: ssot
status: draft
version: 1.1.0
inputs: []
depends_on:
  - SSOT-SCENARIO-A-2215-0001
  - SSOT-DEMOGRAPHY-A-2215-0002
  - SSOT-ECONOMY-A-2215-0003
  - SPEC-QUALITATIVE-ENUMS-2215-0001
scope: >
  SSOT-состояние повседневной жизни, телесности и социально-технологической
  реальности человека в 2215 году (Scenario A). Документ содержит только
  декларативные бинарные/категориальные свойства и минимальные количественные
  ориентиры (если есть). Не содержит причинности, процедур, нормативных
  предписаний или narrative-логики.
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

---

## DEFINITIONS

[DEF][LIF-DEF-010] life = everyday practices, access to services, privacy regimes, and cultural norms.
[DEF][LIF-DEF-011] body = health, medicine, therapeutic augmentation, and human biological limits.

---

## INVARIANTS

[FACT][LIF-000] Applicable only to Scenario A.
[FACT][LIF-001] Human biological and psychological constraints persist.
[FACT][LIF-002] No default radical post-human discontinuity.
[FACT][LIF-003] No mass immortality.

---

## CONTENT

### 1. Health and longevity

[STATE][LIF-010] life_expectancy_years.core = 100
[STATE][LIF-011] life_expectancy_years.range = [95, 110]
[STATE][LIF-012] life_expectancy_years.unit = years
[STATE][LIF-013] life_expectancy_years.owner_domain = LIFE

[STATE][LIF-014] longevity_mode = "prevention_and_chronic_management"
[STATE][LIF-015] longevity_mode.owner_domain = LIFE

[STATE][LIF-016] medical_care_personalization = "high"
[STATE][LIF-017] medical_care_personalization.owner_domain = LIFE

[STATE][LIF-018] medical_automation_level = "high"
[STATE][LIF-019] medical_automation_level.owner_domain = AUTOMATION

[STATE][LIF-020] robotic_surgery_is_standard = true
[STATE][LIF-021] robotic_surgery_is_standard.owner_domain = LIFE

[STATE][LIF-022] ai_diagnostics_is_standard = true
[STATE][LIF-023] ai_diagnostics_is_standard.owner_domain = LIFE

[STATE][LIF-024] primary_mortality_shift = "late_ages"
[STATE][LIF-025] primary_mortality_shift.owner_domain = LIFE

---

### 2. Augmentation and limits

[STATE][LIF-030] therapeutic_augmentation_prevalence = "common"
[STATE][LIF-031] therapeutic_augmentation_prevalence.owner_domain = LIFE

[STATE][LIF-032] enhancement_augmentation_prevalence = "rare_socially_limited"
[STATE][LIF-033] enhancement_augmentation_prevalence.owner_domain = GOVERNANCE

[STATE][LIF-034] cognitive_implants_prevalence = "niche_professional"
[STATE][LIF-035] cognitive_implants_prevalence.owner_domain = LIFE

[STATE][LIF-036] radical_body_modification_norm = false
[STATE][LIF-037] radical_body_modification_norm.owner_domain = LIFE

---

### 3. Perception, AR/VR, and media

[STATE][LIF-040] ar_interfaces_daily_use = true
[STATE][LIF-041] ar_interfaces_daily_use.owner_domain = LIFE

[STATE][LIF-042] ar_device_forms = ["wearable", "implantable"]
[STATE][LIF-043] ar_device_forms.owner_domain = LIFE

[STATE][LIF-044] vr_widespread_use = true
[STATE][LIF-045] vr_widespread_use.owner_domain = LIFE

[STATE][LIF-046] vr_full_immersion_is_dominant_lifestyle = false
[STATE][LIF-047] vr_full_immersion_is_dominant_lifestyle.owner_domain = LIFE

[STATE][LIF-048] vr_primary_use_cases = ["work", "education", "therapy", "entertainment"]
[STATE][LIF-049] vr_primary_use_cases.owner_domain = LIFE

---

### 4. Work, time, and meaning

[STATE][LIF-060] routine_human_labor_necessity = "low"
[STATE][LIF-061] routine_human_labor_necessity.owner_domain = ECONOMY

[STATE][LIF-062] work_as_primary_identity_norm = false
[STATE][LIF-063] work_as_primary_identity_norm.owner_domain = LIFE

[STATE][LIF-064] common_human_activity_domains = [
  "creative",
  "care",
  "education",
  "governance",
  "civic_activity"
]
[STATE][LIF-065] common_human_activity_domains.owner_domain = LIFE

[STATE][LIF-066] basic_material_needs_provision_mode = "decoupled_from_labor_market"
[STATE][LIF-067] basic_material_needs_provision_mode.owner_domain = ECONOMY

[STATE][LIF-068] meaning_identity_crisis_prevalence = "present_nonzero"
[STATE][LIF-069] meaning_identity_crisis_prevalence.owner_domain = LIFE

---

### 5. Education and cognition

[STATE][LIF-080] lifelong_education_norm = true
[STATE][LIF-081] lifelong_education_norm.owner_domain = LIFE

[STATE][LIF-082] ai_tutors_are_standard = true
[STATE][LIF-083] ai_tutors_are_standard.owner_domain = LIFE

[STATE][LIF-084] knowledge_access_mode = "near_universal"
[STATE][LIF-085] knowledge_access_mode.owner_domain = GOVERNANCE

[STATE][LIF-086] diplomas_vs_competence_signal = "competence_over_diplomas"
[STATE][LIF-087] diplomas_vs_competence_signal.owner_domain = GOVERNANCE

---

### 6. Social structure and inequality (everyday)

[STATE][LIF-100] inequality_primary_dimensions = ["space", "privacy", "augmentations"]
[STATE][LIF-101] inequality_primary_dimensions.owner_domain = ECONOMY

[STATE][LIF-102] extreme_material_poverty_exists = false
[STATE][LIF-103] extreme_material_poverty_exists.owner_domain = ECONOMY

[STATE][LIF-104] everyday_status_differences_mode = "cultural_status_not_existential"
[STATE][LIF-105] everyday_status_differences_mode.owner_domain = LIFE

---

### 7. Surveillance, privacy, and autonomy

[STATE][LIF-120] ubiquitous_digital_surveillance = true
[STATE][LIF-121] ubiquitous_digital_surveillance.owner_domain = SECURITY

[STATE][LIF-122] surveillance_operation_mode = "automated_procedural"
[STATE][LIF-123] surveillance_operation_mode.owner_domain = SECURITY

[STATE][LIF-124] privacy_mode = "regulated_contractual"
[STATE][LIF-125] privacy_mode.owner_domain = GOVERNANCE

[STATE][LIF-126] surveillance_social_acceptance = "high"
[STATE][LIF-127] surveillance_social_acceptance.owner_domain = LIFE

[STATE][LIF-128] full_anonymity_availability = "limited_legal_regimes"
[STATE][LIF-129] full_anonymity_availability.owner_domain = GOVERNANCE

---

### 8. Culture, norms, and values

[STATE][LIF-140] cultural_orientation = ["sustainability", "security", "rationality"]
[STATE][LIF-141] cultural_orientation.owner_domain = LIFE

[STATE][LIF-142] extremist_ideologies_prevalence = "marginal"
[STATE][LIF-143] extremist_ideologies_prevalence.owner_domain = SECURITY

[STATE][LIF-144] social_norms_emphasis = ["responsibility", "compliance", "long_term_thinking"]
[STATE][LIF-145] social_norms_emphasis.owner_domain = GOVERNANCE

---

## USAGE / RESOLUTION

[FACT][LIF-900] Provides declarative LIFE and BODY state for downstream documents.

[FORBIDDEN][LIF-901] Using this SSOT document for:
- causal explanations of social behavior,
- selecting scene “tone” or aesthetics,
- feedback-loop or governance logic.

---

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

  - key: therapeutic_augmentation_prevalence
    value: common
    owner_domain: LIFE

  - key: ubiquitous_digital_surveillance
    value: true
    owner_domain: SECURITY

  - key: privacy_mode
    value: regulated_contractual
    owner_domain: GOVERNANCE

  - key: ar_interfaces_daily_use
    value: true
    owner_domain: LIFE
~~~

---

## FORBIDDEN

[FORBIDDEN][LIF-990] Introducing new world metrics or numeric claims outside SSOT.
[FORBIDDEN][LIF-991] Embedding causal chains, loops, or normative prescriptions.
[FORBIDDEN][LIF-992] Treating LIFE state as narrative directive.

---

## NON-NORMATIVE

(Empty by design)
