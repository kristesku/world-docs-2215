---
id: IDX-CORPUS-0001
title: >
  Corpus Registry
class: idx
status: draft
prefix: CORP
doc_language: en-US
inputs: []
depends_on: []
scope: >
  Нормативный реестр членства документов корпуса. Определяет, какие doc_id
  считаются частью корпуса, и предоставляет машиночитаемую таблицу навигации.
---

## LLM-INTENT

ROLE_TYPE: INDEX
SCOPE: normative corpus membership registry and navigation table
INPUTS: []
OUTPUTS: [registry_rows]
FORBIDDEN: [worldbuilding, prose, implicit_membership, rule_definition, state_definition]

## DEFINITIONS

[FACT][CORP-010] `registry_row` = запись таблицы с полями {id, file, class, status, role_type, inputs, depends_on}.
[FACT][CORP-020] `membership` = свойство документа считаться частью корпуса.
[FACT][CORP-030] `primary_key` = поле `id`.

## INVARIANTS

[DECISION][CORP-100] Document HAS membership IFF its `id` exists in Registry table; ELSE FAIL.
[DECISION][CORP-110] Any `depends_on` reference MUST exist in Registry; ELSE FAIL.
[DECISION][CORP-115] Any `inputs` reference MUST exist in Registry; ELSE FAIL.
[DECISION][CORP-120] Any document with `status: fixed` MUST exist in Registry; ELSE FAIL.
[DECISION][CORP-130] `id` MUST be unique across rows; ELSE FAIL.
[DECISION][CORP-140] Registry table is the ONLY authoritative membership source; ELSE FAIL.

[FORBIDDEN][CORP-150] Implicit membership by folder presence.
[FORBIDDEN][CORP-160] Redefining rules or state inside this INDEX.
[FORBIDDEN][CORP-170] Narrative or descriptive prose.

## CONTENT

|id|file|class|status|role_type|inputs|depends_on|
|--|----|-----|------|---------|------|----------|
|BASELINE-URBANISM-CHELNY-A-2215-0001|docs/baseline/BASELINE-URBANISM-CHELNY-A-2215-0001.md|baseline|fixed|STATE|SSOT-URBANISM-A-2215-0007|SPEC-DOC_STYLE-2215-0001|
|BASELINE-URBANISM-MOSCOW-A-2215-0001|docs/baseline/BASELINE-URBANISM-MOSCOW-A-2215-0001.md|baseline|fixed|STATE|SSOT-URBANISM-A-2215-0007|SPEC-DOC_STYLE-2215-0001|
|CANON-BUILDING_BLOCK-GLOBAL-2215-0001|docs/canon/CANON-BUILDING_BLOCK-GLOBAL-2215-0001.md|canon|fixed|RULE||SPEC-DOC_ID-2215-0001,SPEC-DOC_STYLE-2215-0001,SPEC-METHODOLOGY-2215-0001|
|IDX-CORPUS-0001|docs/idx/IDX-CORPUS-0001.md|idx|draft|INDEX|||
|SPEC-DOC_ID-2215-0001|docs/spec/SPEC-DOC_ID-2215-0001.md|spec|draft|RULE||SPEC-DOC_STYLE-2215-0001|
|SPEC-DOC_STYLE-2215-0001|docs/spec/SPEC-DOC_STYLE-2215-0001.md|spec|fixed|RULE||SPEC-PRIORITY_RESOLUTION-2215-0001|
|SPEC-METHODOLOGY-2215-0001|docs/spec/SPEC-METHODOLOGY-2215-0001.md|spec|draft|RULE||IDX-CORPUS-0001,SPEC-DOC_ID-2215-0001,SPEC-DOC_STYLE-2215-0001,SPEC-PRIORITY_RESOLUTION-2215-0001|
|SPEC-PRIORITY_RESOLUTION-2215-0001|docs/spec/SPEC-PRIORITY_RESOLUTION-2215-0001.md|spec|fixed|RULE|||
|SSOT-AUTOMATION-A-2215-0004|docs/ssot/SSOT-AUTOMATION-A-2215-0004.md|ssot|draft|STATE||SPEC-DOC_STYLE-2215-0001,SSOT-SCENARIO-A-2215-0001|
|SSOT-CLIMATE-A-2215-0004|docs/ssot/SSOT-CLIMATE-A-2215-0004.md|ssot|draft|STATE||SPEC-DOC_STYLE-2215-0001,SSOT-ENERGY-A-2215-0004,SSOT-SCENARIO-A-2215-0001|
|SSOT-CONSISTENCY-A-2215-0009|docs/ssot/SSOT-CONSISTENCY-A-2215-0009.md|ssot|draft|RULE||SPEC-DOC_STYLE-2215-0001,SSOT-AUTOMATION-A-2215-0004,SSOT-CLIMATE-A-2215-0004,SSOT-DEMOGRAPHY-A-2215-0002,SSOT-ECONOMY-A-2215-0003,SSOT-ENERGY-A-2215-0004,SSOT-GOVERNANCE-SECURITY-A-2215-0005,SSOT-SCENARIO-A-2215-0001,SSOT-URBANISM-A-2215-0007|
|SSOT-DEMOGRAPHY-A-2215-0002|docs/ssot/SSOT-DEMOGRAPHY-A-2215-0002.md|ssot|draft|STATE|SSOT-ECONOMY-A-2215-0003,SSOT-LIFE-A-2215-0007,SSOT-SCENARIO-A-2215-0001|SPEC-DOC_STYLE-2215-0001|
|SSOT-ECONOMY-A-2215-0003|docs/ssot/SSOT-ECONOMY-A-2215-0003.md|ssot|draft|STATE||SPEC-DOC_STYLE-2215-0001,SSOT-AUTOMATION-A-2215-0004,SSOT-SCENARIO-A-2215-0001|
|SSOT-ENERGY-A-2215-0004|docs/ssot/SSOT-ENERGY-A-2215-0004.md|ssot|draft|STATE||SPEC-DOC_STYLE-2215-0001,SSOT-ECONOMY-A-2215-0003,SSOT-SCENARIO-A-2215-0001|
|SSOT-GOVERNANCE-SECURITY-A-2215-0005|docs/ssot/SSOT-GOVERNANCE-SECURITY-A-2215-0005.md|ssot|draft|STATE||SPEC-DOC_STYLE-2215-0001,SSOT-ECONOMY-A-2215-0003,SSOT-SCENARIO-A-2215-0001|
|SSOT-LAW-A-2215-0008|docs/ssot/SSOT-LAW-A-2215-0008.md|ssot|fixed|STATE|SSOT-SCENARIO-A-2215-0001|SPEC-DOC_STYLE-2215-0001|
|SSOT-LIFE-A-2215-0007|docs/ssot/SSOT-LIFE-A-2215-0007.md|ssot|draft|STATE||SSOT-SCENARIO-A-2215-0001,SSOT-DEMOGRAPHY-A-2215-0002,SSOT-ECONOMY-A-2215-0003,SPEC-DOC_STYLE-2215-0001|
|SSOT-LOC-WEATHER-CHELNY-2215-0001|docs/ssot/SSOT-LOC-WEATHER-CHELNY-2215-0001.md|ssot|draft|STATE||SPEC-DOC_STYLE-2215-0001|
|SSOT-SCENARIO-A-2215-0001|docs/ssot/SSOT-SCENARIO-A-2215-0001.md|ssot|draft|STATE||SPEC-DOC_STYLE-2215-0001|
|SSOT-SPACE-INDUSTRY-A-2215-0006|docs/ssot/SSOT-SPACE-INDUSTRY-A-2215-0006.md|ssot|draft|STATE|SSOT-SCENARIO-A-2215-0001,SSOT-ECONOMY-A-2215-0003|SPEC-DOC_STYLE-2215-0001|
|SSOT-URBANISM-A-2215-0007|docs/ssot/SSOT-URBANISM-A-2215-0007.md|ssot|fixed|STATE|SSOT-DEMOGRAPHY-A-2215-0002,SSOT-SCENARIO-A-2215-0001|SPEC-DOC_STYLE-2215-0001|
## USAGE / RESOLUTION

[DECISION][CORP-200] Tools generating AI_CONTEXT or performing lint MUST consume only rows of this table; ELSE FAIL.
[DECISION][CORP-210] Filename MUST equal `<id>.md`; ELSE FAIL.
[DECISION][CORP-220] Path column is informational and MUST NOT redefine membership.

## OUTPUT CONTRACT

~~~yaml
doc_id: IDX-CORPUS-0001
role_type: INDEX
export:
  column_types:
    id: doc_id
    file: path
    class: enum
    status: enum
    role_type: enum
    inputs: doc_id_csv
    depends_on: doc_id_csv
  column_encoding:
    doc_id_csv:
      separator: ","
      empty: ""
      trim: true
  columns:
    - id
    - file
    - class
    - status
    - role_type
    - inputs
    - depends_on
  primary_key: id
  rows_source: CONTENT
~~~

## FORBIDDEN

[FORBIDDEN][CORP-900] Using folder scan as corpus membership.
[FORBIDDEN][CORP-901] Consuming documents not present in this registry.
[FORBIDDEN][CORP-902] Treating any content outside the table in `## CONTENT` as registry data.
[FORBIDDEN][CORP-903] Using placeholders like "—" in CSV-typed columns.
[FORBIDDEN][CORP-904] Emitting spaces around separators in doc_id_csv (must be "," only).

## NON-NORMATIVE

(empty)
