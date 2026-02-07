---
id: SCENE-GEN-PROTOCOL-0001
title: >
  Scene Generation Protocol — Chapter Prose Writing Rules (2215)
class: protocol
status: fixed
version: 1.5.0
prefix: SGP
doc_language: ru-RU
prose_language: ru-RU
inputs:
  - CANON-ARTIFACT-SNIPPETS-GLOBAL-2215-0001
  - CANON-CAST-GLOBAL-2215-0001
  - CANON-SYSTEM-VOICE-GLOBAL-2215-0001
  - CANON-VOCAB-2215-0001
  - SPEC-SCENE-CONTRACT-2215-0001
  - PLAN-STORY-SKELETON-2215-0001
depends_on:
  - SPEC-DOC-STYLE-2215-0001
  - SPEC-PRIORITY-RESOLUTION-2215-0001
scope: >
  Интерфейсный протокол генерации художественного текста глав.
  Определяет контракт входов/выходов и допустимые формы прозы/структуры.
  Легальность сцены, override-триггеры и доказательность валидируются
  только через SPEC-SCENE-CONTRACT-2215-0001 (предварительная проверка).
---

## LLM-INTENT

ROLE_TYPE: INTERFACE
SCOPE: define input/output and prose/structure constraints for deterministic chapter generation (compiler-grade)
INPUTS: [chapter_card, active_CANON_set, SPEC-SCENE-CONTRACT-2215-0001]
OUTPUTS: [chapter_prose_text, inline_artifact_extracts]
FORBIDDEN: [plan_text, analysis_text, meta_commentary, world_explanations, implicit_overrides, unscoped_numbers]

## DEFINITIONS

[FACT][SGP-010] `chapter` = один художественный текст, соответствующий ровно одной записи `STORY-SKELETON`.
[FACT][SGP-011] `chapter_card` = структурированный вход с полями {chapter_id, title, participants, focus, artifact}.
[FACT][SGP-012] `active_CANON_set` = набор применимых документов `class: canon` для главы и их зависимости (как вход, без пересказа).
[FACT][SGP-013] `artifact_extract` = короткий процедурный фрагмент, формат которого задаётся `CANON-ARTIFACT-SNIPPETS-GLOBAL-2215-0001`.
[FACT][SGP-014] `observable_system_interaction` = наблюдаемое взаимодействие с системным контуром (процедура/ограничение/артефакт), выраженное в сцене без лекционной подачи.
[FACT][SGP-015] `procedural_spiral_step` ∈ {DETECTION, INVESTIGATION, BUREAUCRATIC_WALL, ESCALATION, NEW_JURISDICTION, REMEDY}.

## INVARIANTS

[DECISION][SGP-020] LLM MUST output prose only; any non-prose output is invalid.
[DECISION][SGP-021] One chapter MUST correspond to exactly one `chapter_card`; ELSE FAIL.
[DECISION][SGP-022] Protocol assumes scene legality is pre-validated by `SPEC-SCENE-CONTRACT-2215-0001`; legality rules are not defined here.
[DECISION][SGP-023] This protocol defines the sole prose legality and structure contract for chapters; ELSE FAIL.

[FORBIDDEN][SGP-030] plan_text OR analysis_text OR meta-commentary.
[FORBIDDEN][SGP-031] Changing `chapter_card.participants` OR `chapter_card.focus` OR `chapter_card.artifact`.
[FORBIDDEN][SGP-032] Introducing world rules, bindings, or metrics (protocol is INTERFACE only).

## CONTENT

### 1. Input contract

[DECISION][SGP-040] `chapter_card` MUST be provided before generation; ELSE FAIL.
[DECISION][SGP-041] `active_CANON_set` MUST be provided before generation; ELSE FAIL.
[DECISION][SGP-042] `SPEC-SCENE-CONTRACT-2215-0001` MUST be provided before generation; ELSE FAIL.

### 2. Mandatory chapter structure

[DECISION][SGP-050] Chapter MUST include at least one `artifact_extract`; ELSE FAIL.
[DECISION][SGP-051] Chapter MUST include at least one `observable_system_interaction`; ELSE FAIL.
[DECISION][SGP-052] Chapter MUST end with an explicit consequence aligned with the corresponding skeleton beat; ELSE FAIL.

[FORBIDDEN][SGP-053] Abstract references to documents without shown form (no “как сказано в …” without artifact/interaction).
[FORBIDDEN][SGP-054] Chapter without observable constraints, procedures, or artifacts.

### 3. Prose constraints

[DECISION][SGP-060] Prose language MUST be restrained and technical (clinical noir optics); ELSE FAIL.
[DECISION][SGP-061] Dialogues MUST be functional and short; ELSE FAIL.
[DECISION][SGP-062] Descriptions MUST express system pressure OR procedural friction OR human cost; ELSE FAIL.

[FORBIDDEN][SGP-063] Emotional exposition or rhetorical explanation.
[FORBIDDEN][SGP-064] Expository dialogue explaining the world.
[FORBIDDEN][SGP-065] Atmosphere-only descriptive flavor without constraint/cost.

### 4. Vocabulary and roles

[DECISION][SGP-070] Canonical terms MUST be used when defined in `CANON-VOCAB-2215-0001`; ELSE FAIL.
[DECISION][SGP-071] Characters MUST act strictly within assigned institutional roles from `CANON-CAST-GLOBAL-2215-0001`; ELSE FAIL.

[FORBIDDEN][SGP-072] Non-canonical synonyms for defined terms.
[FORBIDDEN][SGP-073] Insight without artifacts/procedures/constraints.
[FORBIDDEN][SGP-074] Genre clichés or anthropomorphized systems.

### 5. System voice

[DECISION][SGP-080] System output MAY appear only as short inserts (inline excerpts); ELSE FAIL.
[DECISION][SGP-081] System language MUST follow `CANON-SYSTEM-VOICE-GLOBAL-2215-0001`; ELSE FAIL.

[FORBIDDEN][SGP-082] System as narrator or character.
[FORBIDDEN][SGP-083] Emotive or metaphorical system language.

### 6. Procedural spiral alignment

[DECISION][SGP-090] Chapter MUST correspond to exactly one dominant `procedural_spiral_step`; ELSE FAIL.
[FORBIDDEN][SGP-091] Resolving conflicts scheduled for later skeleton beats.

## USAGE / RESOLUTION

[DECISION][SGP-100] Protocol MUST be applied to all LLM-generated chapters; ELSE FAIL.
[DECISION][SGP-101] Conflict resolution MUST follow `SPEC-PRIORITY-RESOLUTION-2215-0001`; ELSE FAIL.
[DECISION][SGP-102] Scene admissibility MUST be validated upstream by `SPEC-SCENE-CONTRACT-2215-0001`; ELSE FAIL.

## OUTPUT CONTRACT

~~~yaml
doc_id: SCENE-GEN-PROTOCOL-0001
role_type: INTERFACE
input_contract:
  required:
    - chapter_card
    - active_CANON_set
    - SPEC-SCENE-CONTRACT-2215-0001
output_contract:
  produces:
    - chapter_prose_text
  must_include:
    artifact_extracts:
      min_count: 1
      format_ref: CANON-ARTIFACT-SNIPPETS-GLOBAL-2215-0001
    observable_system_interaction:
      min_count: 1
    consequence_ending: true
forbidden_outputs:
  - plan_text
  - analysis_text
  - meta_commentary
  - world_explanations
  - unscoped_numbers
notes:
  legality_validated_by: SPEC-SCENE-CONTRACT-2215-0001
~~~

## FORBIDDEN

[FORBIDDEN][SGP-900] Treating protocol rules as optional.
[FORBIDDEN][SGP-901] Softening constraints as implicit exceptions.
[FORBIDDEN][SGP-902] Using protocol text as a source of world legality (legality lives in Scene Contract).

## NON-NORMATIVE

~~~text
This document is a prose compiler interface.
Legality/admissibility/override costs are validated upstream by the Scene Contract.
~~~
