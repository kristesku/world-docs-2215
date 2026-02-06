---
id: CANON-SYSTEMS-0001
title: >
  Canon Systems — Institutional and Engineering Contours (2215)
class: canon
status: fixed
version: 1.1.0
inputs: []
depends_on:
  - SSOT-DOC-STYLE-2215-0001
  - CANON-2215-CORE-0001
  - CANON-BASE-0001
  - CANON-CONFLICT-0001
scope: >
  Каноническая системная архитектура мира романа 2215: институциональные контуры,
  операторы критической инфраструктуры, экстерриториальные режимы,
  наблюдаемость, ответственность за ИИ и процедурные рычаги ОСА.
  Документ НЕ выбирает числовые параметры мира.
---

## LLM-INTENT

ROLE_TYPE: STATE
SCOPE: define institutional and infrastructure system state for the world of 2215
INPUTS:
  - CANON-2215-CORE-0001
OUTPUTS:
  - system_contours
  - operator_landscape
  - observability_model
  - ai_responsibility_model
FORBIDDEN:
  - world_parameter_binding
  - causal_chains
  - baseline_defaults
  - resolution_logic

---

## DEFINITIONS

[FACT][SYS-DEF-010] governance_macro_model = модель распределения полномочий центр–регионы.
[FACT][SYS-DEF-011] ci_operator = лицензированный оператор критической инфраструктуры.
[FACT][SYS-DEF-012] extraterritory = контрактный специальный режим с процедурными ограничениями доступа.
[FACT][SYS-DEF-013] observability_model = способ доступности и полноты данных о системе.
[FACT][SYS-DEF-014] ai_responsibility_model = схема распределения ответственности за решения ИИ.

---

## INVARIANTS

[DECISION][SYS-INV-010] Документ MUST наследовать фон мира из CANON-2215-CORE-0001.
[DECISION][SYS-INV-011] Государство MUST сохранять примат легитимного принуждения.
[DECISION][SYS-INV-012] Операторы MUST действовать в лицензируемом и отзывном режиме.
[DECISION][SYS-INV-013] Экстерритория MUST NOT трактоваться как суверенитет.
[DECISION][SYS-INV-014] Наблюдаемость MUST NOT быть тотальной по умолчанию.
[DECISION][SYS-INV-015] ОСА MUST функционировать как процедурный инструмент, а не универсальный орган.

---

## CONTENT

### 1. Governance architecture

[STATE][SYS-010] governance_macro_model = strong_center_with_regional_execution_by_standards.
[STATE][SYS-011] center_sets = {safety_standards, audit_requirements, interoperability_regimes, incident_regimes}.
[STATE][SYS-012] regions_execute = {dispatch_clusters, local_operations, contractors}.

---

### 2. Critical infrastructure operators

[STATE][SYS-020] ci_operator_count_range = [2, 4].
[STATE][SYS-021] ci_operator_domains = {
  energy_storage_distribution,
  connectivity_and_city_sensing,
  logistics_recycling_warehousing,
  medtech_reagents_optional
}.

[STATE][SYS-022] operator_obligations = {
  licensing_required,
  audit_trails_mandatory,
  inspections_possible,
  insurance_and_fines_applicable
}.

---

### 3. Primary location profile (Naberezhnye Chelny)

[STATE][SYS-030] chelny_node_type = hybrid_logistics_dominant_node.
[STATE][SYS-031] chelny_primary_functions = {
  materials_recycling,
  large_scale_warehousing,
  rail_river_autonomous_corridor_intersection,
  sensor_and_connectivity_service_capacity
}.
[STATE][SYS-032] chelny_secondary_features = {local_energy_buffers_optional}.

---

### 4. Extraterritorial regimes

[STATE][SYS-040] extraterritory_types = {industrial_logistics, rnd_biotech_med}.
[STATE][SYS-041] extraterritory_creation_basis = contract_center_region_operator.
[STATE][SYS-042] extraterritory_features = {
  accelerated_approvals,
  restricted_external_audit,
  special_reporting,
  osa_entry_by_incident_or_warrant
}.
[STATE][SYS-043] extraterritory_constraints = {
  licensed,
  bounded,
  auditable,
  state_intervention_on_risk
}.

---

### 5. Critical resources

[STATE][SYS-050] primary_critical_resources = {
  energy_storage_peak_power,
  observability_nodes
}.
[STATE][SYS-051] secondary_critical_resources = {
  medical_reagents_for_rnd_extraterritories
}.

---

### 6. Observability model

[STATE][SYS-060] observability_model = fragmented.
[STATE][SYS-061] observability_fragmentation_sources = {
  multi_operator_ownership,
  log_and_format_divergence,
  legal_access_boundaries
}.
[STATE][SYS-062] investigation_implications = {
  blind_zones_exist,
  data_delay_or_loss_possible,
  cross_operator_correlation_required
}.

---

### 7. Responsibility for AI decisions

[STATE][SYS-070] ai_responsibility_model = mixed.
[STATE][SYS-071] critical_decision_controls = {
  human_signatory,
  decision_logging,
  post_audit
}.
[STATE][SYS-072] critical_decision_domains = {
  life_and_health,
  hospital_energy_supply,
  evacuation
}.
[STATE][SYS-073] noncritical_liability_modes = {
  operator_liability,
  fines,
  license_actions,
  insurance
}.
[STATE][SYS-074] liability_architecture_patterns = {
  subcontracting_layers,
  spv_risk_shells,
  insurance_coverage,
  arbitration_over_personal_guilt
}.

---

### 8. OSA levers and resistance

[STATE][SYS-080] osa_levers = {
  data_and_site_access_warrants,
  media_seizure,
  temporary_mode_suspension,
  regulatory_checks_or_license_actions,
  extraterritorial_mandates_on_incidents
}.
[STATE][SYS-081] osa_constraints = {
  approval_delays,
  jurisdiction_disputes,
  corporate_legal_resistance,
  private_security_within_limits,
  procedural_pressure
}.

---

### 9. Mobility profile (Chelni)

[STATE][SYS-090] chelny_mobility_profile = dense_city_low_private_car_dependency.
[STATE][SYS-091] mobility_modes = {
  public_transport,
  routed_capsules,
  autonomous_freight_corridors
}.

---

### 10. Open unknowns

[UNKNOWN][SYS-100] Specific operator and regulator identities.
[UNKNOWN][SYS-101] KPI formulas causing pathological optimization.
[UNKNOWN][SYS-102] Exact OSA warrant issuance timings.
[UNKNOWN][SYS-103] Topology of key hubs and routes in Chelny.
[UNKNOWN][SYS-104] Threshold for center takeover of regional control.

---

## USAGE / RESOLUTION

[DECISION][SYS-USE-010] Документ используется как системное STATE-основание для CANON и SCENE.
[DECISION][SYS-USE-011] Любые процедурные правила MUST задаваться в RULE-документах.

---

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-SYSTEMS-0001
role_type: STATE
export:
  governance_macro_model: strong_center_with_regional_execution_by_standards
  ci_operator_count_range: [2, 4]
  extraterritory_types: [industrial_logistics, rnd_biotech_med]
  observability_model: fragmented
  ai_responsibility_model: mixed
  osa_levers:
    - data_and_site_access_warrants
    - media_seizure
    - temporary_mode_suspension
    - regulatory_checks_or_license_actions
~~~

---

## FORBIDDEN

[FORBIDDEN][SYS-FBD-900] Introducing_new_global_world_metrics.
[FORBIDDEN][SYS-FBD-901] Encoding_causality_chains_in_canon.
[FORBIDDEN][SYS-FBD-902] Treating_operators_as_sovereigns.
[FORBIDDEN][SYS-FBD-903] Assuming_total_observability_by_default.

---

## NON-NORMATIVE

(Empty by design)
