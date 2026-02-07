---
id: CANON-LOC-CHELNY-2215-0001
title: >
  RU 2215 — Набережные Челны: Сенсорный профиль, повседневные интерфейсы и “maintenance dirt” (Scene Canon)
class: canon
status: draft
version: 0.3.0
prefix: CHELNY
doc_language: ru-RU
prose_language: ru-RU
inputs:
  - BASELINE-PHYSICAL-LEVEL-MID-2215-0001
  - CANON-CITY-BOUNDARY-RU-2215-0008
  - CANON-CITY-RU-2215-0007
  - SSOT-LOC-WEATHER-CHELNY-2215-0001
  - SSOT-URBANISM-A-2215-0007
depends_on:
  - SPEC-DOC-STYLE-2215-0001
scope: >
  Scene-level canonical RULES for RU-16/Набережные Челны (2215): сенсорные дефолты
  (свет/воздух/запах/звук/тактильность), правила “контуров” без инфодампа, и
  правила показа “dirt of stability” (ограничения/доступ/maintenance) без нуара
  и без стерильной утопии.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: scene defaults for Chelny-2215 sensory + infrastructure cues (non-noir, non-utopia)
INPUTS: [BASELINE-PHYSICAL-LEVEL-MID-2215-0001, CANON-CITY-BOUNDARY-RU-2215-0008, CANON-CITY-RU-2215-0007, SSOT-LOC-WEATHER-CHELNY-2215-0001, SSOT-URBANISM-A-2215-0007]
OUTPUTS: [sensory_defaults, allowed_scene_markers, infrastructure_cue_rules, anchor_snippet_pool]
FORBIDDEN: [gotham_noir_defaults, sterile_utopia, infodump_explanations, total_surveillance_assumption, plastic_futurism]

## DEFINITIONS

[FACT][CHELNY-010] `sensory_marker` = короткий сенсорный сигнал (запах/звук/свет/тактильность), который имплицирует контур.
[FACT][CHELNY-011] `contour` = операционный слой системы (энергия/логистика/наблюдаемость/доступ/аудит), видимый через артефакты и ограничения.
[FACT][CHELNY-012] `maintenance_dirt` = износ не-бедности: швы сервиса, пломбы, временные маршруты, следы частого обслуживания, “sealed/closed” маркировка.
[FACT][CHELNY-013] `scene_anchor_snippet` = 1–2 предложения, вставляемые без объяснения; MUST имплицировать контур или цену процедуры.

## INVARIANTS

[RULE][CHELNY-020] Default baseline MUST be functional 24/7 (LEVEL-MID) UNLESS scene explicitly activates an incident contour; ELSE FAIL.
[RULE][CHELNY-021] Сенсорный тон MUST быть “зрелая инфраструктурная дисциплина” (масштаб + матовость + процедурные сигналы); ELSE FAIL.
[RULE][CHELNY-022] Любая атмосферная деталь MUST имплицировать contour OR human_cost_of_allocation; ELSE FAIL.
[RULE][CHELNY-023] “Comfort baseline” MUST hold: бытовые контуры комфортны; конфликт MUST быть allocation-under-constraints, NOT survival poverty; ELSE FAIL.

## CONTENT

### A. Light (default)

[RULE][CHELNY-030] Exterior light MUST be diffuse/low-contrast; sharp shadows MUST NOT be default.
[RULE][CHELNY-031] Interior light MUST be layered: ambient_base + procedural_task_pools (терминалы/чекпоинты/рабзоны).
[RULE][CHELNY-032] Night lighting MUST be low-glare infrastructure; path/contour highlighting > spectacle.
[FORBIDDEN][CHELNY-033] Neon-noir lighting as default city identity.

### B. Air / temperature (default)

[RULE][CHELNY-040] Summer air MUST read as warm_industrial; “город работает непрерывно” MUST be implied by cues, not explained.
[RULE][CHELNY-041] Indoor air MUST read as correct_disciplined; slight_dry_conditioning MAY NOT be used; ELSE FAIL.
[RULE][CHELNY-042] Indoor air cue, when used, MUST be a sensory_marker; infodump is FORBIDDEN.

### C. Smell markers (allowed pool; per-scene budget)

[RULE][CHELNY-050] smell_markers_count MUST be in [0, 2]; ELSE FAIL.
[RULE][CHELNY-051] Any smell marker used MUST be selected from smell_marker_pool; ELSE FAIL.
[FORBIDDEN][CHELNY-052] “Запах гнили/мусора/разложения” как дефолтная идентичность города.

~~~yaml
smell_marker_pool:
  - OZONE_ELECTRIC_SERVICE
  - WARMED_COMPOSITE_SHELL
  - RIVER_MOISTURE_ALGAE_WET_CONCRETE
  - DUST_WARM_METAL_LOGISTICS
  - FAINT_CLEANING_CHEMISTRY_PUBLIC
~~~

### D. Soundscape (default)

[RULE][CHELNY-060] City sound MUST be low_frequency_continuous (логистический гул/вентиляция/теплообмен) + rare_dry_procedural_beeps.
[RULE][CHELNY-061] IF silence_is_described THEN it MUST imply anomaly OR special_regime OR incident; ELSE FAIL.
[FORBIDDEN][CHELNY-062] Total cinematic silence as default baseline.

### E. Tactile / surfaces (default)

[RULE][CHELNY-070] Surfaces MUST be matte, micro_textured, low_slip; “quiet to touch”.
[RULE][CHELNY-071] Metal cues MUST read as coated/anodized; composites MUST read as deep_structural; glossy_consumer_plastic is FORBIDDEN.
[RULE][CHELNY-072] Service seams MUST be visible (hatches/joints/sealed_panels) as maintenance_dirt cues, not as “rust/decay”.

### F. Kama & embankments (water as regime boundary)

[RULE][CHELNY-080] Kama MUST be shown as managed infrastructure (reinforced banks, controlled access pockets); ELSE FAIL.
[RULE][CHELNY-081] Embankments MUST read as routes + service corridors with sparse rest_pockets.
[RULE][CHELNY-082] West bank nature MUST read as controlled_nature (regulated transition); ELSE FAIL.
[FORBIDDEN][CHELNY-083] Romantic “wild river” framing as default.

### G. KAMAZ-trace (historical layer → operational node)

[RULE][CHELNY-090] Any KAMAZ reference MUST be a system-layer cue (historical+operational), NOT nostalgia-only; ELSE FAIL.
[RULE][CHELNY-091] KAMAZ manifestations per scene MUST be count in [0, 1] UNLESS plot_requires; ELSE FAIL.
[RULE][CHELNY-092] Any KAMAZ manifestation used MUST be selected from kamaz_manifestation_pool; ELSE FAIL.

~~~yaml
kamaz_manifestation_pool:
  - AUTOMATED_PRODUCTION_REPAIR_CONTOUR
  - LOGISTICS_MEGAHUB_SORTING_CORRIDORS
  - MUSEUM_ACTIVE_HYBRID_PUBLIC_SHELL_RESTRICTED_ZONES
kamaz_visual_cue_tokens:
  - LARGE_SPANS
  - CALM_MASSES
  - MINIMAL_ORNAMENT
  - MANY_SERVICE_GATES
  - ACCESS_HATCHES
  - ROUTE_LAYERS
~~~

### H. “Maintenance dirt” (show limits without poverty)

[RULE][CHELNY-100] “Dirt” MUST be maintenance_dirt, NOT slum_grime; ELSE FAIL.
[RULE][CHELNY-101] Conflict cues MUST map to allocation_or_procedure; ELSE FAIL.
[FORBIDDEN][CHELNY-102] Poverty-as-default framing without explicit Override/Scene incident contour.

~~~yaml
allocation_procedure_cue_pool:
  - SERVICE_WINDOWS
  - POWER_WINDOWS_PEAK_CAPACITY
  - SUPPLY_CLASSES
  - ACCESS_TIERS
  - AUDIT_LEGAL_ADMISSIBILITY_GATES
~~~

### I. Public space friction (friendly to locals, procedural to visitors)

[RULE][CHELNY-110] Public spaces MUST be safe_and_maintained; friction MUST be procedural (badges/windows/routing), NOT violence.
[RULE][CHELNY-111] Visitor perception MUST include at least one: TOO_BIG OR TOO_PROCEDURAL OR TOO_CONFIDENT_IN_RULES; ELSE FAIL.
[RULE][CHELNY-112] Street commerce MUST be restrained_functional (service_points > festival_bazaar).

### J. Mobility (layers, not racing)

[RULE][CHELNY-120] Movement MUST be described as switching layers: pedestrian → autonomous_mobility → service_or_restricted; ELSE FAIL.
[RULE][CHELNY-121] Traffic_jams MUST NOT be primary city feel; primary friction = access/perimeter/window; ELSE FAIL.
[FORBIDDEN][CHELNY-122] Car_chase_culture as baseline framing.

### K. Observability & privacy (no omniscience)

[RULE][CHELNY-130] Observability MUST be rich_but_fragmented (blind_zones + delay + aggregation); ELSE FAIL.
[RULE][CHELNY-131] Observability cues MUST surface as artifacts/constraints, NOT exposition; ELSE FAIL.
[FORBIDDEN][CHELNY-132] Assuming total omniscient surveillance without procedural gates, blind zones, aggregation, or delays.

~~~yaml
observability_artifact_cue_pool:
  - NO_PRIMARY_LOGS_ONLY_AGGREGATES
  - LOG_WINDOW_CLOSES_IN_HOURS
  - REQUIRES_ORDER_OR_CHAIN_OF_CUSTODY
  - ACCESS_DENIED_BY_TIER
  - BLIND_ZONE_BY_DESIGN
~~~

### L. Weather (consumption rule; values live in SSOT)

[RULE][CHELNY-140] Scene weather defaults MUST be sourced from `SSOT-LOC-WEATHER-CHELNY-2215-0001` exports; ELSE FAIL.
[FORBIDDEN][CHELNY-141] Noir-weather substitution (constant rain/dark gloom) as baseline without explicit Override/Scene.

## USAGE / RESOLUTION

[RULE][CHELNY-150] Scenes in RU-16/Набережные Челны MUST apply this doc as default sensory + cue layer UNLESS overridden by Scene/Override; ELSE FAIL.
[RULE][CHELNY-151] IF a scene needs “darker tone” THEN apply CHELNY-100/101 cues (maintenance_dirt + allocation), NOT noir tropes; ELSE FAIL.
[RULE][CHELNY-152] IF a scene needs “system presence” THEN use CHELNY-060/072/131 cue patterns, NOT exposition paragraphs; ELSE FAIL.

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-LOC-CHELNY-2215-0001
role_type: RULE
export:
  - rule_id: CHELNY-030
    intent: "exterior light default is diffuse/low-contrast"
    inputs: [SSOT-URBANISM-A-2215-0007]
    outputs: [scene_light_profile]
  - rule_id: CHELNY-050
    intent: "smell markers per scene limited to 0..2 from allowed pool"
    inputs: []
    outputs: [smell_marker_pool, smell_marker_count_range]
  - rule_id: CHELNY-100
    intent: "show maintenance dirt, not poverty or decay"
    inputs: [BASELINE-PHYSICAL-LEVEL-MID-2215-0001]
    outputs: [maintenance_dirt_cues, allocation_procedure_cue_pool]
  - rule_id: CHELNY-130
    intent: "observability is rich-but-fragmented; surface via procedural artifacts"
    inputs: [SSOT-URBANISM-A-2215-0007]
    outputs: [observability_cues, observability_artifact_cue_pool]
  - rule_id: CHELNY-140
    intent: "weather defaults consumed from SSOT weather exports"
    inputs: [SSOT-LOC-WEATHER-CHELNY-2215-0001]
    outputs: [weather_profile_reference]
~~~

## FORBIDDEN

[FORBIDDEN][CHELNY-900] Gotham-noir defaults (constant rain, acid neon, trenchcoat aesthetics) as baseline.
[FORBIDDEN][CHELNY-901] Sterile utopia framing (no wear, no maintenance, no procedural friction).
[FORBIDDEN][CHELNY-902] Infodump explanations of systems; contours MUST be implied via cues/artifacts.
[FORBIDDEN][CHELNY-903] Total surveillance assumption without procedural gates, blind zones, aggregation, or delays.
[FORBIDDEN][CHELNY-904] Plastic-futurism visual language as default material identity.
[FORBIDDEN][CHELNY-905] Consuming NON-NORMATIVE examples as rules.

## NON-NORMATIVE

### Anchor snippet pool (examples only; not rules)

- “Матовая поверхность перил тёплая — как будто город всё время чуть подогревает себя изнутри.”
- “В переходе пахнет озоном и моющим — как в серверной, только с людьми.”
- “Над Камой свет рассеянный, а бетон берега выглядит обслуженным, как корпус оборудования.”
- “Вдали гудит контур — не машины, а режим.”
- “Тишина здесь не отдых: тишина означает, что слой отключён.”

### Micro-pattern (cue without explanation)

- “Нет первички, только агрегаты. Окно логов закрывается через 6 часов. Нужен ордер.”
