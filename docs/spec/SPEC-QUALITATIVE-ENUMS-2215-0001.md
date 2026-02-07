---
id: SPEC-QUALITATIVE-ENUMS-2215-0001
title: >
  Qualitative Enums — Controlled Vocabulary (2215)
class: spec
status: fixed
version: 1.0.0
inputs: []
depends_on: []
scope: >
  Нормативный словарь качественных значений для SSOT/BASELINE/CANON.
  Устраняет vague-значения и обеспечивает совместимость между документами.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: define controlled vocabularies for qualitative fields
INPUTS: [any_document]
OUTPUTS: [enum_sets]
FORBIDDEN: [freeform_qualitative_values, synonyms_as_new_values]

---

## CONTENT

[DECISION][QEN-010] Prevalence enum = {none, rare, minority, common, majority, near_universal}.

[DECISION][QEN-020] Autonomy enum (transport) = {manual_norm, mixed, autonomous_norm}.

[DECISION][QEN-030] Work mode enum = {on_site, hybrid, remote, remote_or_hybrid}.

---

## USAGE / RESOLUTION

[DECISION][QEN-USE-010] Any qualitative field MUST use one of the enums above when applicable.
[FORBIDDEN][QEN-USE-011] Using ad-hoc strings such as "predominantly_*", "*_common", "mostly_*".

---

## OUTPUT CONTRACT

~~~yaml
doc_id: SPEC-QUALITATIVE-ENUMS-2215-0001
role_type: RULE
export:
  - enum: prevalence
    values: [none, rare, minority, common, majority, near_universal]
  - enum: transport_autonomy
    values: [manual_norm, mixed, autonomous_norm]
  - enum: work_mode
    values: [on_site, hybrid, remote, remote_or_hybrid]
~~~

---

## FORBIDDEN

[FORBIDDEN][QEN-FBD-010] Introducing new qualitative values without updating this SPEC.

---

## NON-NORMATIVE

(Empty by design)
