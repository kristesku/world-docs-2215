---
id: IDX-CORPUS-0001
title: >
  Corpus Registry
class: idx
status: draft
version: 0.2.0
prefix: CORP
doc_language: ru-RU
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

[FACT][CORP-010] `registry_row` = запись таблицы с полями {id, file, class, status, version, role_type, inputs, depends_on, notes}.
[FACT][CORP-020] `membership` = свойство документа считаться частью корпуса.
[FACT][CORP-030] `primary_key` = поле `id`.

## INVARIANTS

[DECISION][CORP-100] Document HAS membership IFF its `id` exists in Registry table; ELSE FAIL.
[DECISION][CORP-110] Any `depends_on` reference MUST exist in Registry; ELSE FAIL.
[DECISION][CORP-120] Any document with `status: fixed` MUST exist in Registry; ELSE FAIL.
[DECISION][CORP-130] `id` MUST be unique across rows; ELSE FAIL.
[DECISION][CORP-140] Registry table is the ONLY authoritative membership source; ELSE FAIL.

[FORBIDDEN][CORP-150] Implicit membership by folder presence.
[FORBIDDEN][CORP-160] Redefining rules or state inside this INDEX.
[FORBIDDEN][CORP-170] Narrative or descriptive prose.

## CONTENT

| id | file | class | status | version | role_type | inputs | depends_on | notes |
| -- | ---- | ----- | ------ | ------- | --------- | ------ | ---------- | ----- |
| BASELINE-DAILYOPS-2215-0002 | docs/baseline/BASELINE-DAILYOPS-2215-0002.md | baseline | draft | 1.1.0 | RULE |  |  | |
| BASELINE-DIGITALIDENTITY-2215-0001 | docs/baseline/BASELINE-DIGITALIDENTITY-2215-0001.md | baseline | fixed | 1.0.0 | RULE |  |  | |
| BASELINE-PHYSICAL-LEVEL-MID-2215-0001 | docs/baseline/BASELINE-PHYSICAL-LEVEL-MID-2215-0001.md | baseline | fixed | 1.1.0 | RULE |  |  | |
| BASELINE-PSYCH-2215-0001 | docs/baseline/BASELINE-PSYCH-2215-0001.md | baseline | fixed | 1.3.0 | STATE |  |  | |
| BASELINE-SECURITY-USE-OF-FORCE-2215-0001 | docs/baseline/BASELINE-SECURITY-USE-OF-FORCE-2215-0001.md | baseline | fixed | 1.0.0 | RULE |  |  | |
| BASELINE-SOCIAL-CIVIC-2215-0001 | docs/baseline/BASELINE-SOCIAL-CIVIC-2215-0001.md | baseline | fixed | 1.2.0 | RULE |  |  | |
| BASELINE-URBAN-OBSERVABILITY-2215-0001 | docs/baseline/BASELINE-URBAN-OBSERVABILITY-2215-0001.md | baseline | fixed | 1.0.0 | RULE |  |  | |
| CANON-ARTIFACT-SNIPPETS-GLOBAL-2215-0001 | docs/canon/CANON-ARTIFACT-SNIPPETS-GLOBAL-2215-0001.md | canon | fixed | 1.1.0 | RULE |  |  | |
| CANON-BASE-NARRATIVE-GLOBAL-2215-0001 | docs/canon/CANON-BASE-NARRATIVE-GLOBAL-2215-0001.md | canon | fixed | 1.0.0 | INTERFACE |  |  | |
| CANON-BASE-RULE-GLOBAL-2215-0001 | docs/canon/CANON-BASE-RULE-GLOBAL-2215-0001.md | canon | fixed | 1.0.0 | RULE |  |  | |
| CANON-CAST-GLOBAL-2215-0001 | docs/canon/CANON-CAST-GLOBAL-2215-0001.md | canon | fixed | 0.3.0 | INTERFACE |  |  | |
| CANON-CAST-PUBLIC-2215-0001 | docs/canon/CANON-CAST-PUBLIC-2215-0001.md | canon | fixed | 1.1.0 | STATE |  |  | |
| CANON-CAST-VOICE-2215-0001 | docs/canon/CANON-CAST-VOICE-2215-0001.md | canon | fixed | 1.3.0 | STATE |  |  | |
| CANON-CITY-BOUNDARY-RU-2215-0008 | docs/canon/CANON-CITY-BOUNDARY-RU-2215-0008.md | canon | draft | 0.1.1 | RULE |  |  | |
| CANON-CITY-RU-2215-0007 | docs/canon/CANON-CITY-RU-2215-0007.md | canon | draft | 1.0.0 | INTERFACE |  |  | |
| CANON-CITY-RULES-RU-2215-0001 | docs/canon/CANON-CITY-RULES-RU-2215-0001.md | canon | draft | 1.0.1 | RULE |  |  | |
| CANON-CONFLICT-GLOBAL-2215-0001 | docs/canon/CANON-CONFLICT-GLOBAL-2215-0001.md | canon | fixed | 1.1.0 | RULE |  |  | |
| CANON-CORE-GLOBAL-2215-0001 | docs/canon/CANON-CORE-GLOBAL-2215-0001.md | canon | fixed | 1.2.0 | BIND |  |  | |
| CANON-LOC-CHELNY-2215-0001 | docs/canon/CANON-LOC-CHELNY-2215-0001.md | canon | draft | 0.3.0 | RULE |  |  | |
| CANON-METRICS-GLOBAL-2215-0002 | docs/canon/CANON-METRICS-GLOBAL-2215-0002.md | canon | draft | 2.2.0 | RULE |  |  | |
| CANON-ORDERS-GLOBAL-2215-0003 | docs/canon/CANON-ORDERS-GLOBAL-2215-0003.md | canon | draft | 1.1.0 | RULE |  |  | |
| CANON-ORGS-2215-0001 | docs/canon/CANON-ORGS-2215-0001.md | canon | fixed | 1.2.0 | STATE |  |  | |
| CANON-OSA-GLOBAL-2215-0005 | docs/canon/CANON-OSA-GLOBAL-2215-0005.md | canon | draft | 0.1.1 | RULE |  |  | |
| CANON-RECENT-20Y-MEMORY-PACK-2215-0001 | docs/canon/CANON-RECENT-20Y-MEMORY-PACK-2215-0001.md | canon | fixed | 1.0.0 | INTERFACE |  |  | |
| CANON-REPORTS-GLOBAL-2215-0006 | docs/canon/CANON-REPORTS-GLOBAL-2215-0006.md | canon | draft | 0.3.0 | RULE |  |  | |
| CANON-SCENE-RULESET-2215-0001 | docs/canon/CANON-SCENE-RULESET-2215-0001.md | canon | draft | 0.1.0 | RULE |  |  | |
| CANON-SYSTEM-VOICE-GLOBAL-2215-0001 | docs/canon/CANON-SYSTEM-VOICE-GLOBAL-2215-0001.md | canon | draft | 0.3.0 | RULE |  |  | |
| CANON-SYSTEMS-GLOBAL-2215-0001 | docs/canon/CANON-SYSTEMS-GLOBAL-2215-0001.md | canon | fixed | 1.1.0 | STATE |  |  | |
| CANON-VIBE-FLOW-GLOBAL-2215-0001 | docs/canon/CANON-VIBE-FLOW-GLOBAL-2215-0001.md | canon | draft | 1.0.0 | RULE | CANON-VIBE-RESTLESS-GLOBAL-2215-0001 |  | |
| CANON-VIBE-RESTLESS-GLOBAL-2215-0001 | docs/canon/CANON-VIBE-RESTLESS-GLOBAL-2215-0001.md | canon | draft | 0.1.0 | RULE |  |  | |
| CANON-VOCAB-GLOBAL-2215-0001 | docs/canon/CANON-VOCAB-GLOBAL-2215-0001.md | canon | draft | 1.0.0 | RULE |  |  | |
| CANON-ZONES-GLOBAL-2215-0004 | docs/canon/CANON-ZONES-GLOBAL-2215-0004.md | canon | draft | 1.1.0 | STATE |  |  | |
| IDX-CORPUS-0001 | docs/idx/IDX-CORPUS-0001.md | idx | draft | 0.2.0 | INDEX |  |  | |
| PLAN-DEFAULT-ENVIRONMENT-2215-0001 | docs/plan/PLAN-DEFAULT-ENVIRONMENT-2215-0001.md | plan | draft | 0.3.0 | INTERFACE |  |  | |
| PLAN-STORY-SKELETON-2215-0001 | docs/plan/PLAN-STORY-SKELETON-2215-0001.md | plan | fixed | 0.2.1 | INTERFACE |  |  | |
| PROTOCOL-CHAPTERDELIVERY-2215-0001 | docs/protocol/PROTOCOL-CHAPTERDELIVERY-2215-0001.md | protocol | draft | 1.0.0 | INTERFACE |  |  | |
| REG-TECH-2215-0001 | docs/registry/REG-TECH-2215-0001.md | registry | fixed | 0.3.0 | STATE |  |  | |
| REG-UNKNOWN-2215-0001 | docs/registry/REG-UNKNOWN-2215-0001.md | registry | draft | 1.0.0 | STATE |  |  | |
| SCENE-ACT-RU-2215-0001 | docs/scene/SCENE-ACT-RU-2215-0001.md | scene | fixed | 1.2.0 | INDEX |  |  | |
| SCENE-ACT-RU-2215-0002 | docs/scene/SCENE-ACT-RU-2215-0002.md | scene | fixed | 1.0.0 | INDEX |  |  | |
| SCENE-ACT-RU-2215-0003 | docs/scene/SCENE-ACT-RU-2215-0003.md | scene | fixed | 1.0.0 | INDEX |  |  | |
| SCENE-ACT-RU-2215-0004 | docs/scene/SCENE-ACT-RU-2215-0004.md | scene | fixed | 1.0.0 | INDEX |  |  | |
| SCENE-ACT-RU-2215-0005 | docs/scene/SCENE-ACT-RU-2215-0005.md | scene | fixed | 1.0.0 | INDEX |  |  | |
| SCENE-GEN-PROTOCOL-0001 | docs/scene/SCENE-GEN-PROTOCOL-0001.md | protocol | fixed | 1.5.0 | INTERFACE |  |  | |
| SPEC-DOC-ID-2215-0001 | docs/spec/SPEC-DOC-ID-2215-0001.md | spec | draft | 1.0.0 | RULE |  |  | |
| SPEC-DOC-STYLE-2215-0001 | docs/spec/SPEC-DOC-STYLE-2215-0001.md | spec | fixed | 1.0.2 | RULE |  |  | |
| SPEC-OVERRIDE-CHECKLIST-2215-0001 | docs/spec/SPEC-OVERRIDE-CHECKLIST-2215-0001.md | spec | draft | 1.0.0 | RULE |  |  | |
| SPEC-PRIORITY-RESOLUTION-2215-0001 | docs/spec/SPEC-PRIORITY-RESOLUTION-2215-0001.md | spec | fixed | 1.0.0 | RULE |  |  | |
| SPEC-QUALITATIVE-ENUMS-2215-0001 | docs/spec/SPEC-QUALITATIVE-ENUMS-2215-0001.md | spec | fixed | 1.0.0 | RULE |  |  | |
| SPEC-SCENE-CONTRACT-2215-0001 | docs/spec/SPEC-SCENE-CONTRACT-2215-0001.md | spec | draft | 1.0.1 | RULE |  |  | |
| SSOT-AUTOMATION-A-2215-0004 | docs/ssot/SSOT-AUTOMATION-A-2215-0004.md | ssot | draft | 1.1.0 | STATE |  |  | |
| SSOT-CLIMATE-A-2215-0004 | docs/ssot/SSOT-CLIMATE-A-2215-0004.md | ssot | draft | 1.1.0 | STATE |  |  | |
| SSOT-CONSISTENCY-A-2215-0009 | docs/ssot/SSOT-CONSISTENCY-A-2215-0009.md | ssot | draft | 1.1.0 | RULE |  |  | |
| SSOT-DEMOGRAPHY-A-2215-0002 | docs/ssot/SSOT-DEMOGRAPHY-A-2215-0002.md | ssot | draft | 1.1.0 | STATE |  |  | |
| SSOT-ECONOMY-A-2215-0003 | docs/ssot/SSOT-ECONOMY-A-2215-0003.md | ssot | draft | 1.1.0 | STATE |  |  | |
| SSOT-ENERGY-A-2215-0004 | docs/ssot/SSOT-ENERGY-A-2215-0004.md | ssot | draft | 1.1.0 | STATE |  |  | |
| SSOT-GOVERNANCE-SECURITY-A-2215-0005 | docs/ssot/SSOT-GOVERNANCE-SECURITY-A-2215-0005.md | ssot | draft | 1.1.0 | STATE |  |  | |
| SSOT-LAW-A-2215-0008 | docs/ssot/SSOT-LAW-A-2215-0008.md | ssot | fixed | 1.1.0 | STATE |  |  | |
| SSOT-LIFE-A-2215-0007 | docs/ssot/SSOT-LIFE-A-2215-0007.md | ssot | draft | 1.1.0 | STATE |  |  | |
| SSOT-LOC-WEATHER-CHELNY-2215-0001 | docs/ssot/SSOT-LOC-WEATHER-CHELNY-2215-0001.md | ssot | draft | 0.1.0 | STATE |  |  | |
| SSOT-SCENARIO-A-2215-0001 | docs/ssot/SSOT-SCENARIO-A-2215-0001.md | ssot | draft | 1.0.0 | STATE |  | SPEC-DOC-STYLE-2215-0001 | |
| SSOT-SPACE-INDUSTRY-A-2215-0006 | docs/ssot/SSOT-SPACE-INDUSTRY-A-2215-0006.md | ssot | draft | 1.0.0 | STATE |  |  | |
| SSOT-URBANISM-A-2215-0007 | docs/ssot/SSOT-URBANISM-A-2215-0007.md | ssot | fixed | 1.1.0 | STATE |  |  | |
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
    version: semver
    role_type: enum
    inputs: doc_id_csv
    depends_on: doc_id_csv
    notes: text
  column_encoding:
    doc_id_csv:
      separator: ","
      empty: ""
  columns:
    - id
    - file
    - class
    - status
    - version
    - role_type
    - inputs
    - depends_on
    - notes
  primary_key: id
  rows_source: CONTENT
~~~

## FORBIDDEN

[FORBIDDEN][CORP-900] Using folder scan as corpus membership.
[FORBIDDEN][CORP-901] Consuming documents not present in this registry.
[FORBIDDEN][CORP-902] Treating comments or prose as registry data.
[FORBIDDEN][CORP-903] Using placeholders like "—" in CSV-typed columns.

## NON-NORMATIVE

(empty)