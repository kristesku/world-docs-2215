---
id: PLAN-DEFAULT_ENVIRONMENT-2215-0001
title: >
  Default Environment Plan — 2215 (Scenario A)
class: plan
status: draft
version: 0.3.0
inputs:
  - BASELINE-PHYSICAL_LEVEL_MID-2215-0001
  - SSOT-SCENARIO-A-2215-0001
depends_on:
  - SPEC-DOC_STYLE-2215-0001
scope: >
  Структурный PLAN-контракт для описания дефолтной среды 2215.
  Определяет модули, категории параметров, типы значений и требования трассировки
  baseline/override при использовании в сценах. Не фиксирует факты мира и значения.
---

## LLM-INTENT

ROLE_TYPE: INTERFACE
SCOPE: structural skeleton for environment baselines and scene snapshots; no world facts or default values
INPUTS:
  - BASELINE-PHYSICAL_LEVEL_MID-2215-0001
  - SSOT-SCENARIO-A-2215-0001
  - override_documents
OUTPUTS:
  - environment_modules
  - parameter_schema
  - scene_snapshot_contract
FORBIDDEN:
  - world_facts
  - numeric_defaults
  - narrative_explanations

---

## DEFINITIONS

[DECISION][PLAN-DEF-010] environment = set of physical/sensory/infrastructure conditions perceived in a scene.
[DECISION][PLAN-DEF-011] access_level ∈ {LEVEL-LOW, LEVEL-MID, LEVEL-HIGH}.
[DECISION][PLAN-DEF-012] baseline = source of default values and prohibitions for environment (by access_level).
[DECISION][PLAN-DEF-013] ssot = source of world invariants; SSOT is not used directly as scene numeric defaults.
[DECISION][PLAN-DEF-014] override = local deviation from baseline with explicit cause, scope, and trace.

---

## INVARIANTS

[DECISION][PLAN-INV-010] PLAN MUST NOT assert world facts.
[DECISION][PLAN-INV-011] PLAN MUST NOT contain numeric parameter values.
[DECISION][PLAN-INV-012] Any environment baseline MUST conform to this module/category/value-type structure.
[DECISION][PLAN-INV-013] Any scene using environment MUST be traceable to baseline and/or override and/or artifact reference.

---

## CONTENT

### 1. Environment modules (mandatory set)

[DECISION][PLAN-MOD-010] environment_modules MUST be:
- Housing
- Building
- City
- Transport
- Workspaces
- Soundscape
- LightVisibility
- Interfaces
- PrivacyLogging
- SafetyEnforcement

[DECISION][PLAN-MOD-011] Missing any module from PLAN-MOD-010 makes the environment baseline invalid.

---

### 2. Parameter categories (per module)

[DECISION][PLAN-CAT-010] Each module MUST define parameter categories:
- Geometry
- Climate
- Acoustics
- Materials
- Energy
- Maintenance
- Connectivity
- UIInteraction
- Mobility
- Constraints

[DECISION][PLAN-CAT-011] Category Constraints MUST exist for every module.

---

### 3. Allowed value types (for baseline/override)

[DECISION][PLAN-VAL-010] Allowed value types are:
- range (min/max + optional p50)
- enum
- boolean
- narrative_tag (≤3 neutral words)
- forbidden_list

[DECISION][PLAN-VAL-011] Numeric values are allowed only in BASELINE or OVERRIDE documents, never in PLAN.

---

### 4. Normative markers

[DECISION][PLAN-NORM-010] PLAN MUST use [DECISION] markers only.
[DECISION][PLAN-NORM-011] PLAN MUST NOT use markers {FACT, DEFAULT, FORBIDDEN, RULE, NOTE, UNKNOWN}.

---

### 5. Sensor fields (scene-facing, non-narrative)

[DECISION][PLAN-SENS-010] Scene-facing sensor fields MUST be measurable keys or narrative_tag; no metaphors.
[DECISION][PLAN-SENS-011] Sensor fields do not introduce facts; they reference baseline/override/artifact.

---

### 6. Access level coverage (baseline requirement)

[DECISION][PLAN-ACL-010] Any environment baseline MUST include access levels:
- LEVEL-LOW (≥5 parameters total across modules)
- LEVEL-MID (full passport; primary)
- LEVEL-HIGH (≥5 parameters total across modules)

[DECISION][PLAN-ACL-011] LEVEL-MID is default only inside BASELINE value resolution; PLAN does not select values.

---

### 7. Scene integration (Environment Snapshot)

[DECISION][PLAN-SCN-010] Scenes MUST use environment only via Environment Snapshot (not via declarative exposition).
[DECISION][PLAN-SCN-011] Environment Snapshot MAY include:
- access_level
- module_overrides (optional)
- sensors (2–5 keys)
- route_tag (optional)
- district_tag (optional)

[DECISION][PLAN-SCN-012] Snapshot MUST NOT explain causality and MUST NOT replace FSSU artifacts (CD/EL/CM/FM/RP).

---

### 8. Allowed sensor keys (scene-level)

[DECISION][PLAN-SCN-020] Allowed sensors keys are:
- noise_db
- wind_mps
- humidity_percent
- temperature_c
- latency_ms
- packet_loss_percent
- light_k
- visibility (meters_or_enum)
- traffic_flow_0_1
- background_noise_tag

[DECISION][PLAN-SCN-021] Emotional or evaluative keys are not allowed.

---

### 9. Traceability requirement

[DECISION][PLAN-TRC-010] Any sensor parameter that affects scene outcome MUST be traceable to:
- baseline, OR
- override, OR
- artifact reference (e.g., telemetry snapshot).

---

### 10. Override requirements

[DECISION][PLAN-OVR-010] Any deviation from baseline MUST be expressed via override document.
[DECISION][PLAN-OVR-011] Override MUST specify:
- overridden baseline anchor
- justification
- scope

---

### 11. Compliance checklist (mechanical)

[DECISION][PLAN-CHK-010] Environment baseline is compliant IFF:
- all modules from PLAN-MOD-010 are covered
- LEVEL-MID passport exists
- constraints are explicit
- no forbidden markers appear in PLAN
- dependencies are resolvable

---

## USAGE / RESOLUTION

[DECISION][PLAN-USE-010] PLAN is a structural contract for baseline and scene authors only.
[DECISION][PLAN-USE-011] PLAN does not participate in value precedence or selection.

---

## OUTPUT CONTRACT

~~~yaml
doc_id: PLAN-DEFAULT_ENVIRONMENT-2215-0001
ROLE_TYPE: INTERFACE
export:
  environment_modules:
    - Housing
    - Building
    - City
    - Transport
    - Workspaces
    - Soundscape
    - LightVisibility
    - Interfaces
    - PrivacyLogging
    - SafetyEnforcement
  parameter_categories:
    - Geometry
    - Climate
    - Acoustics
    - Materials
    - Energy
    - Maintenance
    - Connectivity
    - UIInteraction
    - Mobility
    - Constraints
  scene_snapshot_contract:
    allowed_keys:
      - access_level
      - module_overrides
      - sensors
      - route_tag
      - district_tag
    sensors_allowed:
      - noise_db
      - wind_mps
      - humidity_percent
      - temperature_c
      - latency_ms
      - packet_loss_percent
      - light_k
      - visibility
      - traffic_flow_0_1
      - background_noise_tag
~~~

---

## NON-NORMATIVE

(Empty by design)
