---
id: CANON-LOC-CHELNY-RULES-2215-0001
title: >
  RU 2215 — Набережные Челны: Сенсорные дефолты, контуры и “maintenance dirt” (Rules)
class: canon
status: draft
version: 0.1.0
prefix: CHELNY
doc_language: ru-RU
prose_language: ru-RU
inputs:
  - BASELINE-PHYSICAL_LEVEL_MID-2215-0001
  - CANON-CITY-BOUNDARY-RU-2215-0008
  - CANON-CITY-RU-2215-0007
  - SSOT-LOC-WEATHER-CHELNY-2215-0001
  - SSOT-URBANISM-A-2215-0007
  - CANON-LOC-CHELNY-REGISTRY-2215-0001
depends_on:
  - SPEC-DOC-STYLE-2215-0001
  - SPEC-PRIORITY-RESOLUTION-2215-0001
scope: >
  RULE-канон для сцен RU-16/Набережные Челны (2215): сенсорные дефолты
  (свет/воздух/запах/звук/тактильность), правила “контуров” без инфодампа,
  и правила показа “maintenance dirt” (ограничения/доступ/maintenance) без нуара
  и без стерильной утопии. Пулы токенов вынесены в REGISTRY.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: enforceable scene defaults for Chelny-2215 sensory + infrastructure cues (non-noir, non-utopia)
INPUTS:
  - BASELINE-PHYSICAL_LEVEL_MID-2215-0001
  - CANON-CITY-BOUNDARY-RU-2215-0008
  - CANON-CITY-RU-2215-0007
  - SSOT-LOC-WEATHER-CHELNY-2215-0001
  - SSOT-URBANISM-A-2215-0007
  - CANON-LOC-CHELNY-REGISTRY-2215-0001
OUTPUTS: [sensory_defaults, allowed_scene_markers, infrastructure_cue_rules]
FORBIDDEN: [gotham_noir_defaults, sterile_utopia, infodump_explanations, total_surveillance_assumption, plastic_futurism]

## DEFINITIONS

[FACT][CHELNY-010] `token_pool` = exports.token_pools from `CANON-LOC-CHELNY-REGISTRY-2215-0001`.
[FACT][CHELNY-011] `smell_marker_token` ∈ token_pool.SMELL_MARKER.
[FACT][CHELNY-012] `kamaz_manifestation_token` ∈ token_pool.KAMAZ_MANIFESTATION.
[FACT][CHELNY-013] `allocation_procedure_cue_token` ∈ token_pool.ALLOCATION_PROCEDURE_CUE.
[FACT][CHELNY-014] `observability_artifact_cue_token` ∈ token_pool.OBSERVABILITY_ARTIFACT_CUE.
[FACT][CHELNY-015] `anchor_snippet_token` ∈ token_pool.ANCHOR_SNIPPET.

[FACT][CHELNY-020] `baseline_level` ∈ {LEVEL_MID, OTHER}.
[FACT][CHELNY-021] `sensory_tone` ∈ {MATURE_INFRA_DISCIPLINE, GOTHAM_NOIR, STERILE_UTOPIA, PLASTIC_FUTURISM}.
[FACT][CHELNY-022] `detail_binding` ∈ {BOUND_TO_CONTOUR_OR_COST, UNBOUND}.
[FACT][CHELNY-023] `conflict_framing` ∈ {ALLOCATION_UNDER_CONSTRAINTS, SURVIVAL_POVERTY_DEFAULT, OTHER}.
[FACT][CHELNY-024] `exterior_light_profile` ∈ {DIFFUSE_LOW_CONTRAST, OTHER}.
[FACT][CHELNY-025] `interior_light_profile` ∈ {LAYERED_AMBIENT_PLUS_TASK_POOLS, OTHER}.
[FACT][CHELNY-026] `night_lighting_profile` ∈ {LOW_GLARE_INFRA_PATH_HIGHLIGHT, SPECTACLE_SHOW, OTHER}.
[FACT][CHELNY-027] `indoor_air_profile` ∈ {CORRECT_DISCIPLINED, SLIGHT_DRY_CONDITIONING, OTHER}.
[FACT][CHELNY-028] `soundscape_profile` ∈ {LOW_FREQUENCY_CONTINUOUS_WITH_RARE_PROCEDURAL_BEEPS, CINEMATIC_SILENCE_DEFAULT, OTHER}.
[FACT][CHELNY-029] `surface_profile` ∈ {MATTE_MICROTEXTURED_LOW_SLIP, OTHER}.
[FACT][CHELNY-030] `material_profile` ∈ {COATED_METAL_AND_STRUCTURAL_COMPOSITES, GLOSSY_CONSUMER_PLASTIC, OTHER}.
[FACT][CHELNY-031] `kama_framing` ∈ {MANAGED_INFRASTRUCTURE, ROMANTIC_WILD_RIVER, OTHER}.
[FACT][CHELNY-032] `public_space_friction` ∈ {PROCEDURAL, VIOLENCE, OTHER}.
[FACT][CHELNY-033] `street_commerce_profile` ∈ {RESTRAINED_FUNCTIONAL_SERVICE_POINTS, FESTIVAL_BAZAAR, OTHER}.
[FACT][CHELNY-034] `mobility_description_mode` ∈ {LAYER_SWITCHING, RACING_CHASE, OTHER}.
[FACT][CHELNY-035] `primary_friction` ∈ {ACCESS_PERIMETER_WINDOW, TRAFFIC_JAMS, OTHER}.
[FACT][CHELNY-036] `observability_model` ∈ {RICH_BUT_FRAGMENTED, OMNISCIENT_TOTAL, OTHER}.
[FACT][CHELNY-037] `observability_surface_mode` ∈ {ARTIFACTS_AND_CONSTRAINTS, EXPOSITION, OTHER}.

[FACT][CHELNY-040] `smell_markers_count` = integer.
[FACT][CHELNY-041] `smell_markers_selected` = set(smell_marker_token).
[FACT][CHELNY-042] `kamaz_manifestations_count` = integer.
[FACT][CHELNY-043] `kamaz_manifestations_selected` = set(kamaz_manifestation_token).
[FACT][CHELNY-044] `anchor_snippets_count` = integer.
[FACT][CHELNY-045] `anchor_snippets_selected` = set(anchor_snippet_token).

[FACT][CHELNY-050] `incident_contour_active` = bool.
[FACT][CHELNY-051] `scene_or_override_declares_noir_weather` = bool.
[FACT][CHELNY-052] `noir_weather_substitution_used` = bool.
[FACT][CHELNY-053] `weather_values_sourced_from_ssot_weather` = bool.
[FACT][CHELNY-054] `plot_requires_kamaz_manifestations` = bool.
[FACT][CHELNY-055] `silence_is_described` = bool.
[FACT][CHELNY-056] `silence_implies_anomaly_or_regime_or_incident` = bool.

[FACT][CHELNY-060] `scene_in_ru16_chelny` = bool.
[FACT][CHELNY-061] `chelny_defaults_applied` = bool.
[FACT][CHELNY-062] `scene_or_override_overrides_chelny_defaults` = bool.

## INVARIANTS

[RULE][CHELNY-100] PASS IFF (baseline_level == LEVEL_MID) OR (incident_contour_active == true); ELSE FAIL.
[RULE][CHELNY-101] PASS IFF sensory_tone == MATURE_INFRA_DISCIPLINE; ELSE FAIL.
[RULE][CHELNY-102] PASS IFF detail_binding == BOUND_TO_CONTOUR_OR_COST; ELSE FAIL.
[RULE][CHELNY-103] PASS IFF conflict_framing == ALLOCATION_UNDER_CONSTRAINTS; ELSE FAIL.

## CONTENT

### A. Light (default)

[RULE][CHELNY-200] PASS IFF exterior_light_profile == DIFFUSE_LOW_CONTRAST; ELSE FAIL.
[RULE][CHELNY-201] PASS IFF interior_light_profile == LAYERED_AMBIENT_PLUS_TASK_POOLS; ELSE FAIL.
[RULE][CHELNY-202] PASS IFF night_lighting_profile == LOW_GLARE_INFRA_PATH_HIGHLIGHT; ELSE FAIL.
[FORBIDDEN][CHELNY-203] Neon-noir lighting as default city identity.

### B. Air / temperature (default)

[RULE][CHELNY-210] PASS IFF indoor_air_profile == CORRECT_DISCIPLINED; ELSE FAIL.
[FORBIDDEN][CHELNY-211] Using SLIGHT_DRY_CONDITIONING as Chelny-2215 default.

### C. Smell markers (per-scene budget + pool)

[RULE][CHELNY-220] PASS IFF smell_markers_count >= 0 AND smell_markers_count <= 2; ELSE FAIL.
[RULE][CHELNY-221] PASS IFF smell_markers_selected ⊆ token_pool.SMELL_MARKER; ELSE FAIL.
[FORBIDDEN][CHELNY-222] “Запах гнили/мусора/разложения” как дефолтная идентичность города.

### D. Soundscape (default)

[RULE][CHELNY-230] PASS IFF soundscape_profile == LOW_FREQUENCY_CONTINUOUS_WITH_RARE_PROCEDURAL_BEEPS; ELSE FAIL.
[RULE][CHELNY-231] PASS IFF (silence_is_described != true) OR (silence_implies_anomaly_or_regime_or_incident == true); ELSE FAIL.
[FORBIDDEN][CHELNY-232] CINEMATIC_SILENCE_DEFAULT as baseline.

### E. Tactile / surfaces (default)

[RULE][CHELNY-240] PASS IFF surface_profile == MATTE_MICROTEXTURED_LOW_SLIP; ELSE FAIL.
[RULE][CHELNY-241] PASS IFF material_profile == COATED_METAL_AND_STRUCTURAL_COMPOSITES; ELSE FAIL.
[FORBIDDEN][CHELNY-242] GLOSSY_CONSUMER_PLASTIC as dominant material language.

### F. Kama & embankments (water as regime boundary)

[RULE][CHELNY-250] PASS IFF kama_framing == MANAGED_INFRASTRUCTURE; ELSE FAIL.
[FORBIDDEN][CHELNY-251] ROMANTIC_WILD_RIVER as default framing.

### G. KAMAZ-trace (historical layer → operational node)

[RULE][CHELNY-260] PASS IFF (plot_requires_kamaz_manifestations == true) OR (kamaz_manifestations_count >= 0 AND kamaz_manifestations_count <= 1); ELSE FAIL.
[RULE][CHELNY-261] PASS IFF kamaz_manifestations_selected ⊆ token_pool.KAMAZ_MANIFESTATION; ELSE FAIL.

### H. “Maintenance dirt” (show limits without poverty)

[RULE][CHELNY-270] PASS IFF conflict_framing == ALLOCATION_UNDER_CONSTRAINTS; ELSE FAIL.
[FORBIDDEN][CHELNY-271] SURVIVAL_POVERTY_DEFAULT as baseline without explicit incident contour.

### I. Public space friction (friendly to locals, procedural to visitors)

[RULE][CHELNY-280] PASS IFF public_space_friction == PROCEDURAL; ELSE FAIL.
[RULE][CHELNY-281] PASS IFF street_commerce_profile == RESTRAINED_FUNCTIONAL_SERVICE_POINTS; ELSE FAIL.
[FORBIDDEN][CHELNY-282] Violence-first framing in public spaces as baseline.

### J. Mobility (layers, not racing)

[RULE][CHELNY-290] PASS IFF mobility_description_mode == LAYER_SWITCHING; ELSE FAIL.
[RULE][CHELNY-291] PASS IFF primary_friction == ACCESS_PERIMETER_WINDOW; ELSE FAIL.
[FORBIDDEN][CHELNY-292] RACING_CHASE as baseline mobility framing.

### K. Observability & privacy (no omniscience)

[RULE][CHELNY-300] PASS IFF observability_model == RICH_BUT_FRAGMENTED; ELSE FAIL.
[RULE][CHELNY-301] PASS IFF observability_surface_mode == ARTIFACTS_AND_CONSTRAINTS; ELSE FAIL.
[FORBIDDEN][CHELNY-302] OMNISCIENT_TOTAL as baseline assumption.

### L. Weather (consumption rule; values live in SSOT)

[RULE][CHELNY-310] PASS IFF weather_values_sourced_from_ssot_weather == true; ELSE FAIL.
[RULE][CHELNY-311] PASS IFF (noir_weather_substitution_used != true) OR (scene_or_override_declares_noir_weather == true); ELSE FAIL.
[FORBIDDEN][CHELNY-312] Constant noir-weather as baseline without explicit scene/override declaration.

## USAGE / RESOLUTION

[RULE][CHELNY-400] PASS IFF (scene_in_ru16_chelny != true) OR (chelny_defaults_applied == true) OR (scene_or_override_overrides_chelny_defaults == true); ELSE FAIL.
[DECISION][CHELNY-410] Downstream generation MUST treat these rules as default constraints for RU-16/Chelny scenes; ELSE FAIL.

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-LOC-CHELNY-RULES-2215-0001
role_type: RULE
export:
  - rule_id: CHELNY-220
    intent: "smell markers per scene limited to 0..2 and must come from registry pool"
    inputs: [smell_markers_count, smell_markers_selected, CANON-LOC-CHELNY-REGISTRY-2215-0001]
    outputs: [smell_marker_budget_ok]
  - rule_id: CHELNY-300
    intent: "observability baseline is rich-but-fragmented; surface via artifacts/constraints"
    inputs: [observability_model, observability_surface_mode]
    outputs: [observability_baseline_ok]
  - rule_id: CHELNY-310
    intent: "weather values must be sourced from SSOT weather exports"
    inputs: [SSOT-LOC-WEATHER-CHELNY-2215-0001, weather_values_sourced_from_ssot_weather]
    outputs: [weather_source_ok]
~~~

## FORBIDDEN

[FORBIDDEN][CHELNY-900] Gotham-noir defaults (constant rain, acid neon, trenchcoat aesthetics) as baseline.
[FORBIDDEN][CHELNY-901] Sterile utopia framing (no wear, no maintenance, no procedural friction).
[FORBIDDEN][CHELNY-902] Infodump explanations of systems; contours MUST be surfaced via cues/artifacts.
[FORBIDDEN][CHELNY-903] Total surveillance assumption without procedural gates, blind zones, aggregation, or delays.
[FORBIDDEN][CHELNY-904] Plastic-futurism visual language as default material identity.
[FORBIDDEN][CHELNY-905] Consuming NON-NORMATIVE examples as rules.

## NON-NORMATIVE

(Empty by design)
