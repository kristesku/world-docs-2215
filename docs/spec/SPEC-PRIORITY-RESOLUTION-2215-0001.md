---
id: SPEC-PRIORITY-RESOLUTION-2215-0001
title: >
  Resolution Order & Precedence Rules — 2215
class: spec
status: fixed
version: 1.0.0
inputs: []
depends_on: []
scope: >
  Канонический порядок разрешения документов корпуса 2215 и правила
  непробиваемости ограничений между уровнями. Документ обязателен
  для всех SSOT / BASELINE / CANON / PLAN / SCENE / OVERRIDE.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: define global resolution order and forbid cross-layer override violations
INPUTS: [any_document]
OUTPUTS: [resolution_order, violation_flags]
FORBIDDEN: [implicit_precedence, heuristic_resolution, narrative_reasoning]

---

## DEFINITIONS

[DECISION][RES-DEF-010] `resolution_order` = строгая иерархия документов, определяющая допустимость значений и ограничений.

[DECISION][RES-DEF-011] `override` = документ, явно изменяющий baseline/ssot в пределах разрешённого scope и с явным justification.

---

## RESOLUTION ORDER (GLOBAL)

[DECISION][RES-ORD-010] Global resolution order MUST be:

1. Override
2. Scene
3. Plan
4. Canon
5. Baseline
6. SSOT

[DECISION][RES-ORD-011] Документ с более высоким приоритетом МОЖЕТ:
- конкретизировать,
- сузить,
- выбрать допустимое значение из документа с более низким приоритетом.

[FORBIDDEN][RES-ORD-012] Документ с более низким приоритетом MUST NOT:
- отменять ограничения,
- расширять допустимые диапазоны,
- выбирать значение за пределами разрешённых состояний документа с более высоким приоритетом.

---

## NON-PENETRATION RULE (CRITICAL)

[DECISION][RES-NP-010] Ограничения верхнего уровня являются непробиваемыми для нижележащих документов.

[FORBIDDEN][RES-NP-011] Любая попытка:
- ослабить FORBIDDEN,
- игнорировать INVARIANTS,
- заменить RULE логикой сцены или канона

MUST be treated as invalid input.

---

## OVERRIDE CONSTRAINTS

[DECISION][RES-OVR-010] Override MAY modify:
- selected_value,
- local constraints,
- scope-limited behavior

ТОЛЬКО при выполнении всех условий:
- явный reference на переопределяемый anchor,
- justification,
- scope.

[FORBIDDEN][RES-OVR-011] Implicit override is forbidden.

[FORBIDDEN][RES-OVR-012] Override без justification считается невалидным.

---

## USAGE / RESOLUTION

[DECISION][RES-USE-010] Все документы корпуса ОБЯЗАНЫ трактоваться с учётом данного порядка разрешения.

[DECISION][RES-USE-011] В случае конфликта документов приоритет определяется исключительно данным SPEC.

---

## OUTPUT CONTRACT

~~~yaml
doc_id: SPEC-PRIORITY-RESOLUTION-2215-0001
role_type: RULE
export:
  - resolution_order:
      - Override
      - Scene
      - Plan
      - Canon
      - Baseline
      - SSOT
~~~

---

## FORBIDDEN

[FORBIDDEN][RES-FBD-010] Introducing alternative precedence orders.
[FORBIDDEN][RES-FBD-011] Heuristic or narrative conflict resolution.
[FORBIDDEN][RES-FBD-012] Assuming precedence from document class without this SPEC.

---

## NON-NORMATIVE

(Empty by design)
