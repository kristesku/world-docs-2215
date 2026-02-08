---
id: CANON-CASTREGISTRY-GLOBAL-2215-0001
title: >
  Core Team (ОСА) — Cast Registry (STATE)
class: canon
status: draft
version: 0.1.0
prefix: CASTREG
doc_language: ru-RU
prose_language: ru-RU
inputs: []
depends_on:
  - SPEC-DOC-STYLE-2215-0001
  - SPEC-PRIORITY-RESOLUTION-2215-0001
scope: >
  Реестр состава ОСА как данных (STATE): сущности персонажей/внешних акторов,
  их role/leverage/cannot/optics/scene_types и маппинг токенов для сцен.
  Без правил использования и без художественного текста.
---

## LLM-INTENT

ROLE_TYPE: STATE
SCOPE: provide authoritative cast registry rows for OSA core team and externals
INPUTS: []
OUTPUTS: [cast_registry_rows]
FORBIDDEN: [rule_definition, prose, implicit_membership, new_metrics]

## DEFINITIONS

[FACT][CASTREG-010] `cast_row` = запись таблицы с полями {entity_id, token, entity_kind, role, leverage, cannot, optics, scene_types, age_range_years, affiliation, not_antagonist, hud_style, hud_visuals, hud_sensory}.
[FACT][CASTREG-020] `entity_id` = строковый id сущности, формат `person.<snake>` или `external.<snake>`.
[FACT][CASTREG-030] `token` = краткий токен участника сцены, формат `^[A-Z][A-Za-z0-9_]*$`.
[FACT][CASTREG-040] `entity_kind` ∈ {person, external}.
[FACT][CASTREG-050] `role` = строковый enum-токен формата `^[a-z0-9_]+$`.
[FACT][CASTREG-060] `leverage` = CSV-список токенов, separator=","; каждый токен matches `^[a-z0-9_]+$`.
[FACT][CASTREG-070] `cannot` = CSV-список токенов, separator=","; каждый токен matches `^[a-z0-9_]+$`.
[FACT][CASTREG-080] `optics` = токен формата `^[a-z0-9_]+$`.
[FACT][CASTREG-090] `scene_types` = CSV-список токенов, separator=","; каждый токен matches `^[a-z0-9_]+$`.
[FACT][CASTREG-100] `age_range_years` = строка формата `[min,max]` где min/max ∈ Z; пустая строка означает “не задано”.
[FACT][CASTREG-110] `affiliation` = токен формата `^[a-z0-9_]+$`; пустая строка означает “не задано”.
[FACT][CASTREG-120] `not_antagonist` ∈ {true,false,""}; пустая строка означает “не задано”.
[FACT][CASTREG-130] `hud_*` = строковые поля; пустая строка означает “не задано”.

## INVARIANTS

[DECISION][CASTREG-200] PASS IFF `token` is unique across rows; ELSE FAIL.
[DECISION][CASTREG-210] PASS IFF `entity_id` is unique across rows; ELSE FAIL.
[DECISION][CASTREG-220] PASS IFF each `person` row has non-empty {role, leverage, cannot, optics, scene_types}; ELSE FAIL.
[DECISION][CASTREG-230] PASS IFF each `external` row has non-empty {role}; ELSE FAIL.
[DECISION][CASTREG-240] Consumers MUST treat CONTENT table as the only authoritative registry payload; ELSE FAIL.

## CONTENT

| entity_id | token | entity_kind | role | leverage | cannot | optics | scene_types | age_range_years | affiliation | not_antagonist | hud_style | hud_visuals | hud_sensory |
| -- | -- | -- | -- | -- | -- | -- | -- | -- | -- | -- | -- | -- | -- |
| person.rinat_akhmetzyanov | Rinat | person | regional_chief | license_manipulation,quota_trading,regulatory_loopholes,federal_escalation_gate | command_field_tactics,violate_audit_trace,show_emotion_to_subordinates | silence_equals_approval_noise_equals_error | strategic_triage,resource_bargaining,summoned_to_carpet | [48,55] |  | true |  |  |  |
| person.miron_karimov | Miron | person | field_operation_lead | priority_switching,tactical_pacing,grey_zone_ownership | panic,ignore_safety_protocol_without_logging | chaos_management | stabilize_team,operational_bargaining,absorb_pressure |  |  |  |  |  |  |
| person.lev_safonov | Lev | person | systems_analyst | log_deep_dive,pattern_recognition,bypass_ui_limitations | physical_fight,perceive_social_subtext | wireframe_reality | deduction_spree,server_room_archaeology,needle_finding |  |  |  | Terminal_Monochrome | Wireframe_overlays_plus_hex_logs_no_artistic_rendering | Audio_Damping |
| person.aidar_bulatov | Aidar | person | field_operator | area_denial,physical_breach,equipment_load_bearing | engage_in_politics,act_without_orders_in_civilian_zone | vectors_and_cover | checking_corners,presence_intimidation,breaching |  |  |  | Tactical_AR | Threat_markers_plus_path_projection_lines | Haptic_Feedback |
| person.leysan_khakimova | Leysan | person | legal_regulator | license_revocation,blocking_transactions,admissibility_filter | use_physical_force,lie_on_record | liability_contract | stare_down_corporates,fine_print_fast_read,sanitize_team_actions |  |  |  |  |  |  |
| person.damir_nikitin | Damir | person | junior_field | map_vs_territory_check,visual_forensics,sensor_blind_spot_spotting | rely_solely_on_database,ignore_physical_evidence | render_artifacts | manual_scene_exam,correct_assumptions,physical_tracking |  |  |  |  |  |  |
| person.oskar_postoronny | Oskar | person | liaison_from_operator | corporate_gatekeeping,access_delays,budget_withdrawal_threat | command_osa_directly,hands_on_actions | brand_risk | deny_access_politely,nda_pressure,friction_point |  |  |  |  |  |  |
| person.ilya_vorontsov | Ilya | person | kpi_proxy_efficiency_director | modify_success_metrics,retro_fines,audit_freeze | be_bribed,show_anger | coefficient_vision | announce_cuts_mid_op,calm_interrogation,efficiency_pressure |  |  |  |  |  |  |
| person.yunna_tagirova | Yunna | person | bio_hazard_containment_specialist | quarantine_authority,biometrics_access,triage_priority | care_about_politics,hesitate_to_amputate,provide_emotional_comfort | necrosis_prediction | biohazard_entry,cold_medical_verdict,mechanical_stabilization | [39,42] | federal_epidemiology_biosecurity_center |  |  |  |  |
| external.informant | Informant_external | external | informant |  |  |  |  |  |  |  |  |  |  |

## USAGE / RESOLUTION

[DECISION][CASTREG-300] Any consumer validating scene tags MUST validate `token` values against this table; ELSE FAIL.
[DECISION][CASTREG-310] Conflict resolution MUST follow SPEC-PRIORITY-RESOLUTION-2215-0001; ELSE FAIL.

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-CASTREGISTRY-GLOBAL-2215-0001
role_type: STATE
export:
  cast_registry_rows:
    rows_source: CONTENT
    primary_key: entity_id
    columns:
      - entity_id
      - token
      - entity_kind
      - role
      - leverage
      - cannot
      - optics
      - scene_types
      - age_range_years
      - affiliation
      - not_antagonist
      - hud_style
      - hud_visuals
      - hud_sensory
    column_types:
      entity_id: text
      token: text
      entity_kind: enum
      role: enum
      leverage: csv_tokens
      cannot: csv_tokens
      optics: enum
      scene_types: csv_tokens
      age_range_years: range_text
      affiliation: enum_or_empty
      not_antagonist: bool_or_empty
      hud_style: text
      hud_visuals: text
      hud_sensory: text
    column_encoding:
      csv_tokens:
        separator: ","
        empty: ""
      enum_or_empty:
        empty: ""
      bool_or_empty:
        empty: ""
~~~

## FORBIDDEN

[FORBIDDEN][CASTREG-900] Introducing rules or constraints; this document is STATE registry only.
[FORBIDDEN][CASTREG-910] Implicit cast membership outside the CONTENT table.
[FORBIDDEN][CASTREG-920] Narrative prose or “why” explanations.

## NON-NORMATIVE

(empty)
