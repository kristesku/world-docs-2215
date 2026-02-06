---
id: CANON-CAST-VOICE-2215-0001
title: >
  Canon Cast Voice — Speech Patterns (2215)
class: canon
status: fixed
version: 1.3.0
inputs:
  - CANON-CAST-0001
  - BASELINE-PSYCH-2215-0001
depends_on:
  - SSOT-DOC-STYLE-2215-0001
scope: >
  Реестр речевых паттернов и синтаксических ограничений для команды ОСА.
  Определяет структуру речи, лексические маркеры и тональность.
---

## LLM-INTENT

ROLE_TYPE: STATE
SCOPE: linguistic profiles for protagonists defined as state parameters.
INPUTS: [CANON-CAST-0001]
OUTPUTS: [speech_profile_state]
FORBIDDEN: [literary_descriptions, non_atomic_values, emotional_reasoning]

## DEFINITIONS

[FACT][VOICE-DEF-010] Liability-Speak = синтаксис, минимизирующий юридическую ответственность говорящего.
[FACT][VOICE-DEF-011] Command-Brief = императивный синтаксис с опусканием вежливости.
[FACT][VOICE-DEF-012] Data-Stream = высокоскоростная подача фактов без пауз и интонаций.

## INVARIANTS

[DECISION][VOICE-INV-010] Operational dialogue MUST NOT exceed 3 sentences per turn.
[DECISION][VOICE-INV-011] Silence MUST be indicated as an active state `[ACTION: Silence]`.
[DECISION][VOICE-INV-012] Profanity IS allowed ONLY as a marker of loss of control.

## CONTENT

### 1. Miron (Tactical Lead)

[STATE][VOICE-MIR-010] miron.role_function = "Tactical Authority".
[STATE][VOICE-MIR-011] miron.tone = "Heavy, Tired, Absolute".
[STATE][VOICE-MIR-012] miron.syntax = "Imperative" (orders, not requests).
[STATE][VOICE-MIR-013] miron.markers = ["Отставить.", "Работай.", "В канале чисто?", "Под мою ответственность."].
[STATE][VOICE-MIR-014] miron.attitude_to_hq = "Protective_Wall".

### 2. Leysan (Legal Regulator)

[STATE][VOICE-LEY-020] leysan.role_function = "Admissibility Filter".
[STATE][VOICE-LEY-021] leysan.tone = "Polite, Quiet, Threatening".
[STATE][VOICE-LEY-022] leysan.syntax = "Conditional + Legal Tag" (IF action THEN violation).
[STATE][VOICE-LEY-023] leysan.markers = ["Это недопустимо.", "Протокол нарушен.", "Фиксирую отказ.", "Вы уверены?"].
[STATE][VOICE-LEY-024] leysan.weapon = "Silence".

### 3. Leva (Systems Analyst)

[STATE][VOICE-LEV-030] leva.role_function = "Interface".
[STATE][VOICE-LEV-031] leva.tone = "Monotone, High-speed".
[STATE][VOICE-LEV-032] leva.syntax = "Observation -> Deduction" (Subject often omitted).
[STATE][VOICE-LEV-033] leva.markers = ["Коррекция.", "Есть контакт.", "След обрывается.", "Это не баг."].
[STATE][VOICE-LEV-034] leva.quirk = "Depersonalization" (Uses 'Target' instead of Name).

### 4. Aidar (Field Operator)

[STATE][VOICE-AID-040] aidar.role_function = "Kinetic Interaction".
[STATE][VOICE-AID-041] aidar.tone = "Rough, Dismissive".
[STATE][VOICE-AID-042] aidar.syntax = "Telegraphic / Slang" (Verbs > Nouns).
[STATE][VOICE-AID-043] aidar.markers = ["Пусто.", "Взял.", "Сбрось.", "Тяжелый.", "В утиль?"].
[STATE][VOICE-AID-044] aidar.coping_mechanism = "Mockery of Protocol".

### 5. Damir (Rookie)

[STATE][VOICE-DAM-050] damir.role_function = "Moral Observer".
[STATE][VOICE-DAM-051] damir.tone = "Hesitant, Inquisitive".
[STATE][VOICE-DAM-052] damir.syntax = "Interrogative" (Questions authority/reality).
[STATE][VOICE-DAM-053] damir.markers = ["А это законно?", "Я не понимаю.", "Там люди.", "Мирон?"].

## USAGE / RESOLUTION

[DECISION][VOICE-USE-010] Dialogue conflict MUST stem from syntax clash (Law vs Data vs Force).
[DECISION][VOICE-USE-011] Leysan MUST NEVER shout.
[DECISION][VOICE-USE-012] Leva MUST NEVER express empathy for biological pain.

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-CAST-VOICE-2215-0001
role_type: STATE
export:
  - metric: miron.syntax
    owner_domain: NARRATIVE
    values:
      core: Imperative
      unit: none
  - metric: leysan.tone
    owner_domain: NARRATIVE
    values:
      core: Polite_Quiet_Threatening
      unit: none
~~~

## FORBIDDEN

[FORBIDDEN][VOICE-FBD-010] Characters explaining emotions ("I am sad").
[FORBIDDEN][VOICE-FBD-011] Using 20th-century idioms.
[FORBIDDEN][VOICE-FBD-012] Whedon-esque banter during combat.