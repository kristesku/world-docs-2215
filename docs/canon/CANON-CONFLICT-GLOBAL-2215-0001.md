---
id: CANON-CONFLICT-GLOBAL-2215-0001
title: >
  Canon Conflict — Optimization Loop, Extraterritories, Supply Chains, Legal Void (2215)
class: canon
status: fixed
version: 2.0.0
doc_language: en
prose_language: ru-RU
inputs: []
depends_on:
  - SPEC-DOC-STYLE-2215-0001
  - CANON-CORE-GLOBAL-2215-0001
  - CANON-SYSTEMS-GLOBAL-2215-0001
  - CANON-ORDERS-GLOBAL-2215-0003
scope: >
  Формализация центрального конфликта романа как системной функции:
  тип антагониста, измеримые ставки, рычаг протагониста, модель
  сопротивления системы и структура эскалации через 3 кейса / 4 слоя.
  Включает типологию инцидентов (в т.ч. Priority Paradox).
  Синхронизирован с PLAN-STORY-2215-0001 (3 кейса, 5 актов, 35 глав).
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: conflict definition + escalation grammar (not scenes)
INPUTS: [CANON-CORE-GLOBAL-2215-0001]
OUTPUTS: [conflict_layers, escalation_structure, case_layer_map]
FORBIDDEN: [world_parameter_binding, baseline_defaults, causal_chain_markup_in_canon, technobabble, villain_personification]

## DEFINITIONS

[FACT][CNF-DEF-010] Antagonist = System Function (Optimization), not a person.
[FACT][CNF-DEF-011] Priority Paradox (The Glitch) = Situation where two valid algorithms contradict, requiring human override.
[FACT][CNF-DEF-012] `system_agent` = человек, действующий как функция оптимизационного контура; не злодей, не заговорщик.
[FACT][CNF-DEF-013] `conflict_layer` ∈ {L1_algorithmic_harm, L2_extraterritory, L3_supply_chain, L4_legal_void}.
[FACT][CNF-DEF-014] `case` = процедурный кейс ОСА, раскрывающий один или несколько conflict_layer.
[FACT][CNF-DEF-015] `case_layer_map` = маппинг case_id → список conflict_layer, раскрываемых кейсом.

## INVARIANTS

[DECISION][CNF-INV-000] Антагонист по умолчанию = системная функция, а не «харизматичный злодей».
[DECISION][CNF-INV-001] Конфликт процедурно-измерим: человеческая цена и инфраструктурный ущерб проявляются через артефакты.
[DECISION][CNF-INV-002] Экстерритория создаёт фильтры и задержки, но не «вне закона».
[DECISION][CNF-INV-003] Манипуляция цепочками поставок и режимами доступа — основной канал давления.
[DECISION][CNF-INV-004] «Юридическая пустота» допустима: вред реален, но виновный формально размывается.
[DECISION][CNF-INV-005] Никакой апокалиптики: кризисы локально катастрофичны, но управляемы при цене ресурсов.
[DECISION][CNF-INV-006] Победа протагониста = доказательство + коррекция режима, а не силовое превосходство.
[DECISION][CNF-INV-007] Люди-агенты системы (Илья, оператор, подрядчики) — НЕ антагонисты. Они — функции контура, действующие рационально в рамках своих KPI и контрактов.

## CONTENT

### 1. Antagonist Model (System Function)

[STATE][CNF-010] antagonist_mode = institutional_algorithmic_optimization_loop.
[STATE][CNF-011] antagonist_components = [kpi_metrics, operator_decisioning, extraterritorial_regimes, liability_isolation].
[RULE][CNF-012] Individuals ARE local agents, NOT root causes.
[RULE][CNF-012a] `system_agent` characters MUST be depicted with rational motives and sincere beliefs (money, fear, status, ideology, genuine conviction in efficiency). Caricature monologues FORBIDDEN.

### 2. Scale and Stakes (Measurable)

[STATE][CNF-020] scale_progression = [regional_start, federal_expansion, cross_border_implications].
[NOTE][CNF-021] Cross-border manifests via standards/trade/insurance (no supra-state force).

[STATE][CNF-030] stakes_are_procedural_and_measurable = true.
[STATE][CNF-031] stake_dimensions = [human_cost, infra_resilience, state_legitimacy, license_loss, insurance_impact].
[CONSTRAINT][CNF-032] no_world_collapse = true.

### 3. Four Conflict Layers (all active)

#### Layer 1 — Algorithmic optimization produces diffuse harm (L1)
[STATE][CNF-100] layer_1 = L1_algorithmic_harm.
[RULE][CNF-101] harm_can_be_legal_and_technical = true.
[RULE][CNF-102] typical_effects = [service_degradation, rerouting, priority_drops].
[RULE][CNF-103] Specific Case: Priority Paradox (The Glitch).
[RULE][CNF-104] Paradox Mechanism: Valid Algorithm A (Sanitation) vs Valid Algorithm B (Preservation) = Destructive Loop.

#### Layer 2 — Extraterritory as deviation container (L2)
[STATE][CNF-110] layer_2 = L2_extraterritory.
[RULE][CNF-111] deviations_concentrate_in_special_modes = true.
[RULE][CNF-112] osa_access_is_harder_by_default = true.

#### Layer 3 — Supply chains as pressure weapon (L3)
[STATE][CNF-120] layer_3 = L3_supply_chain.
[RULE][CNF-121] manipulation_is_formally_market_logistics = true.
[STATE][CNF-122] pressure_resources = [energy_storage, medical_reagents, grid_components, rare_materials].

#### Layer 4 — Legal void of responsibility (L4)
[STATE][CNF-130] layer_4 = L4_legal_void.
[STATE][CNF-131] liability_smearing = [ai_recommendation, human_signatory, contractor, subcontractor, shell_entities].
[RULE][CNF-132] real_damage_can_exist_without_single_punishable_cause = true.

### 4. Protagonist and Leverage (No superheroism)

[STATE][CNF-200] protagonist_org = OSA.
[STATE][CNF-201] team_profile = {size: 7-9, narrative_ratio: 60_procedure_40_operation, includes_operator_liaison: true}.

[STATE][CNF-210] leverage = protocol_operator.
[STATE][CNF-211] leverage_capabilities = [bind_telemetry_to_event, surface_exception_loops, forced_access_seizure, convert_tech_to_admissible].
[CONSTRAINT][CNF-212] victory_is_evidence_and_regime_change = true.
[CONSTRAINT][CNF-213] force_is_entry_tool_not_solution = true.

### 5. Human System Agents (Local agents, not antagonists)

[STATE][CNF-300] human_agent_types = [metric_gamers, corporate_security, dirty_operators, rare_saboteurs, efficiency_directors].
[RULE][CNF-301] motives_are_rational = [money, fear, status, ideology, genuine_conviction].
[FORBIDDEN][CNF-302] caricature_monologues = true.
[RULE][CNF-303] system_agents MUST be shown as part of the optimization contour, not as independent villains.

### 6. System Resistance Model (Why the system fights back)

[STATE][CNF-400] resistance_is_risk_minimization_not_evil = true.
[STATE][CNF-401] resistance_layers = [inertia_procedural_delays, political_self_preservation, corporate_defense_lawyers, human_fear].

### 7. Escalation Structure (3 cases, 4 layers)

[RULE][CNF-500] case_count = 3.
[STATE][CNF-501] escalation_goal = reveal_all_4_layers_and_converge.

[STATE][CNF-510] case_layer_map:
  case_1:
    title: "Энергия не сходится"
    acts: [I]
    location: "Chelny"
    layers_revealed: [L1_algorithmic_harm, L3_supply_chain_surface]
    surface_form: "anomaly_stats_plus_victims_plus_external_trace"
    turning_point: "anomaly is repeatable and systemic; trail leads beyond city"

  case_2:
    title: "Пропавшие партии сенсоров"
    acts: [II]
    location: "Chelny_and_region"
    layers_revealed: [L3_supply_chain_deep, L2_extraterritory_gateway]
    surface_form: "resource_reroute_deficit_pressure_and_access_denial"
    turning_point: "trace flows to extraterritory; federal jurisdiction required"

  case_3:
    title: "Зона ускоренного режима"
    acts: [III, IV, V]
    location: "extraterritory_and_moscow_and_chelny"
    layers_revealed: [L2_extraterritory_deep, L4_legal_void, convergence_all_layers]
    surface_form: "procedural_entry_kpi_collision_legal_void_regime_correction"
    turning_point: "liability diffused; regime corrected via regulatory lever; partial win"

[CONSTRAINT][CNF-511] finale_must_be_procedurally_realistic = true.
[CONSTRAINT][CNF-512] change_is_partial_with_cost = true.

## USAGE / RESOLUTION

[DECISION][CNF-USE-010] Act I MUST use Layer 1 (Priority Paradox) as the inciting incident.
[DECISION][CNF-USE-011] The escalation sequence guides the transition from "Bug Hunt" to "System Audit".
[DECISION][CNF-USE-012] case_layer_map MUST be consistent with PLAN-STORY-2215-0001 act_case_structure; ELSE FAIL.

## OUTPUT CONTRACT

```yaml
doc_id: CANON-CONFLICT-GLOBAL-2215-0001
role_type: RULE
export:
  - rule_id: CNF-104
    intent: define priority paradox mechanism
    inputs: [algo_A, algo_B]
    outputs: [destructive_loop]
  - rule_id: CNF-510
    intent: define escalation path (3 cases, 4 layers)
    outputs: [case_layer_map]
  - rule_id: CNF-012a
    intent: system agents are not villains
    outputs: [agent_depiction_rule]
```

## FORBIDDEN

[FORBIDDEN][CNF-900] Personifying the antagonist as an "Evil AI" or "Evil CEO".
[FORBIDDEN][CNF-901] Solving conflicts by simply "shooting the bad guy".
[FORBIDDEN][CNF-902] Apocalyptic scales (saving the whole world).
[FORBIDDEN][CNF-903] Embedding causal chains in this CANON.
[FORBIDDEN][CNF-904] Labeling system_agents as "antagonists" or "villains" in metadata/tags.

## NON-NORMATIVE

```text
Previous version had 5 cases in canonical_case_sequence.
v2.0.0 consolidates to 3 cases matching PLAN-STORY structure:
  - Cases 1-2 each occupy one act
  - Case 3 spans three acts as the convergence case
The 4 conflict layers are preserved and mapped explicitly to cases.
```
