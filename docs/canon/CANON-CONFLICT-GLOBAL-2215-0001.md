---
id: CANON-CONFLICT-GLOBAL-2215-0001
title: >
  Canon Conflict — Optimization Loop, Extraterritories, Supply Chains, Legal Void (2215)
class: canon
status: fixed
version: 1.1.0
inputs: []
depends_on:
  - SPEC-DOC-STYLE-2215-0001
  - CANON-CORE-GLOBAL-2215-0001
  - CANON-SYSTEMS-GLOBAL-2215-0001
  - CANON-ORDERS-GLOBAL-2215-0003
scope: >
  Формализация центрального конфликта романа как системной функции:
  тип антагониста, измеримые ставки, рычаг протагониста, модель
  сопротивления системы и структура эскалации через 3–5 кейсов.
  Включает типологию инцидентов (в т.ч. Priority Paradox).
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: conflict definition + escalation grammar (not scenes)
INPUTS: [CANON-CORE-GLOBAL-2215-0001]
OUTPUTS: [conflict_layers, escalation_structure]
FORBIDDEN: [world_parameter_binding, baseline_defaults, causal_chain_markup_in_canon, technobabble, villain_personification]

## DEFINITIONS

[FACT][CNF-DEF-010] Antagonist = System Function (Optimization), not a person.
[FACT][CNF-DEF-011] Priority Paradox (The Glitch) = Situation where two valid algorithms contradict, requiring human override.

## INVARIANTS

[DECISION][CNF-INV-000] Антагонист по умолчанию = системная функция, а не “харизматичный злодей”.
[DECISION][CNF-INV-001] Конфликт процедурно-измерим: человеческая цена и инфраструктурный ущерб проявляются через артефакты.
[DECISION][CNF-INV-002] Экстерритория создаёт фильтры и задержки, но не “вне закона”.
[DECISION][CNF-INV-003] Манипуляция цепочками поставок и режимами доступа — основной канал давления.
[DECISION][CNF-INV-004] “Юридическая пустота” допустима: вред реален, но виновный формально размывается.
[DECISION][CNF-INV-005] Никакой апокалиптики: кризисы локально катастрофичны, но управляемы при цене ресурсов.
[DECISION][CNF-INV-006] Победа протагониста = доказательство + коррекция режима, а не силовое превосходство.

## CONTENT

### 1. Antagonist Model (System Function)

[STATE][CNF-010] antagonist_mode = institutional_algorithmic_optimization_loop.
[STATE][CNF-011] antagonist_components = [kpi_metrics, operator_decisioning, extraterritorial_regimes, liability_isolation].
[RULE][CNF-012] Individuals ARE local agents, NOT root causes.

### 2. Scale and Stakes (Measurable)

[STATE][CNF-020] scale_progression = [regional_start, federal_expansion, cross_border_implications].
[NOTE][CNF-021] Cross-border manifests via standards/trade/insurance (no supra-state force).

[STATE][CNF-030] stakes_are_procedural_and_measurable = true.
[STATE][CNF-031] stake_dimensions = [human_cost, infra_resilience, state_legitimacy, license_loss, insurance_impact].
[CONSTRAINT][CNF-032] no_world_collapse = true.

### 3. Four Conflict Layers (all active)

#### Layer 1 — Algorithmic optimization produces diffuse harm
[STATE][CNF-100] layer_1 = algorithmic_optimization_diffuse_harm.
[RULE][CNF-101] harm_can_be_legal_and_technical = true.
[RULE][CNF-102] typical_effects = [service_degradation, rerouting, priority_drops].
[RULE][CNF-103] Specific Case: Priority Paradox (The Glitch).
[RULE][CNF-104] Paradox Mechanism: Valid Algorithm A (Sanitation) vs Valid Algorithm B (Preservation) = Destructive Loop.

#### Layer 2 — Extraterritory as deviation container
[STATE][CNF-110] layer_2 = extraterritory_as_operational_stage.
[RULE][CNF-111] deviations_concentrate_in_special_modes = true.
[RULE][CNF-112] osa_access_is_harder_by_default = true.

#### Layer 3 — Supply chains as pressure weapon
[STATE][CNF-120] layer_3 = supply_chain_pressure.
[RULE][CNF-121] manipulation_is_formally_market_logistics = true.
[STATE][CNF-122] pressure_resources = [energy_storage, medical_reagents, grid_components, rare_materials].

#### Layer 4 — Legal void of responsibility
[STATE][CNF-130] layer_4 = liability_dissolution_legal_void.
[STATE][CNF-131] liability_smearing = [ai_recommendation, human_signatory, contractor, subcontractor, shell_entities].
[RULE][CNF-132] real_damage_can_exist_without_single_punishable_cause = true.

### 4. Protagonist and Leverage (No superheroism)

[STATE][CNF-200] protagonist_org = OSA.
[STATE][CNF-201] team_profile = {size: 5-6, narrative_ratio: 60_procedure_40_operation, includes_operator_liaison: true}.

[STATE][CNF-210] leverage = protocol_operator.
[STATE][CNF-211] leverage_capabilities = [bind_telemetry_to_event, surface_exception_loops, forced_access_seizure, convert_tech_to_admissible].
[CONSTRAINT][CNF-212] victory_is_evidence_and_regime_change = true.
[CONSTRAINT][CNF-213] force_is_entry_tool_not_solution = true.

### 5. Human Antagonists (Local agents)

[STATE][CNF-300] human_antagonist_types = [metric_gamers, corporate_security, dirty_operators, rare_saboteurs].
[RULE][CNF-301] motives_are_rational = [money, fear, status, ideology].
[FORBIDDEN][CNF-302] caricature_monologues = true.

### 6. System Resistance Model (Why the system fights back)

[STATE][CNF-400] resistance_is_risk_minimization_not_evil = true.
[STATE][CNF-401] resistance_layers = [inertia_procedural_delays, political_self_preservation, corporate_defense_lawyers, human_fear].

### 7. Escalation Structure (3–5 cases)

[RULE][CNF-500] case_count_range = [3, 5].
[STATE][CNF-501] escalation_goal = reveal_all_4_layers_and_converge.

[STATE][CNF-510] canonical_case_sequence = [
  {case: 1, location: "Chelny", reveals: ["layer_1", "priority_paradox"], surface_form: "anomaly_stats_plus_victims"},
  {case: 2, location: "Chelny_or_region", reveals: ["layer_3"], surface_form: "resource_reroute_deficit_pressure"},
  {case: 3, location: "exterritory", reveals: ["layer_2"], surface_form: "access_denial_and_delay_filters"},
  {case: 4, location: "legal_regulatory", reveals: ["layer_4"], surface_form: "punishment_attempt_fails_by_contract_ghosts"},
  {case: 5, location: "final", reveals: ["layers_1_2_3_4"], surface_form: "procedural_dilemma_partial_system_change_compromise"}
]

[CONSTRAINT][CNF-511] finale_must_be_procedurally_realistic = true.
[CONSTRAINT][CNF-512] change_is_partial_with_cost = true.

## USAGE / RESOLUTION

[DECISION][CNF-USE-010] Act I MUST use Layer 1 (Priority Paradox) as the inciting incident.
[DECISION][CNF-USE-011] The escalation sequence guides the transition from "Bug Hunt" to "System Audit".

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-CONFLICT-GLOBAL-2215-0001
role_type: RULE
export:
  - rule_id: CNF-104
    intent: define priority paradox mechanism
    inputs: [algo_A, algo_B]
    outputs: [destructive_loop]
  - rule_id: CNF-510
    intent: define escalation path
    outputs: [case_sequence]
~~~

## FORBIDDEN

[FORBIDDEN][CNF-900] Personifying the antagonist as an "Evil AI".
[FORBIDDEN][CNF-901] Solving conflicts by simply "shooting the bad guy".
[FORBIDDEN][CNF-902] Apocalyptic scales (saving the whole world).
[FORBIDDEN][CNF-903] Embedding causal chains in this CANON.