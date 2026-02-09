---
id: PROTOCOL-CHAPTER_DELIVERY-2215-0001
title: >
  Chapter Generation Protocol — Chat Parts 3–4 (2215)
class: protocol
status: draft
version: 1.0.0
prefix: CHPG
doc_language: en-US
prose_language: ru-RU
inputs:
  - CANON-CORE-GLOBAL-2215-0001
  - CANON-METRICS-GLOBAL-2215-0002
  - CANON-SCENE_RULESET-GLOBAL-2215-0001
depends_on:
  - SPEC-DOC_STYLE-2215-0001
  - SPEC-PRIORITY_RESOLUTION-2215-0001
  - PROTOCOL-SCENE_GEN-2215-0001
scope: >
  Протокол интерактивной генерации главы романа 2215 в чате.
  Глава всегда выводится частями (3–4). Каждая часть самодостаточна,
  но заканчивается маркером продолжения. Протокол форсирует assumed background,
  контроль чисел и ссылку на override при необходимости.
---

## LLM-INTENT

ROLE_TYPE: INTERFACE
SCOPE: delivery-layer protocol that chunks already-valid chapter prose into 3–4 chat parts
INPUTS: [user_request, chapter_context]
OUTPUTS: [chapter_part_text, part_header_metadata]
FORBIDDEN: [full_chapter_single_message, missing_part_headers, unsourced_numbers, ssot_as_default_source, implicit_overrides]

## DEFINITIONS

[FACT][CHPG-010] `chapter_part` = один непрерывный ответ ассистента, содержащий PART N одной главы.
[FACT][CHPG-011] `part_count` ∈ {3,4}.
[FACT][CHPG-012] `continuation_prompt` = одно из сообщений пользователя: `"дальше"` | `"продолжай"` | `"part N"`.
[FACT][CHPG-013] `part_header` = YAML-блок в начале `chapter_part`, фиксирующий {chapter, title, part, of, pov, location, time_window}.
[FACT][CHPG-014] `part_assumptions` = YAML-блок, фиксирующий assumed background и список применённых override.
[FACT][CHPG-015] `override_trigger` = условие, требующее explicit override по правилам применимого scene/contract.

## INVARIANTS

[DECISION][CHPG-020] Chapter MUST be emitted as `part_count` ∈ {3,4}; ELSE FAIL.
[DECISION][CHPG-021] The initial generation response MUST emit only PART 1; ELSE FAIL.
[DECISION][CHPG-022] PART N+1 MUST NOT be emitted without `continuation_prompt`; ELSE FAIL.
[DECISION][CHPG-023] Each `chapter_part` MUST begin with `part_header`; ELSE FAIL.
[DECISION][CHPG-024] Each `chapter_part` MUST include `part_assumptions`; ELSE FAIL.
[DECISION][CHPG-025] Any numeric claim MUST comply with `CANON-METRICS-GLOBAL-2215-0002`; ELSE FAIL.
[DECISION][CHPG-026] Any `override_trigger` MUST be declared and MUST map to an explicit override doc_id in `part_assumptions.overrides_used`; ELSE FAIL.
[FORBIDDEN][CHPG-027] Emitting PART N+1 without `continuation_prompt`.
[DECISION][CHPG-028] This protocol MUST NOT define prose legality or prose structure; ELSE FAIL.
[DECISION][CHPG-029] Prose legality and structure constraints MUST be delegated to `PROTOCOL-SCENE_GEN-2215-0001`; ELSE FAIL.

## CONTENT

[DECISION][CHPG-030] IF user_request matches `Write chapter X (3–4 parts)` THEN assistant MUST set `part_count` = 3 OR 4 based on expected length and beat complexity; ELSE FAIL.
[DECISION][CHPG-031] IF user_request is initial chapter request THEN assistant MUST emit PART 1 only; ELSE FAIL.

[DECISION][CHPG-040] `part_header` MUST be emitted exactly in the following machine form; ELSE FAIL.
~~~yaml
part_header:
  chapter: "CH-<####>"
  title: "<working title>"
  part: <N>
  of: <3|4>
  pov: "<...>"
  location: "<...>"
  time_window: "<...>"
~~~

[DECISION][CHPG-050] `part_assumptions` MUST be emitted exactly in the following machine form; ELSE FAIL.
~~~yaml
part_assumptions:
  resolution_order: "SPEC-PRIORITY_RESOLUTION-2215-0001"
  core_binder: "CANON-CORE-GLOBAL-2215-0001"
  numeric_rules: "CANON-METRICS-GLOBAL-2215-0002"
  baseline_mode: "MID"
  overrides_used: []     # list of doc_ids
  artifacts_expected: [] # logs/reports/orders that justify constraints/numbers
~~~

[DECISION][CHPG-060] Each `chapter_part` MUST end with an explicit continuation marker in the exact form below; ELSE FAIL.
~~~text
--- END PART N (of M). SEND "дальше" FOR PART N+1 ---
~~~

[FORBIDDEN][CHPG-061] Ending a part without an explicit continuation instruction marker.
[FORBIDDEN][CHPG-062] Emitting a full chapter in one message.
[FORBIDDEN][CHPG-063] Skipping `part_header` or `part_assumptions`.
[FORBIDDEN][CHPG-064] Using SSOT as default source for scene background.

## USAGE / RESOLUTION

[DECISION][CHPG-070] This protocol MUST be applied to all chat-based chapter generation outputs; ELSE FAIL.
[DECISION][CHPG-071] Conflict resolution MUST follow `SPEC-PRIORITY_RESOLUTION-2215-0001`; ELSE FAIL.
[DECISION][CHPG-072] Validity of overrides and admissibility MUST be resolved by the active scene contract/ruleset referenced in `chapter_context`; ELSE FAIL.

## OUTPUT CONTRACT

~~~yaml
doc_id: PROTOCOL-CHAPTER_DELIVERY-2215-0001
role_type: INTERFACE
export:
  - rule_id: CHPG-020
    intent: "force 3–4 part emission"
    inputs: [user_request, chapter_context]
    outputs: [part_count, chapter_part_text]
  - rule_id: CHPG-023
    intent: "require part_header at start of every part"
    inputs: [chapter_part_text]
    outputs: [part_header_metadata]
  - rule_id: CHPG-050
    intent: "require part_assumptions block in every part"
    inputs: [chapter_part_text]
    outputs: [assumptions_metadata]
  - rule_id: CHPG-060
    intent: "require explicit continuation marker at end of every part"
    inputs: [chapter_part_text]
    outputs: [continuation_required]
  - rule_id: CHPG-026
    intent: "override triggers must map to explicit override doc_id or be avoided"
    inputs: [chapter_part_text, chapter_context]
    outputs: [override_compliance_flag]
  - rule_id: CHPG-029
    intent: "delegate prose legality/structure constraints to PROTOCOL-SCENE_GEN-2215-0001"
    inputs: [chapter_context]
    outputs: [prose_legality_delegation]
~~~

## FORBIDDEN

[FORBIDDEN][CHPG-900] Treating part emission rules as optional.
[FORBIDDEN][CHPG-901] Emitting PART N+1 without `continuation_prompt`.
[FORBIDDEN][CHPG-902] Unsourced numbers (numbers outside `CANON-METRICS-GLOBAL-2215-0002` discipline).
[FORBIDDEN][CHPG-903] Implicit override (exceptions presented as normal without declared override doc_id).

## NON-NORMATIVE

(Empty by design)
