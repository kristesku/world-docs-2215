---
id: CANON-ORGS-GLOBAL-2215-0001
title: >
  Canon Organizations — Factions, Monopolies, and Structural Conflicts (2215)
class: canon
status: fixed
version: 1.2.0
inputs:
  - SSOT-ECONOMY-A-2215-0003
depends_on:
scope: >
  Реестр институциональных игроков: монополии, подрядчики, теневые структуры.
  Фиксирует внутренние фракции и структурные конфликты для сюжета.
---

## LLM-INTENT

ROLE_TYPE: STATE
SCOPE: registry of organizational entities, factions, and hidden agendas.
INPUTS: [SSOT-ECONOMY-A-2215-0003]
OUTPUTS: [organization_profiles, faction_map]
FORBIDDEN: [monolithic_entities, simplistic_villains, narrative_prose]

## DEFINITIONS

[FACT][ORG-DEF-010] Institutional Friction = конфликт департаментов одной организации с взаимоисключающими KPI.
[FACT][ORG-DEF-011] Proxy Actor = частная компания, действующая в интересах фракции госструктуры для обхода законов.

## INVARIANTS

[DECISION][ORG-INV-010] Каждая монополия содержит минимум две конфликтующие фракции.
[DECISION][ORG-INV-011] Организации действуют рационально в рамках своих KPI, а не из "злобы".

## CONTENT

### 1. The Monopolies (The Heavyweights)

[STATE][ORG-010] id=ORG-ROSE; name="RosEnergoAtom-IX"; domain="Energy"; role="Grid Monopoly".
[STATE][ORG-011] ORG-ROSE.vibe = "Technocratic feudalism".
[STATE][ORG-012] ORG-ROSE.faction_A = "The Core Guard (Engineers) — focus: stability, safety".
[STATE][ORG-013] ORG-ROSE.faction_B = "Export Directorate (Managers) — focus: profit, mining".
[STATE][ORG-014] ORG-ROSE.conflict = "Engineers leak data to FSSU to sabotage Managers".

[STATE][ORG-020] id=ORG-GOSP; name="GosPlan-Algorithmica"; domain="Planning"; role="KPI Setter".
[STATE][ORG-021] ORG-GOSP.vibe = "Inhuman mathematical absolute".
[STATE][ORG-022] ORG-GOSP.faction_A = "Purists — focus: absolute automation, infallibility".
[STATE][ORG-023] ORG-GOSP.faction_B = "Adjusters — focus: manual coefficients, hidden corruption".
[STATE][ORG-024] ORG-GOSP.relevance = "Glitch is caused by Faction A code ignoring Faction B patches".

[STATE][ORG-030] id=ORG-VODO; name="Vodocanal-Federal"; domain="Water/Biomass"; role="Circulation".
[STATE][ORG-031] ORG-VODO.vibe = "Silent, pervasive, biological".
[STATE][ORG-032] ORG-VODO.hidden_agenda = "Bio-data blackmail via sewage monitoring".

### 2. The Contractors (The Proxies)

[STATE][ORG-040] id=ORG-TLK; name="TransLogist-Kama"; domain="Logistics"; role="Last Mile Operator".
[STATE][ORG-041] ORG-TLK.status = "Squeezed between GosPlan quotas and physics".
[STATE][ORG-042] ORG-TLK.strategy = "Shadow Optimization (cutting corners to survive)".
[STATE][ORG-043] ORG-TLK.affiliation = "Proxy for RosEnergoAtom Export Directorate".

[STATE][ORG-050] id=ORG-SCM; name="StroyComposite-M"; domain="Materials"; role="Supplier".
[STATE][ORG-051] ORG-SCM.secret = "Recycles toxic exclusion-zone waste into building mats".

[STATE][ORG-055] id=ORG-BIO; name="BiFSSUfe-Systems"; domain="Health/Sensors"; role="Operator".
[STATE][ORG-056] ORG-BIO.vibe = "Clinical cynicism".

### 3. The Oversight & Intelligence

[STATE][ORG-060] id=ORG-FSSU; name="FSSU (Dept of Situation Analysis)"; role="Protagonist".
[STATE][ORG-061] ORG-FSSU.weakness = "Lack of direct jurisdiction over Monopolies".
[STATE][ORG-062] ORG-FSSU.tactics = "Information Warfare / Public Cost escalation".

[STATE][ORG-070] id=ORG-ARB; name="The Arbitrage"; domain="Justice"; role="AI Judge".
[STATE][ORG-071] ORG-ARB.characteristic = "Black Box decision weights".
[STATE][ORG-072] ORG-ARB.fear_factor = "Calculates humanity as non-profitable".

[STATE][ORG-080] id=ORG-INFO; name="InfoSfera-Public"; domain="Media"; role="Reality Filter".
[STATE][ORG-081] ORG-INFO.function = "Turns catastrophes into planned drills".

### 4. Shadow Actors (Act II+ Leverage)

[STATE][ORG-090] id=ORG-KAZ; name="Kazan-Silicon Exterritory"; domain="R&D"; role="Legal Void".
[STATE][ORG-091] ORG-KAZ.status = "Sovereign state inside the state".

[STATE][ORG-100] id=ORG-SOC; name="SocialCapital-Bank"; domain="Finance"; role="Debt Holder".
[STATE][ORG-101] ORG-SOC.power = "Instant Insolvency declaration (Citizenship annulment)".

## USAGE / RESOLUTION

[DECISION][ORG-USE-010] Conflicts MUST arise from inter-faction friction.
[DECISION][ORG-USE-011] Antagonists are usually Dept Heads fulfilling conflicting KPIs, not criminals.

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-ORGS-GLOBAL-2215-0001
role_type: STATE
export:
  - metric: organization.profile
    owner_domain: GOVERNANCE
    values:
      id: ORG-010
      name: RosEnergoAtom-IX
      factions: [Core_Guard, Export_Directorate]
~~~

## FORBIDDEN

[FORBIDDEN][ORG-FBD-010] Portraying Monopolies as monolithic (everyone agrees).
[FORBIDDEN][ORG-FBD-011] Using generic names like "The Corporation".
[FORBIDDEN][ORG-FBD-012] Giving FSSU unlimited police powers.
~~~
