---
id: SPEC-DOC_STYLE-2215-0001
title: >
  SSOT Document Style Guide — LLM-Executable Corpus Standard (2215)
class: spec
status: fixed
scope: >
  Normative standard for formatting SSOT/BASELINE/CANON/IDX documents in project 2215.
  Goal: maximum determinism and LLM-executability (minimal interpretation).
  This document defines mandatory sections, block types, allowed language,
  output contract, and rules for decomposing facts/rules/bindings.
prefix: STYLE
doc_language: en-US
inputs: []
depends_on:
  - SPEC-PRIORITY_RESOLUTION-2215-0001
references:
  - IDX-CORPUS-0001
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: define machine-readable corpus doc structure, language policy, record-stream formats, and compliance gates (compiler-grade)
INPUTS: []
OUTPUTS: [doc_style_rules, lint_gates, section_schema, rewrite_protocol, language_policy, record_stream_rules]
FORBIDDEN: [implicit_sections, missing_ids, ambiguous_markers, undocumented_exceptions, body_yaml_delimiters]

## DEFINITIONS

[FACT][STYLE-010] `document` = corpus unit: YAML front-matter (optional) + Markdown body, bounded by one set of YAML delimiters at document start.
[FACT][STYLE-011] `front_matter` = YAML block between two YAML delimiter lines at document start.
[FACT][STYLE-012] `yaml_delimiter_line` = line equal to `---` (used only for front_matter delimiters).
[FACT][STYLE-013] `skeleton` = fixed set of top-level sections (H2), used by all corpus documents.
[FACT][STYLE-014] `statement` = atomic line with `[TAG][ID]` prefix and a single semantic unit.
[FACT][STYLE-015] `statement_id` = stable identifier of form `<DOCPREFIX>-NNN<SFX>`, where `NNN` is a three-digit number and `<SFX>` is an optional suffix `A..Z` for branching/refinement without renumbering.
[FACT][STYLE-016] `docprefix` = prefix for `statement_id`, declared explicitly in YAML as `prefix:` OR inferred as the single common prefix of all `statement_id` in the document.
[FACT][STYLE-017] `ROLE_TYPE` = semantic role of document: STATE | RULE | BIND | INTERFACE | INDEX.
[FACT][STYLE-018] `doc_class` = document class per YAML `class:` (ssot|baseline|canon|spec|protocol|idx|registry|plan|scene, etc. per project).
[FACT][STYLE-019] `NON-NORMATIVE` = section for comments/examples, not a source of rules or facts.

[FACT][STYLE-020A] `structural_heading_line` = Markdown heading line of level H3 (`### ...`), used only for visual/navigational grouping.
[FACT][STYLE-020B] `statement_continuation_line` = statement continuation line, starting with two spaces; belongs to the preceding statement line.
[FACT][STYLE-020C] `markdown_table_line` = Markdown table line (`| ... |`) or alignment line (`| --- |`), used only in cases allowed by ROLE_TYPE rules.
[FACT][STYLE-020D] `statement_line` = non-empty line satisfying `STYLE-059A`.
[FACT][STYLE-020E] `fenced_machine_block` = fenced block bounded by `~~~` lines (optional language after opening fence), closed by `~~~` line.
[FACT][STYLE-020F] `allowed_normative_line_type` = {statement_line, statement_continuation_line, fenced_machine_block, structural_heading_line, markdown_table_line}.

[FACT][STYLE-210] `doc_id_reference_token` = token in text that MUST be treated as a corpus document reference, PASS IFF it matches regex `\b[A-Z0-9_]+(?:-[A-Z0-9_]+)+-[0-9]{4}\b`.
[FACT][STYLE-211] `explicit_dependency_set` = `hard_dependency_set` from YAML front_matter of current document.
[FACT][STYLE-212] `corpus_registry` = closed-world registry of corpus doc_id (IDX-CORPUS as source of truth for membership).
[FACT][STYLE-213] `superseded_by` = YAML key specifying doc_id that replaces a deprecated document.
[FACT][STYLE-214] `inputs` = list of doc_id whose `OUTPUT CONTRACT.export` is directly consumed by current document as data (data-flow dependency).
[FACT][STYLE-215] `depends_on` = list of doc_id on which the document relies normatively or semantically, but does NOT consume their export.
[FACT][STYLE-216] `hard_dependency_set` = `inputs ∪ depends_on`.
[FACT][STYLE-217A] `references` = list of doc_id mentioned or used as context in normative sections of the document, but not being either data-flow (`inputs`) or semantic (`depends_on`) dependencies.
[FACT][STYLE-217B] `contextual_reference_set` = `references`.
[FACT][STYLE-217C] `dependency_dag_set` = `inputs ∪ depends_on`.
[FACT][STYLE-218] `doc_id_segment_token` = doc_id segment between hyphens; PASS IFF matches `^[A-Z0-9]+(?:_[A-Z0-9]+)*$`.

[FACT][STYLE-260] `doc_language` = IETF language tag, declared in YAML as `doc_language: <tag>`, defining the primary language of non-diegetic document text.
[FACT][STYLE-270] `prose_language` = IETF language tag, declared in YAML as `prose_language: <tag>`, defining the required language for diegetic output (prose) that the document constrains.
[FACT][STYLE-280] `proper_name` = proper name token (character/toponym/organization/brand), used in TYPE C or in prose.
[FACT][STYLE-290] `canon_ru` = canonical Russian form of `proper_name`, used for binding and output in prose.
[FACT][STYLE-300] `display_ru` = Russian display form of `proper_name` in prose; if absent, `canon_ru` is used.
[FACT][STYLE-310] `canon_en` = optional canonical English form of `proper_name` for English-language documents; MUST NOT be derived automatically from `canon_ru`.
[FACT][STYLE-320] `record_stream` = ordered sequence of machine-readable records, used as TYPE C input (scenes/timeline/event array, etc.).
[FACT][STYLE-330] `record_format_id` = identifier for encoding/parsing format of `record_stream`, declared in YAML as `record_format_id: <id>`.
[FACT][STYLE-340] `dataset_id` = identifier for a dataset grouping multiple documents into one logical `record_stream` (series of acts/parts), declared in YAML as `dataset_id: <id>`.

## INVARIANTS

[DECISION][STYLE-030] This document itself MUST be COMPLIANT with its own standard (variant A: self-application).
[DECISION][STYLE-030A] Any document of class `spec` having ROLE_TYPE=RULE MUST be COMPLIANT with SPEC-DOC_STYLE-2215-0001; ELSE FAIL (self-consistency gate).
[DECISION][STYLE-030B] Any document with ROLE_TYPE=RULE MUST be COMPLIANT with SPEC-DOC_STYLE-2215-0001; ELSE FAIL (rule-doc self-consistency).
[DECISION][STYLE-031] Corpus allows exactly one `skeleton` for all documents; exceptions are possible only via explicit `[DECISION]` in the standard document and MUST be machine-readable.
[DECISION][STYLE-032] Any ambiguity allowing LLM to choose "as convenient" is treated as determinism hazard and MUST be eliminated by rule or lint gate.
[DECISION][STYLE-033A] Any rule in this standard MUST be formulated as a checkable predicate; if predicate is not defined, the rule is considered INVALID.
[DECISION][STYLE-033B] If a rule permits ≥2 interpretations, the rule-bearing document MUST be treated as NON-COMPLIANT (ambiguity hazard).

## CONTENT

### 0. Prime Directive (NORMATIVE)

[DECISION][STYLE-000] Corpus MUST be LLM-executable: deterministic parsing > human readability; explicit contracts > narrative explanations; atomic statements > prose.
[FORBIDDEN][STYLE-001] "Essay mode": long paragraphs; rhetorical connectors; implicit assumptions; "world flavor" to justify numbers.
[DECISION][STYLE-002] Explanatory prose is FORBIDDEN in normative sections; only atomic statements and machine-readable blocks are allowed.

### 1. Role-Type precedence (semantic) vs class precedence (applicability)

[DECISION][STYLE-101] Role-type precedence (semantic) is: STATE → RULE → BIND → INTERFACE → INDEX.
[DECISION][STYLE-102] ROLE_TYPE is restricted to: STATE | RULE | BIND | INTERFACE | INDEX.
[FORBIDDEN][STYLE-103] Introducing new ROLE_TYPE identifiers.
[DECISION][STYLE-104] Role-type precedence defines semantic authority (RULE constrains STATE; BIND selects STATE; INTERFACE defines ownership/consumes; INDEX navigates) and MUST NOT be used as document applicability order.
[DECISION][STYLE-105] Document-class resolution order (applicability) MUST be taken ONLY from `SPEC-PRIORITY_RESOLUTION-2215-0001`.
[FORBIDDEN][STYLE-106] Mixing role-type precedence with document-class resolution.
[FORBIDDEN][STYLE-107] Introducing alternative document-class precedence inside this STYLE guide or any other doc.

### 2. Mandatory Document Skeleton (top-level sections)

[DECISION][STYLE-020] All documents MUST include the following H2 sections in this exact order (sections may be empty but MUST exist):
[DECISION][STYLE-021] 1. `## LLM-INTENT`
[DECISION][STYLE-022] 2. `## DEFINITIONS`
[DECISION][STYLE-023] 3. `## INVARIANTS`
[DECISION][STYLE-024] 4. `## CONTENT`
[DECISION][STYLE-025] 5. `## USAGE / RESOLUTION`
[DECISION][STYLE-026] 6. `## OUTPUT CONTRACT`
[DECISION][STYLE-027] 7. `## FORBIDDEN`
[DECISION][STYLE-028] 8. `## NON-NORMATIVE` (optional; if absent, examples are forbidden).
[DECISION][STYLE-029] Headers MUST match exactly (case-sensitive; exact bytes).
[FORBIDDEN][STYLE-033] Any additional top-level (H2) sections outside the skeleton.
[FORBIDDEN][STYLE-034] Any `yaml_delimiter_line` inside the document body (segmentation hazard).
[DECISION][STYLE-095] Structural H3 headings are permitted ONLY as `### <title>` lines inside `## CONTENT` and `## NON-NORMATIVE`; ELSE FAIL.
[DECISION][STYLE-096] H3 structural heading line MUST match regex: `^###\s.+$`; ELSE FAIL.
[FORBIDDEN][STYLE-097] Heading levels H4+ (`####` and deeper) are forbidden in all sections; ELSE FAIL.
[FORBIDDEN][STYLE-099] H3 headings with numeric prefix `N)` are forbidden (editor noise / noncanonical numbering).
[DECISION][STYLE-099A] PASS IFF any H3 heading that begins with digits matches ^###\s[0-9]+(?:\.[0-9]+)*\s.+$; ELSE FAIL.

### 2.1 YAML front-matter (normalization; deterministic parsing)

[DECISION][STYLE-130] Any corpus document that is consumed as an input (i.e., referenced by `inputs`/`depends_on` or listed in IDX registry) MUST include `front_matter`.
[DECISION][STYLE-131] `front_matter` MUST include keys: `id`, `title`, `class`, `status`, `scope`, `inputs`, `depends_on`, `references`.
[DECISION][STYLE-132] `inputs` and `depends_on` MUST be present; when empty they MUST be `[]`; when non-empty they MUST be YAML block lists (`- <id>`) sorted lexicographically ascending.
[DECISION][STYLE-132A] `references` MUST be present; when empty it MUST be `[]`; when non-empty it MUST be a YAML block list sorted lexicographically.
[DECISION][STYLE-133] `id` MUST be ASCII uppercase with digits, hyphens, and underscores only (`[A-Z0-9_-]+`) and MUST be unique within the corpus membership registry.
[DECISION][STYLE-135] `status` MUST be one of: `draft` | `fixed` | `deprecated`.
[DECISION][STYLE-135A] IF `status=deprecated` THEN front_matter MUST include `superseded_by: <doc_id>`; ELSE FAIL.
[FORBIDDEN][STYLE-135B] New or modified documents MUST NOT declare `inputs`/`depends_on` referencing deprecated docs; ELSE FAIL.
[DECISION][STYLE-136] Non-core YAML keys are allowed ONLY if they are either standardized in this spec (e.g., `prefix`, `doc_language`, `prose_language`, `dataset_id`, `record_format_id`, `superseded_by`, `references`, `changelog`, `topic_label`) OR prefixed with `x_`.
[FORBIDDEN][STYLE-137] YAML anchors, aliases, and merge keys (parsing ambiguity).
[FORBIDDEN][STYLE-138] Tabs in YAML or body text (parser ambiguity); indentation MUST be spaces only.
[RULE][STYLE-139A] PASS IFF `inputs ∩ depends_on = ∅`; ELSE FAIL.
[RULE][STYLE-139B] PASS IFF any doc_id in `inputs` is required to interpret the document's `OUTPUT CONTRACT.export`; ELSE FAIL (anti-bloat rule).
[RULE][STYLE-139C] PASS IFF any doc_id in `depends_on` is NOT required to interpret the document's `OUTPUT CONTRACT.export`; ELSE FAIL (boundary rule).
[RULE][STYLE-139D] PASS IFF `inputs`, `depends_on`, `references` are pairwise disjoint; ELSE FAIL.

### 2.2 File-level invariants (byte stability; parser safety)

[RULE][STYLE-190] PASS IFF file encoding is UTF-8 and contains no BOM; ELSE FAIL.
[RULE][STYLE-191] PASS IFF file uses LF line endings only (`\n`), no CRLF; ELSE FAIL.
[RULE][STYLE-192] PASS IFF no line has trailing whitespace; ELSE FAIL.
[RULE][STYLE-193] PASS IFF file ends with exactly one newline; ELSE FAIL.

### 2.3 Reference integrity (closed-world; explicit dependencies)

[RULE][STYLE-200A] PASS IFF every doc_id in (`inputs` ∪ `depends_on` ∪ `references`) exists in `corpus_registry`; ELSE FAIL.
[RULE][STYLE-200B] PASS IFF corpus dependency graph over `inputs ∪ depends_on` is acyclic (DAG); ELSE FAIL.
[RULE][STYLE-200C] PASS IFF any `doc_id_reference_token` in normative sections is in (`inputs` ∪ `depends_on` ∪ `references`) OR equals current document `id`; ELSE FAIL.
[DECISION][STYLE-200D] `references` MUST be excluded from DAG construction and cycle detection.

### 3. LLM-INTENT block (required; machine header)

[DECISION][STYLE-035] `## LLM-INTENT` MUST contain exactly these keys (order free, ≤ 20 lines total):
[DECISION][STYLE-036] `ROLE_TYPE: STATE|RULE|BIND|INTERFACE|INDEX`
[DECISION][STYLE-037] `SCOPE: <one-sentence>`
[DECISION][STYLE-038] `INPUTS: <list>` (use `[]` when none)
[DECISION][STYLE-039] `OUTPUTS: <list>` (use `[]` when none)
[DECISION][STYLE-040] `FORBIDDEN: <list>` (use `[]` when none)
[FORBIDDEN][STYLE-041] Hidden dependencies not listed in INPUTS when they affect interpretation or exports.

### 4. Statement Grammar (atomic, tagged, id-stable)

[DECISION][STYLE-042] All normative or factual content MUST be expressed as atomic `statement`s.
[DECISION][STYLE-043] Each `statement` MUST use one tag prefix: [FACT] | [ASSUMPTION] | [PROJECTION] | [DECISION] | [FORBIDDEN] | [UNKNOWN] | [STATE] | [RULE] | [BIND].
[DECISION][STYLE-044] Tag-to-role constraints:
[DECISION][STYLE-045] ROLE_TYPE: STATE → allowed tags: [STATE], [DECISION], [FORBIDDEN] (definitions may use [FACT] only in `## DEFINITIONS`).
[DECISION][STYLE-046] ROLE_TYPE: RULE → allowed tags: [RULE], [DECISION], [FORBIDDEN] (definitions may use [FACT] only in `## DEFINITIONS`).
[DECISION][STYLE-047] ROLE_TYPE: BIND → allowed tags: [BIND], [DECISION], [FORBIDDEN] (definitions may use [FACT] only in `## DEFINITIONS`).
[DECISION][STYLE-048] ROLE_TYPE: INTERFACE → allowed tags: [DECISION], [FORBIDDEN] (definitions may use [FACT] only in `## DEFINITIONS`).
[DECISION][STYLE-049] ROLE_TYPE: INDEX → allowed tags: [DECISION], [FORBIDDEN] (tables in CONTENT are allowed).
[DECISION][STYLE-050] Every `statement` MUST have a stable ID: `[TAG][<DOCPREFIX>-NNN<SFX>]`.
[DECISION][STYLE-051] `DOCPREFIX` MUST be declared in YAML as `prefix:` OR MUST be inferable as the unique common prefix of all `statement_id` in the document; otherwise lint MUST fail.
[RULE][STYLE-051A] PASS IFF YAML `prefix` is globally unique within `corpus_registry`; ELSE FAIL.
[DECISION][STYLE-052] New statement_id allocation MUST satisfy STYLE-052A.
[RULE][STYLE-052A] PASS IFF (NNN increments by 10) OR (dense allocation is used AND any later insertions use suffixes A–Z instead of renumbering); ELSE FAIL.
[DECISION][STYLE-053] IDs MUST be stable across edits; rewriting MUST preserve existing IDs verbatim.
[FORBIDDEN][STYLE-054] "Floating bullets" without `[TAG][ID]` in any normative section.
[DECISION][STYLE-055] Statement physical length MUST be ≤ 3 lines.
[DECISION][STYLE-055A] Any statement continuation lines MUST match `statement_continuation_line` and MUST appear only immediately after a statement line; total lines (statement + continuations) MUST be ≤ 3; ELSE FAIL.
[FORBIDDEN][STYLE-056] Multi-paragraph statements.
[DECISION][STYLE-056A] Enumerated list markers inside statement text MUST use dot form only: `N.`; ELSE FAIL.
[FORBIDDEN][STYLE-056B] Parenthesis enumeration marker `N)` is forbidden anywhere in statement text (normalization rule).
[DECISION][STYLE-056C] PASS IFF statement text does NOT contain regex `\b[0-9]+\)`; ELSE FAIL.
[DECISION][STYLE-057] Markdown emphasis (`**`, `_`) MUST NOT carry meaning; structure MUST be expressed by tags/ids/keys.
[FORBIDDEN][STYLE-058] Using bold/italic as structure or as a proxy for tags.
[DECISION][STYLE-059] Any new term used as a normative token MUST be defined in the same document under `## DEFINITIONS`; corpus-wide terms MUST be promoted only via the canonical vocabulary doc.
[DECISION][STYLE-059A] Normative statement lines MUST match regex: ^\[(FACT|ASSUMPTION|PROJECTION|DECISION|FORBIDDEN|UNKNOWN|STATE|RULE|BIND)\]\[[A-Z0-9_]+-[0-9]{3}[A-Z]?\]\s.+$.
[DECISION][STYLE-059B] In any normative section, any non-empty line MUST be of allowed_normative_line_type; ELSE FAIL.
[DECISION][STYLE-059C] `structural_heading_line` MUST match `^###\s.+$`; ELSE FAIL.
[DECISION][STYLE-059D] `statement_continuation_line` MUST match `^ {2}\S.*$`; ELSE FAIL.
[DECISION][STYLE-059E] `markdown_table_line` MUST match `^\|.*\|$` OR `^\|[ \-:|]+\|$`; ELSE FAIL.
[FORBIDDEN][STYLE-059F] Markdown tables in normative sections are FORBIDDEN unless ROLE_TYPE is INDEX OR (ROLE_TYPE is STATE AND table usage satisfies STYLE-068); ELSE FAIL.

### 5. Language and operators (no soft speech)

[FORBIDDEN][STYLE-060] Softeners: "usually", "as a rule", "generally", "rather", "maybe", "possibly" (unless locked by condition).
[DECISION][STYLE-061] Allowed operators: IF / THEN / ELSE; MUST / MUST NOT; ONLY IF; EXCEPT WHEN; REQUIRES; IMPLIES.
[DECISION][STYLE-062] Quantifiers MUST be explicit: range `x ∈ [a, b]`; approx `x ≈ y` (only if unavoidable; prefer range).
[DECISION][STYLE-063] Numeric values MUST include units when applicable.
[DECISION][STYLE-063A] Allowed modals are restricted to: MUST, MUST NOT, FORBIDDEN, REQUIRED, FAIL, PASS (case-sensitive).
[FORBIDDEN][STYLE-063B] Any modal verbs outside allowed modals in normative sections MUST cause lint FAIL.

### 5.1 Language Policy (corpus vs prose)

[DECISION][STYLE-064] Corpus-wide `prose_language` MUST be `ru-RU` and MUST match the language of any generated diegetic prose.
[DECISION][STYLE-065] Every corpus document MUST declare `doc_language` in YAML; allowed values are: `ru-RU` | `en-US`.
[DECISION][STYLE-066] Any document that can be directly consumed by a prose generator (class: `protocol` OR class: `scene` OR any doc that constrains prose output) MUST declare `prose_language: ru-RU` in YAML; mismatch is a hard lint error.

### 5.2 Proper Names and Scripts (no auto-transliteration)

[DECISION][STYLE-084] Every `proper_name` referenced as a token in TYPE C inputs or prose MUST have a canonical Russian form `canon_ru` declared explicitly in the corpus (no implicit derivation).
[DECISION][STYLE-085] In diegetic prose output, `proper_name` MUST be emitted using `display_ru` (fallback: `canon_ru`) only.
[DECISION][STYLE-086] If `doc_language` is `en-US`, any mention of a `proper_name` in normative text MUST preserve the Russian spelling by referencing it as `ru:"<canon_ru>"`; `en:"<canon_en>"` is permitted only if `canon_en` is explicitly declared; the Russian string MUST NOT be altered.
[DECISION][STYLE-087] Latin-script names are permitted in Russian prose ONLY IF they are explicitly intended as the displayed form (i.e., stored as `display_ru` for that entity); otherwise Latin-script is forbidden in prose for that entity.
[FORBIDDEN][STYLE-088] Auto-transliteration or back-transliteration between scripts (ru↔lat) for any `proper_name`.
[FORBIDDEN][STYLE-089] Introducing aliases for `proper_name` unless they are explicitly declared as aliases in the canonical vocabulary/registry that owns that namespace.

### 6. Role-specific CONTENT rules (normative)

[DECISION][STYLE-067] ROLE_TYPE: STATE — `## CONTENT` MUST contain only `[STATE]` statements (plus `[DECISION]` / `[FORBIDDEN]` for constraints on reading).
[DECISION][STYLE-068] ROLE_TYPE: STATE MUST NOT use normative tables EXCEPT WHEN the table schema is declared in OUTPUT CONTRACT AND the table is the sole representation of those records (registry-style); ELSE FAIL.
[FORBIDDEN][STYLE-069] STATE content: causal chains, resolution logic, "why" explanations.
[DECISION][STYLE-070] ROLE_TYPE: RULE — `## CONTENT` MUST contain only `[RULE]`, `[DECISION]`, `[FORBIDDEN]` (plus non-normative examples in `## NON-NORMATIVE` only).
[DECISION][STYLE-071] RULE statements MUST be decidable; use IF/THEN where applicable.
[DECISION][STYLE-071A] Decidable rule format MUST be `PASS IFF <predicate>; ELSE FAIL` OR `IF <predicate> THEN <obligation>; ELSE FAIL`.
[DECISION][STYLE-072] ROLE_TYPE: BIND — `## CONTENT` MUST contain only `[BIND]` statements that select among existing STATE values.
[DECISION][STYLE-073] BIND MUST reference a RULE justification by ID for each selection.
[DECISION][STYLE-074] ROLE_TYPE: INTERFACE — defines domain ownership/consumes/forbids; MUST NOT introduce metric values.
[DECISION][STYLE-075] ROLE_TYPE: INDEX — contains navigation tables/pointers only; MUST NOT redefine rules or state.
[DECISION][STYLE-075A] In ROLE_TYPE: INDEX, any table in CONTENT MUST be fully specified in OUTPUT CONTRACT (columns, types, primary key if applicable).

### 6.1 Record Streams (TYPE C inputs: scenes / timelines / event arrays)

[DECISION][STYLE-076] TYPE C inputs MUST be represented as `record_stream` and MUST NOT be interpreted as TYPE B world state.
[DECISION][STYLE-077] Any document that contains a `record_stream` MUST declare `record_format_id` in YAML; if the dataset spans multiple documents, those docs MUST also declare the same `dataset_id`.
[DECISION][STYLE-078] Any document that exports `record_stream` MUST define, in its `## OUTPUT CONTRACT`, a machine-readable parser contract including at least: `record_start_rule`, `required_fields`, `field_encoding`, `merge_policy`.
[FORBIDDEN][STYLE-079] Mixing multiple incompatible record encodings inside the same exported `record_stream` without explicit separate exports per encoding.

### 7. Causal chains (strict form)

[DECISION][STYLE-080] Causal chains are allowed ONLY in ROLE_TYPE: RULE (or in explicitly allowed CANON artifacts declared by RULE docs).
[DECISION][STYLE-081] Canonical tokens: `CAUSE → MECHANISM → CONSEQUENCE`.
[DECISION][STYLE-082] If causal text is present, each node MUST be a separate atomic statement with its own ID.
[FORBIDDEN][STYLE-083] Inline causal chains inside long paragraphs.

### 8. Ownership, domains, and naming

[DECISION][STYLE-090] Every metric MUST declare ownership in a ROLE_TYPE: STATE document (e.g., `metric.owner_domain = <DOMAIN>`), or via an INTERFACE ownership table referenced by that STATE.
[FORBIDDEN][STYLE-091] Two domains defining the same metric value unless explicitly marked DUAL-ALLOWED by a RULE doc.
[DECISION][STYLE-092] Ownership names MUST match the interface index (project-owned enum set).
[DECISION][STYLE-093] Metric IDs MUST be snake_case and stable.
[FORBIDDEN][STYLE-094] Reusing the same metric name for different meanings.
[DECISION][STYLE-094A] Reserved keywords for corpus semantics are: ARTIFACT, BUNDLE, CONTRACT, GATE, LOCK, REGISTRY, PACK.
[FORBIDDEN][STYLE-094B] Using synonyms for reserved keywords in normative sections (e.g., "package" instead of PACK, "checkpoint" instead of GATE).

### 9. Numbers, units, strings, UNKNOWN

[DECISION][STYLE-120] Numeric values MUST include units: `TW`, `EJ_per_year`, `C`, `m`, `%`, `years`, etc.
[DECISION][STYLE-121] Tokens/enums MUST be UPPER_SNAKE_CASE; parsing-relevant human strings MUST be quoted consistently using `"` (double quotes).
[DECISION][STYLE-122] Missing data MUST be represented as `UNKNOWN` or omitted; never elided with `...` or `…`.
[FORBIDDEN][STYLE-123] Ellipsis placeholders (`...` / `…`) in any normative section; in `class: scene` this is a hard lint error.
[DECISION][STYLE-124] If a `record_stream` uses JSON (e.g., JSON Lines), it MUST be declared via `record_format_id` and MUST have an explicit parser contract in OUTPUT CONTRACT; "implicit JSON" is forbidden.
[DECISION][STYLE-124A] Any reference to an undefined term/metric/token in normative sections MUST be treated as [UNKNOWN] and MUST trigger lint FAIL unless explicitly allowed by a RULE.

### 10. OUTPUT CONTRACT templates (normative; role-specific)

[DECISION][STYLE-110] Every document MUST include `## OUTPUT CONTRACT` and it MUST be machine-readable.
[DECISION][STYLE-111] OUTPUT CONTRACT MUST be expressed as YAML in a fenced block with language tag `yaml`.

~~~yaml
doc_id: <id>
role_type: <ROLE_TYPE>
export: <role-specific>
~~~

[DECISION][STYLE-112] STATE output contract schema:

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

[DECISION][STYLE-113] RULE output contract schema (two allowed forms):

~~~yaml
# Variant A — ordinary RULE
doc_id: <id>
role_type: RULE
export:
  - rule_id: <STATEMENT_ID>
    intent: <one-line>
    inputs: <list>
    outputs: <list>

# Variant B — lint-spec RULE
doc_id: <id>
role_type: RULE
export:
  lint_config: <machine-readable lint configuration>
~~~

[RULE][STYLE-113A] PASS IFF (a RULE doc defines lint_gates ⇒ it uses RULE export Variant B) AND (it does NOT define lint_gates ⇒ it uses Variant A); ELSE FAIL.

[DECISION][STYLE-114] BIND output contract schema:

~~~yaml
doc_id: <id>
role_type: BIND
export:
  - metric: <metric_id>
    selected_value: core|p90
    scope: baseline|canon
    justification: <rule_id>
~~~

[DECISION][STYLE-115] INTERFACE output contract schema:

~~~yaml
doc_id: <id>
role_type: INTERFACE
export:
  - owns: <list of domains|concepts>
  - consumes: <list of domains|documents>
  - forbids: <list of forbidden definitions>
~~~

[DECISION][STYLE-116] INDEX output contract schema:

~~~yaml
doc_id: <id>
role_type: INDEX
export:
  - rows: <list>
  - columns: <list>
~~~

[DECISION][STYLE-116A] Any spec that defines lint MUST export machine-readable lint configuration in OUTPUT CONTRACT as YAML (no prose).
[FORBIDDEN][STYLE-117] Omitting OUTPUT CONTRACT even if `export` is empty.
[FORBIDDEN][STYLE-118] Using freeform prose in OUTPUT CONTRACT instead of machine-readable schema.
[RULE][STYLE-118A] PASS IFF OUTPUT CONTRACT YAML conforms to one of the allowed schema variants for the declared ROLE_TYPE; ELSE FAIL.

### 11. Rewrite protocol (deterministic transformation)

[DECISION][STYLE-140] Rewrite MUST preserve meaning; only structure changes unless explicitly requested.
[DECISION][STYLE-141] Rewrite MUST preserve all existing `statement_id`s verbatim; new statements MUST allocate new IDs without renumbering old ones.
[DECISION][STYLE-142] Rewrite algorithm MUST be:
[DECISION][STYLE-143] 1. Parse YAML front-matter; validate required keys.
[DECISION][STYLE-144] 2. Infer ROLE_TYPE (or keep if valid); enforce tag constraints.
[DECISION][STYLE-145] 3. Build mandatory skeleton; move all content under correct sections.
[DECISION][STYLE-146] 4. Split prose/bullets into atomic statements; assign IDs; keep ≤ 3 lines per statement.
[DECISION][STYLE-147] 5. Move examples into `## NON-NORMATIVE` only.
[DECISION][STYLE-148] 6. Emit `## OUTPUT CONTRACT` matching role templates; if export is empty, still emit schema.
[DECISION][STYLE-149] 7. Emit `## FORBIDDEN` tailored to doc role and scope.
[DECISION][STYLE-150] 8. Run lint gates; fail if any gate fails.
[DECISION][STYLE-151] Rewrite MUST NOT translate, transliterate, or back-transliterate any `proper_name`; Russian spellings MUST be preserved verbatim.
[DECISION][STYLE-152] If `doc_language` is missing, rewrite MUST set it to `ru-RU` by default unless explicitly requested otherwise; prose constraints MUST keep `prose_language: ru-RU`.
[DECISION][STYLE-153] If the document contains TYPE C records, rewrite MUST preserve the declared `record_format_id` (or set it explicitly) and MUST NOT silently convert encodings (e.g., KV → JSON) without an explicit request.
[DECISION][STYLE-154] Any newly introduced corpus-wide term during rewrite MUST be added either to local `## DEFINITIONS` (local scope) or to the canonical vocabulary doc; silent "new term without definition" is forbidden.
[RULE][STYLE-155] Rewrite of a COMPLIANT document MUST produce byte-identical output; ELSE FAIL (idempotency rule).

### 12. Compliance checklist (mechanical gates)

[DECISION][STYLE-160] A document is COMPLIANT IFF all lint gates in this spec pass.
[DECISION][STYLE-161] Non-compliant docs MUST be treated as invalid inputs (do not consume for generation).

## USAGE / RESOLUTION

[DECISION][STYLE-200] This spec is normative for all corpus docs unless a doc contains an explicit exemption statement that references this spec and declares its scope.
[DECISION][STYLE-201] Exemptions MUST be minimal and MUST NOT weaken determinism (exemption itself must be decidable).
[DECISION][STYLE-202] Applicability/precedence between documents is governed by `SPEC-PRIORITY_RESOLUTION-2215-0001`; this spec defines structure and lint gates only.
[DECISION][STYLE-203] Consumers MUST treat only OUTPUT CONTRACT `export` as consumable semantics; any content outside OUTPUT CONTRACT is NON-COMPLIANT to consume.

## OUTPUT CONTRACT

~~~yaml
doc_id: SPEC-DOC_STYLE-2215-0001
role_type: RULE
export:
  lint_config:
    rule_id_prefix: STYLE
    dependency_semantics:
      inputs_meaning: "data-flow dependency; consumes OUTPUT CONTRACT export"
      depends_on_meaning: "semantic/normative dependency; does not consume export"
      references_meaning: "contextual reference; navigation/mention only; excluded from DAG"
      disjointness_rule_id: "STYLE-139D"
      dag_scope: "inputs ∪ depends_on"
    corpus_language_policy:
      doc_language_allowed: ["ru-RU","en-US"]
      prose_language_required: "ru-RU"
      proper_names:
        canon_ru_required: true
        prose_emit: "display_ru_then_canon_ru"
        forbid_auto_transliteration: true
    record_stream_rules:
      require_record_format_id: true
      require_dataset_id_for_series: true
      require_parser_contract_keys: ["record_start_rule","required_fields","field_encoding","merge_policy"]
    skeleton_h2_order:
      - "LLM-INTENT"
      - "DEFINITIONS"
      - "INVARIANTS"
      - "CONTENT"
      - "USAGE / RESOLUTION"
      - "OUTPUT CONTRACT"
      - "FORBIDDEN"
      - "NON-NORMATIVE"
    allowed_role_types: ["STATE","RULE","BIND","INTERFACE","INDEX"]
    allowed_tags: ["FACT","ASSUMPTION","PROJECTION","DECISION","FORBIDDEN","UNKNOWN","STATE","RULE","BIND"]
    statement_line_regex: '^\[(FACT|ASSUMPTION|PROJECTION|DECISION|FORBIDDEN|UNKNOWN|STATE|RULE|BIND)\]\[[A-Z0-9_]+-[0-9]{3}[A-Z]?\]\s.+$'
    forbid_enumeration_paren_regex:
      regex: '\b[0-9]+\)'
      applies_to: statement_text
    doc_id_reference_token_regex: '\b[A-Z0-9_]+(?:-[A-Z0-9_]+)+-[0-9]{4}\b'
    file_invariants:
      encoding: "utf-8"
      forbid_bom: true
      line_endings: "LF"
      forbid_trailing_whitespace: true
      require_single_final_newline: true
    structural_line_policy:
      h3_regex: '^###\s.+$'
      allowed_sections: ["CONTENT","NON-NORMATIVE"]
      forbid_h4_plus: true
      forbid_h3_numeric_paren_prefix: true
      require_h3_numeric_dot_prefix: false
    statement_continuation_regex: '^ {2}\S.*$'
    structural_heading_regex: '^###\s.+$'
    markdown_table_regex:
      - '^\|.*\|$'
      - '^\|[ \-:|]+\|$'
    allowed_modals: ["MUST","MUST NOT","FORBIDDEN","REQUIRED","FAIL","PASS"]
    forbidden_modals: ["SHOULD","MAY","CAN","USUALLY","TYPICALLY","GENERALLY","OFTEN"]
    forbidden_softeners: ["usually","as a rule","generally","rather","maybe","possibly"]
    lint_gates:
      - gate_id: STYLE-LINT-001
        intent: "no extra H2 sections"
      - gate_id: STYLE-LINT-002
        intent: "every normative line is a tagged statement with stable id OR allowed structural line"
      - gate_id: STYLE-LINT-003
        intent: "LLM-INTENT has required keys and <=20 lines"
      - gate_id: STYLE-LINT-004
        intent: "OUTPUT CONTRACT present and machine-readable"
      - gate_id: STYLE-LINT-005
        intent: "prefix declared or inferable"
      - gate_id: STYLE-LINT-006
        intent: "no yaml_delimiter_line in body"
      - gate_id: STYLE-LINT-007
        intent: "no ellipsis placeholders in normative sections"
      - gate_id: STYLE-LINT-008
        intent: "front_matter required keys present and normalized (inputs/depends_on/references lists)"
      - gate_id: STYLE-LINT-009
        intent: "doc_language present and allowed"
      - gate_id: STYLE-LINT-010
        intent: "prose_language required for prose-consumed docs and must equal ru-RU"
      - gate_id: STYLE-LINT-011
        intent: "record_stream docs declare record_format_id (+dataset_id for series) and have parser contract keys"
      - gate_id: STYLE-LINT-012
        intent: "headers match exactly (case-sensitive) and follow skeleton order"
      - gate_id: STYLE-LINT-013
        intent: "no forbidden modals/softeners in normative sections"
      - gate_id: STYLE-LINT-014
        intent: "no consumption of non-export content is allowed"
      - gate_id: STYLE-LINT-015
        intent: "H3 headings allowed only in CONTENT/NON-NORMATIVE; H4+ forbidden"
      - gate_id: STYLE-LINT-016
        intent: "forbid enumeration marker N) in any statement text; require N. if numbering is used"
      - gate_id: STYLE-LINT-017
        intent: "file encoding is UTF-8 without BOM"
      - gate_id: STYLE-LINT-018
        intent: "line endings are LF only"
      - gate_id: STYLE-LINT-019
        intent: "no trailing whitespace and exactly one final newline"
      - gate_id: STYLE-LINT-020
        intent: "all inputs/depends_on/references IDs exist in corpus_registry (IDX-CORPUS)"
      - gate_id: STYLE-LINT-021
        intent: "dependency graph is acyclic (DAG)"
      - gate_id: STYLE-LINT-022
        intent: "deprecated workflow: deprecated requires superseded_by; new deps must not reference deprecated docs"
      - gate_id: STYLE-LINT-024
        intent: "OUTPUT CONTRACT YAML conforms to role-specific schema template"
      - gate_id: STYLE-LINT-025
        intent: "references key present and normalized (list, sorted, no duplicates)"
      - gate_id: STYLE-LINT-026
        intent: "doc_id reference tokens in normative sections must be declared in inputs, depends_on, or references"
  rewrite_protocol:
    - "STYLE-140"
    - "STYLE-141"
    - "STYLE-142"
    - "STYLE-143"
    - "STYLE-144"
    - "STYLE-145"
    - "STYLE-146"
    - "STYLE-147"
    - "STYLE-148"
    - "STYLE-149"
    - "STYLE-150"
    - "STYLE-151"
    - "STYLE-152"
    - "STYLE-153"
    - "STYLE-154"
    - "STYLE-155"
~~~

## FORBIDDEN

[FORBIDDEN][STYLE-900] Treating NON-NORMATIVE content as a source of constraints or facts.
[FORBIDDEN][STYLE-901] Silent relaxation of any MUST/MUST NOT rule without an explicit exemption statement.
[FORBIDDEN][STYLE-902] Consuming content outside of declared OUTPUT CONTRACT of a document.
[FORBIDDEN][STYLE-903] Using unscoped numbers (numbers without units where units are applicable).
[FORBIDDEN][STYLE-904] Using `yaml_delimiter_line` in document body (segmentation hazard).
[FORBIDDEN][STYLE-905] Auto-transliteration/back-transliteration of any proper names or toponyms (ru↔lat) without explicit canon/alias declaration.
[FORBIDDEN][STYLE-906] Emitting diegetic prose in any language other than `prose_language: ru-RU`.
[FORBIDDEN][STYLE-907] Changing `record_format_id` or mixing record encodings inside a dataset without an explicit exemption statement.
[FORBIDDEN][STYLE-908] Using synonyms for reserved keywords (CONTRACT/GATE/LOCK/REGISTRY/PACK) in normative sections.

## NON-NORMATIVE

### Example: Minimal compliant doc (illustrative; delimiter lines replaced to avoid segmentation hazards in examples)

~~~text
YAML_FRONT_MATTER_BEGIN
id: EXAMPLE-0001
title: >
  Example Doc
class: canon
status: draft
prefix: EXA
doc_language: en-US
prose_language: ru-RU
inputs: []
depends_on: []
references: []
scope: >
  Example scope.
YAML_FRONT_MATTER_END

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: example rules
INPUTS: []
OUTPUTS: []
FORBIDDEN: []

## DEFINITIONS

[FACT][EXA-010] `foo` = bar.

## INVARIANTS

[DECISION][EXA-020] Foo MUST remain bar.

## CONTENT

[RULE][EXA-030] IF foo == bar THEN baz MUST be qux; ELSE FAIL.

## USAGE / RESOLUTION

[DECISION][EXA-040] Applies globally.

## OUTPUT CONTRACT

OUTPUT_CONTRACT_YAML_BEGIN
doc_id: EXAMPLE-0001
role_type: RULE
export: []
OUTPUT_CONTRACT_YAML_END

## FORBIDDEN

[FORBIDDEN][EXA-900] Inventing baz.

## NON-NORMATIVE

(empty)
~~~
