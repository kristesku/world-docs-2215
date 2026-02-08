---
id: CANON-OSA-GLOBAL-2215-0005
title: >
  ОСА — мандат, юрисдикция, ограничения и принципы ИИ-слоя (2215)
class: canon
status: draft
version: 1.0.0
prefix: OSA
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
  RULE-канон об ОСА как федеральной госструктуре.
  Определяет мандат, критерий юрисдикции, ограничения полномочий и принципы ИИ-слоя.
  Региональные и локационные детали вынесены в отдельные документы.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: define OSA mandate, jurisdiction criterion, authority limits and AI principles
INPUTS: [CANON-CONFLICT-GLOBAL-2215-0001, CANON-ORDERS-GLOBAL-2215-0003, CANON-SYSTEM-ONTOLOGY-2215-0001, CANON-SYSTEMS-GLOBAL-2215-0001]
OUTPUTS: [osa_identity, jurisdiction_criterion, allowed_actions, ai_principles]
FORBIDDEN: [osa_as_police, osa_as_court, arbitrary_surveillance, action_without_order]

## DEFINITIONS

[FACT][OSA-010] `osa` = государственный межведомственный орган реагирования на Systemic_Hazard.
[FACT][OSA-020] `case` = формально активированный кейс с мандатом и артефактами.
[FACT][OSA-030] `order` = процедурное разрешение на действие.
[FACT][OSA-040] `case_owner` = лицо, несущее персональную ответственность за кейс.

## INVARIANTS

[DECISION][OSA-100] ОСА MUST быть государственным органом.
[FORBIDDEN][OSA-110] ОСА как полиция общего назначения.
[FORBIDDEN][OSA-120] ОСА как суд.
[FORBIDDEN][OSA-130] Произвольная слежка без активного кейса.

## CONTENT

[DECISION][OSA-200] `osa.mission` = "выявление, доказуемость причинности и остановка Systemic_Hazard".

[RULE][OSA-300] PASS IFF incident.touches.Systemic_Asset = true AND incident.uses.Systemic_Channel = true AND (incident.Safety_Impact >= case_threshold OR incident.Sovereignty_Impact >= case_threshold); ELSE FAIL.
[RULE][OSA-310] IF OSA-300 FAIL THEN `incident.route` MUST be "transfer_by_competence"; ELSE FAIL.

[DECISION][OSA-400] ОСА использует автономные ИИ-системы для наблюдаемости и анализа.
[FORBIDDEN][OSA-410] ИИ принимает юридически значимое решение.
[RULE][OSA-420] IF decision.is_legal_significant = true THEN decision.MUST_have_human_visa = true; ELSE FAIL.

[DECISION][OSA-500] Логи и телеметрия являются первичными артефактами.
[DECISION][OSA-510] Документы являются производными представлениями логов.

## USAGE / RESOLUTION

[DECISION][OSA-800] Термины Systemic_Asset, Systemic_Channel, Systemic_Hazard, Safety_Impact, Sovereignty_Impact MUST разрешаться через CANON-SYSTEM-ONTOLOGY-2215-0001.
[DECISION][OSA-810] Разрешение конфликтов MUST следовать SPEC-PRIORITY-RESOLUTION-2215-0001.

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-OSA-GLOBAL-2215-0005
role_type: RULE
export:
  - rule_id: OSA-300
    intent: jurisdiction gate
    inputs: [incident]
    outputs: [jurisdiction_pass]
  - rule_id: OSA-310
    intent: routing on jurisdiction fail
    inputs: [incident, jurisdiction_pass]
    outputs: [incident.route]
  - rule_id: OSA-420
    intent: require human visa for legal-significant decisions
    inputs: [decision.is_legal_significant]
    outputs: [decision.MUST_have_human_visa]
~~~

## FORBIDDEN

[FORBIDDEN][OSA-900] Региональные якоря (RU-16/CHELNY) и локационные детали офиса в этом документе.
[FORBIDDEN][OSA-910] Действие без `order`/`mandate`/`emergency` в случаях, где форма требуется CANON-ORDERS-GLOBAL-2215-0003.
[FORBIDDEN][OSA-920] Любая интерпретация ОСА как органа обычной уголовной юстиции по умолчанию.

## NON-NORMATIVE

~~~text
Документ является глобальным шлюзом: без региональных привязок.
Региональные нормы и “как устроено в Челнах” выносятся в CANON-OSA-REGIONAL-RU16-2215-0001 и CANON-LOC-OSA-OFFICE-CHELNY-2215-0001.
~~~
