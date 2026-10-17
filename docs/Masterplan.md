# Kalkumpel — Masterplan (Web)

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
- No invented community counts, ratings or testimonials. Apple sign-in and HealthKit/workout-calorie credit are native-iOS-only future work.

## 3. Current architecture

| Layer | Web implementation |
|---|---|
| Framework/routing | React 19, TypeScript, TanStack Start v1 / TanStack file routes, Vite |
| Styling | Tailwind v4, semantic tokens in `src/styles.css`, existing UI components |
| Local state | `src/lib/store.ts` uses localStorage for guests and offline records |
| Account sync | `src/lib/sync.ts` mirrors profiles, meals, weights and language to Supabase; guest upload on sign-in, local data cleared on sign-out |
| Auth/storage | Supabase email/password; owner-only records and private per-user meal photos |
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

Meal-reminder settings are implemented (17 Oct 2026) at `/erinnerungen`, reached from Profil: five independent local times and on/off preferences, persisted on this device only. Gordon explicitly deferred notifications to native iOS and Android. The web app sends no reminders, requests no notification permission and does not sync these preferences to accounts. Native scheduling must use local wall-clock times and handle time-zone changes and cancellation. These settings are not proof of native delivery.

The paywall is a preview, not a purchase or active trial. Stripe checkout, verified subscription roles, cancellation/manage/restore flows and paid features remain upcoming. RevenueCat is a future native billing plan, not an installed web dependency. BLS micronutrients, extended analytics, reports/export, macro cycling, reminder notification delivery and community features must not be described as delivered. Badge delivery status is tracked in tasks.md.

Legal-reviewed privacy/terms, sensitive-data lawful basis, retention, full consent withdrawal/history and deletion/export are required before launch. Existing optional personalisation withdrawal is not full account deletion. Real signup delivery and signed-in cross-device meal/profile checks remain unverified.

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

For every agreed coding, behaviour or design change, update and save the corresponding documentation and task records, upload affected documents to `bowerestates/Kalkumpel`, and verify exact remote-file matches in the same delivery without Gordon needing to ask. If access, approval or synchronization blocks delivery, report it and leave the task open. A GitHub API connection alone is not proof of automatic Git sync. Mark implemented, partial, upcoming and unverified work separately. Do not overwrite approved decisions or silently promote placeholders to completed features. Historical native specifications in `prompt.md` and `Provider-Recommendations.md` do not override this web checkpoint.
