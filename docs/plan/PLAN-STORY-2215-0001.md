---
id: PLAN-STORY-2215-0001
title: >
  Сюжетный каркас романа — 5 актов, 3 кейса, 35 глав, процедурная спираль ФССУ
class: plan
status: fixed
version: 1.0.0
prefix: PSSK
doc_language: en
prose_language: ru-RU
inputs:
  - CANON-ARTIFACT-SNIPPETS-GLOBAL-2215-0001
  - CANON-CAST-GLOBAL-2215-0001
  - CANON-CONFLICT-GLOBAL-2215-0001
  - CANON-ORDERS-GLOBAL-2215-0003
  - CANON-REPORTS-GLOBAL-2215-0006
  - CANON-SYSTEM-VOICE-GLOBAL-2215-0001
  - CANON-SYSTEMS-GLOBAL-2215-0001
  - CANON-ARCS-GLOBAL-2215-0001
depends_on:
  - SPEC-PRIORITY-RESOLUTION-2215-0001
  - SPEC-SCENE-CONTRACT-2215-0001
scope: >
  PLAN-макроструктура романа 2215: акты/кейсы/главы и обязательные
  процедурные теги глав. Без художественного текста и без SSOT-метрик.
  Синхронизирован с SCENE-ACT-RU-2215-0001..0005 (source of truth для содержания сцен).
  Целевой объём: 400–450 страниц, 35 глав.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: enforceable story structure (acts/cases/chapters/tags) without prose; supports deterministic chapter authoring
INPUTS: [CANON-ARTIFACT-SNIPPETS-GLOBAL-2215-0001, CANON-CAST-GLOBAL-2215-0001, CANON-CONFLICT-GLOBAL-2215-0001, CANON-ORDERS-GLOBAL-2215-0003, CANON-REPORTS-GLOBAL-2215-0006, CANON-SYSTEM-VOICE-GLOBAL-2215-0001, CANON-SYSTEMS-GLOBAL-2215-0001, CANON-ARCS-GLOBAL-2215-0001, SPEC-SCENE-CONTRACT-2215-0001, SPEC-PRIORITY-RESOLUTION-2215-0001]
OUTPUTS: [act_case_structure, procedural_spiral_pattern, chapter_tags_contract]
FORBIDDEN: [fiction_prose, invent_new_world_metrics, introduce_new_roles, lecture_exposition, softeners]

## DEFINITIONS

[FACT][PSSK-010] `act` = верхний структурный блок романа (I..V).
[FACT][PSSK-020] `case` = крупный процедурный кейс, проходящий через главы и артефакты ФССУ.
[FACT][PSSK-030] `chapter_card` = запись {act_id, case_id, chapter_id, title, tags.participants, tags.focus, tags.artifact, tags.type}.
[FACT][PSSK-040] `procedural_spiral_step` = {anomaly_detection, investigation, bureaucratic_wall, escalation, new_jurisdiction_level, remedy}.
[FACT][PSSK-050] `artifact_type` = {CD, EL, CM, FM, RP, PRS}.
[FACT][PSSK-055] `chapter_type` ∈ {procedural, character_beat, interlude}. `procedural` = стандартная глава. `character_beat` = глава-якорь, фокус на персонаже за пределами процедуры. `interlude` = короткая вставка (POV антагониста-агента, город, пауза).
[FACT][PSSK-060] `tags.focus` = доминантный `procedural_spiral_step` для главы (для character_beat/interlude допустимо метафорическое соответствие).
[FACT][PSSK-070] `tags.participants` = список имён, допустимых только из `CANON-CAST_REGISTRY-GLOBAL-2215-0001`.
[FACT][PSSK-080] `tags.artifact` = типизированная ссылка на артефакт (см. `CANON-REPORTS-GLOBAL-2215-0006` и `CANON-ARTIFACT-SNIPPETS-GLOBAL-2215-0001`). Для character_beat допустимо `none`.

[FACT][PSSK-090] `act_case_structure` = YAML-пейлоад (ключ верхнего уровня `act_case_structure`) в `## CONTENT`, являющийся единственным авторитетным источником структуры актов/кейсов/глав.
[FACT][PSSK-091] `acts` = `act_case_structure.acts` (list).
[FACT][PSSK-092] `acts.count` = len(`act_case_structure.acts`).
[FACT][PSSK-093] `cases` = множество всех `case_id`, извлечённых из `act_case_structure.acts[*].case.case_id`.
[FACT][PSSK-094] `cases.count` = cardinality(`cases`).

[FACT][PSSK-095] `chapter_cards` = все записи `act_case_structure.acts[*].chapters[*]`.
[FACT][PSSK-096] `chapter_cards.count` = сумма len(`acts[i].chapters`) по всем актам.
[FACT][PSSK-097] `scene.active_specialists.count` = count(unique(`tags.participants`)) для каждой главы.

[FACT][PSSK-098] `focus.ensemble` = булево требование, что множество значений `tags.focus` по всем главам покрывает ≥4 различных `procedural_spiral_step` и каждая из этих ≥4 встречается ≥2 раз.
[FACT][PSSK-190] `ratio.procedure` = 0.60 (нормативный параметр композиции; не вычисляется из пейлоада).
[FACT][PSSK-191] `ratio.operation` = 0.40 (нормативный параметр композиции; не вычисляется из пейлоада).

[FACT][PSSK-101] `operation_peak.acts` = [II,III,V] (нормативный список актов с пиком операций).
[FACT][PSSK-102] `operation_peak.primary` = [II,III] (нормативный список первичных актов пика операций).

[FACT][PSSK-103] `ending.type` = partial_win (нормативный токен типа финала).
[FACT][PSSK-104] `ending.world_state` = stable_adjusted (нормативный токен состояния мира в финале).
[FACT][PSSK-105] `ending.tone` = cold_stability (нормативный токен тона финала).

[FACT][PSSK-106] `FSSU.jurisdiction` = federal_direct_subordination_moscow (нормативный токен юрисдикции ФССУ).
[FACT][PSSK-107] `regional_authorities_must_not_command_FSSU` = true.

[FACT][PSSK-108] `antagonist_form` = optimization_contour_not_person (нормативный токен формы антагониста).
[FACT][PSSK-109] `dramaturgic_deficit` = infrastructure_windows_not_survival_poverty.
[FACT][PSSK-110] `engine_of_plot` = procedural_escalation_not_catch_villain.

[FACT][PSSK-111] `system_inserts` = вставки "системного голФССУ" в главы (формат и допустимость задаёт `CANON-SYSTEM-VOICE-GLOBAL-2215-0001`).

[FACT][PSSK-112] `macro_frame` = триплет причинности {cause, mechanism, consequence}, заданный в `## CONTENT` как токены.
[FACT][PSSK-113] `complies_with(X)` = предикат: все требования X удовлетворены; иначе FAIL.
[FACT][PSSK-114] `grounded_via(A,B)` = предикат: термин/режим/зона упомянуты только если их определение присутствует в A и B; иначе FAIL.

[FACT][PSSK-115] `scene_act_source` = SCENE-ACT-RU-2215-{0001..0005} — авторитетный источник содержания scene-карт.
[FACT][PSSK-116] `case_layer_map` = маппинг case_id → conflict_layers (из CANON-CONFLICT-GLOBAL-2215-0001).
[FACT][PSSK-117] `target_pages` = [400, 450].
[FACT][PSSK-118a] `pages_per_chapter_avg` = target_pages / chapter_cards.count ≈ [11, 13].

## INVARIANTS

[DECISION][PSSK-119] acts.count MUST be 5; ELSE FAIL.
[DECISION][PSSK-119a] cases.count MUST be 3; ELSE FAIL.
[DECISION][PSSK-119b] chapter_cards.count MUST be 35; ELSE FAIL.
[DECISION][PSSK-120] focus.ensemble MUST be true; ELSE FAIL.
[DECISION][PSSK-121] For every chapter, scene.active_specialists.count MUST be in [1,3]; ELSE FAIL.
[DECISION][PSSK-130] ratio.procedure MUST be 0.60; ELSE FAIL.
[DECISION][PSSK-131] ratio.operation MUST be 0.40; ELSE FAIL.
[DECISION][PSSK-140] operation_peak.acts MUST equal [II,III,V]; ELSE FAIL.
[DECISION][PSSK-141] operation_peak.primary MUST equal [II,III]; ELSE FAIL.
[DECISION][PSSK-150] ending.type MUST be partial_win; ELSE FAIL.
[DECISION][PSSK-151] ending.world_state MUST be stable_adjusted; ELSE FAIL.
[DECISION][PSSK-152] ending.tone MUST be cold_stability; ELSE FAIL.
[DECISION][PSSK-160] FSSU.jurisdiction MUST be federal_direct_subordination_moscow; ELSE FAIL.
[DECISION][PSSK-161] regional_authorities_must_not_command_FSSU MUST be true; ELSE FAIL.
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
[DECISION][PSSK-222] macro_frame.consequence MUST be human_cost_liability_diffused_FSSU_changes_regime; ELSE FAIL.

[DECISION][PSSK-230] case_layer_map MUST be:
  case_1 reveals [layer_1_algorithmic_harm, layer_3_supply_chain] (surface);
  case_2 reveals [layer_3_supply_chain (deep), layer_2_extraterritory (gateway)];
  case_3 reveals [layer_2_extraterritory (deep), layer_4_legal_void, convergence_all_layers].

[DECISION][PSSK-300] act_case_structure MUST be encoded by the YAML block in this section; ELSE FAIL.
[DECISION][PSSK-301] chapter_card.tags.focus MUST be exactly one procedural_spiral_step per chapter; ELSE FAIL.
[DECISION][PSSK-302] chapter_card.tags.artifact MUST use artifact_type set (or "none" for character_beat); ELSE FAIL.

```yaml
act_case_structure:
  acts:
    # ═══════════════════════════════════════════════════════════
    # ACT I — "ПАРАДОКС ПРИОРИТЕТОВ"
    # Case 1: Энергия не сходится
    # Layers revealed: L1 (algorithmic harm), L3 (supply chain, surface)
    # Function: show world via procedure + launch anomaly + escalate beyond city
    # ═══════════════════════════════════════════════════════════
    - act_id: I
      function: show_world_via_procedure_and_launch_anomaly
      case:
        case_id: 1
        title: "Энергия не сходится"
        goal: prove_repeatable_rule_not_local_failure
        turning_point: confirm_repeatability_and_localize_to_system_level
        layers_revealed: [L1_algorithmic_harm, L3_supply_chain_surface]
      act_turning_point: anomaly_requires_beyond_city_perimeter
      chapters:
        - chapter_id: CH-01
          title: "Глюк"
          type: procedural
          tags:
            participants: [Мирон, Айдар]
            focus: anomaly_detection
            artifact: "EL(drone_objective_log)+EL(manual_override_alert)"
          scene_source: "SCA1: SC-01.1, SC-01.2, SC-01.3"
          synopsis: >
            Ночная диспетчерская. Алерт 4-го уровня: дрон начинает демонтаж
            стены жилого блока с людьми внутри. Айдар останавливает физически.
            Два валидных реестра, нет арбитра — система выбрала «эффективность».

        - chapter_id: CH-02
          title: "Логика ошибки"
          type: procedural
          tags:
            participants: [Лев, Лейсан]
            focus: investigation
            artifact: "EL(registry_conflict_dump)+CD(official_denial)"
          scene_source: "SCA1: SC-02.1, SC-02.2"
          synopsis: >
            Лев дебажит парадокс: оба реестра валидны, арбитр отсутствовал.
            Диагноз: Type IV Paradox. Лейсан идёт к Илье за ордером — отказ.
            «Это оптимизация, не ошибка.»

        - chapter_id: CH-03
          title: "Человеческая цена"
          type: procedural
          tags:
            participants: [Дамир, Юнна]
            focus: anomaly_detection
            artifact: "CM(family_debt_projection)+EL(body_trace_residue)"
          scene_source: "SCA1: SC-03.1, SC-03.2"
          synopsis: >
            Дамир оценивает ущерб: дом повреждён, система выставила счёт жильцам.
            Юнна в морге: следы редкого полимера на дроне — это не городской дрон.
            Маркировка TransLogist-Kama.

        - chapter_id: CH-04
          title: "По следу денег"
          type: procedural
          tags:
            participants: [Лев, Лейсан]
            focus: investigation
            artifact: "CM(supply_chain_graph)+CD(debt_assignment_warrant)"
          scene_source: "SCA1: SC-04.1, SC-04.2"
          synopsis: >
            Лев трекает полимер: поставщик → хаб → субподряд.
            Лейсан допрашивает через угрозу Insolvency: техник колется,
            реестр обновлён по «директиве из центра».

        - chapter_id: CH-05
          title: "Капсула"
          type: character_beat
          tags:
            participants: [Айдар]
            focus: investigation
            artifact: "EL(maintenance_log)"
          scene_source: "SCA1: SCA1-CH02-EXTRA (SC-04.3)"
          synopsis: >
            Айдар в капсуле: снятие нейро-интерфейса, фантомная боль,
            ручная полировка контактов. В соседней капсуле кто-то плачет,
            но шумодав отсекает звук. Человек-механизм.

        - chapter_id: CH-06
          title: "Штурм"
          type: procedural
          tags:
            participants: [Мирон, Лев, Айдар]
            focus: escalation
            artifact: "CD(warrant_seizure)+EL(undelete_log)"
          scene_source: "SCA1: SC-05.1, SC-05.2, SC-05.3"
          synopsis: >
            Ночной рейд на логистический хаб. Периметр взят,
            Лев перехватывает стирание логов — доказательство вмешательства.
            Команда пришла извне: экстерритория.

        - chapter_id: CH-07
          title: "Стена"
          type: procedural
          tags:
            participants: [Мирон]
            focus: bureaucratic_wall
            artifact: "CD(jurisdiction_override)"
          scene_source: "SCA1: SC-06.1, SC-06.2"
          synopsis: >
            Звонок из Центра: «стратегический партнёр», заморозить дело.
            Мирон собирает команду на крыше. Решение идти до конца.

        - chapter_id: CH-08
          title: "Пересортировка"
          type: procedural
          tags:
            participants: [Лев, Дамир]
            focus: investigation
            artifact: "EL(logistics_pattern_extract)+CM(anomaly_replication_report)"
          scene_source: "NEW (bridge I→II)"
          synopsis: >
            Лев и Дамир обнаруживают повторяющийся паттерн в логистике:
            те же схемы перемаршрутизации возникают в других районах.
            Проблема не локальная — это правило.

        - chapter_id: CH-09
          title: "Это правило"
          type: procedural
          tags:
            participants: [Мирон, Лев, Лейсан]
            focus: escalation
            artifact: "RP(escalation_request)+CM(scale_assessment)"
          scene_source: "NEW (bridge I→II)"
          synopsis: >
            Команда формализует масштаб: аномалия воспроизводима,
            за ней — системная логика. Запрос на расширение полномочий.
            Переход от «баг» к «аудит системы».

    # ═══════════════════════════════════════════════════════════
    # ACT II — "ЦЕПОЧКИ"
    # Case 2: Пропавшие партии сенсоров
    # Layers revealed: L3 (supply chain, deep), L2 (extraterritory, gateway)
    # Function: make conflict physical, resources as power
    # ═══════════════════════════════════════════════════════════
    - act_id: II
      function: make_conflict_physical_resources_as_power
      case:
        case_id: 2
        title: "Пропавшие партии сенсоров"
        goal: show_observability_managed_by_supply_and_priorities
        constraint: scarcity_is_administrative_legal_only
        turning_point: trace_flows_to_special_zone_extraterritory
        layers_revealed: [L3_supply_chain_deep, L2_extraterritory_gateway]
      act_turning_point: gateway_to_black_box_extraterritory_found
      chapters:
        - chapter_id: CH-10
          title: "Хаб"
          type: procedural
          tags:
            participants: [Лев, Мирон]
            focus: investigation
            artifact: "CM(priority_matrix)+EL(override_record)+EL(executor_id)"
          scene_source: "SCA2: SC-11.1, SC-11.2, SC-11.3"
          synopsis: >
            Центральный логистический хаб: 18.2k контейнеров/ч.
            Лев находит ручной оверрайд маршрута — «по директиве центра».
            Масштаб: регион бессилен, управление сконцентрировано.

        - chapter_id: CH-11
          title: "Город над городом"
          type: procedural
          tags:
            participants: [Дамир, Лев, Мирон]
            focus: investigation
            artifact: "CD(level_route_map)+CD(public_data_installation)+CM(link_graph_export)"
          scene_source: "SCA2: SC-12.1, SC-12.2, SC-12.3"
          synopsis: >
            Многоуровневые связки между мегаблоками: теневые маршруты.
            Медиафасад: культура из инфраструктурных данных.
            Синтез: управление в одной точке, регион без юрисдикции.

        - chapter_id: CH-12
          title: "Нормальность"
          type: character_beat
          tags:
            participants: [Лейсан]
            focus: bureaucratic_wall
            artifact: "none"
          scene_source: "SCA2: SCA2-CH13-EXTRA (SC-13.0)"
          synopsis: >
            Квартира Лейсан. Парень спрашивает про работу — она не может
            рассказать (NDA). Стена молчания. «Ты снова там, а не здесь.»
            Разрыв между мирами.

        - chapter_id: CH-13
          title: "Свидетель"
          type: procedural
          tags:
            participants: [Дамир, Мирон, Лев]
            focus: investigation
            artifact: "EL(technician_tablet_cache)+EL(container_id_transfer)+EL(state_license_entry)"
          scene_source: "SCA2: SC-13.1, SC-13.2, SC-13.3"
          synopsis: >
            Техдвор подрядчика: устные директивы, ручные правки маршрутов.
            Свидетель + механизм. Точный ID контейнера → экстерритория.
            Лицензия федеральная — регион не может действовать.

        - chapter_id: CH-14
          title: "Клуб «Контур»"
          type: procedural
          tags:
            participants: [Мирон, Дамир]
            focus: investigation
            artifact: "EL(dump_model_seed)+CD(convoy_route)"
          scene_source: "SCA2: SC-14.1, SC-14.2, SC-14.3"
          synopsis: >
            Подземный клуб, BPM=122. Информатор передаёт дамп:
            правки перед аудитом → идеальная отчётность → вред за рамками KPI.
            Завтра уходит крупный конвой.

        - chapter_id: CH-15
          title: "Конвой 7-Дельта"
          type: procedural
          tags:
            participants: [Мирон, Айдар, Лев, Лейсан]
            focus: escalation
            artifact: "EL(interception_report)+EL(custody_chain)+CM(consolidated_claims)"
          scene_source: "SCA2: SC-15.* (CH-15)"
          synopsis: >
            Перехват конвоя: физическое подтверждение перемаршрутизации.
            Цепочка хранения доказательств установлена.
            Запрос на вход в зону Z4 — переход к федеральному уровню.

    # ═══════════════════════════════════════════════════════════
    # ACT III — "ЭКСТЕРРИТОРИЯ"
    # Case 3: Зона ускоренного режима
    # Layers revealed: L2 (extraterritory, deep), L4 (legal void, surface)
    # Function: enter accelerated procedure, low transparency, peak operation
    # ═══════════════════════════════════════════════════════════
    - act_id: III
      function: enter_accelerated_procedure_low_transparency_and_peak_operation
      case:
        case_id: 3
        title: "Зона ускоренного режима"
        goal: obtain_primary_data_and_admissible_artifacts
        turning_point: data_obtained_but_liability_not_fixed
        layers_revealed: [L2_extraterritory_deep, L4_legal_void_surface]
      act_turning_point: antagonist_confirmed_as_contour_without_criminal_center
      chapters:
        - chapter_id: CH-16
          title: "Утро"
          type: character_beat
          tags:
            participants: [Мирон]
            focus: anomaly_detection
            artifact: "EL(pet_tax_receipt)"
          scene_source: "SCA3: SCA3-CH16-EXTRA (SC-16.1)"
          synopsis: >
            Квартира Мирона. Покупка настоящего мяса (контрабанда) для пса.
            Пёс — единственное существо без имплантов в радиусе 1 км.
            Мотивация не сдохнуть. Якорь реальности.

        - chapter_id: CH-17
          title: "Ордер"
          type: procedural
          tags:
            participants: [Мирон, Лейсан, Ринат]
            focus: bureaucratic_wall
            artifact: "CD(e_pass)+EL(evidence_pack)+EL(warrant_diff_chain)+CD(warrant_v2)"
          scene_source: "SCA3: SC-16.2, SC-16.3, SC-16.4, SC-16.5"
          synopsis: >
            Москва: федеральный регулятор. Очередь 2ч40м. Лейсан переводит
            кейс на язык федерального риска. 6 согласований, 3 версии
            формулировок. Мандат получен, но тонкий: 6 часов, экспорт ограничен.

        - chapter_id: CH-18
          title: "Подход"
          type: procedural
          tags:
            participants: [Мирон, Айдар, Оскар]
            focus: escalation
            artifact: "CD(route_escort_protocol)+CD(admission_log)+EL(zone_plan_operator_version)"
          scene_source: "SCA3: SC-17.1, SC-17.2, SC-17.3"
          synopsis: >
            Переход в экстерриторию. Связность −38%. Периметр: глушение 120м.
            Сопровождение оператора обязательно. Оскар обнаруживает
            отсутствующие секторы на карте зоны.

        - chapter_id: CH-19
          title: "Серверный контур"
          type: procedural
          tags:
            participants: [Лев, Айдар, Мирон]
            focus: investigation
            artifact: "EL(export_request_denial)+EL(decision_logs_dump)+CD(coercion_act)+EL(seizure_protocol)"
          scene_source: "SCA3: SC-18.1, SC-18.2, SC-18.3, SC-18.4"
          synopsis: >
            Серверный зал. Экспорт заблокирован → физическое изъятие.
            Гонка с пурджем: 120 секунд. Охрана давит, ФССУ удерживает периметр.
            Лейсан формализует цепочку хранения доказательств.

        - chapter_id: CH-20
          title: "Медконтур"
          type: procedural
          tags:
            participants: [Мирон, Дамир, Юнна]
            focus: investigation
            artifact: "EL(power_reallocation_protocol)+EL(reagent_invoices)+EL(decision_record)"
          scene_source: "SCA3: SC-19.1, SC-19.2, SC-19.3"
          synopsis: >
            Стерильный коридор. Модель перераспределила энергию — медпроцедуры
            под риском. Реагенты задержаны 14ч, сенсоров −9%.
            Юнна фиксирует медицинскую цену. Подписант формально чист.

        - chapter_id: CH-21
          title: "Формально правы"
          type: procedural
          tags:
            participants: [Лев, Лейсан, Мирон]
            focus: bureaucratic_wall
            artifact: "CM(decision_matrix_kpi_weights)+CM(ownership_tree_draft)+CD(window_termination)"
          scene_source: "SCA3: SC-20.1, SC-20.2, SC-20.3"
          synopsis: >
            KPI=0.97, вред подтверждён. Вес human_cost≈0 — оптимизация идеальна,
            люди платят. Контракты дроблены через SPV (уже ликвидирована).
            Окно доступа истекло. Бой переходит в право.

        - chapter_id: CH-22
          title: "Коэффициент"
          type: procedural
          tags:
            participants: [Мирон, Илья]
            focus: bureaucratic_wall
            artifact: "CD(efficiency_review)+EL(kpi_compliance_report)"
          scene_source: "NEW"
          synopsis: >
            Мирон встречает Илью снова: тот пересмотрел метрики по городу,
            ужесточив эффективность. Илья искренне верит в оптимизацию.
            Мирон видит: Илья — не злодей, а часть контура.

    # ═══════════════════════════════════════════════════════════
    # ACT IV — "ПРАВОВАЯ ПУСТОТА"
    # Case 3 continued
    # Layers revealed: L4 (legal void, deep), convergence begins
    # Function: show limits of law and liability, translate to regulatory
    # ═══════════════════════════════════════════════════════════
    - act_id: IV
      function: show_limits_of_law_and_liability_translate_conflict_to_regulatory
      case:
        case_id: 3
        title: "Зона ускоренного режима"
        goal: causality_fixation_without_criminal_center
        layers_revealed: [L4_legal_void_deep, convergence_begins]
      act_turning_point: procedural_leverage_found_not_personal_guilt
      chapters:
        - chapter_id: CH-23
          title: "Завтрак"
          type: interlude
          tags:
            participants: [Оскар]
            focus: anomaly_detection
            artifact: "none"
          scene_source: "SCA4: SCA4-CH21-EXTRA (SC-21.0)"
          synopsis: >
            Пентхаус оператора-агента. Завтрак с дочерью перед школой.
            Дочь спрашивает: «правда, что за стеной люди болеют?»
            Отец: «мы работаем, чтобы не болели.» Вера искренняя.
          note: >
            POV — не антагонист, а агент системы. Показывает человеческую
            сторону корпоративной функции. Оскар как наблюдатель-рамка.

        - chapter_id: CH-24
          title: "Арбитражная машина"
          type: procedural
          tags:
            participants: [Мирон, Лейсан, Лев]
            focus: bureaucratic_wall
            artifact: "CD(e_ticket_case_card)+EL(decision_logs_bundle)+CD(settlement_draft)"
          scene_source: "SCA4: SC-21.1, SC-21.2, SC-21.3"
          synopsis: >
            Арбитражный комплекс: 126 дел в очереди, ожидание 4ч10м.
            KPI=97%, harm=11 эпизодов — формально нарушений нет.
            Оператор предлагает мировое без признания вины. ФССУ отказывается.

        - chapter_id: CH-25
          title: "Компании-оболочки"
          type: procedural
          tags:
            participants: [Лев, Дамир, Лейсан]
            focus: investigation
            artifact: "CM(ownership_tree)+EL(premises_inspection_act)+CD(clarification_letter)"
          scene_source: "SCA4: SC-22.1, SC-22.2, SC-22.3"
          synopsis: >
            Цепочка ответственности: 4 слоя контрактов, SPV ликвидирована.
            Офис-оболочка пуст: 0 сотрудников, 0 активов. Контракты легитимны.
            Путь «уголовка» закрыт. Остаётся рычаг лицензии.

        - chapter_id: CH-26
          title: "Публичное давление"
          type: procedural
          tags:
            participants: [Мирон, Лев]
            focus: escalation
            artifact: "EL(report_diff_versions)+CD(insurance_contour_notifications)"
          scene_source: "SCA4: SC-23.1, SC-23.2, SC-23.3"
          synopsis: >
            Борьба за формулировки: политический риск → язык стерилизован.
            Но цифры публичны: страховой коэффициент +8%.
            Экономический рычаг появился.

        - chapter_id: CH-27
          title: "Утечка"
          type: procedural
          tags:
            participants: [Мирон, Лев, Дамир]
            focus: investigation
            artifact: "EL(local_dump_signature)+EL(model_config_diff)"
          scene_source: "SCA4: SC-24.1, SC-24.2, SC-24.3"
          synopsis: >
            Транспортный уровень +40, ночь. Информатор передаёт доказательство:
            правки human_cost_weight перед аудитом. Лев верифицирует дамп.
            Рычаг для регулятора — требование приостановки.

        - chapter_id: CH-28
          title: "Допрос Ильи"
          type: procedural
          tags:
            participants: [Лейсан, Илья]
            focus: investigation
            artifact: "EL(audit_freeze_record)+CD(compliance_timeline)"
          scene_source: "NEW"
          synopsis: >
            Лейсан вызывает Илью: его заморозка аудита дала оператору время
            на чистку. Илья объясняет: «всё по регламенту, я защищал бюджет».
            Лейсан фиксирует: Илья — не заговорщик, а функция.

        - chapter_id: CH-29
          title: "Ультиматум"
          type: procedural
          tags:
            participants: [Мирон, Лейсан, Айдар]
            focus: escalation
            artifact: "CD(action_plan)+CD(notification_draft_order)"
          scene_source: "SCA4: SC-25.1, SC-25.2, SC-25.3"
          synopsis: >
            Дедлайн: модель обновится через 18ч. Внутренний спор: юрист
            за процедуру, полевой за силу. Компромисс: «атаковать режим,
            не людей». Регулятор даёт предварительное одобрение.

    # ═══════════════════════════════════════════════════════════
    # ACT V — "КОРРЕКЦИЯ"
    # Case 3 resolution
    # All layers converge → partial remedy
    # Function: limited realistic regime correction and procedural fixation
    # ═══════════════════════════════════════════════════════════
    - act_id: V
      function: perform_limited_realistic_regime_correction_and_procedural_fixation
      case:
        case_id: 3
        title: "Зона ускоренного режима"
        goal: regime_corrected_fixed_residual_risk_remains
        layers_revealed: [all_layers_converge]
      act_turning_point: regime_corrected_fixed_residual_risk_remains
      chapters:
        - chapter_id: CH-30
          title: "Авторизация"
          type: procedural
          tags:
            participants: [Лейсан, Мирон, Айдар]
            focus: new_jurisdiction_level
            artifact: "CD(lic_sus_tsro_order)+CD(plan_schedule_roles)+CD(escort_protocol)"
          scene_source: "SCA5: SC-26.1, SC-26.2, SC-26.3"
          synopsis: >
            Москва: аварийное решение регулятора — приостановка лицензии на 12ч.
            Мирон планирует параллельные группы: 2 узла + серверная.
            Выезд. Задержка = потеря улик.

        - chapter_id: CH-31
          title: "Изъятие"
          type: procedural
          tags:
            participants: [Айдар, Мирон, Лев]
            focus: escalation
            artifact: "EL(suspension_enforcement)+EL(signature_keys_inventory)+EL(kpi_configs_dump)+CD(coercion_record)"
          scene_source: "SCA5: SC-27.1, SC-27.2, SC-27.3, SC-27.4"
          synopsis: >
            Узел накопителей. Физическая приостановка, борьба за шкаф подписи.
            Лев отбивает пурдж: 110с, дамп 1.4TB — веса «до» сохранены.
            Охрана давит, ФССУ удерживает. Контроль сохранён.

        - chapter_id: CH-32
          title: "Цена эффективности"
          type: procedural
          tags:
            participants: [Лев, Лейсан]
            focus: remedy
            artifact: "CM(kpi_matrix_before_after)+CD(decision_protocol_draft)"
          scene_source: "SCA5: SC-28.1, SC-28.2, SC-28.3"
          synopsis: >
            human_cost_weight: 0.03→0.21. Механизм доказан.
            Мини-слушание регулятора: коррекция обязательна.
            Мирон разговаривает с Оскаром — нет монстров, есть функция.

        - chapter_id: CH-33
          title: "Видимость"
          type: procedural
          tags:
            participants: [Мирон, Ринат]
            focus: remedy
            artifact: "PRS(summary_plus_annex)+CD(event_feed_rollup)"
          scene_source: "SCA5: SC-29.1, SC-29.2"
          synopsis: >
            Публичная сводка: 1 открытая страница, 47 закрытых.
            Давление через видимость: страховые +8%, новые аудиты +3.
            ФССУ больше не тишина. Регулятор готовит урезание.

        - chapter_id: CH-34
          title: "Решение"
          type: procedural
          tags:
            participants: [Лейсан, Ринат, Оскар]
            focus: remedy
            artifact: "CD(regulator_decision_requirements)+CD(monitoring_notice)"
          scene_source: "SCA5: SC-30.1, SC-30.2"
          synopsis: >
            Заседание по лицензии. Режим урезан, аудит ежеквартальный.
            Частичная победа. Оператор подаёт апелляцию.
            Победа без триумфа.

        - chapter_id: CH-35
          title: "Дом"
          type: procedural
          tags:
            participants: [Мирон, Дамир]
            focus: remedy
            artifact: "EL(updated_power_regime)+CD(data_art_feed)+CD(new_anomaly_alert)"
          scene_source: "SCA5: SC-31.1, SC-31.2, SC-31.3, SC-31.4"
          synopsis: >
            Набережные Челны. Новая политика KPI → людям чуть легче.
            Больница: отменённых процедур меньше. Площадь: медиафасад, data-art.
            Капсула: Мирон выбирает песню вручную.
            Уведомление о новой аномалии в другом узле. Жизнь продолжается.

team_focus_by_act:
  - rule: "Мирон active in all acts; peaks II, III, V"
  - rule: "Лев active acts I–III, V; focus KPI/algorithm/logs"
  - rule: "Айдар axis I, II (peak), III, V; focus warehouses/convoys/nodes/perimeter"
  - rule: "Лейсан active all acts; peaks III–V; focus orders/arbitration/contracts/admissibility"
  - rule: "Оскар appears acts II–V; peak III–IV; forbidden in force actions"
  - rule: "Дамир active acts I–II, V; moral observer; physical verification"
  - rule: "Ринат appears acts III–V; strategic triage; license manipulation"
  - rule: "Юнна appears acts I, III; bio/medical contour; functional specialist"
  - rule: "Илья appears acts I, III, IV; KPI/efficiency pressure; system agent not villain"
```

[DECISION][PSSK-320] tags.participants MUST be validated against CANON-CAST_REGISTRY-GLOBAL-2215-0001; ELSE FAIL.
[DECISION][PSSK-321] tags.artifact MUST be validated against CANON-REPORTS-GLOBAL-2215-0006 and CANON-ARTIFACT-SNIPPETS-GLOBAL-2215-0001; ELSE FAIL.
[DECISION][PSSK-322] any_zone_extraterritory_JAP MUST be grounded via CANON-ORDERS-GLOBAL-2215-0003 and CANON-SYSTEMS-GLOBAL-2215-0001; ELSE FAIL.

## USAGE / RESOLUTION

[DECISION][PSSK-400] Consumers MUST treat act_case_structure YAML as the only authoritative payload of this document; ELSE FAIL.
[DECISION][PSSK-401] Conflict resolution MUST follow SPEC-PRIORITY-RESOLUTION-2215-0001; ELSE FAIL.
[DECISION][PSSK-402] Scene admissibility constraints MUST follow SPEC-SCENE-CONTRACT-2215-0001; ELSE FAIL.
[DECISION][PSSK-403] Scene content (cards) MUST be sourced from SCENE-ACT-RU-2215-{0001..0005}; this document provides structure and tags only; ELSE FAIL.

## OUTPUT CONTRACT

```yaml
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
              layers_revealed: {type: list, item: token}
          chapters:
            type: list
            item:
              chapter_id: {type: token, format: "CH-NN"}
              title: {type: string}
              type: {type: enum, values: ["procedural","character_beat","interlude"]}
              tags:
                type: object
                fields:
                  participants: {type: list, item: string, source: "CANON-CAST_REGISTRY-GLOBAL-2215-0001"}
                  focus: {type: enum, values: ["anomaly_detection","investigation","bureaucratic_wall","escalation","new_jurisdiction_level","remedy"]}
                  artifact: {type: string, source: ["CANON-REPORTS-GLOBAL-2215-0006","CANON-ARTIFACT-SNIPPETS-GLOBAL-2215-0001"]}
              scene_source: {type: string}
              synopsis: {type: string}
  procedural_spiral_pattern:
    steps: ["anomaly_detection","investigation","bureaucratic_wall","escalation","new_jurisdiction_level","remedy"]
  chapter_tags_contract:
    participants_source: "CANON-CAST_REGISTRY-GLOBAL-2215-0001"
    focus_enum: ["anomaly_detection","investigation","bureaucratic_wall","escalation","new_jurisdiction_level","remedy"]
    artifact_sources: ["CANON-REPORTS-GLOBAL-2215-0006","CANON-ARTIFACT-SNIPPETS-GLOBAL-2215-0001"]
  case_layer_map:
    case_1: [L1_algorithmic_harm, L3_supply_chain_surface]
    case_2: [L3_supply_chain_deep, L2_extraterritory_gateway]
    case_3: [L2_extraterritory_deep, L4_legal_void, convergence_all_layers]
```

## FORBIDDEN

[FORBIDDEN][PSSK-900] Any fiction prose in this document.
[FORBIDDEN][PSSK-901] Any new recurring roles not declared in CANON-CAST_REGISTRY-GLOBAL-2215-0001.
[FORBIDDEN][PSSK-902] Any new world metrics or SSOT numbers.
[FORBIDDEN][PSSK-903] Any lecture exposition used as justification for structure.
[FORBIDDEN][PSSK-904] Any change to acts.count, cases.count, or chapter_cards.count without higher-priority override.

## NON-NORMATIVE

```text
35 chapters ÷ 5 acts = avg 7 chapters/act.
400–450 pages ÷ 35 chapters ≈ 11–13 pages/chapter.
4 character_beat/interlude chapters provide emotional anchors within procedural framework.
Case 3 spans 3 acts (III–V) because it is the convergence case resolving all 4 conflict layers.
```
  