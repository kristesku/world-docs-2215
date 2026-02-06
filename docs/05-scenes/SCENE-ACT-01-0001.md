---
id: SCENE-ACT-01-0001
title: >
  SCENE-CARDS — Акт I (Главы 1–10) —
  Инцидент Приоритета (Paradox) → Выход на Логистику
class: scene
status: fixed
version: 1.1.0
inputs:
  - PHYSICAL-BASELINE-2215-0001
  - CANON-CONFLICT-0001
  - SSOT-LAW-A-2215-0008
  - CANON-CAST-VOICE-2215-0001
depends_on:
  - STORY-SKELETON-0001
scope: >
  Полный комплект SCENE-CARDS для Акта I.
  Инцидент: Type IV Paradox (Снос жилого блока).
  Угроза: Insolvency.
---

## LLM-INTENT

ROLE_TYPE: INDEX
SCOPE: machine-readable scene cards for Act I (no prose).
INPUTS: [PHYSICAL-BASELINE-2215-0001, CANON-CONFLICT-0001, SSOT-LAW-A-2215-0008]
OUTPUTS: [scene_card_records]
FORBIDDEN: [prose, world_explanations, new_metrics]

## DEFINITIONS

[FACT][SCA1-DEF-010] `scene_card` = fields: scene_id, chapter_id, where, pov, goal, measurable, artifact, cmc, output, hook.
[FACT][SCA1-DEF-011] `cmc` = CAUSE → MECHANISM → CONSEQUENCE.

## INVARIANTS

[DECISION][SCA1-INV-010] Miron is the Tactical POV for command decisions.
[DECISION][SCA1-INV-011] Leysan is the Legal POV for bureaucratic/interrogation scenes.

## CONTENT

### Chapter 1: The Glitch (Priority Paradox)
[FACT][SCA1-001] scene_id=SC-01.1; chapter_id=CH-01; where="Диспетчерская ОСА"; pov="Мирон"; goal="мониторинг рутины"; measurable="incidents=low; team_status=green"; artifact="CD(morning_dashboard)"; cmc="оптимизация 99% → скука → потеря бдительности"; output="тишина"; hook="алерт 4-го уровня (Priority Conflict)".
[FACT][SCA1-002] scene_id=SC-01.2; chapter_id=CH-01; where="Жилой блок 404 (старый фонд)"; pov="Айдар"; goal="физический контакт с глюком"; measurable="drone_status=active; demolition_protocol=true"; artifact="EL(drone_objective_log)"; cmc="реестр Снос (A) vs реестр Жильцы (B) → Дрон выбирает А → начало демонтажа стены"; output="угроза жизни"; hook="внутри люди".
[FACT][SCA1-003] scene_id=SC-01.3; chapter_id=CH-01; where="у стены блока"; pov="Айдар"; goal="Tactile Override"; measurable="drone_force=20kN; time_to_breach=30s"; artifact="EL(manual_override_alert)"; cmc="автоматика не слышит → применение силы (экзоскелет) → ручной рубильник"; output="дрон остановлен"; hook="Мирон: 'Тащи его на базу'".

### Chapter 2: The Logic of Error
[FACT][SCA1-004] scene_id=SC-02.1; chapter_id=CH-02; where="Лаборатория ОСА"; pov="Лева"; goal="дебаг парадокса"; measurable="code_diff=match; timestamp=valid"; artifact="EL(registry_conflict_dump)"; cmc="оба реестра валидны → арбитр отсутствовал → система выбрала 'эффективность' (снос)"; output="диагноз: Type IV Paradox"; hook="реестр изменен вчера".
[FACT][SCA1-005] scene_id=SC-02.2; chapter_id=CH-02; where="Кабинет Ильи (Мэрия)"; pov="Лейсан"; goal="получить ордер на изъятие"; measurable="budget_impact=negligible"; artifact="CD(official_denial)"; cmc="Илья защищает систему → 'это оптимизация' → отказ в ордере"; output="конфликт юрисдикций"; hook="Лейсан: 'Тогда мы зайдем через черный ход'".

### Chapter 3: The Human Cost
[FACT][SCA1-006] scene_id=SC-03.1; chapter_id=CH-03; where="Квартира пострадавших"; pov="Дамир"; goal="оценка ущерба"; measurable="stress_level=high; debt_risk=medium"; artifact="CM(family_debt_projection)"; cmc="дом поврежден → система выставила счет жильцам за 'помеху дрону' → риск Insolvency"; output="несправедливость системы"; hook="у них нет денег на суд".
[FACT][SCA1-007] scene_id=SC-03.2; chapter_id=CH-03; where="Морг (Юнна)"; pov="Юнна"; goal="био-улика"; measurable="biomass_integrity=98%"; artifact="EL(body_trace_residue)"; cmc="анализ пыли на дроне → следы редкого полимера → это не городской дрон"; output="дрон чужой"; hook="маркировка логистов TransLogist-Kama".

### Chapter 4: Following the Money (Debt)
[FACT][SCA1-008] scene_id=SC-04.1; chapter_id=CH-04; where="Серверная (вирт)"; pov="Лева"; goal="трекинг полимера"; measurable="trace_depth=4_hops"; artifact="CM(supply_chain_graph)"; cmc="полимер → поставщик (StroyComposite) → логистический хаб → субподряд"; output="след ведет в порт"; hook="защищенный канал".
[FACT][SCA1-009] scene_id=SC-04.2; chapter_id=CH-04; where="Допросная"; pov="Лейсан"; goal="давление через Insolvency"; measurable="heart_rate=120; credit_score=low"; artifact="CD(debt_assignment_warrant)"; cmc="угроза Tier 2 Debt → техник колется → 'меня заставили обновить реестр'"; output="свидетель"; hook="имя куратора".

### Chapter 5: Escalation (The Raid)
[FACT][SCA1-010] scene_id=SC-05.1; chapter_id=CH-05; where="Логистический Хаб (Порт)"; pov="Мирон"; goal="координация штурма"; measurable="security_level=mid"; artifact="CD(warrant_seizure)"; cmc="вход по ордеру → сопротивление ЧОП → демонстрация силы"; output="периметр взят"; hook="Лева, ищи сервер".
[FACT][SCA1-011] scene_id=SC-05.2; chapter_id=CH-05; where="Серверная Хаба"; pov="Лева"; goal="цифровая археология"; measurable="purge_time=60s"; artifact="EL(undelete_log)"; cmc="попытка стирания → перехват → восстановление лога обновления"; output="доказательство вмешательства"; hook="команда пришла извне (Экстерритория)".
[FACT][SCA1-012] scene_id=SC-05.3; chapter_id=CH-05; where="Выход из Хаба"; pov="Айдар"; goal="эвакуация улик"; measurable="hostiles=0"; artifact="none"; cmc="успешный отход → напряжение спало → победа в битве"; output="улика у нас"; hook="звонок Мирону (код Красный)".

### Chapter 6: The Wall (Legal Void)
[FACT][SCA1-013] scene_id=SC-06.1; chapter_id=CH-06; where="Кабинет Мирона"; pov="Мирон"; goal="принятие удара"; measurable="auth_level=federal"; artifact="CD(jurisdiction_override)"; cmc="звонок из Центра → 'это стратегический партнер' → приказ заморозить дело"; output="Type II Conflict (Jurisdiction)"; hook="Мирон: 'Сбор на крыше'".
[FACT][SCA1-014] scene_id=SC-06.2; chapter_id=CH-06; where="Крыша (курилка)"; pov="Мирон"; goal="сплочение команды"; measurable="morale=low"; artifact="none"; cmc="система против нас → нужно искать обходной путь → работаем неофициально"; output="решение идти до конца"; hook="Лева: 'Я знаю, как обойти защиту'".

## USAGE / RESOLUTION

[DECISION][SCA1-USE-010] Use this index for Act I generation.
[DECISION][SCA1-USE-011] Miron is the anchor of authority; Leysan is the weapon of law.

## OUTPUT CONTRACT

~~~yaml
doc_id: SCENE-ACT-01-0001
role_type: INDEX
export:
  - record_type: scene_card
~~~