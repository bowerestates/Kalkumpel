# Kalkumpel – Onboarding checkpoint

**Saved:** 10 Oct 2026, at Gordon's request after reviewing the completed screen batch.

This is the current **web app** checkpoint. Read alongside `Masterplan.md`, `Design-guidelines.md` and `tasks.md`. The full screenshot audit in `app-flow-pages-and-roles.md` remains the planned journey; its original numbering is not the current app order. No app screens changed during this documentation save.

## Design and language

- Welcome stays near-black with white Kalkumpel lettering and the approved green scanner-plate/flame logo.
- Onboarding after Welcome and daily use have white backgrounds, readable mint/emerald copy, soft mint selection surfaces and monochrome mint line icons. Existing nutrient colours are preserved.
- Use the existing Plus Jakarta Sans font and mirror the reference layout, font hierarchy and interaction, not its English copy.
- App UI remains friendly German by default; English remains available through settings. Explanations to Gordon stay English.
- Gordon approved this documentation checkpoint; the remaining onboarding pages will be reviewed using further screenshots.

## Current implemented order

| Page | Reference | German heading / content | Current function |
|---|---|---|---|
| Welcome | Approved logo preview | Kalkumpel | Start onboarding or open sign-in; separate from the question count. |
| 1 | IMG_3236 | Wähle Dein Geschlecht | Männlich / Weiblich / Divers, mint line icons and radio selection; Weiter disabled until chosen. |
| 2 | IMG_3237 | Wie oft trainierst Du pro Woche? | 0–2 / 3–5 / 6+, mint dot icons and descriptions; required choice sets light / moderate / active activity level. |
| 3 | IMG_3239 | Wann bist Du geboren? | Month, day and year scrolling wheels; helper: „Das berücksichtigen wir bei der Berechnung Deiner täglichen Nährwertziele.“ Selected date supplies age for calorie calculations; separate age field removed. |
| 4 | IMG_3240 | Wie hast Du von uns erfahren? | Freunde oder Familie, Fernsehen, Facebook, TikTok, Instagram, Google, YouTube; mint line icons, required choice. |
| 5 | IMG_3241 | Hast Du schon andere Kalorien-Apps ausprobiert? | Ja / Nein with mint thumbs-up/down icons; required choice. |
| 6 | IMG_3242 | Gemacht, damit Du dranbleibst | Illustrative Gewichtsverlauf chart: Kalkumpel vs. Ohne Plan, Monat 1–6; Weiter. |
| 7 | IMG_3243 | Wie groß bist Du? | cm / ft, in toggle and scrolling measurement wheels; metric height feeds calculations. |
| 8 | IMG_3244 | Wie viel wiegst Du? | kg / lbs toggle, large changing value and horizontal scale under a fixed mint centre marker. |
| 9 | IMG_3246 | Was ist Dein Ziel? | Abnehmen / Gewicht halten / Muskeln aufbauen with mint down/minus/up icons; required selection. Immediately follows current weight. |
| 10 | Awaiting reference review | Wunschgewicht | Existing target-weight page uses the same kg/lbs horizontal ruler; screenshot-specific redesign still upcoming. |
| 11 | Awaiting reference review | Activity level | Existing five-choice activity question; can override the earlier workout-based activity value. |
| 12 | Awaiting reference review | Dietary preference | Existing balanced / vegetarian / vegan / pescetarian / low-carb choices; emoji replacement and further choices remain upcoming. |
| 13 | Awaiting reference review | Pace | Existing slow / normal / fast choices, not yet the reference pace slider. |
| After questions | Existing | Calculation → plan reveal → features/reviews | Animated calculation, calorie/macro targets and projected goal date; completing this flow saves the profile/targets and starting weight, then opens the paywall. |

There are **13 question/interstitial pages**, followed by calculation, reveal and features/reviews. The progress bar uses those 13 pages. Welcome and paywall are separate routes.

## Weight-scale behaviour

- Move the scale left or right to change the displayed weight.
- Supports touch swipe, mouse drag, mouse wheel/trackpad and left/right arrow keys when focused.
- Fixed centre marker indicates the selected value; changing units converts the displayed measurement. Stored weight remains kilograms.
- Current and target weight share the same control. Physical phone interaction remains part of final end-to-end testing.

## Completion and limitations

**Completed:** approved Welcome branding, white/mint theme, gender, workouts, birthday, referral source, prior tracking, illustrative chart, height picker, horizontally scrolling current weight and restored goal screen.

**Not claimed complete:** the full 33-screen reference journey, trainer question, target-weight reference redesign, remaining interstitials, pace slider/live date, obstacles, secondary goals, extra diets, activity/health/rollover toggles, notifications, referral code and dedicated onboarding account wall.

**Persistence:** birth wheels, referral source and prior-tracking answers are temporary onboarding state. Only derived age is part of the saved profile; full birth date and those extra answers are not yet persisted. Workout selection sets the profile activity level but is not stored as a separate frequency field. Measurement-unit choices are local to the pickers, not global settings. Do not describe these as cross-device saved answers yet.

**Chart:** illustrative comparison only, not real user history or a guaranteed forecast. Existing review cards are prototype content, not verified testimonials.

## How to check

1. Open Welcome and select „Los geht's“; confirm the black screen changes to white/mint onboarding.
2. Choose gender and workout frequency; confirm Weiter is disabled before required choices.
3. Review birthday, source, tracking experience, chart and height in the order above; try the birthday/height wheels and unit switches.
4. On „Wie viel wiegst Du?“, move the scale left and right and confirm the number changes; repeat with lbs.
5. Continue to „Was ist Dein Ziel?“; confirm the three German options and required selection. Next is the existing target-weight ruler.
6. Continue through the remaining existing screens to the plan and paywall; inspect targets and profile after completion.

**Next step:** Gordon supplies the next screenshots, starting with the target-weight reference if desired. Update remaining pages in agreed order; retain the upcoming items in `tasks.md` until implemented and checked.
