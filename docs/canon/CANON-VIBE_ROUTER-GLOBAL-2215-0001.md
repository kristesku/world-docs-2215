---
id: CANON-VIBE_ROUTER-GLOBAL-2215-0001
title: >
  Atmosphere Auto-Router — Deterministic Vibe Selection
class: canon
status: draft
version: 1.0.0
prefix: VRT
doc_language: en-US
prose_language: ru-RU
inputs:
  - CANON-VIBE_FLOW-GLOBAL-2215-0001
  - CANON-VIBE_KINETIC-GLOBAL-2215-0001
  - CANON-VIBE_RESTLESS-GLOBAL-2215-0001
  - CANON-VIBE_VELVET-GLOBAL-2215-0001
  - CANON-VIBE_VOID-GLOBAL-2215-0001
depends_on:
  - SPEC-DOC_ID-2215-0001
  - SPEC-DOC_STYLE-2215-0001
  - SPEC-PRIORITY_RESOLUTION-2215-0001
scope: >
  RULE-канон детерминированного выбора vibe-профиля для сцены на основе
  метаданных сцены, если vibe не задан явно. Алгоритм: FIRST_MATCH_WINS по
  приоритетному стеку. Не использует анализ прозы.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: deterministically select exactly one vibe profile per scene using FIRST_MATCH_WINS routing rules
INPUTS: [scene.vibe_explicit, scene.type, scene.context, scene.tag.ZONE, scene.tag.TYPE, scene.tag.STATE, scene.tag.EVENT]
OUTPUTS: [scene.vibe, scene.vibe_source]
FORBIDDEN: [fuzzy_inference, prose_based_detection, multiple_vibes_active, ambiguous_selection]

## DEFINITIONS

[FACT][VRT-010] `vibe_token` ∈ {"RESTLESS","KINETIC","FLOW","VELVET","VOID"}.
[FACT][VRT-020] `scene.vibe_explicit` = строка; PASS IFF `scene.vibe_explicit == ""` OR `scene.vibe_explicit ∈ vibe_token`; ELSE FAIL.
[FACT][VRT-030] `scene.vibe` = строка; PASS IFF `scene.vibe ∈ vibe_token`; ELSE FAIL.
[FACT][VRT-040] `scene.vibe_source` ∈ {"EXPLICIT","DERIVED"}.
[FACT][VRT-050] `scene.context` = множество токенов UPPER_SNAKE_CASE.
[FACT][VRT-060] `scene.type` = токен UPPER_SNAKE_CASE.
[FACT][VRT-070] `scene.tag.ZONE` = токен UPPER_SNAKE_CASE OR "".
[FACT][VRT-080] `scene.tag.TYPE` = токен UPPER_SNAKE_CASE OR "".
[FACT][VRT-090] `scene.tag.STATE` = токен UPPER_SNAKE_CASE OR "".
[FACT][VRT-100] `scene.tag.EVENT` = токен UPPER_SNAKE_CASE OR "".
[FACT][VRT-110] `router_rule` = запись {priority, vibe, predicate}.
[FACT][VRT-120] `FIRST_MATCH_WINS` = выбор `router_rule` с минимальным `priority`, для которого `predicate == true`.

## INVARIANTS

[DECISION][VRT-200] Scene MUST have exactly one active vibe token; ELSE FAIL.
[DECISION][VRT-210] Explicit vibe MUST override derived routing; ELSE FAIL.
[DECISION][VRT-220] Derived vibe MUST be computed ONLY by FIRST_MATCH_WINS over OUTPUT CONTRACT `export.router_rules`; ELSE FAIL.
[DECISION][VRT-230] Router MUST NOT infer vibe from prose text; ELSE FAIL.

## CONTENT

[RULE][VRT-300] PASS IFF `scene.vibe_explicit == ""` OR (`scene.vibe_explicit ∈ vibe_token`); ELSE FAIL.
[RULE][VRT-310] IF `scene.vibe_explicit != ""` THEN `scene.vibe MUST equal scene.vibe_explicit` AND `scene.vibe_source MUST equal "EXPLICIT"`; ELSE PASS.
[RULE][VRT-320] IF `scene.vibe_explicit == ""` THEN `scene.vibe_source MUST equal "DERIVED"`; ELSE PASS.
[RULE][VRT-330] IF `scene.vibe_explicit == ""` THEN `scene.vibe MUST equal derive(scene)`; ELSE FAIL.
[RULE][VRT-340] PASS IFF `derive(scene)` is computed by FIRST_MATCH_WINS over OUTPUT CONTRACT `export.router_rules`; ELSE FAIL.

## USAGE / RESOLUTION

[DECISION][VRT-400] Conflict resolution MUST follow `SPEC-PRIORITY_RESOLUTION-2215-0001`; ELSE FAIL.
[DECISION][VRT-410] This router MUST be applied at scene planning stage BEFORE prose generation; ELSE FAIL.
[DECISION][VRT-420] This router MUST NOT disable any gating rules inside the target vibe documents; ELSE FAIL.

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-VIBE_ROUTER-GLOBAL-2215-0001
role_type: RULE
export:
  router_mode: FIRST_MATCH_WINS
  explicit_override_field: scene.vibe_explicit
  output_field: scene.vibe
  output_source_field: scene.vibe_source
  vibe_token_set: ["RESTLESS","KINETIC","FLOW","VELVET","VOID"]
  predicate_operators_allowed: ["AND","OR","NOT","==","!=","IN_SET","HAS_TOKEN"]
  router_rules:
    - priority: 10
      vibe: "VOID"
      predicate: >
        IN_SET(scene.tag.EVENT, {"FATAL_LOSS","IRREVERSIBLE_ERROR","MEGASTRUCTURE_BREATH"})
        OR IN_SET(scene.tag.ZONE, {"DEEP_ZONE","FORBIDDEN_ZONE","ABANDONED_NODE"})
        OR IN_SET(scene.tag.TYPE, {"HORROR","ISOLATION","COLLAPSE","AWE"})
    - priority: 20
      vibe: "KINETIC"
      predicate: >
        HAS_TOKEN(scene.context, "CHASE")
        OR HAS_TOKEN(scene.context, "NIGHT_TRANSIT")
        OR HAS_TOKEN(scene.context, "CLUB")
        OR HAS_TOKEN(scene.context, "TECH_TRANCE")
        OR HAS_TOKEN(scene.context, "HIGH_AUTOMATION_DENSITY")
    - priority: 30
      vibe: "VELVET"
      predicate: >
        IN_SET(scene.tag.ZONE, {"SAFE_HOUSE","VIP_SECTOR","BLIND_ZONE"})
        OR IN_SET(scene.tag.TYPE, {"INTIMACY","SEDUCTION","CONFESSION","RECOVERY","TRUST_ENGINEERING"})
        OR IN_SET(scene.tag.STATE, {"EMOTIONAL_OPENNESS","SEDATION","CONTROLLED_TRUST"})
    - priority: 40
      vibe: "FLOW"
      predicate: >
        IN_SET(scene.type, {"INSIGHT","EXECUTION","REFLECTION"})
        OR HAS_TOKEN(scene.context, "DEDUCTION")
        OR HAS_TOKEN(scene.context, "PLANNING")
        OR HAS_TOKEN(scene.context, "FOCUS")
        OR HAS_TOKEN(scene.context, "CREATION")
    - priority: 90
      vibe: "RESTLESS"
      predicate: "true"
  derive_contract:
    intent: "If scene.vibe_explicit != '' => scene.vibe=scene.vibe_explicit else select first router_rule with predicate==true"
~~~ 

## FORBIDDEN

[FORBIDDEN][VRT-900] Selecting more than one vibe for a single scene.
[FORBIDDEN][VRT-910] Using prose text content to decide vibe.
[FORBIDDEN][VRT-920] Introducing additional vibe tokens outside `vibe_token_set`.

## NON-NORMATIVE

(empty)
