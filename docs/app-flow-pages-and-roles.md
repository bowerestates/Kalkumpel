# Kalkumpel — App Flow, Pages & Roles (Web)

> Updated: 11 Oct 2026. German “Du” default; English selected in Profile.  
> TanStack Start file routes; local-first state and Gordon’s own Supabase.  
> This is the current web flow. The original native screenshot numbering is not the implemented screen order.

## 1. Roles and access

| State | Implemented access | Limits / future work |
|---|---|---|
| Guest | Welcome and onboarding, local plan/records; existing local app behaviour remains guest/offline capable | Normal completed onboarding leads to account stage before plan choice; local photo quota 3/day |
| Signed-in Free | Email/password account, own profile/meals/weights/photos, Today, Capture, Progress and Settings | 3 AI photos/day, server-counted; barcode/manual logging has no photo quota |
| Future Kumpel+ Pro | Preview only, not a delivered paid role | 5,99 €/week, 11,99 €/month or 34,99 €/year, 3-day trial on all plans, unlimited photos after server-verified checkout; advanced paid features upcoming |

Apple sign-in is reserved for native iOS. Google is not implemented. Consent/profile fields and local `plan` values do not grant subscription entitlements. Future roles live separately from editable profiles.

## 2. Actual route map

| Path | Screen / behaviour |
|---|---|
| `/` | Approved black Welcome, existing logo, start and existing-account links |
| `/onboarding` | 23 in-route screens; questions, setup, result and features |
| `/konto` | White/mint save-progress account screen, consent, email signup/confirmation state or existing-account continuation |
| `/auth` | Email/password sign-in/signup/reset request; validated plan continuation |
| `/reset-password` | Password reset completion |
| `/paywall` | Signed-out visitors return to account stage; Free continuation to Today; Premium explains unavailability |
| `/heute` | Daily calories/macros and grouped meals; delete and saved meal-score review/edit |
| `/erfassen` | Photo/camera upload, barcode camera or typed lookup, local food search and manual input; editable meal review/score before logging |
| `/fortschritt` | Weight log/chart, start/current/goal, seven-day calorie bars and streak |
| `/einstellungen` | Profile editing/target calculation, language, account controls, optional personalisation withdrawal and local reset |

`/mahlzeit/$id` is the meal detail page: tapping a meal on Today opens it to view meal type/date, edit evidence and nutrients, reassess the score on request, save or delete. Unknown or deleted meals show a friendly message with a way back to Today.

## 3. Onboarding and account journey

Welcome → gender → workouts → birthday → source → prior apps → illustrative weight comparison → height → current weight → goal → target weight → plan statement → pace → activity → diet → same-person/medal comparison → obstacle → desired outcome → potential → community crowd → thank-you → setup → result → features → **account** → **plan choice** → Today.

The first 20 in-route screens use the question/interstitial progress bar; setup, result and features are screens 21–23. The account stage is the 24th screen after Welcome. [Onboarding-progress.md](Onboarding-progress.md) is the detailed order and interaction reference.

- Goal is immediately after current weight: **Abnehmen / Gewicht halten / Muskeln aufbauen**.
- Birthday feeds age; workout bucket presets activity, with a later activity override.
- Weight/height inputs support kg/lbs and cm/ft-in; stored measurements stay metric. The horizontally scrolling weight scale changes the selected value.
- Plan statement uses current-to-target difference; pace guidance uses weight, height, goal and target BMI. Calories/macros and projected date derive from calculations, not remote AI setup.
- Setup animation presents calculation progress, not proof of account creation in the background. There is no personal health score before logging a meal.
- Comparison/potential/community art is illustrative. No invented ratings, counts, guaranteed results or testimonials.
- Completing features writes the local profile/targets/starting weight and validated extra answers, then opens `/konto`.
- Storage and optional recipe/workout personalisation consent begin unchecked; storage consent gates the email form. Email confirmation may be required; the local plan draft remains. Real delivery/settings/cross-device verification is still upcoming.
- Existing-account sign-in returns through the account/plan continuation. Free starts the app; Premium cannot create an entitlement or start a real trial yet.

Saved extra profile details include full birth date, workout bucket, source, prior-app answer, single obstacle/outcome, kg/lbs choice and weekly pace. Consent stores a version and latest timestamp; optional personalisation can be withdrawn in Profile. Height display preference and full consent history/withdrawal/deletion/export are not yet delivered. Legal review is required before launch or future reuse of sensitive information; no marketing email permission is assumed.

## 4. Capture and saved-meal flow

### Photo
User opens photo mode → reads camera-access message → takes/selects photo → image reduced to at most 1024 px → server photo quota checked for accounts → OpenAI estimate via Lovable AI Gateway → ingredients/portions can be edited → estimated meal-quality review → save to local log and account sync. Signed-in images use private meal-photo storage. Guests use local scan counts; all users currently have 3 photos/day.

The configured server model is `openai/gpt-6-luna`, shared by photo analysis and scoring through one `AI_VISION_MODEL` constant. This records current code, not verified cheapest pricing, zero-retention certification or guaranteed future model availability.

### Barcode
User chooses barcode → reads camera-access message → browser camera/ZXing detects code, or user types code → Open Food Facts lookup → product/brand and nutrients → gram portion scaling → review/score → save. Permission denial, camera support and product coverage may require the typed-code/manual fallback. General text search is local sample food data, not a complete online catalogue. Fuller product/Nutri-Score and source-attribution screens remain upcoming.

### Manual and meal score
User enters meal/known nutrients → review the same evidence/score card → save. `meal-quality-v1` supplies 1–10 or null, independent confidence and supportive explanation. Unknown nutrients are not zeros for scoring; calories alone are not a penalty. Saved evidence/score is local and mirrored to the owner’s entries. Reopening costs no AI request; edits/explicit reassessment recalculate. Scoring errors never block saving. See [Meal-score-rubric.md](Meal-score-rubric.md).

## 5. Language and formatting

Copy comes from `src/lib/i18n.ts`. The local selected language mirrors to `profiles.preferred_language` through `sync.ts`. `src/lib/format.ts` uses `Intl.NumberFormat` / `Intl.DateTimeFormat`, `de-DE` or `en-GB`:

| Value | German | English |
|---|---|---|
| Calories | 2.150 kcal | 2,150 kcal |
| Weight | 75,5 kg | 75.5 kg |
| Short date | 11.10.2026 | 11/10/2026 |

Phase 0 rollout is complete throughout Today, Progress, Capture/review, onboarding and Settings, including EUR price formatting (`34,99 €` / `€34.99`). Weight, nutrition and portion drafts accept comma/dot; blur renders the active locale without changing numeric storage. Date-only keys are parsed as local calendar days; CSS/SVG numeric values and birth-year identifiers are not thousands-formatted. 11 regression tests pass; live guest DE/EN Today/Progress/Settings/price and weight-saving checks pass with no page errors. Real account sync checks remain a separate task.

## 6. Screens not yet implemented

- Meal-detail page `/mahlzeit/$id`, weekly day-ring strip and quick correction are built.
- Extended trend periods, streak grace window, badges and progress-photo diary.
- Live reminders, rollover, referral/trainer questions, broader diet/multi-select answers and result edit pencils.
- BLS/USDA grounding, fuller product sheet and in-app license/source page.
- Real checkout/trial, separate verified Pro roles, paid reports/micronutrients/macro cycling.
- Reviewed terms/privacy, retention, full consent records/withdrawal and account deletion/export.
- Native iOS Apple sign-in, HealthKit and workout-calorie credit. References IMG_3256, IMG_3258 and IMG_3259 are parked for native iOS only; no web simulation. Their reference example workout numbers are not real user data.

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
| Language/formatting | Complete Phase 0 web rollout: selected-language `Intl` numbers, dates and EUR prices across Today, Progress, Capture/review, onboarding and Settings; comma/dot weight, nutrition and portion input; profile language sync implemented | 11 regression tests pass; guest browser checks pass in DE/EN for Today, Progress, Settings, annual price and weight saving; authenticated cross-device checks remain separate |
| Plans | Account precedes Free/Premium choice; preview shows 5,99 €/week, 11,99 €/month and 34,99 €/year (annual marked “Spare 76 %”), 3-day trial on all plans | No checkout or paid entitlement; everyone currently gets 3 photo scans/day; future verified Pro permits unlimited scans |
| Native iOS | HealthKit, workout-calorie credit and Apple sign-in explicitly deferred | No web placeholders or simulated health sync |

## Documentation checkpoint — 11 Oct 2026

These documents describe the current **web app**, not an already-built native app. `Masterplan.md` defines product decisions, `tasks.md` tracks delivery and verification, `Implementation-plan.md` uses the same phase numbers, `app-flow-pages-and-roles.md` describes actual navigation, and `Design-guidelines.md` records approved visuals. `Onboarding-progress.md` preserves the detailed screen sequence; `Meal-score-rubric.md` defines scoring.

For every agreed coding, behaviour or design change, save the corresponding documentation and task updates in the same delivery. Mark implemented, partial, upcoming and unverified work separately. Do not overwrite approved decisions, silently promote placeholders to completed features, or claim remote GitHub synchronization without checking it. Historical native specifications in `prompt.md` and `Provider-Recommendations.md` do not override this web checkpoint.
