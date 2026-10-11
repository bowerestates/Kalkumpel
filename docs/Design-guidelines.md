# Kalkumpel — Design Guidelines (Web)

> Updated: 11 Oct 2026. Approved design, not the older native dark-theme proposal.  
> Clean, approachable, high-contrast nutrition tracking. Detailed screen checkpoint: [Onboarding-progress.md](Onboarding-progress.md).

## 1. Brand and typography — approved

- **Keep the existing scanner-plate/flame logo permanently** (Gordon, 11 Oct 2026). Welcome uses `src/assets/welcome-logo.png`; favicon uses `public/favicon.png`. Older native `assets/logo.png` and `assets/logo-scanner-plate.png` are not replacements to import.
- Welcome alone is near-black with white **Kalkumpel** lettering and green branding. Plate/flame sit inside scan corners; the approved ring simplification and spacing remain.
- Keep original **Plus Jakarta Sans** typography and approved copy colour roles; do not substitute a rounded wordmark or new font.
- Every screen after Welcome uses white surfaces, readable deep mint/emerald text, muted mint helpers and emerald active states. Retain existing nutrient colours as the exception to monochrome mint.
- Use mint line icons rather than emoji/full-colour icons. Do not copy unverified user counts, stars, reviews or named testimonials from references.

## 2. Tokens and controls

Use semantic tokens in `src/styles.css` and existing UI components, not a second native theme or hardcoded colour palette. Emerald/mint brand references remain `#10B981`, pressed/active `#059669`, deep text around `#064E3B`, soft selection tints around `#ECFDF5`. These describe roles; the CSS tokens are the implementation authority. Do not replace current protein/carbohydrate/fat colours with the historical palette proposal.

- Standard unselected choice: white, thin mint border, mint icon badge, label and radio.
- Selected choice: soft mint tint, emerald border and filled radio.
- Chart/comparison sections: white with thin mint border, **not filled green panels**. Chart-area shading can remain where approved.
- Round soft-mint back arrow; thin progress line; large bold heading, muted subtitle and full-width pill CTA. Required answers keep Continue disabled until chosen.
- Support touch, mouse and keyboard controls without unstable sizing or clipped German/English labels.
- Gentle transitions, respecting reduced motion. Native haptics are future iOS work, not a web implementation requirement.

## 3. Completed onboarding design

There are **23 in-route screens plus the separate account stage**, not the old 13- or 33-screen sequence. Question/interstitial progress covers the first 20; setup, result and features follow. See the numbered list in Onboarding-progress.md.

- Screenshot layouts are adapted screen by screen into friendly German “Du” copy; explanations to Gordon remain English.
- Birthday: month/day/year wheels with mint centre band. Height: cm/ft-in wheels. Current/target weight: kg/lbs switch and scrolling horizontal scale with fixed centre marker; swipe, drag, wheel and arrow keys adjust the value.
- Goal immediately follows current weight: **Abnehmen / Gewicht halten / Muskeln aufbauen**.
- Plan statement uses actual weight difference. Pace comes immediately after it with **Entspannt / Empfohlen / Ehrgeizig**, live timeline and daily calories. Values are estimates, not guaranteed outcomes.
- Diet uses the matching mint choice-card pattern.
- “Ohne / Mit Kalkumpel” figures are the same abstract solid person; the latter has a medal around the neck, not a trophy or a different person.
- Potential/comparison charts are illustrative, not real user history. Community uses 21 mint avatars in three overlapping depth rows without counts, rating badges or “viele mehr”.
- Setup: percentage, mint progress line, changing status and calorie/carbohydrate/protein/fat checklist. No personal health-score completion item.
- Result: calculated goal/date, estimated curve, calories/macros in existing nutrient colours. Edit pencils remain upcoming; targets can currently be edited in Profile.

## 4. Account and plan screens

“Sichere Deinen Fortschritt” follows plan/features and precedes Free/Premium choice. Use matching Plus Jakarta Sans heading, round back arrow, completed thin progress line, white surface and emerald pill CTA.

Web offers email/password plus existing-account sign-in only. No Apple/Google placeholder controls. Storage consent and optional future recipe/workout personalisation both start unchecked; only storage consent gates email signup. Do not imply marketing email permission, blanket legal approval or paid access. Profile permits optional personalisation withdrawal; approved legal notices, sensitive-data lawful basis, retention, full consent history and deletion/export remain launch prerequisites.

Plan preview: **29,00 €/year**, yearly only, **3-day trial**, Free **3 AI photos/day**, future Pro **unlimited photos/day**. There is no implemented payment or active trial; Premium explains unavailability rather than granting local paid status.

## 5. Capture, barcode and meal-score design

- Photo and barcode capture include German/English camera-access messages, loading/error states and usable fallbacks.
- Photo results allow ingredient/portion edits before saving. Browser camera barcode scanning and typed-code Open Food Facts lookup are implemented, with gram-scaled nutrition review.
- Fuller product/Nutri-Score layout and scan-tips screen remain future work; do not depict them as already delivered.
- OpenAI is the current server provider via Lovable AI Gateway (`AI_VISION_MODEL = "openai/gpt-6-luna"`); this is not a visible provider badge or a claim of model availability/privacy certification.
- Meal score: compact **Mahlzeiten-Score**, 1–10 or insufficient information, “Geschätzt”, expandable reasons, optional practical balance idea, confidence and non-medical disclaimer. Supportive mint styling; no shame, red failure indicator or calorie-based good/bad label.
- Saved scores reopen without AI. Reassessment failure must still leave saving available. See Meal-score-rubric.md.

## 6. Language-aware presentation (partially wired)

All text uses DE/EN dictionaries. Numbers/dates use the selected language through shared `Intl` helpers: German **2.150 kcal / 75,5 kg / 11.10.2026**; English (`en-GB`) **2,150 kcal / 75.5 kg / 11/10/2026**. Unit preferences are separate from language and stored measurements remain metric.

Today calories, progress weight input/values and selected onboarding dates/pace already use locale-aware formatting. Raw displays remain in capture/review, result calories and Profile target summary; nutrition/portion inputs do not all accept comma/dot yet. Finish this rollout and check both languages before closing Phase 0. Weight input already accepts either decimal separator.

## 7. Deferred reference designs

Weekly green/yellow/red/grey day rings are a future calendar feature, not a replacement for existing nutrient colours. Ring reference thresholds: green within target or at most 100 kcal over; yellow 101–250 over; red more than 250 over; grey unlogged.

Native iOS alone will add Apple sign-in, HealthKit, activity-calorie credit and haptics. Do not show fake Apple Health connections or placeholder workout screens in web. Remaining visual/reference polish and optional questions are tracked in tasks.md rather than claimed complete.

## Current web feature checkpoint

| Feature | Implemented now | Remaining / limitations |
|---|---|---|
| Branding | Approved scanner-plate/flame Welcome logo and favicon; Gordon confirmed keeping the existing logo permanently | No replacement with older `assets/` logos |
| Onboarding | 23 in-route screens (20 questions/interstitials, setup, result, features), followed by the separate account stage | Full order in `Onboarding-progress.md`; remaining reference polish/options in `tasks.md` |
| Targets | Mifflin-St Jeor-based calories/macros, goal-weight difference, guided pace and estimated target date | Estimates, not guaranteed outcomes; result-screen editing remains upcoming |
| Accounts | Email/password signup/sign-in/reset, local plan draft, owner-scoped Supabase sync, unchecked storage and optional personalisation consent | Real confirmation delivery and cross-device checks still unverified; legal review, retention, export/deletion and complete consent history required |
| Photo analysis | Server-side OpenAI via Lovable AI Gateway; configured `AI_VISION_MODEL = "openai/gpt-6-luna"`; ingredient/portion review before saving; signed-in private photos | Model availability/access depends on provider; BLS grounding and scan-tips screen upcoming; no independently verified zero-retention guarantee |
| Barcode | Browser camera scanning with ZXing, permission messaging, typed-code fallback, Open Food Facts lookup, gram-based nutrient scaling and review | Product coverage varies; fuller product/Nutri-Score sheet, BLS/USDA and attribution page upcoming |
| Meal score | Photo/barcode/manual evidence, versioned estimated 1–10 score or null, independent confidence, saved explanation and failure-tolerant logging | No personal health score; real photo/barcode examples and signed-in cross-device verification remain upcoming |
| Daily app | Remaining/eaten calories, nutrient rings, grouped meals, manual logging, delete, saved meal-score review/edit, weight chart, seven-day bars and streak counter | Screen-by-screen logic review still upcoming; no claim that all screenshot features or streak grace rules are built |
| Language/formatting | German default, English switch; shared `Intl` helpers for `de-DE` / `en-GB`; Today calorie displays, progress weight input/chart values and selected onboarding values use them; profile language sync implemented | **Partial rollout:** raw numbers still occur in capture/review, onboarding result calories and settings target summary; comma/dot parsing is implemented for weight, not all nutrition inputs |
| Plans | Account precedes Free/Premium choice; preview shows 29,00 €/year and 3-day trial | No checkout or paid entitlement; everyone currently gets 3 photo scans/day; future verified Pro permits unlimited scans |
| Native iOS | HealthKit, workout-calorie credit and Apple sign-in explicitly deferred | No web placeholders or simulated health sync |

## Documentation checkpoint — 11 Oct 2026

These documents describe the current **web app**, not an already-built native app. `Masterplan.md` defines product decisions, `tasks.md` tracks delivery and verification, `Implementation-plan.md` uses the same phase numbers, `app-flow-pages-and-roles.md` describes actual navigation, and `Design-guidelines.md` records approved visuals. `Onboarding-progress.md` preserves the detailed screen sequence; `Meal-score-rubric.md` defines scoring.

For every agreed coding, behaviour or design change, save the corresponding documentation and task updates in the same delivery. Mark implemented, partial, upcoming and unverified work separately. Do not overwrite approved decisions, silently promote placeholders to completed features, or claim remote GitHub synchronization without checking it. Historical native specifications in `prompt.md` and `Provider-Recommendations.md` do not override this web checkpoint.
