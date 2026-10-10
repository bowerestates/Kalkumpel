# Kalkumpel - Design Guidelines

> **Visual Identity:** Clean, modern, high-contrast, data-dense yet approachable. Inspired by Apple Health, modern Scandinavian utility apps, and DACH health aesthetics.

---

## 0. Theme Split (decided 10 Oct 2026 — overrides older dark-mode notes below)

- **Welcome screen only:** near-black background, white "Kalkumpel" lettering, green scanner-plate logo (approved preview).
- **Onboarding (after "Los geht's") and the whole day-to-day app:** white background, all copy and text in mint/emerald shades.
  - Headings & body text: deep mint `#064E3B`-range; helper text: muted mint; buttons/active states: emerald `#059669`.
  - Soft mint tints (`#ECFDF5`-range) for icon badges, selected cards and progress-bar tracks.
- **Icons:** no full-colour icons or emojis — only line icons in mint shades, sitting in a soft mint circle.
- **Macro colours** (protein/carbs/fat) stay as currently built; the only exception to the mint-only rule.
- **Screen-by-screen mirroring:** Gordon attaches reference screenshots (English). Each app screen mirrors their layout, font weight and behaviour, with German "Du" copy.

### Choice-screen pattern (reference IMG_3236, "Choose your sex")
1. Round soft-mint back button (arrow) + thin progress bar at the top.
2. Large bold heading, muted one-line subtitle underneath.
3. Options vertically centred: white card, thin border, mint icon badge left, label, radio circle right.
4. Selected card: mint tint + emerald border + filled radio.
5. Full-width pill "Weiter" button at the bottom — grey and disabled until an option is chosen, then emerald.
6. Options may have a second muted line (e.g. workouts screen IMG_3237: "0–2 / Ab und zu ein Training", "3–5 / Ein paar Trainings pro Woche", "6+ / Echte:r Sportler:in"; icons = 1, 3, 6 mint dots).
7. Gender screen copy: "Wähle Dein Geschlecht" / "So können wir Deinen Bedarf genauer berechnen." / Männlich, Weiblich, Divers.

---

## 1. Brand Identity & Logo Assets

The Kalkumpel repository contains two official logo assets under `assets/`:

### Variant A: Pure Emblem (`assets/logo.png`)
- **Composition:** Mint-green flame inside a dark teal circular plate/camera reticle emblem with four dark teal corner framing marks on a clean background.
- **Recommended Use:** App icon, favicon, compact navigation headers, camera viewfinder overlay, push notification icon, and subtle branding watermarks.
- **Symbolism:**
  - **Outer Reticle Frame (`#064E3B` / Dark Emerald Teal):** Represents precision computer-vision food scanning, barcode recognition, and macro detection.
  - **Inner Circular Plate:** Anchors the product to nutrition, fresh meals, and balanced portion control.
  - **Center Flame (`#10B981` / Mint Emerald):** Symbolizes metabolic energy expenditure, active calorie burn, and daily tracking streaks.

### Variant B: Full Scanner Plate Logo (`assets/logo-scanner-plate.png`)
- **Composition:** The dark teal circular scanner plate with mint flame emblem centered directly above a bold, friendly, rounded wordmark **"KalKumpel"**.
- **Recommended Use:** Onboarding Welcome Screen (`onboarding/welcome`), Splash Screen, Paywall Header, and marketing materials.
- **Typography:** Custom rounded sans-serif font with soft curves, matching the approachable companion ("Kumpel") persona.

---

## 2. Color Palette & Semantic Tokens

### Primary Brand Accents
- **Primary Brand Accent (Emerald / Mint):** `#10B981` (Tailwind Emerald 500)
  - *Usage:* Primary call-to-action buttons (e.g. "Weiter", "Plan erstellen", "Kostenlos starten"), active tab icons, streak indicators, progress ring fills.
- **Primary Pressed / Hover State:** `#059669` (Tailwind Emerald 600)
- **Deep Emerald Teal:** `#064E3B` / `#022C22` (Tailwind Emerald 900/950)
  - *Usage:* Scanner plate borders, high-contrast card borders, dark badge backgrounds.

### Neutral Surface System (Dark Mode First)
- **Background (Deep Slate):** `#0F172A` (Slate 900)
- **Surface / Cards:** `#1E293B` (Slate 800)
- **Card Sub-surface / Input:** `#334155` (Slate 700)
- **Dividers & Subtle Borders:** `#1E293B` / `#334155`
- **Text Primary:** `#F8FAFC` (Slate 50) - High contrast readability.
- **Text Secondary / Muted:** `#94A3B8` (Slate 400) - Explanations, subtitles, helper text.
- **Text Tertiary / Disabled:** `#64748B` (Slate 500)

### Macronutrient Color Coding (Consistent Across All Screens)
- **Kalorien (Calories):** `#F97316` (Vibrant Coral/Orange) - Represents overall daily energy.
- **Eiweiß (Protein):** `#3B82F6` (Electric Blue) - Represents muscle synthesis & recovery.
- **Kohlenhydrate (Carbs):** `#10B981` (Emerald Green) - Represents sustained energy & plant foods.
- **Fett (Fat):** `#FACC15` (Warm Amber/Yellow) - Represents essential fatty acids & satiety.

### Ring Colors Semantic System (from Screen IMG_3307)
- **Grün (Green):** Within calorie goal / up to 100 kcal over deficit target.
- **Gelb (Yellow):** 101 - 250 kcal over deficit target.
- **Rot (Red):** > 250 kcal over deficit target.
- **Grau (Grey):** Unlogged / in-progress day.

---

## 3. UI Components & Layout Principles

### Onboarding Screen Standard Structure
1. **Progress Bar:** Thin emerald line (`#10B981`) across top indicating progress (Steps 1–33).
2. **Back Navigation:** Arrow left (`<`) at top left to review previous answers.
3. **Question Heading:** Bold, large sans-serif (28-32px, `#F8FAFC`) centered or left-aligned.
4. **Helper Subtitle:** Muted (14-16px, `#94A3B8`) explaining *why* this data matters.
5. **Interactive Selection:**
   - Single-choice vertical cards with checkmark / radio circle.
   - Dual-unit toggle tabs (`kg / lbs`, `cm / ft, in`).
   - Sliders with real-time feedback (e.g. pace calculation: "0,5 kg pro Woche - Ziel in 5 Monaten erreicht").
6. **Primary Action Button:** Full-width rounded emerald button (`#10B981` background, `#FFFFFF` bold text, height 56px, rounded 16px).

### Motion & Micro-interactions
- Gentle spring transitions between onboarding steps (150ms).
- Haptic feedback (`Haptics.impactAsync(ImpactFeedbackStyle.Light)`) on option selection and button press.
- Smooth number animation on calorie budget and weight projection calculations.
