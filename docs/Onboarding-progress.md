# Kalkumpel – Onboarding checkpoint

**Saved:** 11 Oct 2026. Gordon has confirmed that all onboarding pages are in place. This replaces the 13-page checkpoint from 10 Oct 2026.

Read alongside `Masterplan.md`, `Design-guidelines.md` and `tasks.md`. The screenshot audit in `app-flow-pages-and-roles.md` is the original reference. Its numbering does not match the current app order.

## Design and language

- Welcome stays near-black with white Kalkumpel lettering and the approved green scanner-plate/flame logo.
- Every page after Welcome is white, with mint/emerald copy and monochrome mint line icons. No emoji. The nutrient colours stay as they are.
- Font: Plus Jakarta Sans. Layout, font hierarchy and interaction follow the references; the copy is friendly German ("Du"), not the references' English.
- No invented social proof: no user counts, ratings or named testimonials.

## Implemented order (24 base screens including account, plus four optional health pages)

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
| 20a–20d (optional) | Health preparation | Burned calories → workout sync → connection preparation → rollover; full-stage skip to setup. |
| 21 | Wir richten alles für Dich ein | % counter, progress bar, rotating status line, checklist: Kalorien, Kohlenhydrate, Protein, Fett. |
| 22 | Ziel: X kg abnehmen bis [Datum] | Progress curve, daily kcal and macros; values come from the real calculation. |
| 23 | Features / reviews | Completing saves the local plan draft, targets and starting weight, then opens the account stage. |
| 24 | Sichere Deinen Fortschritt | Google/email signup or existing-account sign-in, disabled Apple placeholder, required storage consent, separate optional future recipe/workout personalisation; then plan selection. Live Apple sign-in is native iOS only. |

## What is saved

- **Saved (on the device, and to Gordon's Supabase when signed in):** gender, age, height, weight, target weight, goal, activity, diet, pace class, calorie/macro targets, starting weight.
- **Added to device and account sync:** full birth date, workout frequency category, referral source, prior-app answer, single obstacle/desired outcome, kg/lbs choice, weekly pace amount, versioned storage/personalisation consent and latest timestamp.
- **Not saved yet:** cm/ft display preference (measurements remain cm).

## Deliberately not in the web onboarding

- Actual burned-calorie credit, Apple Health/HealthKit and Android Health Connect import/permission remain native-only. Optional preparation pages are now built after Thanks (17 Oct 2026).
- Trainer question, rollover execution, notifications and referral code: upcoming, see `tasks.md`.

## How to check

1. Welcome → „Los geht's“; the screen changes from black to white/mint.
2. Go through all 20 question pages; required choices keep „Weiter“ disabled until answered.
3. Change current and target weight and check the plan statement and pace slider update.
4. Confirm the setup animation, result values, features and „Sichere Deinen Fortschritt“ page. Both consent boxes start unchecked; only storage consent is required.
5. Continue with email, create an account and confirm the email before choosing a plan. Premium is not activated until real checkout exists; free continuation is available after sign-in.
5. Open Heute and Profil and confirm the targets match the result page.

## Phase 0 locale follow-up — 11 Oct 2026
Onboarding result calories/macros, plan weight differences, pace/timeline labels, birthday month names and height/weight widgets now use shared selected-language helpers. Decimal weight drafts accept comma or dot. Stored measurements and CSS/SVG percentages remain numeric; birth-year identifiers are not thousands-grouped. Automated locale/decimal tests pass as part of the 11-test suite; live guest DE/EN app display and weight-save checks passed. This does not claim fresh real-account onboarding sync or result-edit controls are complete.

## Optional health onboarding — 17 Oct 2026

After „Danke für Dein Vertrauen!“ and before calculation setup, up to four optional pages appear: (1) burned-calorie preference, (2) sync workouts with Apple Health / Health Connect, (3) connection preparation, (4) rollover preference (future maximum 200 kcal). The original 20-step progress remains unchanged; the optional stage has its own four-segment progress. iPhone/iPad and Android are detected after hydration; desktop offers an explicit platform choice. Platform detection is presentation only, never proof that a native service exists.

Every page has „Überspringen“, which resets all optional wishes and goes directly to setup. „Nein“ declines the current preference; declining workout sync bypasses the connection page and opens rollover. Back returns through the optional pages or to Thanks. Preparing a connection saves only a request and shows that permissions/connection come later in the native app; no connected checkmark, OS permissions or fake success. Example workout/budget numbers and rollover visuals are labelled examples and never become meal/activity data.

On feature completion, `onboardingDetails.healthSetup` saves version, platform, addBurnedCalories, syncWorkouts, connectionRequested, connectedPlatform (always null), and rolloverCalories locally. Existing owner-only profile JSON sync carries these validated wishes when signed in; no migration is required. Native apps must request real consent separately. Targets and all current calorie calculations are unchanged. Real account cross-device readback remains unverified.

Testing: complete onboarding through Thanks, exercise Yes/No, switch Apple Health/Health Connect, prepare then continue, or skip any page; verify setup/result/account continue normally and saved wishes survive reload. Native integration is the next step, not delivered by these holders.


## Google account layout — 19 Oct 2026

Implemented: `/konto` and `/auth` show Apple (disabled, future iOS label), Google and email, preserving the white/mint design. On `/konto`, required storage consent gates Google/email and optional personalisation stays separate; choices are saved before leaving for Google. Google uses Gordon’s existing Supabase Auth, not a workspace Google connector. The callback is the same-origin public `/auth?oauth=google`, with `&next=paywall` for onboarding. The SDK establishes its session and `getUser()` validates it; onboarding returns to `/konto` to confirm consent before plan choice, while other accounts continue to Today or onboarding. No paid entitlement is granted and no second auth listener was added.

Upcoming setup: create a Web application OAuth client in Google Cloud; register the callback URL shown in Supabase’s Google provider panel, configure the email/profile/openid scopes and enable Google in Supabase with the client ID/secret. Allow the exact app return URLs for each origin in Supabase Authentication → URL Configuration. Test Google in the published app or preview opened in a new tab, not the editor frame. Real Google login/account sync requires that provider setup; Apple is not a working web sign-in method.
