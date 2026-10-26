# Kalkumpel — Implementation Plan (Web)

## 38/30 approved preview delivery — 24 Oct 2026
Stage 1 delivered: `/fortschrittsfotos`, labelled generated samples with component-local add/view/confirmed-delete state and optional selection of existing weigh-in dates; no photo storage, persisted consent, entitlement or target writes. Fortschritt link and unique page metadata included. Sample lifecycle/back/phone fit verified; 13 existing weight/progress rule tests passed; preview build clean.

Stage 2 remains upcoming: private bucket and owner-only metadata, authenticated server functions/temporary URLs, optimised location-metadata-free supported image uploads, repeatable cleanup and links across all weight mutation paths. Stage 3 requires genuine server-verified Pro before upload enablement. Account-only online use, retention until deletion, no AI/marketing reuse, weigh-in deletion unlinks without deleting photos and expired-Pro view/delete are approved. Legal review and authenticated owner-isolation/full account deletion checks remain required. Screen approval and verified paid access are outstanding; no production photo claims.

## Profile review build batches — 22 Oct 2026 (A built, remainder upcoming)

This ledger tracks the approved 41-item review. Batches A–C and Progress insights (39/41) are implemented; other rows are upcoming. Full numbered decisions/acceptance checks are in [tasks.md](tasks.md), design in [Design-guidelines.md](Design-guidelines.md), product boundaries in [Masterplan.md](Masterplan.md).

| Order | IDs / phase | Upcoming delivery and verification |
|---|---|---|
| A — implemented | 3, 18, 19a–19e / Phase 7 | `/profil/daten`, real goal summary, six fields, pencil dialogs/save/cancel/back; 54 tests pass and local browser all-field save/reload/invalid/back plus EN phone pass. Existing JSON/weight sync reused, no migration. Account readback remains unverified. |
| B — implemented | 4, 7, 20, 21, 23–26 / Phase 7; native dependencies Phase 11 | `/profil/einstellungen` built; 59 tests, local persistence/theme/consent/badge checks pass, account readback unverified. Preferences page: theme, celebration presentation, saved health wishes, Nutrition Goals link (legacy macro switch superseded), independent marketing consent/withdrawal. Verify theme contrast/persistence, earning with celebrations off, consent isolation and no fake connection/web credit. |
| C — implemented | 8, 27; reuse 28, complete 25 / Phase 7 | `/profil/ziele`: four real daily progress/target rings, manual decimal saves and confirmed recalculation; automatic calorie-to-macro scaling and macro-to-calorie totals. 67 tests and guest browser save/reload/invalid/cancel/back/EN phone checks pass; cross-device account readback unverified. |
| D — implemented locally | 11, 29, 31 / Phases 6–7 | `/profil/gewicht`, Profile link/back, latest real weight/date and signed earliest-entry baseline change, sticky add, historical edit and confirmed delete. Pure `weight-history.ts` patch/summary with existing store/sync; same-local-day upsert and 20–400 kg validation, targets unchanged. 90 tests and guest browser save/invalid/edit/delete/cancel/reload/back/EN phone checks pass. Cross-device account checks unverified; 30/38 photos and 37 comparisons excluded. |
| E | 15 / Phase 7 | Supplied Instagram/TikTok links only; safe external opening. X omitted without supplied URL. |
| F | 17 / Phases 2/7/10 | Verified owner account deletion with data/photos/auth cleanup, confirmation/cancel, errors/retries and local sign-out/reset. Hosted readback and legal review, not simulated success. |
| G | 35 / Phase 3 | Illustrated empty meal state and working meal-add action; check only when the real daily meal list is empty. |
| H — delivered | 38/39/41 delivered; 36 dropped | Four historical-week calorie averages, informational adult BMI spectrum and private progress photos with weight association verified locally. Estimated goal date (36) dropped by Gordon 26 Oct 2026. |
| Dependency | 23, 24, 33 / Phase 11 | Real native workout-energy and rollover accounting (maximum 200 kcal), no double-counting; only then show an actual carryover pill. Web preference alone changes nothing. |

Weekly-average denominator/missing-day/correction rules are delivered below. Before photo builds: resolve progress-photo guest/offline, retention/consent and proposed Pro entitlement policy; do not grant Pro locally. Daily step target is a preference, not health telemetry; no default inferred from screenshots. Marketing consent is separate from personalisation. BMI adult ranges: <18.5, 18.5–<25, 25–<30, ≥30, with non-diagnostic/applicability explanation. Goal date is an estimate and must handle maintenance, missing pace and goal reached.

**Excluded/new build not required:** 6, 9, 12, 13, 16. **Parked:** 14a–14h, 22, 32, 37, 40; launch terms/privacy obligations still apply. **Keep current:** 1, 2, 5, 10, 28, 34. Do not claim that unchanged header has new avatar/username editing or that existing personalisation grants marketing permission.

Batch D items 11/29/31 are locally verified; next active task is item 35 (Heute empty state). Batch B preferences reuse validated profile JSON; Batch A implementation/local verification is checked in tasks.md, account verification stays open. `personalDetailsPatch` validates one-field edits and preserves targets; birth date and step goal use optional keys in validated onboarding-details JSON, with null legacy answers and no invented birthday. Settings exposes explicit recalculation when saved profile inputs yield different targets. Each delivery needs rule tests and central-flow browser verification, matching documentation and exact GitHub verification.

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
- [x] Weight logging/chart, start/current/goal and streak counter; four calendar-week calorie selections/averages and informational adult BMI delivered (39/41).
- [x] Streak 24 h grace (one missed day bridged), weight periods 7/14/30/90/Alles, date-spaced chart, weigh-in edit/delete (16 Oct 2026).
- [x] Approved 28 badges, grouped flame-shield visuals, unlock celebrations and account sync. Fortschritt has compact streak/earned-count summaries; the badge icon opens all 28 achievable badges immediately on `/erfolge` (earned and locked, hover/focus explanations, tap details and back arrow), updated 22 Oct 2026.
- [ ] Progress-photo diary (needs verified Pro).
- [ ] Workout-energy balance depends on future native activity integration; no simulated web sync.

## Phase 7 — Settings
- [x] Language change and profile language sync, profile editing/recalculated targets, local reset and optional personalisation withdrawal.
- [x] Meal-reminder preference page `/erinnerungen` (17 Oct 2026): independently editable local times and switches for four meals and end of day; immediate device-only persistence, validated reload and reset; DE/EN copy. No timers, push services, account sync or permission requests.
- [x] Reminder editability clarification (23 Oct 2026): visible native time fields replace hidden overlays; all five times can be changed with switches off and persist after reload. Five reminder tests pass; browser checks cover all five edits and 375 px fit. Storage/notification boundaries unchanged.
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
| Daily app | Remaining/eaten calories, nutrient rings, grouped meals, manual logging, delete, saved meal-score review/edit, weight chart, historical-week calorie bars/averages, informational adult BMI, compact streak and earned-badge count linking to `/erfolge` | Paywall audit remains; streak grace, weight periods, weigh-in edit/delete and 28 badges built; cross-device checks remain separate |
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
- **Next:** Weight History (11/29–31) and photos (38/30) delivered; item 36 dropped. Documentation GitHub delivery is tracked in tasks/roadmap.
