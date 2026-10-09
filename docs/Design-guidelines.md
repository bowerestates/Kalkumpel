# Kalkumpel - Design Guidelines

> **Visual Identity:** Clean, modern, high-contrast, data-dense yet approachable. Inspired by Apple Health and modern Scandinavian utility apps.

---

## 1. Color Palette & Semantic Tokens

### Base System
- **Background (Dark):** `#0F172A` (Slate 900)
- **Surface / Card (Dark):** `#1E293B` (Slate 800)
- **Border / Divider:** `#334155` (Slate 700)
- **Text Primary:** `#F8FAFC` (Slate 50)
- **Text Secondary / Muted:** `#94A3B8` (Slate 400)
- **Accent / Primary Action:** `#22C55E` (Emerald 500) or `#6366F1` (Indigo 500)

### Macronutrient Color Coding (Consistent across all screens)
- **Calories (Kalorien):** `#F97316` (Vibrant Coral/Orange) - Represents overall energy.
- **Protein (Eiweiß):** `#3B82F6` (Electric Blue) - Represents strength & muscle synthesis.
- **Carbs (Kohlenhydrate):** `#10B981` (Emerald Green) - Represents plant energy & fuel.
- **Fat (Fett):** `#F59E0B` (Warm Amber/Gold) - Represents essential fats & satiety.

---

## 2. Typography Scale
- **Display / Hero Numbers:** 36pt - 44pt, Bold (Daily calories remaining).
- **Heading 1:** 28pt, SemiBold (Screen titles, e.g., *Heute*, *Profil*).
- **Heading 2:** 20pt, Medium (Section titles, e.g., *Mahlzeiten*, *Nährwerte*).
- **Body Regular:** 16pt, Regular (Standard copy, meal names).
- **Caption / Meta:** 13pt, Medium (Grams, percentages, dates).

---

## 3. UI Components & Layout Principles
- **Touch Targets:** Minimum 44x44 pt for all interactive buttons and inputs.
- **Cards & Elevating:** Rounded corners (`16px` border-radius), subtle 1px border (`#334155`) instead of heavy drop shadows.
- **Feedback & Micro-interactions:**
  - Haptic feedback on snap capture, slider adjustment, and meal logging.
  - Progress rings with smooth spring animations using React Native Reanimated.
- **Camera Viewfinder:** Full-screen edge-to-edge view with clear framing guides and camera switch/flash toggles.

---

## 4. German Copy & Tone of Voice
- **Tone:** Encouraging, pragmatic, clear, never patronizing. Like a reliable gym buddy (*Kumpel*).
- **Grammar & Address:** Direct "Du" form (*Erfasse deine Mahlzeit*, *Dein Tagesziel*).
- **Units:** Metric system exclusively (`g`, `kg`, `cm`, `kcal`, `ml`).
