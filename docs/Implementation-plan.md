# Kalkumpel — Implementation Plan (Web)

> Updated: 11 Oct 2026. Phase numbering matches [tasks.md](tasks.md).  
> Current stack: TanStack Start / React / TypeScript / Tailwind v4 / Gordon’s Supabase / OpenAI through Lovable AI Gateway.  
> Legend: `[x]` implemented/documented · `[~]` partial · `[ ]` upcoming or unverified. Historical native work is not a web completion claim.

## Phase 0 — Foundation (complete)
- [x] App shell, daily tabs, German/English dictionaries and language switch.
- [x] Approved scanner-plate Welcome logo and favicon retained permanently; black Welcome, white/mint app, Plus Jakarta Sans and unchanged nutrient colours.
- [x] Shared language-aware `Intl` formatting helpers (`de-DE` / `en-GB`) and comma/dot weight parser.
- [x] Formatting wired throughout Today, Progress, Capture/review, onboarding result/pace/calendar controls, Settings and annual price.
- [x] Shared decimal inputs/parser accept comma or dot for nutrition, portions and weights; calendar-only keys render as local dates. Full suite: 11 tests pass; live guest DE/EN display and weight-save checks pass; preview build clean. Phase 0 is closed.

## Phase 1 — Onboarding
- [x] 23 base in-route screens plus up to four optional health-preparation pages and the separate account stage; full order and save boundaries in [Onboarding-progress.md](Onboarding-progress.md).
- [x] Weight/height controls, goal-weight difference, pace guidance, target calculations, setup animation and result curve.
- [x] White/mint reference adaptations, matching person/medal figures, community crowd without invented claims.
- [x] Save base profile, targets, starting weight and validated additional answers locally; sync through owner-only account records.
- [x] Google/email account stage with a disabled Apple placeholder before plan choice, unchecked required storage consent and optional future recipe/workout personalisation; optional withdrawal in Profile.
- [ ] Reference polish, result edit controls, height display-unit persistence and optional extra questions/options listed in tasks.md. Optional health-preparation pages are built; actual HealthKit/Health Connect access remains native-only.

## Phase 2 — Accounts and security
- [x] Gordon’s own connected Supabase, email/password signup/sign-in/reset, private photos and owner-only records.
- [x] Guest-data upload and account sync of profile details, versioned latest consent, meals, weights and preferred language.
- [x] Server-only signed-in scan usage writes; users cannot edit quotas.
- [ ] Verify real email confirmation and cross-device profile/meal persistence; hosted auth settings/delivery are not certified by source review.
- [ ] Legal-reviewed notices, lawful basis, retention, consent history/full withdrawal and deletion/export.
- [ ] Separate server-verified subscription roles. Apple sign-in belongs to native iOS; Google OAuth is wired through Supabase; provider activation and real Google sign-in verification remain upcoming.

## Phase 3 — Daily app and logging
- [x] Today calories/macros, grouped daily meals, manual logging and deletion.
- [x] Saved meal-score review and evidence edits on the dedicated meal detail page `/mahlzeit/$id` (opened from Today; save, delete, not-found state).
- [ ] Review Today, Capture, Progress, Profile and Paywall screen by screen; build missing real behaviour as agreed.
- [x] Weekly coloured day rings and quick calorie correction (one correction entry per day, server-synced `is_correction`); meal-detail route `/mahlzeit/$id` built.

## Phase 4 — AI photos and meal score
- [x] Real image upload/analysis, resized image, structured items/grams/calories/macros/confidence.
- [x] OpenAI via Lovable AI Gateway; single server `AI_VISION_MODEL = "openai/gpt-6-luna"` constant. No model change in this documentation task.
- [x] Camera permission messaging, ingredient/portion edits and private signed-in photo storage.
- [x] Free photo quota: 3/day; account counts server-side, guests local. Unlimited Pro waits for verified payment access.
- [x] `meal-quality-v1` for photo/barcode/manual meals, saved evidence/results, no request on reopening, safe reassessment and save-on-failure.
- [ ] Scan-tips screen, BLS grounding, real photo/barcode example checks and signed-in score sync verification. Provider retention/access claims need independent verification.

## Phase 5 — Barcode and reference data
- [x] Browser camera barcode detection via ZXing; typed-code fallback and access/error messages.
- [x] Open Food Facts product lookup, name/brand, per-100-g nutrients, gram portion scaling and review before logging.
- [~] General text product search is a local sample catalogue, not a comprehensive online food search.
- [ ] Fuller product/Nutri-Score sheet, BLS staples, USDA fallback and Open Data & Licenses view.

## Phase 6 — Progress and streaks
- [x] Weight logging/chart, start/current/goal, seven-day calorie bars and streak counter.
- [x] Streak 24 h grace (one missed day bridged), weight periods 7/14/30/90/Alles, date-spaced chart, weigh-in edit/delete (16 Oct 2026).
- [x] Approved 28 badges, grouped flame-shield visuals, unlock celebrations and account sync. Fortschritt has compact streak/earned-count summaries; the badge icon opens all 28 achievable badges immediately on `/erfolge` (earned and locked, hover/focus explanations, tap details and back arrow), updated 22 Oct 2026.
- [ ] Progress-photo diary (needs verified Pro).
- [ ] Workout-energy balance depends on future native activity integration; no simulated web sync.

## Phase 7 — Settings
- [x] Language change and profile language sync, profile editing/recalculated targets, local reset and optional personalisation withdrawal.
- [x] Meal-reminder preference page `/erinnerungen` (17 Oct 2026): independently editable local times and switches for four meals and end of day; immediate device-only persistence, validated reload and reset; DE/EN copy. No timers, push services, account sync or permission requests.
- [ ] Native iOS/Android notification delivery explicitly deferred by Gordon; add permission, device-local recurring scheduling, time-zone rescheduling and cancellation in native apps.
- [ ] App-wide metric/imperial preference, approved legal pages and account deletion/export. Local reset is not server account deletion.

## Phase 8 — Subscriptions
- [~] Account-gated Free/Premium preview at 5,99 €/week, 11,99 €/month or 34,99 €/year with a proposed 3-day trial on all plans.
- [ ] Stripe checkout, verified entitlement in separate roles, subscription management and restore flow. Local selection never grants Pro.
- [ ] Pro micronutrients, extended analytics, PDF/CSV, macro cycling and unlimited photo scans after entitlement is live.

## Phase 9 — Community
- [ ] Community rules/features; onboarding avatars are illustration, not a live community or user count.

## Phase 10 — Verification and launch
- [x] Existing routing, profile-schema and meal-score tests; earlier browser checks documented in tasks.md.
- [ ] Finish locale checks and end-to-end camera, barcode, email confirmation, offline/account sync and nutrition/streak coverage.
- [ ] Legal/data-source readiness, operational checks and publishing. This checkpoint does not deploy the app.

## Phase 11 — Native iOS (deferred)
- [ ] Native app, Apple sign-in, RevenueCat/App Store billing, HealthKit permissions, workout/active-energy import and optional calorie-budget credit.
- [x] Optional reference-inspired health onboarding holders are built on web (17 Oct 2026); native permissions/import and calorie accounting remain deferred.

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
| Daily app | Remaining/eaten calories, nutrient rings, grouped meals, manual logging, delete, saved meal-score review/edit, weight chart, seven-day bars, compact streak and earned-badge count linking to `/erfolge` | Paywall audit remains; streak grace, weight periods, weigh-in edit/delete and 28 badges built; cross-device checks remain separate |
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
