---
id: SCENE-ACT-RU-2215-0004
title: >
  SCENE-CARDS — Act IV (Chapters 23–29) —
  Moscow: arbitration, licenses, responsibility contours and system countermeasures
class: scene
status: draft
version: 1.2.0
doc_language: en
prose_language: ru-RU
inputs:
  - BASELINE-PHYSICAL_LEVEL_MID-2215-0001
  - CANON-BASE_RULE-GLOBAL-2215-0001
  - CANON-CONFLICT-GLOBAL-2215-0001
  - CANON-SYSTEMS-GLOBAL-2215-0001
  - PLAN-STORY-2215-0001
depends_on:
  - SCENE-ACT-RU-2215-0003
scope: >
  Full set of SCENE-CARDS for Act IV (chapters 23–29): escalation in the institutional
  center; convergence of responsibility lines/logs/regulations; system response via
  procedures, sanctions, and blocking.
---

## LLM-INTENT

ROLE_TYPE: INDEX
SCOPE: machine-readable scene cards for Act IV as TYPE C inputs (no prose).
SCENE_FORMAT: scene_cards_kvline_v1
INPUTS: [BASELINE-PHYSICAL_LEVEL_MID-2215-0001, CANON-BASE_RULE-GLOBAL-2215-0001, CANON-CONFLICT-GLOBAL-2215-0001, CANON-SYSTEMS-GLOBAL-2215-0001, PLAN-STORY-2215-0001]
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
[DECISION][SCA4-INV-012] If `measurable` includes environment sensors, they MUST be traceable to BASELINE-PHYSICAL_LEVEL_MID-2215-0001 ranges OR explicit override.
[FORBIDDEN][SCA4-INV-013] Introducing new macro world numbers inside scene cards (SSOT-only numbers remain in SSOT/CANON-METRICS).

## CONTENT

### CH-23 — Завтрак

[FACT][SCA4-001] scene_id=SC-23.1; chapter_id=CH-23; time="08:00 (Morning)"; where="Пентхаус Оскара (Чистая зона)"; pov="Оскар"; goal="завтрак с дочерью перед школой"; measurable="air_purity=99.9%; breakfast_quality=premium"; artifact="none"; cmc="дочь жалуется на сложный урок истории → отец объясняет, что порядок важнее хаФССУ → его вера искренняя"; output="агент системы показан с человеческой стороны"; hook="Дочь: 'А правда, что за стеной люди болеют?' Оскар: 'Мы работаем, чтобы не болели'"; tags="luxury, family, flow".

### CH-24 — Arbitration Machine

[FACT][SCA4-002] scene_id=SC-24.1; chapter_id=CH-24; time="09:00 (Morning)"; where="Арбитражный комплекс, приём дел"; pov="Мирон"; goal="показать масштаб федеральной машины и цену времени"; measurable="queue_cases=126; wait_time=4h10m"; artifact="CD(e_ticket_case_card)"; cmc="централизованный поток → задержки → срочность теряется"; output="ощущение: время съедает правду"; hook="оператор зарегистрировал встречное заявление"; tags="queue, bureaucracy, restless".
[FACT][SCA4-003] scene_id=SC-24.2; chapter_id=CH-24; time="11:30 (Day)"; where="Зал слушаний"; pov="Лейсан"; goal="формально изложить причинность и упереться в «нет нарушений»"; measurable="KPI_compliance=97%; harm_episodes=11"; artifact="EL(decision_logs_med_protocols_bundle)"; cmc="модель по контракту → подписи по регламенту → нарушений нет"; output="правовая ничья"; hook="суд требует конкретного виновного субъекта"; tags="sterile, court, flow".
[FACT][SCA4-004] scene_id=SC-24.3; chapter_id=CH-24; time="12:15 (Day)"; where="Кулуар / коридор"; pov="Мирон"; goal="реакция оператора — закрыть шум без признания вины"; measurable="settlement_offer=without_admission"; artifact="CD(settlement_draft)"; cmc="репутационный риск → попытка замять → система сохраняется"; output="ФССУ отказывается"; hook="«ищите подрядчика»"; tags="whisper, shadow, velvet".

### CH-25 — Shell Companies

[FACT][SCA4-005] scene_id=SC-25.1; chapter_id=CH-25; time="14:00 (Day)"; where="Контур реестров юрлиц / ownership-анализ"; pov="Лев"; goal="раскрутить цепочку ответственности"; measurable="contract_layers=4; SPV_present=true"; artifact="CM(ownership_tree)"; cmc="дробление контрактов → ответственность рассеивается → нет субъекта"; output="виновный растворён процедурно"; hook="SPV ликвидирована месяц назад"; tags="data, dead_end, analytic".
[FACT][SCA4-006] scene_id=SC-25.2; chapter_id=CH-25; time="16:00 (Afternoon)"; where="Адрес SPV (офис-оболочка)"; pov="Дамир"; goal="физически подтвердить пустоту"; measurable="employees=0; assets=0"; artifact="EL(premises_inspection_act)"; cmc="фиктивная структура → нет активов → нет взыскания"; output="тупик подтверждён"; hook="контракты всё равно легитимны"; tags="dust, echo, void".
[FACT][SCA4-007] scene_id=SC-25.3; chapter_id=CH-25; time="17:30 (Evening)"; where="Разговор с чиновником-куратором / контур разъяснений"; pov="Лейсан"; goal="институциональное сопротивление без злодейства"; measurable="response=within_norms; responsibility_refused=true"; artifact="CD(clarification_letter)"; cmc="самосохранение аппарата → формализм → давление на ФССУ"; output="путь «уголовка» закрыт"; hook="остаётся рычаг лицензии оператора"; tags="office, fatigue, restless".

### CH-26 — Public Pressure

[FACT][SCA4-008] scene_id=SC-26.1; chapter_id=CH-26; time="19:00 (Evening)"; where="Пресс-контур регулятора"; pov="Мирон"; goal="борьба за формулировки"; measurable="text_reduction=−60%"; artifact="EL(report_diff_versions)"; cmc="политический риск → стерилизация языка → факты обезврежены"; output="правда становится беззубой"; hook="Мирон настаивает оставить цифры ущерба"; tags="media, conflict, flow".
[FACT][SCA4-009] scene_id=SC-26.2; chapter_id=CH-26; time="20:00 (Evening)"; where="Реакция рынка / страховщиков (монтаж)"; pov="Лев"; goal="показать, что цифры — это давление"; measurable="insurance_risk_coef_delta=+8%"; artifact="CD(insurance_contour_notifications)"; cmc="цифры публичны → риск монетизируется → оператору становится дорого"; output="появляется экономический рычаг"; hook="оператор готовит апелляцию"; tags="stocks, panic, kinetic".
[FACT][SCA4-010] scene_id=SC-26.3; chapter_id=CH-26; time="23:00 (Night)"; where="Ночной переход / вентиляционный гул (Москва как холод)"; pov="Мирон"; goal="медитативная сцена «власть как климат»"; measurable="ventilation_noise=58dB"; artifact="CD(background_transition_telemetry)"; cmc="решения рождаются здесь → регионы исполняют → дистанция"; output="тон удержан"; hook="входящее от Информатора"; tags="city_hum, cold, void".

### CH-27 — The Leak

[FACT][SCA4-011] scene_id=SC-27.1; chapter_id=CH-27; time="00:30 (Deep Night)"; where="Транспортный уровень +40 / закрытый переход"; pov="Мирон"; goal="безопасная встреча и получение улики умысла"; measurable="manual_override_window=11m"; artifact="EL(local_dump_or_signature_key_or_config_cache)"; cmc="правки перед аудитом → идеальная отчётность → вред скрыт за KPI"; output="доказательство умышленной коррекции"; hook="правки централизованы"; tags="wind, stealth, velvet".
[FACT][SCA4-012] scene_id=SC-27.2; chapter_id=CH-27; time="00:45 (Deep Night)"; where="Разговор (коротко)"; pov="Информатор"; goal="человеческий риск без мелодрамы"; measurable="none"; artifact="none"; cmc="страх потери контракта/работы → сотрудничество → личная цена"; output="доверие хрупкое"; hook="«апдейт модели завтра»"; tags="fear, whisper, velvet".
[FACT][SCA4-013] scene_id=SC-27.3; chapter_id=CH-27; time="02:00 (Deep Night)"; where="ФССУ / верификация дампа"; pov="Лев"; goal="превратить «сказал» в проверяемый факт"; measurable="human_cost_weight_changed_pre_audit=true"; artifact="EL(model_config_diff)"; cmc="занижение веса → решения оптимальны → люди платят"; output="есть прямой рычаг для регулятора"; hook="требование приостановки лицензии"; tags="code, truth, flow".

### CH-28 — Допрос Ильи

[FACT][SCA4-014] scene_id=SC-28.1; chapter_id=CH-28; time="03:30 (Night)"; where="Следственный кабинет (закрытый контур)"; pov="Лейсан"; goal="вскрытие функции Ильи"; measurable="pulse=calm; logic=flawless"; artifact="EL(interrogation_transcript)"; cmc="предъявление улик (правки логов) → Илья признает факт, но не вину → 'я спасал систему от коллапса'"; output="Илья — не злодей, а предохранитель"; hook="система без правок убила бы больше"; tags="interrogation, philosophy, cold".
[FACT][SCA4-015] scene_id=SC-28.2; chapter_id=CH-28; time="04:15 (Pre-dawn)"; where="Коридор изолятора"; pov="Мирон"; goal="осознание масштаба компромисса"; measurable="doubt_level=high"; artifact="none"; cmc="слова Ильи имеют смысл → победа над ним не решит проблему → система требует жертв"; output="моральная дилемма"; hook="но закон есть закон"; tags="reflection, shadow, restless".

### CH-29 — The Ultimatum

[FACT][SCA4-016] scene_id=SC-29.1; chapter_id=CH-29; time="05:00 (Pre-dawn)"; where="Временный штаб ФССУ (Москва)"; pov="Мирон"; goal="стратегический выбор под дедлайн"; measurable="model_update_in=18h"; artifact="CD(action_plan)"; cmc="ждать суда → проигрыш; действовать быстро → шанс"; output="решение о принудительном аудите"; hook="запрос на приостановку отправлен"; tags="deadline, coffee, restless".
[FACT][SCA4-017] scene_id=SC-29.2; chapter_id=CH-29; time="05:30 (Pre-dawn)"; where="Внутренний спор команды"; pov="Мирон"; goal="показать конфликт методов"; measurable="none"; artifact="none"; cmc="Лейсан за процедуру, Дамир/Айдар за силовой вход → компромисс → точечная операция"; output="согласован план «атаковать режим, не людей»"; hook="нужно окно полномочий"; tags="argument, tension, kinetic".
[FACT][SCA4-018] scene_id=SC-29.3; chapter_id=CH-29; time="06:00 (Dawn)"; where="Финал главы / уведомление"; pov="Мирон"; goal="запустить ускорение Акта V"; measurable="regulator_reply=prelim_approved; access_window=12h"; artifact="CD(notification_or_draft_order)"; cmc="доказательства достаточны → окно возможно → начинается гонка"; output="старт финального акта"; hook="оператор начнёт чистку"; tags="dawn, start, kinetic".

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