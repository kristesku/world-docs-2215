---
id: SSOT-DOC-STYLE-2215-0001
title: >
  SSOT Document Style Guide — LLM-Executable Corpus Standard (2215)
class: spec
status: fixed
version: 1.0.1
scope: >
  Норматив форматирования SSOT/BASELINE/CANON/IDX документов проекта 2215.
  Цель: максимальная однозначность и исполняемость LLM (минимум интерпретации).
  Этот документ определяет обязательные секции, типы блоков, допустимый язык,
  контракт вывода и правила декомпозиции фактов/правил/привязок.
depends_on: []
inputs: []
---

## 0. Prime Directive

- [DECISION][STYLE-000] Corpus MUST be LLM-executable:
  - deterministic parsing > human readability;
  - explicit contracts > narrative explanations;
  - atomic statements > prose.

- [FORBIDDEN][STYLE-001] “Essay mode”:
  - long paragraphs,
  - rhetorical connectors,
  - implicit assumptions,
  - “world flavor” to justify numbers.

---

## 0.1 Precedence (Two Axes)

### 0.1.1 Role-Type precedence (semantic)

- [DECISION][STYLE-101] Role-type precedence (semantic) is:

~~~markdown
RULE
→ INTERFACE
→ STATE
→ BIND
~~~

- [DECISION][STYLE-102] Role-type precedence defines how statements are interpreted:
  RULE constrains STATE; BIND selects STATE; INTERFACE defines ownership/consumes rules.

### 0.1.2 Document-class resolution order (applicability)

- [DECISION][STYLE-105] Document-class resolution order (applicability) MUST be taken ONLY from:
  `SPEC-PRIORITY-RESOLUTION-2215-0001`.

- [FORBIDDEN][STYLE-106] Mixing role-type precedence with document-class resolution.
- [FORBIDDEN][STYLE-107] Introducing alternative document-class precedence inside this STYLE guide.

---

## 1. Document Types and Roles

Every document MUST declare its role type in `LLM-INTENT` as exactly one of:

- STATE — declarative facts and projections (no resolution logic).
- RULE — normative constraints and resolution logic (IF/THEN).
- BIND — choosing values (core vs p90) for downstream usage.
- INTERFACE — domain boundaries, ownership, consumes/defines contracts.
- INDEX — navigation tables and traceability maps (mechanical).

- [DECISION][STYLE-010] One document MUST NOT mix role types.
  - Exception: `INDEX` may embed pointers to RULE/STATE but MUST NOT redefine them.

---

## 2. Mandatory Document Skeleton

All documents MUST include the following sections in this order (may be empty but must exist):

1. `## LLM-INTENT`
2. `## DEFINITIONS`
3. `## INVARIANTS`
4. `## CONTENT` (role-specific)
5. `## USAGE / RESOLUTION`
6. `## OUTPUT CONTRACT`
7. `## FORBIDDEN`
8. `## NON-NORMATIVE (optional)` (only examples)

- [DECISION][STYLE-020] Headers MUST match exactly (case-insensitive allowed).
- [DECISION][STYLE-021] No other top-level sections are allowed.

---

## 3. LLM-INTENT Block (Required)

`## LLM-INTENT` MUST contain:

- `ROLE_TYPE: STATE|RULE|BIND|INTERFACE|INDEX`
- `SCOPE: <one-sentence>`
- `INPUTS: <list of doc ids or -> none>`
- `OUTPUTS: <list>`
- `FORBIDDEN: <list>`

Example:

~~~markdown
## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: metric conflict resolution and dual-allowed handling
INPUTS: [SSOT-SCENARIO-A-2215-0001, IDX-SSOT-INTERFACES-2215]
OUTPUTS: [selected_value, scope, rule_id]
FORBIDDEN: [invent_metrics, redefine_ownership, narrative]
~~~

- [DECISION][STYLE-030] LLM-INTENT MUST be ≤ 20 lines.

---

## 4. Statement Grammar (Atomic Blocks)

All normative or factual content MUST be expressed as atomic statements.
Each statement MUST use a tag prefix:

- `[FACT]`
- `[ASSUMPTION]`
- `[PROJECTION]`
- `[DECISION]`
- `[FORBIDDEN]`
- `[UNKNOWN]`
- `[STATE]` (only in ROLE_TYPE: STATE)
- `[RULE]` (only in ROLE_TYPE: RULE)
- `[BIND]` (only in ROLE_TYPE: BIND)

### 4.1 IDs (Mandatory)

- [DECISION][STYLE-040] Every statement MUST have an ID: `TAG][<DOCPREFIX>-NNN]`
  - Example: `[RULE][CONS-010]`
  - Example: `[STATE][ENG-020]`

- [DECISION][STYLE-041] IDs MUST be stable across edits.
- [FORBIDDEN][STYLE-042] No “floating bullets” without IDs.

### 4.2 Statement Length

- [DECISION][STYLE-043] One statement ≤ 3 lines.
- [FORBIDDEN][STYLE-044] Multi-paragraph statements.

### 4.3 No Bold/Italic Semantics

- [DECISION][STYLE-045] Markdown emphasis (``, `_`) MUST NOT carry meaning.
- [FORBIDDEN][STYLE-046] Using bold/italic as structure.

---

## 5. Language Constraints (No Soft Speech)

- [FORBIDDEN][STYLE-050] Softeners:
  - “обычно”, “как правило”, “в целом”, “скорее”, “может быть”, “возможно”
  - “допускается” без условия

- [DECISION][STYLE-051] Allowed operators:
  - `IF / THEN / ELSE`
  - `MUST / MUST NOT`
  - `ONLY IF`
  - `EXCEPT WHEN`
  - `REQUIRES`
  - `IMPLIES`

- [DECISION][STYLE-052] Quantifiers MUST be explicit:
  - ranges: `x ∈ [a, b]`
  - approx: `x ≈ y` (only if needed; prefer range)
  - units required for numeric values.

---

## 6. Role-Specific CONTENT Rules

### 6.1 ROLE_TYPE: STATE

`## CONTENT` MUST contain only `[STATE]` statements.

- [DECISION][STYLE-060] STATE statements allowed forms:
  - `metric = value`
  - `metric.core = value`
  - `metric.p90 = value`
  - `metric.range = [a, b]`
  - `metric.unit = <unit>`
  - `metric.owner_domain = <DOMAIN>`

- [FORBIDDEN][STYLE-061] STATE MUST NOT contain:
  - causal chains,
  - resolution rules,
  - “why” explanations.

### 6.2 ROLE_TYPE: RULE

`## CONTENT` MUST contain only `[RULE]`, `[DECISION]`, `[FORBIDDEN]`.

- [DECISION][STYLE-062] RULE statements MUST use IF/THEN form when applicable.
- [DECISION][STYLE-063] Rules MUST be decidable (no vague language).

### 6.3 ROLE_TYPE: BIND

`## CONTENT` MUST contain only `[BIND]` statements.

- [DECISION][STYLE-064] BIND chooses among existing SSOT values only:
  - `metric: <id>`
  - `selected_value: core|p90|override`
  - `scope: baseline|canon|override`
  - `justification: <RULE_ID>`

### 6.4 ROLE_TYPE: INTERFACE

- [DECISION][STYLE-065] INTERFACE defines: domain ownership, consumes, must-not-define.
- [FORBIDDEN][STYLE-066] INTERFACE MUST NOT introduce metric values.

### 6.5 ROLE_TYPE: INDEX

- [DECISION][STYLE-067] INDEX contains tables and pointers only.
- [FORBIDDEN][STYLE-068] INDEX MUST NOT redefine rules or state.

---

## 7. Causal Chains (Strict Form)

Causal chains are allowed ONLY in ROLE_TYPE: RULE or in dedicated CANON artifacts.
They MUST use canonical tokens:

- `CAUSE → MECHANISM → CONSEQUENCE`

- [DECISION][STYLE-070] If causal text is present:
  - each node MUST be a separate atomic statement with its own ID.

Example:

~~~markdown
[RULE][X-010] CAUSE: ...
[RULE][X-011] MECHANISM: ...
[RULE][X-012] CONSEQUENCE: ...
~~~

- [FORBIDDEN][STYLE-071] Inline causal chains inside long paragraphs.

---

## 8. Ownership and Domain Boundaries

- [DECISION][STYLE-080] Every metric MUST declare `owner_domain`.
- [FORBIDDEN][STYLE-081] Two domains defining the same metric value unless
  explicitly marked by a RULE doc as DUAL-ALLOWED.

- [DECISION][STYLE-082] Ownership names MUST match the interface index:
  `SCENARIO, CONSISTENCY, ENERGY, CLIMATE, ECONOMY, AUTOMATION, DEMOGRAPHY, URBANISM, GOVERNANCE, LIFE, SPACE-INDUSTRY`.

---

## 9. Units and Naming

- [DECISION][STYLE-090] Numeric values MUST include units:
  - `TW`, `EJ_per_year`, `C`, `m`, `%`, `billion`, `years`.

- [DECISION][STYLE-091] Metric IDs MUST be snake_case and stable.
- [FORBIDDEN][STYLE-092] Reusing the same metric name for different meanings.

---

## 10. Resolution and Usage Section

`## USAGE / RESOLUTION` MUST be present and role-appropriate:

- For STATE: how downstream may reference; no selection logic.
- For RULE: state machine and priority ordering.
- For BIND: precedence and scope constraints.

- [DECISION][STYLE-100] If precedence exists, it MUST be explicit:
  `override → canon → ssot → baseline → plan → scene` (or other chosen order).

---

## 11. OUTPUT CONTRACT (Mandatory)

Every document MUST define machine-readable output schema.

### 11.1 STATE output contract

~~~yaml
doc_id: <id>
role_type: STATE
export:
  - metric: <metric_id>
    owner_domain: <DOMAIN>
    values:
      core: <value|none>
      p90: <value|none>
      range: <[a,b]|none>
    unit: <unit|none>
~~~

### 11.2 RULE output contract

~~~yaml
doc_id: <id>
role_type: RULE
export:
  - rule_id: <ID>
    intent: <one-line>
    inputs: <list>
    outputs: <list>
~~~

### 11.3 BIND output contract

~~~yaml
doc_id: <id>
role_type: BIND
export:
  - metric: <metric_id>
    selected_value: core|p90|override
    scope: baseline|canon|override
    justification: <rule_id>
~~~

- [DECISION][STYLE-110] OUTPUT CONTRACT MUST be present even if export is empty.

---

## 12. FORBIDDEN Section (Mandatory)

Each doc MUST list explicit forbidden behaviors relevant to its role.

Minimum:

- [FORBIDDEN][STYLE-120] Introducing new metrics not owned by the domain.
- [FORBIDDEN][STYLE-121] Mixing roles inside one document.
- [FORBIDDEN][STYLE-122] Using examples as rules.

---

## 13. NON-NORMATIVE Section Rules

- [DECISION][STYLE-130] If examples exist, they MUST be under:
  `## NON-NORMATIVE`
- [FORBIDDEN][STYLE-131] Examples outside NON-NORMATIVE.

---

## 14. Rewrite Protocol (How to Convert Existing Docs)

Given an existing human-readable SSOT:

1. Identify ROLE_TYPE.
2. Extract all statements into atomic tagged lines with IDs.
3. Remove prose and rhetorical justification.
4. Ensure every metric has owner_domain and unit (if numeric).
5. Add OUTPUT CONTRACT.
6. Move all examples into NON-NORMATIVE.
7. Add explicit FORBIDDEN list.

- [DECISION][STYLE-140] Conversion MUST preserve meaning; only structure changes.

---

## 15. Compliance Checklist (Mechanical)

A document is compliant IFF:

- [ ] front-matter exists and has `id`, `title`, `class`, `status`, `version`, `scope`
- [ ] mandatory skeleton sections exist in order
- [ ] ROLE_TYPE specified and single
- [ ] every statement has a stable ID
- [ ] no softeners / vague language
- [ ] no mixed roles
- [ ] OUTPUT CONTRACT present
- [ ] examples only in NON-NORMATIVE

- [DECISION][STYLE-150] Non-compliant docs MUST be treated as invalid inputs.
