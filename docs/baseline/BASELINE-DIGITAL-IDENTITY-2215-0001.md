---
id: BASELINE-DIGITALIDENTITY-2215-0001
title: >
  Digital Identity Baseline — 2215 (BAN_ID, Access, Post-Mortem)
class: baseline
status: fixed
version: 1.0.1
prefix: DID
doc_language: ru-RU
prose_language: ru-RU
inputs:
  - SSOT-SCENARIO-A-2215-0001
  - SSOT-LIFE-A-2215-0007
depends_on:
  - SPEC-DOC-STYLE-2215-0001
  - CANON-BASE-RULE-GLOBAL-2215-0001
  - BASELINE-SOCIAL-CIVIC-2215-0001
scope: >
  Исполняемый baseline цифровой идентичности и сетевых прав (LEVEL-MID) в 2215 году.
  Определяет жизненный цикл BAN_ID, режимы доступа, псевдонимность, аудит,
  и статус цифровых артефактов после смерти. Не задаёт параметры мира, только нормы.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: enforceable digital identity and access defaults for citizens (LEVEL-MID)
INPUTS:
  - SSOT-SCENARIO-A-2215-0001
  - SSOT-LIFE-A-2215-0007
  - CANON-BASE-RULE-GLOBAL-2215-0001
  - BASELINE-SOCIAL-CIVIC-2215-0001
OUTPUTS: [rule_id, access_outcomes, prohibited_patterns]
FORBIDDEN: [prose, cultural_exposition, speculative_ethics, mixed_role_types, world_parameter_binding]

---

## DEFINITIONS

[FACT][DID-DEF-010] `LEVEL-MID` = стандартные городские условия без специальных лицензий.
[FACT][DID-DEF-011] `BAN_ID` = биометрически связанная гражданская идентификация и сетевой профиль (Body Area Network).
[FACT][DID-DEF-012] `identity_claim` = предъявление BAN_ID для доступа к сервисам или зонам.
[FACT][DID-DEF-013] `access_token` = выдаваемый системой маркер доступа, связанный с BAN_ID.
[FACT][DID-DEF-014] `pseudonym` = разрешённый псевдо-идентификатор, связанный с BAN_ID через реестр.
[FACT][DID-DEF-015] `audit_log` = неизменяемый журнал событий доступа и прав.
[FACT][DID-DEF-016] `post_mortem_package` = набор цифровых артефактов после смерти.
[FACT][DID-DEF-017] `digital_snapshot` = статический слепок, разрешённый как memory_farewell.

[DECISION][DID-DEF-020] Any retention window MUST be expressed as a range in years.
[DECISION][DID-DEF-021] Any time threshold MUST be expressed in minutes OR years.

---

## INVARIANTS

[DECISION][DID-INV-010] This document MUST be treated as executable baseline for LEVEL-MID.
[DECISION][DID-INV-011] `BAN_ID` MUST be the primary identity primitive at LEVEL-MID.
[DECISION][DID-INV-012] Any deviation REQUIRES explicit override OR a different LEVEL baseline.

[FORBIDDEN][DID-INV-013] Introducing alternative identity primitives as defaults without explicit override.
[FORBIDDEN][DID-INV-014] Importing pre-2215 norms of anonymity as baseline defaults.

---

## CONTENT

### 1) Identity Lifecycle (BAN_ID)

[RULE][DID-LC-010] IF `person.status` = born THEN `BAN_ID` MUST be issued.
[RULE][DID-LC-011] IF `person.status` = alive THEN `BAN_ID` MUST remain active.
[RULE][DID-LC-012] IF `person.status` = dead THEN `BAN_ID` MUST be terminated.

[RULE][DID-LC-013] IF `BAN_ID.status` = terminated THEN `identity_claim` MUST be false.
[RULE][DID-LC-014] IF `BAN_ID.status` = terminated THEN `access_token` MUST be revoked.

### 2) Identity Claims (Everyday Access)

[RULE][DID-ACC-010] IF `zone` = public_mid THEN `identity_claim` MUST be required.
[RULE][DID-ACC-011] IF `zone` = work THEN `identity_claim` MUST be required.
[RULE][DID-ACC-012] IF `service.class` = essential THEN `identity_claim` MUST be required.

[FORBIDDEN][DID-ACC-020] Anonymous access to essential services at LEVEL-MID.
[FORBIDDEN][DID-ACC-021] Unregistered identity claims.

### 3) Pseudonymity

[RULE][DID-PSN-010] IF `user.uses_pseudonym` = true THEN `pseudonym` MUST be registry_linked_to_BAN_ID.
[RULE][DID-PSN-011] IF `zone` = public_mid THEN pseudonym MAY be displayed_instead_of_BAN_ID.
[RULE][DID-PSN-012] IF `investigation.status` = active THEN pseudonym_linkage MUST be resolvable.

[FORBIDDEN][DID-PSN-020] Unresolvable pseudonyms at LEVEL-MID.
[FORBIDDEN][DID-PSN-021] Pseudonym usage to bypass access regimes.

### 4) Audit and Non-Repudiation

[RULE][DID-AUD-010] IF `identity_claim` = true THEN `audit_log` MUST record event.
[RULE][DID-AUD-011] IF `access_token.issued` = true THEN `audit_log` MUST record issuance.
[RULE][DID-AUD-012] IF `rights.changed` = true THEN `audit_log` MUST record change.

[FORBIDDEN][DID-AUD-020] Deleting `audit_log` entries.
[FORBIDDEN][DID-AUD-021] Disabling audit logging at LEVEL-MID without explicit override.

### 5) Right Suspension

[RULE][DID-SUS-010] IF `legal_status` = suspect THEN rights MAY be suspended.
[RULE][DID-SUS-011] IF rights suspended THEN essential_services_access MUST remain enabled_minimal.
[RULE][DID-SUS-012] IF `investigation.status` = active THEN `BAN_ID` MAY be frozen.
[RULE][DID-SUS-013] IF `BAN_ID.status` = frozen THEN `identity_claim` MUST be allowed_only_for_essential_services.

### 6) Post-Mortem Digital Status

[RULE][DID-PM-010] IF `person.status` = dead THEN `post_mortem_package` MUST be created.
[RULE][DID-PM-011] `digital_snapshot` MUST be allowed.
[RULE][DID-PM-012] `interactive_identity_continuation` MUST be forbidden.
[RULE][DID-PM-013] Access MUST be governed_by_will_or_default_heirs.
[RULE][DID-PM-014] `audit_log` MUST remain immutable.

### 7) Retention

[DECISION][DID-RET-010] `audit_log_retention_years` ∈ [30, 80].
[DECISION][DID-RET-011] `essential_identity_events_retention_years` ∈ [10, 30].

[RULE][DID-RET-020] Erasure MUST be limited_to_non_essential_artifacts.
[RULE][DID-RET-021] Essential identity events MUST NOT be erased.

---

## OUTPUT CONTRACT

~~~yaml
doc_id: BASELINE-DIGITALIDENTITY-2215-0001
role_type: RULE
export:
  - rule_id: DID-LC-012
  - rule_id: DID-ACC-010
  - rule_id: DID-PSN-010
  - rule_id: DID-AUD-010
  - rule_id: DID-PM-012
~~~

---

## FORBIDDEN

[FORBIDDEN][DID-FBD-010] Treating digital identity as narrative or philosophical exposition.
[FORBIDDEN][DID-FBD-011] Introducing alternative identity systems without explicit override.
[FORBIDDEN][DID-FBD-012] Mixed ROLE_TYPE content.
[FORBIDDEN][DID-FBD-013] Statements without IDs.

---

## NON-NORMATIVE

~~~text
Identity is modeled as an access primitive and audit surface, not a cultural concept.
~~~
