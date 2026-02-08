---
id: SPEC-DOC-ID-2215-0001
title: >
  Document ID Contract — Corpus Doc-ID Grammar, Namespaces, and Lint Gates (2215)
class: spec
status: draft
version: 1.1.1
prefix: DOCID
doc_language: ru-RU
prose_language: ru-RU
inputs: []
depends_on:
  - SPEC-DOC-STYLE-2215-0001
scope: >
  Норматив грамматики `id` (doc_id) для всех документов корпуса 2215.
  Поддерживается single-author режим: разрешён rename+replace без migration_redirect
  при условии closed-world корпуса (IDX является полным реестром).
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: define corpus-wide doc_id grammar, namespace-to-class mapping, scope schemas, lint gates, and deterministic rename rules
INPUTS: []
OUTPUTS: [doc_id_grammar, allowed_families, family_scope_schemas, class_family_mapping, lint_gates]
FORBIDDEN: [implicit_id_schemes, freeform_id_segments, mixed_scope_orders, non_decidable_exceptions]

## DEFINITIONS

[FACT][DOCID-010] `doc_id` = значение YAML-ключа `id` документа корпуса, являющееся глобальным идентификатором.
[FACT][DOCID-011] `family` = первый сегмент `doc_id` (split by `-`).
[FACT][DOCID-012] `topic` = второй сегмент `doc_id` (split by `-`).
[FACT][DOCID-013] `scope` = сегменты между `topic` и `seq`.
[FACT][DOCID-014] `seq` = последний сегмент (`0001..9999`).
[FACT][DOCID-015] `series_key` = `<family>-<topic>-<scope>`.

[FACT][DOCID-016] `class_family_match` = YAML `class` согласован с `family`.
[FACT][DOCID-017] `legacy_doc_id` = исторический id, нарушающий текущую схему.
[FACT][DOCID-018] `migration_redirect` = механизм соответствия old→new (опциональный механизм совместимости, не обязателен для closed-world).
[FACT][DOCID-019] `rename_replace` = операция, при которой документ переименован, файл переименован, все inbound/outbound ссылки заменены, а старый `doc_id` полностью отсутствует в IDX и корпусе.
[FACT][DOCID-020] `corpus_closed_world` = допущение, что весь корпус полностью перечислен в IDX-CORPUS; ссылки вне него не учитываются lint gates.

[FACT][DOCID-021] `id_changed` = булев флаг lint: true IFF новое значение `id` отличается от ранее зафиксированного значения для этого же документа (по истории корпуса/репозитория).

## INVARIANTS

[DECISION][DOCID-030] Every corpus document MUST have decidably valid `doc_id`; ELSE FAIL.
[DECISION][DOCID-031] Deterministic grammar MUST override naming preference; ELSE FAIL.
[DECISION][DOCID-032] Deviations MUST be either legacy OR resolved via rename_replace; ELSE FAIL.

## CONTENT

### 1. Charset

[RULE][DOCID-040] PASS IFF `doc_id` matches `^[A-Z0-9-]+$`; ELSE FAIL.
[RULE][DOCID-041] PASS IFF `doc_id` contains no underscores (`_`); ELSE FAIL.

### 2. Sequence

[RULE][DOCID-050] PASS IFF `doc_id` matches `-[0-9]{4}$`; ELSE FAIL.
[RULE][DOCID-051] PASS IFF `seq_int` derived from `seq` satisfies `seq_int ∈ [1, 9999]`; ELSE FAIL.
[RULE][DOCID-052] PASS IFF `doc_id` is unique inside `series_key` within IDX-CORPUS; ELSE FAIL.

### 3. Family ↔ class

[RULE][DOCID-060] PASS IFF `family` is in `allowed_families`; ELSE FAIL.
[RULE][DOCID-061] IF `legacy_doc_id = false` THEN PASS IFF `class_family_match = true`; ELSE FAIL.
[RULE][DOCID-062] IF `status = fixed` AND `id_changed = true` THEN PASS IFF `rename_replace = true` AND `corpus_closed_world = true`; ELSE FAIL.

### 4. Scope schemas

[RULE][DOCID-070] PASS IFF `doc_id` matches form `<family>-<topic>-<scope>-<seq>`; ELSE FAIL.
[RULE][DOCID-071] PASS IFF `topic` is a single segment token and matches `^[A-Z0-9]+$`; ELSE FAIL.
[RULE][DOCID-072] PASS IFF `scope` conforms to `family_scope_schemas[family]`; ELSE FAIL.

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
  - OVERRIDE

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
  override: OVERRIDE

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
  OVERRIDE: "<family>-<topic>-<scope_variant>-<year>-<seq>"
~~~

### 5) Canonical forms

[RULE][DOCID-080] PASS IFF SSOT form is `SSOT-<TOPIC>-<SCENARIO>-2215-<SEQ>`; ELSE FAIL.
[RULE][DOCID-081] PASS IFF SPEC form is `SPEC-<TOPIC>-2215-<SEQ>`; ELSE FAIL.
[RULE][DOCID-082] PASS IFF CANON form is `CANON-<TOPIC>-<SCOPE>-2215-<SEQ>`; ELSE FAIL.
[RULE][DOCID-083] PASS IFF PROTOCOL form is `PROTOCOL-<TOPIC>-2215-<SEQ>`; ELSE FAIL.
[RULE][DOCID-084] PASS IFF IDX form is `IDX-<TOPIC>-<SEQ>`; ELSE FAIL.

### 6) Legacy handling (упрощённый режим)

[RULE][DOCID-090] PASS IFF `legacy_doc_id` is declared in `legacy_allowlist`; ELSE FAIL.
[RULE][DOCID-091] PASS IFF new documents do not use legacy forms; ELSE FAIL.
[RULE][DOCID-092] PASS IFF any legacy id remains present only while it is in `legacy_allowlist`; ELSE FAIL.
[RULE][DOCID-093] Absence of `migration_redirect` MUST NOT cause lint FAIL.

~~~yaml
legacy_allowlist:
  - legacy_doc_id: SCENE-GEN-PROTOCOL-0001
    reason: historical pre-spec id
    required_action: rename_replace
~~~

## USAGE / RESOLUTION

[DECISION][DOCID-100] Spec is normative for all corpus docs.
[DECISION][DOCID-101] `doc_id` is primary key.
[RULE][DOCID-102] PASS IFF filename equals `<doc_id>.md`; ELSE FAIL.

## OUTPUT CONTRACT

~~~yaml
doc_id: SPEC-DOC-ID-2215-0001
role_type: RULE
export:
  - gate_id: DOCID-LINT-001
    intent: charset valid
    predicate: "doc_id matches ^[A-Z0-9-]+$ and contains no underscores"
  - gate_id: DOCID-LINT-002
    intent: seq valid
    predicate: "doc_id ends with -[0-9]{4} and seq_int ∈ [1,9999]"
  - gate_id: DOCID-LINT-003
    intent: family allowed
    predicate: "family ∈ allowed_families"
  - gate_id: DOCID-LINT-004
    intent: topic single segment
    predicate: "topic matches ^[A-Z0-9]+$"
  - gate_id: DOCID-LINT-005
    intent: scope schema valid
    predicate: "scope conforms to family_scope_schemas[family]"
  - gate_id: DOCID-LINT-006
    intent: class_family_match
    predicate: "legacy_doc_id=false => class_family_mapping[class]=family"
  - gate_id: DOCID-LINT-007
    intent: uniqueness
    predicate: "doc_id unique within series_key in IDX-CORPUS"
  - gate_id: DOCID-LINT-008
    intent: fixed rename allowed only via rename_replace
    predicate: "status=fixed and id_changed=true => rename_replace=true and corpus_closed_world=true"
  - gate_id: DOCID-LINT-009
    intent: filename equals doc_id
    predicate: "filename == doc_id + .md"
config:
  allowed_families_ref: "CONTENT.allowed_families"
  class_family_mapping_ref: "CONTENT.class_family_mapping"
  family_scope_schemas_ref: "CONTENT.family_scope_schemas"
  legacy_allowlist_ref: "CONTENT.legacy_allowlist"
~~~

## FORBIDDEN

[FORBIDDEN][DOCID-900] New family without updating schema.
[FORBIDDEN][DOCID-901] Hyphens in topic.
[FORBIDDEN][DOCID-902] Mixed scope schemas.
[FORBIDDEN][DOCID-903] Creating new legacy forms.

## NON-NORMATIVE

rename_replace workflow:
1) rename file
2) change id
3) replace all references
4) ensure old id absent in IDX
