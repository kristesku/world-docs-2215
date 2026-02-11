---
id: SPEC-DOC_ID-2215-0001
title: >
  Document ID Contract — Corpus Doc-ID Grammar, Namespaces, and Lint Gates (2215)
class: spec
status: draft
prefix: DOCID
doc_language: en-US
inputs: []
depends_on:
  - SPEC-DOC_STYLE-2215-0001
references:
  - IDX-CORPUS-0001
scope: >
  Норматив грамматики `id` (doc_id) для всех документов корпуса 2215.
  Поддерживается single-author режим: разрешён rename+replace без migration_redirect
  при условии closed-world корпуса (IDX является полным реестром).
  Механизм OVERRIDE отсутствует: семейство OVERRIDE не допускается.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: define corpus-wide doc_id grammar, namespace-to-class mapping, scope schemas, lint gates, and deterministic rename rules (override family removed)
INPUTS: []
OUTPUTS: [doc_id_grammar, allowed_families, family_scope_schemas, class_family_mapping, lint_gates]
FORBIDDEN: [implicit_id_schemes, freeform_id_segments, mixed_scope_orders, non_decidable_exceptions, override_family]

## DEFINITIONS

[FACT][DOCID-010] `doc_id` = значение YAML-ключа `id` документа корпуса, являющееся глобальным идентификатором.
[FACT][DOCID-011] `family` = первый сегмент `doc_id` (split by `-`).
[FACT][DOCID-012] `topic` = второй сегмент `doc_id` (split by `-`), используемый как стабильный идентификатор предметной области; не обязан быть человекочитаемым.
[FACT][DOCID-013] `scope` = сегменты между `topic` и `seq`.
[FACT][DOCID-014] `seq` = последний сегмент (`0001..9999`).
[FACT][DOCID-015] `series_key` = `<family>-<topic>-<scope>`.

[FACT][DOCID-016] `class_family_match` = YAML `class` согласован с `family`.
[FACT][DOCID-017] `legacy_doc_id` = исторический id, нарушающий текущую схему.
[FACT][DOCID-018] `migration_redirect` = механизм соответствия old→new (опциональный механизм совместимости, не обязателен для closed-world).
[FACT][DOCID-019] `rename_replace` = операция, при которой документ переименован, файл переименован, все inbound/outbound ссылки заменены, а старый `doc_id` полностью отсутствует в IDX и корпусе.
[FACT][DOCID-020] `corpus_closed_world` = допущение, что весь корпус полностью перечислен в IDX-CORPUS; ссылки вне него не учитываются lint gates.

[FACT][DOCID-022] `corpus_year` = целевой год корпуса, используемый для валидации сегмента `<year>` в doc_id (по умолчанию: 2215).
[FACT][DOCID-023] `year_segment` = сегмент `<year>` в doc_id для семейств, чьи scope схемы содержат `<year>`.

[FACT][DOCID-025] `topic_label` = строка, допускающая пробелы и дефисы; предназначена для UI/навигации/читаемости и не влияет на `doc_id`.

## INVARIANTS

[DECISION][DOCID-030] Every corpus document MUST have decidably valid `doc_id`; ELSE FAIL.
[DECISION][DOCID-031] Deterministic grammar MUST override naming preference; ELSE FAIL.
[DECISION][DOCID-032] Deviations MUST be either legacy OR resolved via rename_replace; ELSE FAIL.
[RULE][DOCID-033] PASS IFF this spec is COMPLIANT with SPEC-DOC_STYLE-2215-0001; ELSE FAIL.

## CONTENT

### 1. Charset

[RULE][DOCID-040] PASS IFF `doc_id` matches `^[A-Z0-9_-]+$`; ELSE FAIL.
[RULE][DOCID-041] PASS IFF `doc_id` does NOT contain consecutive underscores (`__`); ELSE FAIL.

### 2. Sequence

[RULE][DOCID-050] PASS IFF `doc_id` matches `-[0-9]{4}$`; ELSE FAIL.
[RULE][DOCID-051] PASS IFF `seq_int` derived from `seq` satisfies `seq_int ∈ [1, 9999]`; ELSE FAIL.
[RULE][DOCID-052] PASS IFF `doc_id` is unique inside `series_key` within IDX-CORPUS; ELSE FAIL.

### 3. Family ↔ class

[RULE][DOCID-060] PASS IFF `family` is in `allowed_families`; ELSE FAIL.
[RULE][DOCID-061] IF `legacy_doc_id = false` THEN PASS IFF `class_family_match = true`; ELSE FAIL.

### 4. Scope schemas

[RULE][DOCID-070] PASS IFF `doc_id` matches form `<family>-<topic>-<scope>-<seq>`; ELSE FAIL.
[RULE][DOCID-071] PASS IFF `topic` is a single segment token and matches `^[A-Z0-9]+(?:_[A-Z0-9]+)*$`; ELSE FAIL.
[RULE][DOCID-072] PASS IFF `scope` conforms to `family_scope_schemas[family]`; ELSE FAIL.
[RULE][DOCID-073] IF `family_scope_schemas[family]` contains `<year>` THEN PASS IFF `year_segment == 2215`; ELSE FAIL.
[RULE][DOCID-075] IF `topic_label` is present THEN PASS IFF `topic_label` is a non-empty string AND contains at least one letter; ELSE FAIL.
[RULE][DOCID-076] PASS IFF any multiword `topic` uses `_` separators; ELSE FAIL.
[FORBIDDEN][DOCID-077] New documents MUST NOT introduce CamelCase inside `topic` (e.g., `CHAPTERDELIVERY`); use `_` (e.g., `CHAPTER_DELIVERY`).

~~~yaml
allowed_families:
  - SSOT
  - BASELINE
  - CANON
  - SPEC
  - PROTOCOL
  - IDX
  - REG
  - PLAN
  - SCENE

class_family_mapping:
  ssot: SSOT
  baseline: BASELINE
  canon: CANON
  spec: SPEC
  protocol: PROTOCOL
  idx: IDX
  registry: REG
  plan: PLAN
  scene: SCENE

family_scope_schemas:
  SSOT: "<family>-<topic>-<scenario>-<year>-<seq>"
  BASELINE: "<family>-<topic>-<year>-<seq>"
  CANON: "<family>-<topic>-<scope_variant>-<year>-<seq>"
  SPEC: "<family>-<topic>-<year>-<seq>"
  PROTOCOL: "<family>-<topic>-<year>-<seq>"
  IDX: "<family>-<topic>-<seq>"
  REG: "<family>-<topic>-<year>-<seq>"
  PLAN: "<family>-<topic>-<year>-<seq>"
  SCENE: "<family>-<topic>-<scope_variant>-<year>-<seq>"
~~~

### 5. Canonical forms

[RULE][DOCID-080] PASS IFF SSOT form is `SSOT-<TOPIC>-<SCENARIO>-2215-<SEQ>`; ELSE FAIL.
[RULE][DOCID-081] PASS IFF SPEC form is `SPEC-<TOPIC>-2215-<SEQ>`; ELSE FAIL.
[RULE][DOCID-082] PASS IFF CANON form is `CANON-<TOPIC>-<SCOPE>-2215-<SEQ>`; ELSE FAIL.
[RULE][DOCID-083] PASS IFF PROTOCOL form is `PROTOCOL-<TOPIC>-2215-<SEQ>`; ELSE FAIL.
[RULE][DOCID-084] PASS IFF IDX form is `IDX-<TOPIC>-<SEQ>`; ELSE FAIL.

## USAGE / RESOLUTION

[DECISION][DOCID-100] Spec is normative for all corpus docs.
[DECISION][DOCID-101] `doc_id` is primary key.
[RULE][DOCID-102] PASS IFF filename equals `<doc_id>.md`; ELSE FAIL.

## OUTPUT CONTRACT

~~~yaml
doc_id: SPEC-DOC_ID-2215-0001
role_type: RULE
export:
  - gate_id: DOCID-LINT-001
    intent: charset valid
    predicate: "doc_id matches ^[A-Z0-9_-]+$"
  - gate_id: DOCID-LINT-002
    intent: seq valid
    predicate: "doc_id ends with -[0-9]{4} and seq_int ∈ [1,9999]"
  - gate_id: DOCID-LINT-003
    intent: family allowed
    predicate: "family ∈ allowed_families"
  - gate_id: DOCID-LINT-004
    intent: topic single segment
    predicate: "topic matches ^[A-Z0-9]+(?:_[A-Z0-9]+)*$"
  - gate_id: DOCID-LINT-005
    intent: scope schema valid
    predicate: "scope conforms to family_scope_schemas[family]"
  - gate_id: DOCID-LINT-010
    intent: year segment matches corpus_year
    predicate: "family_scope_schemas[family] contains <year> => year_segment == 2215"
  - gate_id: DOCID-LINT-006
    intent: class_family_match
    predicate: "legacy_doc_id=false => class_family_mapping[class]=family"
  - gate_id: DOCID-LINT-007
    intent: uniqueness
    predicate: "doc_id unique within series_key in IDX-CORPUS"
  - gate_id: DOCID-LINT-009
    intent: filename equals doc_id
    predicate: "filename == doc_id + .md"
config:
  allowed_families_ref: "CONTENT.allowed_families"
  class_family_mapping_ref: "CONTENT.class_family_mapping"
  family_scope_schemas_ref: "CONTENT.family_scope_schemas"
~~~

## FORBIDDEN

[FORBIDDEN][DOCID-900] New family without updating schema.
[FORBIDDEN][DOCID-901] Hyphens in topic.
[FORBIDDEN][DOCID-902] Mixed scope schemas.
[FORBIDDEN][DOCID-903] Creating new legacy forms.
[FORBIDDEN][DOCID-904] Introducing family `OVERRIDE` or any equivalent mechanism.

## NON-NORMATIVE

~~~markdown
rename_replace workflow:
1. rename file
2. change id
3. replace all references
4. ensure old id absent in IDX
~~~
