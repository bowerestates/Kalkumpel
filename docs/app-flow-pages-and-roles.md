# Kalkumpel — App Flow, Pages & Roles (Web)

## Profile review navigation — 22 Oct 2026 (Personal Details live, remainder planned)

Original **1–41 IDs** and statuses live in [tasks.md](tasks.md); design and implementation briefs share that scope. Personal Details, Preferences, Nutrition Goals and Progress insights (39/41) are live; other destinations are planned, not existing routes.

| Planned entry | IDs | Planned destination / return |
|---|---|---|
| Profil → Persönliche Daten — implemented | 3, 18, 19a–19e | `/profil/daten`: goal weight, current weight, height, birth date/derived age, gender and optional step preference, individual edit/save/cancel; back → `/einstellungen`. All edits preserve targets; weighing upserts today's history. |
| Profil → Einstellungen / health wishes — implemented | 4, 7, 20, 21, 23–26 | `/profil/einstellungen`: theme, celebration and independent consent switches, saved health wishes, Nutrition Goals link (legacy macro switch superseded); back → Profil. No connected status or web energy credit. |
| Profil → Ernährungsziele — implemented | 8, 27, reuse 28 | `/profil/ziele`: four real daily progress/target rings, validated individual edits, automatic calorie scaling and macro-driven calorie totals and confirmed recalculation; back → `/einstellungen`. Weighing never changes targets. |
| Profil → Gewichtshistorie — implemented | 11, 29, 31 | `/profil/gewicht`: latest saved weight/date/change from earliest saved weigh-in with baseline month/year and exact date, sticky add, historical edit and delete confirmation; back → `/einstellungen`. Existing Fortschritt history remains unchanged. Photo association (30/38) and interval table (37) excluded. |
| Profil → Follow Us | 15 | External Instagram `https://www.instagram.com/kalkumpel/` and TikTok `https://www.tiktok.com/@kalkumpel_ki`; no supplied X destination. |
| Profil → Konto löschen | 17 | Destructive confirmation/cancel, verified owner deletion of account/data/photos, failure handling; successful cleanup returns to Welcome. Local reset is not deletion. |
| Heute → empty meal action | 35 | Friendly illustrated real empty state → existing Erfassen; preserve existing macro rings/bars (34). |
| Heute → carryover amount | 33, dependency 24 | Real amount up to 200 kcal only after native carryover execution; not a new web credit or constant example. |
| Fortschritt → insights — implemented | 39, 41 | In-place four-week selector updates dated calorie bars and logged-day average; info icons open explanations for averages/BMI, close returns to same screen. BMI reads current saved profile; no new route or writes. |
| Fortschritt → future date/photos | 36, 38 | Estimated goal date and private photo upload/view/delete with optional weight association (30) remain planned. |

All proposed routes must be created alongside their links during implementation, with their own head metadata and working back navigation. All copy uses DE/EN and locale formatting; date/clock/storage reads retain mounted guards. Step goal is saved intent, not health telemetry. Photo guest/offline/retention/Pro policy remains to be settled; weekly-average missing-day rules are delivered below. BMI uses adult <18.5 / 18.5–<25 / 25–<30 / ≥30 bands with applicability caveats; forecasts are estimates, not medical or outcome promises.

Keep unchanged: 1 header, 2 invites (no money reward), 5 language, 10 reminder page (native notifications deferred), 28 explicit recalculation, 34 Today macros. Ignore 6 family plan, 9 duplicate row, 12 extra Profile ring-guide row (existing guide stays on Fortschritt), 13 native widget carousel on web and 16 logout redesign. Park 14a–14h support/legal presentation/content, 22 Live Activities, 32 PDF, 37 weight interval table, 40 expenditure table. Reviewed privacy/terms remain required before launch. Marketing (26) requires independent opt-in/withdrawal, never inferred from personalisation. Actual health access, burned-calorie credit and rollover execution remain native/deferred (23/24/33).

> Updated: 11 Oct 2026. German “Du” default; English selected in Profile.  
> TanStack Start file routes; local-first state and Gordon’s own Supabase.  
> This is the current web flow. The original native screenshot numbering is not the implemented screen order.

## 1. Roles and access

| State | Implemented access | Limits / future work |
|---|---|---|
| Guest | Welcome and onboarding, local plan/records; existing local app behaviour remains guest/offline capable | Normal completed onboarding leads to account stage before plan choice; local photo quota 3/day |
| Signed-in Free | Email/password or configured Google account, own profile/meals/weights/photos, Today, Capture, Progress and Settings | 3 AI photos/day, server-counted; barcode/manual logging has no photo quota |
| Future Kumpel+ Pro | Preview only, not a delivered paid role | 5,99 €/week, 11,99 €/month or 34,99 €/year, 3-day trial on all plans, unlimited photos after server-verified checkout; advanced paid features upcoming |

Apple sign-in is reserved for native iOS. Google OAuth is wired through Supabase; provider activation and real Google sign-in verification remain upcoming. Consent/profile fields and local `plan` values do not grant subscription entitlements. Future roles live separately from editable profiles.

## 2. Actual route map

| Path | Screen / behaviour |
|---|---|
| `/` | Approved black Welcome, existing logo, start and existing-account links |
| `/onboarding` | 23 base screens plus up to four optional health-preparation pages; questions, setup, result and features |
| `/konto` | White/mint save-progress account screen, consent, Google/email signup and disabled Apple placeholder, confirmation state or existing-account continuation |
| `/auth` | Google/email sign-in/signup, disabled Apple placeholder, email reset request and public Google return; validated plan continuation |
| `/reset-password` | Password reset completion |
| `/profil/daten` | Personal Details (3/18/19): real goal-weight summary, five pencil-edit rows, validated save/cancel dialogs and back arrow to Profil; local save/reload verified, account readback remains separate |
| `/profil/einstellungen` | Preferences: appearance, celebrations, Nutrition Goals link replacing the former macro switch, saved health wishes and independent personalisation/marketing consent; back to Profil |
| `/profil/ziele` | Nutrition Goals: real daily rings, four manual targets, pencil/save/cancel, automatic linked target edits and confirmed all-target recalculation; back to Profil |
| `/profil/gewicht` | Weight History: real latest date/weight, earliest-entry baseline change, all saved rows, sticky add, edit/save/cancel and confirmed delete; local-day upsert, 20–400 kg inclusive, no target changes. Back to Profil; existing weight sync reused. 90 tests and guest DE/EN browser/reload checks pass; account readback unverified. |
| `/paywall` | Signed-out visitors return to account stage; Free continuation to Today; Premium explains unavailability |
| `/heute` | Daily calories/macros and grouped meals; delete and saved meal-score review/edit; compact „Wasserkonsum“ tab links to `/wasser` |
| `/wasser` | Detailed water page: big blue ring, glass drops, goal explanation, −/+250/+500/+1.000 ml buttons and „Letzte 7 Tage“ with real local dates; back arrow returns to Heute |
| `/erfassen` | Photo/camera upload, barcode camera or typed lookup, local food search and manual input; editable meal review/score before logging |
| `/fortschritt` | Compact streak and earned-badge shield/count side by side; shield links to `/erfolge`. Weight log/chart, period filters, start/current/goal, dated coloured rings, seven-day calorie bars and weigh-in edit/delete remain |
| `/erfolge` | All 28 achievable badges immediately visible, earned or locked; grouped flame shields with hover/focus explanations above each badge and tap details; back arrow returns to Fortschritt |
| `/ringfarben` | Ring-colour guide: the current Mon–Sun week with real dates in coloured rings (own days once logged, otherwise a sample week showing all four colours) plus a sample date and kcal example per colour; linked from Fortschritt (the Heute strip shows the rings without a link) |
| `/mahlzeit/$id` | Saved meal detail page: view, edit and delete a meal with its meal score; opening it never reruns AI scoring |
| `/einladen` | Personal invite link with copy/share and friends-joined count; guests are asked to create an account first |
| `/erinnerungen` | Five independent meal/end-of-day time inputs and switches; immediate device-only saving, all off by default; notifications deferred to native iOS/Android |

Reminder editing (23 Oct 2026): select the visible time field for any meal or end of day → type a time or use the native picker → valid time saves immediately → reopen/reload retains it. The switch can remain off throughout; other times and switches are unchanged. Native input presentation follows the browser locale, while saved wall-clock values remain HH:mm. All five edits/reload and phone fit verified; no notification or account-sync claim.

| `/einstellungen` | Profile editing/target calculation, language, account controls, link to reminder settings, optional personalisation withdrawal and local reset |

`/mahlzeit/$id` is the meal detail page: tapping a meal on Today opens it to view meal type/date, edit evidence and nutrients, reassess the score on request, save or delete. Unknown or deleted meals show a friendly message with a way back to Today.

## 3. Onboarding and account journey

Welcome → gender → workouts → birthday → source → prior apps → illustrative weight comparison → height → current weight → goal → target weight → plan statement → pace → activity → diet → same-person/medal comparison → obstacle → desired outcome → potential → community crowd → thank-you → optional burned-calorie preference → workout-sync preference → connection preparation → rollover preference → setup → result → features → **account** → **plan choice** → Today.

The first 20 base screens use the question/interstitial progress bar. Optional pages 20a–20d follow Thanks with a separate four-segment progress line; setup/result/features retain base numbers 21–23 and account retains base number 24. Up to 28 screens can now appear after Welcome. [Onboarding-progress.md](Onboarding-progress.md) is the detailed order and interaction reference.

- Goal is immediately after current weight: **Abnehmen / Gewicht halten / Muskeln aufbauen**.
- Birthday feeds age; workout bucket presets activity, with a later activity override.
- Weight/height inputs support kg/lbs and cm/ft-in; stored measurements stay metric. The horizontally scrolling weight scale changes the selected value.
- Plan statement uses current-to-target difference; pace guidance uses weight, height, goal and target BMI. Calories/macros and projected date derive from calculations, not remote AI setup.
- Setup animation presents calculation progress, not proof of account creation in the background. There is no personal health score before logging a meal.
- Comparison/potential/community art is illustrative. No invented ratings, counts, guaranteed results or testimonials.
- Completing features writes the local profile/targets/starting weight and validated extra answers, then opens `/konto`.
- Storage and optional recipe/workout personalisation consent begin unchecked; storage consent gates Google and the email form. Email confirmation may be required; the local plan draft remains. Real delivery/settings/cross-device verification is still upcoming.
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
- Extended trend periods, streak grace and 28 badges are built; badges are reached via the single icon on Fortschritt. Progress-photo diary remains upcoming.
- Reminder times and switches are built at `/erinnerungen`; notification delivery is reserved for native iOS/Android (Gordon, 17 Oct 2026), with no web delivery or account preference sync. Rollover, referral/trainer questions, broader diet/multi-select answers and result edit pencils remain upcoming.
- BLS/USDA grounding, fuller product sheet and in-app license/source page.
- Real checkout/trial, separate verified Pro roles, paid reports/micronutrients/macro cycling.
- Reviewed terms/privacy, retention, full consent records/withdrawal and account deletion/export.
- Native iOS Apple sign-in, HealthKit, Android Health Connect and workout-calorie credit. References IMG_3256, IMG_3258, IMG_3259 and IMG_3260 inform optional web preparation pages; actual integration is deferred, with no simulated connection. Their reference example workout numbers are not real user data.

## Current web feature checkpoint

| Feature | Implemented now | Remaining / limitations |
|---|---|---|
| Branding | Approved scanner-plate/flame Welcome logo and favicon; Gordon confirmed keeping the existing logo permanently | No replacement with older `assets/` logos |
| Onboarding | 23 base in-route screens plus up to four optional health-preparation pages after Thanks, followed by the separate account stage | Full order in `Onboarding-progress.md`; remaining reference polish/options in `tasks.md` |
| Targets | Mifflin-St Jeor-based calories/macros, goal-weight difference, guided pace and estimated target date | Estimates, not guaranteed outcomes; result-screen editing remains upcoming |
| Accounts | Email/password signup/sign-in/reset plus Google OAuth wiring and a disabled native Apple placeholder, local plan draft, owner-scoped Supabase sync, unchecked storage and optional personalisation consent | Real confirmation delivery and cross-device checks still unverified; legal review, retention, export/deletion and complete consent history required |
| Photo analysis | Server-side OpenAI via Lovable AI Gateway; configured `AI_VISION_MODEL = "openai/gpt-6-luna"`; ingredient/portion review before saving; signed-in private photos | Model availability/access depends on provider; BLS grounding and scan-tips screen upcoming; no independently verified zero-retention guarantee |
| Barcode | Browser camera scanning with ZXing, permission messaging, typed-code fallback, Open Food Facts lookup, gram-based nutrient scaling and review | Product coverage varies; fuller product/Nutri-Score sheet, BLS/USDA and attribution page upcoming |
| Meal score | Photo/barcode/manual evidence, versioned estimated 1–10 score or null, independent confidence, saved explanation and failure-tolerant logging | No personal health score; real photo/barcode examples and signed-in cross-device verification remain upcoming |
| Daily app | Remaining/eaten calories, nutrient rings, grouped meals, manual logging, delete, saved meal-score review/edit, weight chart, seven-day bars and streak counter | Screen-by-screen logic review still upcoming; no claim that all screenshot features or streak grace rules are built |
| Language/formatting | Complete Phase 0 web rollout: selected-language `Intl` numbers, dates and EUR prices across Today, Progress, Capture/review, onboarding and Settings; comma/dot weight, nutrition and portion input; profile language sync implemented | 11 regression tests pass; guest browser checks pass in DE/EN for Today, Progress, Settings, annual price and weight saving; authenticated cross-device checks remain separate |
| Plans | Account precedes Free/Premium choice; preview shows 5,99 €/week, 11,99 €/month and 34,99 €/year (annual marked “Spare 76 %”), 3-day trial on all plans | No checkout or paid entitlement; everyone currently gets 3 photo scans/day; future verified Pro permits unlimited scans |
| Native iOS | HealthKit, workout-calorie credit and Apple sign-in explicitly deferred | Optional iOS/Android onboarding holders built; no live health sync or budget changes |

## Documentation checkpoint — 11 Oct 2026

These documents describe the current **web app**, not an already-built native app. `Masterplan.md` defines product decisions, `tasks.md` tracks delivery and verification, `Implementation-plan.md` uses the same phase numbers, `app-flow-pages-and-roles.md` describes actual navigation, and `Design-guidelines.md` records approved visuals. `Onboarding-progress.md` preserves the detailed screen sequence; `Meal-score-rubric.md` defines scoring.

For every agreed coding, behaviour or design change, save the corresponding documentation and task updates in the same delivery. Mark implemented, partial, upcoming and unverified work separately. Do not overwrite approved decisions, silently promote placeholders to completed features, or claim remote GitHub synchronization without checking it. Historical native specifications in `prompt.md` and `Provider-Recommendations.md` do not override this web checkpoint.

## Optional health onboarding — 17 Oct 2026

After „Danke für Dein Vertrauen!“ and before calculation setup, up to four optional pages appear: (1) burned-calorie preference, (2) sync workouts with Apple Health / Health Connect, (3) connection preparation, (4) rollover preference (future maximum 200 kcal). The original 20-step progress remains unchanged; the optional stage has its own four-segment progress. iPhone/iPad and Android are detected after hydration; desktop offers an explicit platform choice. Platform detection is presentation only, never proof that a native service exists.

Every page has „Überspringen“, which resets all optional wishes and goes directly to setup. „Nein“ declines the current preference; declining workout sync bypasses the connection page and opens rollover. Back returns through the optional pages or to Thanks. Preparing a connection saves only a request and shows that permissions/connection come later in the native app; no connected checkmark, OS permissions or fake success. Example workout/budget numbers and rollover visuals are labelled examples and never become meal/activity data.

On feature completion, `onboardingDetails.healthSetup` saves version, platform, addBurnedCalories, syncWorkouts, connectionRequested, connectedPlatform (always null), and rolloverCalories locally. Existing owner-only profile JSON sync carries these validated wishes when signed in; no migration is required. Native apps must request real consent separately. Targets and all current calorie calculations are unchanged. Real account cross-device readback remains unverified.

Testing: complete onboarding through Thanks, exercise Yes/No, switch Apple Health/Health Connect, prepare then continue, or skip any page; verify setup/result/account continue normally and saved wishes survive reload. Native integration is the next step, not delivered by these holders.


## Google account layout — 19 Oct 2026

Implemented: `/konto` and `/auth` show Apple (disabled, future iOS label), Google and email, preserving the white/mint design. On `/konto`, required storage consent gates Google/email and optional personalisation stays separate; choices are saved before leaving for Google. Google uses Gordon’s existing Supabase Auth, not a workspace Google connector. The callback is the same-origin public `/auth?oauth=google`, with `&next=paywall` for onboarding. The SDK establishes its session and `getUser()` validates it; onboarding returns to `/konto` to confirm consent before plan choice, while other accounts continue to Today or onboarding. No paid entitlement is granted and no second auth listener was added.

Upcoming setup: create a Web application OAuth client in Google Cloud; register the callback URL shown in Supabase’s Google provider panel, configure the email/profile/openid scopes and enable Google in Supabase with the client ID/secret. Allow the exact app return URLs for each origin in Supabase Authentication → URL Configuration. Test Google in the published app or preview opened in a new tab, not the editor frame. Real Google login/account sync requires that provider setup; Apple is not a working web sign-in method.


## Nutrition Goals checkpoint — 22 Oct 2026

Implemented items 8/27 at `/profil/ziele`, reached from Profil, with a back arrow, four vertical cards, real local-day consumed-to-target rings, existing calorie/protein/carbohydrate/fat tokens, pencil dialogs and explicit save/cancel. Values use selected-language formatting and comma/dot decimal drafts. Technical guards: 1,200–10,000 kcal, 0–2,500 g per macro, finite values stored to two decimals; these are input safeguards, not personalised dietary advice.

Every intentional calorie edit scales all three macros proportionally using their current energy shares (protein/carbohydrate 4 kcal/g, fat 9 kcal/g), independent of the legacy opt-in. Every macro edit recalculates calories as protein × 4 + carbohydrate × 4 + fat × 9 and preserves the other two macro amounts. All three dependent values are previewed before saving. All-zero macro ratios reject rather than guessing. Direct macro edits leave the other two macros unchanged but update calories; derived calories must also remain within the existing guards. „Ziele neu berechnen“ reuses existing `calcTargets`, previews all four estimates and requires confirmation before replacing manual values. No profile, meal, weight or health behaviour changed; existing owner-only target sync is reused, no migration or entitlement change.

Verification: 67 tests pass; guest browser all-field saves, invalid rejection, cancellation, reload, automatic linked updates, confirmed recalculation, back navigation, actual meal ring totals and English phone fit pass, with no page errors and a clean preview build. Signed-in cross-device readback remains unverified (external unmanaged Supabase). Next: Weight History (11/29–31).


## Linked manual nutrition edits — 22 Oct 2026
Gordon selected “Update calorie total”. Macro edits now recalculate calories using 4/4/9 kcal per gram, preserving the other two macro amounts. Calorie edits automatically scale all three macros proportionally, regardless of the legacy auto-adjust preference. This replaces the earlier opt-in-only behavior; the obsolete switch becomes a Nutrition Goals link, and existing stored preference data is not deleted. Drafts preview dependent values; Save commits all linked targets atomically. Invalid derived calories reject the entire edit. No automatic change on mount, preference loading, weighing or personal edits. Explicit full recalculation and owner-only sync are unchanged.

Verified: all four real UI edits, dependent previews, invalid rejection, cancel and reload; no browser page errors, 69 tests pass, preview build clean. Authenticated cross-device readback remains unverified. How to test: Ernährungsziele → edit Eiweiß/Fett/Kohlenhydrate and confirm calories update; edit Kalorien and confirm all three macros scale; save and reload. Next: Weight History (11/29–31).


## Progress insights delivery — items 39/41, 22 Oct 2026

- **Weekly calculation:** Local Monday–Sunday weeks; average over days with finite calorie entries only (including correction-only days). Signed corrections are included once, daily totals clamp at zero, missing/future days are excluded, and no data shows an unknown average rather than zero. Partly logged days may understate intake. Four selectors cover this week and the preceding three weeks; current targets colour rings only, not historical target evidence.
- **BMI calculation and presentation:** Read-only BMI uses current saved profile weight / height²; valid ranges reuse 20–400 kg and 100–250 cm. Adult age 18–100 is derived from a real birthday when available, otherwise stored age; invalid/minor profiles show an unavailable explanation with no adult category. Unrounded BMI determines <18.5 / 18.5–<25 / 25–<30 / ≥30 bands (blue/green/amber/red). Equal-width segments map 10/18.5/25/30/40 to 0/25/50/75/100%, clamping outside 10–40; outer limits are visual only, not eligibility/category boundaries. The information dialog explains formula, non-diagnostic limits, muscle mass/body build and pregnancy/breastfeeding applicability. No profile or nutrition-target writes.
- **Verification:** 82 tests pass (including 13 new insight tests; local DST week checked in Europe/Berlin); German desktop and English 390 px browser checks verified all four averages, info dialogs, empty/minor states, weight edit → BMI 25.0 to 30.0, reload and unchanged targets, with no page errors. Existing local/account data paths are reused; authenticated cross-device checks remain unverified (external unmanaged Supabase).
- **How to test:** Fortschritt → select each historical week, check dates/average and open its information icon. Check BMI and its information icon; edit weight under Profil → Persönliche Daten, return/reload, and confirm BMI changes but calorie/macronutrient targets do not. Switch English to verify numbers/dates.
- **Next:** Weight History (11/29–31); 36/38 remain upcoming. Documentation GitHub delivery is tracked in tasks/roadmap.
