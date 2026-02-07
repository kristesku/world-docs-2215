---
id: CANON-REPORTS-GLOBAL-2215-0006
title: >
  Артефакты ОСА — форматы отчётов, реестров и причинных карт (2215)
class: canon
status: draft
version: 0.3.0
inputs:
  - CANON-OSA-GLOBAL-2215-0005
  - CANON-ORDERS-GLOBAL-2215-0003
  - CANON-ZONES-GLOBAL-2215-0004
depends_on:
  - SPEC-DOC-STYLE-2215-0001
  - SPEC-PRIORITY-RESOLUTION-2215-0001
scope: >
  RULE-канон форматов артефактов ОСА: минимально достаточные структуры для сцен,
  обязательные поля, связи с ордерами/мандатами, и правила допустимости (chain-of-custody).
  Без новых SSOT-метрик и без художественного текста.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: define mandatory structures and admissibility rules for OSA case artifacts (CD/EL/CM/FM/RP/PRS)
INPUTS:
  - CANON-OSA-GLOBAL-2215-0005
  - CANON-ORDERS-GLOBAL-2215-0003
  - CANON-ZONES-GLOBAL-2215-0004
OUTPUTS:
  - artifact_header_schema
  - artifact_type_schemas
  - admissibility_rules
  - scene_excerpt_rules
FORBIDDEN:
  - invent_new_ssot_metrics
  - narrative_prose
  - full_length_documents_in_scene
  - redefine_orders_taxonomy

---

## DEFINITIONS

[FACT][REP-DEF-010] artifact_type ∈ {CD, EL, CM, FM, RP, PRS}.
[FACT][REP-DEF-011] CD = Case Docket; timeline of actions/decisions for a case.
[FACT][REP-DEF-012] EL = Evidence Ledger; registry of evidence items with integrity and custody.
[FACT][REP-DEF-013] CM = Causal Map; claim graph CAUSE → MECHANISM → CONSEQUENCE with tests/counterfactuals.
[FACT][REP-DEF-014] FM = Findings Memo; memo summarizing established/not-established and requested actions.
[FACT][REP-DEF-015] RP = Remedy Package; measurable corrective measures with monitoring.
[FACT][REP-DEF-016] PRS = Public/Restricted Summary; public summary plus restricted annex when required.
[FACT][REP-DEF-017] jurisdiction ∈ {normal, extraterritorial, mixed}.
[FACT][REP-DEF-018] classification ∈ {public, restricted, secret}.
[FACT][REP-DEF-019] admissibility_status ∈ {clean, conditional, contested}.
[FACT][REP-DEF-020] evidence_item = EL entry with evidence_id, integrity, custody_chain, and linked_orders.
[FACT][REP-DEF-021] chain_of_custody = ordered event list of possession/access/copy actions for an evidence_item.

---

## INVARIANTS

[DECISION][REP-INV-020] Every OSA artifact MUST be case_scoped AND dated AND signed AND auditable.
[DECISION][REP-INV-021] Every OSA artifact MUST reference procedural basis via mandate_refs and/or order_refs.
[DECISION][REP-INV-022] Any artifact containing causal claims MUST bind those claims to EL evidence_items with chain_of_custody.
[DECISION][REP-INV-023] Any artifact produced under limited jurisdiction MUST declare jurisdiction and admissibility_basis.
[DECISION][REP-INV-024] In-scene display MUST be partial; only excerpts are shown.

---

## CONTENT

### 1. Global artifact header schema (applies to all artifact types)

[RULE][REP-HDR-100] Every artifact MUST include header.case_id.
[RULE][REP-HDR-101] Every artifact MUST include header.artifact_id.
[RULE][REP-HDR-102] Every artifact MUST include header.artifact_type ∈ {CD, EL, CM, FM, RP, PRS}.
[RULE][REP-HDR-103] Every artifact MUST include header.classification ∈ {public, restricted, secret}.
[RULE][REP-HDR-104] Every artifact MUST include header.created_at (ISO8601).
[RULE][REP-HDR-105] Every artifact MUST include header.created_by (role + name_or_identifier).
[RULE][REP-HDR-106] Every artifact MUST include header.mandate_refs (array).
[RULE][REP-HDR-107] Every artifact MUST include header.order_refs (array).
[RULE][REP-HDR-108] Every artifact MUST include header.scope (explicit perimeter string).
[RULE][REP-HDR-109] IF integrity_fixation_present = true THEN header.hash MUST be present.
[RULE][REP-HDR-110] Every artifact MUST include header.attachments (array of artifact_refs and/or evidence_refs).
[RULE][REP-HDR-111] Every artifact MUST include header.jurisdiction ∈ {normal, extraterritorial, mixed}.
[RULE][REP-HDR-112] Every artifact MUST include header.admissibility_basis ∈ {law, contract, JAP, emergency}.

[FORBIDDEN][REP-HDR-120] Omitting jurisdiction when scope touches a zone boundary or a regime holder boundary.
[FORBIDDEN][REP-HDR-121] Including narrative justification paragraphs in header; only minimal rationale fields allowed.

---

### 2. Identifier formats

[RULE][REP-ID-120] case_id MUST match pattern: OSA-2215-<region>-<serial>.
[RULE][REP-ID-121] artifact_id MUST match pattern: <CASE_ID>-<ARTIFACT_TYPE>-<serial>.

---

### 3. Case Docket (CD) schema

[RULE][REP-CD-200] IF artifact_type = CD THEN intent MUST be timeline_of_actions_and_rationale.
[RULE][REP-CD-201] IF action_not_recorded_in_CD = true THEN action MUST be treated as procedurally_vulnerable.
[RULE][REP-CD-202] Each CD timeline_entry MUST include {ts, type, summary, decision, actors}.
[RULE][REP-CD-203] IF timeline_entry.type = order_issued THEN timeline_entry MUST include {order_ref, rationale_short}.
[RULE][REP-CD-204] CD MUST NOT substitute for EL; CD MUST reference EL items for evidence.

[RULE][REP-CD-205] IF scope_touches_zone = true OR JAP_required = true THEN CD MUST record jurisdiction_note.
[RULE][REP-CD-206] IF jurisdiction ∈ {extraterritorial, mixed} THEN CD MUST record JAP_requirement_or_admissibility_risk.

---

### 4. Evidence Ledger (EL) schema

[RULE][REP-EL-300] IF artifact_type = EL THEN intent MUST be bind_source_integrity_custody_admissibility.
[RULE][REP-EL-301] IF claim_established = true AND EL_refs_missing = true THEN claim MUST be treated as contestable.

[RULE][REP-EL-310] Each evidence_item MUST include evidence_id.
[RULE][REP-EL-311] Each evidence_item MUST include type (enum string).
[RULE][REP-EL-312] Each evidence_item MUST include source (entity/system/zone or equivalent).
[RULE][REP-EL-313] Each evidence_item MUST include collected_at and collected_by.
[RULE][REP-EL-314] Each evidence_item MUST include method.
[RULE][REP-EL-315] Each evidence_item MUST include integrity (hash and/or signature and/or seal).
[RULE][REP-EL-316] Each evidence_item MUST include custody_chain (ordered events).
[RULE][REP-EL-317] Each evidence_item MUST include linked_orders (array of order refs).
[RULE][REP-EL-318] Each evidence_item MUST include admissibility_status ∈ {clean, conditional, contested}.
[RULE][REP-EL-319] IF admissibility_status != clean THEN admissibility_notes MUST be present and non_empty.

[FORBIDDEN][REP-EL-320] EL MUST NOT contain causal conclusions.

---

### 5. Causal Map (CM) schema

[RULE][REP-CM-400] IF artifact_type = CM THEN intent MUST be testable_causal_structure_from_evidence.
[RULE][REP-CM-401] CM MUST include both claims and tests.

[RULE][REP-CM-410] Allowed CM node types MUST be {cause, mechanism, consequence, counterfactual, test}.
[RULE][REP-CM-411] Each CM claim MUST include {claim_id, type, claim_text, evidence_refs, confidence, open_questions}.
[RULE][REP-CM-412] IF claim.type = mechanism THEN claim MUST include {owner, formal_basis}.
[RULE][REP-CM-413] formal_basis ∈ {law, contract, standard, exception}.
[RULE][REP-CM-414] Each CM test MUST include {test_id, counterfactual, method, required_evidence_refs, status}.

[FORBIDDEN][REP-CM-420] CM MUST NOT assert causality without evidence_refs.
[FORBIDDEN][REP-CM-421] CM MUST NOT use correlation_implies_cause without explicit tests.

---

### 6. Findings Memo (FM) schema

[RULE][REP-FM-500] IF artifact_type = FM THEN intent MUST be concise_memo_for_leadership_or_regulator.
[RULE][REP-FM-501] FM MUST reference CM and EL via attachments or explicit refs.
[RULE][REP-FM-502] FM MUST include summary.established (array).
[RULE][REP-FM-503] FM MUST include summary.not_established (array; empty allowed but MUST exist).
[RULE][REP-FM-504] FM MUST include requested_actions (array).
[RULE][REP-FM-505] FM MUST include gaps_in_causality; omission MUST be treated as manipulation_risk.

---

### 7. Remedy Package (RP) schema

[RULE][REP-RP-600] IF artifact_type = RP THEN intent MUST be measurable_corrective_measures_with_verification.
[RULE][REP-RP-601] RP MUST include measures[] with {measure_id, type, description, owner, verification}.
[RULE][REP-RP-602] Each measure.verification MUST include {window, criteria_list}.
[RULE][REP-RP-603] IF rollback_conditions_exist = true THEN rollback_conditions MUST be explicit signals.
[RULE][REP-RP-604] IF liability_shifted = true THEN liability_owner MUST be explicit.

[FORBIDDEN][REP-RP-605] RP MUST NOT contain non_checkable measures (do_better).

---

### 8. Public/Restricted Summary (PRS) schema

[RULE][REP-PRS-700] PRS MUST be created ONLY IF case_has_public_significance OR political_risk.
[RULE][REP-PRS-701] PRS public_part MUST include {what_happened, actions_taken, guarantees}.
[RULE][REP-PRS-702] PRS restricted_annex MUST include {EL_full_refs, CM_full_refs, signer_identities, sensitive_details_when_applicable}.

[FORBIDDEN][REP-PRS-703] PRS public_part MUST NOT disclose sensitive operational details.

---

### 9. Scene excerpt rules (packing)

[RULE][REP-SCN-800] A scene MAY display only 1..2 excerpt_items from {header_fields, one_EL_item, one_CM_claim, one_FM_requested_action}.
[RULE][REP-SCN-801] Scene emphasis MUST be paper_as_constraint.
[RULE][REP-SCN-802] IF no_order = true THEN no_procedural_action_claim MAY be asserted.
[RULE][REP-SCN-803] IF no_EL_refs = true THEN no_accusation_claim MAY be asserted.
[RULE][REP-SCN-804] IF admissibility_status ∈ {conditional, contested} THEN publication_or_enforcement MUST be procedurally blocked OR deferred.

[FORBIDDEN][REP-SCN-810] Scenes MUST NOT include full artifact bodies; only excerpts allowed.

---

## USAGE / RESOLUTION

[DECISION][REP-USE-900] Downstream scene generation MUST treat these rules as canonical format constraints for any shown OSA paperwork.
[DECISION][REP-USE-901] IF a scene introduces an OSA claim THEN output MUST include EL evidence_id(s) and linked order/method basis.
[DECISION][REP-USE-902] IF scope touches extraterritorial zone THEN output MUST include jurisdiction and admissibility_basis including JAP or contract as applicable.
[DECISION][REP-USE-903] IF mandatory header fields cannot be satisfied THEN no artifact excerpt MUST be produced in-scene.
[DECISION][REP-USE-904] Conflict resolution MUST follow SPEC-PRIORITY-RESOLUTION-2215-0001.

---

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-REPORTS-GLOBAL-2215-0006
role_type: RULE
export:
  - rule_id: REP-HDR-100
    intent: "Artifact must include mandatory header"
    inputs: [header]
    outputs: [artifact_valid]
  - rule_id: REP-EL-318
    intent: "Evidence item must declare admissibility status"
    inputs: [admissibility_status]
    outputs: [evidence_item_valid]
  - rule_id: REP-CM-411
    intent: "CM claim must bind to evidence refs and confidence"
    inputs: [claim_id, evidence_refs, confidence]
    outputs: [cm_claim_valid]
  - rule_id: REP-SCN-800
    intent: "Scene excerpt density limited to avoid infodump"
    inputs: [scene_artifact_excerpts]
    outputs: [scene_compliance]
~~~

---

## FORBIDDEN

[FORBIDDEN][REP-FBD-950] Introducing new SSOT metrics or macro numbers inside artifacts.
[FORBIDDEN][REP-FBD-951] Using narrative prose to justify formats or decisions.
[FORBIDDEN][REP-FBD-952] Showing full-length artifacts in scenes instead of excerpts.
[FORBIDDEN][REP-FBD-953] Omitting chain-of-custody when an excerpt is used as evidence.
[FORBIDDEN][REP-FBD-954] Claiming causality in CM without EL evidence_refs and tests structure.

---

## NON-NORMATIVE

~~~json
{
  "header": {
    "case_id": "OSA-2215-RU-16-0007",
    "artifact_id": "OSA-2215-RU-16-0007-CD-01",
    "artifact_type": "CD",
    "classification": "restricted",
    "created_at": "2215-05-18T14:22:00+03:00",
    "created_by": { "role": "CaseLead", "name": "..." },
    "mandate_refs": ["MANDATE-..."],
    "order_refs": ["O-01-DPO-...", "O-03-SIO-..."],
    "scope": "RU-16/CHELNY/Node-X/Perimeter-Y",
    "hash": "sha256:...",
    "attachments": ["OSA-2215-RU-16-0007-EL-01"],
    "jurisdiction": "normal",
    "admissibility_basis": "law"
  },
  "timeline": [
    {
      "ts": "2215-05-18T09:10:00+03:00",
      "type": "intake",
      "summary": "Inbound anomaly signal ...",
      "decision": "Start triage",
      "actors": ["CaseLead", "SystemsAuditor"]
    }
  ]
}
~~~

~~~json
{
  "header": {
    "case_id": "OSA-2215-RU-16-0007",
    "artifact_id": "OSA-2215-RU-16-0007-EL-01",
    "artifact_type": "EL",
    "classification": "restricted",
    "created_at": "2215-05-18T15:05:00+03:00",
    "created_by": { "role": "FieldCustodian", "name": "..." },
    "mandate_refs": ["MANDATE-..."],
    "order_refs": ["O-01-DPO-...", "O-04-ISO-..."],
    "scope": "RU-16/CHELNY/Node-X/Data-Infra",
    "hash": "sha256:...",
    "attachments": [],
    "jurisdiction": "mixed",
    "admissibility_basis": "JAP"
  },
  "items": [
    {
      "evidence_id": "E-001",
      "type": "log_bundle",
      "source": { "entity": "Operator-X", "system": "SCADA-GW-3", "zone": "Z1" },
      "collected_at": "2215-05-18T14:50:00+03:00",
      "collected_by": { "role": "SystemsAuditor", "name": "..." },
      "method": "snapshot + hash + sealed export",
      "integrity": { "hash": "sha256:...", "signature": "sig:..." },
      "linked_orders": ["O-01-DPO-...", "O-04-ISO-..."],
      "custody_chain": [
        { "ts": "2215-05-18T14:52:00+03:00", "event": "sealed", "by": "FieldCustodian" }
      ],
      "admissibility_status": "conditional",
      "admissibility_notes": ["Extraterritorial zone; admissibility depends on JAP execution"]
    }
  ]
}
~~~
