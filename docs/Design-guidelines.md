# Kalkumpel - Design Guidelines

> **Visual Identity:** Clean, modern, high-contrast, data-dense yet approachable. Inspired by Apple Health and modern Scandinavian utility apps.

---

## 1. Brand Identity & Emblem

The official Kalkumpel emblem is located at `assets/logo.png`.

### Symbolism
- **Outer Reticle Frame (#064E3B / Dark Emerald):** Represents camera focus, computer vision scanning, and barcode recognition.
- **Inner Plate Rim:** Anchors the product to nutrition, meals, and balanced portioning.
- **Center Flame (#10B981 / Mint Emerald):** Symbolizes metabolic energy burn, calorie consumption, and daily tracking streaks.

### Color Tokens
- **Brand Primary Accent:** `#10B981` (Mint / Emerald Flame)
- **Brand Deep Teal:** `#064E3B` / `#0F2E2B` (Camera Reticle / Dark Frame)

---

## 2. Color Palette & Semantic Tokens

### Base System
- **Background (Dark):** `#0F172A` (Slate 900)
- **Surface / Card (Dark):** `#1E293B` (Slate 800)
- **Border / Divider:** `#334155` (Slate 700)
- **Text Primary:** `#F8FAFC` (Slate 50)
- **Text Secondary / Muted:** `#94A3B8` (Slate 400)
- **Accent / Primary Action:** `#10B981` (Brand Mint) or `#22C55E` (Emerald 500)

### Macronutrient Color Coding (Consistent across all screens)
- **Calories (Kalorien):** `#F97316` (Vibrant Coral/Orange) - Represents overall energy.
- **Protein (Eiweiß):** `#3B82F6` (Electric Blue) - Represents strength & muscle synthesis.
- **Carbs (Kohlenhydrate):** `#10B981` (Emerald Green) - Represents plant energy & fuel.
- **Fat (Fett):** `#F59E0B` (Warm Amber/Gold) - Represents essential fats & satiety.

---

## 3. Typography Scale
- **Display / Hero Numbers:** 36pt - 44pt, Bold (Daily calories remaining).
- **Heading 1:** 28pt, SemiBold (Screen titles, e.g., *Heute*, *Profil*, *Dein Ziel*).
- **Heading 2:** 20pt, Medium (Section titles, e.g., *Mahlzeiten*, *Nährwerte*).
- **Body Regular:** 16pt, Regular (Standard copy, meal names).
- **Caption / Meta:** 13pt, Medium (Grams, percentages, dates).

---

## 4. UI Components & Layout Principles
- **Touch Targets:** Minimum 44x44 pt for all interactive buttons and inputs.
- **Cards & Elevating:** Rounded corners (`16px` border-radius), subtle 1px border (`#334155`) instead of heavy drop shadows.
- **Feedback & Micro-interactions:**
  - Haptic feedback on snap capture, slider adjustment, and meal logging.
  - Progress rings with smooth spring animations using React Native Reanimated.
- **Camera Viewfinder:** Full-screen edge-to-edge view with toggle tabs between `[Foto-Scan]` and `[Barcode]`.

---

## 5. German Copy & Tone of Voice
- **Tone:** Encouraging, pragmatic, clear, never patronizing. Like a reliable gym buddy (*Kumpel*).
- **Grammar & Address:** Direct "Du" form (*Erfasse deine Mahlzeit*, *Dein Tagesziel*).
- **Units:** Metric system exclusively (`g`, `kg`, `cm`, `kcal`, `ml`).
