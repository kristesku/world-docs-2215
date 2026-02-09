---
id: REG-UNKNOWN-2215-0001
title: >
  UNKNOWN Registry — 2215 Corpus
  (Extraction: BASELINE-PHYSICAL_LEVEL_MID-2215-0001)
class: registry
status: draft
version: 1.0.0
inputs:
  - BASELINE-PHYSICAL_LEVEL_MID-2215-0001
depends_on:
  - SPEC-DOC_STYLE-2215-0001
scope: >
  Реестр осознанных неопределённостей корпуса (2215):
  единая точка учёта UNKNOWN, их типизация и формальный путь закрытия
  через документы canon / ssot / baseline / override.
---

## LLM-INTENT

ROLE_TYPE: STATE
SCOPE: track and control consciously unresolved world assumptions (UNKNOWNs).
INPUTS: [BASELINE-PHYSICAL_LEVEL_MID-2215-0001]
OUTPUTS: [unknown_records]
FORBIDDEN: [implicit_resolution, silent_assumptions, narrative_filling]

## DEFINITIONS

[FACT][UNK-DEF-010] `unknown` = зафиксированная неопределённость корпуса, осознанно оставленная открытой и требующая формального закрытия.
[FACT][UNK-DEF-011] `type` ∈ { CANON_DECISION | TO_RESEARCH }.
[FACT][UNK-DEF-012] `closure_path` = формальный путь закрытия UNKNOWN (какой тип документа и какое решение требуется).
[FACT][UNK-DEF-013] `target_doc` = документ(ы), в которых UNKNOWN должна быть закрыта.
[FACT][UNK-DEF-014] `state` ∈ { open | closed }.

## INVARIANTS

[DECISION][UNK-INV-010] Любая осознанная неопределённость ОБЯЗАНА быть зарегистрирована в этом документе до мерджа в main.
[DECISION][UNK-INV-011] UNKNOWN не может быть закрыта «по факту» в сценах или тексте — только через целевой документ.
[DECISION][UNK-INV-012] Закрытие UNKNOWN требует:
  - фиксации решения в target_doc,
  - ссылки на doc_id и раздел,
  - смены `state` на `closed`.
[FORBIDDEN][UNK-INV-013] Введение новых world-фактов без закрытия соответствующей UNKNOWN.

## CONTENT

[FACT][UNK-2215-0001]
unknown_id=UNK-2215-0001;
statement="Никотин / ингаляции — биомед vs культура.";
type=CANON_DECISION;
closure_path="Resolved: Pharma-inhalers only, combustion banned.";
target_doc="BASELINE-SOCIAL-2215-0001";
owner=SYSTEM;
state=closed.

[FACT][UNK-2215-0002]
unknown_id=UNK-2215-0002;
statement="Домашние животные — санитарные ограничения.";
type=CANON_DECISION;
closure_path="Resolved: Biomass tax, robotics norm.";
target_doc="BASELINE-SOCIAL-2215-0001";
owner=SYSTEM;
state=closed.

[FACT][UNK-2215-0003]
unknown_id=UNK-2215-0003;
statement="Индивидуальный декор — допустимые границы.";
type=CANON_DECISION;
closure_path="Resolved: Exterior forbidden (thermal/visual code), interior allowed.";
target_doc="SSOT-URBANISM-A-2215-0007";
owner=SYSTEM;
state=closed.

[FACT][UNK-2215-0004]
unknown_id=UNK-2215-0004;
statement="Тактильные интерфейсы — стандартизация.";
type=TO_RESEARCH;
closure_path="Resolved: Hard-line analog overrides mandatory for critical infra.";
target_doc="REG-TECH-2215-0001";
owner=SYSTEM;
state=closed.

[FACT][UNK-2215-0005]
unknown_id=UNK-2215-0005;
statement="Личные физические артефакты — нормы хранения.";
type=CANON_DECISION;
closure_path="Resolved: Standardized cold storage containers.";
target_doc="REG-TECH-2215-0001";
owner=SYSTEM;
state=closed.

[FACT][UNK-2215-0006]
unknown_id=UNK-2215-0006;
statement="Утилизация тел умерших — этика vs ресурсы.";
type=CANON_DECISION;
closure_path="Resolved: Mandatory Aquamation (Water Reclamation). No burials.";
target_doc="BASELINE-SOCIAL-2215-0001";
owner=SYSTEM;
state=closed.

[FACT][UNK-2215-0007]
unknown_id=UNK-2215-0007;
statement="Статус 'Offline' — право или девиантность.";
type=CANON_DECISION;
closure_path="Resolved: Public offline = suspicious/illegal. Private = luxury.";
target_doc="BASELINE-SOCIAL-2215-0001";
owner=SYSTEM;
state=closed.

[FACT][UNK-2215-0008]
unknown_id=UNK-2215-0008;
statement="Регулирование фертильности и интимных контактов.";
type=CANON_DECISION;
closure_path="Resolved: Licensing for kids, viral monitoring for contact.";
target_doc="BASELINE-SOCIAL-2215-0001";
owner=SYSTEM;
state=closed.

## USAGE / RESOLUTION

[DECISION][UNK-USE-010] Этот документ является единственным допустимым реестром UNKNOWN корпуса 2215.
[DECISION][UNK-USE-011] Любой текст, сцена или baseline, затрагивающие UNKNOWN, ОБЯЗАНЫ ссылаться на `unknown_id`.
[DECISION][UNK-USE-012] После закрытия UNKNOWN запись сохраняется в реестре со `state=closed` и ссылкой на закрывающий документ.

## OUTPUT CONTRACT

~~~yaml
doc_id: REG-UNKNOWN-2215-0001
ROLE_TYPE: STATE
export:
  - record_type: unknown
    fields:
      - unknown_id
      - statement
      - type
      - closure_path
      - target_doc
      - owner
      - state
~~~

## FORBIDDEN

[FORBIDDEN][UNK-FBD-010] Закрывать UNKNOWN через художественный текст.
[FORBIDDEN][UNK-FBD-011] Молчаливо считать UNKNOWN «очевидной».
[FORBIDDEN][UNK-FBD-012] Удалять записи UNKNOWN вместо закрытия.

## NON-NORMATIVE
~~~markdown
UNKNOWN Registry is a control surface, not a brainstorming list.
~~~
