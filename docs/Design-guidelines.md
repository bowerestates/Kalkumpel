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

Plan preview: **5,99 €/week**, **11,99 €/month** or **34,99 €/year**, **3-day trial on all plans**, Free **3 AI photos/day**, future Pro **unlimited photos/day**. There is no implemented payment or active trial; Premium explains unavailability rather than granting local paid status.

## 5. Capture, barcode and meal-score design

- Photo and barcode capture include German/English camera-access messages, loading/error states and usable fallbacks.
- Photo results allow ingredient/portion edits before saving. Browser camera barcode scanning and typed-code Open Food Facts lookup are implemented, with gram-scaled nutrition review.
- Fuller product/Nutri-Score layout and scan-tips screen remain future work; do not depict them as already delivered.
- OpenAI is the current server provider via Lovable AI Gateway (`AI_VISION_MODEL = "openai/gpt-6-luna"`); this is not a visible provider badge or a claim of model availability/privacy certification.
- Meal score: compact **Mahlzeiten-Score**, 1–10 or insufficient information, “Geschätzt”, expandable reasons, optional practical balance idea, confidence and non-medical disclaimer. Supportive mint styling; no shame, red failure indicator or calorie-based good/bad label.
- Saved scores reopen without AI. Reassessment failure must still leave saving available. See Meal-score-rubric.md.

## 6. Language-aware presentation (complete web rollout)

All text uses DE/EN dictionaries. Numbers/dates use the selected language through shared `Intl` helpers: German **2.150 kcal / 75,5 kg / 11.10.2026**; English (`en-GB`) **2,150 kcal / 75.5 kg / 11/10/2026**. Unit preferences are separate from language and stored measurements remain metric.

All existing web number/date displays now share the selected-language helpers: Today calorie/macro totals, Progress weights/streaks/day labels, photo/barcode/manual capture and saved meal review, onboarding pace/result/month and height/weight controls, Settings values/targets and the plan prices. Shared decimal drafts accept comma or dot, preserve valid numeric values after invalid edits, and format on blur. German price: **34,99 €**; English: **€34.99**. Stored data remains numeric, CSS percentages remain unlocalized, and date-only keys stay calendar days. Birth years are identifiers displayed without thousands grouping. Regression suite: 11 passing tests; live guest DE/EN checks passed on Today, Progress, Settings, Paywall and weight saving, with no page errors. Authenticated cross-device verification remains separate.

## 7. Deferred reference designs

Weekly green/yellow/red/grey day rings are live on Heute and Fortschritt (Mon–Sun strip, seven-day bars). Ring reference thresholds: green within target or at most 100 kcal over; yellow 101–250 over; red more than 250 over; grey unlogged. The "Ringfarben erklärt" guide (`/ringfarben`, linked from both screens) shows the current Mon–Sun week with real dates in the rings — the person's own days once anything is logged, otherwise a target-relative sample week that always shows all four colours — plus a matching sample date and kcal example on every colour row, so it is clear where the rings are seen.

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
| Daily app | Remaining/eaten calories, nutrient rings, grouped meals, manual logging, delete, saved meal-score review/edit on the meal detail page (`/mahlzeit/$id`: meal type · date caption, editor, score card, save, back, red text "Mahlzeit löschen"), weight chart, seven-day bars and streak counter, weekly day-ring strip (Mon–Sun, green ≤ target+100 / yellow ≤ +250 / red beyond / grey empty) and "Schnell korrigieren" correction card (+/− kcal, one correction per day, synced) | Screen-by-screen logic review still upcoming; streak grace rules and remaining screenshot features not built |
| Language/formatting | Complete Phase 0 web rollout: selected-language `Intl` numbers, dates and EUR prices across Today, Progress, Capture/review, onboarding and Settings; comma/dot weight, nutrition and portion input; profile language sync implemented | 11 regression tests pass; guest browser checks pass in DE/EN for Today, Progress, Settings, annual price and weight saving; authenticated cross-device checks remain separate |
| Plans | Account precedes Free/Premium choice; preview shows 5,99 €/week, 11,99 €/month and 34,99 €/year (annual marked “Spare 76 %”), 3-day trial on all plans | No checkout or paid entitlement; everyone currently gets 3 photo scans/day; future verified Pro permits unlimited scans |
| Native iOS | HealthKit, workout-calorie credit and Apple sign-in explicitly deferred | No web placeholders or simulated health sync |

## Documentation checkpoint — 11 Oct 2026

These documents describe the current **web app**, not an already-built native app. `Masterplan.md` defines product decisions, `tasks.md` tracks delivery and verification, `Implementation-plan.md` uses the same phase numbers, `app-flow-pages-and-roles.md` describes actual navigation, and `Design-guidelines.md` records approved visuals. `Onboarding-progress.md` preserves the detailed screen sequence; `Meal-score-rubric.md` defines scoring.

For every agreed coding, behaviour or design change, save the corresponding documentation and task updates in the same delivery. Mark implemented, partial, upcoming and unverified work separately. Do not overwrite approved decisions, silently promote placeholders to completed features, or claim remote GitHub synchronization without checking it. Historical native specifications in `prompt.md` and `Provider-Recommendations.md` do not override this web checkpoint.


## Water card (17 Oct 2026)
The Wasser card on Heute sits below the macro rings and uses the Wasser badge blue (not mint) for its icon, progress bar and filled drops, so it reads as water at a glance. It shows today's amount against the personal goal, one drop per 250 ml glass, and "Ziel erreicht – stark!" once reached.

## Badges (16 Oct 2026)
Badges are the one exception to mint-only icons: each group has a soft accent token in src/styles.css — Serien amber, Mahlzeiten emerald, Kalorienziel sky, Wasser blue, Gewicht gold, Gewohnheiten & Spaß violet, Freunde rose. Every badge uses Gordon's flame-shield emblem (metal shield, concentric rings, flame; approved 17 Oct 2026). Earned badges tint the rings and flame to the group colour with a soft glow and stars for higher tiers; locked badges show the same shield in faded grey with a small lock. The unlock pop-up uses the group colour for the label and the "Weiter so!" button (dark text for contrast).
