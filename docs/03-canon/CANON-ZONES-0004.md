---
id: CANON-ZONES-0004
title: >
  Canon Zones — Extraterritories and Special Regimes (RF 2215): Zone Typology, Jurisdiction, and OSA Access
class: canon
status: draft
version: 1.1.0
inputs: []
depends_on:
  - SSOT-DOC-STYLE-2215-0001
  - SPEC-PRIORITY-RESOLUTION-2215-0001
  - CANON-2215-CORE-0001
  - CANON-BASE-0001
  - CANON-SYSTEMS-0001
  - CANON-ORDERS-0003
  - CANON-CONFLICT-0001
  - CANON-OSA-0005
scope: >
  STATE-описание типологии экстерриторий и специальных режимов в РФ 2215:
  виды зон, назначение, держатель режима, нормативное основание,
  арбитраж и допустимость доказательств, наблюдаемость и процедуры доступа ОСА.
  Межгосударственный фактор не активируется в текущей книге.
---

## LLM-INTENT

ROLE_TYPE: STATE
SCOPE: define zone taxonomy and procedural properties (jurisdiction, observability, access mechanics)
INPUTS:
  - CANON-2215-CORE-0001
  - CANON-SYSTEMS-0001
  - CANON-ORDERS-0003
  - CANON-OSA-0005
OUTPUTS:
  - zone_taxonomy
  - zone_properties
  - access_mechanics_state
FORBIDDEN:
  - world_parameter_binding
  - baseline_defaults
  - secret_city_trope
  - new_world_metrics
  - procedural_rule_authoring_outside_state

---

## DEFINITIONS

[FACT][ZON-DEF-010] extraterritory = procedural regime where access/audit/liability/arbitration change but do not vanish.
[FACT][ZON-DEF-011] zone_type ∈ {Z1, Z2, Z3, Z4}.
[FACT][ZON-DEF-012] regime_holder = legal_entity_or_consortium delegated special mode.
[FACT][ZON-DEF-013] arbitration_loop = specialized admissibility and access governor for the zone.
[FACT][ZON-DEF-014] observability_regime = inside_richer_outside_filtered by default.
[FACT][ZON-DEF-015] government_access_protocol = JAP (Joint Access Protocol) when required by regime.
[FACT][ZON-DEF-016] evidence_export_formula = order → fixation → chain_of_custody → legalization.

---

## INVARIANTS

[DECISION][ZON-INV-000] Extraterritory MUST NOT be treated as lawlessness.
[DECISION][ZON-INV-001] Extraterritories MUST be rare and bounded; not everyday normality.
[DECISION][ZON-INV-002] Each extraterritory MUST declare {regime_holder, normative_basis, arbitration_loop, government_access_protocol, observability_regime}.
[DECISION][ZON-INV-003] In scenes, zone presence MUST manifest via procedure, not secret_city trope.
[DECISION][ZON-INV-004] Evidence export from a zone MUST follow evidence_export_formula.

---

## CONTENT

### 1. Baseline rationale (why zones exist)

[STATE][ZON-010] zone_drivers = {
  accelerate_innovation_and_builds,
  concentrate_critical_infrastructure_and_capital,
  operator_risk_reduction_and_knowhow_protection,
  state_growth_points_and_hubs
}.
[STATE][ZON-012] state_control_levers = {licenses, standards, arbitration, regulator_triggers}.

---

### 2. Common zone properties (apply to all zone types)

[STATE][ZON-100] regime_holder = legal_entity_or_consortium_delegated_special_mode.
[STATE][ZON-101] holder_obligations = {
  license_conditions_enforcement,
  audit_trails_by_standard,
  support_JAP_for_state_orgs_including_OSA
}.

[STATE][ZON-110] observability_regime.inside_is_richer = true.
[STATE][ZON-111] observability_regime.outside_export_is_filtered = true.
[STATE][ZON-112] blind_zones_allowed_only_if = explicit_regime_exception.
[STATE][ZON-113] undocumented_blind_zone_interpretation = violation_or_sabotage_signal.

[STATE][ZON-120] arbitration_loop = specialized_zone_admissibility_and_access_governor.
[STATE][ZON-121] evidence_export_formula = order_fixation_custody_legalization.

---

### 3. Zone taxonomy (minimal set)

[STATE][ZON-200] zone_types_count = 4.
[STATE][ZON-201] zone_types = {Z1, Z2, Z3, Z4}.

---

### 4. Zone type definitions

[STATE][ZON-Z1-210] zone.Z1.code = Z1.
[STATE][ZON-Z1-211] zone.Z1.name = infrastructure_hub.
[STATE][ZON-Z1-212] zone.Z1.examples = {logistics_megahubs, energy_module_clusters, multimodal_corridors}.
[STATE][ZON-Z1-213] zone.Z1.purpose = {throughput_speed, downtime_minimization, procedure_unification}.
[STATE][ZON-Z1-214] zone.Z1.regime_features = {
  controlled_access_perimeters_and_time_windows,
  corporate_and_state_security,
  supply_chain_manipulation_surface
}.
[STATE][ZON-Z1-215] zone.Z1.liability_gaps = {contractor_subcontractor_ghosts, loss_or_substitution_as_operational_deviation}.

[STATE][ZON-Z2-220] zone.Z2.code = Z2.
[STATE][ZON-Z2-221] zone.Z2.name = compute_data_extraterritory.
[STATE][ZON-Z2-222] zone.Z2.purpose = {compute_concentration, ip_and_config_protection, cooling_energy_requirements}.
[STATE][ZON-Z2-223] zone.Z2.regime_features = {
  tight_primary_log_and_config_access_restrictions,
  high_formalism_badges_escorts_air_gapped_segments,
  rich_internal_telemetry_filtered_exports
}.
[STATE][ZON-Z2-224] zone.Z2.liability_gaps = {
  model_recommended_vs_operator_signed_vs_contractor_implemented,
  config_changes_as_planned_optimizations_without_visible_actor
}.

[STATE][ZON-Z3-230] zone.Z3.code = Z3.
[STATE][ZON-Z3-231] zone.Z3.name = industrial_recycling_hazardous_materials.
[STATE][ZON-Z3-232] zone.Z3.purpose = {
  toxicity_and_hazard_processes,
  critical_materials_handling,
  safety_and_licensing_regimes,
  trade_secret_process_protection
}.
[STATE][ZON-Z3-233] zone.Z3.regime_features = {
  reinforced_sanitary_and_technical_protocols,
  restrictions_on_photo_scan_sample_export,
  lab_admissibility_dependency
}.
[STATE][ZON-Z3-234] zone.Z3.liability_gaps = {
  documentation_says_normal_field_says_not,
  responsibility_smear_between_ecology_safety_contracting
}.

[STATE][ZON-Z4-240] zone.Z4.code = Z4.
[STATE][ZON-Z4-241] zone.Z4.name = exception_sandbox_accelerated_mode.
[STATE][ZON-Z4-242] zone.Z4.purpose = {accelerated_programs_and_pilots, experimental_operation_regimes, legal_exceptions_for_innovation}.
[STATE][ZON-Z4-243] zone.Z4.regime_features = {
  highest_density_of_exceptions,
  harder_state_access_due_to_JAP_arbitration_nda,
  high_kpi_optimization_harshness_probability
}.
[STATE][ZON-Z4-244] zone.Z4.liability_gaps = {temporary_exception_becomes_permanent, top_level_reporting_aggregates_human_cost_out}.

---

### 5. Access mechanics (state-level)

[STATE][ZON-ACC-300] default_entry_model = order_plus_JAP_if_required.
[STATE][ZON-ACC-301] osa_behavior_in_zone_expectations = {
  minimize_intervention_until_sufficient_evidence,
  actions_must_be_auditable,
  enforce_chain_of_custody_and_zone_admissibility
}.
[STATE][ZON-ACC-320] typical_zone_resistance = {
  wrong_order_wrong_jurisdiction_wrong_window,
  sla_delays,
  approval_time_drains,
  filtered_exports_aggregates_only,
  nda_pressure_ip_leak_threat
}.
[STATE][ZON-ACC-321] osa_escalation_ladder = {DPO, ISO, SO, TSRO_or_Enforce}.
[STATE][ZON-ACC-340] emergency_entry_condition = immediate_harm_threat_to_humans_or_critical_infrastructure.
[STATE][ZON-ACC-341] emergency_procedure_mode = strengthened_not_cancelled.
[STATE][ZON-ACC-342] emergency_requires = {post_report, proportionality_review, arbitration}.

---

### 6. Arbitration loops (state description)

[STATE][ZON-ARB-400] arbitration_is_primary_viscosity_mechanism = true.
[STATE][ZON-ARB-401] arbitration_modes_supported = {state_arbitration, mixed_contract_arbitration}.
[STATE][ZON-ARB-402] typical_arbitration_outcomes = {limit_perimeter, delay_access, mandate_audit, appoint_observer}.

---

### 7. Narrative manifestation expectations (state cues)

[STATE][ZON-NAR-500] zone_scene_effects = {
  access_delay_time_is_enemy,
  observability_limit_blind_spot,
  jurisdiction_conflict_who_signs,
  liability_isolation_contract_ghosts,
  procedurally_valid_human_cost
}.
[STATE][ZON-NAR-501] zone_appearance = normal.
[STATE][ZON-NAR-502] zone_threat_source = procedure_not_atmosphere.

---

### 8. Future hooks (inactive in this book)

[STATE][ZON-FUT-600] future_hooks_possible = {
  expanded_osa_powers,
  external_actors_attack_infra_via_zones,
  supply_chain_component_substitution_attacks
}.
[STATE][ZON-FUT-601] interstate_driver_active_in_current_book = false.

---

## USAGE / RESOLUTION

[DECISION][ZON-USE-010] Документ используется как STATE-основание для зон в сценах и планах.
[DECISION][ZON-USE-011] Procedural rule enforcement MUST be sourced from RULE documents (e.g., CANON-ORDERS-0003, CANON-REPORTS-0006).
[DECISION][ZON-USE-012] Conflict resolution MUST follow SPEC-PRIORITY-RESOLUTION-2215-0001.

---

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-ZONES-0004
role_type: STATE
export:
  zone_types: [Z1, Z2, Z3, Z4]
  default_entry_model: order_plus_JAP_if_required
  escalation_ladder: [DPO, ISO, SO, TSRO_or_Enforce]
  arbitration_modes: [state_arbitration, mixed_contract_arbitration]
  evidence_export_formula: order_fixation_custody_legalization
~~~

---

## FORBIDDEN

[FORBIDDEN][ZON-FBD-900] Treating extraterritory as lawless space.
[FORBIDDEN][ZON-FBD-901] Treating zones as everyday normality everywhere.
[FORBIDDEN][ZON-FBD-902] Introducing new SSOT metrics or changing world baselines here.
[FORBIDDEN][ZON-FBD-903] Using secret_city trope as primary explanation.

---

## UNKNOWN

[UNKNOWN][ZON-UNK-800] Nearest-to-Chelny plausible instance placement for Z1/Z2/Z4.
[UNKNOWN][ZON-UNK-801] Regime holders for key zones (operator/consortium names).
[UNKNOWN][ZON-UNK-802] JAP activation threshold: which order classes require joint access vs solo OSA entry.

---

## NON-NORMATIVE

(Empty by design)
