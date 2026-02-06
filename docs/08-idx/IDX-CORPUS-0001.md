---
id: IDX-CORPUS-0001
title: >
  Corpus Registry
class: idx
status: draft
version: 0.1.0
inputs: []
depends_on: []
scope: >
  Реестр всех документов корпуса: роли, статусы, зависимости.
---

## RULES

- [DECISION][CORP-010] IDX-CORPUS is normative for corpus membership.
- [DECISION][CORP-011] A doc is considered part of the corpus IFF it is present in the Registry table.
- [DECISION][CORP-012] Lint MUST fail if:
  - any referenced `depends_on` id is missing from Registry, OR
  - any `status: fixed` doc is missing from Registry.

## Registry

| id | file | class | status | version | inputs | notes |
| -- | ---- | ----- | ------ | ------- | ------ | ----- |
| BASELINE-DAILY-OPS-2215-0002 | docs/01-baselines/BASELINE-DAILY-OPS-2215-0002.md | baseline | draft | 1.1.0 | — | |
| BASELINE-PHYSICAL-LEVEL-MID-2215-0001 | docs/01-baselines/BASELINE-PHYSICAL-LEVEL-MID-2215-0001.md | baseline | fixed | 1.1.0 | — | |
| BASELINE-PSYCH-2215-0001 | docs/01-baselines/BASELINE-PSYCH-2215-0001.md | baseline | fixed | 1.3.0 | — | |
| BASELINE-SOCIAL-CIVIC-2215-0001 | docs/01-baselines/BASELINE-SOCIAL-CIVIC-2215-0001.md | baseline | fixed | 1.1.0 | — | |
| CANON-2215-CORE-0001 | docs/03-canon/CANON-2215-CORE-0001.md | canon | fixed | 1.2.0 | — | |
| CANON-ARTIFACT-SNIPPETS-0001 | docs/03-canon/CANON-ARTIFACT-SNIPPETS-0001.md | canon | fixed | 1.1.0 | — | |
| CANON-BASE-NARRATIVE-0001 | docs/03-canon/CANON-BASE-NARRATIVE-0001.md | canon | fixed | 1.0.0 | — | |
| CANON-BASE-RULE-0001 | docs/03-canon/CANON-BASE-RULE-0001.md | canon | fixed | 1.0.0 | — | |
| CANON-CAST-0001 | docs/03-canon/CANON-CAST-0001.md | canon | fixed | 0.3.0 | WORLD-DOC-2 | |
| CANON-CAST-PUBLIC-2215-0001 | docs/03-canon/CANON-CAST-PUBLIC-2215-0001.md | canon | fixed | 1.1.0 | — | |
| CANON-CAST-VOICE-2215-0001 | docs/03-canon/CANON-CAST-VOICE-2215-0001.md | canon | fixed | 1.3.0 | — | |
| CANON-CITY-BOUNDARY-RU-2215-0008 | docs/03-canon/CANON-CITY-BOUNDARY-RU-2215-0008.md | canon | draft | 0.1.1 | — | |
| CANON-CITY-RU-2215-0007 | docs/03-canon/CANON-CITY-RU-2215-0007.md | canon | draft | 1.0.0 | — | |
| CANON-CONFLICT-0001 | docs/03-canon/CANON-CONFLICT-0001.md | canon | fixed | 1.1.0 | — | |
| CANON-LOC-CHELNY-2215-0001 | docs/03-canon/CANON-LOC-CHELNY-2215-0001.md | canon | draft | 0.2.0 | — | |
| CANON-METRICS-0002 | docs/03-canon/CANON-METRICS-0002.md | canon | draft | 2.2.0 | — | |
| CANON-ORDERS-0003 | docs/03-canon/CANON-ORDERS-0003.md | canon | draft | 1.1.0 | — | |
| CANON-ORGS-2215-0001 | docs/03-canon/CANON-ORGS-2215-0001.md | canon | fixed | 1.2.0 | — | |
| CANON-OSA-0005 | docs/03-canon/CANON-OSA-0005.md | canon | draft | 0.1.1 | — | |
| CANON-REPORTS-0006 | docs/03-canon/CANON-REPORTS-0006.md | canon | draft | 0.3.0 | — | |
| CANON-SYSTEMS-0001 | docs/03-canon/CANON-SYSTEMS-0001.md | canon | fixed | 1.1.0 | — | |
| CANON-SYSTEM-VOICE-0001 | docs/03-canon/CANON-SYSTEM-VOICE-0001.md | canon | draft | 0.3.0 | — | |
| CANON-VIBE-FLOW-0001 | docs/03-canon/CANON-VIBE-FLOW-0001.md | canon | draft | 1.0.0 | CANON-VIBE-RESTLESS-0001 | |
| CANON-VIBE-RESTLESS-0001 | docs/03-canon/CANON-VIBE-RESTLESS-0001.md | canon | draft | 0.1.0 | — | |
| CANON-VOCAB-2215-0001 | docs/03-canon/CANON-VOCAB-0001.md | canon | draft | 1.0.0 | — | |
| CANON-ZONES-0004 | docs/03-canon/CANON-ZONES-0004.md | canon | draft | 1.1.0 | — | |
| CITY-RULES-RU-2215-0001 | docs/03-canon/CITY-RULES-RU-2215-0001.md | canon | draft | 1.0.0 | — | |
| IDX-CORPUS-0001 | docs/08-idx/IDX-CORPUS-0001.md | idx | draft | 0.1.0 | — | |
| PLAN-DEFAULT-ENVIRONMENT-2215-0001 | docs/04-plans/PLAN-DEFAULT-ENVIRONMENT-2215-0001.md | plan | draft | 0.3.0 | — | |
| STORY-SKELETON-0001 | docs/04-plans/STORY-SKELETON-0001.md | plan | fixed | 0.2.0 | — | |
| SCENE-GEN-PROTOCOL-0001 | docs/05-scenes/SCENE-GEN-PROTOCOL-0001.md | protocol | fixed | 1.4.0 | — | |
| REG-TECH-2215-0001 | docs/06-registry/REG-TECH-2215-0001.md | registry | fixed | 0.3.0 | — | |
| REG-UNKNOWN-2215-0001 | docs/06-registry/REG-UNKNOWN-2215-0001.md | registry | draft | 1.0.0 | — | |
| SCENE-ACT-01-0001 | docs/05-scenes/SCENE-ACT-01-0001.md | scene | fixed | 1.1.0 | — | |
| SCENE-ACT-02-0001 | docs/05-scenes/SCENE-ACT-02-0001.md | scene | fixed | 0.2.0 | — | |
| SCENE-ACT-03-0001 | docs/05-scenes/SCENE-ACT-03-0001.md | scene | fixed | 0.2.0 | — | |
| SCENE-ACT-04-0001 | docs/05-scenes/SCENE-ACT-04-0001.md | scene | fixed | 0.2.0 | — | |
| SCENE-ACT-05-0001 | docs/05-scenes/SCENE-ACT-05-0001.md | scene | fixed | 0.2.0 | — | |
| PROTOCOL-CHAPTER-GENERATION-2215-0001 | docs/07-spec/PROTOCOL-CHAPTER-GENERATION-2215-0001.md | spec | draft | 1.0.0 | — | |
| SPEC-OVERRIDE-CHECKLIST-2215-0001 | docs/07-spec/SPEC-OVERRIDE-CHECKLIST-2215-0001.md | spec | draft | 1.0.0 | — | |
| SPEC-PRIORITY-RESOLUTION-2215-0001 | docs/07-spec/SPEC-PRIORITY-RESOLUTION-2215-0001.md | spec | fixed | 1.0.0 | — | |
| SPEC-QUALITATIVE-ENUMS-2215-0001 | docs/07-spec/SPEC-QUALITATIVE-ENUMS-2215-0001.md | spec | fixed | 1.0.0 | — | |
| SPEC-SCENE-CONTRACT-2215-0001 | docs/07-spec/SPEC-SCENE-CONTRACT-2215-0001.md | spec | draft | 1.0.0 | — | |
| SSOT-DOC-STYLE-2215-0001 | docs/00-ssot/SSOT-DOC-STYLE-2215-0001.md | spec | fixed | 1.0.1 | — | |
| SSOT-AUTOMATION-A-2215-0004 | docs/00-ssot/SSOT-AUTOMATION-A-2215-0004.md | ssot | draft | 1.1.0 | — | |
| SSOT-CLIMATE-A-2215-0004 | docs/00-ssot/SSOT-CLIMATE-A-2215-0004.md | ssot | draft | 1.1.0 | — | |
| SSOT-CONSISTENCY-A-2215-0009 | docs/00-ssot/SSOT-CONSISTENCY-A-2215-0009.md | ssot | draft | 1.1.0 | — | |
| SSOT-DEMOGRAPHY-A-2215-0002 | docs/00-ssot/SSOT-DEMOGRAPHY-A-2215-0002.md | ssot | draft | 1.1.0 | — | |
| SSOT-ECONOMY-A-2215-0003 | docs/00-ssot/SSOT-ECONOMY-A-2215-0003.md | ssot | draft | 1.1.0 | — | |
| SSOT-ENERGY-A-2215-0004 | docs/00-ssot/SSOT-ENERGY-A-2215-0004.md | ssot | draft | 1.1.0 | — | |
| SSOT-GOVERNANCE-SECURITY-A-2215-0005 | docs/00-ssot/SSOT-GOVERNANCE-SECURITY-A-2215-0005.md | ssot | draft | 1.1.0 | — | |
| SSOT-LAW-A-2215-0008 | docs/00-ssot/SSOT-LAW-A-2215-0008.md | ssot | fixed | 1.1.0 | — | |
| SSOT-LIFE-A-2215-0007 | docs/00-ssot/SSOT-LIFE-A-2215-0007.md | ssot | draft | 1.1.0 | — | |
| SSOT-SCENARIO-A-2215-0001 | docs/00-ssot/SSOT-SCENARIO-A-2215-0001.md | ssot | draft | 1.0.0 | — | |
| SSOT-SPACE-INDUSTRY-A-2215-0006 | docs/00-ssot/SSOT-SPACE-INDUSTRY-A-2215-0006.md | ssot | draft | 1.0.0 | — | |
| SSOT-URBANISM-A-2215-0007 | docs/00-ssot/SSOT-URBANISM-A-2215-0007.md | ssot | fixed | 1.1.0 | — | |
