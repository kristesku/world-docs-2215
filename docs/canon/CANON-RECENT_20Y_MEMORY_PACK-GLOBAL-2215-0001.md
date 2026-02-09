---
id: CANON-RECENT_20Y_MEMORY_PACK-GLOBAL-2215-0001
title: >
  Recent 20 Years Memory Pack — 2215 (Public Recall Anchors)
class: canon
status: fixed
version: 1.0.0
inputs: []
depends_on:
  - CANON-BASE_NARRATIVE-GLOBAL-2215-0001
  - CANON-BASE_RULE-GLOBAL-2215-0001
scope: >
  Якоря общественной памяти последних 20 лет (примерно 2195–2215) для диалогов,
  новостных вставок и сцен. Документ не исполняемый: не задаёт правил и параметров мира,
  а фиксирует общие референсы, к которым персонажи могут апеллировать.
---

## LLM-INTENT

ROLE_TYPE: INTERFACE
SCOPE: non-executable public-memory anchors for dialogue and scene references
INPUTS: [CANON-BASE_NARRATIVE-GLOBAL-2215-0001, CANON-BASE_RULE-GLOBAL-2215-0001]
OUTPUTS: [memory_anchor_id, reference_phrases, usage_guardrails]
FORBIDDEN: [world_parameter_binding, rule_enforcement, numeric_world_metrics, prose, mixed_role_types]

---

## DEFINITIONS

[FACT][MEM-DEF-010] memory_anchor = общеизвестный референс последних 20 лет, используемый как контекст без объяснений.
[FACT][MEM-DEF-011] reference_phrase = короткая устойчивая формула, узнаваемая в разговоре.
[FACT][MEM-DEF-012] newsroom_tag = нейтральная метка в стиле заголовка/рубрики.

[DECISION][MEM-DEF-020] Each memory_anchor MUST include at least one reference_phrase.
[DECISION][MEM-DEF-021] Anchors MUST be specified as ranges, not exact dates: year ∈ [2195, 2215].

---

## INVARIANTS

[DECISION][MEM-INV-010] This document MUST NOT be used to resolve canon conflicts.
[DECISION][MEM-INV-011] Anchors MUST be usable without exposition in-scene.
[DECISION][MEM-INV-012] Anchors MUST reinforce procedural and institutional tone.
[FORBIDDEN][MEM-INV-013] Turning anchors into lore dumps inside scenes.
[FORBIDDEN][MEM-INV-014] Anchors that imply world-ending collapse as default background.

---

## CONTENT

[FACT][MEM-001] memory_anchor_id = MEM-WATER-QUOTAS.
[FACT][MEM-002] anchor_window_years = x ∈ [2198, 2202] years.
[FACT][MEM-003] newsroom_tag = "Water Quota Window".
[FACT][MEM-004] reference_phrase = "временно по квоте".
[FACT][MEM-005] reference_phrase = "окна распределения воды".

[FACT][MEM-010] memory_anchor_id = MEM-BODY-REFORM.
[FACT][MEM-011] anchor_window_years = x ∈ [2204, 2206] years.
[FACT][MEM-012] newsroom_tag = "Body Rights Reform".
[FACT][MEM-013] reference_phrase = "после реформы тела".
[FACT][MEM-014] reference_phrase = "биоциркул теперь обязателен".

[FACT][MEM-020] memory_anchor_id = MEM-AUDIT-SHOCK.
[FACT][MEM-021] anchor_window_years = x ∈ [2208, 2210] years.
[FACT][MEM-022] newsroom_tag = "Audit Shock".
[FACT][MEM-023] reference_phrase = "после аудит-шока".
[FACT][MEM-024] reference_phrase = "с тех пор только через журнал".

[FACT][MEM-030] memory_anchor_id = MEM-SILENT-DISAPPEARANCE.
[FACT][MEM-031] anchor_window_years = x ∈ [2210, 2213] years.
[FACT][MEM-032] newsroom_tag = "Quiet Profession Sunset".
[FACT][MEM-033] reference_phrase = "их больше не учат".
[FACT][MEM-034] reference_phrase = "профессия ушла тихо".

[FACT][MEM-040] memory_anchor_id = MEM-NONWAR-CRISIS.
[FACT][MEM-041] anchor_window_years = x ∈ [2212, 2214] years.
[FACT][MEM-042] newsroom_tag = "Non-War Crisis".
[FACT][MEM-043] reference_phrase = "когда все ждали войну".
[FACT][MEM-044] reference_phrase = "кризис, который не случился".

[FACT][MEM-050] memory_anchor_id = MEM-TELEMETRY-RULESET.
[FACT][MEM-051] anchor_window_years = x ∈ [2206, 2211] years.
[FACT][MEM-052] newsroom_tag = "Telemetry Harmonization".
[FACT][MEM-053] reference_phrase = "после гармонизации телеметрии".
[FACT][MEM-054] reference_phrase = "город не всевидящий, просто журнал".

[FACT][MEM-060] memory_anchor_id = MEM-PARENTING-LICENSE-SHIFT.
[FACT][MEM-061] anchor_window_years = x ∈ [2209, 2212] years.
[FACT][MEM-062] newsroom_tag = "Parenting License Shift".
[FACT][MEM-063] reference_phrase = "после перекалибровки лицензий".
[FACT][MEM-064] reference_phrase = "алго-лицензия стала жёстче".

---

## USAGE / RESOLUTION

[DECISION][MEM-USE-010] Scenes MAY reference any memory_anchor via reference_phrase without explanation.
[DECISION][MEM-USE-011] If an anchor is referenced, the scene MUST not explain causes; it MAY show artifacts or procedures.
[DECISION][MEM-USE-012] News inserts MAY use newsroom_tag as headline label.
[FORBIDDEN][MEM-USE-013] Using memory anchors to introduce new world parameters.
[FORBIDDEN][MEM-USE-014] Using anchors as moral commentary.

---

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-RECENT_20Y_MEMORY_PACK-GLOBAL-2215-0001
role_type: INTERFACE
export:
  - memory_anchor_id: MEM-WATER-QUOTAS
    window_years: [2198, 2202]
    newsroom_tag: Water Quota Window
    reference_phrases: ["временно по квоте", "окна распределения воды"]
  - memory_anchor_id: MEM-AUDIT-SHOCK
    window_years: [2208, 2210]
    newsroom_tag: Audit Shock
    reference_phrases: ["после аудит-шока", "с тех пор только через журнал"]
~~~

---

## FORBIDDEN

[FORBIDDEN][MEM-FBD-010] Converting anchors into long paragraphs.
[FORBIDDEN][MEM-FBD-011] Using anchors to justify numeric worldbuilding.
[FORBIDDEN][MEM-FBD-012] Mixed ROLE_TYPE content inside this document.
[FORBIDDEN][MEM-FBD-013] Floating bullets without statement IDs.

---

## NON-NORMATIVE

Anchors are meant to be dropped into dialogue as if everyone already knows them.
They should surface as irritation, shorthand, or procedural reflex—not as exposition.
