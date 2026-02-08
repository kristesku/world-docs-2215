---
id: CANON-CASTREGISTRY-GLOBAL-2215-0001
title: >
  Core Team (ОСА) — Cast Registry (STATE)
class: canon
status: fixed
version: 1.0.0
prefix: CASTREG
doc_language: en
prose_language: ru-RU
inputs: []
depends_on:
  - SPEC-DOC-STYLE-2215-0001
  - SPEC-PRIORITY-RESOLUTION-2215-0001
scope: >
  Реестр состава ОСА и связанных акторов как данных (STATE): сущности персонажей,
  их role/leverage/cannot/optics/scene_types и маппинг токенов для сцен.
  Имена в tags.participants MUST использовать значения из колонки display_name_ru.
  Без правил использования и без художественного текста.
---

## LLM-INTENT

ROLE_TYPE: STATE
SCOPE: provide authoritative cast registry rows for OSA core team and externals
INPUTS: []
OUTPUTS: [cast_registry_rows]
FORBIDDEN: [rule_definition, prose, implicit_membership, new_metrics]

## DEFINITIONS

[FACT][CASTREG-010] `cast_row` = запись таблицы с полями {entity_id, token, display_name_ru, entity_kind, role, leverage, cannot, optics, scene_types, age_range_years, affiliation, not_antagonist, act_range, hud_style, hud_visuals, hud_sensory}.
[FACT][CASTREG-020] `entity_id` = строковый id сущности, формат `person.<snake>` или `external.<snake>`.
[FACT][CASTREG-025] `token` = краткий ASCII-токен, формат `^[A-Z][A-Za-z0-9_]*$`. Используется в YAML/коде.
[FACT][CASTREG-026] `display_name_ru` = отображаемое русское имя для tags.participants и прозы.
[FACT][CASTREG-027] `nickname_ru` = допустимое обращение в диалоге от членов команды (если отличается от display_name_ru). Пустая строка = не применимо.
[FACT][CASTREG-030] `entity_kind` ∈ {person, system_agent, external}.
[FACT][CASTREG-031] `system_agent` = человек-агент оптимизационного контура; НЕ антагонист, а функция (см. CANON-CONFLICT CNF-INV-007).
[FACT][CASTREG-040] `role` = строковый enum-токен формата `^[a-z0-9_]+$`.
[FACT][CASTREG-050] `leverage` = CSV-список токенов.
[FACT][CASTREG-060] `cannot` = CSV-список токенов.
[FACT][CASTREG-070] `optics` = токен.
[FACT][CASTREG-080] `scene_types` = CSV-список токенов.
[FACT][CASTREG-090] `act_range` = строка формата `[I,V]` указывающая акты присутствия; пустая = все.

## INVARIANTS

[DECISION][CASTREG-200] PASS IFF `token` is unique across rows; ELSE FAIL.
[DECISION][CASTREG-210] PASS IFF `entity_id` is unique across rows; ELSE FAIL.
[DECISION][CASTREG-215] PASS IFF `display_name_ru` is unique across rows; ELSE FAIL.
[DECISION][CASTREG-220] PASS IFF each `person` row has non-empty {role, leverage, cannot, optics, scene_types}; ELSE FAIL.
[DECISION][CASTREG-230] PASS IFF each `system_agent` row has non-empty {role, leverage, cannot}; ELSE FAIL.
[DECISION][CASTREG-240] Consumers MUST treat CONTENT table as the only authoritative registry payload; ELSE FAIL.
[DECISION][CASTREG-245] tags.participants in PLAN-STORY and SCENE-ACTs MUST use `display_name_ru` values; ELSE FAIL.

## CONTENT

### OSA Core Team

| entity_id | token | display_name_ru | nickname_ru | entity_kind | role | leverage | cannot | optics | scene_types | age_range_years | affiliation | not_antagonist | act_range | hud_style | hud_visuals | hud_sensory |
| -- | -- | -- | -- | -- | -- | -- | -- | -- | -- | -- | -- | -- | -- | -- | -- | -- |
| person.rinat_akhmetzyanov | Rinat | Ринат | | person | regional_chief | license_manipulation,quota_trading,regulatory_loopholes,federal_escalation_gate | command_field_tactics,violate_audit_trace,show_emotion_to_subordinates | silence_equals_approval_noise_equals_error | strategic_triage,resource_bargaining,summoned_to_carpet | [48,55] | osa_regional | true | [III,V] | | | |
| person.miron_karimov | Miron | Мирон | | person | field_operation_lead | priority_switching,tactical_pacing,grey_zone_ownership | panic,ignore_safety_protocol_without_logging | chaos_management | stabilize_team,operational_bargaining,absorb_pressure | | osa_field | true | [I,V] | | | |
| person.lev_safonov | Lev | Лев | Лёва | person | systems_analyst | log_deep_dive,pattern_recognition,bypass_ui_limitations | physical_fight,perceive_social_subtext | wireframe_reality | deduction_spree,server_room_archaeology,needle_finding | | osa_field | true | [I,V] | Terminal_Monochrome | Wireframe_overlays_plus_hex_logs | Audio_Damping |
| person.aidar_bulatov | Aidar | Айдар | | person | field_operator | area_denial,physical_breach,equipment_load_bearing | engage_in_politics,act_without_orders_in_civilian_zone | vectors_and_cover | checking_corners,presence_intimidation,breaching | | osa_field | true | [I,V] | Tactical_AR | Threat_markers_plus_path_projection | Haptic_Feedback |
| person.leysan_khakimova | Leysan | Лейсан | | person | legal_regulator | license_revocation,blocking_transactions,admissibility_filter | use_physical_force,lie_on_record | liability_contract | stare_down_corporates,fine_print_fast_read,sanitize_team_actions | | osa_legal | true | [I,V] | | | |
| person.damir_nikitin | Damir | Дамир | | person | junior_field | map_vs_territory_check,visual_forensics,sensor_blind_spot_spotting | rely_solely_on_database,ignore_physical_evidence | render_artifacts | manual_scene_exam,correct_assumptions,physical_tracking | | osa_field | true | [I,V] | | | |

### System Agents (part of optimization contour, NOT antagonists)

| entity_id | token | display_name_ru | nickname_ru | entity_kind | role | leverage | cannot | optics | scene_types | age_range_years | affiliation | not_antagonist | act_range | hud_style | hud_visuals | hud_sensory |
| -- | -- | -- | -- | -- | -- | -- | -- | -- | -- | -- | -- | -- | -- | -- | -- | -- |
| person.oskar_postoronny | Oskar | Оскар | | system_agent | liaison_from_operator | corporate_gatekeeping,access_delays,budget_withdrawal_threat | command_osa_directly,hands_on_actions | brand_risk | deny_access_politely,nda_pressure,friction_point | | operator_corp | true | [II,V] | | | |
| person.ilya_vorontsov | Ilya | Илья | | system_agent | kpi_proxy_efficiency_director | modify_success_metrics,retro_fines,audit_freeze | be_bribed,show_anger | coefficient_vision | announce_cuts_mid_op,calm_interrogation,efficiency_pressure | | city_administration | true | [I,IV] | | | |
| person.yunna_tagirova | Yunna | Юнна | | person | bio_hazard_containment_specialist | quarantine_authority,biometrics_access,triage_priority | care_about_politics,hesitate_to_amputate,provide_emotional_comfort | necrosis_prediction | biohazard_entry,cold_medical_verdict,mechanical_stabilization | [39,42] | federal_epidemiology_biosecurity_center | true | [I,III] | | | |

### External

| entity_id | token | display_name_ru | nickname_ru | entity_kind | role | leverage | cannot | optics | scene_types | age_range_years | affiliation | not_antagonist | act_range | hud_style | hud_visuals | hud_sensory |
| -- | -- | -- | -- | -- | -- | -- | -- | -- | -- | -- | -- | -- | -- | -- | -- | -- |
| external.informant | Informant | Информатор | | external | informant | | | | | | | | [II,IV] | | | |

## USAGE / RESOLUTION

[DECISION][CASTREG-300] Any consumer validating scene tags MUST validate `display_name_ru` values against this table; ELSE FAIL.
[DECISION][CASTREG-310] Conflict resolution MUST follow SPEC-PRIORITY-RESOLUTION-2215-0001; ELSE FAIL.
[DECISION][CASTREG-320] `nickname_ru` (e.g., «Лёва» for Лев) is allowed ONLY in dialogue text, never in tags/metadata.

## OUTPUT CONTRACT

```yaml
doc_id: CANON-CASTREGISTRY-GLOBAL-2215-0001
role_type: STATE
export:
  cast_registry_rows:
    rows_source: CONTENT
    primary_key: entity_id
    participant_key: display_name_ru
    columns:
      - entity_id
      - token
      - display_name_ru
      - nickname_ru
      - entity_kind
      - role
      - leverage
      - cannot
      - optics
      - scene_types
      - age_range_years
      - affiliation
      - not_antagonist
      - act_range
      - hud_style
      - hud_visuals
      - hud_sensory
```

## FORBIDDEN

[FORBIDDEN][CASTREG-900] Introducing rules or constraints; this document is STATE registry only.
[FORBIDDEN][CASTREG-910] Implicit cast membership outside the CONTENT table.
[FORBIDDEN][CASTREG-920] Narrative prose or "why" explanations.
[FORBIDDEN][CASTREG-930] Labeling system_agent entities as "antagonist" in any field.
[FORBIDDEN][CASTREG-940] Using token instead of display_name_ru in tags.participants.

## NON-NORMATIVE

```text
Changes from v0.1.0:
- Added display_name_ru and nickname_ru columns (Russian names for prose)
- Added act_range column (which acts character appears in)
- Changed Oskar and Ilya entity_kind from person to system_agent
- Yunna confirmed as person (OSA-adjacent specialist), not MedSpec_external
- nickname_ru "Лёва" allowed for Лев in dialogue only
- All participants in PLAN-STORY and SCENE-ACTs now use display_name_ru
```