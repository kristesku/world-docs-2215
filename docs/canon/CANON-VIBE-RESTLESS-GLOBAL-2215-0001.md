---
id: CANON-VIBE-RESTLESS-GLOBAL-2215-0001
title: >
  Atmosphere Reference — UNKLE "Restless" (Operational Vibe Profile)
class: canon
status: draft
version: 0.1.1
prefix: RST
doc_language: ru-RU
prose_language: ru-RU
inputs:
  - CANON-ARTIFACT-SNIPPETS-GLOBAL-2215-0001
  - CANON-CAST-GLOBAL-2215-0001
  - CANON-CITY-RU-2215-0007
  - CANON-LOC-CHELNY-2215-0001
  - CANON-SYSTEM-VOICE-GLOBAL-2215-0001
depends_on:
  - SPEC-DOC-ID-2215-0001
  - SPEC-DOC-STYLE-2215-0001
  - SPEC-PRIORITY-RESOLUTION-2215-0001
scope: >
  RULE-канон для “restless” сцен: поток действий + износ без мелодрамы,
  процедурная повторяемость, инфраструктурный саундскейп, утилитарный диалог.
  Ограничения задаются через решаемые токены сцены. Без SSOT-метрик и без прозы.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: enforce RESTLESS vibe constraints when scene.vibe == "RESTLESS"
INPUTS: [CANON-LOC-CHELNY-2215-0001, CANON-SYSTEM-VOICE-GLOBAL-2215-0001, CANON-ARTIFACT-SNIPPETS-GLOBAL-2215-0001, scene.inputs, scene.vibe, scene.context, scene.directives, scene.sound_markers, scene.dialogue_markers]
OUTPUTS: [sound_marker_pool, dialogue_marker_pool, restless_requirements]
FORBIDDEN: [lyrics_quotes, noir_cliches, system_anthropomorphism, essay_mode, smalltalk_default]

## DEFINITIONS

[FACT][RST-010] `scene.inputs` = список doc_id, явно подключённых сценой как входы.
[FACT][RST-011] `scene.vibe` = строковый тег профиля атмосферы сцены.
[FACT][RST-012] `scene.context` = набор контекстных токенов сцены (UPPER_SNAKE_CASE).
[FACT][RST-013] `scene.directives` = набор директив генерации сцены (UPPER_SNAKE_CASE).
[FACT][RST-014] `scene.sound_markers` = список звуковых токенов сцены (UPPER_SNAKE_CASE).
[FACT][RST-015] `scene.dialogue_markers` = список токенов диалога/взаимодействия (UPPER_SNAKE_CASE).

## INVARIANTS

[RULE][RST-020] IF "CANON-VIBE-RESTLESS-GLOBAL-2215-0001" IN scene.inputs THEN PASS IFF scene.vibe == "RESTLESS"; ELSE PASS.
[RULE][RST-030] IF scene.vibe == "RESTLESS" THEN PASS IFF scene.context intersects {"ROUTINE","FIELD_OP","INSPECTION","DATA_CAPTURE","ACCESS_GATE","TRIAGE","BUREAUCRACY","TRANSIT_SLOW"}; ELSE PASS.
[RULE][RST-040] IF scene.vibe == "RESTLESS" THEN PASS IFF "SYSTEM_AS_CHARACTER" NOT IN scene.context; ELSE PASS.
[RULE][RST-050] IF scene.vibe == "RESTLESS" AND "SILENCE" IN scene.context THEN PASS IFF "SILENCE_AS_ANOMALY" IN scene.directives; ELSE PASS.

## CONTENT

### A) Pools (normative tokens)

~~~yaml
sound_marker_pool:
  - LOW_END_HUM_CONTINUOUS
  - PROCEDURAL_TICK_CADENCE
  - FILTERED_INTERCOM_VOICE
  - HEAT_EXCHANGE_HISS
  - DRY_AIR_HVAC

sound_marker_required:
  - LOW_END_HUM_CONTINUOUS
  - PROCEDURAL_TICK_CADENCE

dialogue_marker_pool:
  - REQUEST_CONSTRAINT_DELTA_CONFIRM
  - NO_SMALLTALK_DEFAULT
  - COMPETENCE_TRUST_ROUTING
  - PROTOCOL_PHRASE_MINIMAL
  - FATIGUE_AS_TIMING_ERRORS

directive_required:
  - SENTENCE_PROFILE_SHORT_HEAVY
  - PARAGRAPH_PROFILE_1_TO_4_SENTENCES
  - EMOTION_AS_OPERATIONAL_OUTPUT
  - RESOLUTION_PARTIAL_WITH_RESIDUAL

directive_conditional:
  - if_context: ACCESS_DENY
    require: BEND_RESEND_LOOP
  - if_context: WINDOW_DENY
    require: BEND_RESEND_LOOP
  - if_context: DATA_DENY
    require: BEND_RESEND_LOOP

forbidden_directives:
  - LYRICS_QUOTE
  - NOIR_CLICHE_STACK
  - SYSTEM_ANTHROPOMORPHISM
  - ESSAY_MODE_BLOCK
~~~

### B) Soundscape constraints

[RULE][RST-110] IF scene.vibe == "RESTLESS" THEN PASS IFF scene.sound_markers.count ∈ [2,4]; ELSE PASS.
[RULE][RST-120] IF scene.vibe == "RESTLESS" THEN PASS IFF every(scene.sound_markers) ∈ sound_marker_pool; ELSE FAIL.
[RULE][RST-130] IF scene.vibe == "RESTLESS" THEN PASS IFF "LOW_END_HUM_CONTINUOUS" IN scene.sound_markers; ELSE FAIL.
[RULE][RST-140] IF scene.vibe == "RESTLESS" THEN PASS IFF "PROCEDURAL_TICK_CADENCE" IN scene.sound_markers; ELSE FAIL.

### C) Dialogue constraints

[RULE][RST-210] IF scene.vibe == "RESTLESS" THEN PASS IFF every(scene.dialogue_markers) ∈ dialogue_marker_pool; ELSE FAIL.
[RULE][RST-220] IF scene.vibe == "RESTLESS" THEN PASS IFF "REQUEST_CONSTRAINT_DELTA_CONFIRM" IN scene.dialogue_markers; ELSE FAIL.
[RULE][RST-230] IF scene.vibe == "RESTLESS" THEN PASS IFF "NO_SMALLTALK_DEFAULT" IN scene.dialogue_markers; ELSE FAIL.

### D) Prose/directives constraints

[RULE][RST-310] IF scene.vibe == "RESTLESS" THEN PASS IFF "SENTENCE_PROFILE_SHORT_HEAVY" IN scene.directives; ELSE FAIL.
[RULE][RST-320] IF scene.vibe == "RESTLESS" THEN PASS IFF "PARAGRAPH_PROFILE_1_TO_4_SENTENCES" IN scene.directives; ELSE FAIL.
[RULE][RST-330] IF scene.vibe == "RESTLESS" THEN PASS IFF "EMOTION_AS_OPERATIONAL_OUTPUT" IN scene.directives; ELSE FAIL.
[RULE][RST-340] IF scene.vibe == "RESTLESS" THEN PASS IFF "RESOLUTION_PARTIAL_WITH_RESIDUAL" IN scene.directives; ELSE FAIL.
[RULE][RST-350] IF scene.vibe == "RESTLESS" AND "ACCESS_DENY" IN scene.context THEN PASS IFF "BEND_RESEND_LOOP" IN scene.directives; ELSE FAIL.
[RULE][RST-360] IF scene.vibe == "RESTLESS" AND "WINDOW_DENY" IN scene.context THEN PASS IFF "BEND_RESEND_LOOP" IN scene.directives; ELSE FAIL.
[RULE][RST-370] IF scene.vibe == "RESTLESS" AND "DATA_DENY" IN scene.context THEN PASS IFF "BEND_RESEND_LOOP" IN scene.directives; ELSE FAIL.
[RULE][RST-380] IF scene.vibe == "RESTLESS" THEN PASS IFF every(forbidden_directives) NOT IN scene.directives; ELSE FAIL.

### E) Integration constraints (inputs as gates)

[RULE][RST-410] IF scene.vibe == "RESTLESS" AND "SYSTEM_INSERT" IN scene.context THEN PASS IFF "CANON-SYSTEM-VOICE-GLOBAL-2215-0001" IN scene.inputs; ELSE PASS.
[RULE][RST-420] IF scene.vibe == "RESTLESS" AND "ARTIFACT_SNIPPET" IN scene.context THEN PASS IFF "CANON-ARTIFACT-SNIPPETS-GLOBAL-2215-0001" IN scene.inputs; ELSE PASS.

## USAGE / RESOLUTION

[DECISION][RST-500] Scenes MUST treat this doc as applicable ONLY IF scene.vibe == "RESTLESS".
[DECISION][RST-510] Conflict resolution MUST follow SPEC-PRIORITY-RESOLUTION-2215-0001; ELSE FAIL.
[DECISION][RST-520] This doc MUST NOT override locality constraints; locality MUST be constrained by location canon/docs; ELSE FAIL.
[DECISION][RST-530] This doc MUST NOT be implied by folder membership or by location mention without explicit scene.vibe or scene.inputs; ELSE FAIL.

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-VIBE-RESTLESS-GLOBAL-2215-0001
role_type: RULE
export:
  - rule_id: RST-020
    intent: "applicability bound to explicit scene.inputs + scene.vibe"
    inputs: [scene.inputs, scene.vibe]
    outputs: [restless_requirements]
  - rule_id: RST-120
    intent: "sound markers must be selected from allowed pool"
    inputs: [scene.sound_markers]
    outputs: [sound_marker_pool, restless_requirements]
  - rule_id: RST-220
    intent: "require utilitarian dialogue pattern marker"
    inputs: [scene.dialogue_markers]
    outputs: [restless_requirements]
  - rule_id: RST-350
    intent: "require bend_resend_loop directive on deny contexts"
    inputs: [scene.context, scene.directives]
    outputs: [restless_requirements]
  - rule_id: RST-410
    intent: "gate system inserts by requiring system-voice doc in scene.inputs"
    inputs: [scene.context, scene.inputs]
    outputs: [restless_requirements]
~~~

## FORBIDDEN

[FORBIDDEN][RST-900] Quoting lyrics or reproducing track text (any length).
[FORBIDDEN][RST-910] Noir-by-default clichés as baseline framing.
[FORBIDDEN][RST-920] Anthropomorphizing the system as a speaking character.
[FORBIDDEN][RST-930] Treating essay blocks as a substitute for procedure/constraints.
[FORBIDDEN][RST-940] Consuming NON-NORMATIVE examples as rules.

## NON-NORMATIVE

(empty)
