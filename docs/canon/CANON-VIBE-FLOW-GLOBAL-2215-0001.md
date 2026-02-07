---
id: CANON-VIBE-FLOW-GLOBAL-2215-0001
title: >
  Atmosphere Reference — Nujabes & Logic ("Solar Flow" State)
class: canon
status: draft
version: 1.0.0
inputs: [CANON-VIBE-RESTLESS-GLOBAL-2215-0001]
depends_on: []
scope: >
  RULE-канон для «светлых» и высокоинтеллектуальных сцен: состояние потока,
  дедуктивные прорывы, эстетика «солнечного брутализма». Используется как
  ограничитель генерации сцен и диалогов.
---

## LLM-INTENT

ROLE_TYPE: RULE  
SCOPE: enforce solar_flow vibe constraints for insight, execution, and reflective scenes  
INPUTS: [scene.type, scene.state]  
OUTPUTS: [prose_rhythm_rules, soundscape_rules, dialogue_constraints]  
FORBIDDEN: [gritty_bass, choppy_prose, emotional_monologue, noir_cliches]

## DEFINITIONS

[FACT][FLOW-DEF-010] `solar_flow_vibe` = режим сцены с высокой когнитивной синхронизацией и ощущением ясности.  
[FACT][FLOW-DEF-011] `nujabes_layer` = атмосферный слой: солнечный свет, тёплый бетон, мягкие повторяющиеся текстуры.  
[FACT][FLOW-DEF-012] `logic_layer` = ритмический слой: высокая плотность мысли, быстрые и точные формулировки.  

## INVARIANTS

[DECISION][FLOW-INV-010] `solar_flow_vibe` применяется ONLY IF выполнено хотя бы одно условие:
- команда действует синхронно и эффективно;
- персонаж находится в глубокой дедукции;
- сцена подчёркивает красоту и целостность мира.

[FORBIDDEN][FLOW-INV-011] Использование `solar_flow_vibe` в сценах:
- процедурного тупика;
- бюрократического конфликта;
- насилия как доминанты.

## CONTENT

[RULE][FLOW-100] IF scene.type ∈ {insight, execution, reflection} THEN USE solar_flow_vibe.  
[RULE][FLOW-101] IF scene.type ∈ {routine, struggle, bureaucracy} THEN USE CANON-VIBE-RESTLESS.  

[RULE][FLOW-110] Soundscape constraints:
- IF solar_flow_vibe THEN low-frequency grit MUST NOT dominate.
- IF solar_flow_vibe THEN ambient tones MUST be perceived as ordered and rhythmic.

[RULE][FLOW-120] Prose rhythm constraints:
- IF solar_flow_vibe THEN sentence_length ∈ [medium, long].
- IF solar_flow_vibe THEN clauses MAY cascade logically.
- IF solar_flow_vibe THEN rhetorical fragmentation MUST NOT be used.

[RULE][FLOW-130] Dialogue constraints:
- IF solar_flow_vibe THEN hesitation_markers MUST NOT appear.
- IF solar_flow_vibe THEN dialogue_speed = high.
- IF solar_flow_vibe THEN exchanges imply shared context without exposition.

[RULE][FLOW-140] Visual constraints:
- IF solar_flow_vibe THEN lighting MUST reference low sun / warm reflection.
- IF solar_flow_vibe THEN materials MUST read as warm, massive, stable.

## USAGE / RESOLUTION

- `solar_flow_vibe` overrides CANON-VIBE-RESTLESS ONLY within the active scene.
- Scene MUST revert to baseline vibe after resolution of insight/execution.
- Precedence: RULE → CANON → SCENE.

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-VIBE-FLOW-GLOBAL-2215-0001
role_type: RULE
export:
  - rule_id: FLOW-100
    intent: select solar_flow_vibe based on scene type
    inputs: [scene.type]
    outputs: [vibe_profile]
  - rule_id: FLOW-110
    intent: constrain soundscape under solar_flow_vibe
    inputs: [scene.state]
    outputs: [soundscape_rules]
  - rule_id: FLOW-120
    intent: constrain prose rhythm under solar_flow_vibe
    inputs: [scene.state]
    outputs: [prose_rules]
  - rule_id: FLOW-130
    intent: constrain dialogue under solar_flow_vibe
    inputs: [scene.state]
    outputs: [dialogue_rules]
~~~

## FORBIDDEN

[FORBIDDEN][FLOW-FRB-010] Использование «нуарной» эстетики (дождь, неон, грязный бас).  
[FORBIDDEN][FLOW-FRB-011] Эмоциональные монологи как объяснение инсайта.  
[FORBIDDEN][FLOW-FRB-012] Превращение вайба в музыкальную отсылку внутри текста.

## NON-NORMATIVE

Пример (не норма):  
«Мысль цеплялась за лог, лог раскрывался связью, и карта была ясна, как чертёж на стекле».
