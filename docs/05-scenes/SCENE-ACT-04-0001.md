---
id: SCENE-ACT-04-0001
title: >
  SCENE-CARDS — Акт IV (Главы 21–25) —
  Москва: арбитраж, лицензии, контуры ответственности и контрмеры системы
class: scene
status: fixed
version: 0.2.0
inputs:
  - PHYSICAL-BASELINE-2215-0001
  - CANON-BASE-0001
  - CANON-CONFLICT-0001
  - CANON-SYSTEMS-0001
  - STORY-SKELETON-0001
depends_on:
  - SCENE-ACT-03-0001
scope: >
  Полный комплект SCENE-CARDS для Акта IV (главы 21–25): эскалация в институциональном
  центре; сходимость линий ответственности/логов/регламентов; ответ системы процедурами,
  санкциями и блокировками. Без художественного текста.
---

## LLM-INTENT

ROLE_TYPE: INDEX
SCOPE: machine-readable scene cards for Act IV chapters 21–25 (no prose).
INPUTS: [PHYSICAL-BASELINE-2215-0001, CANON-BASE-0001, CANON-CONFLICT-0001, CANON-SYSTEMS-0001, STORY-SKELETON-0001]
OUTPUTS: [scene_card_records]
FORBIDDEN: [prose, world_explanations, new_metrics, unscoped_numbers]

## DEFINITIONS

[FACT][SCA4-DEF-010] `scene_card` = record with fields: `scene_id`, `chapter_id`, `where`, `pov`, `goal`, `measurable`, `artifact`, `cmc`, `output`, `hook`.
[FACT][SCA4-DEF-011] `cmc` = `CAUSE → MECHANISM → CONSEQUENCE` summary (single-line, procedural).
[FACT][SCA4-DEF-012] `measurable` = key=value list; numeric values MUST carry units when applicable.
[FACT][SCA4-DEF-013] `artifact` = one of: `CD|EL|CM|FM|RP|PRS|none` plus subtype in parentheses if needed.

## INVARIANTS

[DECISION][SCA4-INV-010] Each `scene_card` MUST remain non-prose: only operational intent and constraints.
[DECISION][SCA4-INV-011] Each `scene_card` MUST be self-scoped via `where` and MUST include `scene_id` and `chapter_id`.
[DECISION][SCA4-INV-012] If `measurable` includes environment sensors, they MUST be traceable to `PHYSICAL-BASELINE-2215-0001` ranges OR explicit override.
[FORBIDDEN][SCA4-INV-013] Introducing new macro world numbers inside scene cards (SSOT-only numbers remain in SSOT/CANON-METRICS).

## CONTENT

[FACT][SCA4-001] scene_id=SC-21.1; chapter_id=CH-21; where="арбитражный комплекс, приём дел"; pov="лидер"; goal="показать масштаб федеральной машины и цену времени"; measurable="queue_cases=126; wait_time=4h10m"; artifact="CD(e_ticket_case_card)"; cmc="централизованный поток → задержки → срочность теряется"; output="ощущение: время съедает правду"; hook="оператор зарегистрировал встречное заявление".
[FACT][SCA4-002] scene_id=SC-21.2; chapter_id=CH-21; where="зал слушаний"; pov="юрист ОСА"; goal="формально изложить причинность и упереться в «нет нарушений»"; measurable="KPI_compliance=97%; harm_episodes=11"; artifact="EL(decision_logs_med_protocols_bundle)"; cmc="модель по контракту → подписи по регламенту → нарушений нет"; output="правовая ничья"; hook="суд требует конкретного виновного субъекта".
[FACT][SCA4-003] scene_id=SC-21.3; chapter_id=CH-21; where="кулуар / коридор"; pov="лидер"; goal="реакция оператора — закрыть шум без признания вины"; measurable="settlement_offer=without_admission"; artifact="CD(settlement_draft)"; cmc="репутационный риск → попытка замять → система сохраняется"; output="ОСА отказывается"; hook="«ищите подрядчика»".

[FACT][SCA4-004] scene_id=SC-22.1; chapter_id=CH-22; where="контур реестров юрлиц / ownership-анализ"; pov="аналитик"; goal="раскрутить цепочку ответственности"; measurable="contract_layers=4; SPV_present=true"; artifact="CM(ownership_tree)"; cmc="дробление контрактов → ответственность рассеивается → нет субъекта"; output="виновный растворён процедурно"; hook="SPV ликвидирована месяц назад".
[FACT][SCA4-005] scene_id=SC-22.2; chapter_id=CH-22; where="адрес SPV (офис-оболочка)"; pov="полевой"; goal="физически подтвердить пустоту"; measurable="employees=0; assets=0"; artifact="EL(premises_inspection_act)"; cmc="фиктивная структура → нет активов → нет взыскания"; output="тупик подтверждён"; hook="контракты всё равно легитимны".
[FACT][SCA4-006] scene_id=SC-22.3; chapter_id=CH-22; where="разговор с чиновником-куратором / контур разъяснений"; pov="юрист ОСА"; goal="институциональное сопротивление без злодейства"; measurable="response=within_norms; responsibility_refused=true"; artifact="CD(clarification_letter)"; cmc="самосохранение аппарата → формализм → давление на ОСА"; output="путь «уголовка» закрыт"; hook="остаётся рычаг лицензии оператора".

[FACT][SCA4-007] scene_id=SC-23.1; chapter_id=CH-23; where="пресс-контур регулятора"; pov="лидер"; goal="борьба за формулировки"; measurable="text_reduction=−60%"; artifact="EL(report_diff_versions)"; cmc="политический риск → стерилизация языка → факты обезврежены"; output="правда становится беззубой"; hook="лидер настаивает оставить цифры ущерба".
[FACT][SCA4-008] scene_id=SC-23.2; chapter_id=CH-23; where="реакция рынка / страховщиков (монтаж)"; pov="аналитик"; goal="показать, что цифры — это давление"; measurable="insurance_risk_coef_delta=+8%"; artifact="CD(insurance_contour_notifications)"; cmc="цифры публичны → риск монетизируется → оператору становится дорого"; output="появляется экономический рычаг"; hook="оператор готовит апелляцию".
[FACT][SCA4-009] scene_id=SC-23.3; chapter_id=CH-23; where="ночной переход / вентиляционный гул (Москва как холод)"; pov="лидер"; goal="медитативная сцена «власть как климат»"; measurable="ventilation_noise=58dB"; artifact="CD(background_transition_telemetry)"; cmc="решения рождаются здесь → регионы исполняют → дистанция"; output="тон удержан"; hook="входящее от информатора".

[FACT][SCA4-010] scene_id=SC-24.1; chapter_id=CH-24; where="транспортный уровень +40 / закрытый переход"; pov="лидер"; goal="безопасная встреча и получение улики умысла"; measurable="manual_override_window=11m"; artifact="EL(local_dump_or_signature_key_or_config_cache)"; cmc="правки перед аудитом → идеальная отчётность → вред скрыт за KPI"; output="доказательство умышленной коррекции"; hook="правки централизованы".
[FACT][SCA4-011] scene_id=SC-24.2; chapter_id=CH-24; where="разговор (коротко)"; pov="информатор"; goal="человеческий риск без мелодрамы"; measurable="none"; artifact="none"; cmc="страх потери контракта/работы → сотрудничество → личная цена"; output="доверие хрупкое"; hook="«апдейт модели завтра»".
[FACT][SCA4-012] scene_id=SC-24.3; chapter_id=CH-24; where="ОСА / верификация дампа"; pov="аналитик"; goal="превратить «сказал» в проверяемый факт"; measurable="human_cost_weight_changed_pre_audit=true"; artifact="EL(model_config_diff)"; cmc="занижение веса → решения оптимальны → люди платят"; output="есть прямой рычаг для регулятора"; hook="требование приостановки лицензии".

[FACT][SCA4-013] scene_id=SC-25.1; chapter_id=CH-25; where="временный штаб ОСА (Москва)"; pov="лидер"; goal="стратегический выбор под дедлайн"; measurable="model_update_in=18h"; artifact="CD(action_plan)"; cmc="ждать суда → проигрыш; действовать быстро → шанс"; output="решение о принудительном аудите"; hook="запрос на приостановку отправлен".
[FACT][SCA4-014] scene_id=SC-25.2; chapter_id=CH-25; where="внутренний спор команды (диалог специалистов)"; pov="команда"; goal="показать конфликт методов"; measurable="none"; artifact="none"; cmc="юрист за процедуру, полевой за силовой вход → компромисс → точечная операция"; output="согласован план «атаковать режим, не людей»"; hook="нужно окно полномочий".
[FACT][SCA4-015] scene_id=SC-25.3; chapter_id=CH-25; where="финал главы / уведомление"; pov="лидер"; goal="запустить ускорение Акта V"; measurable="regulator_reply=prelim_approved; access_window=12h"; artifact="CD(notification_or_draft_order)"; cmc="доказательства достаточны → окно возможно → начинается гонка"; output="старт финального акта"; hook="оператор начнёт чистку".

## USAGE / RESOLUTION

[DECISION][SCA4-USE-010] This document is a scene-record index for Act IV; it MUST be used as the authoritative list of Act IV scene beats.
[DECISION][SCA4-USE-011] Precedence for writing a scene: `RULE → INTERFACE → STATE → BIND → BASELINE → CANON → SCENE`.
[DECISION][SCA4-USE-012] When a `measurable` value conflicts with baseline ranges, the scene MUST reference an explicit override (not invented inside the scene card).
[DECISION][SCA4-USE-013] `artifact` types in scene cards MUST map to the canonical artifact families (CD/EL/CM/FM/RP/PRS); subtype naming MAY vary but MUST remain stable within an act.

## OUTPUT CONTRACT

~~~yaml
doc_id: SCENE-ACT-04-0001
role_type: INDEX
export:
  - record_type: scene_card
    fields: [scene_id, chapter_id, where, pov, goal, measurable, artifact, cmc, output, hook]
    records:
      - note: "Records correspond 1:1 to [FACT][SCA4-001]..[FACT][SCA4-015]."
~~~

## FORBIDDEN

[FORBIDDEN][SCA4-FBD-010] Adding prose, metaphors, or world exposition inside scene cards.
[FORBIDDEN][SCA4-FBD-011] Inventing new metrics or macro numbers not present in SSOT/baseline/canon.
[FORBIDDEN][SCA4-FBD-012] Using emotion-laden measurable tags (e.g., oppressive/terrifying) instead of neutral fields.
[FORBIDDEN][SCA4-FBD-013] Changing scene_id naming or chapter mapping without updating all references.

## NON-NORMATIVE

~~~markdown
SCENE-CARD visual layout is intentionally omitted here; this file is the executable index.
~~~
