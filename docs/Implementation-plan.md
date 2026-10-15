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
- [x] 23 in-route screens plus separate account stage; full order and save boundaries in [Onboarding-progress.md](Onboarding-progress.md).
- [x] Weight/height controls, goal-weight difference, pace guidance, target calculations, setup animation and result curve.
- [x] White/mint reference adaptations, matching person/medal figures, community crowd without invented claims.
- [x] Save base profile, targets, starting weight and validated additional answers locally; sync through owner-only account records.
- [x] Email account stage before plan choice, unchecked required storage consent and optional future recipe/workout personalisation; optional withdrawal in Profile.
- [ ] Reference polish, result edit controls, height display-unit persistence and optional extra questions/options listed in tasks.md. HealthKit screens remain native only.

## Phase 2 — Accounts and security
- [x] Gordon’s own connected Supabase, email/password signup/sign-in/reset, private photos and owner-only records.
- [x] Guest-data upload and account sync of profile details, versioned latest consent, meals, weights and preferred language.
- [x] Server-only signed-in scan usage writes; users cannot edit quotas.
- [ ] Verify real email confirmation and cross-device profile/meal persistence; hosted auth settings/delivery are not certified by source review.
- [ ] Legal-reviewed notices, lawful basis, retention, consent history/full withdrawal and deletion/export.
- [ ] Separate server-verified subscription roles. Apple sign-in belongs to native iOS; Google is not implemented.

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
- [ ] Verify nutrition/streak calculations; grace window, extended trend ranges, badges and progress-photo diary.
- [ ] Workout-energy balance depends on future native activity integration; no simulated web sync.

## Phase 7 — Settings
- [x] Language change and profile language sync, profile editing/recalculated targets, local reset and optional personalisation withdrawal.
- [ ] App-wide metric/imperial preference, real reminders, approved legal pages and account deletion/export. Local reset is not server account deletion.

## Phase 8 — Subscriptions
- [~] Account-gated Free/Premium preview at 9,99 €/month or 29,00 €/year with a proposed 3-day trial on both.
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
- [x] Native-only reference screens parked; never add placeholder Apple Health or burned-calorie onboarding screens to web.

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
| Plans | Account precedes Free/Premium choice; preview shows 9,99 €/month and 29,00 €/year (annual marked “Spare 76 %”), 3-day trial on both | No checkout or paid entitlement; everyone currently gets 3 photo scans/day; future verified Pro permits unlimited scans |
| Native iOS | HealthKit, workout-calorie credit and Apple sign-in explicitly deferred | No web placeholders or simulated health sync |

## Documentation checkpoint — 11 Oct 2026

These documents describe the current **web app**, not an already-built native app. `Masterplan.md` defines product decisions, `tasks.md` tracks delivery and verification, `Implementation-plan.md` uses the same phase numbers, `app-flow-pages-and-roles.md` describes actual navigation, and `Design-guidelines.md` records approved visuals. `Onboarding-progress.md` preserves the detailed screen sequence; `Meal-score-rubric.md` defines scoring.

For every agreed coding, behaviour or design change, save the corresponding documentation and task updates in the same delivery. Mark implemented, partial, upcoming and unverified work separately. Do not overwrite approved decisions, silently promote placeholders to completed features, or claim remote GitHub synchronization without checking it. Historical native specifications in `prompt.md` and `Provider-Recommendations.md` do not override this web checkpoint.
