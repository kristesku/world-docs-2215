---
id: BASELINE-SOCIAL-CIVIC-2215-0001
title: >
  Civic & Social Baseline — 2215 (Bodies, Rights, Bio-Ethics)
class: baseline
status: fixed
version: 1.1.0
inputs:
  - SSOT-SCENARIO-A-2215-0001
  - SSOT-LIFE-A-2215-0007
depends_on:
  - CANON-BASE-0001
scope: >
  Исполняемый baseline гражданских, социальных и биоэтических норм
  повседневной жизни (LEVEL-MID) в 2215 году.
  Регулирует тело, сетевую связность, био-безопасность и репродукцию.
  Закрывает UNK-2215-0001, 0002, 0006, 0007, 0008.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: define enforceable civic, social, and bio-ethical defaults for citizens (LEVEL-MID).
INPUTS: [SSOT-SCENARIO-A-2215-0001, SSOT-LIFE-A-2215-0007, CANON-BASE-0001]
OUTPUTS: [social_norms, prohibitions, civic_constraints]
FORBIDDEN: [moral_judgements, prose, cultural exposition, speculative ethics]

## DEFINITIONS

[FACT][SOC-DEF-010] LEVEL-MID = стандартные городские условия проживания без специальных лицензий.
[FACT][SOC-DEF-011] BAN/ID = биометрически связанная гражданская идентификация и сетевой профиль (Body Area Network).
[FACT][SOC-DEF-012] bio-recycling = обязательный цикл утилизации человеческого тела после смерти.
[FACT][SOC-DEF-013] licensed_private_zone = частное пространство с разрешённым снижением телеметрии.

## INVARIANTS

[DECISION][SOC-INV-010] Данный документ является исполняемым baseline для сцен и протоколов.
[DECISION][SOC-INV-011] Все пункты применимы по умолчанию для LEVEL-MID.
[DECISION][SOC-INV-012] Отклонения допускаются только через explicit override или иной LEVEL.
[FORBIDDEN][SOC-INV-013] Использование до-2215 культурных норм без фиксации override.

## CONTENT

### 1. Protocols of Death (Bio-Recycling)

[RULE][SOC-BIO-010] IF person.status = dead THEN death_disposal_method MUST be aquamation_only (resomation).
[FORBIDDEN][SOC-BIO-011] burial, cremation (combustion) are prohibited.

[FACT][SOC-BIO-012] aquamation_process = alkaline_hydrolysis → water_recovery → calcium_material_reuse.

[FACT][SOC-BIO-013] funeral_rituals = none.
[FACT][SOC-BIO-014] memory_farewell = digital_snapshot_only.

[RULE][SOC-BIO-015] body_status MUST be treated as "leased_from_biosphere" and "must_be_returned".

### 2. Connectivity Rights (Offline Status)

[RULE][SOC-NET-010] IF zone = public_mid AND user.status = offline THEN legal_status = suspect.
[FACT][SOC-NET-011] offline_allowed_zones = licensed_private_zone | faraday_hotel (paid).

[RULE][SOC-NET-012] IF user.action = telemetry_jamming THEN crime = criminal_offense (3–5y correction).

[RULE][SOC-NET-013] ban_id_required MUST be true in all public and work zones.

### 3. Bio-Safety & Pets

[RULE][SOC-PET-010] IF citizen owns live_pet THEN require bio_luxury_license.
[FACT][SOC-PET-011] bio_luxury_license = carbon_offset + sanitary_compliance + owner_liability.

[FACT][SOC-PET-012] pet_distribution = ~90% robotic_pets; biological_pets minority.

[RULE][SOC-PET-013] IF animal.status = stray THEN action = automated_sanitary_elimination (time < 20m).

### 4. Controlled Substances (Nicotine / Stimulants)

[FORBIDDEN][SOC-SUB-010] combustion = prohibited (treated_as_fire_event).

[RULE][SOC-SUB-011] IF substance = nicotine THEN form_factor MUST be medical_inhaler_only AND cartridge_id_bound.

[FACT][SOC-SUB-012] stimulant_form_factor = clinical_inhaler; no_smell; no_vapor.

[FORBIDDEN][SOC-SUB-013] recreational_smoking_culture.

### 5. Intimacy & Demography

[RULE][SOC-DEM-010] IF action = parenting THEN require algorithmic_license.

[FACT][SOC-DEM-011] license_inputs = financial_capacity + housing_class + genetic_screening.

[RULE][SOC-DEM-012] IF pregnancy = unauthorized THEN penalty = fine | mandatory_therapy | parental_rights_revocation.

[FACT][SOC-DEM-013] intimacy_allowed = yes.
[RULE][SOC-DEM-014] biofluid_exchange MUST be monitored_via_BAN for viral markers.
[FACT][SOC-DEM-015] risk_notification = automatic (informational).

## USAGE / RESOLUTION

[DECISION][SOC-USE-010] This baseline MUST be referenced by all scenes involving: death, pets, substances, connectivity, intimacy, reproduction.
[DECISION][SOC-USE-011] Any scene violating these defaults MUST include an explicit override reference.

## OUTPUT CONTRACT

~~~yaml
doc_id: BASELINE-SOCIAL-CIVIC-2215-0001
role_type: RULE
export:
  - rule_id: SOC-BIO-010
    intent: enforce bio-recycling
    inputs: [person.status]
    outputs: [disposal_method]
  - rule_id: SOC-NET-010
    intent: restrict offline status
    inputs: [zone, user.status]
    outputs: [legal_status]
  - rule_id: SOC-PET-010
    intent: restrict biological pets
    inputs: [ownership]
    outputs: [license_requirement]
~~~

## FORBIDDEN

[FORBIDDEN][SOC-FBD-010] Romanticizing death, pets, reproduction, or disconnection.
[FORBIDDEN][SOC-FBD-011] Depicting offline public life as neutral or normal.
[FORBIDDEN][SOC-FBD-012] Treating bio-ethics as personal choice at LEVEL-MID.

## NON-NORMATIVE

~~~markdown
This document encodes social pressure and control as environmental constants,
not as moral commentary. Any emotional impact must emerge from scenes, not here.
~~~