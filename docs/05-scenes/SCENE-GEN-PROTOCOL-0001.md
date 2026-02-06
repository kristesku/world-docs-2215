---
id: SCENE-GEN-PROTOCOL-0001
title: >
  Scene Generation Protocol — Chapter Prose Writing Rules (2215)
class: protocol
status: fixed
version: 1.4.0
inputs:
  - STORY-SKELETON-0001
  - SPEC-SCENE-CONTRACT-2215-0001
  - CANON-BASE-0001
  - CANON-CAST-0001
  - CANON-VOCAB-0001
  - CANON-SYSTEM-VOICE-0001
  - CANON-ARTIFACT-SNIPPETS-0001
depends_on:
  - SPEC-PRIORITY-RESOLUTION-2215-0001
scope: >
  Интерфейсный протокол генерации художественного текста глав.
  Определяет контракт входов/выходов и допустимые формы прозы.
  Все вопросы допустимости, override и доказательности делегированы Scene Contract.
---

## LLM-INTENT

ROLE_TYPE: INTERFACE
SCOPE: define input/output and prose constraints for deterministic chapter generation
INPUTS:
  - chapter_card
  - active_CANON_set
  - SPEC-SCENE-CONTRACT-2215-0001
OUTPUTS:
  - chapter_prose_text
  - inline_artifact_extracts
FORBIDDEN:
  - plan_text
  - analysis_text
  - world_explanations
  - new_entities
  - new_artifacts
  - new_authorities
  - implicit_overrides
  - unscoped_numbers

---

## DEFINITIONS

[FACT][SGP-DEF-010] chapter = один художественный текст, соответствующий ровно одной записи STORY-SKELETON.
[FACT][SGP-DEF-011] chapter_card = {chapter_id, title, Participants, Focus, Artifact}.
[FACT][SGP-DEF-012] active_CANON_set = все документы с class: canon и их зависимости.
[FACT][SGP-DEF-013] artifact_extract = короткий процедурный фрагмент по CANON-ARTIFACT-SNIPPETS.
[FACT][SGP-DEF-014] procedural_constraint = наблюдаемое системное ограничение или решение.
[FACT][SGP-DEF-015] procedural_spiral_step ∈ {Detection, Investigation, Bureaucratic_Wall, Escalation, New_Jurisdiction, Remedy}.

---

## INVARIANTS

[DECISION][SGP-INV-010] LLM MUST output prose only.
[DECISION][SGP-INV-011] One chapter MUST correspond to exactly one chapter_card.
[DECISION][SGP-INV-012] Scene admissibility and overrides MUST be resolved only via SPEC-SCENE-CONTRACT-2215-0001.

[FORBIDDEN][SGP-INV-020] plan_text OR analysis_text OR meta-commentary.
[FORBIDDEN][SGP-INV-021] Changing Participants OR Focus OR Artifact.
[FORBIDDEN][SGP-INV-022] Introducing new entities, artifacts, authorities, or institutional powers.
[FORBIDDEN][SGP-INV-023] Redefining or duplicating Scene Contract rules.

---

## CONTENT

### 1. Input contract

[DECISION][SGP-IN-010] chapter_card MUST be provided before generation.
[DECISION][SGP-IN-011] active_CANON_set MUST be provided before generation.
[DECISION][SGP-IN-012] SPEC-SCENE-CONTRACT-2215-0001 MUST be provided before generation.

---

### 2. Mandatory chapter structure

[DECISION][SGP-STR-020] Chapter MUST include ≥1 artifact_extract.
[DECISION][SGP-STR-030] Chapter MUST include ≥1 procedural_constraint.
[DECISION][SGP-STR-040] Chapter MUST end with an explicit consequence aligned with skeleton beat.

[FORBIDDEN][SGP-STR-050] Abstract references to documents without shown form.
[FORBIDDEN][SGP-STR-051] Chapter without observable constraints.

---

### 3. Prose constraints

[DECISION][SGP-PRS-060] Language MUST be restrained and technical.
[DECISION][SGP-PRS-061] Dialogues MUST be functional and short.
[DECISION][SGP-PRS-062] Descriptions MUST express system pressure, procedural friction, or human cost.

[FORBIDDEN][SGP-PRS-070] Emotional exposition or rhetorical explanation.
[FORBIDDEN][SGP-PRS-071] Expository dialogue explaining the world.
[FORBIDDEN][SGP-PRS-072] Atmosphere-only descriptive flavor.

---

### 4. Vocabulary and roles

[DECISION][SGP-VOC-080] Canonical terms MUST be used when defined in CANON-VOCAB.
[DECISION][SGP-VOC-081] Characters MUST act strictly within assigned institutional roles.

[FORBIDDEN][SGP-VOC-090] Non-canonical synonyms for defined terms.
[FORBIDDEN][SGP-VOC-091] Insight without artifacts and procedures.
[FORBIDDEN][SGP-VOC-092] Genre clichés or anthropomorphized systems.

---

### 5. System voice

[DECISION][SGP-SYS-100] System output MAY appear only as short inserts.
[DECISION][SGP-SYS-101] System language MUST follow CANON-SYSTEM-VOICE.

[FORBIDDEN][SGP-SYS-110] System as narrator or character.
[FORBIDDEN][SGP-SYS-111] Emotive or metaphorical system language.

---

### 6. Procedural spiral alignment

[DECISION][SGP-SPR-120] Chapter MUST correspond to exactly one dominant procedural_spiral_step.
[FORBIDDEN][SGP-SPR-121] Resolving conflicts scheduled for later skeleton beats.

---

## USAGE / RESOLUTION

[DECISION][SGP-USE-010] Protocol MUST be applied to all LLM-generated chapters.
[DECISION][SGP-USE-011] Conflict resolution MUST follow SPEC-PRIORITY-RESOLUTION-2215-0001.
[DECISION][SGP-USE-012] Scene admissibility MUST follow SPEC-SCENE-CONTRACT-2215-0001.

---

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
      format_ref: CANON-ARTIFACT-SNIPPETS-0001
    procedural_constraint:
      min_count: 1
    consequence_ending: true
forbidden_outputs:
  - plan_text
  - analysis_text
  - world_explanations
  - new_entities
  - new_artifacts
  - new_authorities
  - implicit_overrides
~~~

---

## FORBIDDEN

[FORBIDDEN][SGP-FBD-010] Treating protocol rules as optional.
[FORBIDDEN][SGP-FBD-011] Introducing world rules, bindings, or metrics.
[FORBIDDEN][SGP-FBD-012] Softening constraints as implicit exceptions.

---

## NON-NORMATIVE

~~~markdown
This document defines prose-generation constraints only.
World legality, admissibility, and override costs are defined upstream.
~~~
