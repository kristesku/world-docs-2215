---
id: SPEC-DOC-ID-2215-0001
title: >
  Document ID Contract — Corpus Doc-ID Grammar, Namespaces, and Lint Gates (2215)
class: spec
status: draft
version: 1.1.0
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

---

## DEFINITIONS

[FACT][DOCID-010] `doc_id` = значение YAML-ключа `id` документа корпуса, являющееся глобальным идентификатором.
[FACT][DOCID-011] `family` = первый сегмент `doc_id`.
[FACT][DOCID-012] `topic` = второй сегмент `doc_id`.
[FACT][DOCID-013] `scope` = сегменты между `topic` и `seq`.
[FACT][DOCID-014] `seq` = последний сегмент (`0001..9999`).
[FACT][DOCID-015] `series_key` = `<family>-<topic>-<scope>`.

[FACT][DOCID-016] `class_family_match` = YAML `class` согласован с `family`.
[FACT][DOCID-017] `legacy_doc_id` = исторический id, нарушающий текущую схему.
[FACT][DOCID-018] `migration_redirect` = устаревший механизм соответствия old→new (не обязателен).

[FACT][DOCID-019] `rename_replace` = операция, при которой документ переименован, файл переименован, все inbound/outbound ссылки заменены, а старый `doc_id` полностью отсутствует в IDX и корпусе.

[FACT][DOCID-020] `corpus_closed_world` = допущение, что весь корпус полностью перечислен в IDX-CORPUS; ссылки вне него не учитываются lint gates.

---

## INVARIANTS

[DECISION][DOCID-020] Every corpus document MUST have decidably valid `doc_id`; ELSE FAIL.
[DECISION][DOCID-021] Deterministic grammar MUST override naming preference; ELSE FAIL.
[DECISION][DOCID-022] Deviations MUST be either legacy OR resolved via rename_replace; ELSE FAIL.

---

## CONTENT

### 1) Charset

[RULE][DOCID-030] `doc_id` MUST match `^[A-Z0-9-]+$`; ELSE FAIL.
[RULE][DOCID-031] Hyphen-delimited segments only.
[RULE][DOCID-032] Non-ASCII and underscores FORBIDDEN.

---

### 2) Sequence

[RULE][DOCID-040] MUST end with `-dddd`.
[RULE][DOCID-041] `0001..9999`.
[RULE][DOCID-042] unique inside `series_key`.

---

### 3) Family ↔ class

[RULE][DOCID-050] `family` MUST be in allowed set.
[RULE][DOCID-051] `class_family_match` MUST hold for non-legacy.

[RULE][DOCID-052] A `status: fixed` document MUST NOT change its `doc_id`
UNLESS `rename_replace = true` AND `corpus_closed_world = true`; ELSE FAIL.

---

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
~~~

---

### 4) Scope schemas

[RULE][DOCID-060] Form `<family>-<topic>-<scope>-<seq>`.
[RULE][DOCID-061] `topic` single segment (no hyphens).
[RULE][DOCID-062] `scope` MUST follow family schema.

~~~yaml
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

---

### 5) Canonical forms

[RULE][DOCID-070] SSOT → `SSOT-<TOPIC>-<SCENARIO>-2215-<SEQ>`
[RULE][DOCID-071] SPEC → `SPEC-<TOPIC>-2215-<SEQ>`
[RULE][DOCID-072] CANON → `CANON-<TOPIC>-<SCOPE>-2215-<SEQ>`
[RULE][DOCID-073] PROTOCOL → `PROTOCOL-<TOPIC>-2215-<SEQ>`
[RULE][DOCID-074] IDX → `IDX-<TOPIC>-<SEQ>`

---

### 6) Legacy handling (упрощённый режим)

[RULE][DOCID-080] `legacy_doc_id` MUST be declared in allowlist.
[RULE][DOCID-081] New docs MUST NOT use legacy forms.
[RULE][DOCID-082] Legacy ids SHOULD be eliminated by `rename_replace` when feasible.
[RULE][DOCID-083] `migration_redirect` MAY be used but is OPTIONAL.

~~~yaml
legacy_allowlist:
  - legacy_doc_id: SCENE-GEN-PROTOCOL-0001
    reason: historical pre-spec id
    required_action: rename_replace
~~~

---

## USAGE / RESOLUTION

[DECISION][DOCID-100] Spec is normative for all corpus docs.
[DECISION][DOCID-101] `doc_id` is primary key.
[DECISION][DOCID-102] Filename MUST equal `<doc_id>.md`.

---

## OUTPUT CONTRACT

~~~yaml
doc_id: SPEC-DOC-ID-2215-0001
role_type: RULE
lint_gates:
  - DOCID-LINT-001: charset valid
  - DOCID-LINT-002: seq valid
  - DOCID-LINT-003: family allowed
  - DOCID-LINT-004: topic single segment
  - DOCID-LINT-005: scope schema valid
  - DOCID-LINT-006: class_family_match
  - DOCID-LINT-007: uniqueness
  - DOCID-LINT-008: fixed rename allowed only via rename_replace
~~~

---

## FORBIDDEN

[FORBIDDEN][DOCID-900] New family without updating schema.
[FORBIDDEN][DOCID-901] Hyphens in topic.
[FORBIDDEN][DOCID-902] Mixed scope schemas.
[FORBIDDEN][DOCID-903] Creating new legacy forms.

---

## NON-NORMATIVE

rename_replace workflow:
1) rename file  
2) change id  
3) replace all references  
4) ensure old id absent in IDX  
