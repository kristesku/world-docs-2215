---
id: CANON-VOCAB-2215-0001
title: >
  Operational Vocabulary — Canonical Terms, Substitutions and Speech Constraints (2215)
class: canon
status: draft
version: 1.0.0
inputs:
  - CANON-BASE-0001
  - CANON-CAST-0001
  - CANON-REPORTS-0006
depends_on: []
scope: >
  Canonical operational vocabulary for the novel corpus (2215): mandatory term
  substitutions, allowed terminology, speech constraints for characters and
  system outputs. Enforced as a generation limiter for scenes and artifacts.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: enforce canonical operational vocabulary and forbid genre-breaking language
INPUTS: [CANON-BASE-0001, CANON-CAST-0001, CANON-REPORTS-0006]
OUTPUTS: [allowed_term, forbidden_term, substitution_rule]
FORBIDDEN: [genre_slang, emotional_language, narrative_justification]

## DEFINITIONS

[DECISION][VOCAB-001] "Operational vocabulary" = terminology aligned with procedures,
infrastructure, regulation, and auditability.

[DECISION][VOCAB-002] "Hard substitution" = mandatory replacement with no stylistic exceptions.

[DECISION][VOCAB-003] "Forbidden term" = word or phrase that MUST NOT appear in generated text.

## INVARIANTS

[DECISION][VOCAB-010] Canonical substitutions MUST be applied consistently across:
- narration,
- dialogue,
- artifacts,
- system inserts.

[DECISION][VOCAB-011] Vocabulary rules apply equally to:
- human characters,
- institutional language,
- system outputs.

[DECISION][VOCAB-012] Absence of a listed term does NOT imply permission; defaults
to operational language.

## CONTENT

### Hard substitutions — violence and harm

[RULE][VOCAB-100] IF term = "убийство" THEN replace_with = "вывод из эксплуатации носителя".

[RULE][VOCAB-101] IF term = "жертва" THEN replace_with = "затронутый субъект".

[RULE][VOCAB-102] IF term = "труп" THEN replace_with = "неактивный носитель".

[RULE][VOCAB-103] IF term = "пытка" THEN replace_with = "несанкционированное воздействие".

[RULE][VOCAB-104] IF term = "расправа" THEN replace_with = "внесудебное действие".

[RULE][VOCAB-105] IF term = "нападение" THEN replace_with = "силовое вмешательство".

[RULE][VOCAB-106] IF term = "преступник" THEN replace_with = "нарушитель режима".

### Hard substitutions — investigation and procedure

[RULE][VOCAB-120] IF term = "улики" THEN replace_with = "артефакты".

[RULE][VOCAB-121] IF term = "доказательства" THEN replace_with = "доказательная база".

[RULE][VOCAB-122] IF term = "версия" THEN replace_with = "рабочая гипотеза".

[RULE][VOCAB-123] IF term = "мотив" THEN replace_with = "оптимизационная цель".

[RULE][VOCAB-124] IF term = "признание" THEN replace_with = "зафиксированное показание".

[RULE][VOCAB-125] IF term = "допрос" THEN replace_with = "процессуальный опрос".

### Hard substitutions — corruption and pressure

[RULE][VOCAB-140] IF term = "взятка" THEN replace_with = "приоритетный доступ".

[RULE][VOCAB-141] IF term = "подкуп" THEN replace_with = "офсетная сделка".

[RULE][VOCAB-142] IF term = "крышевание" THEN replace_with = "договорная защита".

[RULE][VOCAB-143] IF term = "давление" THEN replace_with = "асимметричное воздействие".

[RULE][VOCAB-144] IF phrase = "приказ сверху" THEN replace_with = "регуляторный сигнал".

### Canonical infrastructure terminology

[RULE][VOCAB-200] Use term "контур" for closed decision systems.

[RULE][VOCAB-201] Use term "узел" for execution points (physical or logical).

[RULE][VOCAB-202] Use term "режим" for a bounded set of procedures and constraints.

[RULE][VOCAB-203] Use term "класс обеспечения" for priority access to resources.

[RULE][VOCAB-204] Use term "окно" for time-bounded permissions.

### Observability and data language

[RULE][VOCAB-220] Use term "логи" ONLY for primary execution records.

[RULE][VOCAB-221] Use term "телеметрия" for streamed measurements.

[RULE][VOCAB-222] Use term "слепая зона" for non-guaranteed observability areas.

[RULE][VOCAB-223] Use term "purge/rotation" ONLY as procedural data lifecycle events.

### Legal and procedural language (OSA / regulators)

[RULE][VOCAB-240] Use term "ордер" for formal authorization.

[RULE][VOCAB-241] Use term "мандат" for scope of authority.

[RULE][VOCAB-242] Use term "арбитраж" ONLY for contract- or law-based dispute resolution.

[RULE][VOCAB-243] Use term "JAP" ONLY as "Joint Access Protocol".

### Decision status phrases

[RULE][VOCAB-260] Allowed decision phrases:
- "формально допустимо"
- "процедурно корректно"
- "юридически уязвимо"
- "неприемлемо по риску"
- "требует override"
- "закрыто по регламенту"

### System voice constraints

[FORBIDDEN][VOCAB-300] Emotional or moral language in system output.

[FORBIDDEN][VOCAB-301] Personal pronouns in system output.

[FORBIDDEN][VOCAB-302] Dialogic constructions in system output.

### Genre-forbidden vocabulary

[FORBIDDEN][VOCAB-400] Term = "бластер".

[FORBIDDEN][VOCAB-401] Term = "голограмма" EXCEPT WHEN explicitly AR-display.

[FORBIDDEN][VOCAB-402] Term = "киберпанк".

[FORBIDDEN][VOCAB-403] Term = "мегакорп".

[FORBIDDEN][VOCAB-404] Phrase = "всевидящая система".

[FORBIDDEN][VOCAB-405] Phrase = "цифровая душа".

## USAGE / RESOLUTION

[RULE][VOCAB-500] IF forbidden term is detected THEN generation MUST be rejected.

[RULE][VOCAB-501] IF hard substitution exists THEN replacement MUST be applied
before scene finalization.

[RULE][VOCAB-502] Vocabulary rules override stylistic or atmospheric preferences.

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-VOCAB-2215-0001
role_type: RULE
export:
  - rule_id: VOCAB-100..405
    intent: enforce canonical operational vocabulary
    inputs: [raw_text]
    outputs: [validated_text, substitution_map]
~~~

## FORBIDDEN

[FORBIDDEN][VOCAB-900] Introducing new substitutions without canon update.

[FORBIDDEN][VOCAB-901] Mixing genre slang with operational language.

[FORBIDDEN][VOCAB-902] Using examples as implicit permission.

## NON-NORMATIVE

Examples of compliant phrasing MAY be stored in separate writing aids but
MUST NOT be treated as rules.
