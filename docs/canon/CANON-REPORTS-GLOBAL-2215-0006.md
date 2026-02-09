---
id: CANON-REPORTS-GLOBAL-2215-0006
title: >
  Артефакты ФССУ — форматы отчётов, реестров и причинных карт (2215)
class: canon
status: draft
version: 0.3.1
prefix: REP
doc_language: en-US
prose_language: ru-RU
inputs:
  - CANON-ORDERS-GLOBAL-2215-0003
  - CANON-FSSU-GLOBAL-2215-0005
  - CANON-ZONES-GLOBAL-2215-0004
depends_on:
  - SPEC-DOC_STYLE-2215-0001
  - SPEC-PRIORITY_RESOLUTION-2215-0001
scope: >
  RULE-канон форматов артефактов ФССУ: минимально достаточные структуры для сцен,
  обязательные поля, связи с ордерами/мандатами, и правила допустимости (chain-of-custody).
  Без новых SSOT-метрик и без художественного текста.
---

## LLM-INTENT

ROLE_TYPE: RULE
SCOPE: define mandatory structures and admissibility rules for FSSU case artifacts (CD/EL/CM/FM/RP/PRS)
INPUTS:
  - CANON-FSSU-GLOBAL-2215-0005
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

## DEFINITIONS

[FACT][REP-010] `artifact_type` ∈ {CD, EL, CM, FM, RP, PRS}.
[FACT][REP-011] `CD` = Case Docket; timeline of actions/decisions for a case.
[FACT][REP-012] `EL` = Evidence Ledger; registry of evidence items with integrity and custody.
[FACT][REP-013] `CM` = Causal Map; claim graph CAUSE → MECHANISM → CONSEQUENCE with tests/counterfactuals.
[FACT][REP-014] `FM` = Findings Memo; memo summarizing established/not-established and requested actions.
[FACT][REP-015] `RP` = Remedy Package; measurable corrective measures with monitoring.
[FACT][REP-016] `PRS` = Public/Restricted Summary; public summary plus restricted annex when required.

[FACT][REP-017] `jurisdiction` ∈ {NORMAL, EXTRATERRITORIAL, MIXED}.
[FACT][REP-018] `classification` ∈ {PUBLIC, RESTRICTED, SECRET}.
[FACT][REP-019] `admissibility_status` ∈ {CLEAN, CONDITIONAL, CONTESTED}.
[FACT][REP-020] `admissibility_basis` ∈ {LAW, CONTRACT, JAP, EMERGENCY}.

[FACT][REP-021] `present(x)` = x exists AND x is non_empty.
[FACT][REP-022] `non_empty(x)` = x is not null AND x != "" AND (if x is list then len(x) > 0).

[FACT][REP-023] `case_id` = header.case_id string.
[FACT][REP-024] `artifact_id` = header.artifact_id string.
[FACT][REP-025] `artifact_serial` = two-digit string matching `^[0-9]{2}$`.
[FACT][REP-026] `evidence_id` = string matching `^E-[0-9]{3}$`.

[FACT][REP-027] `case_id.regex` = `^FSSU-2215-[A-Z]{2}-[0-9]{2}-[0-9]{4}$`.
[FACT][REP-028] `artifact_id.regex` = `^FSSU-2215-[A-Z]{2}-[0-9]{2}-[0-9]{4}-(CD|EL|CM|FM|RP|PRS)-[0-9]{2}$`.

[FACT][REP-029] `order_ref` = string token referencing an order identifier from `CANON-ORDERS-GLOBAL-2215-0003`.
[FACT][REP-030] `mandate_ref` = string token referencing a mandate identifier from `CANON-ORDERS-GLOBAL-2215-0003`.

[FACT][REP-031] `artifact_ref` = string matching `artifact_id.regex`.
[FACT][REP-032] `evidence_ref` = string `<EL_ARTIFACT_ID>#<EVIDENCE_ID>` where EL_ARTIFACT_ID matches `artifact_id.regex` AND ends with `-EL-<artifact_serial>` AND EVIDENCE_ID matches `evidence_id`.
[FACT][REP-033] `attachments` = header.attachments list where every item is either artifact_ref or evidence_ref.

[FACT][REP-034] `header` = object with mandatory fields defined by rules REP-100..REP-112.
[FACT][REP-035] `scope` = header.scope string (explicit perimeter string; non_empty).

[FACT][REP-036] `integrity_fixation_present` = bool: artifact must carry header.hash fixation when true.
[FACT][REP-037] `scope_touches_zone` = bool: scope crosses or touches any zone boundary (see `CANON-ZONES-GLOBAL-2215-0004`).
[FACT][REP-038] `JAP_required` = bool: admissibility requires JAP basis when true.
[FACT][REP-039] `full_artifact_body_shown` = bool: a scene shows a full artifact body (not excerpt) when true.

[FACT][REP-040] `evidence_item` = EL.items[] entry with evidence_id, integrity, custody_chain, and linked_orders.
[FACT][REP-041] `linked_orders` = list of order_ref.
[FACT][REP-042] `chain_of_custody` = ordered list of custody events for an evidence_item.

[FACT][REP-043] `scene_artifact_excerpts` = list of excerpt_item shown in a scene (empty list means “no excerpts”).
[FACT][REP-044] `scene_artifact_excerpts.count` = len(scene_artifact_excerpts).

[FACT][REP-045] `excerpt_item_type` ∈ {HEADER_FIELDS, ONE_EL_ITEM, ONE_CM_CLAIM, ONE_FM_REQUESTED_ACTION}.
[FACT][REP-046] `excerpt_item` = object {type: excerpt_item_type, ref: string}.
[FACT][REP-047] `paper_as_constraint_emphasis` = bool: scene enforces paperwork as constraint when true.

[FACT][REP-048] `no_order` = bool: relevant order_refs are absent for the intended action.
[FACT][REP-049] `no_EL_refs` = bool: relevant EL evidence_ref(s) are absent for the intended accusation/claim.
[FACT][REP-050] `no_procedural_action_claim_asserted` = bool: scene asserts “procedural action impossible due to no order”.
[FACT][REP-051] `no_accusation_claim_asserted` = bool: scene asserts “accusation impossible due to no EL refs”.

[FACT][REP-052] `publication_or_enforcement_attempted` = bool: scene attempts publish/enforce using conditional/contested evidence.
[FACT][REP-053] `publication_or_enforcement_blocked_or_deferred` = bool: attempted publish/enforce is blocked OR deferred by procedure.

[FACT][REP-054] `case_has_public_significance` = bool: case must have public summary when true.
[FACT][REP-055] `political_risk` = bool: political risk requires PRS when true.

[FACT][REP-056] `rollback_conditions_exist` = bool: RP contains rollback conditions when true.
[FACT][REP-057] `liability_shifted` = bool: RP shifts liability ownership when true.

[FACT][REP-058] `CM.node_type` ∈ {CAUSE, MECHANISM, CONSEQUENCE, COUNTERFACTUAL, TEST}.
[FACT][REP-059] `CM.formal_basis` ∈ {LAW, CONTRACT, STANDARD, EXCEPTION}.
[FACT][REP-060] `CM.confidence` ∈ {LOW, MEDIUM, HIGH}.

## INVARIANTS

[DECISION][REP-070] PASS IFF (status ∈ {draft, fixed, deprecated}); ELSE FAIL.
[DECISION][REP-071] PASS IFF (all applicable rules exported in OUTPUT CONTRACT are enforced by consumers); ELSE FAIL.
[DECISION][REP-072] PASS IFF (non_empty(header.mandate_refs) OR non_empty(header.order_refs)); ELSE FAIL.
[DECISION][REP-073] PASS IFF (full_artifact_body_shown = false); ELSE FAIL.
[DECISION][REP-074] PASS IFF (header.jurisdiction ∈ {NORMAL, EXTRATERRITORIAL, MIXED} AND header.admissibility_basis ∈ {LAW, CONTRACT, JAP, EMERGENCY}); ELSE FAIL.

## CONTENT

### 1. Global artifact header schema (applies to all artifact types)

[RULE][REP-100] PASS IFF present(header.case_id); ELSE FAIL.
[RULE][REP-101] PASS IFF present(header.artifact_id); ELSE FAIL.
[RULE][REP-102] PASS IFF (header.artifact_type ∈ {CD, EL, CM, FM, RP, PRS}); ELSE FAIL.
[RULE][REP-103] PASS IFF (header.classification ∈ {PUBLIC, RESTRICTED, SECRET}); ELSE FAIL.
[RULE][REP-104] PASS IFF present(header.created_at); ELSE FAIL.
[RULE][REP-105] PASS IFF (present(header.created_by.role) AND present(header.created_by.name_or_identifier)); ELSE FAIL.
[RULE][REP-106] PASS IFF present(header.mandate_refs); ELSE FAIL.
[RULE][REP-107] PASS IFF present(header.order_refs); ELSE FAIL.
[RULE][REP-108] PASS IFF present(header.scope); ELSE FAIL.
[RULE][REP-109] PASS IFF (integrity_fixation_present = false) OR present(header.hash); ELSE FAIL.
[RULE][REP-110] PASS IFF present(header.attachments); ELSE FAIL.
[RULE][REP-111] PASS IFF (header.jurisdiction ∈ {NORMAL, EXTRATERRITORIAL, MIXED}); ELSE FAIL.
[RULE][REP-112] PASS IFF (header.admissibility_basis ∈ {LAW, CONTRACT, JAP, EMERGENCY}); ELSE FAIL.

[FORBIDDEN][REP-120] Omitting jurisdiction when scope touches a zone boundary or a regime holder boundary.
[FORBIDDEN][REP-121] Including narrative justification paragraphs in header; only minimal rationale fields allowed.

### 2. Identifier formats

[RULE][REP-130] PASS IFF (header.case_id matches REP-027.case_id.regex); ELSE FAIL.
[RULE][REP-131] PASS IFF (header.artifact_id matches REP-028.artifact_id.regex); ELSE FAIL.

### 3. Case Docket (CD) schema

[RULE][REP-200] IF header.artifact_type = CD THEN PASS IFF (present(intent) AND intent = TIMELINE_OF_ACTIONS_AND_RATIONALE); ELSE FAIL.
[RULE][REP-201] PASS IFF (action_not_recorded_in_CD = false) OR (action_procedurally_vulnerable = true); ELSE FAIL.
[RULE][REP-202] IF header.artifact_type = CD THEN PASS IFF (every timeline_entry has {ts,type,summary,decision,actors}); ELSE FAIL.
[RULE][REP-203] IF header.artifact_type = CD THEN PASS IFF (for every timeline_entry where type = ORDER_ISSUED, present(order_ref) AND present(rationale_short)); ELSE FAIL.
[RULE][REP-204] IF header.artifact_type = CD THEN PASS IFF (exists a in header.attachments where a matches `.*-EL-[0-9]{2}$`); ELSE FAIL.
[RULE][REP-205] IF header.artifact_type = CD AND (scope_touches_zone = true OR JAP_required = true) THEN PASS IFF present(jurisdiction_note); ELSE FAIL.
[RULE][REP-206] IF header.artifact_type = CD AND (header.jurisdiction ∈ {EXTRATERRITORIAL, MIXED}) THEN PASS IFF present(JAP_requirement_or_admissibility_risk); ELSE FAIL.

### 4. Evidence Ledger (EL) schema

[RULE][REP-300] IF header.artifact_type = EL THEN PASS IFF (present(intent) AND intent = BIND_SOURCE_INTEGRITY_CUSTODY_ADMISSIBILITY); ELSE FAIL.
[RULE][REP-301] PASS IFF (claim_established = false) OR (EL_refs_missing = false); ELSE FAIL.

[RULE][REP-310] IF header.artifact_type = EL THEN PASS IFF (for every evidence_item, present(evidence_id) AND evidence_id matches REP-026.evidence_id); ELSE FAIL.
[RULE][REP-311] IF header.artifact_type = EL THEN PASS IFF (for every evidence_item, present(type)); ELSE FAIL.
[RULE][REP-312] IF header.artifact_type = EL THEN PASS IFF (for every evidence_item, present(source)); ELSE FAIL.
[RULE][REP-313] IF header.artifact_type = EL THEN PASS IFF (for every evidence_item, present(collected_at) AND present(collected_by.role) AND present(collected_by.name_or_identifier)); ELSE FAIL.
[RULE][REP-314] IF header.artifact_type = EL THEN PASS IFF (for every evidence_item, present(method)); ELSE FAIL.
[RULE][REP-315] IF header.artifact_type = EL THEN PASS IFF (for every evidence_item, present(integrity)); ELSE FAIL.
[RULE][REP-316] IF header.artifact_type = EL THEN PASS IFF (for every evidence_item, present(custody_chain) AND len(custody_chain) > 0); ELSE FAIL.
[RULE][REP-317] IF header.artifact_type = EL THEN PASS IFF (for every evidence_item, present(linked_orders) AND len(linked_orders) > 0); ELSE FAIL.
[RULE][REP-318] IF header.artifact_type = EL THEN PASS IFF (for every evidence_item, admissibility_status ∈ {CLEAN, CONDITIONAL, CONTESTED}); ELSE FAIL.
[RULE][REP-319] IF header.artifact_type = EL THEN PASS IFF (for every evidence_item where admissibility_status != CLEAN, present(admissibility_notes) AND len(admissibility_notes) > 0); ELSE FAIL.

[FORBIDDEN][REP-320] EL MUST NOT contain causal conclusions.

### 5. Causal Map (CM) schema

[RULE][REP-400] IF header.artifact_type = CM THEN PASS IFF (present(intent) AND intent = TESTABLE_CAUSAL_STRUCTURE_FROM_EVIDENCE); ELSE FAIL.
[RULE][REP-401] IF header.artifact_type = CM THEN PASS IFF (present(claims) AND present(tests)); ELSE FAIL.

[RULE][REP-410] IF header.artifact_type = CM THEN PASS IFF (every claim.type ∈ {CAUSE, MECHANISM, CONSEQUENCE, COUNTERFACTUAL, TEST}); ELSE FAIL.
[RULE][REP-411] IF header.artifact_type = CM THEN PASS IFF (every claim has {claim_id,type,claim_text,evidence_refs,confidence,open_questions}); ELSE FAIL.
[RULE][REP-412] IF header.artifact_type = CM THEN PASS IFF (for every claim where type = MECHANISM, present(owner) AND present(formal_basis)); ELSE FAIL.
[RULE][REP-413] IF header.artifact_type = CM THEN PASS IFF (formal_basis ∈ {LAW, CONTRACT, STANDARD, EXCEPTION}); ELSE FAIL.
[RULE][REP-414] IF header.artifact_type = CM THEN PASS IFF (every test has {test_id,counterfactual,method,required_evidence_refs,status}); ELSE FAIL.

[FORBIDDEN][REP-420] CM MUST NOT assert causality without evidence_refs.
[FORBIDDEN][REP-421] CM MUST NOT use correlation_implies_cause without explicit tests.

### 6. Findings Memo (FM) schema

[RULE][REP-500] IF header.artifact_type = FM THEN PASS IFF (present(intent) AND intent = CONCISE_MEMO_FOR_LEADERSHIP_OR_REGULATOR); ELSE FAIL.
[RULE][REP-501] IF header.artifact_type = FM THEN PASS IFF (exists a in header.attachments where a matches `.*-(CM|EL)-[0-9]{2}($|#)`); ELSE FAIL.
[RULE][REP-502] IF header.artifact_type = FM THEN PASS IFF present(summary.established); ELSE FAIL.
[RULE][REP-503] IF header.artifact_type = FM THEN PASS IFF present(summary.not_established); ELSE FAIL.
[RULE][REP-504] IF header.artifact_type = FM THEN PASS IFF present(requested_actions); ELSE FAIL.
[RULE][REP-505] IF header.artifact_type = FM THEN PASS IFF present(gaps_in_causality); ELSE FAIL.

### 7. Remedy Package (RP) schema

[RULE][REP-600] IF header.artifact_type = RP THEN PASS IFF (present(intent) AND intent = MEASURABLE_CORRECTIVE_MEASURES_WITH_VERIFICATION); ELSE FAIL.
[RULE][REP-601] IF header.artifact_type = RP THEN PASS IFF (present(measures) AND len(measures) > 0 AND every measure has {measure_id,type,description,owner,verification}); ELSE FAIL.
[RULE][REP-602] IF header.artifact_type = RP THEN PASS IFF (every measure.verification has {window,criteria_list}); ELSE FAIL.
[RULE][REP-603] IF header.artifact_type = RP THEN PASS IFF (rollback_conditions_exist = false) OR present(rollback_conditions); ELSE FAIL.
[RULE][REP-604] IF header.artifact_type = RP THEN PASS IFF (liability_shifted = false) OR present(liability_owner); ELSE FAIL.

[FORBIDDEN][REP-605] RP MUST NOT contain non_checkable measures (do_better).

### 8. Public/Restricted Summary (PRS) schema

[RULE][REP-700] IF header.artifact_type = PRS THEN PASS IFF (case_has_public_significance = true OR political_risk = true); ELSE FAIL.
[RULE][REP-701] IF header.artifact_type = PRS THEN PASS IFF (present(public_part.what_happened) AND present(public_part.actions_taken) AND present(public_part.guarantees)); ELSE FAIL.
[RULE][REP-702] IF header.artifact_type = PRS THEN PASS IFF (present(restricted_annex.EL_full_refs) AND present(restricted_annex.CM_full_refs) AND present(restricted_annex.signer_identities)); ELSE FAIL.

[FORBIDDEN][REP-703] PRS public_part MUST NOT disclose sensitive operational details.

### 9. Scene excerpt rules (packing)

[RULE][REP-800] PASS IFF (scene_artifact_excerpts.count = 0) OR (scene_artifact_excerpts.count ∈ [1,2] AND for every excerpt_item, excerpt_item.type ∈ {HEADER_FIELDS, ONE_EL_ITEM, ONE_CM_CLAIM, ONE_FM_REQUESTED_ACTION}); ELSE FAIL.
[RULE][REP-801] PASS IFF paper_as_constraint_emphasis = true; ELSE FAIL.
[RULE][REP-802] PASS IFF (no_procedural_action_claim_asserted = false) OR (no_order = true); ELSE FAIL.
[RULE][REP-803] PASS IFF (no_accusation_claim_asserted = false) OR (no_EL_refs = true); ELSE FAIL.
[RULE][REP-804] IF admissibility_status ∈ {CONDITIONAL, CONTESTED} AND publication_or_enforcement_attempted = true THEN PASS IFF publication_or_enforcement_blocked_or_deferred = true; ELSE FAIL.

[FORBIDDEN][REP-810] Scenes MUST NOT include full artifact bodies; only excerpts allowed.

## USAGE / RESOLUTION

[DECISION][REP-900] Consumers MUST treat only OUTPUT CONTRACT export as consumable semantics for this document; ELSE FAIL.
[DECISION][REP-901] PASS IFF (if a scene introduces an FSSU claim then evidence_ref(s) and order/method basis are present in shown excerpts); ELSE FAIL.
[DECISION][REP-902] PASS IFF (if scope touches extraterritorial zone then header.jurisdiction and header.admissibility_basis are present and admissibility_basis ∈ {JAP, CONTRACT} when applicable); ELSE FAIL.
[DECISION][REP-903] PASS IFF (if any mandatory header field cannot be satisfied then scene_artifact_excerpts.count = 0); ELSE FAIL.
[DECISION][REP-904] Conflict resolution MUST follow SPEC-PRIORITY_RESOLUTION-2215-0001; ELSE FAIL.

## OUTPUT CONTRACT

~~~yaml
doc_id: CANON-REPORTS-GLOBAL-2215-0006
role_type: RULE
export:
  - rule_id: REP-100
    intent: "header.case_id present"
    inputs: [header]
    outputs: [artifact_valid]
  - rule_id: REP-101
    intent: "header.artifact_id present"
    inputs: [header]
    outputs: [artifact_valid]
  - rule_id: REP-102
    intent: "header.artifact_type enum valid"
    inputs: [header]
    outputs: [artifact_valid]
  - rule_id: REP-103
    intent: "header.classification enum valid"
    inputs: [header]
    outputs: [artifact_valid]
  - rule_id: REP-104
    intent: "header.created_at present"
    inputs: [header]
    outputs: [artifact_valid]
  - rule_id: REP-105
    intent: "header.created_by fields present"
    inputs: [header]
    outputs: [artifact_valid]
  - rule_id: REP-106
    intent: "header.mandate_refs present"
    inputs: [header]
    outputs: [artifact_valid]
  - rule_id: REP-107
    intent: "header.order_refs present"
    inputs: [header]
    outputs: [artifact_valid]
  - rule_id: REP-108
    intent: "header.scope present"
    inputs: [header]
    outputs: [artifact_valid]
  - rule_id: REP-109
    intent: "header.hash required when integrity_fixation_present"
    inputs: [header, integrity_fixation_present]
    outputs: [artifact_valid]
  - rule_id: REP-110
    intent: "header.attachments present"
    inputs: [header]
    outputs: [artifact_valid]
  - rule_id: REP-111
    intent: "header.jurisdiction enum valid"
    inputs: [header]
    outputs: [artifact_valid]
  - rule_id: REP-112
    intent: "header.admissibility_basis enum valid"
    inputs: [header]
    outputs: [artifact_valid]
  - rule_id: REP-130
    intent: "case_id format valid"
    inputs: [header.case_id]
    outputs: [artifact_valid]
  - rule_id: REP-131
    intent: "artifact_id format valid"
    inputs: [header.artifact_id]
    outputs: [artifact_valid]
  - rule_id: REP-200
    intent: "CD intent present and correct"
    inputs: [artifact]
    outputs: [cd_valid]
  - rule_id: REP-202
    intent: "CD timeline_entry required fields"
    inputs: [artifact.timeline]
    outputs: [cd_valid]
  - rule_id: REP-203
    intent: "CD order_issued entries have order_ref and rationale_short"
    inputs: [artifact.timeline]
    outputs: [cd_valid]
  - rule_id: REP-204
    intent: "CD references EL via attachments"
    inputs: [header.attachments]
    outputs: [cd_valid]
  - rule_id: REP-205
    intent: "CD has jurisdiction_note when zone/JAP involved"
    inputs: [artifact, scope_touches_zone, JAP_required]
    outputs: [cd_valid]
  - rule_id: REP-206
    intent: "CD has JAP risk note under extraterritorial/mixed"
    inputs: [artifact, header.jurisdiction]
    outputs: [cd_valid]
  - rule_id: REP-300
    intent: "EL intent present and correct"
    inputs: [artifact]
    outputs: [el_valid]
  - rule_id: REP-310
    intent: "EL evidence_id format"
    inputs: [artifact.items]
    outputs: [el_valid]
  - rule_id: REP-311
    intent: "EL item type present"
    inputs: [artifact.items]
    outputs: [el_valid]
  - rule_id: REP-312
    intent: "EL source present"
    inputs: [artifact.items]
    outputs: [el_valid]
  - rule_id: REP-313
    intent: "EL collected_at/by present"
    inputs: [artifact.items]
    outputs: [el_valid]
  - rule_id: REP-314
    intent: "EL method present"
    inputs: [artifact.items]
    outputs: [el_valid]
  - rule_id: REP-315
    intent: "EL integrity present"
    inputs: [artifact.items]
    outputs: [el_valid]
  - rule_id: REP-316
    intent: "EL custody_chain present and non-empty"
    inputs: [artifact.items]
    outputs: [el_valid]
  - rule_id: REP-317
    intent: "EL linked_orders present and non-empty"
    inputs: [artifact.items]
    outputs: [el_valid]
  - rule_id: REP-318
    intent: "EL admissibility_status enum valid"
    inputs: [artifact.items]
    outputs: [el_valid]
  - rule_id: REP-319
    intent: "EL conditional/contested requires admissibility_notes"
    inputs: [artifact.items]
    outputs: [el_valid]
  - rule_id: REP-400
    intent: "CM intent present and correct"
    inputs: [artifact]
    outputs: [cm_valid]
  - rule_id: REP-401
    intent: "CM contains claims and tests"
    inputs: [artifact]
    outputs: [cm_valid]
  - rule_id: REP-410
    intent: "CM claim node types enum valid"
    inputs: [artifact.claims]
    outputs: [cm_valid]
  - rule_id: REP-411
    intent: "CM claim required fields include evidence_refs and confidence"
    inputs: [artifact.claims]
    outputs: [cm_valid]
  - rule_id: REP-412
    intent: "CM mechanism claims include owner and formal_basis"
    inputs: [artifact.claims]
    outputs: [cm_valid]
  - rule_id: REP-413
    intent: "CM formal_basis enum valid"
    inputs: [artifact.claims]
    outputs: [cm_valid]
  - rule_id: REP-414
    intent: "CM test required fields"
    inputs: [artifact.tests]
    outputs: [cm_valid]
  - rule_id: REP-500
    intent: "FM intent present and correct"
    inputs: [artifact]
    outputs: [fm_valid]
  - rule_id: REP-501
    intent: "FM references CM/EL via attachments"
    inputs: [header.attachments]
    outputs: [fm_valid]
  - rule_id: REP-502
    intent: "FM summary.established present"
    inputs: [artifact.summary]
    outputs: [fm_valid]
  - rule_id: REP-503
    intent: "FM summary.not_established present"
    inputs: [artifact.summary]
    outputs: [fm_valid]
  - rule_id: REP-504
    intent: "FM requested_actions present"
    inputs: [artifact.requested_actions]
    outputs: [fm_valid]
  - rule_id: REP-505
    intent: "FM gaps_in_causality present"
    inputs: [artifact.gaps_in_causality]
    outputs: [fm_valid]
  - rule_id: REP-600
    intent: "RP intent present and correct"
    inputs: [artifact]
    outputs: [rp_valid]
  - rule_id: REP-601
    intent: "RP measures schema"
    inputs: [artifact.measures]
    outputs: [rp_valid]
  - rule_id: REP-602
    intent: "RP verification schema"
    inputs: [artifact.measures]
    outputs: [rp_valid]
  - rule_id: REP-603
    intent: "RP rollback conditions explicit when present"
    inputs: [artifact, rollback_conditions_exist]
    outputs: [rp_valid]
  - rule_id: REP-604
    intent: "RP liability owner explicit when shifted"
    inputs: [artifact, liability_shifted]
    outputs: [rp_valid]
  - rule_id: REP-700
    intent: "PRS allowed only under public significance or political risk"
    inputs: [artifact, case_has_public_significance, political_risk]
    outputs: [prs_valid]
  - rule_id: REP-701
    intent: "PRS public_part required fields"
    inputs: [artifact.public_part]
    outputs: [prs_valid]
  - rule_id: REP-702
    intent: "PRS restricted_annex required fields"
    inputs: [artifact.restricted_annex]
    outputs: [prs_valid]
  - rule_id: REP-800
    intent: "Scene excerpt density limited"
    inputs: [scene_artifact_excerpts]
    outputs: [scene_compliance]
  - rule_id: REP-801
    intent: "Scene emphasis paper_as_constraint"
    inputs: [paper_as_constraint_emphasis]
    outputs: [scene_compliance]
  - rule_id: REP-802
    intent: "No-order claim allowed only if no_order=true"
    inputs: [no_procedural_action_claim_asserted, no_order]
    outputs: [scene_compliance]
  - rule_id: REP-803
    intent: "No-EL-refs accusation claim allowed only if no_EL_refs=true"
    inputs: [no_accusation_claim_asserted, no_EL_refs]
    outputs: [scene_compliance]
  - rule_id: REP-804
    intent: "Conditional/contested blocks or defers publish/enforcement"
    inputs: [admissibility_status, publication_or_enforcement_attempted, publication_or_enforcement_blocked_or_deferred]
    outputs: [scene_compliance]
~~~

## FORBIDDEN

[FORBIDDEN][REP-950] Introducing new SSOT metrics or macro numbers inside artifacts.
[FORBIDDEN][REP-951] Using narrative prose to justify formats or decisions.
[FORBIDDEN][REP-952] Showing full-length artifacts in scenes instead of excerpts.
[FORBIDDEN][REP-953] Omitting chain-of-custody when an excerpt is used as evidence.
[FORBIDDEN][REP-954] Claiming causality in CM without EL evidence_refs and tests structure.

## NON-NORMATIVE

~~~json
{
  "intent": "TIMELINE_OF_ACTIONS_AND_RATIONALE",
  "header": {
    "case_id": "FSSU-2215-RU-16-0007",
    "artifact_id": "FSSU-2215-RU-16-0007-CD-01",
    "artifact_type": "CD",
    "classification": "RESTRICTED",
    "created_at": "2215-05-18T14:22:00+03:00",
    "created_by": { "role": "CASE_LEAD", "name_or_identifier": "..." },
    "mandate_refs": ["MANDATE-..."],
    "order_refs": ["O-01-DPO-...", "O-03-SIO-..."],
    "scope": "RU-16/CHELNY/Node-X/Perimeter-Y",
    "hash": "sha256:...",
    "attachments": ["FSSU-2215-RU-16-0007-EL-01"],
    "jurisdiction": "NORMAL",
    "admissibility_basis": "LAW"
  },
  "timeline": [
    {
      "ts": "2215-05-18T09:10:00+03:00",
      "type": "INTAKE",
      "summary": "Inbound anomaly signal ...",
      "decision": "Start triage",
      "actors": ["CASE_LEAD", "SYSTEMS_AUDITOR"]
    }
  ]
}
~~~

~~~json
{
  "intent": "BIND_SOURCE_INTEGRITY_CUSTODY_ADMISSIBILITY",
  "header": {
    "case_id": "FSSU-2215-RU-16-0007",
    "artifact_id": "FSSU-2215-RU-16-0007-EL-01",
    "artifact_type": "EL",
    "classification": "RESTRICTED",
    "created_at": "2215-05-18T15:05:00+03:00",
    "created_by": { "role": "FIELD_CUSTODIAN", "name_or_identifier": "..." },
    "mandate_refs": ["MANDATE-..."],
    "order_refs": ["O-01-DPO-...", "O-04-ISO-..."],
    "scope": "RU-16/CHELNY/Node-X/Data-Infra",
    "hash": "sha256:...",
    "attachments": [],
    "jurisdiction": "MIXED",
    "admissibility_basis": "JAP"
  },
  "items": [
    {
      "evidence_id": "E-001",
      "type": "LOG_BUNDLE",
      "source": { "entity": "Operator-X", "system": "SCADA-GW-3", "zone": "Z1" },
      "collected_at": "2215-05-18T14:50:00+03:00",
      "collected_by": { "role": "SYSTEMS_AUDITOR", "name_or_identifier": "..." },
      "method": "snapshot + hash + sealed export",
      "integrity": { "hash": "sha256:...", "signature": "sig:..." },
      "linked_orders": ["O-01-DPO-...", "O-04-ISO-..."],
      "custody_chain": [
        { "ts": "2215-05-18T14:52:00+03:00", "event": "SEALED", "by": "FIELD_CUSTODIAN" }
      ],
      "admissibility_status": "CONDITIONAL",
      "admissibility_notes": ["Extraterritorial zone; admissibility depends on JAP execution"]
    }
  ]
}
~~~
