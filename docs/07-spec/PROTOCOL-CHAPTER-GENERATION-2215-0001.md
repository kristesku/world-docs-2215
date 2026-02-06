---
id: PROTOCOL-CHAPTER-GENERATION-2215-0001
title: >
  Chapter Generation Protocol — Chat Parts 3–4 (2215)
class: spec
status: draft
version: 1.0.0
inputs:
  - CANON-2215-CORE-0001
  - CANON-METRICS-0002
  - CANON-SCENE-RULESET-2215-0001
depends_on:
  - CANON-BASE-0001
  - SPEC-PRIORITY-RESOLUTION-2215-0001
scope: >
  Протокол интерактивной генерации главы романа 2215 в чате.
  Глава всегда выводится частями (3–4). Каждая часть самодостаточна,
  но заканчивается маркером продолжения. Протокол форсирует assumed background,
  контроль чисел и ссылку на override при необходимости.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: define stepwise chapter emission in chat with hard validity gates
INPUTS:
  - user_request
  - chapter_context
OUTPUTS:
  - chapter_part_text
  - part_header_metadata
FORBIDDEN:
  - emitting_full_chapter_in_one_message
  - skipping_part_headers
  - unsourced_numbers
  - ssot_as_default_source

---

## DEFINITIONS

[FACT][CHP-DEF-010] chapter_part = one contiguous output message containing PART N of chapter.

[FACT][CHP-DEF-011] part_count ∈ {3,4}.

[FACT][CHP-DEF-012] continuation_prompt = user message: "дальше" | "продолжай" | "part N".

---

## INVARIANTS

[DECISION][CHP-INV-001] Chapter MUST be emitted as 3–4 parts.

[DECISION][CHP-INV-002] Each part MUST start with a header declaring:
chapter_id, part_index, part_count.

[DECISION][CHP-INV-003] Each part MUST include a compact `part_assumptions` block.

[DECISION][CHP-INV-004] Any numeric claim MUST comply with CANON-METRICS-0002.

[DECISION][CHP-INV-005] Any override-trigger condition MUST be declared
and must correspond to an explicit override doc (or the text MUST avoid the trigger).

[FORBIDDEN][CHP-INV-006] Emitting PART N+1 without user continuation_prompt.

---

## CONTENT

### 1) User request handling

[RULE][CHP-010] IF user requests "Write chapter X (3–4 parts)"
THEN assistant MUST choose part_count = 3 OR 4
based on expected length and beat complexity.

[RULE][CHP-011] Assistant MUST emit only PART 1 on initial request.

---

### 2) Mandatory part header

[RULE][CHP-020] Each chapter_part MUST begin with:

~~~yaml
part_header:
  chapter: CH-<####>
  title: "<working title>"
  part: <N>
  of: <3|4>
  pov: "<...>"
  location: "<...>"
  time_window: "<...>"
~~~

---

### 3) Mandatory assumptions block

[RULE][CHP-030] Each chapter_part MUST include:

~~~yaml
part_assumptions:
  resolution_order: SPEC-PRIORITY-RESOLUTION-2215-0001
  core_binder: CANON-2215-CORE-0001
  numeric_rules: CANON-METRICS-0002
  baseline_mode: "MID"
  overrides_used: []     # list doc_ids if any
  artifacts_expected: [] # logs/reports/orders that justify numbers
~~~

---

### 4) End-of-part marker

[RULE][CHP-040] Each chapter_part MUST end with:

`--- END PART N (of M). SEND "дальше" FOR PART N+1 ---`

[FORBIDDEN][CHP-041] Ending part without explicit continuation instruction.

---

## USAGE / RESOLUTION

[DECISION][CHP-USE-010] Protocol applies to all chapter-generation requests.

[DECISION][CHP-USE-011] Violations are treated as generation errors; output must be rewritten.

---

## OUTPUT CONTRACT

~~~yaml
doc_id: PROTOCOL-CHAPTER-GENERATION-2215-0001
role_type: RULE
export:
  - rule_id: CHP-INV-001
    intent: "Force 3–4 part emission"
    inputs: [user_request]
    outputs: [chapter_part_text]
  - rule_id: CHP-020
    intent: "Require explicit part header"
    inputs: [chapter_part_text]
    outputs: [part_header_metadata]
  - rule_id: CHP-040
    intent: "Require explicit continuation marker"
    inputs: [chapter_part_text]
    outputs: [continuation_required]
~~~

## FORBIDDEN

[FORBIDDEN][CHP-FBD-010] Full chapter in one message.
[FORBIDDEN][CHP-FBD-011] Part without header metadata.
[FORBIDDEN][CHP-FBD-012] Part with unsourced numbers.
[FORBIDDEN][CHP-FBD-013] Skipping user continuation step.

---

## NON-NORMATIVE

(Empty by design)
