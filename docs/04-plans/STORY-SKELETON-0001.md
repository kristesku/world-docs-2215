---
id: STORY-SKELETON-0001
title: >
  Сюжетный каркас романа — 5 актов, 3 больших кейса, процедурная спираль ОСА
class: plan
status: fixed
version: 0.2.0
inputs:
  - CANON-BASE-0001
  - CANON-CONFLICT-0001
  - CANON-SYSTEMS-0001
depends_on:
  - SPEC-PRIORITY-RESOLUTION-2215-0001
  - CANON-BASE-0001
  - CANON-CONFLICT-0001
  - CANON-SYSTEMS-0001
  - CANON-CAST-0001
  - CANON-REPORTS-0006
  - CANON-SYSTEM-VOICE-0001
scope: >
  PLAN-макроструктура романа 2215: акты/кейсы/переломы/главы и обязательные
  процедурные теги сцен/глав. Без художественного текста и без SSOT-метрик.
---

## LLM-INTENT

ROLE_TYPE: PLAN
SCOPE: define enforceable story structure (acts/cases/chapters/tags) without prose; supports deterministic scene authoring
INPUTS:
  - CANON-BASE-0001
  - CANON-CONFLICT-0001
  - CANON-SYSTEMS-0001
  - CANON-CAST-0001
  - CANON-REPORTS-0006
  - CANON-SYSTEM-VOICE-0001
OUTPUTS:
  - act_case_structure
  - procedural_spiral_pattern
  - chapter_tags_contract
FORBIDDEN:
  - fiction_prose
  - invent_new_world_metrics
  - introduce_new_roles
  - vague_softeners

---

## DEFINITIONS

[FACT][SSK-DEF-010] act = верхний структурный блок романа (I..V).
[FACT][SSK-DEF-011] case = крупный процедурный кейс, проходящий через главы и артефакты ОСА.
[FACT][SSK-DEF-012] procedural_spiral = паттерн эскалации: сигнал → доказательства → процедурная стенка → расширение юрисдикции → коррекция режима.
[FACT][SSK-DEF-013] scene_tags = минимальные теги главы: Participants, Focus, Artifact.
[FACT][SSK-DEF-014] artifact_types = {CD, EL, CM, FM, RP, PRS}.

---

## INVARIANTS

[DECISION][SSK-INV-010] Роман MUST состоять из 5 актов.
[DECISION][SSK-INV-011] Роман MUST содержать 3 больших кейса.
[DECISION][SSK-INV-012] Фокус MUST быть ансамблевым: лидер + 1–2 профильных специалиста активно в сцене.
[DECISION][SSK-INV-013] Баланс MUST быть: процедура/анализ = 0.60, операция/экшен = 0.40.
[DECISION][SSK-INV-014] Экшен MUST иметь пики в актах II–III (основные) и V (коррекция/выполнение).
[DECISION][SSK-INV-015] Юрисдикция MUST быть задана так: ОСА = федеральная структура прямого подчинения (Москва); региональные власти MUST NOT быть начальством ОСА.
[DECISION][SSK-INV-016] Финал MUST быть частичной процедурной победой: режим скорректирован, мир не перевёрнут.
[DECISION][SSK-INV-017] Тон последней сцены MUST быть: cold_stability.
[DECISION][SSK-INV-018] Антагонист MUST быть контуром оптимизации (KPI/алгоритм/экстерритории/юридическая изоляция ответственности), а не «злодеем-центром».
[DECISION][SSK-INV-019] Драматургический дефицит MUST быть инфраструктурным (окна мощности, классы обеспечения, приоритеты контуров), а не бытовым выживанием.
[DECISION][SSK-INV-020] Движок романа MUST быть процедурной эскалацией, а не «поимкой злодея».
[DECISION][SSK-INV-021] Системные вставки MAY использоваться ONLY IF они соответствуют CANON-SYSTEM-VOICE-0001 и не очеловечивают систему.

---

## CONTENT

### A. Макропараметры каркаса

[DECISION][SSK-100] acts.count = 5.
[DECISION][SSK-101] cases.count = 3.
[DECISION][SSK-102] focus.ensemble = true; scene.active_specialists.count ∈ [1, 2].
[DECISION][SSK-103] ratio.procedure = 0.60; ratio.operation = 0.40.
[DECISION][SSK-104] operation_peak.acts = [II, III, V]; operation_peak.primary = [II, III].
[DECISION][SSK-105] ending.type = partial_win; ending.world_state = stable_adjusted.
[DECISION][SSK-106] ending.tone = cold_stability.

---

### B. Procedural Spiral (канонический паттерн)

[DECISION][SSK-200] procedural_spiral.steps = [anomaly_detection, investigation, bureaucratic_wall, escalation, new_jurisdiction_level, remedy].
[DECISION][SSK-201] anomaly_detection MUST produce an initial EL item.
[DECISION][SSK-202] investigation MUST expand EL and start CM claims.
[DECISION][SSK-203] bureaucratic_wall MUST include access gating (orders, scope, window, JAP/arbitration gate where relevant).
[DECISION][SSK-204] escalation MUST change perimeter/jurisdiction via mandate/orders.
[DECISION][SSK-205] new_jurisdiction_level MUST enter a new contour (zone/federation/arbitration).
[DECISION][SSK-206] remedy MUST output RP (режимная коррекция), not “caught the villain”.

---

### C. Общая причинная рамка (уровень каркаса)

[DECISION][SSK-300] macro_frame.cause = optimization_by_KPI_under_fragmented_data.
[DECISION][SSK-301] macro_frame.mechanism = legally_valid_distributed_decisions_across_contracts.
[DECISION][SSK-302] macro_frame.consequence = human_cost_real_liability_diffused_OSA_changes_regime_not_personal_jail.

---

### D. Актовая структура (акты, кейсы, переломы, главы)

#### Act I — База / Наблюдение системы (Челны)

[DECISION][SSK-A1-010] act.I.function = show_world_via_procedure + launch_anomaly.
[DECISION][SSK-A1-020] case.1.title = "Энергия не сходится".
[DECISION][SSK-A1-021] case.1.goal = prove_repeatable_rule_not_local_failure.
[DECISION][SSK-A1-022] case.1.turning_point = confirm_repeatability_and_localize_to_system_level.
[DECISION][SSK-A1-030] act.I.turning_point = anomaly_requires_beyond_city_perimeter.

[DECISION][SSK-A1-C01] chapter.1.title = "Плановый аудит накопителей"; tags.participants = [Lev, Miron]; tags.focus = anomaly_detection; tags.artifact = EL(log_extract).
[DECISION][SSK-A1-C02] chapter.2.title = "Жалобы без причины"; tags.participants = [Damir, Miron]; tags.focus = ground_truth_sampling; tags.artifact = EL(witness_record).
[DECISION][SSK-A1-C03] chapter.3.title = "Низкий приоритет"; tags.participants = [Leysan, Lev]; tags.focus = service_class_downgrade_trace; tags.artifact = EL(policy_record).
[DECISION][SSK-A1-C04] chapter.4.title = "Логи ИИ"; tags.participants = [Lev]; tags.focus = observability_conflict; tags.artifact = EL(telemetry_conflict).
[DECISION][SSK-A1-C05] chapter.5.title = "Задержка доступа"; tags.participants = [Oskar, Leysan, Miron]; tags.focus = access_gating_and_wording; tags.artifact = EL(access_denied).
[DECISION][SSK-A1-C06] chapter.6.title = "Выезд на узел"; tags.participants = [Aidar, Damir, Miron]; tags.focus = field_intervention; tags.artifact = EL(detainment_report).
[DECISION][SSK-A1-C07] chapter.7.title = "Подписант"; tags.participants = [Leysan, Miron]; tags.focus = admissibility_framing; tags.artifact = CM(claim_set).
[DECISION][SSK-A1-C08] chapter.8.title = "Второй район"; tags.participants = [Damir, Lev]; tags.focus = replication_check; tags.artifact = EL(replication_log).
[DECISION][SSK-A1-C09] chapter.9.title = "Это правило"; tags.participants = [Miron, Lev, Leysan]; tags.focus = escalation_decision; tags.artifact = RP(escalation_request).

---

#### Act II — Материальный мир / Цепочки поставок

[DECISION][SSK-A2-010] act.II.function = make_conflict_physical_resources_as_power.
[DECISION][SSK-A2-020] case.2.title = "Пропавшие партии сенсоров".
[DECISION][SSK-A2-021] case.2.goal = show_observability_managed_by_supply_and_priorities.
[DECISION][SSK-A2-022] case.2.constraint = scarcity_is_administrative_legal_only.
[DECISION][SSK-A2-023] case.2.turning_point = trace_flows_to_special_zone_extraterritory.
[DECISION][SSK-A2-030] act.II.turning_point = portal_to_black_box_extraterritory_found.

[DECISION][SSK-A2-C01] chapter.1.title = "Несоответствие накладных"; tags.participants = [Lev, Damir]; tags.focus = forensic_reconciliation_wms_dispatch_vs_physical; tags.artifact = EL(invoice_recon_extract)+EL(stock_mismatch_log).
[DECISION][SSK-A2-C02] chapter.2.title = "Склад приоритетов"; tags.participants = [Lev, Oskar, Miron]; tags.focus = allocation_policy_trace_service_class_quotas_licensing_gates; tags.artifact = EL(policy_record)+EL(access_window_receipt).
[DECISION][SSK-A2-C03] chapter.3.title = "Логист"; tags.participants = [Damir, Leysan]; tags.focus = procedural_interview_plus_admissibility_framing; tags.artifact = EL(witness_record)+CM(claim_administrative_scarcity).
[DECISION][SSK-A2-C04] chapter.4.title = "Перехват конвоя"; tags.participants = [Aidar, Miron, Damir]; tags.focus = interception_under_mandate_plus_chain_of_custody_start; tags.artifact = EL(interception_report)+EL(custody_seal_event).
[DECISION][SSK-A2-C05] chapter.5.title = "Маршрут"; tags.participants = [Lev, Miron, Oskar]; tags.focus = traceability_graph_route_contractor_regime_holder_interface; tags.artifact = EL(trace_graph_export)+CM(claim_set_operator_linkage).
[DECISION][SSK-A2-C06] chapter.6.title = "Не раскачивайте"; tags.participants = [Miron, Leysan, Oskar]; tags.focus = bureaucratic_wall_wording_jurisdiction_window_negotiation; tags.artifact = EL(access_denied)+EL(arbitration_gate_receipt).
[DECISION][SSK-A2-C07] chapter.7.title = "Карта стыков"; tags.participants = [Lev, Miron, Leysan]; tags.focus = dependency_map_to_escalation_threshold_decision; tags.artifact = CM(consolidated_claims)+RP(escalation_request_Z4_entry).

---

#### Act III — Экстерритория / Вход в чёрный ящик

[DECISION][SSK-A3-010] act.III.function = enter_accelerated_procedure_low_transparency_and_peak_operation.
[DECISION][SSK-A3-020] case.3.title = "Зона ускоренного режима".
[DECISION][SSK-A3-021] case.3.goal = obtain_primary_data_and_admissible_artifacts.
[DECISION][SSK-A3-022] case.3.turning_point = data_obtained_but_liability_not_fixed.
[DECISION][SSK-A3-030] act.III.turning_point = antagonist_confirmed_as_contour_without_criminal_center.

[DECISION][SSK-A3-C01] chapter.1.title = "Ордер"; tags.participants = [Leysan, Miron, Rinat]; tags.focus = warrant_drafting_scope_narrowing_admissibility_plan; tags.artifact = CD(order_rationale)+FM(entry_brief)+EL(mandate_refs_bundle).
[DECISION][SSK-A3-C02] chapter.2.title = "Корп-барьер"; tags.participants = [Oskar, Leysan, Miron]; tags.focus = access_denial_arbitration_gate_sla_delays_nda_pressure; tags.artifact = EL(access_denied_record)+EL(arbitration_gate_notice)+CD(delay_event).
[DECISION][SSK-A3-C03] chapter.3.title = "Компромисс входа"; tags.participants = [Leysan, Oskar, Miron]; tags.focus = jap_negotiation_windowed_access_export_rules; tags.artifact = EL(JAP_protocol)+EL(window_grant_receipt)+CD(terms_locked).
[DECISION][SSK-A3-C04] chapter.4.title = "Проникновение"; tags.participants = [Aidar, Miron, Oskar]; tags.focus = escorted_entry_perimeter_control_route_discipline; tags.artifact = CD(entry_timeline)+EL(access_badge_log)+EL(perimeter_status).
[DECISION][SSK-A3-C05] chapter.5.title = "Серверные"; tags.participants = [Lev, Aidar, Miron]; tags.focus = forensic_acquisition_snapshot_hash_sealing_under_time_window; tags.artifact = EL(log_bundle_primary)+EL(hash_manifest)+CD(seizure_event).
[DECISION][SSK-A3-C06] chapter.6.title = "Медконтур"; tags.participants = [MedSpec_external, Damir, Miron]; tags.focus = sterile_chain_triage_protocol_admissible_med_artifacts; tags.artifact = EL(med_chain_record)+EL(transport_protocol)+CD(med_scope_note).
[DECISION][SSK-A3-C07] chapter.7.title = "Эвакуация"; tags.participants = [Aidar, MedSpec_external, Damir, Miron]; tags.focus = evacuation_as_procedure_fast_vs_admissible_vs_safe; tags.artifact = EL(evac_log)+EL(custody_chain_med)+FM(immediate_risk_note).
[DECISION][SSK-A3-C08] chapter.8.title = "Dead-man switch"; tags.participants = [Lev, Oskar, Leysan, Miron]; tags.focus = integrity_failure_analysis_responsibility_isolation; tags.artifact = EL(tamper_suspected)+CM(claim_deadman_switch_mechanism)+CD(integrity_breach_event).
[DECISION][SSK-A3-C09] chapter.9.title = "Формально правы"; tags.participants = [Leysan, Miron, Lev, Oskar]; tags.focus = legal_but_lethal_closure_setup_act_IV_arbitration; tags.artifact = FM(pre_arbitration_findings)+CM(consolidated_claims_v1)+EL(contract_clauses_extract).

---

#### Act IV — Юридическая пустота / Философия через процедуру

[DECISION][SSK-A4-010] act.IV.function = show_limits_of_law_and_liability_translate_conflict_to_regulatory.
[DECISION][SSK-A4-020] act.IV.case = post_extraterritorial_causality_fixation_without_criminal_center.
[DECISION][SSK-A4-030] act.IV.turning_point = procedural_leverage_found_not_personal_guilt.

[DECISION][SSK-A4-C01] chapter.1.title = "Арбитраж"; tags.participants = [Leysan, Miron, Lev]; tags.focus = admissibility_testing_forum_selection; tags.artifact = CD(arbitration_strategy)+CM(causal_claim_matrix)+EL(admissibility_risks).
[DECISION][SSK-A4-C02] chapter.2.title = "Добросовестный подписант"; tags.participants = [Leysan, Oskar, Miron]; tags.focus = signature_trail_good_faith_liability_diffusion; tags.artifact = EL(signature_chain)+EL(policy_memos)+CM(good_faith_claim).
[DECISION][SSK-A4-C03] chapter.3.title = "Субподряд"; tags.participants = [Leysan, Lev]; tags.focus = spv_mapping_contract_layering_risk_isolation; tags.artifact = EL(SPV_registry_extract)+EL(contract_tree)+CD(risk_isolation_map).
[DECISION][SSK-A4-C04] chapter.4.title = "Штраф вместо вины"; tags.participants = [Rinat, Leysan, Miron]; tags.focus = penalty_calculus_vs_regime_correction_limits; tags.artifact = EL(penalty_notice)+FM(cost_absorption_note)+CD(enforcement_decision).
[DECISION][SSK-A4-C05] chapter.5.title = "Процедурный потолок"; tags.participants = [Rinat, Miron, Leysan]; tags.focus = procedural_pressure_budget_cap_admissibility_audit_injunction_risk; tags.artifact = EL(expediency_request)+EL(budget_limit_notice)+EL(audit_initiation_notice)+CD(case_throttling_decision).
[DECISION][SSK-A4-C06] chapter.6.title = "Внешний источник"; tags.participants = [Damir, Miron, Leysan]; tags.focus = safe_contact_credibility_vetting_leverage_extraction; tags.artifact = EL(source_dump)+CM(new_leverage_claim)+CD(source_risk_log).
[DECISION][SSK-A4-C07] chapter.7.title = "Точка раскола"; tags.participants = [Miron, Leysan, Lev, Damir, Rinat]; tags.focus = escalation_threshold_mandate_expansion_vs_institutional_survival; tags.artifact = FM(escalation_options)+CD(internal_dissent_record)+CM(decision_gate_v1).

---

#### Act V — Системная коррекция / Частичная победа

[DECISION][SSK-A5-010] act.V.function = perform_limited_realistic_regime_correction_and_procedural_fixation.
[DECISION][SSK-A5-020] act.V.turning_point = regime_corrected_fixed_residual_risk_remains.

[DECISION][SSK-A5-C01] chapter.1.title = "Приостановка режима"; tags.participants = [Leysan, Miron, Rinat, Oskar]; tags.focus = TSRO_trigger_proportionality_scope_sealing; tags.artifact = RP(TSRO_measure)+CD(TSRO_rationale)+EL(order_bundle).
[DECISION][SSK-A5-C02] chapter.2.title = "Принудительный аудит"; tags.participants = [Leysan, Lev, Rinat]; tags.focus = audit_initiation_evidence_sealing_audit_trail_hardening; tags.artifact = EL(audit_pack)+CD(audit_timeline)+CM(audit_claims).
[DECISION][SSK-A5-C03] chapter.3.title = "Операция на узлах"; tags.participants = [Aidar, Miron, Damir]; tags.focus = lawful_entry_perimeter_control_seizure_under_order; tags.artifact = CD(operation_log)+EL(seizure_items)+EL(chain_of_custody_events).
[DECISION][SSK-A5-C04] chapter.4.title = "Полупубличный отчёт"; tags.participants = [Rinat, Miron, Leysan]; tags.focus = disclosure_boundary_deterrence_signaling; tags.artifact = PRS(public_summary)+PRS(restricted_annex_refs)+FM(executive_summary).
[DECISION][SSK-A5-C05] chapter.5.title = "Коррекция KPI"; tags.participants = [Lev, Leysan, Oskar]; tags.focus = kpi_profile_rewrite_red_line_policy_verification_hooks; tags.artifact = RP(KPI_patch_measures)+CM(before_after_claims)+EL(policy_change_record).
[DECISION][SSK-A5-C06] chapter.6.title = "Лицензия урезана"; tags.participants = [Leysan, Rinat, Oskar]; tags.focus = license_trimming_compliance_gating_enforcement_without_collapse; tags.artifact = RP(license_conditions)+EL(license_notice)+FM(residual_risk_note).
[DECISION][SSK-A5-C07] chapter.7.title = "Эпилог: система работает"; tags.participants = [Damir, Miron]; tags.focus = consequence_visibility_partial_win_lock_moral_residue_no_lectures; tags.artifact = CD(case_close_note)+PRS(final_public_line)+CM(open_questions_remain).

---

### E. Распределение фокуса команды (по актам)

[DECISION][SSK-400] Miron MUST be active in all acts; peaks: II, III, V.
[DECISION][SSK-401] Lev MUST be active in acts I–III; focus: KPI/алгоритм/логи.
[DECISION][SSK-402] Aidar MUST have axis in acts II–III–V; focus: склады/конвои/узлы/периметр.
[DECISION][SSK-403] Leysan MUST be active in acts III–V; focus: ордера/арбитраж/контракты/допустимость.
[DECISION][SSK-404] Oskar MUST appear in all acts; peak: III–IV; MUST NOT participate in force actions.
[DECISION][SSK-405] External medical specialist MUST appear in Act III for medical contour scenes; functional role only.

---

### F. Тон и драматургические ограничения

[DECISION][SSK-500] Action scenes MUST be functional, short, physically correct, and consequence-bearing.
[DECISION][SSK-501] Philosophy MUST manifest via artifacts/procedure/liability limits; lecture monologues MUST NOT be primary vehicle.
[DECISION][SSK-502] World MUST NOT be overturned; ending = regime correction + limited punishment.

---

## USAGE / RESOLUTION

[DECISION][SSK-USE-010] tags.participants MUST be selected from CANON-CAST-0001 (names and role constraints).
[DECISION][SSK-USE-011] tags.artifact MUST use artifact_types and subtypes; format constraints are CANON-REPORTS-0006 and CANON-ARTIFACT-SNIPPETS-0001.
[DECISION][SSK-USE-012] Any system insert MUST comply with CANON-SYSTEM-VOICE-0001.
[DECISION][SSK-USE-013] Any scene using zone/extraterritory/JAP MUST ground access via concrete order/mandate/artifact per CANON-ORDERS-0003 and CANON-SYSTEMS-0001.
[DECISION][SSK-USE-014] Any deviation from an INVARIANT MUST be handled via explicit override doc of higher priority; otherwise the chapter input is invalid.
[DECISION][SSK-USE-015] Conflict resolution MUST follow SPEC-PRIORITY-RESOLUTION-2215-0001.

---

## OUTPUT CONTRACT

~~~yaml
doc_id: STORY-SKELETON-0001
role_type: PLAN
export:
  - rule_id: SSK-INV-010
    intent: "Novel has exactly 5 acts"
    inputs: []
    outputs: [acts.count]
  - rule_id: SSK-INV-011
    intent: "Novel has exactly 3 big cases"
    inputs: []
    outputs: [cases.count]
  - rule_id: SSK-200
    intent: "Procedural spiral step sequence is fixed"
    inputs: []
    outputs: [procedural_spiral.steps]
  - rule_id: SSK-A1-020
    intent: "Case 1 title and goal are fixed"
    inputs: []
    outputs: [case.1.title, case.1.goal]
  - rule_id: SSK-A2-020
    intent: "Case 2 title and goal are fixed"
    inputs: []
    outputs: [case.2.title, case.2.goal]
  - rule_id: SSK-A3-020
    intent: "Case 3 title and goal are fixed"
    inputs: []
    outputs: [case.3.title, case.3.goal]
  - rule_id: SSK-USE-010
    intent: "Scene participants must be selected from CANON-CAST-0001"
    inputs: [scene.tags.participants]
    outputs: [scene.validity]
~~~

---

## FORBIDDEN

[FORBIDDEN][SSK-FBD-010] Художественный текст или атмосферные абзацы в этом документе.
[FORBIDDEN][SSK-FBD-011] Изменение числа актов или числа больших кейсов без override-документа.
[FORBIDDEN][SSK-FBD-012] Подмена процедурной эскалации «поимкой злодея» как основного двигателя.
[FORBIDDEN][SSK-FBD-013] Ввод новых регулярных ролей/персонажей вне CANON-CAST-0001 без CANON-расширения.
[FORBIDDEN][SSK-FBD-014] Системные вставки, нарушающие CANON-SYSTEM-VOICE-0001.
[FORBIDDEN][SSK-FBD-015] Добавление новых SSOT-метрик или макро-чисел.

---

## NON-NORMATIVE

(empty)
