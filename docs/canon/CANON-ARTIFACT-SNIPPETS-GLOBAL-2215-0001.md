---
id: CANON-ARTIFACT-SNIPPETS-GLOBAL-2215-0001
title: >
  OSA Artifacts — Snippet Templates and Procedural Forms (2215)
class: canon
status: fixed
version: 1.1.0
inputs:
  - CANON-VOCAB-2215-0001
  - CANON-SYSTEM-VOICE-GLOBAL-2215-0001
depends_on: []
scope: >
  Canonical procedural specification of OSA artifact snippets (CD/EL/CM,
  orders, logs, access receipts). Purpose: constrain LLM output to fixed,
  auditable forms; prohibit narrative drift; guarantee evidence usability.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: define mandatory forms and constraints for OSA artifact snippets used in scenes
INPUTS: [CANON-SYSTEM-VOICE-GLOBAL-2215-0001, CANON-VOCAB-2215-0001]
OUTPUTS: [artifact_schema_id, admissibility_constraints]
FORBIDDEN: [narrative_text, freeform_documents, persona_voice]

## DEFINITIONS

[FACT][ART-DEF-001] Artifact = procedural record produced or consumed by OSA during a case.
[FACT][ART-DEF-002] Snippet = partial artifact excerpt embedded in narrative text.
[FACT][ART-DEF-003] EL item = Evidence Ledger record with chain-of-custody.
[FACT][ART-DEF-004] Case scope = explicit perimeter (zone/node/mode) bound to an artifact.

## INVARIANTS

[DECISION][ART-INV-001] Every snippet MUST be procedural and machine-verifiable.
[DECISION][ART-INV-002] Every snippet MUST bind to case_id and scope.
[DECISION][ART-INV-003] Any artifact used as evidence MUST be an EL item.
[DECISION][ART-INV-004] Snippets are excerpts ONLY; full documents are forbidden in prose.

## CONTENT

[RULE][ART-R-001] IF artifact appears in text THEN it MUST conform to one canonical schema.
[RULE][ART-R-002] IF artifact claims evidentiary value THEN evidence_id and custody are REQUIRED.
[RULE][ART-R-003] IF artifact implies enforcement THEN order_id or mandate_ref is REQUIRED.
[RULE][ART-R-004] IF artifact references system events THEN it MUST align with CANON-SYSTEM-VOICE enums.
[FORBIDDEN][ART-F-001] Narrative language inside artifacts.
[FORBIDDEN][ART-F-002] Human emotions, motives, or moral language in artifacts.
[FORBIDDEN][ART-F-003] Bureaucratic filler without operational fields.

## USAGE / RESOLUTION

[DECISION][ART-U-001] Authors select schema → populate minimal fields → embed as snippet.
[DECISION][ART-U-002] Procedural validity has priority over readability.
[DECISION][ART-U-003] Any deviation invalidates the artifact for evidentiary use.

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-ARTIFACT-SNIPPETS-GLOBAL-2215-0001
role_type: RULE
export:
  - rule_id: ART-R-001
    intent: enforce canonical artifact schemas
    inputs: [snippet]
    outputs: [schema_valid]
~~~

## FORBIDDEN

[FORBIDDEN][ART-F-010] Introducing new artifact types without CANON override.
[FORBIDDEN][ART-F-011] Mixing artifact content with narrative exposition.
[FORBIDDEN][ART-F-012] Using examples as normative rules.

## NON-NORMATIVE

### EL item — minimal evidence record

~~~json
{
  "case_id": "OSA-2215-RU-16-0007",
  "evidence_id": "E-002",
  "type": "log_extract",
  "source": "OBSERVABILITY",
  "scope": "RU-16/CHELNY/Node-HOSP-3/Telemetry",
  "ts_collected": "2215-05-18T21:05:00+03:00",
  "collector": "OSA/Lev-Safonov",
  "hash": "sha256:...",
  "custody": {
    "sealed": true,
    "seal_id": "SEAL-2215-000118",
    "custody_chain": [
      { "ts": "2215-05-18T21:06:00+03:00", "holder": "OSA", "action": "sealed" }
    ]
  },
  "notes": "Primary logs missing within retention window."
}
~~~

### Chain-of-custody event

~~~json
{
  "case_id": "OSA-2215-RU-16-0007",
  "event": "custody_transfer",
  "ts": "2215-05-19T10:52:00+03:00",
  "evidence_id": "E-001",
  "from": "Z4/Regime-Holder/Escort-Unit",
  "to": "OSA/Aidar-Bulatov",
  "conditions": ["no_export_without_seal", "escorted_access"],
  "seal_verified": true
}
~~~

### Chat log extract

~~~json
{
  "case_id": "OSA-2215-RU-16-0007",
  "artifact": "chat_log_extract",
  "scope": "Operator/Dispatch/Queue-7",
  "window": { "start": "2215-05-18T17:10:00+03:00", "end": "2215-05-18T17:28:00+03:00" },
  "messages": [
    { "ts": "2215-05-18T17:11:03+03:00", "from": "dispatch.bot", "type": "system", "text": "Window updated. service_class=C." },
    { "ts": "2215-05-18T17:12:19+03:00", "from": "tech.unit.14", "type": "field", "text": "Access token rejected at Node-HOSP-3." }
  ]
}
~~~

### Suspension order snippet

~~~json
{
  "order_id": "O-11-SUSP-2215-0009",
  "case_id": "OSA-2215-RU-16-0007",
  "ts_issued": "2215-05-21T08:30:00+03:00",
  "issuer": "OSA/Leisan-Khakimova",
  "scope": "Z4/RU-16/Node-Zone-X/Mode-Accelerated",
  "action": "suspend_mode_partial",
  "duration_hours": 72,
  "basis": ["admissibility_risk", "observability_gap"],
  "statement": "Mode partially suspended. Audit initiated."
}
~~~
