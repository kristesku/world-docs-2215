---
id: SCENE-ACT-RU-2215-0005
title: >
  SCENE-CARDS — Act V (Chapters 30–35) —
  License Suspension → Resolution via Procedural Cost and Fact Fixation
class: scene
status: draft
version: 1.2.0
doc_language: en
prose_language: ru-RU
inputs:
  - BASELINE-PHYSICAL_LEVEL_MID-2215-0001
  - CANON-BASE-RULE-GLOBAL-2215-0001
  - CANON-CONFLICT-GLOBAL-2215-0001
  - CANON-SYSTEMS-GLOBAL-2215-0001
  - PLAN-STORY-2215-0001
depends_on:
  - SCENE-ACT-RU-2215-0004
scope: >
  Full set of SCENE-CARDS for Act V (chapters 30–35): climax and resolution
  via legal and logistic levers, resource cost, and final fact fixation;
  closing the case without "superheroism".
---

## LLM-INTENT

ROLE_TYPE: INDEX
SCOPE: machine-readable scene cards for Act V as TYPE C inputs (no prose).
SCENE_FORMAT: scene_cards_kvline_v1
INPUTS: [BASELINE-PHYSICAL_LEVEL_MID-2215-0001, CANON-BASE-RULE-GLOBAL-2215-0001, CANON-CONFLICT-GLOBAL-2215-0001, CANON-SYSTEMS-GLOBAL-2215-0001, PLAN-STORY-2215-0001]
OUTPUTS: [scene_card_records]
FORBIDDEN: [prose, world_explanations, new_metrics, unscoped_numbers, gap_filling, meta_diegesis]

## DEFINITIONS

[FACT][SCA5-DEF-010] `scene_card` = record fields: scene_id, chapter_id, time, where, pov, goal, measurable, artifact, cmc, output, hook, tags.
[FACT][SCA5-DEF-011] `cmc` = CAUSE → MECHANISM → CONSEQUENCE (single-line, procedural).
[FACT][SCA5-DEF-012] `measurable` = key=value list; numeric values MUST carry units when applicable.
[FACT][SCA5-DEF-013] `artifact` = CD|EL|CM|FM|RP|PRS|none plus subtype in parentheses.

## INVARIANTS

[DECISION][SCA5-INV-010] Each `scene_card` MUST remain non-prose: only operational intent and constraints.
[DECISION][SCA5-INV-011] Each `scene_card` MUST be self-scoped via `where` and MUST include `scene_id` and `chapter_id`.
[DECISION][SCA5-INV-012] If `measurable` includes environment sensors, they MUST be traceable to BASELINE-PHYSICAL_LEVEL_MID-2215-0001 ranges OR explicit override.
[FORBIDDEN][SCA5-INV-013] Introducing new macro world numbers inside scene cards (SSOT-only numbers remain in SSOT/CANON-METRICS).
[DECISION][SCA5-INV-020] Placeholder ellipsis ("..."/"…") is forbidden in cards; use UNKNOWN or omit the field.

## CONTENT

### CH-30 — The Authorization

[FACT][SCA5-001] scene_id=SC-30.1; chapter_id=CH-30; time="09:00 (Morning)"; where="Москва, кабинет регулятора (срочный контур)"; pov="Лейсан"; goal="запустить легальный рычаг принуждения"; measurable="suspension_window=12h; scope_subsystems=2"; artifact="CD(lic_sus_tsro_order_conditions)"; cmc="доказан manual override → аварийное решение регулятора → ФССУ получает окно полномочий"; output="законное время на действие"; hook="оператор активирует режим сохранения/чистки"; tags="office, bureaucracy, restless".
[FACT][SCA5-002] scene_id=SC-30.2; chapter_id=CH-30; time="10:30 (Morning)"; where="Временный штаб ФССУ (Москва)"; pov="Мирон"; goal="план операции в рамках ограничений"; measurable="teams=3; nodes=2; server_room=1; deadline=11h12m"; artifact="CD(plan_schedule_roles)"; cmc="окно короткое → параллельность обязательна → ошибка = провал"; output="запуск групп"; hook="без chain-of-custody улики снесут в суде"; tags="map, planning, flow".
[FACT][SCA5-003] scene_id=SC-30.3; chapter_id=CH-30; time="13:00 (Day)"; where="Выезд / логистический канал"; pov="Айдар"; goal="превратить решение в движение и риск времени"; measurable="ETA=2h20m; connectivity_delta=−25%"; artifact="CD(escort_protocol)"; cmc="центр дал приказ → поле исполняет → задержка = потеря улик"; output="ставка по времени задана"; hook="у оператора свои группы на узлах"; tags="transport, speed, kinetic".

### CH-31 — Seizure (Physical Layer)

[FACT][SCA5-004] scene_id=SC-31.1; chapter_id=CH-31; time="17:45 (Sunset)"; where="Узел накопителей (внешний кластер)"; pov="Айдар"; goal="физически закрепить приостановку"; measurable="time_to_lock=9m"; artifact="EL(suspension_enforcement_act)"; cmc="приказ → сопротивление/затяжка оператора → ФССУ изолирует контур"; output="узел под контролем"; hook="борьба за шкаф подписи"; tags="industrial, sunset, kinetic".
[FACT][SCA5-005] scene_id=SC-31.2; chapter_id=CH-31; time="18:00 (Dusk)"; where="Шкаф подписи / контроллер доверия"; pov="Мирон"; goal="добыть юридически значимый объект (фиксация)"; measurable="auto_lock_in=90s"; artifact="EL(signature_keys_trusted_module_inventory)"; cmc="без ключей оператор переподпишет/отыграет → изъятие → рычаг контроля"; output="юридическое закрепление силы ФССУ"; hook="попытка purge на соседнем сегменте"; tags="hardware, tension, kinetic".
[FACT][SCA5-006] scene_id=SC-31.3; chapter_id=CH-31; time="18:15 (Dusk)"; where="Серверный сегмент узла"; pov="Лев"; goal="отбить purge и сохранить «как было»"; measurable="purge_in=110s; dump_size=1.4TB"; artifact="EL(kpi_weights_configs_dump_pre)"; cmc="оператор чистит следы → физический дамп → веса «до» сохранены"; output="база для пересчёта получена"; hook="найден пакет KPI v.next"; tags="hacking, timer, flow".
[FACT][SCA5-007] scene_id=SC-31.4; chapter_id=CH-31; time="18:30 (Dusk)"; where="Внешний периметр"; pov="Айдар"; goal="короткий экшен с последствиями и протоколом"; measurable="duration=45–75s; injuries=1(nonfatal)"; artifact="CD(coercion_record)"; cmc="охрана давит → ФССУ удерживает → операция не срывается"; output="контроль сохранён"; hook="осталось ~4 часа"; tags="standoff, action, kinetic".

### CH-32 — The Price of Efficiency

[FACT][SCA5-008] scene_id=SC-32.1; chapter_id=CH-32; time="20:00 (Evening)"; where="Временный штаб (на объекте)"; pov="Лев"; goal="показать «зло в коэффициентах» как доказательство"; measurable="human_cost_weight=0.03→0.21"; artifact="CM(kpi_matrix_before_after_decisions)"; cmc="заниженный вес → приоритеты режут мед/энергию → люди платят"; output="механизм доказан"; hook="оператор утверждает «иначе сеть упадёт»"; tags="data, realization, void".
[FACT][SCA5-009] scene_id=SC-32.2; chapter_id=CH-32; time="21:00 (Evening)"; where="Мини-слушание регулятора по каналу"; pov="Лейсан"; goal="превратить математику в норму"; measurable="red_line_threshold=accepted_conditionally"; artifact="CD(decision_protocol_draft)"; cmc="доказан вред → меняют требования → оператор обязан внедрить"; output="коррекция становится обязательной"; hook="апелляция неизбежна"; tags="remote_call, law, restless".
[FACT][SCA5-010] scene_id=SC-32.3; chapter_id=CH-32; time="22:00 (Night)"; where="Разговор лидера с корп-связным"; pov="Мирон"; goal="человеческий слой «антагонист = функция»"; measurable="none"; artifact="none"; cmc="корп-логика защиты эффективности (Оскар) → конфликт ценностей → отсутствие монстров"; output="ясна природа системы"; hook="нужно публичное давление"; tags="dialogue, smoke, velvet".

### CH-33 — Visibility

[FACT][SCA5-011] scene_id=SC-33.1; chapter_id=CH-33; time="09:00 (Next Day)"; where="Москва, коммуникационный контур ФССУ"; pov="Мирон"; goal="выпуск сводки как инструмент давления"; measurable="public_pages=1; closed_pages=47"; artifact="PRS(summary_plus_annex)"; cmc="прямого наказания нет → давление через риск → оператору становится дорого"; output="включён политико-экономический рычаг"; hook="страховые/регионы требуют действий"; tags="media, publish, flow".
[FACT][SCA5-012] scene_id=SC-33.2; chapter_id=CH-33; time="10:00 (Next Day)"; where="Реакция системы (монтаж)"; pov="Лев"; goal="показать последствия публикации"; measurable="insurance_risk_coef_delta=+8%; new_audits=+3"; artifact="CD(event_feed_rollup)"; cmc="цифры стали видимыми → риск монетизировался → система реагирует"; output="ФССУ больше не тишина"; hook="регулятор готовит урезание лицензии"; tags="chaos, news, kinetic".

### CH-34 — The Settlement

[FACT][SCA5-013] scene_id=SC-34.1; chapter_id=CH-34; time="14:00 (Day)"; where="Москва, заседание по лицензии"; pov="Лейсан"; goal="формальная развязка без переворота мира"; measurable="license_scope_reduced=true; audit_cadence=quarterly"; artifact="CD(regulator_decision_requirements)"; cmc="доказан системный риск → урезание режима → оператор теряет часть полномочий"; output="частичная победа"; hook="оператор подаёт апелляцию"; tags="court, sterile, restless".
[FACT][SCA5-014] scene_id=SC-34.2; chapter_id=CH-34; time="15:30 (Day)"; where="Коридор после заседания"; pov="Мирон"; goal="победа без триумфа"; measurable="none"; artifact="CD(monitoring_continues_notice)"; cmc="система скорректировалась → цена уже заплачена → жизнь идёт дальше"; output="тон удержан"; hook="возвращение домой"; tags="fatigue, relief, flow".

### CH-35 — Home (Chelny)

[FACT][SCA5-015] scene_id=SC-35.1; chapter_id=CH-35; time="19:00 (Sunset)"; where="Набережные Челны, утренний маршрут Avtozavodsky → Centralny"; pov="Мирон"; goal="это мой город, но выросший"; measurable="traffic_flow=0.66; district=Centralny; green_index=0.72; river=Kama; port_activity=0.61; river_level=UNKNOWN"; artifact="CD(city_environment_panel_kama_status_line)"; cmc="новая политика KPI → перераспределение → людям чуть легче"; output="эффект виден локально"; hook="жизнь продолжается"; tags="city, home, restless".
[FACT][SCA5-016] scene_id=SC-35.2; chapter_id=CH-35; time="20:00 (Evening)"; where="Больница"; pov="Мирон"; goal="тихая верификация результата"; measurable="power_reserve_delta=+12%; cancelled_procedures=down"; artifact="EL(updated_power_regime_protocol)"; cmc="веса изменены → приоритет медконтуров поднят → конкретный эффект"; output="победа материальна"; hook="остаточный риск ≠ 0"; tags="hospital, quiet, velvet".
[FACT][SCA5-017] scene_id=SC-35.3; chapter_id=CH-35; time="21:00 (Evening)"; where="Площадь / медиафасад (data-art)"; pov="Мирон"; goal="культура как фон системы"; measurable="city_feed=real_time"; artifact="CD(data_art_feed)"; cmc="логи стали культурой → люди живут рядом с цифрами → нормализация"; output="мир живой"; hook="none"; tags="art, neon, flow".
[FACT][SCA5-018] scene_id=SC-35.4; chapter_id=CH-35; time="21:30 (Evening)"; where="Капсула"; pov="Мирон"; goal="музыка как выбор формата"; measurable="mode=adaptive_mix→fixed_track; route_tag=riverbank"; artifact="CD(player_switch_micro_log)"; cmc="фон-алгоритм → человеческий выбор → песня жива"; output="финальная точка"; hook="уведомление о новой аномалии в другом узле; триггер=день матча / событие у стадиона КАМАЗ → всплеск трафика в HUD"; tags="music, intimacy, velvet".

## USAGE / RESOLUTION

[DECISION][SCA5-USE-010] This document is TYPE C (scene inputs). Statements herein are CARD records, not world facts.
[DECISION][SCA5-USE-020] The prose engine may only consume data declared in OUTPUT CONTRACT.
[DECISION][SCA5-USE-030] Any missing/UNKNOWN values must remain UNKNOWN (no invention).

## OUTPUT CONTRACT

~~~yaml
EXPORTS:
  - scene_card_records:
      source_section: "## CONTENT"
      container: "kvline_semicolon"
      record_start_pattern: '^\\[FACT\\]\\[SCA5-[0-9]{3}\\]\s+scene_id=SC-[0-9]{2}\.[0-9]+;'
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

[FORBIDDEN][SCA5-FBD-010] Treat scene card items as new SSOT/baseline facts.
[FORBIDDEN][SCA5-FBD-020] Fill in unspecified instruments/locations/actors not present in corpus STATE/ENTITIES/PROCEDURES.
[FORBIDDEN][SCA5-FBD-030] Emit any doc ids, file paths, YAML tokens, or protocol/spec/registry terms in diegetic prose.

## NON-NORMATIVE

(empty)