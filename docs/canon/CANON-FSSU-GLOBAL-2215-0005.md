---
id: CANON-FSSU-GLOBAL-2215-0005
title: >
  ФССУ — мандат, юрисдикция, ограничения и принципы ИИ-слоя (2215)
class: canon
status: draft
version: 1.0.0
prefix: FSSU
doc_language: ru-RU
prose_language: ru-RU
inputs:
  - CANON-CONFLICT-GLOBAL-2215-0001
  - CANON-ORDERS-GLOBAL-2215-0003
  - CANON-SYSTEM-ONTOLOGY-2215-0001
  - CANON-SYSTEMS-GLOBAL-2215-0001
depends_on:
  - SPEC-DOC-STYLE-2215-0001
  - SPEC-PRIORITY-RESOLUTION-2215-0001
scope: >
  RULE-канон об ФССУ как федеральной госструктуре.
  Определяет мандат, критерий юрисдикции, ограничения полномочий и принципы ИИ-слоя.
  Региональные и локационные детали вынесены в отдельные документы.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: define FSSU mandate, jurisdiction criterion, authority limits and AI principles
INPUTS: [CANON-CONFLICT-GLOBAL-2215-0001, CANON-ORDERS-GLOBAL-2215-0003, CANON-SYSTEM-ONTOLOGY-2215-0001, CANON-SYSTEMS-GLOBAL-2215-0001]
OUTPUTS: [FSSU_identity, jurisdiction_criterion, allowed_actions, ai_principles]
FORBIDDEN: [FSSU_as_police, FSSU_as_court, arbitrary_surveillance, action_without_order]

## DEFINITIONS

[FACT][FSSU-010] `FSSU` = государственный межведомственный орган реагирования на Systemic_Hazard.
[FACT][FSSU-020] `case` = формально активированный кейс с мандатом и артефактами.
[FACT][FSSU-030] `order` = процедурное разрешение на действие.
[FACT][FSSU-040] `case_owner` = лицо, несущее персональную ответственность за кейс.

## INVARIANTS

[DECISION][FSSU-100] ФССУ MUST быть государственным органом.
[FORBIDDEN][FSSU-110] ФССУ как полиция общего назначения.
[FORBIDDEN][FSSU-120] ФССУ как суд.
[FORBIDDEN][FSSU-130] Произвольная слежка без активного кейса.

## CONTENT

[DECISION][FSSU-200] `FSSU.mission` = "выявление, доказуемость причинности и остановка Systemic_Hazard".

[RULE][FSSU-300] PASS IFF incident.touches.Systemic_Asset = true AND incident.uses.Systemic_Channel = true AND (incident.Safety_Impact >= case_threshold OR incident.Sovereignty_Impact >= case_threshold); ELSE FAIL.
[RULE][FSSU-310] IF FSSU-300 FAIL THEN `incident.route` MUST be "transfer_by_competence"; ELSE FAIL.

[DECISION][FSSU-400] ФССУ использует автономные ИИ-системы для наблюдаемости и анализа.
[FORBIDDEN][FSSU-410] ИИ принимает юридически значимое решение.
[RULE][FSSU-420] IF decision.is_legal_significant = true THEN decision.MUST_have_human_visa = true; ELSE FAIL.

[DECISION][FSSU-500] Логи и телеметрия являются первичными артефактами.
[DECISION][FSSU-510] Документы являются производными представлениями логов.

## USAGE / RESOLUTION

[DECISION][FSSU-800] Термины Systemic_Asset, Systemic_Channel, Systemic_Hazard, Safety_Impact, Sovereignty_Impact MUST разрешаться через CANON-SYSTEM-ONTOLOGY-2215-0001.
[DECISION][FSSU-810] Разрешение конфликтов MUST следовать SPEC-PRIORITY-RESOLUTION-2215-0001.

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-FSSU-GLOBAL-2215-0005
role_type: RULE
export:
  - rule_id: FSSU-300
    intent: jurisdiction gate
    inputs: [incident]
    outputs: [jurisdiction_pass]
  - rule_id: FSSU-310
    intent: routing on jurisdiction fail
    inputs: [incident, jurisdiction_pass]
    outputs: [incident.route]
  - rule_id: FSSU-420
    intent: require human visa for legal-significant decisions
    inputs: [decision.is_legal_significant]
    outputs: [decision.MUST_have_human_visa]
~~~

## FORBIDDEN

[FORBIDDEN][FSSU-900] Региональные якоря (RU-16/CHELNY) и локационные детали офиса в этом документе.
[FORBIDDEN][FSSU-910] Действие без `order`/`mandate`/`emergency` в случаях, где форма требуется CANON-ORDERS-GLOBAL-2215-0003.
[FORBIDDEN][FSSU-920] Любая интерпретация ФССУ как органа обычной уголовной юстиции по умолчанию.

## NON-NORMATIVE

~~~text
Документ является глобальным шлюзом: без региональных привязок.
Региональные нормы и “как устроено в Челнах” выносятся в CANON-FSSU-REGIONAL-RU16-2215-0001 и CANON-LOC-FSSU-OFFICE-CHELNY-2215-0001.
~~~
