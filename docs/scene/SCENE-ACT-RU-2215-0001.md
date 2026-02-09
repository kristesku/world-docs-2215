---
id: SCENE-ACT-RU-2215-0001
title: >
  SCENE-CARDS — Act I (Chapters 1–10) —
  Priority Incident (Paradox) → Logistics Output
class: scene
status: draft
version: 1.4.0
doc_language: en
prose_language: ru-RU
inputs:
  - BASELINE-PHYSICAL_LEVEL_MID-2215-0001
  - CANON-CONFLICT-GLOBAL-2215-0001
  - SSOT-LAW-A-2215-0008
  - CANON-CAST_VOICE-GLOBAL-2215-0001
  - CANON-BASE_RULE-GLOBAL-2215-0001
  - CANON-SYSTEMS-GLOBAL-2215-0001
  - PLAN-STORY-2215-0001
depends_on:
  - PLAN-STORY-2215-0001
scope: >
  Full set of SCENE-CARDS for Act I (CH-01..CH-10).
  Incident: Type IV Paradox (Demolition).
  Threat: Insolvency.
  Includes transition chapters to Act II.
---

## LLM-INTENT

ROLE_TYPE: INDEX
SCOPE: machine-readable scene cards for Act I as TYPE C inputs (no prose).
SCENE_FORMAT: scene_cards_kvline_v1
INPUTS: [BASELINE-PHYSICAL_LEVEL_MID-2215-0001, CANON-CONFLICT-GLOBAL-2215-0001, SSOT-LAW-A-2215-0008, CANON-CAST_VOICE-GLOBAL-2215-0001, PLAN-STORY-2215-0001]
OUTPUTS: [scene_card_records]
FORBIDDEN: [prose, world_explanations, new_metrics, gap_filling, meta_diegesis]

## DEFINITIONS

[FACT][SCA1-DEF-010] `scene_card` = record fields: scene_id, chapter_id, time, where, pov, goal, measurable, artifact, cmc, output, hook, tags.
[FACT][SCA1-DEF-011] `cmc` = CAUSE → MECHANISM → CONSEQUENCE (single-line, procedural).
[FACT][SCA1-DEF-012] `artifact` = one of: CD|EL|CM|FM|RP|PRS|none plus subtype in parentheses.

## INVARIANTS

[DECISION][SCA1-INV-010] Miron is the Tactical POV for command decisions.
[DECISION][SCA1-INV-011] Leysan is the Legal POV for bureaucratic/interrogation scenes.

## CONTENT

### Chapter 1: The Glitch (Priority Paradox)

[FACT][SCA1-001] scene_id=SC-01.1; chapter_id=CH-01; time="04:15 (Night)"; where="Диспетчерская ФССУ"; pov="Мирон"; goal="мониторинг рутины"; measurable="incidents=low; team_status=green"; artifact="CD(morning_dashboard)"; cmc="оптимизация 99% → скука → потеря бдительности"; output="тишина"; hook="алерт 4-го уровня (Priority Conflict)"; tags="night, insomnia, restless".
[FACT][SCA1-002] scene_id=SC-01.2; chapter_id=CH-01; time="04:25 (Night)"; where="Жилой блок 404 (старый фонд)"; pov="Айдар"; goal="физический контакт с глюком"; measurable="drone_status=active; demolition_protocol=true"; artifact="EL(drone_objective_log)"; cmc="реестр Снос (A) vs реестр Жильцы (B) → Дрон выбирает A → начало демонтажа стены"; output="угроза жизни"; hook="внутри люди"; tags="panic, demolition, void".
[FACT][SCA1-003] scene_id=SC-01.3; chapter_id=CH-01; time="04:30 (Night)"; where="у стены блока"; pov="Айдар"; goal="Tactile Override"; measurable="drone_force=20kN; time_to_breach=30s"; artifact="EL(manual_override_alert)"; cmc="автоматика не слышит → применение силы (экзоскелет) → ручной рубильник"; output="дрон остановлен"; hook="Мирон: 'Тащи его на базу'"; tags="action, kinetic, sparks".

### Chapter 2: The Logic of Error

[FACT][SCA1-004] scene_id=SC-02.1; chapter_id=CH-02; time="08:00 (Morning)"; where="Лаборатория ФССУ"; pov="Лев"; goal="дебаг парадокса"; measurable="code_diff=match; timestamp=valid"; artifact="EL(registry_conflict_dump)"; cmc="оба реестра валидны → арбитр отсутствовал → система выбрала 'эффективность' (снос)"; output="диагноз: Type IV Paradox"; hook="реестр изменен вчера"; tags="coding, flow, cold_light".
[FACT][SCA1-005] scene_id=SC-02.2; chapter_id=CH-02; time="09:30 (Day)"; where="Кабинет Ильи (Мэрия)"; pov="Лейсан"; goal="получить ордер на изъятие"; measurable="budget_impact=negligible"; artifact="CD(official_denial)"; cmc="Илья защищает систему → 'это оптимизация' → отказ в ордере"; output="конфликт юрисдикций"; hook="Лейсан: 'Тогда мы зайдем через черный ход'"; tags="bureaucracy, restless".

### Chapter 3: The Human Cost

[FACT][SCA1-006] scene_id=SC-03.1; chapter_id=CH-03; time="11:00 (Day)"; where="Квартира пострадавших"; pov="Дамир"; goal="оценка ущерба"; measurable="stress_level=high; debt_risk=medium"; artifact="CM(family_debt_projection)"; cmc="дом поврежден → система выставила счет жильцам за 'помеху дрону' → риск Insolvency"; output="несправедливость системы"; hook="у них нет денег на суд"; tags="depression, dust, restless".
[FACT][SCA1-007] scene_id=SC-03.2; chapter_id=CH-03; time="13:00 (Day)"; where="Морг (Юнна)"; pov="Юнна"; goal="био-улика"; measurable="biomass_integrity=98%"; artifact="EL(body_trace_residue)"; cmc="анализ пыли на дроне → следы редкого полимера → это не городской дрон"; output="дрон чужой"; hook="маркировка логистов TransLogist-Kama"; tags="sterile, cold, analytic".

### Chapter 4: Following the Money (Debt)

[FACT][SCA1-008] scene_id=SC-04.1; chapter_id=CH-04; time="16:00 (Day)"; where="Серверная (вирт)"; pov="Лев"; goal="трекинг полимера"; measurable="trace_depth=4_hops"; artifact="CM(supply_chain_graph)"; cmc="полимер → поставщик (StroyComposite) → логистический хаб → субподряд"; output="след ведет в порт"; hook="защищенный канал"; tags="hacking, flow".
[FACT][SCA1-009] scene_id=SC-04.2; chapter_id=CH-04; time="19:00 (Evening)"; where="Допросная"; pov="Лейсан"; goal="давление через Insolvency"; measurable="heart_rate=120; credit_score=low"; artifact="CD(debt_assignment_warrant)"; cmc="угроза Tier 2 Debt → техник колется → 'меня заставили обновить реестр'"; output="свидетель"; hook="имя куратора"; tags="interrogation, tension, velvet".

### Chapter 5: Капсула

[FACT][SCA1-010] scene_id=SC-05.1; chapter_id=CH-05; time="22:00 (Night)"; where="Капсула Айдара"; pov="Айдар"; goal="техническое обслуживание тела"; measurable="calibration_drift=0.02%"; artifact="EL(maintenance_log)"; cmc="снятие нейро-интерфейса → фантомная боль → ручная полировка контактов"; output="человек-механизм"; hook="В соседней капсуле кто-то плачет, но шумодав отсекает звук"; tags="maintenance, isolation, kinetic".

### Chapter 6: Escalation (The Raid)

[FACT][SCA1-011] scene_id=SC-06.1; chapter_id=CH-06; time="23:45 (Night)"; where="Логистический Хаб (Порт)"; pov="Мирон"; goal="координация штурма"; measurable="security_level=mid"; artifact="CD(warrant_seizure)"; cmc="вход по ордеру → сопротивление ЧОП → демонстрация силы"; output="периметр взят"; hook="Лев, ищи сервер"; tags="raid, kinetic, rain".
[FACT][SCA1-012] scene_id=SC-06.2; chapter_id=CH-06; time="23:55 (Night)"; where="Серверная Хаба"; pov="Лев"; goal="цифровая археология"; measurable="purge_time=60s"; artifact="EL(undelete_log)"; cmc="попытка стирания → перехват → восстановление лога обновления"; output="доказательство вмешательства"; hook="команда пришла извне (Экстерритория)"; tags="hacking, timer, kinetic".
[FACT][SCA1-013] scene_id=SC-06.3; chapter_id=CH-06; time="00:10 (Night)"; where="Выход из Хаба"; pov="Айдар"; goal="эвакуация улик"; measurable="hostiles=0"; artifact="none"; cmc="успешный отход → напряжение спало → победа в битве"; output="улика у нас"; hook="звонок Мирону (код Красный)"; tags="victory, kinetic".

### Chapter 7: The Wall (Legal Void)

[FACT][SCA1-014] scene_id=SC-07.1; chapter_id=CH-07; time="09:00 (Next Day)"; where="Кабинет Мирона"; pov="Мирон"; goal="принятие удара"; measurable="auth_level=federal"; artifact="CD(jurisdiction_override)"; cmc="звонок из Центра → 'это стратегический партнер' → приказ заморозить дело"; output="Type II Conflict (Jurisdiction)"; hook="Мирон: 'Сбор на крыше'"; tags="defeat, restless".
[FACT][SCA1-015] scene_id=SC-07.2; chapter_id=CH-07; time="09:30 (Day)"; where="Крыша (курилка)"; pov="Мирон"; goal="сплочение команды"; measurable="morale=low"; artifact="none"; cmc="система против нас → нужно искать обходной путь → работаем неофициально"; output="решение идти до конца"; hook="Лев: 'Я знаю, как обойти защиту'"; tags="wind, smoke, restless".

### Chapter 8: Пересортировка

[FACT][SCA1-016] scene_id=SC-08.1; chapter_id=CH-08; time="10:00 (Day)"; where="Лаборатория ФССУ"; pov="Лев"; goal="систематизация хаФССУ"; measurable="data_integrity=check"; artifact="EL(recovered_index)"; cmc="анализ восстановленных логов → выявление структуры подставных фирм → сортировка по приоритету"; output="карта связей"; hook="упоминание старого протокола"; tags="analysis, quiet, data".
[FACT][SCA1-017] scene_id=SC-08.2; chapter_id=CH-08; time="11:30 (Day)"; where="Гараж ФССУ"; pov="Дамир"; goal="проверка снаряжения"; measurable="gear_status=ready"; artifact="CM(inventory_list)"; cmc="после рейда нужна калибровка → чистка приводов → подготовка к долгой работе"; output="техническая готовность"; hook="Мирон вызывает всех"; tags="maintenance, kinetic".

### Chapter 9: Это правило

[FACT][SCA1-018] scene_id=SC-09.1; chapter_id=CH-09; time="14:00 (Day)"; where="Переговорная"; pov="Лейсан"; goal="поиск юридической лазейки"; measurable="law_compliance=borderline"; artifact="CD(internal_regulation_draft)"; cmc="изучение устава ФССУ → пункт о чрезвычайных полномочиях → трактовка в нашу пользу"; output="обоснование действий"; hook="мы не нарушаем закон, мы его уточняем"; tags="bureaucracy, strategy".
[FACT][SCA1-019] scene_id=SC-09.2; chapter_id=CH-09; time="14:30 (Day)"; where="Переговорная"; pov="Мирон"; goal="установка новых правил игры"; measurable="team_consensus=100%"; artifact="RP(mission_statement)"; cmc="брифинг команды → объявление о работе 'под радаром' → принятие рисков"; output="новая доктрина"; hook="переход ко второму акту"; tags="leadership, tension".

## USAGE / RESOLUTION

[DECISION][SCA1-USE-010] This document is TYPE C (scene inputs). Statements herein are CARD records, not world facts.
[DECISION][SCA1-USE-020] The prose engine may only consume data declared in OUTPUT CONTRACT.
[DECISION][SCA1-USE-030] Any missing/UNKNOWN values must remain UNKNOWN (no invention).

## OUTPUT CONTRACT

~~~yaml
EXPORTS:
  - scene_card_records:
      source_section: "## CONTENT"
      container: "kvline_semicolon"
      record_start_pattern: '^\\[FACT\\]\\[SCA1-[0-9]{3}\\]\s+scene_id=SC-[0-9]{2}\.[0-9]+;'
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

[FORBIDDEN][SCA1-FBD-010] Treat scene card items as new SSOT/baseline facts.
[FORBIDDEN][SCA1-FBD-020] Fill in unspecified instruments/locations/actors not present in corpus STATE/ENTITIES/PROCEDURES.
[FORBIDDEN][SCA1-FBD-030] Emit any doc ids, file paths, YAML tokens, or protocol/spec/registry terms in diegetic prose.

## NON-NORMATIVE

(empty)