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

### Saved onboarding checkpoint (10 Oct 2026)
Gordon authorised saving the reviewed batch after the temporary documentation hold. The current implemented sequence, German headings, controls, screenshot references and remaining work are recorded in **[Onboarding-progress.md](Onboarding-progress.md)**. This checkpoint supersedes older screen-order, age-input and dark-theme examples below; the full screenshot audit is still a future target, not a claim that every screen is complete.

- Keep Plus Jakarta Sans, matching the existing Welcome font; mirror the reference's size, weight and hierarchy without copying its English text.
- Birthday uses month/day/year scrolling wheels and a soft mint centre-selection band; height uses cm or ft/in scrolling wheels.
- Current weight uses a kg/lbs switch and a horizontally scrolling scale under a fixed mint centre marker. The large weight value updates when the scale moves left or right.
- Source and prior-app questions use the same mint choice-card pattern; source logos remain monochrome line icons.
- The stay-on-track comparison is an illustrative chart, not actual user history or a guaranteed result.
- Goal sits directly after current weight: **Abnehmen / Gewicht halten / Muskeln aufbauen**; Weiter requires a selection.
- Diet, pace and other unreviewed screens retain their existing controls until the next screenshot batches; remaining emoji replacement is tracked in tasks.md.

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

### Historical Dark Surface Reference (not the current default; §0 overrides)
- **Background (Deep Slate):** `#0F172A` (Slate 900)
- **Surface / Cards:** `#1E293B` (Slate 800)
- **Card Sub-surface / Input:** `#334155` (Slate 700)
- **Dividers & Subtle Borders:** `#1E293B` / `#334155`
- **Text Primary:** `#F8FAFC` (Slate 50) - High contrast readability.
- **Text Secondary / Muted:** `#94A3B8` (Slate 400) - Explanations, subtitles, helper text.
- **Text Tertiary / Disabled:** `#64748B` (Slate 500)

### Historical Macronutrient Palette Proposal (not applied; keep current build colours)
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
1. **Progress Bar:** Thin emerald line across the top; uses the current 13 question/interstitial pages, not the entire planned screenshot audit.
2. **Back Navigation:** Arrow left (`<`) at top left to review previous answers.
3. **Question Heading:** Bold Plus Jakarta Sans, 28–32px, readable deep mint on white.
4. **Helper Subtitle:** Muted mint (14–16px), German "Du" copy explaining why the answer matters.
5. **Interactive Selection:**
   - Single-choice vertical cards with checkmark / radio circle.
   - Dual-unit toggle tabs (`kg / lbs`, `cm / ft, in`).
   - Sliders with real-time feedback (e.g. pace calculation: "0,5 kg pro Woche - Ziel in 5 Monaten erreicht").
6. **Primary Action Button:** Full-width pill-shaped emerald "Weiter"; disabled until a required choice is made (see §0).

### Motion & Micro-interactions
- Gentle spring transitions between onboarding steps (150ms).
- Haptic feedback (`Haptics.impactAsync(ImpactFeedbackStyle.Light)`) on option selection and button press.
- Smooth number animation on calorie budget and weight projection calculations.
