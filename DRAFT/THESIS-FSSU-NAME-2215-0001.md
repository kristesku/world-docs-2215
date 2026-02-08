---
id: THESIS-FSSU-NAME-2215-0001
title: >
  Naming Thesis — Federal Systemic Resilience Service (ФССУ / FSRS) and Legacy Alias Policy (2215)
class: thesis
status: draft
version: 1.0.0
prefix: FSSU
doc_language: ru-RU
prose_language: ru-RU
inputs: []
depends_on:
  - SPEC-DOC-ID-2215-0001
  - SPEC-DOC-STYLE-2215-0001
scope: >
  Фиксация официального наименования службы (ru/en), сокращений, допустимых
  алиасов и политики использования legacy-обозначения «ОСА» в корпусе и прозе.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: define official name tokens and alias policy for the service formerly referenced as OSA
INPUTS: [SPEC-DOC-ID-2215-0001, SPEC-DOC-STYLE-2215-0001]
OUTPUTS: [fssu_proper_name_set, alias_policy, legacy_name_policy]
FORBIDDEN: [implicit_renames, auto_transliteration, uncontrolled_aliases]

## DEFINITIONS

[FACT][FSSU-010] `fssu_ru` = "Федеральная служба системной устойчивости".
[FACT][FSSU-020] `fssu_abbr_ru` = "ФССУ".
[FACT][FSSU-030] `fssu_en` = "Federal Systemic Resilience Service".
[FACT][FSSU-040] `fssu_abbr_en` = "FSRS".
[FACT][FSSU-050] `legacy_osa_ru` = "ОСА".
[FACT][FSSU-060] `legacy_osa_expansion_ru` = "Отдел Системных Аномалий".
[FACT][FSSU-070] `shorthand_ru` = "Служба" (контекстный разговорный шорткат внутри РФ).

## INVARIANTS

[DECISION][FSSU-100] `fssu_ru` MUST be treated as the official Russian name of the organization in 2215 corpus.
[DECISION][FSSU-110] `fssu_en` MUST be treated as the official English name for en-US documents and external-facing artifacts.
[DECISION][FSSU-120] `fssu_abbr_ru` MUST be treated as the official Russian abbreviation used in headers, stamps, and doc references.
[DECISION][FSSU-130] `fssu_abbr_en` MUST be treated as the official English abbreviation used in en-US artifacts.
[DECISION][FSSU-140] `legacy_osa_ru` MUST be treated as a legacy alias that remains valid only under the policy in FSSU-210..FSSU-250.
[DECISION][FSSU-150] No auto-transliteration between ru/en forms is allowed; only the explicitly defined tokens are valid.

## CONTENT

[RULE][FSSU-200] IF a corpus document defines the organization as a proper_name THEN it MUST use `fssu_ru` as canon_ru; ELSE FAIL.
[RULE][FSSU-210] `legacy_osa_ru` MAY appear ONLY IF its scope is explicitly "legacy_reference" OR "in-world_habit" AND the same document also references `fssu_abbr_ru`; ELSE FAIL.
[RULE][FSSU-220] In diegetic prose, `legacy_osa_ru` MAY be used as character speech habit; however narrative/authorial voice MUST prefer `fssu_abbr_ru` after first in-scene expansion; ELSE FAIL.
[RULE][FSSU-230] In bureaucratic artifacts (orders, dockets, headers, stamps) the organization name MUST be `fssu_abbr_ru` or `fssu_ru`; `legacy_osa_ru` MUST NOT appear; ELSE FAIL.
[RULE][FSSU-240] In en-US corpus documents, the organization name MUST be emitted as ru:"ФССУ" OR en:"FSRS" according to the document’s naming policy; `legacy_osa_ru` MUST NOT be used; ELSE FAIL.
[RULE][FSSU-250] `shorthand_ru` MAY be used ONLY in dialogue or informal internal notes when the referent is unambiguous; ELSE FAIL.
[DECISION][FSSU-260] Canonical alias set for this org is exactly: {`fssu_ru`,`fssu_abbr_ru`,`fssu_en`,`fssu_abbr_en`,`legacy_osa_ru`,`shorthand_ru`}.

## USAGE / RESOLUTION

[DECISION][FSSU-300] This thesis is applied when naming/renaming the organization across canon and narrative artifacts in 2215.
[DECISION][FSSU-310] Consumers MUST treat `fssu_abbr_ru` as the default short-form token in Russian corpus documents unless a first-mention expansion is required.

## OUTPUT CONTRACT

~~~yaml
doc_id: THESIS-FSSU-NAME-2215-0001
role_type: RULE
export:
  - proper_name:
      canon_ru: "Федеральная служба системной устойчивости"
      display_ru: "ФССУ"
      canon_en: "Federal Systemic Resilience Service"
      display_en: "FSRS"
      legacy_aliases_ru: ["ОСА","Служба"]
  - alias_policy:
      default_ru_token: "ФССУ"
      legacy_ru_token: "ОСА"
      shorthand_ru_token: "Служба"
      en_token: "FSRS"
~~~

## FORBIDDEN

[FORBIDDEN][FSSU-900] Using `legacy_osa_ru` as the official name in headers, stamps, or orders.
[FORBIDDEN][FSSU-910] Introducing additional aliases for the organization outside FSSU-260.
[FORBIDDEN][FSSU-920] Auto-transliteration of the organization name (ru↔lat) outside explicit canon tokens.
[FORBIDDEN][FSSU-930] Using the phrase "служба безопасности" as an official or semi-official name of the organization.

## NON-NORMATIVE

(empty)
