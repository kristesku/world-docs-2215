---
id: THESIS-FSSU-SUBORDINATION-2215-0001
title: >
  Subordination Thesis — FSSU as Government Tech-Regulator, Not a силовой орган (2215)
class: thesis
status: draft
version: 1.0.0
prefix: GOV
doc_language: ru-RU
prose_language: ru-RU
inputs: []
depends_on:
  - SPEC-DOC-ID-2215-0001
  - SPEC-DOC-STYLE-2215-0001
  - THESIS-FSSU-NAME-2215-0001
scope: >
  Фиксация места ФССУ в государственной иерархии (вариант B): под Правительством,
  через техрегуляторный контур; партнёрство с силовыми ведомствами без подчинения;
  рамка полномочий как инженерной системной безопасности.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: define government position, reporting, and interagency boundaries of FSSU
INPUTS: [SPEC-DOC-ID-2215-0001, SPEC-DOC-STYLE-2215-0001, THESIS-FSSU-NAME-2215-0001]
OUTPUTS: [fssu_government_position, interagency_boundary_model, reporting_model]
FORBIDDEN: [fssu_as_police, fssu_as_secret_police, unlimited_mandate, direct_subordination_to_mvd_fsb]

## DEFINITIONS

[FACT][GOV-010] `government` = Правительство РФ как контур исполнительной власти верхнего уровня.
[FACT][GOV-020] `tech_regulatory_contour` = правительственный контур техрегулирования инфраструктуры и систем (не силовой блок).
[FACT][GOV-030] `siloviki` = силовые ведомства (например: МВД/ФСБ/армейские контуры) как партнёры по кейсам, но не управляющий контур ФССУ.
[FACT][GOV-040] `interagency_access` = регламентированный доступ к наблюдаемости и данным иных госорганов по ордерам/процедурам.
[FACT][GOV-050] `law_enforcement` = правоохранительная функция (следствие/задержание/уголовное преследование/пенитенциарный контур).
[FACT][GOV-060] `systemic_safety` = безопасность через корректность/устойчивость системных режимов и наблюдаемость, а не через уголовное преследование.

## INVARIANTS

[DECISION][GOV-100] ФССУ MUST be a federal executive body operating under `government` via `tech_regulatory_contour`.
[DECISION][GOV-110] ФССУ MUST NOT be a `law_enforcement` body.
[DECISION][GOV-120] ФССУ MUST have `interagency_access` as a core capability.
[DECISION][GOV-130] `siloviki` MUST be treated as partners and stakeholders, not as the command chain of ФССУ.
[DECISION][GOV-140] Any depiction of FSSU authority MUST preserve the distinction: systemic_safety ≠ political policing.

## CONTENT

[DECISION][GOV-200] ФССУ относится к техрегуляторному контуру Правительства и действует как инженерный орган `systemic_safety`.
[DECISION][GOV-210] Командная вертикаль ФССУ проходит по линии Правительства и внутренних регламентов ФССУ; она MUST NOT проходить через ведомственные вертикали `siloviki`.
[RULE][GOV-220] IF an incident involves physical violence, armed resistance, or detention beyond FSSU procedural scope THEN FSSU MUST coordinate with `siloviki` via formal interagency channel; ELSE FAIL.
[DECISION][GOV-230] ФССУ формирует "системную рамку" кейса (режимы/каналы/наблюдаемость/risks), внутри которой иные ведомства выполняют свои функции.
[DECISION][GOV-240] ФССУ не владеет наблюдаемостью как активом; ФССУ является потребителем данных государственных контуров наблюдаемости через `interagency_access`.
[DECISION][GOV-250] Давление региональных властей и корпораций адресуется в управленческий контур ФССУ, а не в полевой; это является основной причиной роли "Щит" у регионального руководителя.
[DECISION][GOV-260] Региональные узлы ФССУ имеют локальную ответственность по территориальному контуру и отчитываются в Центр по регламенту техрегуляторного контура.

## USAGE / RESOLUTION

[DECISION][GOV-300] This thesis is applied whenever a scene or canon doc needs to resolve: "кто над ФССУ" and "кто не над ФССУ".
[DECISION][GOV-310] Any future canon rewrite of CANON-OSA-GLOBAL-2215-0005 MUST treat this thesis as the authoritative baseline for subordination and interagency boundaries.

## OUTPUT CONTRACT

~~~yaml
doc_id: THESIS-FSSU-SUBORDINATION-2215-0001
role_type: RULE
export:
  - government_position:
      reports_to: ["Правительство РФ"]
      contour: "tech_regulatory_contour"
      is_law_enforcement: false
      has_interagency_access: true
  - interagency_boundary:
      siloviki_role: "partner_not_command"
      escalation_rule: "violence_or_detention_outside_scope => coordinate_formally"
  - regional_model:
      node_type: "regional_field_node"
      territory: "defined_by_regional_contour"
      reporting: "center_via_tech_regulatory_contour"
~~~

## FORBIDDEN

[FORBIDDEN][GOV-900] Depicting FSSU as a подразделение МВД/ФСБ or as part of their command chain.
[FORBIDDEN][GOV-910] Depicting FSSU as a court, prosecutor, or investigative body.
[FORBIDDEN][GOV-920] Depicting FSSU mandate as unlimited or as political policing.
[FORBIDDEN][GOV-930] Depicting FSSU as the owner of all national observability rather than a regulated consumer.

## NON-NORMATIVE

(empty)
