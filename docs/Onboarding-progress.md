# Kalkumpel – Onboarding checkpoint

**Saved:** 11 Oct 2026. Gordon has confirmed that all onboarding pages are in place. This replaces the 13-page checkpoint from 10 Oct 2026.

Read alongside `Masterplan.md`, `Design-guidelines.md` and `tasks.md`. The screenshot audit in `app-flow-pages-and-roles.md` is the original reference. Its numbering does not match the current app order.

## Design and language

- Welcome stays near-black with white Kalkumpel lettering and the approved green scanner-plate/flame logo.
- Every page after Welcome is white, with mint/emerald copy and monochrome mint line icons. No emoji. The nutrient colours stay as they are.
- Font: Plus Jakarta Sans. Layout, font hierarchy and interaction follow the references; the copy is friendly German ("Du"), not the references' English.
- No invented social proof: no user counts, ratings or named testimonials.

## Implemented order (24 screens including account stage)

The progress bar covers steps 1–20; the setup animation, plan result and feature pages come after it.

| # | German heading | Function |
|---|---|---|
| 1 | Wähle Dein Geschlecht | Männlich / Weiblich / Divers; required. |
| 2 | Wie oft trainierst Du pro Woche? | 0–2 / 3–5 / 6+; sets the activity level. |
| 3 | Wann bist Du geboren? | Month/day/year wheels; works out age for calculations. |
| 4 | Wie hast Du von uns erfahren? | 7 sources; required. |
| 5 | Hast Du schon andere Kalorien-Apps ausprobiert? | Ja / Nein; required. |
| 6 | Gemacht, damit Du dranbleibst | Illustrative weight-trend chart (not a forecast). |
| 7 | Wie groß bist Du? | cm or ft/in wheels. |
| 8 | Wie viel wiegst Du? | kg/lbs, horizontally scrolling scale (swipe, drag, wheel, arrow keys). |
| 9 | Was ist Dein Ziel? | Abnehmen / Gewicht halten / Muskeln aufbauen; required. |
| 10 | Wunschgewicht | Same scale as current weight. |
| 11 | Plan statement | "Das Abnehmen von X beginnt mit einem Plan!" — X = gap between current and target weight; wording follows the goal. |
| 12 | Wie schnell möchtest Du Dein Ziel erreichen? | Slider (Entspannt / Empfohlen / Ehrgeizig) guided by weight, height, target BMI and goal; shows time to goal and daily calories. |
| 13 | Activity level | Five choices; can override step 2. |
| 14 | Wie isst Du am liebsten? | Ausgewogen, Vegetarisch, Vegan, Pescetarisch, Low Carb; mint line icons. |
| 15 | Ein einfacherer Weg, dranzubleiben | "Ohne / Mit Kalkumpel" cards; same abstract figure, the second wears a medal. |
| 16 | Was hält Dich davon ab …? | Obstacles; one choice, required. |
| 17 | Was möchtest Du erreichen? | Desired outcomes; one choice, required. |
| 18 | Du hast großes Potenzial … | Illustrative 3/7/30-day chart. |
| 19 | Werde Teil der Kalkumpel-Community | Crowd of 21 mint avatars in three rows; no counts or ratings. |
| 20 | Danke für Dein Vertrauen! | Handshake icon. |
| 21 | Wir richten alles für Dich ein | % counter, progress bar, rotating status line, checklist: Kalorien, Kohlenhydrate, Protein, Fett. |
| 22 | Ziel: X kg abnehmen bis [Datum] | Progress curve, daily kcal and macros; values come from the real calculation. |
| 23 | Features / reviews | Completing saves the local plan draft, targets and starting weight, then opens the account stage. |
| 24 | Sichere Deinen Fortschritt | Email/password signup or existing-account sign-in, required storage consent, separate optional future recipe/workout personalisation; then plan selection. Apple is native iOS only. |

## What is saved

- **Saved (on the device, and to Gordon's Supabase when signed in):** gender, age, height, weight, target weight, goal, activity, diet, pace class, calorie/macro targets, starting weight.
- **Added to device and account sync:** full birth date, workout frequency category, referral source, prior-app answer, single obstacle/desired outcome, kg/lbs choice, weekly pace amount, versioned storage/personalisation consent and latest timestamp.
- **Not saved yet:** cm/ft display preference (measurements remain cm).

## Deliberately not in the web onboarding

- Burned-calorie credit and Apple Health sync (reference screens 20–21): native iOS build only. No placeholder in the web app.
- Trainer question, rollover calories, notifications and referral code: upcoming, see `tasks.md`.

## How to check

1. Welcome → „Los geht's“; the screen changes from black to white/mint.
2. Go through all 20 question pages; required choices keep „Weiter“ disabled until answered.
3. Change current and target weight and check the plan statement and pace slider update.
4. Confirm the setup animation, result values, features and „Sichere Deinen Fortschritt“ page. Both consent boxes start unchecked; only storage consent is required.
5. Continue with email, create an account and confirm the email before choosing a plan. Premium is not activated until real checkout exists; free continuation is available after sign-in.
5. Open Heute and Profil and confirm the targets match the result page.
