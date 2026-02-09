---
id: BASELINE-PSYCH-2215-0001
title: >
  Psychological Baseline — 2215 (Density, Transactionalism, Worldview)
class: baseline
status: fixed
version: 1.3.0
prefix: PSY
doc_language: en-US
prose_language: ru-RU
inputs:
  - BASELINE-SOCIAL-2215-0001
  - SSOT-URBANISM-A-2215-0007
depends_on: []
scope: >
  Психологический baseline жителя LEVEL-MID. Только состояния.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: define default psychological traits and attitudes
INPUTS: [BASELINE-SOCIAL-2215-0001, SSOT-URBANISM-A-2215-0007]
OUTPUTS: [behavioral_norms, world_attitudes, neuroses]
FORBIDDEN: []

## DEFINITIONS

[FACT][PSY-010] Density_Fatigue = хроническая усталость от высокой плотности людей.
[FACT][PSY-020] Transactionalism = оценка действий через затраты и выгоду.
[FACT][PSY-030] Algorithmic_Fatalism = вера в математическое превосходство системы.

## INVARIANTS

[DECISION][PSY-040] Personal_bubble_devices MUST be common.
[DECISION][PSY-050] Noise MUST be default.
[DECISION][PSY-060] Silence MUST be perceived_as_luxury.

## CONTENT

[STATE][PSY-100] public_mask = THOUSAND_YARD_STARE.
[STATE][PSY-110] conflict_response = IGNORE_OR_EVADE.
[STATE][PSY-120] personal_space = COMPRESSIBLE.
[STATE][PSY-130] politeness = EFFICIENT_MINIMAL.

[STATE][PSY-140] dominant_stress = UNPLANNED_DEBT.
[STATE][PSY-150] reflex_pre_transaction = CHECK_BALANCE.
[STATE][PSY-160] waste_reaction = IRRITATION.

[STATE][PSY-170] trust_circle = UNIT_ONLY.
[STATE][PSY-180] physical_touch_outside_unit = ZERO.
[STATE][PSY-190] strangers = OBSTACLES_OR_DATA_POINTS.

[STATE][PSY-200] syndrome_box_claustrophobia = PRESENT.
[STATE][PSY-210] syndrome_algorithmic_paranoia = PRESENT.
[STATE][PSY-220] syndrome_touch_aggression = PRESENT.

[STATE][PSY-230] mech_sensory = ACTIVE_NOISE_CANCELLATION.
[STATE][PSY-240] mech_chemical = FUNCTIONAL_STIMS.
[STATE][PSY-250] mech_control = MICRO_CUSTOMIZATION.

[STATE][PSY-260] work_view = LICENSE_TO_EXIST.
[STATE][PSY-270] corp_trust = ZERO.
[STATE][PSY-280] automation_fear = HIGH.

[STATE][PSY-290] state_view = PROTECTIVE_BUT_COLD.
[STATE][PSY-300] justice_view = ARITHMETIC.
[STATE][PSY-310] politics_interest = LOW.

[STATE][PSY-320] city_view = LIFE_SUPPORT_SYSTEM.
[STATE][PSY-330] nature_view = LUXURY_GOOD.
[STATE][PSY-340] weather_view = INFRASTRUCTURE_FAILURE_SIGNAL.

[STATE][PSY-350] tech_view = INVISIBLE_UTILITY.
[STATE][PSY-360] progress_view = SKEPTICAL.
[STATE][PSY-370] art_view = HUMAN_SIGNAL.

## USAGE / RESOLUTION

[DECISION][PSY-400] Characters MUST default_to cynical_functional_survivor_profile.

## OUTPUT CONTRACT

~~~yaml
doc_id: BASELINE-PSYCH-2215-0001
role_type: RULE
export:
  - metric: worldview.work_view
    owner_domain: PSYCH
    values:
      core: LICENSE_TO_EXIST
    unit: none
~~~

## FORBIDDEN

[FORBIDDEN][PSY-900] Romanticized_nature_defaults.
[FORBIDDEN][PSY-910] Blind_corporate_trust.
[FORBIDDEN][PSY-920] Technology_as_wonder.

## NON-NORMATIVE

(empty)
