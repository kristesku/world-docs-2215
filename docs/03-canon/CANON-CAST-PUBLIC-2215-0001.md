---
id: CANON-CAST-PUBLIC-2215-0001
title: >
  Canon Public Figures — VIPs, Executives, and Media Faces (2215)
class: canon
status: fixed
version: 1.1.0
inputs:
  - CANON-ORGS-2215-0001
depends_on:
  - SSOT-DOC-STYLE-2215-0001
  - SPEC-PRIORITY-RESOLUTION-2215-0001
scope: >
  STATE-реестр публичных фигур: руководители, медиа-лица и подписи власти.
  Используется как справочник для сцен (внешние лица институций).
---

## LLM-INTENT

ROLE_TYPE: STATE
SCOPE: registry of high-profile public figures used by OSA and institutions
INPUTS:
  - CANON-ORGS-2215-0001
OUTPUTS:
  - vip_profiles
FORBIDDEN:
  - comic_book_villains
  - secret_identities_as_defaults
  - unrelated_celebrities

---

## DEFINITIONS

[FACT][VIP-DEF-010] signature_authority = персона, чья цифровая подпись валидирует изменения федерального или критического уровня.
[FACT][VIP-DEF-011] media_avatar = публичный образ, используемый для коммуникации институции.
[FACT][VIP-DEF-012] vip_profile = {vip_id, name, org_ref, public_role, signature_authority, presence_mode, function_tags, plot_relation_tags}.

---

## INVARIANTS

[DECISION][VIP-INV-010] VIP presence_mode MUST be mediated by channels {holo_link, decrees, proxies} as default.
[DECISION][VIP-INV-011] VIP motivation MUST be institution_preservation, not pure_malice.

---

## CONTENT

[STATE][VIP-KAM-010] vip.vip_kamsky.vip_id = VIP-KAMSKY.
[STATE][VIP-KAM-011] vip.vip_kamsky.name = Viktor_Kamsky.
[STATE][VIP-KAM-012] vip.vip_kamsky.public_role = ceo_rosenergoatom_ix.
[STATE][VIP-KAM-013] vip.vip_kamsky.org_ref = CANON-ORGS-2215-0001.
[STATE][VIP-KAM-014] vip.vip_kamsky.signature_authority = federal_critical_changes.
[STATE][VIP-KAM-015] vip.vip_kamsky.presence_mode = {holo_link, decrees, office_proxies}.
[STATE][VIP-KAM-016] vip.vip_kamsky.function_tags = {energy_sovereignty, institutional_ceiling}.
[STATE][VIP-KAM-017] vip.vip_kamsky.plot_relation_tags = {untouchable_directly, bargaining_only}.

[STATE][VIP-STO-020] vip.vip_stoica.vip_id = VIP-STOICA.
[STATE][VIP-STO-021] vip.vip_stoica.name = Director_Stoica.
[STATE][VIP-STO-022] vip.vip_stoica.public_role = head_gosplan_algorithmica.
[STATE][VIP-STO-023] vip.vip_stoica.org_ref = CANON-ORGS-2215-0001.
[STATE][VIP-STO-024] vip.vip_stoica.signature_authority = quota_formula_validation.
[STATE][VIP-STO-025] vip.vip_stoica.presence_mode = {holo_link, decrees, algorithmic_notices}.
[STATE][VIP-STO-026] vip.vip_stoica.function_tags = {quota_source, technocratic_gate}.
[STATE][VIP-STO-027] vip.vip_stoica.plot_relation_tags = {remote_pressure, policy_ceiling}.

[STATE][VIP-VOL-030] vip.vip_volkova.vip_id = VIP-VOLKOVA.
[STATE][VIP-VOL-031] vip.vip_volkova.name = Inga_Volkova.
[STATE][VIP-VOL-032] vip.vip_volkova.public_role = ceo_translogist_kama.
[STATE][VIP-VOL-033] vip.vip_volkova.org_ref = CANON-ORGS-2215-0001.
[STATE][VIP-VOL-034] vip.vip_volkova.signature_authority = operator_level_orders.
[STATE][VIP-VOL-035] vip.vip_volkova.presence_mode = {direct_calls, proxy_lawyers, site_controllers}.
[STATE][VIP-VOL-036] vip.vip_volkova.function_tags = {logistics_pressure, kpi_survival}.
[STATE][VIP-VOL-037] vip.vip_volkova.plot_relation_tags = {act_i_antagonist_candidate, crisis_manager}.

[STATE][VIP-RAZ-040] vip.vip_razin.vip_id = VIP-RAZIN.
[STATE][VIP-RAZ-041] vip.vip_razin.name = Ilya_Razin.
[STATE][VIP-RAZ-042] vip.vip_razin.public_role = head_city_admin_chelny.
[STATE][VIP-RAZ-043] vip.vip_razin.org_ref = CANON-ORGS-2215-0001.
[STATE][VIP-RAZ-044] vip.vip_razin.signature_authority = municipal_formal_signatures.
[STATE][VIP-RAZ-045] vip.vip_razin.presence_mode = {decrees, press_briefings, controlled_meetings}.
[STATE][VIP-RAZ-046] vip.vip_razin.function_tags = {scapegoat_interface, liability_sink}.
[STATE][VIP-RAZ-047] vip.vip_razin.plot_relation_tags = {reluctant_ally_candidate, responsibility_without_power}.

[STATE][VIP-SOL-050] vip.vip_sol.vip_id = VIP-SOL.
[STATE][VIP-SOL-051] vip.vip_sol.name = Valery_Sol.
[STATE][VIP-SOL-052] vip.vip_sol.public_role = infosfera_public_anchor.
[STATE][VIP-SOL-053] vip.vip_sol.org_ref = CANON-ORGS-2215-0001.
[STATE][VIP-SOL-054] vip.vip_sol.signature_authority = none.
[STATE][VIP-SOL-055] vip.vip_sol.presence_mode = {broadcast_streams, emergency_overlays}.
[STATE][VIP-SOL-056] vip.vip_sol.function_tags = {panic_suppression, public_narrative_interface}.
[STATE][VIP-SOL-057] vip.vip_sol.plot_relation_tags = {media_face, crisis_broadcast}.

---

## USAGE / RESOLUTION

[DECISION][VIP-USE-010] Документ используется как реестр: сцены MAY ссылаться на vip_id и function_tags.
[DECISION][VIP-USE-011] Conflict resolution MUST follow SPEC-PRIORITY-RESOLUTION-2215-0001.

---

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-CAST-PUBLIC-2215-0001
role_type: STATE
export:
  vip_profiles:
    - vip_id: VIP-KAMSKY
      name: Viktor_Kamsky
      public_role: ceo_rosenergoatom_ix
      signature_authority: federal_critical_changes
      presence_mode: [holo_link, decrees, office_proxies]
      function_tags: [energy_sovereignty, institutional_ceiling]
      plot_relation_tags: [untouchable_directly, bargaining_only]
    - vip_id: VIP-STOICA
      name: Director_Stoica
      public_role: head_gosplan_algorithmica
      signature_authority: quota_formula_validation
      presence_mode: [holo_link, decrees, algorithmic_notices]
      function_tags: [quota_source, technocratic_gate]
      plot_relation_tags: [remote_pressure, policy_ceiling]
    - vip_id: VIP-VOLKOVA
      name: Inga_Volkova
      public_role: ceo_translogist_kama
      signature_authority: operator_level_orders
      presence_mode: [direct_calls, proxy_lawyers, site_controllers]
      function_tags: [logistics_pressure, kpi_survival]
      plot_relation_tags: [act_i_antagonist_candidate, crisis_manager]
    - vip_id: VIP-RAZIN
      name: Ilya_Razin
      public_role: head_city_admin_chelny
      signature_authority: municipal_formal_signatures
      presence_mode: [decrees, press_briefings, controlled_meetings]
      function_tags: [scapegoat_interface, liability_sink]
      plot_relation_tags: [reluctant_ally_candidate, responsibility_without_power]
    - vip_id: VIP-SOL
      name: Valery_Sol
      public_role: infosfera_public_anchor
      signature_authority: none
      presence_mode: [broadcast_streams, emergency_overlays]
      function_tags: [panic_suppression, public_narrative_interface]
      plot_relation_tags: [media_face, crisis_broadcast]
~~~

---

## FORBIDDEN

[FORBIDDEN][VIP-FBD-010] Depicting VIPs as comic villains acting from pure malice.
[FORBIDDEN][VIP-FBD-011] Giving municipal head unlimited power without procedural basis.
[FORBIDDEN][VIP-FBD-012] Introducing secret identities as default explanation without artifacts and procedure.

---

## NON-NORMATIVE

(Empty by design)
