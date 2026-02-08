---
id: REG-OSA-AUTO-LOWIMPACT-2215-0001
title: Registry — Low-Impact Incident Types for ГОРОД-2 Autonomous Execution
class: registry
status: draft
version: 1.0.0
doc_language: ru-RU
prose_language: ru-RU
scope: >
  Перечень типов инцидентов, для которых ГОРОД-2 выполняет автономные изменения
  без предварительного визирования человеком.
  Автономия разрешена только для записей со статусом FACT.
depends_on:
  - THESIS-OSA-ORG-2215-0001
---

## RULE

- [DECISION][R-010] ГОРОД-2 выполняет автономные изменения только для incident_type со статусом FACT в данном реестре.
- [DECISION][R-011] Для incident_type со статусом UNKNOWN автономные изменения запрещены.
- [DECISION][R-012] Любое автономное изменение ГОРОД-2 логируется и подлежит ретроспективному аудиту.

## ENTRIES

- [FACT][LI-001] incident_type: OBSERVABILITY_PIPELINE_BACKPRESSURE
- [FACT][LI-002] incident_type: LOG_INGESTION_SCHEMA_COMPAT_FIX
- [FACT][LI-003] incident_type: DASHBOARD_STALE_CACHE_INVALIDATION
- [FACT][LI-004] incident_type: NON_SAFETY_RATE_LIMIT_ADJUSTMENT
- [FACT][LI-005] incident_type: MODEL_JOB_RETRY_NON_SAFETY

- [UNKNOWN][LI-900] incident_type: (ADD_NEXT)
