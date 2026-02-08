---
id: CANON-CAST-GLOBAL-2215-0001
title: >
  Core Team (ОСА) — Cast Gateway (INTERFACE)
class: canon
status: fixed
version: 0.3.1
prefix: CAST
doc_language: ru-RU
prose_language: ru-RU
inputs:
  - CANON-CASTREGISTRY-GLOBAL-2215-0001
  - CANON-CASTRULES-GLOBAL-2215-0001
depends_on:
  - SPEC-DOC-STYLE-2215-0001
  - SPEC-PRIORITY-RESOLUTION-2215-0001
scope: >
  INTERFACE-шлюз канона состава ОСА. Этот документ НЕ содержит реестра (STATE)
  и НЕ содержит правил (RULE). Он определяет единственную точку входа и
  перечисляет обязательные документы: CASTREGISTRY (данные) и CASTRULES (ограничения).
---

## LLM-INTENT

ROLE_TYPE: INTERFACE
SCOPE: provide a single entrypoint for OSA cast by binding required registry and rules documents
INPUTS: [CANON-CASTREGISTRY-GLOBAL-2215-0001, CANON-CASTRULES-GLOBAL-2215-0001]
OUTPUTS: [owns, consumes, forbids]
FORBIDDEN: [registry_definition, rule_definition, prose, mixed_semantics]

## DEFINITIONS

[FACT][CAST-010] `cast_gateway` = документ-указатель, связывающий реестр состава и правила использования.
[FACT][CAST-020] `cast_registry_doc_id` = CANON-CASTREGISTRY-GLOBAL-2215-0001.
[FACT][CAST-030] `cast_rules_doc_id` = CANON-CASTRULES-GLOBAL-2215-0001.
[FACT][CAST-040] `cast_system_osa` = домен/концепт “состав ОСА как система ролей для сцен”.

## INVARIANTS

[DECISION][CAST-100] PASS IFF consumers treat `cast_registry_doc_id` as the only authoritative cast data source; ELSE FAIL.
[DECISION][CAST-110] PASS IFF consumers treat `cast_rules_doc_id` as the only authoritative cast usage constraints source; ELSE FAIL.
[DECISION][CAST-120] This document MUST NOT define registry rows or usage rules; ELSE FAIL.

## CONTENT

[DECISION][CAST-200] Consumers requiring OSA cast MUST load both INPUTS of this document; ELSE FAIL.
[DECISION][CAST-210] Conflict resolution MUST follow SPEC-PRIORITY-RESOLUTION-2215-0001; ELSE FAIL.

## USAGE / RESOLUTION

[DECISION][CAST-300] Downstream docs SHOULD NOT reference cast docs directly; they MUST reference this gateway OR explicitly reference both cast_registry_doc_id and cast_rules_doc_id; ELSE FAIL.
[DECISION][CAST-310] If this gateway is referenced, omission of any of its INPUTS MUST be treated as invalid context; ELSE FAIL.

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-CAST-GLOBAL-2215-0001
role_type: INTERFACE
export:
  - owns: [cast_system_osa]
  - consumes:
      - CANON-CASTREGISTRY-GLOBAL-2215-0001
      - CANON-CASTRULES-GLOBAL-2215-0001
  - forbids:
      - registry_definition
      - rule_definition
      - prose
      - mixed_semantics
~~~

## FORBIDDEN

[FORBIDDEN][CAST-900] Introducing cast registry rows in this document.
[FORBIDDEN][CAST-910] Introducing cast usage rules in this document.
[FORBIDDEN][CAST-920] Consuming any cast data not coming from CANON-CASTREGISTRY-GLOBAL-2215-0001.
[FORBIDDEN][CAST-930] Consuming any cast constraints not coming from CANON-CASTRULES-GLOBAL-2215-0001.

## NON-NORMATIVE

(empty)
