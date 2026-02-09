---
id: CANON-LOC-CHELNY-2215-0001
title: >
  RU 2215 — Набережные Челны: Сенсорные дефолты и “maintenance dirt” (Gateway)
class: canon
status: draft
version: 0.4.0
prefix: CHELNYI
doc_language: en-US
prose_language: ru-RU
inputs:
  - CANON-LOC_CHELNY_REGISTRY-GLOBAL-2215-0001
  - CANON-LOC_CHELNY_RULES-GLOBAL-2215-0001
depends_on:
  - SPEC-DOC_STYLE-2215-0001
  - SPEC-PRIORITY_RESOLUTION-2215-0001
scope: >
  INTERFACE-шлюз для scene-дефолтов Челнов-2215: объявляет владение доменом
  локальных маркеров и указывает, какие документы содержат STATE-пулы и RULE-правила.
  Не содержит ни пулов, ни правил (кроме ownership/consumes/forbids).
---

## LLM-INTENT

ROLE_TYPE: INTERFACE
SCOPE: single entrypoint for Chelny-2215 local sensory defaults (thin gateway only)
INPUTS:
  - CANON-LOC_CHELNY_REGISTRY-GLOBAL-2215-0001
  - CANON-LOC_CHELNY_RULES-GLOBAL-2215-0001
OUTPUTS: [owns, consumes, forbids]
FORBIDDEN: [rule_definition, state_definition, token_pool_values, narrative_prose]

## DEFINITIONS

[FACT][CHELNYI-010] `LOC_CHELNY_2215` = ownership domain for Chelny-2215 local sensory/cue tokens and their consumption interface.
[FACT][CHELNYI-011] `registry_doc` = CANON-LOC_CHELNY_REGISTRY-GLOBAL-2215-0001.
[FACT][CHELNYI-012] `rules_doc` = CANON-LOC_CHELNY_RULES-GLOBAL-2215-0001.

## INVARIANTS

[DECISION][CHELNYI-020] This document MUST remain INTERFACE-only; ELSE FAIL.
[DECISION][CHELNYI-021] Token pools MUST be sourced only from registry_doc; ELSE FAIL.
[DECISION][CHELNYI-022] Enforceable constraints MUST be sourced only from rules_doc; ELSE FAIL.

## CONTENT

[DECISION][CHELNYI-100] Interface owns domain `LOC_CHELNY_2215`.
[DECISION][CHELNYI-110] Interface consumes registry_doc and rules_doc.

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-LOC-CHELNY-2215-0001
role_type: INTERFACE
export:
  - owns: ["LOC_CHELNY_2215"]
  - consumes:
      - "CANON-LOC_CHELNY_REGISTRY-GLOBAL-2215-0001"
      - "CANON-LOC_CHELNY_RULES-GLOBAL-2215-0001"
  - forbids:
      - "token_pool_values_inside_interface_doc"
      - "rule_or_state_definition_inside_interface_doc"
      - "implicit_prose_explanations_as_system_descriptions"
~~~

## FORBIDDEN

[FORBIDDEN][CHELNYI-900] Embedding token pools in this INTERFACE.
[FORBIDDEN][CHELNYI-901] Embedding enforceable rules in this INTERFACE.
[FORBIDDEN][CHELNYI-902] Treating NON-NORMATIVE as enforceable semantics.

## NON-NORMATIVE

(Empty by design)
