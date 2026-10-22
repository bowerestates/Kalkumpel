# Kalkumpel — Masterplan (Web)

## Approved Profile / Heute / Fortschritt enhancement scope — 22 Oct 2026

Gordon approved the annotated 15-screenshot review and then building items 3/18/19. The stable **1–41 IDs and sub-items** are the decision ledger in [tasks.md](tasks.md); design, implementation and flow documents share the same statuses. Personal Details, Preferences and Nutrition Goals are implemented and locally verified; subsequent enhancement batches remain upcoming.

- **Keep current:** 1 header, 2 referrals (no cash rewards), 5 language, 10 reminders, 28 explicit goal recalculation, 34 Today macro presentation.
- **Ignore:** 6 family plan, 9 duplicate goal/weight row, 12 extra Profile ring-guide link, 13 native home-widget carousel on web, 16 logout redesign. Existing guide and sign-out remain.
- **Park:** support/legal section investigation/content (14a–14h), native Live Activities (22), PDF report (32), weight interval comparison table (37), expenditure comparison table (40). Terms/privacy/retention/lawful basis remain launch requirements even with section presentation parked.
- **Implemented Personal Details (3, 18, 19a–19e):** `/profil/daten` from Profil, goal-weight summary/edit, current weight, height, birth date/derived age, gender and optional step goal with save/cancel. Current weight upserts the local-day weight history; no personal edit changes calorie/macronutrient targets. Validated birthDate/dailyStepGoal use existing owner-only onboarding-details JSON sync; old missing birthdays are not guessed. Local browser save/reload/navigation, EN phone and 54 tests pass; signed-in cross-device readback remains unverified.
- **Implemented Preferences (4, 7, 20, 21, 23–26):** `/profil/einstellungen`: System/Hell/Dunkel (light default), celebration switch that never blocks unlocks, editable health wishes with no connection/permission/web credit, default-off macro opt-in used by the implemented Nutrition Goals editor, and independent marketing opt-in/withdrawal. Local save/reload/navigation and DE/EN checks pass; signed-in readback remains unverified.
- **Implemented Nutrition Goals (8/27, reuse 28 and complete 25):** `/profil/ziele` with four real consumption/target rings, validated manual edits, save/cancel and confirmed recalculation. Opted-in calorie edits rebalance existing macro energy shares only; profile and weigh-in behaviour are unchanged. 67 tests and guest browser checks pass; signed-in cross-device readback remains unverified.
- **Upcoming Profile work:** weight history (11, 29–31), Instagram/TikTok links (15) and genuine owner account/data/photo deletion (17), not local reset or a legal-compliance claim.
- **Upcoming Heute work:** illustrated empty meal state (35); real rollover indicator (33) depends on native carryover accounting (24), not a fixed +200 example.
- **Upcoming Progress work:** estimated goal arrival (36), private progress pictures and history association (38/30), four historical week calorie averages (39), informational adult BMI value/category/spectrum (41).

**Boundaries:** preference toggles do not grant HealthKit/Health Connect permission, assert connection or change current web budgets. Actual burned-calorie credit and rollover up to 200 kcal remain native/deferred. Weigh-ins never change calorie targets; explicit goal recalculation remains. Macro rebalance (25) requires an explicit opt-in and intentional calorie-target edit. Marketing emails (26) need separate unchecked consent/withdrawal; existing recipe/workout personalisation is not marketing permission. Step targets are not measured activity; screenshot 10.000 is not a selected default. Photos need owner-only storage, consent/retention and resolved guest/offline/Pro policy before delivery. BMI adult boundaries are <18.5, 18.5–<25, 25–<30 and ≥30; display is non-diagnostic, with applicability caveats. Forecast dates must not promise results, and weekly-average missing-data rules must be defined before build.

Only supplied social destinations are approved: Instagram `https://www.instagram.com/kalkumpel/`, TikTok `https://www.tiktok.com/@kalkumpel_ki`; no X link supplied. Next planned batch is Weight History (11/29–31); Nutrition Goals and opted-in macro rebalance are implemented. Personal-details validation retains age 13–100, height 100–250 cm and weight 20–400 kg; steps allow whole numbers 0–100.000 as a technical input guard with no default or observed-activity claim. This delivery does not activate subscriptions, upload photos, delete accounts or publish the app.

> Product: German-first calorie and nutrition tracking for the DACH region.  
> Repository: `bowerestates/Kalkumpel`. Current delivery: TanStack Start web app.  
> Updated: 11 Oct 2026. Detailed status and blockers: [tasks.md](tasks.md).

## 1. Product vision

Reduce the friction of logging food through photo estimates, barcode nutrition and editable manual entries. Users remain in control of ingredients and portions. Weight trends and calculated targets support habits without promising a result or offering medical advice.

Authoritative German/international nutrition grounding is a **future goal**. Current photos use AI estimates; packaged products use Open Food Facts when available. The app does not yet cross-reference every photo against BLS or USDA.

## 2. Approved product decisions

- Keep the existing approved scanner-plate/flame logo permanently. Welcome is near-black with white Kalkumpel lettering; onboarding and daily screens are white with readable mint/emerald text and monochrome mint icons. Keep Plus Jakarta Sans and the existing nutrient colours.
- German UI with friendly “Du”; English optional in Settings. Code and schema names stay English. All app copy belongs in the DE/EN dictionaries.
- Numbers/dates follow the selected language: German `2.150 kcal`, `75,5 kg`, `11.10.2026`; English `2,150 kcal`, `75.5 kg`, `11/10/2026` (`en-GB`). Formatting rollout is not yet complete everywhere.
- Goals: **Abnehmen / Gewicht halten / Muskeln aufbauen**. Guided weekly pace and projected dates are estimates based on user inputs.
- Free: **3 AI photo scans/day**, manual logging, barcode lookup and core tracking. Future Pro: **unlimited AI photo scans/day**, **5,99 €/week**, **11,99 €/month** or **34,99 €/year**, **3-day trial on all plans**. Checkout/trial activation are not implemented.
- Accounts, records and photos use Gordon’s own connected Supabase project `kalkumpel`; never enable Lovable Cloud for accounts.
- Retain relevant provided onboarding details for future recipe/workout features with transparent purposes and separate optional personalisation consent. No marketing email permission is assumed. Legal review remains a launch requirement.
- No invented community counts, ratings or testimonials. Apple sign-in remains native-iOS-only; actual HealthKit / Android Health Connect and workout-calorie credit are future native work. Optional web preparation pages are approved separately.

## 3. Current architecture

| Layer | Web implementation |
|---|---|
| Framework/routing | React 19, TypeScript, TanStack Start v1 / TanStack file routes, Vite |
| Styling | Tailwind v4, semantic tokens in `src/styles.css`, existing UI components |
| Local state | `src/lib/store.ts` uses localStorage for guests and offline records |
| Account sync | `src/lib/sync.ts` mirrors profiles, meals, weights and language to Supabase; guest upload on sign-in, local data cleared on sign-out |
| Auth/storage | Supabase email/password and Google OAuth wiring; owner-only records and private per-user meal photos |
| AI | `meal-ai.functions.ts` calls server-only `meal-ai.server.ts`; one `AI_VISION_MODEL` constant for photo analysis and meal scoring; secrets and signed-in quota writes stay server-side |
| Localization | `src/lib/i18n.ts` dictionaries; `src/lib/format.ts` shared locale formatting and decimal parser |
| Verification | Vitest tests and browser checks; an implemented mapping is not proof of cross-device behaviour |

TanStack server functions are used for internal web AI calls, not the original native Supabase Edge Function design. User tables have owner policies; profiles are keyed by owner ID. Scan usage is read-only to users. Future subscription roles must be separate from editable profiles and verified server-side; local plan selection cannot grant Pro.

## 4. Nutrition sources and meal quality

| Source | Current status | Requirements |
|---|---|---|
| OpenAI via Lovable AI Gateway | Photo item/portion/calorie/macro estimates and shared meal scoring; configured model `openai/gpt-6-luna` | Model constant is the code checkpoint, not a claim of cheapest pricing or perpetual availability; provider privacy settings need verification |
| Open Food Facts | Live barcode lookup and portion scaling implemented | Coverage varies; ODbL attribution/reuse review and in-app sources page upcoming |
| BLS 4.0 | Planned ingredient grounding/staples cache, not integrated | CC BY 4.0 attribution when used |
| USDA FoodData Central | Planned fallback, not integrated | Source attribution and integration review |

Meal scoring uses `meal-quality-v1`, not a personal health score or calorie-based penalty. Evidence, confidence, explanation, rubric version and input fingerprint persist with each meal. Unknown nutrients stay unknown. Reopening a saved meal does not request AI; edits or explicit reassessment can recalculate. Failure must never block logging. See [Meal-score-rubric.md](Meal-score-rubric.md).

## 5. Delivery boundaries

Progress presentation (22 Oct 2026): compact „Tage in Folge“ and a single earned-badge shield/count sit side by side on Fortschritt. The shield opens `/erfolge` with all 28 achievable badges immediately visible, earned or locked, without an earned-only filter; hover/focus explanations above each badge, tap details and a back arrow to Fortschritt are retained. Badge unlock rules and account sync are unchanged. Seven-day calorie bars and dated rings remain on Fortschritt.

Meal-reminder settings are implemented (17 Oct 2026) at `/erinnerungen`, reached from Profil: five independent local times and on/off preferences, persisted on this device only. Gordon explicitly deferred notifications to native iOS and Android. The web app sends no reminders, requests no notification permission and does not sync these preferences to accounts. Native scheduling must use local wall-clock times and handle time-zone changes and cancellation. These settings are not proof of native delivery.

The paywall is a preview, not a purchase or active trial. Stripe checkout, verified subscription roles, cancellation/manage/restore flows and paid features remain upcoming. RevenueCat is a future native billing plan, not an installed web dependency. BLS micronutrients, extended analytics, reports/export, macro cycling, reminder notification delivery and community features must not be described as delivered. Badge delivery status is tracked in tasks.md.

Legal-reviewed privacy/terms, sensitive-data lawful basis, retention, full consent withdrawal/history and deletion/export are required before launch. Existing optional personalisation withdrawal is not full account deletion. Real signup delivery and signed-in cross-device meal/profile checks remain unverified.

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

For every agreed coding, behaviour or design change, update and save the corresponding documentation and task records, upload affected documents to `bowerestates/Kalkumpel`, and verify exact remote-file matches in the same delivery without Gordon needing to ask. If access, approval or synchronization blocks delivery, report it and leave the task open. A GitHub API connection alone is not proof of automatic Git sync. Mark implemented, partial, upcoming and unverified work separately. Do not overwrite approved decisions or silently promote placeholders to completed features. Historical native specifications in `prompt.md` and `Provider-Recommendations.md` do not override this web checkpoint.

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

Only an intentional calorie edit with the default-off item 25 opt-in adjusts macros: preserve current energy proportions (protein/carbohydrate 4 kcal/g, fat 9 kcal/g) and preview rounded results before save. All-zero macro ratios reject rather than guessing. Direct macro edits leave all other targets unchanged. „Ziele neu berechnen“ reuses existing `calcTargets`, previews all four estimates and requires confirmation before replacing manual values. No profile, meal, weight or health behaviour changed; existing owner-only target sync is reused, no migration or entitlement change.

Verification: 67 tests pass; guest browser all-field saves, invalid rejection, cancellation, reload, opt-in rebalance, confirmed recalculation, back navigation, actual meal ring totals and English phone fit pass, with no page errors and a clean preview build. Signed-in cross-device readback remains unverified (external unmanaged Supabase). Next: Weight History (11/29–31).
