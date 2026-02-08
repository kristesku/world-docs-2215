---
id: SCENE-ACT-RU-2215-0002
title: >
  SCENE-CARDS — Act II (Chapters 10–15) —
  Logistics Expansion → Extraterritorial Contours
class: scene
status: applied
version: 1.2.0
doc_language: en
prose_language: ru-RU
inputs:
  - BASELINE-PHYSICALLEVELMID-2215-0001
  - CANON-BASE-RULE-GLOBAL-2215-0001
  - CANON-CONFLICT-GLOBAL-2215-0001
  - CANON-SYSTEMS-GLOBAL-2215-0001
  - PLAN-STORY-2215-0001
depends_on:
  - SCENE-ACT-RU-2215-0001
scope: >
  Full set of SCENE-CARDS for Act II (CH-10..CH-15).
  Case expansion via logistics, manifestation of institutional boundaries
  and first extraterritorial contours.
---

## LLM-INTENT

ROLE_TYPE: INDEX
SCOPE: machine-readable scene cards for Act II as TYPE C inputs (no prose).
SCENE_FORMAT: scene_cards_kvline_v1
INPUTS: [BASELINE-PHYSICALLEVELMID-2215-0001, CANON-BASE-RULE-GLOBAL-2215-0001, CANON-CONFLICT-GLOBAL-2215-0001, CANON-SYSTEMS-GLOBAL-2215-0001, PLAN-STORY-2215-0001]
OUTPUTS: [scene_card_records]
FORBIDDEN: [prose, new_world_facts, new_macro_numbers, non-canon terminology, gap_filling, meta_diegesis]

## DEFINITIONS

[FACT][SCA2-DEF-010] `scene_card` = record fields: scene_id, chapter_id, time, where, pov, goal, measurable, artifact, cmc, output, hook, tags.
[FACT][SCA2-DEF-011] `cmc` = CAUSE → MECHANISM → CONSEQUENCE (single-line, procedural).
[FACT][SCA2-DEF-012] `measurable` = key=value list; numeric values MUST carry units when applicable.
[FACT][SCA2-DEF-013] `artifact` = CD|EL|CM|FM|RP|PRS|none plus subtype in parentheses.

## RULES

[DECISION][SCA2-RUL-010] No artistic prose; cards are operational scaffolding only.
[DECISION][SCA2-RUL-011] Each card MUST include: where, pov, goal, measurable, artifact, cmc, output, hook.
[DECISION][SCA2-RUL-012] Measurables MUST be traceable to baseline/override/artifact if they become plot-critical.
[DECISION][SCA2-RUL-020] Placeholder ellipsis ("..."/"…") is forbidden in cards; use UNKNOWN or omit the field.

## CONTENT

### CH-10 — Пересортировка (Re-sorting)

[FACT][SCA2-001] scene_id=SC-10.1; chapter_id=CH-10; time="10:00 (Peak)"; where="Центральный логистический хаб"; pov="Лев"; goal="демонстрация масштаба и приоритета"; measurable="throughput=18.2k_containers/h; SLA=99.2%"; artifact="CM(priority_matrix: health/energy/security tiers)"; cmc="оптимизация потока → перераспределение грузов → локальный дефицит без 'ошибок'"; output="доказано: алгоритм решает"; hook="приоритет сенсоров и контроллеров понижен"; tags="industrial, restless, noise".
[FACT][SCA2-002] scene_id=SC-10.2; chapter_id=CH-10; time="10:45 (Peak)"; where="Пульт диспетчера логистики"; pov="Мирон"; goal="поиск ручного следа, не статистики"; measurable="manual_route_overrides=1"; artifact="EL(override_record + executor_id)"; cmc="ручное вмешательство → груз покидает график → узлы недопоставок"; output="появилась конкретная нить"; hook="переписано 'по директиве центра'"; tags="investigation, flow".
[FACT][SCA2-003] scene_id=SC-10.3; chapter_id=CH-10; time="11:15 (Day)"; where="Мосты над узлом"; pov="Мирон"; goal="фиксация 'машины масштаба'"; measurable="noise=68dB; wind=15m/s"; artifact="CD(background movement telemetry/contours)"; cmc="масштаб → дистанция контроля → локальные исполнители бессильны"; output="тон задан"; hook="доступ к центру маршрутизации закрыт для региона"; tags="wind, height, void".

### CH-11 — City over City

[FACT][SCA2-004] scene_id=SC-11.1; chapter_id=CH-11; time="18:30 (Sunset)"; where="Небесные мосты между мегаблоками"; pov="Дамир"; goal="архитектура как транспорт и слепая зона"; measurable="transport_level=+40; traffic_flow=0.74"; artifact="CD(level-route map / wayfinding layer)"; cmc="вертикальная плотность → ускоренные коридоры → появление теневых маршрутов"; output="среда становится участником дела"; hook="контейнеры движутся по верхнему коридору"; tags="traffic, vertical, restless".
[FACT][SCA2-005] scene_id=SC-11.2; chapter_id=CH-11; time="19:00 (Dusk)"; where="Площадь / медиафасад"; pov="Лев"; goal="поп-культура как производная данных"; measurable="energy_flow_viz=real_time"; artifact="CD(public data installation: city ‘breath’)"; cmc="телеметрия города → художественная трансляция → культура из инфраструктуры"; output="мир кажется живым"; hook="скачок энергии совпадает с пропавшим грузом"; tags="media, neon, flow".
[FACT][SCA2-006] scene_id=SC-11.3; chapter_id=CH-11; time="20:00 (Evening)"; where="ОСА / брифинг"; pov="Мирон"; goal="синтез: региональный уровень исчерпан"; measurable="nodes=3; supplier=1; routing_center=1"; artifact="CM(link graph export)"; cmc="концентрация управления → единая точка → у региона нет полномочий"; output="вывод: это 'над нами'"; hook="нужен доступ к федеральному реестру лицензий"; tags="briefing, office, restless".

### CH-12 — Нормальность

[FACT][SCA2-007] scene_id=SC-12.1; chapter_id=CH-12; time="20:30 (Evening)"; where="Квартира Лейсан (Жилой массив 'Sunlight')"; pov="Лейсан"; goal="попытка нормальности"; measurable="stress_level=high; conversation_depth=shallow"; artifact="none"; cmc="парень спрашивает про работу → она не может рассказать детали (NDA) → стена молчания"; output="разрыв между мирами"; hook="Парень: 'Ты снова там, а не здесь'"; tags="home, romance, velvet".

### CH-13 — Witness

[FACT][SCA2-008] scene_id=SC-13.1; chapter_id=CH-13; time="22:15 (Night)"; where="Технический двор подрядчика"; pov="Дамир"; goal="поиск человеческого звена в цепи"; measurable="night_adjustments=true; observability_gap=11m"; artifact="EL(technician tablet local cache)"; cmc="устные директивы → ручные правки маршрутов → отчеты остаются чистыми"; output="свидетель + механизм найдены"; hook="страх перед контрактом"; tags="stealth, shadow, velvet".
[FACT][SCA2-009] scene_id=SC-13.2; chapter_id=CH-13; time="22:45 (Night)"; where="Лестничный пролет"; pov="Мирон"; goal="получение точного ID без угроз"; measurable="id_transfer=true"; artifact="EL(container_or_flight_id transfer record)"; cmc="страх → сотрудничество → точный маршрут"; output="след становится проверяемым"; hook="назначение=ускоренный_режим/экстерритория"; tags="intimidation, noir, velvet".
[FACT][SCA2-010] scene_id=SC-13.3; chapter_id=CH-13; time="23:30 (Night)"; where="ОСА / запрос в реестр"; pov="Лев"; goal="коллизия юрисдикций"; measurable="license_scope=federal; regional_competence=limited"; artifact="EL(state license registry entry)"; cmc="лицензия выдана центром → регион не компетентен → тупик"; output="нужен федеральный ордер/подпись"; hook="без Московской петли не закрыть"; tags="bureaucracy, deadlock, restless".

### CH-14 — Club “Contour”

[FACT][SCA2-011] scene_id=SC-14.1; chapter_id=CH-14; time="01:15 (Deep Night)"; where="Подземный клуб / бывшая парковка"; pov="Мирон"; goal="встреча с информатором + культурный слой"; measurable="BPM=122; SPL=96dB"; artifact="CD(fixed set record: non-adaptive)"; cmc="люди выбирают фиксированную форму → коллективный ритм → человеческий слой рядом с алгоритмами"; output="поп-слой интегрирован"; hook="информатор несет критический дамп"; tags="club, bass, kinetic".
[FACT][SCA2-012] scene_id=SC-14.2; chapter_id=CH-14; time="01:45 (Deep Night)"; where="Край зала / технический угол"; pov="Мирон"; goal="ключевой факт: как делаются 'чистые отчеты'"; measurable="observability_gap=11m; aligns_with=preaudit_cleanup"; artifact="EL(dump: model seed/version or local decision cache)"; cmc="правки до аудита → идеальная отчетность → вред вынесен за KPI"; output="доказанный механизм уклонения"; hook="крупный конвой уходит завтра"; tags="secret, corner, velvet".
[FACT][SCA2-013] scene_id=SC-14.3; chapter_id=CH-14; time="02:10 (Deep Night)"; where="Выход / ночной воздух"; pov="Айдар"; goal="переключение в оперативный режим"; measurable="time_to_convoy_start=7h"; artifact="CD(convoy route)"; cmc="данные получены → нужны физические улики → план перехвата"; output="операция неизбежна"; hook="безопасность частная, 'не региональная'"; tags="street, cold, restless".

### CH-15 — Convoy 7-Delta

[FACT][SCA2-014] scene_id=SC-15.1; chapter_id=CH-15; time="04:30 (Pre-dawn)"; where="Верхний автономный коридор"; pov="Айдар"; goal="развертывание операции; окно времени"; measurable="block_window=150s"; artifact="CD(stop mandate/authorization)"; cmc="подозрительный маршрут → остановка → конфликт с ЧОП"; output="контакт; риск срыва"; hook="попытка вытянуть машины из окна"; tags="highway, ambush, kinetic".
[FACT][SCA2-015] scene_id=SC-15.2; chapter_id=CH-15; time="04:40 (Pre-dawn)"; where="Периметр контейнера"; pov="Мирон"; goal="короткая жесткая акция, без героизма"; measurable="duration=45–60s"; artifact="CD(coercion use record)"; cmc="сопротивление → нейтрализация → контроль периметра"; output="доступ к грузу"; hook="внутри не просто металл"; tags="breach, action, kinetic".
[FACT][SCA2-016] scene_id=SC-15.3; chapter_id=CH-15; time="05:00 (Dawn)"; where="Вскрытие / первичная идентификация"; pov="Лев"; goal="улика федерального масштаба"; measurable="label=accelerated_regime; license_scope=federal"; artifact="EL(RFID + license token / route ID)"; cmc="груз идет в спецрежим → регион не компетентен → нужен федеральный ордер"; output="формальная нужда в Московском контуре"; hook="Конец Акта II: Москва неизбежна"; tags="revelation, fog, void".

## USAGE / RESOLUTION

[DECISION][SCA2-USE-010] This document is TYPE C (scene inputs). Statements herein are CARD records, not world facts.
[DECISION][SCA2-USE-020] The prose engine may only consume data declared in OUTPUT CONTRACT.
[DECISION][SCA2-USE-030] Any missing/UNKNOWN values must remain UNKNOWN (no invention).

## OUTPUT CONTRACT

~~~yaml
EXPORTS:
  - scene_card_records:
      source_section: "## CONTENT"
      container: "kvline_semicolon"
      record_start_pattern: '^\\[FACT\\]\\[SCA2-[0-9]{3}\\]\s+scene_id=SC-[0-9]{2}\.[0-9]+;'
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

[FORBIDDEN][SCA2-FBD-010] Treat scene card items as new SSOT/baseline facts.
[FORBIDDEN][SCA2-FBD-020] Fill in unspecified instruments/locations/actors not present in corpus STATE/ENTITIES/PROCEDURES.
[FORBIDDEN][SCA2-FBD-030] Emit any doc ids, file paths, YAML tokens, or protocol/spec/registry terms in diegetic prose.

## NON-NORMATIVE

(empty)