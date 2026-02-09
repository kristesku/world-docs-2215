---
id: CANON-CITY-RU-2215-0007
title: >
  RU 2215 — City Anchor Gateway: Chelny / Chelny–Yelabuga / Moscow (INTERFACE)
class: canon
status: draft
version: 1.0.1
prefix: CTY
doc_language: en-US
prose_language: ru-RU
inputs:
  - CANON-CITY_REGISTRY-RU-2215-0001
  - CANON-CITY_RULES-RU16-2215-0001
depends_on:
  - SPEC-DOC_STYLE-2215-0001
  - SPEC-PRIORITY_RESOLUTION-2215-0001
scope: >
  INTERFACE-шлюз для city anchors: владение доменом якорей, перечень
  потребляемых источников (STATE registry + RULE invariants), и запреты.
  Не содержит token pools и не содержит правил (кроме ownership/consumes/forbids).
---

## LLM-INTENT

ROLE_TYPE: INTERFACE
SCOPE: own and expose city anchors as an interface (single entrypoint) while delegating data/rules to registry and rule docs
INPUTS: [CANON-CITY_REGISTRY-RU-2215-0001, CANON-CITY_RULES-RU16-2215-0001]
OUTPUTS: [owns, consumes, forbids]
FORBIDDEN: [token_values, rule_definition, state_definition, implicit_application]

## DEFINITIONS

[FACT][CTY-010] `CITY_ANCHORS_RU` = ownership domain for city anchor tokens and their scene-level usage interface.
[FACT][CTY-011] `CITY_CONTRAST_RU` = ownership domain for contrast pairing semantics (Chelny vs Moscow).
[FACT][CTY-012] `anchor_registry_doc` = CANON-CITY_REGISTRY-RU-2215-0001.
[FACT][CTY-013] `anchor_invariants_doc` = CANON-CITY_RULES-RU16-2215-0001.

## INVARIANTS

[DECISION][CTY-020] This document MUST remain thin INTERFACE-only: ownership/consumes/forbids; ELSE FAIL.
[DECISION][CTY-021] Token pools MUST be sourced only from anchor_registry_doc; ELSE FAIL.
[DECISION][CTY-022] City invariants MUST be sourced only from anchor_invariants_doc; ELSE FAIL.
[FORBIDDEN][CTY-023] Embedding city token pools or city morphology prose here; ELSE FAIL.

## CONTENT

### 1. Ownership and consumption

[DECISION][CTY-100] Interface owns CITY_ANCHORS_RU and CITY_CONTRAST_RU.
[DECISION][CTY-110] Interface consumes anchor_registry_doc and anchor_invariants_doc.

### 2. Applicability note (delegated)

[DECISION][CTY-200] Applicability mechanics (how scenes explicitly reference this gateway) MUST be defined by the scene contract; ELSE FAIL.
[DECISION][CTY-210] No implicit application is allowed unless a scene contract declares an explicit reference mechanism; ELSE FAIL.

## USAGE / RESOLUTION

[DECISION][CTY-300] Consumers MUST treat only OUTPUT CONTRACT exports as consumable semantics; ELSE FAIL.
[DECISION][CTY-310] Conflict resolution MUST follow SPEC-PRIORITY_RESOLUTION-2215-0001; ELSE FAIL.

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-CITY-RU-2215-0007
role_type: INTERFACE
export:
  - owns: ["CITY_ANCHORS_RU","CITY_CONTRAST_RU"]
  - consumes: ["CANON-CITY_REGISTRY-RU-2215-0001","CANON-CITY_RULES-RU16-2215-0001"]
  - forbids:
      - "implicit_application_without_scene_contract_reference"
      - "token_pool_values_inside_interface_doc"
      - "rule_or_state_definition_inside_interface_doc"
~~~

## FORBIDDEN

[FORBIDDEN][CTY-900] Treating this INTERFACE as a data source for token pools (use CANON-CITY_REGISTRY-RU-2215-0001).
[FORBIDDEN][CTY-910] Treating this INTERFACE as a rule source for invariants (use CANON-CITY_RULES-RU16-2215-0001).
[FORBIDDEN][CTY-920] Implicit application to scenes without explicit scene-contract reference mechanism.

## NON-NORMATIVE

~~~text
Single entrypoint for scenes: reference CANON-CITY-RU-2215-0007.
Data: CANON-CITY_REGISTRY-RU-2215-0001 (STATE).
Invariants: CANON-CITY_RULES-RU16-2215-0001 (RULE).
~~~
