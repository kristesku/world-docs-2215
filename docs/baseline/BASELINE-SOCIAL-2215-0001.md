---
id: BASELINE-SOCIAL-2215-0001
title: >
  Civic & Social Baseline — 2215 (Bodies, Rights, Bio-Ethics)
class: baseline
status: fixed
version: 1.2.1
prefix: SOC
doc_language: en-US
prose_language: ru-RU
inputs:
  - SSOT-SCENARIO-A-2215-0001
  - SSOT-LIFE-A-2215-0007
depends_on:
  - CANON-BASE_RULE-GLOBAL-2215-0001
scope: >
  Исполняемый baseline гражданских, социальных и биоэтических норм
  повседневной жизни (LEVEL-MID) в 2215 году.
  Регулирует тело, сетевую связность, био-безопасность и репродукцию.
  Закрывает UNK-2215-0001, UNK-2215-0002, UNK-2215-0006, UNK-2215-0007, UNK-2215-0008.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: enforceable civic, social, and bio-ethical defaults for citizens (LEVEL-MID)
INPUTS:
  - SSOT-SCENARIO-A-2215-0001
  - SSOT-LIFE-A-2215-0007
  - CANON-BASE_RULE-GLOBAL-2215-0001
OUTPUTS: [rule_id, enforcement_outcomes, prohibited_patterns]
FORBIDDEN: [moral_judgements, prose, cultural_exposition, speculative_ethics, mixed_role_types]

---

## DEFINITIONS

[FACT][SOC-DEF-010] `LEVEL-MID` = стандартные городские условия без специальных лицензий.
[FACT][SOC-DEF-011] `BAN_ID` = биометрически связанная гражданская идентификация и сетевой профиль (Body Area Network).
[FACT][SOC-DEF-012] `bio_recycling` = обязательный цикл утилизации тела после смерти.
[FACT][SOC-DEF-013] `licensed_private_zone` = частное пространство с разрешённым снижением телеметрии.
[FACT][SOC-DEF-014] `aquamation` = alkaline_hydrolysis.
[FACT][SOC-DEF-015] `faraday_hotel` = платная зона экранирования телеметрии.

---

## INVARIANTS

[DECISION][SOC-INV-010] This document MUST be treated as executable baseline for LEVEL-MID scenes.
[DECISION][SOC-INV-011] All rules in this document MUST apply by default for LEVEL-MID.
[DECISION][SOC-INV-012] Any deviation REQUIRES explicit override OR a different LEVEL baseline.
[DECISION][SOC-INV-020] Units: `years`, `minutes`, `percent` MUST be used in numeric constraints.
[DECISION][SOC-INV-021] Any incarceration range MUST be expressed as `x ∈ [a, b] years`.

[FORBIDDEN][SOC-INV-013] Importing pre-2215 cultural norms as defaults without explicit override.
[FORBIDDEN][SOC-INV-014] Introducing world-parameter bindings or p90 selection in this baseline.

---

## CONTENT

### 1. Protocols of Death (Bio-Recycling)

[RULE][SOC-BIO-010] IF `person.status` == dead THEN `death_dispFSSUl_method` MUST be aquamation_only.
[RULE][SOC-BIO-013] IF `person.status` == dead THEN `bio_recycling` MUST be executed.
[RULE][SOC-BIO-014] IF `person.status` == dead THEN `water_recovery` MUST be executed.
[RULE][SOC-BIO-015] IF `person.status` == dead THEN `calcium_material_reuse` MUST be executed.

[RULE][SOC-BIO-016] IF `person.status` == dead THEN `funeral_rituals` MUST be non_material_only.
[RULE][SOC-BIO-017] IF `person.status` == dead THEN `memory_farewell` MUST be digital_snapshot_only.

[RULE][SOC-BIO-018] `body_status` MUST be leased_from_biosphere.
[RULE][SOC-BIO-019] `body_status` MUST be returned_to_biosphere.

[FORBIDDEN][SOC-BIO-011] Burial.
[FORBIDDEN][SOC-BIO-012] Cremation or combustion.

### 2. Connectivity Rights (Offline Status)

[RULE][SOC-NET-010] IF `zone` == public_mid AND `user.status` == offline THEN `legal_status` MUST be suspect.
[RULE][SOC-NET-011] IF `user.status` == offline THEN `offline_allowed_zone` MUST be licensed_private_zone OR faraday_hotel.

[RULE][SOC-NET-012] IF `user.action` == telemetry_jamming THEN `crime_class` MUST be criminal_offense.
[RULE][SOC-NET-013] IF `user.action` == telemetry_jamming THEN `correction_term_years` MUST satisfy x ∈ [3, 5].

[RULE][SOC-NET-014] IF `zone` == public_mid THEN `ban_id_required` MUST be true.
[RULE][SOC-NET-015] IF `zone` == work THEN `ban_id_required` MUST be true.

### 3. Bio-Safety & Pets

[RULE][SOC-PET-010] IF `citizen.owns_live_pet` == true THEN `bio_luxury_license` MUST be required.
[RULE][SOC-PET-011] IF `bio_luxury_license` == required THEN `carbon_offset` MUST be required.
[RULE][SOC-PET-012] IF `bio_luxury_license` == required THEN `sanitary_compliance` MUST be required.
[RULE][SOC-PET-013] IF `bio_luxury_license` == required THEN `owner_liability` MUST be required.

[RULE][SOC-PET-020] `pet_distribution_robotic_share_percent` MUST satisfy x ∈ [85, 95].
[RULE][SOC-PET-021] `pet_distribution_biological_share_percent` MUST satisfy x ∈ [5, 15].

[RULE][SOC-PET-030] IF `animal.status` == stray THEN `action` MUST be automated_sanitary_elimination.
[RULE][SOC-PET-031] IF `animal.status` == stray THEN `action_time_minutes` MUST satisfy x ∈ [0, 20].

### 4. Controlled Substances (Nicotine / Stimulants)

[RULE][SOC-SUB-011] IF `substance` == nicotine THEN `form_factor` MUST be medical_inhaler_only.
[RULE][SOC-SUB-012] IF `substance` == nicotine THEN `cartridge_id_bound` MUST be true.

[RULE][SOC-SUB-013] IF `substance` == stimulant THEN `form_factor` MUST be clinical_inhaler_only.
[RULE][SOC-SUB-014] IF `substance` == stimulant THEN `emission` MUST be no_smell.
[RULE][SOC-SUB-015] IF `substance` == stimulant THEN `emission` MUST be no_vapor.

[FORBIDDEN][SOC-SUB-010] Combustion use (treated as fire event).
[FORBIDDEN][SOC-SUB-016] Recreational smoking culture.

### 5. Intimacy & Demography

[RULE][SOC-DEM-010] IF `action` == parenting THEN `algorithmic_license` MUST be required.
[RULE][SOC-DEM-011] IF `algorithmic_license` == required THEN `license_input` MUST include financial_capacity.
[RULE][SOC-DEM-012] IF `algorithmic_license` == required THEN `license_input` MUST include housing_class.
[RULE][SOC-DEM-013] IF `algorithmic_license` == required THEN `license_input` MUST include genetic_screening.

[RULE][SOC-DEM-020] IF `pregnancy` == unauthorized THEN `penalty.variants` INCLUDES fine.
[RULE][SOC-DEM-021] IF `pregnancy` == unauthorized THEN `penalty.variants` INCLUDES mandatory_therapy.
[RULE][SOC-DEM-022] IF `pregnancy` == unauthorized THEN `penalty.variants` INCLUDES parental_rights_revocation.

[RULE][SOC-DEM-030] `intimacy_allowed` MUST be true at LEVEL-MID.
[RULE][SOC-DEM-031] IF `action` == biofluid_exchange THEN `viral_marker_monitoring_via_BAN_ID` MUST be true.
[RULE][SOC-DEM-032] IF `viral_marker_detection` == positive THEN `risk_notification` MUST be automatic_informational.

---

## USAGE / RESOLUTION

[DECISION][SOC-USE-010] Scenes involving death MUST apply SOC-BIO-* rules unless overridden.
[DECISION][SOC-USE-011] Scenes involving connectivity/offline MUST apply SOC-NET-* rules unless overridden.
[DECISION][SOC-USE-012] Scenes involving pets MUST apply SOC-PET-* rules unless overridden.
[DECISION][SOC-USE-013] Scenes involving substances MUST apply SOC-SUB-* rules unless overridden.
[DECISION][SOC-USE-014] Scenes involving intimacy/reproduction MUST apply SOC-DEM-* rules unless overridden.
[FORBIDDEN][SOC-USE-015] Depicting LEVEL-MID defaults as optional personal preference without explicit override.

---

## OUTPUT CONTRACT

~~~yaml
doc_id: BASELINE-SOCIAL-2215-0001
role_type: RULE
export:
  - rule_id: SOC-BIO-010
    intent: enforce aquamation-only dispFSSUl at LEVEL-MID
    inputs: [person.status]
    outputs: [death_dispFSSUl_method]
  - rule_id: SOC-NET-010
    intent: classify offline status in public as suspect
    inputs: [zone, user.status]
    outputs: [legal_status]
  - rule_id: SOC-PET-010
    intent: require bio luxury license for live pets
    inputs: [citizen.owns_live_pet]
    outputs: [bio_luxury_license]
  - rule_id: SOC-DEM-010
    intent: require algorithmic license for parenting
    inputs: [action]
    outputs: [algorithmic_license]
~~~

---

## FORBIDDEN

[FORBIDDEN][SOC-FBD-010] Moral judgement language.
[FORBIDDEN][SOC-FBD-011] Prose or cultural exposition as justification.
[FORBIDDEN][SOC-FBD-012] Treating disconnection (offline) in public as neutral baseline at LEVEL-MID.
[FORBIDDEN][SOC-FBD-013] Romanticizing death, pets, reproduction, or disconnection as baseline defaults.
[FORBIDDEN][SOC-FBD-014] Introducing STATE/BIND content inside this RULE document.
[FORBIDDEN][SOC-FBD-015] Floating bullets without statement IDs.

---

## NON-NORMATIVE

This baseline encodes social pressure and control as environmental constants, not as moral commentary.
Any emotional impact MUST emerge from scenes, not from normative text.