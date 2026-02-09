---
id: REG-FSSU_AUTO_LOWIMPACT-2215-0001
title: >
  Реестр — ФССУ — Автономные low-impact действия (whitelist) (2215)
class: registry
status: draft
version: 1.0.0
prefix: ROLI
doc_language: en-US
prose_language: ru-RU
inputs: []
depends_on:
  - CANON-FSSU_REGIONAL-RU16-2215-0001
  - SPEC-DOC_ID-2215-0001
  - SPEC-DOC_STYLE-2215-0001
  - SPEC-PRIORITY_RESOLUTION-2215-0001
scope: >
  Registry: whitelist типов инцидентов/действий, которые допускаются к автономному
  low-impact исполнению в региональном контуре (например, ГОРОД-2) без активации кейса.
  Реестр не задаёт процедур и не заменяет критерий юрисдикции ФССУ.
---

## LLM-INTENT

ROLE_TYPE: STATE
SCOPE: register whitelist items for autonomous low-impact actions in FSSU regional automation
INPUTS: [CANON-FSSU_REGIONAL-RU16-2215-0001]
OUTPUTS: [lowimpact_whitelist]
FORBIDDEN: [procedures, narrative_prose, undefined_terms, redefinition_of_FSSU_rules]

## DEFINITIONS

[FACT][ROLI-010] `lowimpact_item` = запись whitelist о типе инцидента/действия, допустимом к автономному исполнению без активации кейса.
[FACT][ROLI-020] `autonomous_execution` = выполнение действия контуром автоматизации при выполнении условий допуска и логирования.
[FACT][ROLI-030] `whitelist` = конечный набор `lowimpact_item`, используемый как разрешающий фильтр.

## CONTENT

### WHITELIST

[STATE][ROLI-100] `whitelist.item_001` = "telemetry_query_non_personal_minimized".
[STATE][ROLI-101] `whitelist.item_002` = "configuration_drift_detection_alert".
[STATE][ROLI-102] `whitelist.item_003` = "non_intrusive_integrity_check".
[STATE][ROLI-103] `whitelist.item_004` = "scheduled_snapshot_forensics_fixation".
[STATE][ROLI-104] `whitelist.item_005` = "automated_ticketing_for_operator_notification".
[STATE][ROLI-190] `whitelist.item_XXX` = "UNKNOWN_PLACEHOLDER".

## INVARIANTS

[DECISION][ROLI-200] Любое `autonomous_execution` MUST быть ограничено `whitelist`.
[DECISION][ROLI-210] Любое `autonomous_execution` MUST порождать лог и артефакт фиксации.
[FORBIDDEN][ROLI-220] Автономное исполнение действий, меняющих режим Systemic_Asset, без активного кейса.

## USAGE / RESOLUTION

[DECISION][ROLI-900] Использование whitelist MUST ссылаться на ROLI-100..ROLI-190; ELSE FAIL.
[DECISION][ROLI-910] Conflict resolution MUST follow SPEC-PRIORITY_RESOLUTION-2215-0001; ELSE FAIL.

## OUTPUT CONTRACT

~~~yaml
doc_id: REG-FSSU_AUTO_LOWIMPACT-2215-0001
role_type: STATE
export:
  - metric: lowimpact_whitelist
    owner_domain: FSSU_AUTOMATION
    values:
      core: "ROLI-100..ROLI-190"
      p90: none
      range: none
    unit: none
~~~

## FORBIDDEN

[FORBIDDEN][ROLI-980] Ввод процедур активации кейса ФССУ в этом реестре; ELSE FAIL.
[FORBIDDEN][ROLI-981] Расширение whitelist без явной записи `lowimpact_item`; ELSE FAIL.
[FORBIDDEN][ROLI-982] Подмена whitelist на “blacklist” или эвристику; ELSE FAIL.

## NON-NORMATIVE

~~~text
Реестр предназначен для low-impact автономии (например, ГОРОД-2) без активации кейса.
~~~
