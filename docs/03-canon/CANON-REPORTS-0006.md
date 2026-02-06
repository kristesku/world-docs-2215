---
id: CANON-REPORTS-0006
title: >
  Артефакты ОСА — форматы отчётов, реестров и причинных карт (2215)
class: canon
status: draft
version: 0.1.0
inputs:
  - CANON-OSA-0005
  - CANON-ORDERS-0003
  - CANON-ZONES-0004
depends_on: []
scope: >
  Канон форматов артефактов ОСА: какие документы/пакеты рождаются в ходе кейса,
  какие поля обязательны, как выглядит минимально достаточная структура для
  сцен (чтобы "показать бумагу" без инфодампа), и как обеспечивается
  допустимость доказательств (chain-of-custody). Внутри — только шаблоны
  и правила, без новых SSOT-метрик и без художественного текста.
---

## 0. Rules

- [DECISION] Каждый артефакт ОСА обязан быть:
  - конкретным (кейс, объект, периметр),
  - датированным,
  - подписанным (роль + полномочие),
  - связанным с ордерами/мандатами,
  - пригодным для проверки (auditability).
- [DECISION] Любой артефакт, содержащий утверждение о причинности,
  обязан ссылаться на доказательства (evidence items) с зафиксированной chain-of-custody.
- [DECISION] Артефакты ОСА существуют в условиях частично ограниченной юрисдикции
  (экстерритории, контрактные режимы, JAP), поэтому допустимость доказательств
  является отдельным предметом фиксации.
- [DECISION] В сценах допускается показывать только 10–20% артефакта;
  остальное присутствует как “есть приложение / есть реестр / в допуске”.

## 1. Набор артефактов (канонический минимум)

- [FACT] Case Docket (CD) — журнал кейса (таймлайн, ордера, действия, решения).
- [FACT] Evidence Ledger (EL) — реестр доказательств + chain-of-custody.
- [FACT] Causal Map (CM) — причинная карта CAUSE → MECHANISM → CONSEQUENCE + тесты.
- [FACT] Findings Memo (FM) — краткая записка “что мы считаем установленным”.
- [FACT] Remedy Package (RP) — пакет коррекции режима (требования/предписания/мониторинг).
- [FACT] Public/Restricted Summary (PRS) — публичная сводка + закрытое приложение (если применимо).

## 2. Общие заголовки и идентификаторы

### 2.1 Case identifiers

- [DECISION] Каждый кейс имеет идентификатор вида: `OSA-2215-<region>-<serial>`.
- [DECISION] Каждый артефакт имеет идентификатор вида:
  `<CASE_ID>-<ARTIFACT_TYPE>-<serial>`.

### 2.2 Minimal header block (applies to all artifacts)

- [DECISION] Минимальный набор полей:
  - `case_id`
  - `artifact_id`
  - `classification` (public/restricted/secret)
  - `created_at`
  - `created_by` (role + authority)
  - `mandate_refs` (ссылки на мандат)
  - `order_refs` (ссылки на ордера)
  - `scope` (периметр)
  - `hash` (для фиксации целостности, если применяется)
  - `attachments` (список приложений/ссылок на EL items)
  - `jurisdiction` (normal / extraterritorial / mixed)
  - `admissibility_basis` (law / contract / JAP / emergency)

## 3. Case Docket (CD) — журнал кейса

### 3.1 Purpose

- [FACT] CD фиксирует “что делали и почему” в процедурной последовательности.
- [DECISION] Если действие не попало в CD — его «как бы не было» (и оно уязвимо в споре).

### 3.2 Minimal structure (template)

~~~json
{
  "header": {
    "case_id": "OSA-2215-RU-16-0007",
    "artifact_id": "OSA-2215-RU-16-0007-CD-01",
    "classification": "restricted",
    "created_at": "2215-05-18T14:22:00+03:00",
    "created_by": { "role": "CaseLead", "name": "..." },
    "mandate_refs": ["MANDATE-..."],
    "order_refs": ["O-01-DPO-...", "O-03-SIO-..."],
    "scope": "Челны/узел X/периметр Y",
    "hash": "sha256:...",
    "attachments": ["OSA-2215-RU-16-0007-EL-01"]
  },
  "timeline": [
    {
      "ts": "2215-05-18T09:10:00+03:00",
      "type": "intake",
      "summary": "Входящий сигнал об аномалии ...",
      "decision": "Открыть triage",
      "actors": ["CaseLead", "SystemsAuditor"]
    },
    {
      "ts": "2215-05-18T12:40:00+03:00",
      "type": "order_issued",
      "summary": "Выпущен ордер на сохранение данных (DPO)",
      "order_ref": "O-01-DPO-...",
      "rationale": "Риск purge/rotation, расхождение телеметрии и поля"
    }
  ],
  "notes": [
    { "tag": "risk", "text": "Окно доступности логов ≤ 24ч" }
  ]
}
~~~

### 3.3 Scene usage

- [DECISION] В сцене показывается либо 1–2 записи таймлайна, либо “шапка + причина ордера”.
- [DECISION] CD никогда не заменяет EL: он указывает, где доказательства.

### 3.4 Jurisdiction notes

- [DECISION] CD обязан явно фиксировать:
  - тип юрисдикции (normal / extraterritorial),
  - наличие контрактных ограничений,
  - необходимость JAP / совместного протокола доступа.
- [DECISION] Отсутствие такой записи трактуется как процессуальный риск
  при последующей проверке.

## 4. Evidence Ledger (EL) — реестр доказательств + chain-of-custody

### 4.1 Purpose

- [FACT] EL связывает артефакты, источники и допустимость.
- [DECISION] Любое “установлено” без EL — юридически слабое.

### 4.2 Evidence item fields (mandatory)

- [DECISION] Каждый item обязан иметь:
  - `evidence_id`
  - `type` (log/config/snapshot/device/witness/contract/telemetry/etc.)
  - `source` (где получено)
  - `collected_at` / `collected_by`
  - `method` (как получено)
  - `integrity` (hash/signature/seal)
  - `custody_chain` (события доступа/копирования)
  - `admissibility_status` (clean / conditional / contested)
  - `admissibility_notes` (почему не clean, если применимо)
  - `linked_orders` (какими ордерами покрыто)

### 4.3 Minimal structure (template)

~~~json
{
  "header": {
    "case_id": "OSA-2215-RU-16-0007",
    "artifact_id": "OSA-2215-RU-16-0007-EL-01",
    "classification": "restricted",
    "created_at": "2215-05-18T15:05:00+03:00",
    "created_by": { "role": "FieldCustodian", "name": "..." },
    "mandate_refs": ["MANDATE-..."],
    "order_refs": ["O-01-DPO-...", "O-04-ISO-..."],
    "scope": "узел X / дата-инфра / периметр Y",
    "hash": "sha256:...",
    "attachments": []
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
        {
          "ts": "2215-05-18T14:52:00+03:00",
          "event": "sealed",
          "by": "FieldCustodian",
          "notes": "опечатано, передано в хранилище"
        }
      ],
      "admissibility_status": "conditional",
      "admissibility_notes": [
        "Экстерриториальная зона; допустимость зависит от выполнения JAP и совместного протокола доступа"
      ]
    }
  ]
}
~~~

## 5. Causal Map (CM) — причинная карта + тесты

### 5.1 Purpose

- [FACT] CM превращает набор доказательств в проверяемую причинность.
- [DECISION] CM обязана содержать не только “версию”, но и тесты/контрфакты.

### 5.2 Node types and constraints

- [DECISION] Допустимые узлы:
  - Cause (входные условия)
  - Mechanism (конкретный процесс/решение/конфигурация)
  - Consequence (измеримый эффект)
  - Counterfactual (что должно было бы быть, если версия ложна)
  - Test (как проверяем)
- [DECISION] Каждое утверждение в CM должно иметь:
  - `claim_id`
  - `claim_text`
  - `evidence_refs` (из EL)
  - `confidence` (low/med/high)
  - `open_questions` (если есть)
- [DECISION] Для узлов типа Mechanism обязательно указывается:
  - `owner` (кто контролирует механизм: орган / оператор / контур),
  - `formal_basis` (закон / контракт / стандарт / исключение).

### 5.3 Minimal structure (template)

~~~json
{
  "header": {
    "case_id": "OSA-2215-RU-16-0007",
    "artifact_id": "OSA-2215-RU-16-0007-CM-01",
    "classification": "restricted",
    "created_at": "2215-05-19T10:15:00+03:00",
    "created_by": { "role": "SystemsAuditor", "name": "..." },
    "mandate_refs": ["MANDATE-..."],
    "order_refs": ["O-02-TAO-...", "O-04-ISO-..."],
    "scope": "контур питания/перераспределения/узел X",
    "hash": "sha256:...",
    "attachments": ["OSA-2215-RU-16-0007-EL-01"]
  },
  "claims": [
    {
      "claim_id": "C-01",
      "type": "mechanism",
      "claim_text": "Алгоритм перераспределения мощности по KPI снижал приоритет узла X при пиковых нагрузках.",
      "evidence_refs": ["E-001", "E-004"],
      "confidence": "med",
      "open_questions": ["Кто утвердил профиль KPI-порогов?"]
      "owner": "Operator-Y",
      "formal_basis": "contract + KPI-profile"

    },
    {
      "claim_id": "C-02",
      "type": "consequence",
      "claim_text": "Узел X системно получал недопитание в 12 из 14 пиковых окон за 30 дней.",
      "evidence_refs": ["E-002"],
      "confidence": "high",
      "open_questions": []
    }
  ],
  "tests": [
    {
      "test_id": "T-01",
      "counterfactual": "Если проблема была физическим износом, деградация не коррелировала бы с KPI-окнами.",
      "method": "корреляция событий отказа с окнами KPI/пиками",
      "required_evidence_refs": ["E-001", "E-002"],
      "status": "planned"
    }
  ]
}
~~~

## 6. Findings Memo (FM) — краткая записка

### 6.1 Purpose

- [FACT] FM — документ для руководства/регулятора: «что установлено, что требуется».
- [DECISION] FM не спорит с CM; он ссылается на неё и на EL.
- [DECISION] Раздел `not_established` обязателен.
- [DECISION] FM не имеет права умалчивать о пробелах причинности;
  отсутствие пункта считается манипуляцией.

### 6.2 Minimal structure (template)

~~~json
{
  "header": {
    "case_id": "OSA-2215-RU-16-0007",
    "artifact_id": "OSA-2215-RU-16-0007-FM-01",
    "classification": "restricted",
    "created_at": "2215-05-20T09:00:00+03:00",
    "created_by": { "role": "CaseLead", "name": "..." },
    "mandate_refs": ["MANDATE-..."],
    "order_refs": ["O-06-TSRO-..."],
    "scope": "узел X / оператор Y",
    "hash": "sha256:...",
    "attachments": ["OSA-2215-RU-16-0007-CM-01", "OSA-2215-RU-16-0007-EL-01"]
  },
  "summary": {
    "established": [
      "Причинность: KPI-оптимизация → перераспределение мощности → деградация сервиса узла X",
      "Наблюдаемость: попытка фильтрации первичных логов до DPO"
    ],
    "not_established": [
      "Личный умысел подписанта профиля KPI (требуется отдельный допрос/доступ)"
    ],
    "risk": [
      "Повторение эффекта в соседних узлах при тех же порогах"
    ]
    
  },
  "requested_actions": [
    "Ввести временное ограничение режима перераспределения (TSRO)",
    "Назначить независимый аудит профиля KPI и исключений (override)",
    "Обязать оператора раскрыть первичные логи по JAP-окну"
  ]
}
~~~

## 7. Remedy Package (RP) — пакет коррекции режима

### 7.1 Purpose

- [FACT] RP — выход ОСА в систему: что меняем, кто подписывает, как мониторим.
- [DECISION] RP должен быть измеримым: критерии успешности и окно проверки.

### 7.2 Minimal structure (template)

- `rollback_conditions` (при каких сигналах мера отменяется)
- `liability_owner` (кто несёт ответственность при провале)

~~~json
{
  "header": {
    "case_id": "OSA-2215-RU-16-0007",
    "artifact_id": "OSA-2215-RU-16-0007-RP-01",
    "classification": "restricted",
    "created_at": "2215-05-21T13:30:00+03:00",
    "created_by": { "role": "ProtocolCounsel", "name": "..." },
    "mandate_refs": ["MANDATE-..."],
    "order_refs": ["O-06-TSRO-...", "O-07-JAPO-..."],
    "scope": "оператор Y / зона Z1",
    "hash": "sha256:...",
    "attachments": ["OSA-2215-RU-16-0007-FM-01"]
  },
  "measures": [
    {
      "measure_id": "M-01",
      "type": "service_restriction",
      "description": "Запрет перераспределения мощности по профилю KPI-α для узла X на 14 дней.",
      "owner": "Regulator-...",
      "verification": { "window_days": 14, "criteria": ["нет деградации в пиковые окна"] },
      "rollback_conditions": ["рост аварийности > baseline +5%"],
      "liability_owner": "Operator-Y (license clause 4.3)"

    },
    {
      "measure_id": "M-02",
      "type": "audit",
      "description": "Независимый аудит профиля KPI и исключений в зоне Z1.",
      "owner": "Arbitration-...",
      "verification": { "window_days": 30, "criteria": ["полная трассировка решений", "нет необъявленных слепых зон"] }
    }
  ]
}
~~~

## 8. Public/Restricted Summary (PRS)

- [DECISION] PRS создаётся, когда кейс имеет общественную значимость или политический риск.
- [DECISION] Публичная часть содержит:
  - что произошло (без чувствительных деталей),
  - какие меры приняты,
  - какие гарантии даны.
- [DECISION] Закрытая часть содержит:
  - полные ссылки на EL/CM,
  - имена подписантов,
  - конфиги/ключи/уязвимости,
  - детали зоны и арбитража.

~~~json
{
  "header": {
    "case_id": "OSA-2215-RU-16-0007",
    "artifact_id": "OSA-2215-RU-16-0007-PRS-01",
    "classification": "public+restricted",
    "created_at": "2215-05-22T08:00:00+03:00",
    "created_by": { "role": "CaseLead", "name": "..." },
    "mandate_refs": ["MANDATE-..."],
    "order_refs": [],
    "scope": "публичная сводка",
    "hash": "sha256:...",
    "attachments": ["OSA-2215-RU-16-0007-PRS-01-R (restricted annex)"]
  },
  "public_summary": {
    "what_happened": "Зафиксирована системная деградация сервиса узла X вследствие конфигурации режима перераспределения.",
    "actions_taken": ["Введены временные ограничения режима", "Назначен аудит"],
    "guarantees": ["Мониторинг 30 дней", "Публикация итогового отчёта после арбитража"]
  }
}
~~~

## 9. Scene packing guidelines (how to show without infodump)

- [DECISION] Для сцены достаточно 1–2 элементов:
  - шапка + одно поле (scope/order_refs),
  - один evidence item (E-xxx) с hash и custody событием,
  - один claim из CM,
  - один пункт requested_actions из FM.
- [DECISION] «Сила бумаги» показывается через ограничения:
  “без EL это развалится”, “без ISO не допустят”, “в зоне нужен JAP”.

### 9.1 Paper as obstacle (dramaturgical rule)

- [DECISION] Артефакты в сценах используются не как экспозиция,
  а как препятствие:
  - нет ордера → нельзя войти,
  - нет EL → нельзя обвинить,
  - contested admissibility → нельзя публиковать,
  - JAP не выполнен → данные “не существуют”.

## 10. Future hooks (расширение полномочий в следующих книгах)

- [FACT] В будущих книгах допускается появление новых типов артефактов
  (контрразведка, международные протоколы, трансграничные режимы),
  но:
  - они обязаны встраиваться в CD/EL/CM/FM/RP,
  - не могут отменять требования chain-of-custody,
  - не могут вводить “магическую допустимость”.
