---
id: CANON-CITY-RU-2215-0007
title: >
  RU 2215 — Chelny, Yelabuga, Moscow: Geography, Visual Language, Contrast (Working Canon)
class: canon
status: draft
version: 1.0.0
inputs: []
depends_on:
  - SSOT-DOC-STYLE-2215-0001
  - CANON-2215-CORE-0001
  - CANON-BASE-0001
scope: >
  Прикладной канон для сцен: как выглядят/ощущаются Набережные Челны и Москва
  в 2215, какие у них масштабы, формы, материалы, ритмы и почему контраст
  важен. Отдельно фиксируется Chelny–Yelabuga как двухъядерная агломерация
  вдоль Камы. Документ не вводит SSOT-метрики и не меняет baseline мира.
---

## LLM-INTENT

ROLE_TYPE: CANON_SCENE_ANCHOR
SCOPE: city sensory + morphology + contrast anchors (scene-ready)
INHERITS_WORLD_STATE_FROM: CANON-2215-CORE-0001
FORBIDDEN: [plastic_futurism, retro_brutalism, neon_rain_noir_default, dubai_showoff, techno_tourism_infodump]

---

## INVARIANTS

- [CANON][CTY-000] Оба города — один мир (2215). Контраст строится внутри него, не через “футуристичность vs современность”.
- [CANON][CTY-001] Desired effect: читатель восхищается городом, но не хочет там жить (особенно в Chelny).
- [CANON][CTY-002] “Современнее в 2215” = зрелость/собранность/обжитость, а не демонстрация новизны.
- [CANON][CTY-003] GitS-вайб задаётся причинностью, масштабом и системностью, не неоном/дождём/клише noir.
- [CANON][CTY-004] Визуал не уходит ни в “пластиковый футуризм”, ни в ретро-брутализм XX века.
- [DECISION][CTY-010] CANON-CITY-RU-2215-0007 MUST NOT be applied implicitly to scenes.
- [DECISION][CTY-011] A scene MAY use this document ONLY IF the scene explicitly references it via:
  - scene.inputs / depends_on, OR
  - scene.tag: city_anchor = CANON-CITY-RU-2215-0007, OR
  - explicit in-scene marker: [CANON_REF: CANON-CITY-RU-2215-0007]
- [DECISION][CTY-012] IF a scene has no explicit reference THEN this document is treated as non-applicable.

---

## 1. Chelny 2215 — Role and Form

### 1.1 Role (what the city *is*)

- [STATE][CTY-010] Chelny_role = "node_and_interface"
- [STATE][CTY-011] city_function_domains = [
    "logistics",
    "industry",
    "service_contours",
    "people_systems_interface"
  ]

- [RULE][CTY-012] city_is_easier_for_residents_than_visitors = true
- [NOTE][CTY-013] UX principle: "hard to learn, harder to master" as habit-to-live skill.

### 1.2 Scale (working parameters)

- [ASSUMPTION][CTY-020] population_permanent_million = "2.0–2.3"
- [ASSUMPTION][CTY-021] population_rotational_share = "10–20%"

- [ASSUMPTION][CTY-022] length_along_kama_km = "45–60"  # linear ribbon with node thickenings
- [ASSUMPTION][CTY-023] key_width_km = "15–25"          # incl. both banks + industrial belts

- [STATE][CTY-024] occupies_both_banks_of_kama = true

### 1.3 Height (explicitly not a skyscraper forest)

- [ASSUMPTION][CTY-030] background_residential_floors = "14–22"
- [ASSUMPTION][CTY-031] node_dominants_floors = "30–45"         # bridges, hubs, key viewpoints
- [ASSUMPTION][CTY-032] rare_accents_floors = "60–80"           # few, as node markers, not “elite skyline”

### 1.4 Industry (how it shapes the city)

- [STATE][CTY-040] industrial_zone_is_huge_and_key = true
- [CANON][CTY-041] industry_is_cleaner_quieter_more_automated_but_spatially_massive = true
- [CANON][CTY-042] industry_and_housing_coexist_separated_by_modes_not_walls = true

---

## 2. Chelny–Yelabuga 2215 — Two-core agglomeration along Kama

### 2.1 Bonding principle

- [CANON][CTY-100] agglomeration_model = "infrastructure_fused_functionally_distinct_two_cores"
- [CANON][CTY-101] corridor_can_be_function_dense_without_continuous_residential_fabric = true

### 2.2 Corridor feel (between cores)

- [ASSUMPTION][CTY-110] corridor_contains = [
    "logistics",
    "energy_nodes",
    "service_clusters",
    "campuses_testgrounds",
    "industrial_belts",
    "transport_layer_intersections"
  ]

- [CANON][CTY-111] corridor_breaks_allowed = true   # green/tech breaks
- [CANON][CTY-112] breaks_feel_intentional_void = true
- [CANON][CTY-113] transition_time_minutes = "15–25"
- [CANON][CTY-114] transition_feels_like_city_type_change = true

### 2.3 Roles of cores (working hypothesis)

- [ASSUMPTION][CTY-120] Chelny_core = "linear_giant_industrial_service_interface"
- [ASSUMPTION][CTY-121] Yelabuga_core = "more_compact_denser_more_collected_distinct_rhythm"

### 2.4 Text phrasing rules

- [CANON][CTY-130] allowed_phrases = [
    "Челнинско-Елабужская агломерация",
    "два ядра",
    "коридор Камы",
    "переходная зона/пояс"
  ]

- [FORBIDDEN][CTY-131] calling_it_one_city_without_qualification = true

---

## 3. Chelny 2215 — Visual Language

### 3.1 Season & light (default anchor)

- [CANON][CTY-200] default_season = "summer"
- [CANON][CTY-201] default_weather = "warm_not_sunny"
- [CANON][CTY-202] sky = "grey_overcast"
- [CANON][CTY-203] light = "diffuse_low_contrast_min_sharp_shadows"
- [RULE][CTY-204] light_emphasizes_mass_volume_not_color = true

### 3.2 Core principle: “everything is larger”

- [CANON][CTY-210] scale_excess_as_norm = true
- [CANON][CTY-211] scale_excess_surfaces_as = ["space", "volume"]  # not ornament/cost

- [NOTE][CTY-212] It is not “wealth flex”; it is preference for scale as “correct world feeling”.

### 3.3 “Berlin-like” emptiness

- [CANON][CTY-220] berlin_like_means = "comfort_with_voids_and_large_spaces"
- [CANON][CTY-221] voids_are_legitimate_fabric = true
- [CANON][CTY-222] voids_not_read_as_inefficiency = true

### 3.4 Materials & surfaces (mature 2215)

- [FORBIDDEN][CTY-230] plastic_as_primary_feel = true
- [CANON][CTY-231] surfaces = "matte_deep_microtexture"
- [CANON][CTY-232] glass = "low_glare_not_mirror"
- [CANON][CTY-233] seams_between_facade_infra_street = "reduced_continuous_joints"

- [CANON][CTY-234] sidewalk_character = "quiet_durable_monolithic_surface_with_tactile_texture"
- [NOTE][CTY-235] No “tile-as-a-signal”, no rough asphalt as main marker.

### 3.5 Architectural plasticity (forms)

- [CANON][CTY-240] forms = "calm_not_primitive_large_radii_soft_connections"
- [CANON][CTY-241] no_architectural_shouting = true
- [CANON][CTY-242] ceiling_heights = "noticeably_higher_than_21st_century_norm"
- [CANON][CTY-243] windows_and_entries = "oversized_portal_like"

### 3.6 “Comfortable for residents, not desirable for outsiders”

- [CANON][CTY-250] resident_comfort_from = ["rhythm", "reliability"]  # not friendliness to guest
- [CANON][CTY-251] awe_without_desire_from = ["scale", "systemness", "seriousness"]
- [CANON][CTY-252] everyday_family_visibility = "normal_two_kids_not_exception"

---

## 4. Moscow 2215 — Edge

### 4.1 Definition

- [STATE][CTY-300] Moscow_role = "edge_of_time"
- [CANON][CTY-301] moscow_is_not_dubai_showoff = true
- [CANON][CTY-302] moscow_is_overcaring_rich_parent_vibe = true
- [CANON][CTY-303] cultural_loop = ["better", "newer", "faster", "more_advanced"]  # obsessive improvement

### 4.2 Lived consequences

- [CANON][CTY-310] mode = "continuous_deployment"
- [CANON][CTY-311] interface_procedure_access_churn = "higher"
- [CANON][CTY-312] possibilities_density = "maximal"
- [CANON][CTY-313] entry_price_and_cognitive_social_load = "higher"

---

## 5. Contrast summary (portable)

- [CANON][CTY-400] Chelny = "future_as_background"
- [CANON][CTY-401] Moscow = "future_as_event"

- [CANON][CTY-402] contrast_one_line = [
    "Chelny: big_heavy_excessive_by_volume_stable_for_its_own",
    "Moscow: edge_max_options_high_tempo_high_cost"
  ]

---

## 6. Quick recall anchors (author UI)

### 6.1 Chelny 2215

- [ANCHOR][CTY-500] "warm summer, grey sky, diffuse light"
- [ANCHOR][CTY-501] "everything larger: entries, windows, ceilings, bridges, underpasses"
- [ANCHOR][CTY-502] "large masses, calm forms, matte materials"
- [ANCHOR][CTY-503] "Berlin-like comfort with voids"
- [ANCHOR][CTY-504] "city for residents; habit and rhythm are value"

### 6.2 Chelny–Yelabuga 2215

- [ANCHOR][CTY-510] "two distinct cores"
- [ANCHOR][CTY-511] "Kama corridor: infrastructure + functions + intentional breaks"
- [ANCHOR][CTY-512] "15–25 minutes feels like switching city type"

### 6.3 Moscow 2215

- [ANCHOR][CTY-520] "Edge: better/newer right now"
- [ANCHOR][CTY-521] "not flex; obsessive improvement"
- [ANCHOR][CTY-522] "max options, high price, high churn"

---

## QUESTIONS (non-blocking)

- [QUESTION][CTY-800] Chelny nodes map: which thickenings are primary (hubs, bridges, industrial knots).
- [QUESTION][CTY-801] Moscow material/palette layer (concept fixed; surface language not yet).
- [QUESTION][CTY-802] Yelabuga’s distinct rhythm markers (what makes it “collected”).
- [QUESTION][CTY-803] Typical Chelny commercial street / storefront rhythm (scene-ready).
- [QUESTION][CTY-804] Winter variant that preserves “big Chelny” without collapsing into noir clichés.

---

## FORBIDDEN

- [FORBIDDEN][CTY-900] Neon-rain noir default (“Gotham mode”) without local causality.
- [FORBIDDEN][CTY-901] Plastic-futurism as baseline.
- [FORBIDDEN][CTY-902] Retro-brutalism XX century as baseline.
- [FORBIDDEN][CTY-903] Turning Chelny into a dystopian slum by default.
- [FORBIDDEN][CTY-904] Implicit auto-application of city anchors to any scene without explicit reference (CTY-011).
- [FORBIDDEN][CTY-905] Using city anchors to justify geography/boundary claims (use CANON-CITY-BOUNDARY-RU-2215-0008 instead).

---

## USAGE / RESOLUTION

[DECISION][CTY-USE-010] This document provides optional scene anchors (sensory/morphology/contrast), not defaults.
[DECISION][CTY-USE-011] Scenes MUST NOT “inherit” city anchors unless explicitly referenced (CTY-011).
[DECISION][CTY-USE-012] If used, scenes MUST select 1–3 anchors maximum per scene.
[FORBIDDEN][CTY-USE-013] Using CANON-CITY as a baseline substitute for environment_snapshot or baseline physical defaults.

---

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-CITY-RU-2215-0007
role_type: CANON_SCENE_ANCHOR
inherits_from: CANON-2215-CORE-0001

export:
  chelny:
    role: node_and_interface
    scale:
      population_million: "2.0–2.3 + 10–20% rotational"
      length_km: "45–60 along Kama"
      width_km: "15–25 key"
      both_banks: true
    height:
      background_floors: "14–22"
      node_dominants_floors: "30–45"
      rare_accents_floors: "60–80 (few)"
    sensory:
      season: "summer"
      sky: "grey"
      light: "diffuse"
      materials: "matte_microtexture_low_glare_glass"
      principle: "everything larger"
  chelny_yelabuga:
    model: "two-core agglomeration"
    transition_minutes: "15–25"
  moscow:
    role: edge_of_time
    mode: "continuous_deployment"
  contrast:
    chelny: "future_as_background"
    moscow: "future_as_event"
~~~

---

## NON-NORMATIVE

(Empty by design)
