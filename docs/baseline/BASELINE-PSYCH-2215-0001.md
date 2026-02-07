---
id: BASELINE-PSYCH-2215-0001
title: >
  Psychological Baseline — 2215 (Density, Transactionalism, Worldview)
class: baseline
status: fixed
version: 1.3.0
inputs:
  - BASELINE-SOCIAL-CIVIC-2215-0001
  - SSOT-URBANISM-A-2215-0007
depends_on:
scope: >
  Психологический портрет и базовое мировоззрение жителя LEVEL-MID.
  Включает отношение к труду, власти, технологиям и среде.
---

## LLM-INTENT

ROLE_TYPE: STATE
SCOPE: define default psychological traits and attitudes.
INPUTS: [BASELINE-SOCIAL-CIVIC-2215-0001, SSOT-URBANISM-A-2215-0007]
OUTPUTS: [behavioral_norms, world_attitudes, neuroses]
FORBIDDEN: [sterile_utopia, robotic_emotionlessness, romantic_nature_worship]

## DEFINITIONS

[FACT][PSY-DEF-010] **Density Fatigue** = хроническая усталость от постоянного присутствия людей.
[FACT][PSY-DEF-011] **Transactionalism** = привычка оценивать действия через "затраты/выгода".
[FACT][PSY-DEF-012] **Algorithmic Fatalism** = вера в то, что Система всегда выигрывает математически.

## INVARIANTS

[DECISION][PSY-INV-010] Citizens are "Armor-Clad": headphones/glasses create a personal bubble.
[DECISION][PSY-INV-011] Silence is the ultimate luxury; Noise is the default state.
[DECISION][PSY-INV-012] Nostalgia is directed at the "Pre-Algorithm Era" (messy but free).

## CONTENT

### 1. Public Behavior (The Commuter Shell)

[STATE][PSY-BEH-010] public_mask = "Thousand-Yard Stare" (looking through people).
[STATE][PSY-BEH-011] conflict_response = "Ignore/Evade" (confrontation is too expensive).
[STATE][PSY-BEH-012] personal_space = "Compressible" (tolerate crowding, expand when able).
[STATE][PSY-BEH-013] politeness = "Efficient" (nodding, moving fast, not blocking flow).

### 2. Resource Neurosis (The Accountant Within)

[STATE][PSY-ECO-020] dominant_stress = "Unplanned Debt" (accidentally breaking infrastructure).
[STATE][PSY-ECO-021] reflex = "Check Balance" before any transaction.
[STATE][PSY-ECO-022] waste_reaction = Visceral irritation (wasting water feels like bleeding).

### 3. Intimacy & Trust

[STATE][PSY-SOC-030] trust_circle = "The Unit" (Family/Roommates vs The World).
[STATE][PSY-SOC-031] physical_touch = High within Unit, Zero outside.
[STATE][PSY-SOC-032] strangers = "Obstacles" or "Data Points".

### 4. Specific Pathologies

[STATE][PSY-PATH-040] syndrome="Box Claustrophobia" (panic when ventilation stops).
[STATE][PSY-PATH-041] syndrome="Algorithmic Paranoia" (believing bad luck is a 'shadow ban').
[STATE][PSY-PATH-042] syndrome="Touch Aggression" (snapping when bumped too often).

### 5. Coping Mechanisms

[STATE][PSY-COPE-050] mech_sensory = "Active Noise Cancellation" (mandatory wear).
[STATE][PSY-COPE-051] mech_chemical = "Stims/Sedatives" (functional use for shifts).
[STATE][PSY-COPE-052] mech_control = "Micro-customization of personal corner".

### 6. Core Attitudes (Worldview)

#### Work & Corporations
[STATE][PSY-ATT-060] work_view = "License to Exist". Job is not a career, it's debt service.
[STATE][PSY-ATT-061] corp_trust = "Zero". Corps are predators, but necessary providers.
[STATE][PSY-ATT-062] automation_fear = "High". Every update might optimize your role away.

#### The State & Governance
[STATE][PSY-ATT-070] state_view = "The Wall". It protects from the Outside, but it is cold and hard.
[STATE][PSY-ATT-071] justice_view = "Arithmetic". You don't ask for mercy, you ask for a recount.
[STATE][PSY-ATT-072] politics = "Irrelevant". Algorithms decide, humans just sign.

#### City & Nature
[STATE][PSY-ATT-080] city_view = "Life Support Suit". Outside is death/chaos; City is survival.
[STATE][PSY-ATT-081] nature_view = "Abstract Luxury". Real wood/grass is for the rich.
[STATE][PSY-ATT-082] weather_view = "System Failure". Rain/Snow means the dome/drainage is struggling.

#### Technology & Art
[STATE][PSY-ATT-090] tech_view = "Invisible Utility". Not magic, just plumbing. Only noticed when broken.
[STATE][PSY-ATT-091] progress_view = "Skeptical". 'New' usually means 'More Efficient for Them, Harder for Me'.
[STATE][PSY-ATT-092] art_view = "The Human Signal". Valued because it's inefficient/messy (e.g., analog music).

## USAGE / RESOLUTION

[DECISION][PSY-USE-010] Characters are cynical but functional survivors.
[DECISION][PSY-USE-011] "Hope" is usually about stability, not revolution.

## OUTPUT CONTRACT

~~~yaml
doc_id: BASELINE-PSYCH-2215-0001
role_type: STATE
export:
  - metric: worldview.work
    owner_domain: PSYCH
    values:
      core: License to Exist
~~~

## FORBIDDEN

[FORBIDDEN][PSY-FBD-010] Romanticizing nature as something "cute" (it's dangerous/expensive).
[FORBIDDEN][PSY-FBD-011] Characters trusting corporations blindly.
[FORBIDDEN][PSY-FBD-012] Viewing technology with wonder (it's mundane).