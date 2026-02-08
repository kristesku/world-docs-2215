---
id: PLAN-STORY-2215-0001
title: >
  Сюжетный каркас романа — 5 актов, 3 больших кейса, процедурная спираль ОСА
class: plan
status: fixed
version: 0.2.2
prefix: PSSK
doc_language: ru-RU
prose_language: ru-RU
inputs:
  - CANON-ARTIFACT-SNIPPETS-GLOBAL-2215-0001
  - CANON-CAST-GLOBAL-2215-0001
  - CANON-CONFLICT-GLOBAL-2215-0001
  - CANON-ORDERS-GLOBAL-2215-0003
  - CANON-REPORTS-GLOBAL-2215-0006
  - CANON-SYSTEM-VOICE-GLOBAL-2215-0001
  - CANON-SYSTEMS-GLOBAL-2215-0001
depends_on:
  - SPEC-PRIORITY-RESOLUTION-2215-0001
  - SPEC-SCENE-CONTRACT-2215-0001
scope: >
  PLAN-макроструктура романа 2215: акты/кейсы/главы и обязательные
  процедурные теги глав. Без художественного текста и без SSOT-метрик.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: enforceable story structure (acts/cases/chapters/tags) without prose; supports deterministic chapter authoring
INPUTS: [CANON-ARTIFACT-SNIPPETS-GLOBAL-2215-0001, CANON-CAST-GLOBAL-2215-0001, CANON-CONFLICT-GLOBAL-2215-0001, CANON-ORDERS-GLOBAL-2215-0003, CANON-REPORTS-GLOBAL-2215-0006, CANON-SYSTEM-VOICE-GLOBAL-2215-0001, CANON-SYSTEMS-GLOBAL-2215-0001, SPEC-SCENE-CONTRACT-2215-0001, SPEC-PRIORITY-RESOLUTION-2215-0001]
OUTPUTS: [act_case_structure, procedural_spiral_pattern, chapter_tags_contract]
FORBIDDEN: [fiction_prose, invent_new_world_metrics, introduce_new_roles, lecture_exposition, softeners]

## DEFINITIONS

[FACT][PSSK-010] `act` = верхний структурный блок романа (I..V).
[FACT][PSSK-020] `case` = крупный процедурный кейс, проходящий через главы и артефакты ОСА.
[FACT][PSSK-030] `chapter_card` = запись {act_id, case_id, chapter_id, title, tags.participants, tags.focus, tags.artifact}.
[FACT][PSSK-040] `procedural_spiral_step` = {anomaly_detection, investigation, bureaucratic_wall, escalation, new_jurisdiction_level, remedy}.
[FACT][PSSK-050] `artifact_type` = {CD, EL, CM, FM, RP, PRS}.
[FACT][PSSK-060] `tags.focus` = доминантный `procedural_spiral_step` для главы.
[FACT][PSSK-070] `tags.participants` = список имён, допустимых только из `CANON-CAST-GLOBAL-2215-0001`.
[FACT][PSSK-080] `tags.artifact` = типизированная ссылка на артефакт (см. `CANON-REPORTS-GLOBAL-2215-0006` и `CANON-ARTIFACT-SNIPPETS-GLOBAL-2215-0001`).

[FACT][PSSK-090] `act_case_structure` = YAML-пейлоад (ключ верхнего уровня `act_case_structure`) в `## CONTENT`, являющийся единственным авторитетным источником структуры актов/кейсов/глав.
[FACT][PSSK-091] `acts` = `act_case_structure.acts` (list).
[FACT][PSSK-092] `acts.count` = len(`act_case_structure.acts`).
[FACT][PSSK-093] `cases` = множество всех `case_id`, извлечённых из `act_case_structure.acts[*].case.case_id`.
[FACT][PSSK-094] `cases.count` = cardinality(`cases`).

[FACT][PSSK-095] `chapter_cards` = все записи `act_case_structure.acts[*].chapters[*]` (с сохранением `act_id` как контекста).
[FACT][PSSK-096] `chapter_cards.count` = сумма len(`act_case_structure.acts[i].chapters`) по всем актам.
[FACT][PSSK-097] `scene.active_specialists.count` = count(unique(`tags.participants`)) для каждой главы, где учитываются только участники, присутствующие в `tags.participants` этой главы.

[FACT][PSSK-098] `focus.ensemble` = булево требование, что множество значений `tags.focus` по всем главам покрывает ≥4 различных `procedural_spiral_step` и каждая из этих ≥4 встречается ≥2 раз.
[FACT][PSSK-190] `ratio.procedure` = 0.60 (нормативный параметр композиции; не вычисляется из пейлоада).
[FACT][PSSK-191] `ratio.operation` = 0.40 (нормативный параметр композиции; не вычисляется из пейлоада).

[FACT][PSSK-101] `operation_peak.acts` = [II,III,V] (нормативный список актов с пиком операций).
[FACT][PSSK-102] `operation_peak.primary` = [II,III] (нормативный список первичных актов пика операций).

[FACT][PSSK-103] `ending.type` = partial_win (нормативный токен типа финала).
[FACT][PSSK-104] `ending.world_state` = stable_adjusted (нормативный токен состояния мира в финале).
[FACT][PSSK-105] `ending.tone` = cold_stability (нормативный токен тона финала).

[FACT][PSSK-106] `OSA.jurisdiction` = federal_direct_subordination_moscow (нормативный токен юрисдикции ОСА).
[FACT][PSSK-107] `regional_authorities_must_not_command_OSA` = true (нормативный запрет командования ОСА региональными органами).

[FACT][PSSK-108] `antagonist_form` = optimization_contour_not_person (нормативный токен формы антагониста).
[FACT][PSSK-109] `dramaturgic_deficit` = infrastructure_windows_not_survival_poverty (нормативный токен дефицита драматургии).
[FACT][PSSK-110] `engine_of_plot` = procedural_escalation_not_catch_villain (нормативный токен двигателя сюжета).

[FACT][PSSK-111] `system_inserts` = вставки “системного голоса” в главы (формат и допустимость задаёт `CANON-SYSTEM-VOICE-GLOBAL-2215-0001`).

[FACT][PSSK-112] `macro_frame` = триплет причинности {cause, mechanism, consequence}, заданный в `## CONTENT` как токены.
[FACT][PSSK-113] `complies_with(X)` = предикат: все требования документа X, применимые к объекту проверки, удовлетворены; иначе FAIL.
[FACT][PSSK-114] `grounded_via(A,B)` = предикат: термин/режим/зона упомянуты только если их определение/правовой якорь присутствует в документах A и B; иначе FAIL.

## INVARIANTS

[DECISION][PSSK-118] acts.count MUST be 5; ELSE FAIL.
[DECISION][PSSK-119] cases.count MUST be 3; ELSE FAIL.
[DECISION][PSSK-120] focus.ensemble MUST be true; ELSE FAIL.
[DECISION][PSSK-121] For every chapter, scene.active_specialists.count MUST be in [1,2]; ELSE FAIL.
[DECISION][PSSK-130] ratio.procedure MUST be 0.60; ELSE FAIL.
[DECISION][PSSK-131] ratio.operation MUST be 0.40; ELSE FAIL.
[DECISION][PSSK-140] operation_peak.acts MUST equal [II,III,V]; ELSE FAIL.
[DECISION][PSSK-141] operation_peak.primary MUST equal [II,III]; ELSE FAIL.
[DECISION][PSSK-150] ending.type MUST be partial_win; ELSE FAIL.
[DECISION][PSSK-151] ending.world_state MUST be stable_adjusted; ELSE FAIL.
[DECISION][PSSK-152] ending.tone MUST be cold_stability; ELSE FAIL.
[DECISION][PSSK-160] OSA.jurisdiction MUST be federal_direct_subordination_moscow; ELSE FAIL.
[DECISION][PSSK-161] regional_authorities_must_not_command_OSA MUST be true; ELSE FAIL.
[DECISION][PSSK-170] antagonist_form MUST be optimization_contour_not_person; ELSE FAIL.
[DECISION][PSSK-171] dramaturgic_deficit MUST be infrastructure_windows_not_survival_poverty; ELSE FAIL.
[DECISION][PSSK-172] engine_of_plot MUST be procedural_escalation_not_catch_villain; ELSE FAIL.
[DECISION][PSSK-180] system_inserts MUST comply_with CANON-SYSTEM-VOICE-GLOBAL-2215-0001; ELSE FAIL.

## CONTENT

[DECISION][PSSK-200] procedural_spiral.steps MUST equal [anomaly_detection, investigation, bureaucratic_wall, escalation, new_jurisdiction_level, remedy]; ELSE FAIL.
[DECISION][PSSK-201] anomaly_detection MUST produce EL; ELSE FAIL.
[DECISION][PSSK-202] investigation MUST expand EL_and_start_CM; ELSE FAIL.
[DECISION][PSSK-203] bureaucratic_wall MUST include access_gating_orders_scope_window; ELSE FAIL.
[DECISION][PSSK-204] escalation MUST change perimeter_or_jurisdiction_via_mandate_or_order; ELSE FAIL.
[DECISION][PSSK-205] new_jurisdiction_level MUST enter new_contour_zone_or_federation_or_arbitration; ELSE FAIL.
[DECISION][PSSK-206] remedy MUST output RP_regime_correction; ELSE FAIL.

[DECISION][PSSK-220] macro_frame.cause MUST be optimization_by_KPI_under_fragmented_data; ELSE FAIL.
[DECISION][PSSK-221] macro_frame.mechanism MUST be legally_valid_distributed_decisions_across_contracts; ELSE FAIL.
[DECISION][PSSK-222] macro_frame.consequence MUST be human_cost_liability_diffused_OSA_changes_regime; ELSE FAIL.

[DECISION][PSSK-300] act_case_structure MUST be encoded by the YAML block in this section; ELSE FAIL.
[DECISION][PSSK-301] chapter_card.tags.focus MUST be exactly one procedural_spiral_step per chapter; ELSE FAIL.
[DECISION][PSSK-302] chapter_card.tags.artifact MUST use artifact_type set; ELSE FAIL.

~~~yaml
act_case_structure:
  acts:
    - act_id: I
      function: show_world_via_procedure_and_launch_anomaly
      case:
        case_id: 1
        title: "Энергия не сходится"
        goal: prove_repeatable_rule_not_local_failure
        turning_point: confirm_repeatability_and_localize_to_system_level
      act_turning_point: anomaly_requires_beyond_city_perimeter
      chapters:
        - chapter_id: A1-C01
          title: "Плановый аудит накопителей"
          tags:
            participants: [Lev, Miron]
            focus: anomaly_detection
            artifact: "EL(log_extract)"
        - chapter_id: A1-C02
          title: "Жалобы без причины"
          tags:
            participants: [Damir, Miron]
            focus: anomaly_detection
            artifact: "EL(witness_record)"
        - chapter_id: A1-C03
          title: "Низкий приоритет"
          tags:
            participants: [Leysan, Lev]
            focus: investigation
            artifact: "EL(policy_record)"
        - chapter_id: A1-C04
          title: "Логи ИИ"
          tags:
            participants: [Lev]
            focus: investigation
            artifact: "EL(telemetry_conflict)"
        - chapter_id: A1-C05
          title: "Задержка доступа"
          tags:
            participants: [Oskar, Leysan, Miron]
            focus: bureaucratic_wall
            artifact: "EL(access_denied)"
        - chapter_id: A1-C06
          title: "Выезд на узел"
          tags:
            participants: [Aidar, Damir, Miron]
            focus: escalation
            artifact: "EL(detainment_report)"
        - chapter_id: A1-C07
          title: "Подписант"
          tags:
            participants: [Leysan, Miron]
            focus: investigation
            artifact: "CM(claim_set)"
        - chapter_id: A1-C08
          title: "Второй район"
          tags:
            participants: [Damir, Lev]
            focus: investigation
            artifact: "EL(replication_log)"
        - chapter_id: A1-C09
          title: "Это правило"
          tags:
            participants: [Miron, Lev, Leysan]
            focus: escalation
            artifact: "RP(escalation_request)"

    - act_id: II
      function: make_conflict_physical_resources_as_power
      case:
        case_id: 2
        title: "Пропавшие партии сенсоров"
        goal: show_observability_managed_by_supply_and_priorities
        constraint: scarcity_is_administrative_legal_only
        turning_point: trace_flows_to_special_zone_extraterritory
      act_turning_point: gateway_to_black_box_extraterritory_found
      chapters:
        - chapter_id: A2-C01
          title: "Несоответствие накладных"
          tags:
            participants: [Lev, Damir]
            focus: investigation
            artifact: "EL(invoice_recon_extract)+EL(stock_mismatch_log)"
        - chapter_id: A2-C02
          title: "Склад приоритетов"
          tags:
            participants: [Lev, Oskar, Miron]
            focus: bureaucratic_wall
            artifact: "EL(policy_record)+EL(access_window_receipt)"
        - chapter_id: A2-C03
          title: "Логист"
          tags:
            participants: [Damir, Leysan]
            focus: investigation
            artifact: "EL(witness_record)+CM(claim_administrative_scarcity)"
        - chapter_id: A2-C04
          title: "Перехват конвоя"
          tags:
            participants: [Aidar, Miron, Damir]
            focus: escalation
            artifact: "EL(interception_report)+EL(custody_seal_event)"
        - chapter_id: A2-C05
          title: "Маршрут"
          tags:
            participants: [Lev, Miron, Oskar]
            focus: investigation
            artifact: "EL(trace_graph_export)+CM(claim_set_operator_linkage)"
        - chapter_id: A2-C06
          title: "Не раскачивайте"
          tags:
            participants: [Miron, Leysan, Oskar]
            focus: bureaucratic_wall
            artifact: "EL(access_denied)+EL(arbitration_gate_receipt)"
        - chapter_id: A2-C07
          title: "Карта стыков"
          tags:
            participants: [Lev, Miron, Leysan]
            focus: escalation
            artifact: "CM(consolidated_claims)+RP(escalation_request_Z4_entry)"

    - act_id: III
      function: enter_accelerated_procedure_low_transparency_and_peak_operation
      case:
        case_id: 3
        title: "Зона ускоренного режима"
        goal: obtain_primary_data_and_admissible_artifacts
        turning_point: data_obtained_but_liability_not_fixed
      act_turning_point: antagonist_confirmed_as_contour_without_criminal_center
      chapters:
        - chapter_id: A3-C01
          title: "Ордер"
          tags:
            participants: [Leysan, Miron, Rinat]
            focus: bureaucratic_wall
            artifact: "CD(order_rationale)+FM(entry_brief)+EL(mandate_refs_bundle)"
        - chapter_id: A3-C02
          title: "Корп-барьер"
          tags:
            participants: [Oskar, Leysan, Miron]
            focus: bureaucratic_wall
            artifact: "EL(access_denied_record)+EL(arbitration_gate_notice)+CD(delay_event)"
        - chapter_id: A3-C03
          title: "Компромисс входа"
          tags:
            participants: [Leysan, Oskar, Miron]
            focus: bureaucratic_wall
            artifact: "EL(JAP_protocol)+EL(window_grant_receipt)+CD(terms_locked)"
        - chapter_id: A3-C04
          title: "Проникновение"
          tags:
            participants: [Aidar, Miron, Oskar]
            focus: escalation
            artifact: "CD(entry_timeline)+EL(access_badge_log)+EL(perimeter_status)"
        - chapter_id: A3-C05
          title: "Серверные"
          tags:
            participants: [Lev, Aidar, Miron]
            focus: investigation
            artifact: "EL(log_bundle_primary)+EL(hash_manifest)+CD(seizure_event)"
        - chapter_id: A3-C06
          title: "Медконтур"
          tags:
            participants: [MedSpec_external, Damir, Miron]
            focus: investigation
            artifact: "EL(med_chain_record)+EL(transport_protocol)+CD(med_scope_note)"
        - chapter_id: A3-C07
          title: "Эвакуация"
          tags:
            participants: [Aidar, MedSpec_external, Damir, Miron]
            focus: escalation
            artifact: "EL(evac_log)+EL(custody_chain_med)+FM(immediate_risk_note)"
        - chapter_id: A3-C08
          title: "Dead-man switch"
          tags:
            participants: [Lev, Oskar, Leysan, Miron]
            focus: investigation
            artifact: "EL(tamper_suspected)+CM(claim_deadman_switch_mechanism)+CD(integrity_breach_event)"
        - chapter_id: A3-C09
          title: "Формально правы"
          tags:
            participants: [Leysan, Miron, Lev, Oskar]
            focus: bureaucratic_wall
            artifact: "FM(pre_arbitration_findings)+CM(consolidated_claims_v1)+EL(contract_clauses_extract)"

    - act_id: IV
      function: show_limits_of_law_and_liability_translate_conflict_to_regulatory
      case:
        case_id: 3
        title: "Зона ускоренного режима"
        goal: causality_fixation_without_criminal_center
      act_turning_point: procedural_leverage_found_not_personal_guilt
      chapters:
        - chapter_id: A4-C01
          title: "Арбитраж"
          tags:
            participants: [Leysan, Miron, Lev]
            focus: bureaucratic_wall
            artifact: "CD(arbitration_strategy)+CM(causal_claim_matrix)+EL(admissibility_risks)"
        - chapter_id: A4-C02
          title: "Добросовестный подписант"
          tags:
            participants: [Leysan, Oskar, Miron]
            focus: investigation
            artifact: "EL(signature_chain)+EL(policy_memos)+CM(good_faith_claim)"
        - chapter_id: A4-C03
          title: "Субподряд"
          tags:
            participants: [Leysan, Lev]
            focus: investigation
            artifact: "EL(SPV_registry_extract)+EL(contract_tree)+CD(risk_isolation_map)"
        - chapter_id: A4-C04
          title: "Штраф вместо вины"
          tags:
            participants: [Rinat, Leysan, Miron]
            focus: remedy
            artifact: "EL(penalty_notice)+FM(cost_absorption_note)+CD(enforcement_decision)"
        - chapter_id: A4-C05
          title: "Процедурный потолок"
          tags:
            participants: [Rinat, Miron, Leysan]
            focus: bureaucratic_wall
            artifact: "EL(expediency_request)+EL(budget_limit_notice)+EL(audit_initiation_notice)+CD(case_throttling_decision)"
        - chapter_id: A4-C06
          title: "Внешний источник"
          tags:
            participants: [Damir, Miron, Leysan]
            focus: investigation
            artifact: "EL(source_dump)+CM(new_leverage_claim)+CD(source_risk_log)"
        - chapter_id: A4-C07
          title: "Точка раскола"
          tags:
            participants: [Miron, Leysan, Lev, Damir, Rinat]
            focus: escalation
            artifact: "FM(escalation_options)+CD(internal_dissent_record)+CM(decision_gate_v1)"

    - act_id: V
      function: perform_limited_realistic_regime_correction_and_procedural_fixation
      case:
        case_id: 3
        title: "Зона ускоренного режима"
        goal: regime_corrected_fixed_residual_risk_remains
      act_turning_point: regime_corrected_fixed_residual_risk_remains
      chapters:
        - chapter_id: A5-C01
          title: "Приостановка режима"
          tags:
            participants: [Leysan, Miron, Rinat, Oskar]
            focus: remedy
            artifact: "RP(TSRO_measure)+CD(TSRO_rationale)+EL(order_bundle)"
        - chapter_id: A5-C02
          title: "Принудительный аудит"
          tags:
            participants: [Leysan, Lev, Rinat]
            focus: remedy
            artifact: "EL(audit_pack)+CD(audit_timeline)+CM(audit_claims)"
        - chapter_id: A5-C03
          title: "Операция на узлах"
          tags:
            participants: [Aidar, Miron, Damir]
            focus: escalation
            artifact: "CD(operation_log)+EL(seizure_items)+EL(chain_of_custody_events)"
        - chapter_id: A5-C04
          title: "Полупубличный отчёт"
          tags:
            participants: [Rinat, Miron, Leysan]
            focus: remedy
            artifact: "PRS(public_summary)+PRS(restricted_annex_refs)+FM(executive_summary)"
        - chapter_id: A5-C05
          title: "Коррекция KPI"
          tags:
            participants: [Lev, Leysan, Oskar]
            focus: remedy
            artifact: "RP(KPI_patch_measures)+CM(before_after_claims)+EL(policy_change_record)"
        - chapter_id: A5-C06
          title: "Лицензия урезана"
          tags:
            participants: [Leysan, Rinat, Oskar]
            focus: remedy
            artifact: "RP(license_conditions)+EL(license_notice)+FM(residual_risk_note)"
        - chapter_id: A5-C07
          title: "Эпилог: система работает"
          tags:
            participants: [Damir, Miron]
            focus: remedy
            artifact: "CD(case_close_note)+PRS(final_public_line)+CM(open_questions_remain)"

team_focus_by_act:
  - rule: "Miron active in all acts; peaks II, III, V"
  - rule: "Lev active acts I–III; focus KPI/algorithm/logs"
  - rule: "Aidar axis II–III–V; focus warehouses/convoys/nodes/perimeter"
  - rule: "Leysan active III–V; focus orders/arbitration/contracts/admissibility"
  - rule: "Oskar appears all acts; peak III–IV; forbidden in force actions"
  - rule: "External medical specialist appears in Act III for medical contour; functional role only"
~~~

[DECISION][PSSK-320] tags.participants MUST be validated against CANON-CAST-GLOBAL-2215-0001; ELSE FAIL.
[DECISION][PSSK-321] tags.artifact MUST be validated against CANON-REPORTS-GLOBAL-2215-0006 and CANON-ARTIFACT-SNIPPETS-GLOBAL-2215-0001; ELSE FAIL.
[DECISION][PSSK-322] any_zone_extraterritory_JAP MUST be grounded via CANON-ORDERS-GLOBAL-2215-0003 and CANON-SYSTEMS-GLOBAL-2215-0001; ELSE FAIL.

## USAGE / RESOLUTION

[DECISION][PSSK-400] Consumers MUST treat act_case_structure YAML as the only authoritative payload of this document; ELSE FAIL.
[DECISION][PSSK-401] Conflict resolution MUST follow SPEC-PRIORITY-RESOLUTION-2215-0001; ELSE FAIL.
[DECISION][PSSK-402] Scene admissibility constraints MUST follow SPEC-SCENE-CONTRACT-2215-0001; ELSE FAIL.

## OUTPUT CONTRACT

~~~yaml
doc_id: PLAN-STORY-2215-0001
role_type: RULE
export:
  act_case_structure:
    encoding: yaml
    key: act_case_structure
    schema:
      acts:
        type: list
        item:
          act_id: {type: enum, values: ["I","II","III","IV","V"]}
          function: {type: token}
          case:
            type: object
            fields:
              case_id: {type: int}
              title: {type: string}
              goal: {type: token}
          chapters:
            type: list
            item:
              chapter_id: {type: token}
              title: {type: string}
              tags:
                type: object
                fields:
                  participants: {type: list, item: token, source: "CANON-CAST-GLOBAL-2215-0001"}
                  focus: {type: enum, values: ["anomaly_detection","investigation","bureaucratic_wall","escalation","new_jurisdiction_level","remedy"]}
                  artifact: {type: string, source: ["CANON-REPORTS-GLOBAL-2215-0006","CANON-ARTIFACT-SNIPPETS-GLOBAL-2215-0001"]}
  procedural_spiral_pattern:
    steps: ["anomaly_detection","investigation","bureaucratic_wall","escalation","new_jurisdiction_level","remedy"]
  chapter_tags_contract:
    participants_source: "CANON-CAST-GLOBAL-2215-0001"
    focus_enum: ["anomaly_detection","investigation","bureaucratic_wall","escalation","new_jurisdiction_level","remedy"]
    artifact_sources: ["CANON-REPORTS-GLOBAL-2215-0006","CANON-ARTIFACT-SNIPPETS-GLOBAL-2215-0001"]
~~~

## FORBIDDEN

[FORBIDDEN][PSSK-900] Any fiction prose in this document.
[FORBIDDEN][PSSK-901] Any new recurring roles not declared in CANON-CAST-GLOBAL-2215-0001.
[FORBIDDEN][PSSK-902] Any new world metrics or SSOT numbers.
[FORBIDDEN][PSSK-903] Any lecture exposition used as justification for structure.
[FORBIDDEN][PSSK-904] Any change to acts.count or cases.count without higher-priority override.

## NON-NORMATIVE
