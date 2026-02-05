---
id: IDX-CORPUS-0001
title: "Corpus Registry"
class: idx
status: draft
version: 0.1.0
inputs: []
depends_on: []
scope: "Реестр всех документов корпуса: роли, статусы, зависимости."
---

## Registry

| id | file | class | status | version | inputs | notes |
| -- | ---- | ----- | ------ | ------- | ------ | ----- |
| WORLD-DOC-1 | docs/00-ssot/WORLD-DOC-1.md | ssot | draft | 0.1.0 | — | macro truth |
| WORLD-DOC-2 | docs/00-ssot/WORLD-DOC-2-ADDENDUM.md | override | draft | 0.1.0 | WORLD-DOC-1 | override rules |
| PHYSICAL-BASELINE-2215-0001 | docs/01-baselines/PHYSICAL-BASELINE-2215-0001.md | baseline | fixed | 1.0.0 | WORLD-DOC-1,WORLD-DOC-2,PHYS-REPORT-0 | executable defaults |
| WORLD-DOC-1 | docs/00-ssot/WORLD-DOC-1.md | ssot | draft | 0.1.0 | — | macro truth |
| WORLD-DOC-2 | docs/00-ssot/WORLD-DOC-2-ADDENDUM.md | override | draft | 0.1.0 | WORLD-DOC-1 | override |
| PHYS-REPORT-0 | docs/02-reports/PHYS-REPORT-0.md | report | draft | 0.1.0 | — | physics report |
| PHYSICAL-BASELINE-2215-0001 | docs/01-baselines/PHYSICAL-BASELINE-2215-0001.md | baseline | fixed | 1.0.0 | WORLD-DOC-1,WORLD-DOC-2,PHYS-REPORT-0 | executable defaults |
| CANON-BASE-0001 | docs/03-canon/CANON-BASE-0001.md | canon | draft | 0.1.0 | WORLD-DOC-1,WORLD-DOC-2 | derived canon |
| CANON-CONFLICT-0001 | docs/03-canon/CANON-CONFLICT-0001.md | canon | draft | 0.1.0 | WORLD-DOC-1,WORLD-DOC-2 | tensions registry |
| CANON-SYSTEMS-0001 | docs/03-canon/CANON-SYSTEMS-0001.md | canon | draft | 0.1.0 | WORLD-DOC-1,WORLD-DOC-2 | systems |
| CANON-CAST-0001 | docs/03-canon/CANON-CAST-0001.md | canon | draft | 0.1.0 | WORLD-DOC-1,WORLD-DOC-2 | cast |
| STORY-SKELETON-0001 | docs/04-plans/STORY-SKELETON-0001.md | plan | draft | 0.1.0 | CANON-BASE-0001,CANON-SYSTEMS-0001,CANON-CAST-0001 | plan |
| SCENE-ACT-01-0001 | docs/05-scenes/SCENE-ACT-01-0001.md | scene | draft | 0.1.0 | STORY-SKELETON-0001,PHYSICAL-BASELINE-2215-0001 | act 1 |
| SCENE-ACT-02-0001 | docs/05-scenes/SCENE-ACT-02-0001.md | scene | draft | 0.1.0 | STORY-SKELETON-0001,PHYSICAL-BASELINE-2215-0001 | act 2 |
| SCENE-ACT-03-0001 | docs/05-scenes/SCENE-ACT-03-0001.md | scene | draft | 0.1.0 | STORY-SKELETON-0001,PHYSICAL-BASELINE-2215-0001 | act 3 |
| SCENE-ACT-04-0001 | docs/05-scenes/SCENE-ACT-04-0001.md | scene | draft | 0.1.0 | STORY-SKELETON-0001,PHYSICAL-BASELINE-2215-0001 | act 4 |
| SCENE-ACT-05-0001 | docs/05-scenes/SCENE-ACT-05-0001.md | scene | draft | 0.1.0 | STORY-SKELETON-0001,PHYSICAL-BASELINE-2215-0001 | act 5 |
