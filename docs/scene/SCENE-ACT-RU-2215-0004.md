---
id: SCENE-ACT-RU-2215-0004
title: >
  SCENE-CARDS — Акт IV (Главы 21–25) —
  Москва: арбитраж, лицензии, контуры ответственности и контрмеры системы
class: scene
status: fixed
version: 1.1.0
inputs:
  - BASELINE-PHYSICALLEVELMID-2215-0001
  - CANON-BASE-RULE-GLOBAL-2215-0001
  - CANON-CONFLICT-GLOBAL-2215-0001
  - CANON-SYSTEMS-GLOBAL-2215-0001
  - PLAN-STORY-2215-0001
depends_on:
  - SCENE-ACT-RU-2215-0003
scope: >
  Полный комплект SCENE-CARDS для Акта IV (главы 21–25): эскалация в институциональном
  центре; сходимость линий ответственности/логов/регламентов; ответ системы процедурами,
  санкциями и блокировками. Без художественного текста.
---

## LLM-INTENT

ROLE_TYPE: INDEX
SCOPE: machine-readable scene cards for Act IV as TYPE C inputs (no prose).
SCENE_FORMAT: scene_cards_kvline_v1
INPUTS: [BASELINE-PHYSICALLEVELMID-2215-0001, CANON-BASE-RULE-GLOBAL-2215-0001, CANON-CONFLICT-GLOBAL-2215-0001, CANON-SYSTEMS-GLOBAL-2215-0001, PLAN-STORY-2215-0001]
OUTPUTS: [scene_card_records]
FORBIDDEN: [prose, world_explanations, new_metrics, unscoped_numbers, gap_filling, meta_diegesis]

## DEFINITIONS

[FACT][SCA4-DEF-010] `scene_card` = record fields: scene_id, chapter_id, time, where, pov, goal, measurable, artifact, cmc, output, hook, tags.
[FACT][SCA4-DEF-011] `cmc` = CAUSE → MECHANISM → CONSEQUENCE (single-line, procedural).
[FACT][SCA4-DEF-012] `measurable` = key=value list; numeric values MUST carry units when applicable.
[FACT][SCA4-DEF-013] `artifact` = CD|EL|CM|FM|RP|PRS|none plus subtype in parentheses.

## INVARIANTS

[DECISION][SCA4-INV-010] Each `scene_card` MUST remain non-prose: only operational intent and constraints.
[DECISION][SCA4-INV-011] Each `scene_card` MUST be self-scoped via `where` and MUST include `scene_id` and `chapter_id`.
[DECISION][SCA4-INV-012] If `measurable` includes environment sensors, they MUST be traceable to BASELINE-PHYSICALLEVELMID-2215-0001 ranges OR explicit override.
[FORBIDDEN][SCA4-INV-013] Introducing new macro world numbers inside scene cards (SSOT-only numbers remain in SSOT/CANON-METRICS).

## CONTENT

### CH-21 — Arbitration Machine

[FACT][SCA4-CH21-EXTRA] scene_id=SC-21.0; chapter_id=CH-21; time="08:00 (Morning)"; where="Пентхаус Оператора (Чистая зона)"; pov="Оператор (Антагонист)"; goal="завтрак с дочерью перед школой"; measurable="air_purity=99.9%; breakfast_quality=premium"; artifact="none"; cmc="дочь жалуется на сложный урок истории → отец объясняет, что порядок важнее хаоса → его вера искренняя"; output="злодей очеловечен"; hook="Дочь: 'А правда, что за стеной люди болеют?' Отец: 'Мы работаем, чтобы не болели'"; tags="luxury, family, flow".
[FACT][SCA4-001] scene_id=SC-21.1; chapter_id=CH-21; time="09:00 (Morning)"; where="арбитражный комплекс, приём дел"; pov="лидер"; goal="показать масштаб федеральной машины и цену времени"; measurable="queue_cases=126; wait_time=4h10m"; artifact="CD(e_ticket_case_card)"; cmc="централизованный поток → задержки → срочность теряется"; output="ощущение: время съедает правду"; hook="оператор зарегистрировал встречное заявление"; tags="queue, bureaucracy, restless".
[FACT][SCA4-002] scene_id=SC-21.2; chapter_id=CH-21; time="11:30 (Day)"; where="зал слушаний"; pov="юрист ОСА"; goal="формально изложить причинность и упереться в «нет нарушений»"; measurable="KPI_compliance=97%; harm_episodes=11"; artifact="EL(decision_logs_med_protocols_bundle)"; cmc="модель по контракту → подписи по регламенту → нарушений нет"; output="правовая ничья"; hook="суд требует конкретного виновного субъекта"; tags="sterile, court, flow".
[FACT][SCA4-003] scene_id=SC-21.3; chapter_id=CH-21; time="12:15 (Day)"; where="кулуар / коридор"; pov="лидер"; goal="реакция оператора — закрыть шум без признания вины"; measurable="settlement_offer=without_admission"; artifact="CD(settlement_draft)"; cmc="репутационный риск → попытка замять → система сохраняется"; output="ОСА отказывается"; hook="«ищите подрядчика»"; tags="whisper, shadow, velvet".

### CH-22 — Shell Companies

[FACT][SCA4-004] scene_id=SC-22.1; chapter_id=CH-22; time="14:00 (Day)"; where="контур реестров юрлиц / ownership-анализ"; pov="аналитик"; goal="раскрутить цепочку ответственности"; measurable="contract_layers=4; SPV_present=true"; artifact="CM(ownership_tree)"; cmc="дробление контрактов → ответственность рассеивается → нет субъекта"; output="виновный растворён процедурно"; hook="SPV ликвидирована месяц назад"; tags="data, dead_end, analytic".
[FACT][SCA4-005] scene_id=SC-22.2; chapter_id=CH-22; time="16:00 (Afternoon)"; where="адрес SPV (офис-оболочка)"; pov="полевой"; goal="физически подтвердить пустоту"; measurable="employees=0; assets=0"; artifact="EL(premises_inspection_act)"; cmc="фиктивная структура → нет активов → нет взыскания"; output="тупик подтверждён"; hook="контракты всё равно легитимны"; tags="dust, echo, void".
[FACT][SCA4-006] scene_id=SC-22.3; chapter_id=CH-22; time="17:30 (Evening)"; where="разговор с чиновником-куратором / контур разъяснений"; pov="юрист ОСА"; goal="институциональное сопротивление без злодейства"; measurable="response=within_norms; responsibility_refused=true"; artifact="CD(clarification_letter)"; cmc="самосохранение аппарата → формализм → давление на ОСА"; output="путь «уголовка» закрыт"; hook="остаётся рычаг лицензии оператора"; tags="office, fatigue, restless".

### CH-23 — Public Pressure

[FACT][SCA4-007] scene_id=SC-23.1; chapter_id=CH-23; time="19:00 (Evening)"; where="пресс-контур регулятора"; pov="лидер"; goal="борьба за формулировки"; measurable="text_reduction=−60%"; artifact="EL(report_diff_versions)"; cmc="политический риск → стерилизация языка → факты обезврежены"; output="правда становится беззубой"; hook="лидер настаивает оставить цифры ущерба"; tags="media, conflict, flow".
[FACT][SCA4-008] scene_id=SC-23.2; chapter_id=CH-23; time="20:00 (Evening)"; where="реакция рынка / страховщиков (монтаж)"; pov="аналитик"; goal="показать, что цифры — это давление"; measurable="insurance_risk_coef_delta=+8%"; artifact="CD(insurance_contour_notifications)"; cmc="цифры публичны → риск монетизируется → оператору становится дорого"; output="появляется экономический рычаг"; hook="оператор готовит апелляцию"; tags="stocks, panic, kinetic".
[FACT][SCA4-009] scene_id=SC-23.3; chapter_id=CH-23; time="23:00 (Night)"; where="ночной переход / вентиляционный гул (Москва как холод)"; pov="лидер"; goal="медитативная сцена «власть как климат»"; measurable="ventilation_noise=58dB"; artifact="CD(background_transition_telemetry)"; cmc="решения рождаются здесь → регионы исполняют → дистанция"; output="тон удержан"; hook="входящее от информатора"; tags="city_hum, cold, void".

### CH-24 — The Leak

[FACT][SCA4-010] scene_id=SC-24.1; chapter_id=CH-24; time="00:30 (Deep Night)"; where="транспортный уровень +40 / закрытый переход"; pov="лидер"; goal="безопасная встреча и получение улики умысла"; measurable="manual_override_window=11m"; artifact="EL(local_dump_or_signature_key_or_config_cache)"; cmc="правки перед аудитом → идеальная отчётность → вред скрыт за KPI"; output="доказательство умышленной коррекции"; hook="правки централизованы"; tags="wind, stealth, velvet".
[FACT][SCA4-011] scene_id=SC-24.2; chapter_id=CH-24; time="00:45 (Deep Night)"; where="разговор (коротко)"; pov="информатор"; goal="человеческий риск без мелодрамы"; measurable="none"; artifact="none"; cmc="страх потери контракта/работы → сотрудничество → личная цена"; output="доверие хрупкое"; hook="«апдейт модели завтра»"; tags="fear, whisper, velvet".
[FACT][SCA4-012] scene_id=SC-24.3; chapter_id=CH-24; time="02:00 (Deep Night)"; where="ОСА / верификация дампа"; pov="аналитик"; goal="превратить «сказал» в проверяемый факт"; measurable="human_cost_weight_changed_pre_audit=true"; artifact="EL(model_config_diff)"; cmc="занижение веса → решения оптимальны → люди платят"; output="есть прямой рычаг для регулятора"; hook="требование приостановки лицензии"; tags="code, truth, flow".

### CH-25 — The Ultimatum

[FACT][SCA4-013] scene_id=SC-25.1; chapter_id=CH-25; time="05:00 (Pre-dawn)"; where="временный штаб ОСА (Москва)"; pov="лидер"; goal="стратегический выбор под дедлайн"; measurable="model_update_in=18h"; artifact="CD(action_plan)"; cmc="ждать суда → проигрыш; действовать быстро → шанс"; output="решение о принудительном аудите"; hook="запрос на приостановку отправлен"; tags="deadline, coffee, restless".
[FACT][SCA4-014] scene_id=SC-25.2; chapter_id=CH-25; time="05:30 (Pre-dawn)"; where="внутренний спор команды (диалог специалистов)"; pov="команда"; goal="показать конфликт методов"; measurable="none"; artifact="none"; cmc="юрист за процедуру, полевой за силовой вход → компромисс → точечная операция"; output="согласован план «атаковать режим, не людей»"; hook="нужно окно полномочий"; tags="argument, tension, kinetic".
[FACT][SCA4-015] scene_id=SC-25.3; chapter_id=CH-25; time="06:00 (Dawn)"; where="финал главы / уведомление"; pov="лидер"; goal="запустить ускорение Акта V"; measurable="regulator_reply=prelim_approved; access_window=12h"; artifact="CD(notification_or_draft_order)"; cmc="доказательства достаточны → окно возможно → начинается гонка"; output="старт финального акта"; hook="оператор начнёт чистку"; tags="dawn, start, kinetic".

## USAGE / RESOLUTION

[DECISION][SCA4-USE-010] This document is TYPE C (scene inputs). Statements herein are CARD records, not world facts.
[DECISION][SCA4-USE-020] The prose engine may only consume data declared in OUTPUT CONTRACT.
[DECISION][SCA4-USE-030] Any missing/UNKNOWN values must remain UNKNOWN (no invention).

## OUTPUT CONTRACT

~~~yaml
EXPORTS:
  - scene_card_records:
      source_section: "## CONTENT"
      container: "kvline_semicolon"
      record_start_pattern: '^\\[FACT\\]\\[SCA4-[0-9]{3}\\]\s+scene_id=SC-[0-9]{2}\.[0-9]+;'
      required_fields: ["scene_id","chapter_id","time","where","pov","goal","measurable","artifact","cmc","output","hook","tags"]
      field_patterns:
        scene_id: 'scene_id=SC-[0-9]{2}\.[0-9]+'
        chapter_id: 'chapter_id=CH-[0-9]{2}'
        time: 'time="[^"]+"'
        where: 'where="[^"]+"'
        pov: 'pov="[^"]+"'
        goal: 'goal="[^"]+"'
        measurable: 'measurable="[^"]*"'
        artifact: 'artifact="[^"]+"'
        cmc: 'cmc="[^"]+"'
        output: 'output="[^"]+"'
        hook: 'hook="[^"]+"'
        tags: 'tags="[^"]+"'
READER:
  - ignore all sections outside exported blocks
~~~

## FORBIDDEN

[FORBIDDEN][SCA4-FBD-010] Treat scene card items as new SSOT/baseline facts.
[FORBIDDEN][SCA4-FBD-020] Fill in unspecified instruments/locations/actors not present in corpus STATE/ENTITIES/PROCEDURES.
[FORBIDDEN][SCA4-FBD-030] Emit any doc ids, file paths, YAML tokens, or protocol/spec/registry terms in diegetic prose.

## NON-NORMATIVE

(empty)