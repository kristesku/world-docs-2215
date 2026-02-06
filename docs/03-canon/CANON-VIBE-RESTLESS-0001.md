---
id: CANON-VIBE-RESTLESS-0001
title: >
  Atmosphere Reference — UNKLE "Restless" (Audio & Narrative Vibe)
class: canon
status: draft
version: 0.1.0
inputs: []
depends_on: []
scope: >
  RULE-канон для стилизации сцен (ритм, саундскейп, сенсорика, психология команды)
  по аудио-референсу UNKLE — “Restless” для Челнов-2215. Без метрик SSOT и без художественного текста.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: enforce “Restless” vibe constraints for Chelny-2215 scenes (soundscape, prose rhythm, team psychology).
INPUTS: [CANON-CITY-RU-2215-0007, CANON-LOC-CHELNY-2215-0001, CANON-SYSTEM-VOICE-0001, CANON-CAST-0001]
OUTPUTS: [scene_style_profile, prose_rhythm_rules, soundscape_rules, dialogue_rules, forbidden_patterns]
FORBIDDEN: [lyrics_quotes, noir_cliches, essay_mode, metaphoric_system_persona, mood_exposition]

## DEFINITIONS

[FACT][VIBE-DEF-010] `vibe_profile` = набор правил, ограничивающих ритм прозы, саундскейп, сенсорные якоря и динамику команды в сцене.
[FACT][VIBE-DEF-011] `restless_vibe` = профиль “driving fatigue”: поток действий + износ без мелодрамы.
[FACT][VIBE-DEF-012] `soundscape_layer_low_end` = низкочастотный фон инфраструктуры (гул/вибрация/фазовые шумы).
[FACT][VIBE-DEF-013] `soundscape_layer_beat` = ритмика логистики и процедур (повторяемые такты, механическая регулярность).
[FACT][VIBE-DEF-014] `soundscape_layer_vocals` = голосовые интерфейсы (интерком, терминалы, краткие реплики).
[FACT][VIBE-DEF-015] `bend_resend_loop` = цикл “отказ/ограничение → правка параметров → повтор запроса” без эмоциональной экспозиции.
[FACT][VIBE-DEF-016] `procedural_spiral` = драматургический эффект “решение частичное → цикл запускается снова”.

## INVARIANTS

[DECISION][VIBE-INV-010] Scenes tagged with `restless_vibe` MUST express: flow_state AND wear_state.
[DECISION][VIBE-INV-011] Any atmospheric detail MUST map to: (infrastructure) OR (procedure) OR (human_cost), not decoration.
[DECISION][VIBE-INV-012] System MUST NOT be anthropomorphized; system-facing content MUST comply with CANON-SYSTEM-VOICE-0001.
[DECISION][VIBE-INV-013] City soundscape MUST be non-silent; silence MAY appear ONLY IF it is an anomaly or controlled regime marker.
[DECISION][VIBE-INV-014] Dialogue between team members MUST be utilitarian; social-smalltalk MUST NOT be the default interaction mode.

## CONTENT

[RULE][VIBE-100] IF scene.location = "CHELNY-2215" THEN apply `restless_vibe` constraints as default style profile.
[RULE][VIBE-101] IF scene.type ∈ {field_op, inspection, data_capture, access_gate, triage} THEN enforce `bend_resend_loop` as micro-structure.
[RULE][VIBE-102] IF a character expresses emotion THEN represent it as operational output (timing, errors, omissions, fatigue markers), not as monologue.

### Soundscape rules

[RULE][VIBE-110] `soundscape_layer_low_end` MUST be present as continuous background cue (hum/vibration/heat-exchange).
[RULE][VIBE-111] `soundscape_layer_beat` MUST be represented as repetition with stable cadence (procedural tick, conveyor rhythm, dispatch cadence).
[RULE][VIBE-112] `soundscape_layer_vocals` MUST sound filtered/flattened (intercom/PA/terminal tone), not theatrical voice acting.
[RULE][VIBE-113] IF sound is described THEN it MUST use cold mechanical descriptors (frequency, vibration, continuity, interference) and MUST NOT use romanticized noir audio tropes.

### Prose rhythm rules

[RULE][VIBE-120] Sentence length profile MUST satisfy: short_ratio ≥ 0.60 where short_sentence_words ∈ [3, 12].
[RULE][VIBE-121] Paragraph length MUST satisfy: paragraph_sentences ∈ [1, 4] for action/procedure beats.
[RULE][VIBE-122] IF a refusal/deny occurs (access, data, window, order) THEN the next 1–3 sentences MUST execute `bend_resend_loop`.
[RULE][VIBE-123] Exposition blocks MUST NOT exceed 4 sentences consecutively in `restless_vibe` scenes.

### Procedural spiral rules (macro)

[RULE][VIBE-130] Chapter/scene resolution MUST be partial: solved_scope ⊂ problem_space.
[RULE][VIBE-131] IF a win occurs THEN it MUST include a residual (new constraint, new window, new admissibility risk, new dependency).
[RULE][VIBE-132] IF a loss occurs THEN it MUST be framed as “lost window / lost admissibility / lost observability”, not as “defeat of hero”.

### Sensory / tactile rules

[RULE][VIBE-140] Sensory cues MUST prefer: heat, vibration, dry air, matte surfaces, service seams, access hatches.
[RULE][VIBE-141] IF describing “weight of system” THEN encode it as: physical load (heat/noise/space pressure) OR interface load (HUD strain, access friction), not mysticism.
[RULE][VIBE-142] Any tactile metaphor MUST preserve causality (source hardware → sensation), and MUST NOT imply sentient infrastructure.

### Team psychology / dialogue rules

[RULE][VIBE-150] Team talk MUST default to data exchange: request → constraint → delta → confirm.
[RULE][VIBE-151] Social friction MUST be minimized: no apology rituals, no “how are you”, no bonding banter as default.
[RULE][VIBE-152] Trust MUST be expressed as functional reliance: “I trust your competency for this task”, not declarations of friendship.
[RULE][VIBE-153] “Sync without words” MAY be used ONLY IF it is manifested via: gestures, timings, pre-agreed protocol phrases, shared artifacts.

### Integration rules

[RULE][VIBE-160] IF a system insert is used THEN it MUST follow CANON-SYSTEM-VOICE-0001 schema and MUST count toward scene density constraints there.
[RULE][VIBE-161] IF an OSA artifact snippet is shown THEN it MUST follow CANON-ARTIFACT-SNIPPETS-0001 forms and MUST NOT include literary adjectives.

## USAGE / RESOLUTION

[DECISION][VIBE-RES-010] This document applies at layer CANON and constrains SCENE generation for Chelny-2215 scenes.
[DECISION][VIBE-RES-011] Resolution order for style conflicts MUST be: RULE (SSOT-DOC-STYLE) → CANON-SYSTEM-VOICE → CANON-VIBE-RESTLESS → scene-specific overrides.
[DECISION][VIBE-RES-012] A scene is `restless_vibe` compliant IFF all of the following hold:
- sentence profile satisfies VIBE-120 and VIBE-121;
- soundscape satisfies VIBE-110..VIBE-113;
- dialogue satisfies VIBE-150..VIBE-153;
- no forbidden patterns (section FORBIDDEN) are present.
[DECISION][VIBE-RES-013] If a scene needs non-restless pacing THEN it MUST declare an explicit scene override doc-id and list which rules are disabled.

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-VIBE-RESTLESS-0001
role_type: RULE
export:
  - rule_id: VIBE-100
    intent: apply restless_vibe profile to Chelny-2215 scenes
    inputs: [scene.location]
    outputs: [scene_style_profile]
  - rule_id: VIBE-120
    intent: enforce sentence length profile for restless prose
    inputs: [scene.text]
    outputs: [prose_rhythm_rules]
  - rule_id: VIBE-110
    intent: enforce 3-layer soundscape presence
    inputs: [scene.description]
    outputs: [soundscape_rules]
  - rule_id: VIBE-150
    intent: enforce utilitarian team dialogue pattern
    inputs: [scene.dialogue]
    outputs: [dialogue_rules]
  - rule_id: VIBE-160
    intent: enforce integration constraints with system voice and artifacts
    inputs: [scene.inserts]
    outputs: [integration_constraints]
~~~

## FORBIDDEN

[FORBIDDEN][VIBE-FBD-010] Quoting lyrics or reproducing track text (any length).
[FORBIDDEN][VIBE-FBD-011] Noir-by-default clichés: constant rain, acid neon fetish, trenchcoat aesthetics as norm.
[FORBIDDEN][VIBE-FBD-012] “System as character”: first/second person, emotions, sarcasm, moral judgment attributed to system.
[FORBIDDEN][VIBE-FBD-013] Essay mode: paragraphs > 4 sentences in action/procedure scenes.
[FORBIDDEN][VIBE-FBD-014] “Victory ends the loop”: total closure without residual constraint (violates VIBE-130..VIBE-131).
[FORBIDDEN][VIBE-FBD-015] Social-smalltalk as default team behavior in operational scenes.

## NON-NORMATIVE

[NON-NORMATIVE][VIBE-EX-010] Example micro-structure (bend_resend_loop): deny → parameter change → re-issue → window gained.
[NON-NORMATIVE][VIBE-EX-011] Example soundscape layering: low-end hum (infrastructure) + repetitive procedural tick (logistics) + filtered intercom prompt (interfaces).
[NON-NORMATIVE][VIBE-EX-012] Example trust expression: competence-based reliance stated as task routing, not as emotional affirmation.
