---
id: CANON-ARCS-GLOBAL-2215-0001
title: >
  Canon Character Arcs — Emotional Trajectories for OSA Team and System Agents (2215)
class: canon
status: fixed
version: 1.0.0
prefix: ARC
doc_language: en
prose_language: ru-RU
inputs:
  - CANON-CASTREGISTRY-GLOBAL-2215-0001
  - CANON-CAST-VOICE-2215-0001
  - PLAN-STORY-2215-0001
depends_on:
  - SPEC-DOC-STYLE-2215-0001
  - SPEC-PRIORITY-RESOLUTION-2215-0001
scope: >
  Канонические дуги персонажей: начальное состояние, кризисная точка,
  финальное состояние. Определяет эмоциональную траекторию для каждого
  персонажа, чтобы LLM мог выдерживать направление при генерации глав.
  Персонажи — функции системы, но функции с ценой.
  Без художественного текста и без SSOT-метрик.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: define enforceable character arc constraints for chapter generation
INPUTS: [CANON-CASTREGISTRY-GLOBAL-2215-0001, CANON-CAST-VOICE-2215-0001, PLAN-STORY-2215-0001]
OUTPUTS: [arc_table, arc_constraints]
FORBIDDEN: [fiction_prose, backstory_exposition, psychological_diagnosis, hero_journey_template]

## DEFINITIONS

[FACT][ARC-DEF-010] `arc` = trajectory {start_state, crisis_point, end_state, act_range, arc_type}.
[FACT][ARC-DEF-011] `arc_type` ∈ {erosion, discovery, hardening, fracture, persistence, witnessing}.
[FACT][ARC-DEF-012] `erosion` = gradual loss of initial certainty or capacity.
[FACT][ARC-DEF-013] `discovery` = transition from ignorance/naivety to understanding (without heroic epiphany).
[FACT][ARC-DEF-014] `hardening` = reinforcement of initial position through pressure (not positive growth).
[FACT][ARC-DEF-015] `fracture` = permanent split between professional function and personal reality.
[FACT][ARC-DEF-016] `persistence` = unchanged state despite pressure; character endures rather than transforms.
[FACT][ARC-DEF-017] `witnessing` = transformation through observation of systemic cost; moral shift without action power.

## INVARIANTS

[DECISION][ARC-INV-010] Every `person` entity in CASTREGISTRY MUST have exactly one arc defined; ELSE FAIL.
[DECISION][ARC-INV-011] `system_agent` entities MAY have arcs (recommended for agents with >2 chapter appearances).
[DECISION][ARC-INV-012] Arcs MUST NOT imply heroic transformation or moral redemption arc.
[DECISION][ARC-INV-013] crisis_point MUST reference a specific act (not chapter) to allow scene-level flexibility.
[DECISION][ARC-INV-014] end_state MUST be consistent with ending.tone = cold_stability.
[FORBIDDEN][ARC-INV-015] Hollywood-style character growth (from weakness to strength).
[FORBIDDEN][ARC-INV-016] Redemption arcs for system_agents.

## CONTENT

### Arc Table

```yaml
arcs:
  - entity: Мирон
    token: Miron
    arc_type: erosion
    start_state: >
      Рутинный профессионализм, скука 99%-ной оптимизации.
      Знает, что система работает. Не вопрос «зачем», а «когда смена».
    crisis_point:
      act: III
      trigger: >
        Медконтур: видит, что KPI = 0.97, а люди платят телом.
        Понимает: он защищает систему, которая производит вред.
    end_state: >
      Выиграл дело, но потерял иллюзию. Система скорректирована,
      не исправлена. Продолжает работать — потому что больше некому.
      Выбирает песню вручную вместо алгоритма.
    key_scenes: [CH-01, CH-07, CH-16, CH-20, CH-35]

  - entity: Лев
    token: Lev
    arc_type: persistence
    start_state: >
      Монотонный интерфейс. Мир = данные. Люди = переменные.
      Не бесчувственный — disconnected.
    crisis_point:
      act: III
      trigger: >
        Серверный контур: гонка с пурджем. Физическое давление на тело,
        которое он обычно игнорирует. Температура 34°C, пот, таймер.
    end_state: >
      Тот же. Данные по-прежнему важнее лиц. Но теперь знает,
      что его «Это не баг» имеет цену в миллисекундах чужой жизни.
      Не изменился — но пауза перед «Коррекция» стала длиннее.
    key_scenes: [CH-02, CH-04, CH-10, CH-19, CH-32]

  - entity: Айдар
    token: Aidar
    arc_type: hardening
    start_state: >
      Кинетический инструмент. Тело = оружие + транспорт.
      Фантомная боль — фоновый шум. Протокол — объект насмешки.
    crisis_point:
      act: V
      trigger: >
        Изъятие: борьба за шкаф подписи. Охрана давит физически.
        Айдар удерживает — не ради победы, а ради 90 секунд для Лева.
    end_state: >
      Жёстче. Фантомная боль не исчезла, но он перестал её замечать.
      Протокол по-прежнему смешной — но теперь он знает, зачем.
    key_scenes: [CH-01, CH-05, CH-06, CH-18, CH-31]

  - entity: Лейсан
    token: Leysan
    arc_type: fracture
    start_state: >
      Процедурный фильтр. Допустимость = щит.
      Личная жизнь существует, но за стеной NDA.
    crisis_point:
      act: IV
      trigger: >
        Допрос Ильи: человек искренне верит, что защищал бюджет.
        Лейсан понимает: закон не ловит системную функцию.
        Параллельно — разрыв с парнем (CH-12).
    end_state: >
      Профессионально: стала точнее, злее, эффективнее.
      Лично: стена стала толще. Парня больше нет.
      Фиксирует отказ — но за каждым отказом пустота.
    key_scenes: [CH-02, CH-12, CH-17, CH-24, CH-28, CH-34]

  - entity: Дамир
    token: Damir
    arc_type: witnessing
    start_state: >
      Новичок. «А это законно?» — искренний вопрос.
      Видит мир физически, не через данные.
    crisis_point:
      act: III
      trigger: >
        Медконтур (CH-20): задержка реагентов 14ч. Видит, как логистика
        конвертируется в пустую полку, а пустая полка — в риск для пациента.
    end_state: >
      Перестал спрашивать «а это законно?» — теперь знает, что да, законно.
      Именно это и страшно. Не сломан, но тише. «Там люди» — говорит реже,
      но каждый раз это весит больше.
    key_scenes: [CH-03, CH-11, CH-14, CH-20, CH-35]

  - entity: Ринат
    token: Rinat
    arc_type: persistence
    start_state: >
      Политический буфер. Тишина = порядок, шум = проблема.
      Защищает команду сверху, ограничивает снизу.
    crisis_point:
      act: IV
      trigger: >
        Публичное давление (CH-33): его имя в отчёте.
        Тишина больше невозможна — нужно выбирать сторону.
    end_state: >
      Выбрал сторону ОСА — но так, чтобы потом можно было отыграть.
      Тот же. Бюджет по-прежнему не резиновый.
    key_scenes: [CH-17, CH-29, CH-33, CH-34]

  - entity: Юнна
    token: Yunna
    arc_type: persistence
    start_state: >
      Клинический инструмент. Биологический материал — это данные.
      Нулевой small talk.
    crisis_point:
      act: III
      trigger: >
        Медконтур (CH-20): её протоколы нарушены приоритетами KPI.
        Не злится — фиксирует. Это её domain, и он повреждён.
    end_state: >
      Та же. Протоколы восстановлены. Уехала обратно в федеральный центр.
      Не благодарит и не прощается.
    key_scenes: [CH-03, CH-20]

  # System agents (optional arcs)
  - entity: Оскар
    token: Oskar
    arc_type: erosion
    start_state: >
      Профессиональный фрикшн. Вежливый отказ = работа.
      Верит, что оператор в целом прав.
    crisis_point:
      act: IV
      trigger: >
        Арбитраж (CH-24): видит, что settlement = покупка тишины.
        Начинает сомневаться — но функция сильнее сомнения.
    end_state: >
      Помог ОСА войти в зону (Act III), но в финале — снова на стороне
      оператора. Подал протокол несогласия, который никто не прочитает.
    key_scenes: [CH-18, CH-23, CH-24, CH-32, CH-34]

  - entity: Илья
    token: Ilya
    arc_type: hardening
    start_state: >
      Coefficient-vision. Эффективность = защита людей.
      Искренне верит. Не циничен.
    crisis_point:
      act: IV
      trigger: >
        Допрос Лейсан (CH-28): его заморозка аудита дала время на чистку.
        Не раскаивается — объясняет: «я защищал бюджет, регламент позволял».
    end_state: >
      Укрепился. Система скорректирована, но Илья считает, что
      это избыточная реакция. Продолжит оптимизировать.
    key_scenes: [CH-02, CH-22, CH-28]
```

## USAGE / RESOLUTION

[DECISION][ARC-USE-010] Chapter generation MUST check arc table for each participant and maintain trajectory; ELSE FAIL.
[DECISION][ARC-USE-011] Character voice in early acts MUST reflect start_state; after crisis_point — end_state (gradual transition).
[DECISION][ARC-USE-012] crisis_point.act is a guide, not a hard boundary; crisis may begin ±1 chapter earlier.
[DECISION][ARC-USE-013] Conflict resolution MUST follow SPEC-PRIORITY-RESOLUTION-2215-0001; ELSE FAIL.

## OUTPUT CONTRACT

```yaml
doc_id: CANON-ARCS-GLOBAL-2215-0001
role_type: RULE
export:
  arc_table:
    rows: 10
    schema:
      entity: string (display_name_ru)
      token: string (ASCII token)
      arc_type: enum
      start_state: string
      crisis_point: {act: enum, trigger: string}
      end_state: string
      key_scenes: list[chapter_id]
```

## FORBIDDEN

[FORBIDDEN][ARC-FBD-010] Hero's journey template (call to adventure → transformation → return).
[FORBIDDEN][ARC-FBD-011] Redemption arcs for system_agents.
[FORBIDDEN][ARC-FBD-012] Emotional exposition as substitute for procedural consequences.
[FORBIDDEN][ARC-FBD-013] Characters becoming "better people" through suffering.
[FORBIDDEN][ARC-FBD-014] Romantic subplots as primary character development.

## NON-NORMATIVE

```text
Arc types are designed for procedural noir, not heroic fiction:
- erosion: you win but lose something
- discovery: you learn but can't use the knowledge to fix everything
- hardening: pressure makes you harder, not stronger
- fracture: professional success + personal cost
- persistence: you endure; the world doesn't reward endurance
- witnessing: you see the price; seeing changes you, not the world
```
