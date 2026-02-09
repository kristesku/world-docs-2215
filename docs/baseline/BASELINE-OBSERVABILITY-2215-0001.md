---
id: BASELINE-OBSERVABILITY-2215-0001
title: >
  Urban Observability Baseline — 2215 (Telemetry, Visibility, Blind Spots)
class: baseline
status: fixed
version: 1.0.1
prefix: OBS
doc_language: en-US
prose_language: ru-RU
inputs:
  - SSOT-SCENARIO-A-2215-0001
depends_on:
  - CANON-BASE_RULE-GLOBAL-2215-0001
  - BASELINE-SOCIAL-2215-0001
  - BASELINE-DIGITAL_IDENTITY-2215-0001
scope: >
  Исполняемый baseline городской наблюдаемости (LEVEL-MID) в 2215 году.
  Определяет допустимый объём телеметрии, задержки наблюдения, субъектов доступа
  и легальные слепые зоны. Не описывает мир, только нормативные пределы.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: enforceable defaults for urban observability and telemetry (LEVEL-MID)
INPUTS:
  - CANON-BASE_RULE-GLOBAL-2215-0001
  - BASELINE-SOCIAL-2215-0001
  - BASELINE-DIGITAL_IDENTITY-2215-0001
OUTPUTS: [rule_id, observability_surface, access_rights]
FORBIDDEN: [prose, cultural_exposition, speculative_technology, mixed_role_types]

---

## DEFINITIONS

[FACT][OBS-DEF-010] `LEVEL-MID` = стандартные городские условия без специальных лицензий.
[FACT][OBS-DEF-011] `urban_telemetry` = автоматический сбор сигналов о присутствии, движении и событиях в публичном пространстве.
[FACT][OBS-DEF-012] `telemetry_event` = атомарное событие наблюдаемости (вход, выход, аномалия, нарушение).
[FACT][OBS-DEF-013] `real_time` = задержка наблюдения ≤ 30 seconds.
[FACT][OBS-DEF-014] `delayed_view` = задержка наблюдения > 30 seconds.
[FACT][OBS-DEF-015] `blind_spot` = зона с легально сниженной или отсутствующей телеметрией.

[DECISION][OBS-DEF-020] Time units MUST be expressed in `seconds` or `minutes`.
[DECISION][OBS-DEF-021] Spatial scope MUST be expressed as `zone_class`.

---

## INVARIANTS

[DECISION][OBS-INV-010] This document MUST be treated as executable baseline for LEVEL-MID.
[DECISION][OBS-INV-011] Urban observability MUST be partial, not omniscient.
[FORBIDDEN][OBS-INV-012] Implicit assumption of total or continuous surveillance.
[FORBIDDEN][OBS-INV-013] Introducing predictive or clairvoyant observability as baseline.

---

## CONTENT

### 1. Telemetry Surface (What Is Observed)

[RULE][OBS-SUR-010] IF `zone` == public_mid THEN `urban_telemetry` MUST collect presence_events.
[RULE][OBS-SUR-011] IF `zone` == public_mid THEN `urban_telemetry` MUST collect movement_vectors.
[RULE][OBS-SUR-012] IF `zone` == public_mid THEN `urban_telemetry` MUST collect safety_anomalies.

[FORBIDDEN][OBS-SUR-020] Continuous biometric streams at LEVEL-MID.
[FORBIDDEN][OBS-SUR-021] Emotion or intent inference from telemetry as baseline.

### 2. Latency and Granularity

[RULE][OBS-LAT-010] IF `telemetry_event.class` == safety_anomaly THEN `view_latency` MUST satisfy x ≤ 30 seconds.
[RULE][OBS-LAT-011] IF `telemetry_event.class` == presence_event THEN `view_latency` MUST satisfy x ∈ [1, 15] minutes.
[RULE][OBS-LAT-012] IF `telemetry_event.class` == movement_vector THEN `view_granularity` MUST be coarse.

[FORBIDDEN][OBS-LAT-020] City-wide real_time reconstruction of individual trajectories.

### 3. Access Rights (Who Can See)

[RULE][OBS-ACC-010] Municipal operators MAY access aggregated telemetry views.
[RULE][OBS-ACC-011] Infrastructure operators MAY access telemetry limited to their assets.
[RULE][OBS-ACC-012] `law_enforcement` MAY access de-anonymized telemetry ONLY IF `investigation.status` == active.

[FORBIDDEN][OBS-ACC-020] Public real-time individual tracking dashboards.
[FORBIDDEN][OBS-ACC-021] Cross-operator unrestricted telemetry sharing.

### 4. Blind Spots (Legal Non-Observability)

[RULE][OBS-BSP-010] `licensed_private_zone` MUST be treated as blind_spot.
[RULE][OBS-BSP-011] `faraday_hotel` MUST be treated as blind_spot.

[RULE][OBS-BSP-012] IF `zone` == blind_spot THEN `allowed_telemetry` MUST be perimeter_events_only.
[RULE][OBS-BSP-013] IF `zone` == blind_spot THEN `internal_presence_collection` MUST be forbidden.

[FORBIDDEN][OBS-BSP-020] Treating blind_spot usage as suspicious by default.

### 5. Post-Factum Resolution

[RULE][OBS-PFR-010] IF `incident.status` == reported THEN telemetry MAY be reconstructed post_factum.
[RULE][OBS-PFR-011] `post_factum_reconstruction` MUST rely on stored telemetry_events only.

[FORBIDDEN][OBS-PFR-020] Retroactive inference beyond recorded telemetry.

---

## USAGE / RESOLUTION

[DECISION][OBS-USE-010] Urban scenes MUST apply OBS-SUR-* and OBS-LAT-* defaults unless overridden.
[DECISION][OBS-USE-011] Scenes involving investigations MUST apply OBS-ACC-* and OBS-PFR-* rules.
[FORBIDDEN][OBS-USE-012] Depicting omniscient city awareness at LEVEL-MID.

---

## OUTPUT CONTRACT

~~~yaml
doc_id: BASELINE-OBSERVABILITY-2215-0001
role_type: RULE
export:
  - rule_id: OBS-SUR-010
    intent: collect presence telemetry in public_mid zones
    inputs: [zone]
    outputs: [presence_events]
  - rule_id: OBS-LAT-010
    intent: enforce latency bounds for safety anomalies
    inputs: [telemetry_event.class]
    outputs: [view_latency]
  - rule_id: OBS-BSP-010
    intent: define licensed private zones as blind spots
    inputs: [zone]
    outputs: [blind_spot]
~~~

---

## FORBIDDEN

[FORBIDDEN][OBS-FBD-010] Omniscient or god-view surveillance depiction.
[FORBIDDEN][OBS-FBD-011] Instant knowledge of individual actions without telemetry basis.
[FORBIDDEN][OBS-FBD-012] Predictive city behaviour as baseline.
[FORBIDDEN][OBS-FBD-013] Mixed ROLE_TYPE content inside this document.
[FORBIDDEN][OBS-FBD-014] Floating bullets without statement IDs.

---

## NON-NORMATIVE

This baseline constrains observation to partial, delayed, and role-bound views.
Suspense MUST arise from gaps, latency, and procedure—not omniscience.