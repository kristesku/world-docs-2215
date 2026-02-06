---
id: CITY-RULES-RU-2215-0001
title: >
  RU 2215 — Набережные Челны: базовые законы города
class: canon
status: draft
version: 1.0.0
inputs:
  - CANON-CITY-RU-2215-0007
  - CANON-CITY-BOUNDARY-RU-2215-0008
depends_on: []
scope: >
  Жёсткие инварианты города Набережные Челны в 2215 году: география,
  архитектура, материалы, масштаб и бытовые нормы. Документ задаёт
  непреодолимые ограничения для сцен и описаний.
---

## LLM-INTENT

ROLE_TYPE: RULE  
SCOPE: non-overridable urban invariants for Chelny-2215  
INPUTS: [CANON-CITY-RU-2215-0007, CANON-CITY-BOUNDARY-RU-2215-0008]  
OUTPUTS: [urban_constraints, forbidden_patterns]  
FORBIDDEN: [introduce_metrics, redefine_boundaries, narrative_prose]

## DEFINITIONS

[DECISION][CITYR-001] Город = функциональная городская территория Челнов-2215 внутри канонического периметра.  
[DECISION][CITYR-002] Западный берег Камы = природная/охранная зона вне городской урбанизации.  
[DECISION][CITYR-003] Избыточный масштаб = размер элементов среды, превышающий минимально функциональный.

## INVARIANTS

[RULE][CITYR-010] IF территория находится западнее Камы THEN урбанизация MUST NOT выполняться.  
[RULE][CITYR-011] IF объект относится к лесной/охранной зоне THEN застройка MUST NOT выполняться.  
[RULE][CITYR-012] Городская ткань MUST формироваться вдоль инфраструктурных осей, NOT радиально.  
[RULE][CITYR-013] Избыточный масштаб MUST применяться ко всем ключевым элементам среды.  
[RULE][CITYR-014] Архитектурный язык MUST NOT демонстрировать технологичность как самоцель.

## CONTENT

### География

[RULE][CITYR-020] IF локация = западный берег Камы THEN доступ MAY exist AND урбанизация MUST NOT exist.  
[RULE][CITYR-021] Основные направления роста города MUST be {east, south, south-east}.  
[RULE][CITYR-022] Лесные массивы (в т.ч. Боровецкий лес) MUST act as hard urban limit.

### Архитектура

[RULE][CITYR-030] Архитектура MUST follow principle: excess_scale_over_function.  
[RULE][CITYR-031] IF форма = органическая OR биоморфная THEN usage MUST NOT be dominant.  
[RULE][CITYR-032] Иконические здания-символы MUST NOT be used as доминанты города.

### Материалы

[RULE][CITYR-040] Допустимые базовые материалы = {concrete, stone, matte_metal}.  
[RULE][CITYR-041] IF material = glass THEN usage MUST be limited AND non-dominant.  
[RULE][CITYR-042] Несущие и инженерные элементы MUST be visually readable.

### Масштаб и тело

[RULE][CITYR-050] Тротуары MUST be sized for flows, NOT crowds.  
[RULE][CITYR-051] Подземные переходы MUST be deep AND wide AND perceived as engineering spaces.  
[RULE][CITYR-052] Входные группы MUST be portals, NOT doors.  
[RULE][CITYR-053] Потолки общественных пространств MUST exceed psychological_norm_height.

### Бытовые нормы

[RULE][CITYR-060] Наблюдение и логирование MUST be treated as normal state.  
[RULE][CITYR-061] Анонимность MUST be privilege, NOT baseline right.  
[RULE][CITYR-062] IF субъект = ребёнок THEN presence_in_city MUST be normalised.  
[RULE][CITYR-063] Отклонения от режимов MUST be auto-logged AND NOT dramatic by default.  
[RULE][CITYR-064] Город MUST be comfortable_for_locals AND frictional_for_visitors.

### Нарративные ограничения

[RULE][CITYR-070] География MUST be conveyed via movement/routes, NOT maps.  
[RULE][CITYR-071] Архитектура MUST be described via bodily scale, NOT styles.  
[RULE][CITYR-072] Технологические системы MUST NOT be directly explained IF behaviour implies function.  
[RULE][CITYR-073] В сцене город MUST either assist OR obstruct the character.

## USAGE / RESOLUTION

[RULE][CITYR-080] These rules have CANON precedence and MUST override scene-level interpretation.  
[RULE][CITYR-081] Any scene violating CITY-RULES MUST be treated as invalid.

## OUTPUT CONTRACT

~~~yaml
doc_id: CITY-RULES-RU-2215-0001
role_type: RULE
export:
  - rule_id: CITYR-010
    intent: forbid west-bank urbanization
    inputs: [location]
    outputs: [urbanization_allowed=false]
  - rule_id: CITYR-013
    intent: enforce excess scale principle
    inputs: [urban_element]
    outputs: [scale_constraint]
~~~

## FORBIDDEN

[FORBIDDEN][CITYR-090] Введение новых географических границ.  
[FORBIDDEN][CITYR-091] Ослабление инвариантов масштаба ради сцены.  
[FORBIDDEN][CITYR-092] Использование архитектурных клише футуризма.  
[FORBIDDEN][CITYR-093] Подмена правил примерами или атмосферным текстом.

## NON-NORMATIVE

Примеры ощущений и художественные описания должны выноситься в SCENE-документы и не имеют нормативной силы.
