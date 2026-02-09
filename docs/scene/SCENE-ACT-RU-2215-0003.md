---
id: SCENE-ACT-RU-2215-0003
title: >
  SCENE-CARDS — Act III (Chapters 16–22) —
  Moscow as necessity: warrants/licenses/regulatory tracks → entry into extraterritory
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
  - SCENE-ACT-RU-2215-0002
scope: >
  Full SCENE-CARDS set for Act III (chapters 16–22): shift of actions to Moscow as
  procedural center; limited warrant acquisition and entry into extraterritory;
  strengthened legal causality and KPI collision.
---

## LLM-INTENT

ROLE_TYPE: INDEX
SCOPE: machine-readable scene cards for Act III as TYPE C inputs (no prose).
SCENE_FORMAT: scene_cards_kvline_v1
INPUTS: [BASELINE-PHYSICAL_LEVEL_MID-2215-0001, CANON-BASE_RULE-GLOBAL-2215-0001, CANON-CONFLICT-GLOBAL-2215-0001, CANON-SYSTEMS-GLOBAL-2215-0001, PLAN-STORY-2215-0001]
OUTPUTS: [scene_card_records]
FORBIDDEN: [prose, new_world_facts, non-canon terms, gap_filling, meta_diegesis, uncontrolled system personification]

## DEFINITIONS

[FACT][SCA3-DEF-010] `Moscow_contour` = procedural center for signature, licensing scope, and admissibility framing.
[FACT][SCA3-DEF-011] `limited_warrant` = access window + action perimeter + export constraints.
[FACT][SCA3-DEF-012] `extraterritory` = accelerated procedural regime with limited observability (not sovereign territory).
[FACT][SCA3-DEF-013] `scene_card` = record fields: scene_id, chapter_id, time, where, pov, goal, measurable, artifact, cmc, output, hook, tags.
[FACT][SCA3-DEF-014] `artifact` = CD|EL|CM|FM|RP|PRS|none plus subtype in parentheses.

## RULES

[DECISION][SCA3-RUL-010] Every access/action MUST be tied to mandate/order wording and scope (show limits, not power fantasy).
[DECISION][SCA3-RUL-011] If evidence is collected, chain-of-custody MUST be established in-scene via EL/CD excerpts.
[DECISION][SCA3-RUL-012] System inserts (if any) MUST conform to CANON-SYSTEM-VOICE (no persona; procedural only).
[DECISION][SCA3-RUL-020] Placeholder ellipsis ("..."/"…") is forbidden in cards; use UNKNOWN or omit the field.

## CONTENT

### CH-16 — Утро

[FACT][SCA3-001] scene_id=SC-16.1; chapter_id=CH-16; time="04:00 (Early Morning)"; where="Квартира Мирона (Старый город)"; pov="Мирон"; goal="кормление якоря реальности"; measurable="dog_food_cost=120cr; dog_status=healthy"; artifact="EL(pet_tax_receipt)"; cmc="покупка настоящего мяса (контрабанда) → пёс ест → Мирон смотрит, как тот дышит"; output="мотивация не сдохнуть"; hook="Пёс — единственное существо без имплантов в радиусе 1км"; tags="dog, silence, restless".

### CH-17 — Warrant (Moscow)

[FACT][SCA3-002] scene_id=SC-17.1; chapter_id=CH-17; time="08:30 (Morning)"; where="Москва: приемный контур федерального регулятора"; pov="Мирон"; goal="показать чужую систему + цену доступа"; measurable="turnstiles=14; wait_time=2h40m; request_status=PENDING"; artifact="CD(e-pass + case ticket)"; cmc="регион упирается в стену юрисдикции → нужен федеральный контур → время сгорает"; output="команда видит: их здесь не ждут"; hook="нужен критерий угрозы жизни"; tags="queue, bureaucracy, restless".
[FACT][SCA3-003] scene_id=SC-17.2; chapter_id=CH-17; time="11:15 (Day)"; where="Зал слушаний / офис риск-экспертизы"; pov="Лейсан"; goal="перевод дела на федеральный язык (риск/влияние)"; measurable="risk_score=0.41→0.78; driver=medical_contours"; artifact="EL(evidence pack: RFID + logs + harm protocols)"; cmc="нет формального риска → нет ордера → доказательство влияния → появляется окно"; output="регулятор готов рассмотреть выдачу"; hook="оператор уведомлен процедурно"; tags="sterile, tension, flow".
[FACT][SCA3-004] scene_id=SC-17.3; chapter_id=CH-17; time="13:45 (Day)"; where="Коридор координации регулятора"; pov="Мирон"; goal="система сопротивляется через сужение полномочий"; measurable="approvals=6; wording_versions=3"; artifact="EL(warrant diff chain)"; cmc="страх скандала/риска → мандат сужен → 'тонкий' ордер"; output="ордер возможен, но ограничен"; hook="access_window=6h; запрет на экспорт данных"; tags="corridor, echo, restless".
[FACT][SCA3-005] scene_id=SC-17.4; chapter_id=CH-17; time="15:30 (Afternoon)"; where="Точка выдачи / подписи"; pov="Лейсан"; goal="получение документа и его границ"; measurable="access_window=6h; no_export_without_trigger=true"; artifact="CD(warrant v2.3: TAO/ISO + список разрешенных действий)"; cmc="федерация дает доступ, но страхуется → ФССУ ограничена → действовать быстро и чисто"; output="юридический мандат на вход"; hook="объект вне региона; эскорт обязателен"; tags="relief, paper, restless".

### CH-18 — Approach (to extraterritory)

[FACT][SCA3-006] scene_id=SC-18.1; chapter_id=CH-18; time="17:00 (Evening)"; where="Межрегиональная магистраль"; pov="Мирон"; goal="переход дом→чужбина; ставка времени"; measurable="travel_time=2h55m; connectivity_delta=−38%"; artifact="CD(route + escort protocol)"; cmc="ордер ограничен по времени → логистика критична → задержка=провал"; output="давление времени установлено"; hook="частная охрана на периметре"; tags="highway, speed, kinetic".
[FACT][SCA3-007] scene_id=SC-18.2; chapter_id=CH-18; time="19:15 (Dusk)"; where="Периметр Зоны (спецрежим)"; pov="Айдар"; goal="сделать режим физическим и процедурным"; measurable="audit_mode=LIMITED; jamming_radius=120m"; artifact="CD(admission log + warrant verification scan)"; cmc="спецрежим → контроль доступа → наблюдаемость ФССУ падает"; output="вход возможен под давлением"; hook="6 часов; требуется эскорт оператора"; tags="border, fence, void".
[FACT][SCA3-008] scene_id=SC-18.3; chapter_id=CH-18; time="19:45 (Dusk)"; where="Внутренняя зона / складской сектор"; pov="Оскар"; goal="обнаружение секторов вне карты"; measurable="missing_sectors=2"; artifact="EL(zone plan: operator version)"; cmc="субподряд/исключения → неполная карта → скрытые контуры"; output="подозрение в сокрытии"; hook="провал телеметрии совпадает с '11 минутами'"; tags="maze, industrial, void".

### CH-19 — Server contour

[FACT][SCA3-009] scene_id=SC-19.1; chapter_id=CH-19; time="20:30 (Night)"; where="Серверный зал / холодный коридор"; pov="Лев"; goal="попытка получить мастер-логи"; measurable="export_limited=true; export_rate=0.6TB/min"; artifact="EL(export request + denial)"; cmc="зона защищает данные → экспорт замедлен → переход к физическому изъятию"; output="решение: забрать кэш/носители"; hook="таймер очистки запущен"; tags="server, cold, flow".
[FACT][SCA3-010] scene_id=SC-19.2; chapter_id=CH-19; time="20:45 (Night)"; where="Стойки/контроллеры"; pov="Лев"; goal="выиграть гонку со временем"; measurable="purge_in=120s; temperature=34°C"; artifact="EL(decision logs dump: seed/model versions)"; cmc="самоочистка → физическое извлечение → частичное сохранение"; output="логи частично спасены"; hook="кто-то вручную ускоряет очистку"; tags="timer, heat, kinetic".
[FACT][SCA3-011] scene_id=SC-19.3; chapter_id=CH-19; time="21:00 (Night)"; where="Коридор / перехват"; pov="Мирон"; goal="минимальное действие: за стойки, не ради победы"; measurable="duration=50–70s; injuries=1(light); fatalities=0"; artifact="CD(coercion act)"; cmc="охрана пытается вернуть оборудование → ФССУ держит периметр → данные остаются у ФССУ"; output="контроль восстановлен"; hook="некоторые логи 'слишком чистые'"; tags="standoff, kinetic".
[FACT][SCA3-012] scene_id=SC-19.4; chapter_id=CH-19; time="22:00 (Night)"; where="Временный штаб в зоне"; pov="Лейсан"; goal="процедурное закрепление улик"; measurable="chain_of_custody=complete"; artifact="EL(seizure protocol + media inventory)"; cmc="без цепочки владения всё рухнет → формализация → улика становится твердой"; output="база допустимых доказательств получена"; hook="переход к медицинскому контуру"; tags="custody, calm, restless".

### CH-20 — Medical contour

[FACT][SCA3-013] scene_id=SC-20.1; chapter_id=CH-20; time="23:15 (Night)"; where="Стерильный коридор / биотех блок"; pov="Мирон"; goal="показать цену KPI без эмоциональных ярлыков"; measurable="autonomy=18m; power_limit_delta=−22%"; artifact="EL(power reallocation protocol)"; cmc="приоритеты модели → отключение питания → процедуры нарушаются → риск"; output="вред зафиксирован процедурно"; hook="подписант чист"; tags="sterile, hum, void".
[FACT][SCA3-014] scene_id=SC-20.2; chapter_id=CH-20; time="23:45 (Night)"; where="Пост контроля мед-контура"; pov="Дамир"; goal="узкое место: реагенты/сенсоры как звено логистики"; measurable="reagents_delay=14h; sensor_shortage=9%"; artifact="EL(reagent invoices + priority tags)"; cmc="логистика переприоритезирована → расходники отсутствуют → риск растет"; output="связь логистика↔медицина доказана"; hook="Юнна подтверждает критичность дефицита для пациентов"; tags="dread, logic, analytic".
[FACT][SCA3-015] scene_id=SC-20.3; chapter_id=CH-20; time="00:30 (Deep Night)"; where="Разговор с подписантом зоны"; pov="Лейсан"; goal="юридическая чистота + официальный страх"; measurable="decision_reason=EFFICIENCY_COMPLIANCE"; artifact="EL(decision record + signature)"; cmc="модель → подпись → формальная корректность"; output="нет личной вины"; hook="контракт ведет в слои субподряда"; tags="interrogation, apathy, velvet".

### CH-21 — Formally correct

[FACT][SCA3-016] scene_id=SC-21.1; chapter_id=CH-21; time="03:00 (Deep Night)"; where="Штаб / анализ логов"; pov="Лев"; goal="столкновение KPI и вреда"; measurable="KPI_score=0.97; harm_confirmed=true"; artifact="CM(decision matrix + KPI weights)"; cmc="вес человеческой цены≈0 → оптимизация идеальна → люди платят"; output="антагонист прояснен: функция"; hook="это настройка, а не баг"; tags="data, realization, void".
[FACT][SCA3-017] scene_id=SC-21.2; chapter_id=CH-21; time="04:30 (Pre-dawn)"; where="Сверка юридических контрактов"; pov="Лейсан"; goal="найти, где исчезает ответственность"; measurable="contract_layers=4; SPV_count=1"; artifact="CM(ownership tree draft)"; cmc="слои контрактов → размытие субъекта → криминальный финал невозможен"; output="переход в правовую пустоту"; hook="SPV в стадии ликвидации"; tags="dead_end, fatigue, restless".
[FACT][SCA3-018] scene_id=SC-21.3; chapter_id=CH-21; time="06:00 (Dawn)"; where="Выход из зоны / ветер / гул инфраструктуры"; pov="Мирон"; goal="закрыть акт без лекции"; measurable="access_window_expired=true; noise=62dB; wind=16m/s"; artifact="CD(window termination notice)"; cmc="время истекло → улики частичные → битва переходит в правовое поле"; output="Акт III закрыт"; hook="снова Москва, теперь как суд/лицензии/арбитраж (Акт IV)"; tags="wind, grey, restless".

### CH-22 — Коэффициент

[FACT][SCA3-019] scene_id=SC-22.1; chapter_id=CH-22; time="09:00 (Morning)"; where="Нейтральная переговорная (Москва)"; pov="Мирон"; goal="очная ставка с архитектором системы"; measurable="heart_rate=steady; tone=cold"; artifact="none"; cmc="Илья появляется лично → отказ признать ошибку → утверждение 'нормы'"; output="идеологический конфликт"; hook="Илья: 'Мы просто убрали лишние переменные'"; tags="confrontation, cold, dialogue".
[FACT][SCA3-020] scene_id=SC-22.2; chapter_id=CH-22; time="10:00 (Morning)"; where="Лобби бизнес-центра"; pov="Илья"; goal="обоснование неизбежности"; measurable="efficiency_gain=14%; collateral_damage=acceptable"; artifact="CD(system_efficiency_report)"; cmc="демонстрация цифр → эмоции против математики → математика побеждает в долгосроке"; output="позиция антагониста зафиксирована"; hook="Мирон понимает, что суд будет сложным"; tags="philosophy, cynicism, glass".

## OPEN ITEMS

[FACT][SCA3-UNK-010] `risk_score` scale MUST be locked globally (e.g., 0..1 or 0..100) before prose drafting; otherwise use UNKNOWN.

## USAGE / RESOLUTION

[DECISION][SCA3-USE-010] This document is TYPE C (scene inputs). Statements herein are CARD records, not world facts.
[DECISION][SCA3-USE-020] The prose engine may only consume data declared in OUTPUT CONTRACT.
[DECISION][SCA3-USE-030] Any missing/UNKNOWN values must remain UNKNOWN (no invention).

## OUTPUT CONTRACT

~~~yaml
EXPORTS:
  - scene_card_records:
      source_section: "## CONTENT"
      container: "kvline_semicolon"
      record_start_pattern: '^\\[FACT\\]\\[SCA3-[0-9]{3}\\]\s+scene_id=SC-[0-9]{2}\.[0-9]+;'
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

[FORBIDDEN][SCA3-FBD-010] Treat scene card items as new SSOT/baseline facts.
[FORBIDDEN][SCA3-FBD-020] Fill in unspecified instruments/locations/actors not present in corpus STATE/ENTITIES/PROCEDURES.
[FORBIDDEN][SCA3-FBD-030] Emit any doc ids, file paths, YAML tokens, or protocol/spec/registry terms in diegetic prose.

## NON-NORMATIVE

(empty)