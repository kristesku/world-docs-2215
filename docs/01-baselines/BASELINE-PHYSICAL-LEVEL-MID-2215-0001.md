---
id: BASELINE-PHYSICAL-LEVEL-MID-2215-0001
title: >
  Physical Environment Baseline — LEVEL-MID (2215)
class: baseline
status: fixed
version: 1.1.0
inputs: []
depends_on:
  - SSOT-SCENARIO-A-2215-0001
scope: >
  Исполняемый baseline физической среды и повседневных условий для сцен романа в 2215 году.
  Определяет значения по умолчанию (LEVEL-MID) и запрещённые состояния. Используется напрямую
  при написании сцен.
---

## 0. Baseline invariants

- [FACT] Данный документ является исполняемым baseline.
- [FACT] Все сцены, не указавшие иное, используют LEVEL-MID.
- [FORBIDDEN] Использование предположений, аналитики или ссылок на источники в сценах.
- [FORBIDDEN] Подмена baseline каноническими или сценарными рассуждениями.
- [FORBIDDEN] Использование эмоционально-оценочных описаний вместо измеримых параметров, когда параметр задан baseline.

---

## 1. Access Levels (норматив)

- [FACT] В корпусе определены три уровня физической среды: LEVEL-LOW, LEVEL-MID, LEVEL-HIGH.
- [FACT] LEVEL-MID является значением по умолчанию для всех сцен.
- [FACT] LEVEL-LOW и LEVEL-HIGH применяются только при явном указании в сцене.

---

## 2. Housing (LEVEL-MID default)

- [DEFAULT] Жильё — индивидуальная квартира в многоквартирном доме.
- [DEFAULT] Площадь — достаточная для комфортного проживания одного или нескольких человек без избыточного пространства.
- [DEFAULT] Климат-контроль присутствует и работает стабильно.
- [DEFAULT] Водоснабжение и канализация надёжны и непрерывны.
- [DEFAULT] Освещение энергоэффективное, с автоматическим управлением.
- [DEFAULT] Звукоизоляция достаточная для повседневного комфорта.
- [DEFAULT] Базовая мебель и встроенные системы присутствуют.
- [FORBIDDEN] Роскошные особняки и дворцы без явного указания LEVEL-HIGH.
- [FORBIDDEN] Трущобы и аварийное жильё без явного указания LEVEL-LOW.

---

## 3. Transport (LEVEL-MID default)

- [DEFAULT] Городской транспорт — преимущественно автономный.
- [DEFAULT] Личный транспорт возможен, но не обязателен для повседневной жизни.
- [DEFAULT] Время перемещения по городу предсказуемо и относительно невелико.
- [DEFAULT] Межгородские перемещения доступны, но требуют планирования.
- [FORBIDDEN] Ручное управление транспортом как массовая норма.
- [FORBIDDEN] Полная транспортная изоляция без указания LEVEL-LOW.

---

## 4. Workspaces and public spaces (LEVEL-MID default)

- [DEFAULT] Рабочие пространства чистые, функциональные и автоматизированные.
- [DEFAULT] Значительная часть работы выполняется удалённо или в гибридном режиме.
- [DEFAULT] Публичные пространства безопасны и обслуживаются автоматизированными системами.
- [DEFAULT] Доступ в пространства регулируется процедурами и идентификацией.
- [FORBIDDEN] Опасные, неуправляемые или хаотичные рабочие условия без LEVEL-LOW.
- [FORBIDDEN] Чрезмерно элитные, изолированные пространства без LEVEL-HIGH.

---

## 5. Human body and health (LEVEL-MID default)

- [DEFAULT] Человеческое тело — биологическое, без радикальных модификаций.
- [DEFAULT] Доступ к медицине высок и стабилен.
- [DEFAULT] Хронические заболевания управляемы и контролируемы.
- [DEFAULT] Терапевтические импланты возможны, но не обязательны.
- [FORBIDDEN] Массовые радикальные кибернетические модификации без LEVEL-HIGH.
- [FORBIDDEN] Полное отсутствие медицинской помощи без LEVEL-LOW.

---

## 6. Daily physical reality (LEVEL-MID default)

- [DEFAULT] Повседневная среда чистая и функциональная.
- [DEFAULT] Питание доступно и безопасно.
- [DEFAULT] Энергоснабжение стабильно и непрерывно.
- [DEFAULT] Бытовые системы автоматизированы на уровне комфорта, а не роскоши.
- [FORBIDDEN] Постапокалиптические условия без LEVEL-LOW.
- [FORBIDDEN] Утопическая избыточность без LEVEL-HIGH.

---

## 7. Scene sensor snapshot defaults (LEVEL-MID, executable)

Ниже — дефолтные **сенсорные поля**, которыми сцена может пользоваться напрямую
как “Environment Snapshot” (2–5 полей на сцену), не превращая это в художественное описание.

### 7.1 Acoustics / noise

- [DEFAULT] `noise_indoor_db` = range 34–46 (p50=40).
- [DEFAULT] `noise_transit_db` = range 52–70 (p50=61).
- [DEFAULT] `noise_exposed_db` = range 56–74 (p50=64).
- [FORBIDDEN] `noise_*_db` > 85 без явного override (это уже не фон, а событие).

### 7.2 Air / wind / humidity / temperature

- [DEFAULT] `humidity_indoor_pct` = range 30–55 (p50=42).
- [DEFAULT] `humidity_outdoor_pct` = range 45–85 (p50=68).
- [DEFAULT] `wind_exposed_ms` = range 6–16 (p50=11).
- [DEFAULT] `temperature_indoor_c` = range 19–23 (p50=21).
- [FORBIDDEN] `temperature_indoor_c` < 16 или > 27 без явного override (это уже сбой/режим).

### 7.3 Light & visibility

- [DEFAULT] `light_ct_k` = range 3800–4300 (p50=4100) для служебных/транспортных зон.
- [DEFAULT] `visibility_outdoor_m` = range 400–2000 (p50=1200) при нормальных условиях.
- [FORBIDDEN] `visibility_outdoor_m` < 100 без явного override (туман/дым как событие).

### 7.4 Connectivity / observability

- [DEFAULT] `latency_ms` = range 60–180 (p50=110) для гражданских контуров.
- [DEFAULT] `packet_loss_pct` = range 0.0–1.5 (p50=0.3).
- [FORBIDDEN] `packet_loss_pct` > 5.0 без явного override (это уже деградация/атака/глушение).

### 7.5 Mobility / flow (scene friction)

- [DEFAULT] `traffic_flow` = range 0.45–0.80 (p50=0.62) (0..1, где 1 = плотный поток/фрикция).
- [FORBIDDEN] `traffic_flow` > 0.92 без явного override (это уже событие/аномалия/массовое мероприятие).

### 7.6 Narrative tags (neutral, optional)

- [DEFAULT] `background_noise_tag` допускается как нейтральный ярлык (≤ 3 слова), напр.: `vent_hum`, `river_port_hum`, `service_corridor`.
- [FORBIDDEN] Эмоционально-оценочные ярлыки (`oppressive`, `terrifying`, `depressing`, etc.).

---

## 8. Forbidden global defaults

- [FORBIDDEN] Магические или необъяснимые физические эффекты.
- [FORBIDDEN] Нарушение известных физических законов без явного канонического основания.
- [FORBIDDEN] Тотальный постчеловеческий трансгуманизм как фон по умолчанию.
- [FORBIDDEN] Полная физическая деградация среды как фон по умолчанию.

---

## 9. Scene micro-checklist (исполняемый)

Перед фиксацией сцены автор ОБЯЗАН проверить:

- [FACT] Указан ли LEVEL, если сцена не LEVEL-MID?
- [FACT] Соответствует ли жильё, транспорт и тело персонажей выбранному LEVEL?
- [FACT] Нет ли скрытых FORBIDDEN состояний?
- [FACT] Используется ли baseline напрямую, без домыслов?
- [FACT] Если в сцене используются сенсорные поля (noise/wind/humidity/latency/light/traffic_flow),
  то они попадают в диапазоны LEVEL-MID либо оформлены override.
- [FACT] Все физические детали сцены воспроизводимы и непротиворечивы?
