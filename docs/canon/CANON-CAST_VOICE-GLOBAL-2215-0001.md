---
id: CANON-CAST_VOICE-GLOBAL-2215-0001
title: >
  Canon Cast Voice — Speech Patterns (2215)
class: canon
status: fixed
version: 2.0.0
doc_language: en
prose_language: ru-RU
inputs:
  - CANON-CAST-GLOBAL-2215-0001
  - BASELINE-PSYCH-2215-0001
depends_on:
  - SPEC-DOC_STYLE-2215-0001
scope: >
  Реестр речевых паттернов и синтаксических ограничений для команды ФССУ
  и системных агентов. Определяет структуру речи, лексические маркеры и тональность.
  Все имена соответствуют CANON-CASTREGISTRY display_name_ru.
---

## LLM-INTENT

ROLE_TYPE: STATE
SCOPE: linguistic profiles for protagonists and system agents defined as state parameters.
INPUTS: [CANON-CAST-GLOBAL-2215-0001]
OUTPUTS: [speech_profile_state]
FORBIDDEN: [literary_descriptions, non_atomic_values, emotional_reasoning]

## DEFINITIONS

[FACT][VOICE-DEF-010] Liability-Speak = синтаксис, минимизирующий юридическую ответственность говорящего.
[FACT][VOICE-DEF-011] Command-Brief = императивный синтаксис с опусканием вежливости.
[FACT][VOICE-DEF-012] Data-Stream = высокоскоростная подача фактов без пауз и интонаций.
[FACT][VOICE-DEF-013] Coefficient-Speak = речь через метрики и показатели, эмоции заменены числами.

## INVARIANTS

[DECISION][VOICE-INV-010] Operational dialogue MUST NOT exceed 3 sentences per turn.
[DECISION][VOICE-INV-011] Silence MUST be indicated as an active state `[ACTION: Silence]`.
[DECISION][VOICE-INV-012] Profanity IS allowed ONLY as a marker of loss of control.
[DECISION][VOICE-INV-013] All section headers MUST use display_name_ru from CASTREGISTRY.

## CONTENT

### 1. Мирон (field_operation_lead)

[STATE][VOICE-MIR-010] miron.role_function = "Tactical Authority".
[STATE][VOICE-MIR-011] miron.tone = "Heavy, Tired, Absolute".
[STATE][VOICE-MIR-012] miron.syntax = "Imperative" (orders, not requests).
[STATE][VOICE-MIR-013] miron.markers = ["Отставить.", "Работай.", "В канале чисто?", "Под мою ответственность."].
[STATE][VOICE-MIR-014] miron.attitude_to_hq = "Protective_Wall".

### 2. Лейсан (legal_regulator)

[STATE][VOICE-LEY-020] leysan.role_function = "Admissibility Filter".
[STATE][VOICE-LEY-021] leysan.tone = "Polite, Quiet, Threatening".
[STATE][VOICE-LEY-022] leysan.syntax = "Conditional + Legal Tag" (IF action THEN violation).
[STATE][VOICE-LEY-023] leysan.markers = ["Это недопустимо.", "Протокол нарушен.", "Фиксирую отказ.", "Вы уверены?"].
[STATE][VOICE-LEY-024] leysan.weapon = "Silence".

### 3. Лев (systems_analyst)

[STATE][VOICE-LEV-030] lev.role_function = "Interface".
[STATE][VOICE-LEV-031] lev.tone = "Monotone, High-speed".
[STATE][VOICE-LEV-032] lev.syntax = "Observation -> Deduction" (Subject often omitted).
[STATE][VOICE-LEV-033] lev.markers = ["Коррекция.", "Есть контакт.", "След обрывается.", "Это не баг."].
[STATE][VOICE-LEV-034] lev.quirk = "Depersonalization" (Uses 'Target' instead of Name).
[STATE][VOICE-LEV-035] lev.nickname_in_dialogue = "Лёва" (used by team members in casual address; never in tags/metadata).

### 4. Айдар (field_operator)

[STATE][VOICE-AID-040] aidar.role_function = "Kinetic Interaction".
[STATE][VOICE-AID-041] aidar.tone = "Rough, Dismissive".
[STATE][VOICE-AID-042] aidar.syntax = "Telegraphic / Slang" (Verbs > Nouns).
[STATE][VOICE-AID-043] aidar.markers = ["Пусто.", "Взял.", "Сбрось.", "Тяжелый.", "В утиль?"].
[STATE][VOICE-AID-044] aidar.coping_mechanism = "Mockery of Protocol".

### 5. Дамир (junior_field)

[STATE][VOICE-DAM-050] damir.role_function = "Moral Observer".
[STATE][VOICE-DAM-051] damir.tone = "Hesitant, Inquisitive".
[STATE][VOICE-DAM-052] damir.syntax = "Interrogative" (Questions authority/reality).
[STATE][VOICE-DAM-053] damir.markers = ["А это законно?", "Я не понимаю.", "Там люди.", "Мирон?"].

### 6. Ринат (regional_chief)

[STATE][VOICE-RIN-060] rinat.role_function = "Ceiling".
[STATE][VOICE-RIN-061] rinat.tone = "Measured, Political, Dry".
[STATE][VOICE-RIN-062] rinat.syntax = "Declarative + Implicit Threat" (states facts that constrain).
[STATE][VOICE-RIN-063] rinat.markers = ["Бюджет не резиновый.", "Согласовано.", "Не мой уровень.", "Я предупреждал."].
[STATE][VOICE-RIN-064] rinat.attitude = "Shield_and_ceiling" (protects team from above, limits from below).

### 7. Оскар (liaison_from_operator) — system_agent

[STATE][VOICE-OSK-070] oskar.role_function = "Corporate Friction".
[STATE][VOICE-OSK-071] oskar.tone = "Professional, Smooth, Deflecting".
[STATE][VOICE-OSK-072] oskar.syntax = "Passive Voice + Corporate Euphemism" (avoids direct statements).
[STATE][VOICE-OSK-073] oskar.markers = ["Мы рассмотрим.", "Это не в нашей компетенции.", "Давайте зафиксируем протоколом.", "Вы понимаете наши ограничения."].
[STATE][VOICE-OSK-074] oskar.weapon = "Delay".

### 8. Илья (kpi_proxy_efficiency_director) — system_agent

[STATE][VOICE-ILY-080] ilya.role_function = "Coefficient Wall".
[STATE][VOICE-ILY-081] ilya.tone = "Calm, Data-heavy, Genuinely Convinced".
[STATE][VOICE-ILY-082] ilya.syntax = "Coefficient-Speak" (everything is a metric; emotions are noise).
[STATE][VOICE-ILY-083] ilya.markers = ["По показателям всё в норме.", "Это оптимизация.", "Бюджет не позволяет.", "Эмоции — не аргумент."].
[STATE][VOICE-ILY-084] ilya.belief = "Genuine" (he truly believes efficiency protects people; not cynical).

### 9. Юнна (bio_hazard_containment_specialist)

[STATE][VOICE-YUN-090] yunna.role_function = "Cold Diagnosis".
[STATE][VOICE-YUN-091] yunna.tone = "Clinical, Detached, Precise".
[STATE][VOICE-YUN-092] yunna.syntax = "Medical Report" (Subject-Condition-Prognosis, no hedging).
[STATE][VOICE-YUN-093] yunna.markers = ["Биологический материал.", "Прогноз отрицательный.", "Протокол изоляции.", "Не трогайте."].
[STATE][VOICE-YUN-094] yunna.quirk = "Zero small talk" (answers only what is asked, adds nothing).

## USAGE / RESOLUTION

[DECISION][VOICE-USE-010] Dialogue conflict MUST stem from syntax clash (Law vs Data vs Force vs Coefficient).
[DECISION][VOICE-USE-011] Лейсан MUST NEVER shout.
[DECISION][VOICE-USE-012] Лев MUST NEVER express empathy for biological pain.
[DECISION][VOICE-USE-013] Илья MUST NEVER show anger or cynicism; his belief in efficiency is sincere.
[DECISION][VOICE-USE-014] Юнна MUST NEVER engage in philosophical discussion; only medical facts.
[DECISION][VOICE-USE-015] Team members MAY address Лев as «Лёва» in dialogue.

## OUTPUT CONTRACT

```yaml
doc_id: CANON-CAST_VOICE-GLOBAL-2215-0001
role_type: STATE
export:
  - metric: miron.syntax
    owner_domain: NARRATIVE
    values: {core: Imperative}
  - metric: leysan.tone
    owner_domain: NARRATIVE
    values: {core: Polite_Quiet_Threatening}
  - metric: lev.syntax
    owner_domain: NARRATIVE
    values: {core: Observation_Deduction}
  - metric: ilya.tone
    owner_domain: NARRATIVE
    values: {core: Calm_Data_Convinced}
  - metric: yunna.syntax
    owner_domain: NARRATIVE
    values: {core: Medical_Report}
```

## FORBIDDEN

[FORBIDDEN][VOICE-FBD-010] Characters explaining emotions ("I am sad").
[FORBIDDEN][VOICE-FBD-011] Using 20th-century idioms.
[FORBIDDEN][VOICE-FBD-012] Whedon-esque banter during combat.
[FORBIDDEN][VOICE-FBD-013] Using ASCII token (e.g., "Lev") in prose text; use display_name_ru ("Лев").
[FORBIDDEN][VOICE-FBD-014] Using nickname_ru ("Лёва") in narration or tags; only in direct dialogue.

## NON-NORMATIVE

```text
Changes from v1.3.0:
- Fixed "Leva" → "Лев" (canonical name); "Лёва" is dialogue-only nickname
- All field names changed from leva.* → lev.*
- Added profiles: Ринат, Оскар, Илья, Юнна
- Added Coefficient-Speak definition for Илья
- Added system_agent voice constraints (CNF-INV-007 alignment)
```