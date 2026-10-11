# Kalkumpel – Tasks (Web App)

> Source of truth: `docs/Masterplan.md` for current product decisions and this task list for completion/verification, supported by `app-flow-pages-and-roles.md`, `Design-guidelines.md` and `Implementation-plan.md`. Harmonized web checkpoint: 11 Oct 2026. `prompt.md` and `Provider-Recommendations.md` retain historical native proposals; they do not override current web decisions.
>
> **Stack translation:** The GitHub repo specifies Expo / React Native. This Lovable project is the **web version** (TanStack Start + Tailwind). Mapping used here:
> Expo Router → TanStack file routes · Supabase → Gordon's own Supabase · `analyze-meal` Edge Function → server function via Lovable AI · RevenueCat → Stripe (web) · AsyncStorage → localStorage + profile sync.
>
> **Current accounts status:** Email/password accounts, saved profiles, meals, weights and private meal photos use Gordon's connected Supabase project. Browser storage remains the guest/offline store; Lovable Cloud must not be enabled.
>
> Legend: `[x]` done · `[~]` partly done / placeholder · `[ ]` upcoming

---

## Decisions (confirmed by Gordon, 09 Oct 2026)
- [x] Trial length: **3 days** free trial.
- [x] Prices: **9,99 € / month** or **29,00 € / year**; 3-day trial applies to both (decided 11 Oct 2026).
- [x] Goal labels: **"Abnehmen / Muskeln aufbauen"** (keep current build).
- [x] Macro colours: **keep the current build colours** (do not switch to Design-guidelines palette).
- [x] Free AI scan quota: **3 scans/day** on the free tier.
- [x] Paid tier (Kumpel+ Pro) scan quota: **unlimited scans/day** (confirmed 10 Oct 2026). Enforcement starts once Stripe/Pro roles exist — until then everyone gets the free limit of 3/day.
- [x] AI scan model: OpenAI `openai/gpt-6-luna` (chosen 10 Oct 2026, see Phase 4).
- [x] Background decision (10 Oct 2026): black Welcome only; white onboarding and daily app with readable mint/emerald copy and monochrome mint icons. Existing macro colours stay unchanged.
- [x] Accounts: hold lifted – use **Gordon's own Supabase project** (not Lovable Cloud) for sign-in, data and photos (see Phase 2).

---

## Phase 0 – Foundation (web)
- [x] App shell, mobile-first layout, bottom tab bar (Heute, Erfassen, Fortschritt, Profil)
- [x] Brand logo (mint flame) + favicon
- [x] German UI ("Du"), English code
- [x] DE/EN dictionary + language toggle in Profil
- [x] Logo: keep the approved scanner-plate logo permanently (Gordon, 11 Oct 2026) — no swap needed
- [x] Apply the approved black-Welcome / white-and-mint app theme; preserve existing macro colours (Design-guidelines §0).
- [x] Keep the approved original Plus Jakarta Sans font on Welcome; no replacement rounded wordmark.
- [x] Language-aware number & date formatting (`src/lib/format.ts`): German `dd.mm.yyyy`, `75,5 kg`, `2.150 kcal`; English switches automatically; weight input accepts comma or dot (11 Oct 2026)
- [x] Rollout completed (11 Oct 2026): Today calories/macros/streak, Progress weights/day labels, Capture/review values, onboarding result/pace/calendar widgets, Settings targets and annual EUR price all use selected-language helpers. Earlier partial audit is resolved.
- [x] Shared decimal drafts/parser support comma/dot weights, nutrition and portions; calendar-only dates retain their day; invalid edits preserve valid values. 11 regression tests pass and live guest DE/EN Today, Progress, Settings, price and comma/dot weight-save checks pass; latest preview build is clean. Phase 0 complete.

## Phase 1 – Onboarding (app-flow screens 00–29)
- [x] Welcome screen (00)
- [x] Prepare and visually inspect welcome-page logo preview: plate and green flame inside camera scan corners, white brand lettering, existing near-black palette.
- [x] Revise welcome preview with matching mint-to-emerald gradient flame and plate rings, black background, white lettering, and clearer spacing inside white camera scan corners (10 Oct 2026).
- [x] Refine preview with original Plus Jakarta Sans typography and original copy colour roles; remove two innermost plate rings. Approval received and applied; logo permanently retained on 11 Oct 2026.
- [x] Apply approved welcome-page revision (10 Oct 2026): green-gradient flame and three plate rings within white scan corners, black welcome-only background, original typography/copy colours, matching favicon. Verified compact and desktop layouts, both navigation buttons, and clean build.
- [x] Switch onboarding + daily app to white background with mint copy and mint-only line icons; welcome stays black (10 Oct 2026, see Design-guidelines §0).
- [x] Mirror reference screen IMG_3236 (gender): heading + subtitle, centred option cards with mint icon badges and radio, pill "Weiter" disabled until chosen.
- [x] Mirror reference IMG_3237 (workouts per week): 0–2 / 3–5 / 6+ with dot icons; answer pre-sets the activity level (light / moderate / active).
- [x] Mirror IMG_3239 birthday: "Wann bist Du geboren?", month/day/year scrolling wheels; selected birth date feeds age into calorie calculations, replacing the separate age field.
- [x] Mirror IMG_3240 source: "Wie hast Du von uns erfahren?"; Freunde oder Familie, Fernsehen, Facebook, TikTok, Instagram, Google, YouTube; mint line icons and required choice.
- [x] Mirror IMG_3241 experience: "Hast Du schon andere Kalorien-Apps ausprobiert?"; Ja/Nein with mint thumbs icons and required choice.
- [x] Mirror IMG_3242 interstitial: "Gemacht, damit Du dranbleibst"; illustrative "Gewichtsverlauf" comparison, Kalkumpel vs. Ohne Plan, Monat 1–6.
- [x] Mirror IMG_3243 height: "Wie groß bist Du?"; cm / ft, in toggle and scrolling measurement wheels.
- [x] Mirror IMG_3244 weight: "Wie viel wiegst Du?"; kg / lbs toggle, large changing value, horizontal scale with fixed centre marker.
- [x] Add left/right weight-scale scrolling: touch swipe, mouse drag, wheel/trackpad and arrow keys; also used on the existing target-weight screen.
- [x] Restore IMG_3246 goal immediately after current weight: "Was ist Dein Ziel?"; Abnehmen / Gewicht halten / Muskeln aufbauen, mint arrow/minus icons and required choice.
- [x] Save this completed onboarding batch in design notes and tasks (10 Oct 2026; Gordon lifted the documentation hold).
- [x] Mirror the plan statement screen: "Das Abnehmen von X beginnt mit einem Plan!" — the amount is the gap between current and target weight in the unit chosen on the scales, and the wording adapts to the selected goal (Abnehmen / Gewicht halten / Muskeln aufbauen).
- [x] Mirror the pace screen: "Wie schnell möchtest Du Dein Ziel erreichen?" — slider with Entspannt / Empfohlen / Ehrgeizig, guided weekly amount from height, weight and goal, time-to-goal plus daily calorie goal; placed directly after the plan statement.
- [x] Reformat "Wie isst Du am liebsten?" to the new card design: mint line icons replace the emoji and a German subtitle sits under the heading.
- [x] Mirror the stay-on-track comparison screen: "Ein einfacherer Weg, dranzubleiben" with "Ohne Kalkumpel" and "Mit Kalkumpel" cards plus the caption "Kleine tägliche Schritte führen zu Fortschritt"; both cards show the same abstract person, the second wearing a medal around the neck.
- [x] Mirror screens IMG_3251–3255: obstacles, desired outcome, illustrative potential chart and thank-you. Single obstacle/outcome answers now persist in validated onboarding profile details (11 Oct 2026).
- [x] Mirror the community screen IMG_3261 (10 Oct 2026): „Werde Teil der Kalkumpel-Community“ with a crowd of 21 mint avatars in three rows (no „viele mehr“ pill). The reference's user counts, ratings and named reviews are deliberately **not** copied — no invented social proof.
- [x] **Onboarding pages complete (Gordon, 11 Oct 2026).** 23 in-route screens plus the separate account stage; full order and what is saved: `docs/Onboarding-progress.md`. Remaining reference refinements below are not implied complete.
- [x] Gender, age, height, weight, target weight, goal, activity, diet, pace
- [x] Pace slider with live time-to-goal and daily calories; obstacles, desired outcomes, potential chart, thank-you, setup progress and result screens.
- [x] Calculation loader + plan reveal with kcal & macro split
- [x] Feature highlights + review cards (condensed)
- [x] Paywall preview: selectable monthly 9,99 € and yearly 29,00 € plans, both with 3-day trial
- [x] Onboarding unit toggles kg/lbs, cm/ft-in; stored measurements remain metric.
- [x] Save completed profile/targets and starting weight locally; account sync uploads guest profile/data on first sign-in.

### Onboarding placeholders to come back to
- [ ] Layout polish for the comparison screen (block sits small; card titles tight to the top; dark-card icon contrast moderate).
- [ ] Target-weight screen: reference-specific redesign (currently the shared weight scale).
- [ ] Remove emoji from pace/any remaining screens if found during the in-app review.
- [x] Save full birth date, workout frequency category, referral source, prior-app answer, single obstacle and desired outcome in owner-only profile details and sync them.
- [x] Save weekly pace amount and weight-unit choice to the account; height display-unit preference remains upcoming.
- [ ] Obstacles and desired outcomes as multi-select (currently one choice each).
- [ ] Keto and Intervallfasten diet options.
- [ ] Trainer question — only if Gordon wants it.
- [ ] Rollover up to 200 kcal.
- [ ] Notifications opt-in and referral code.
- [x] IMG_3266 account stage: white/mint German design, working email/password signup with confirmation state and existing-account link, before free/Premium choice. Apple reserved for native iOS; no Google button.
- [x] Separate unchecked storage consent and optional recipe/workout personalisation consent; save version/latest timestamp and allow optional consent withdrawal in Profil. No advertising emails enabled.
- [ ] Legal review before launch: approved AGB/privacy notice, purpose and sensitive-data lawful basis, retention schedule, full storage-consent withdrawal, account deletion/export, and consent audit history. Draft screen wording is not legal certification.
- [ ] Edit pencils on the result screen (editing currently in Profil).
- [ ] Burned-calories toggle and Apple Health sync — **native iOS build only**, Phase 11.

## Next focus – In-app logic review (starts after this save)
Go screen by screen through Heute, Erfassen, Fortschritt, Profil/Einstellungen and Paywall; confirm each visible element uses real app logic, and build anything missing at that time.
- [x] Heute — reviewed 11 Oct 2026: totals, rings, meal groups, delete and saved-meal edit use real store/sync logic; fixed "today" to use the local calendar day instead of UTC (meals logged after midnight in Germany were filed under the previous day). Weekly calendar strip and quick calorie correction remain open in Phase 3.
- [ ] Erfassen (photo, barcode, manual, meal score)
- [ ] Fortschritt
- [ ] Profil / Einstellungen
- [ ] Paywall

## Phase 2 – Backend & Accounts (Gordon's own Supabase) — ACTIVE
> **Gordon, 09 Oct 2026 (later):** hold lifted. Use Gordon's own Supabase project (not Lovable Cloud) for authentication, database and meal photos. See `docs/Provider-Recommendations.md`.
- [x] Save provider recommendations to `docs/Provider-Recommendations.md`
- [x] Gordon connects his Supabase project to Lovable (project `kalkumpel`, connected 09 Oct 2026)
- [x] Tables per prompt.md: `profiles`, `entries`, `weights`, `meal_analysis_usage` (+ `preferred_language`, onboarding fields)
- [x] Row-level security: users see only their own data (scan counts read-only for users)
- [x] Private `meal-photos` storage, per-user folders — photos uploaded by the AI scanner
- [x] Sign-in / sign-up / password reset (E-Mail + Passwort) without revealing whether an email exists
- [x] Move app data from browser storage to the database on first sign-in; browser storage stays as the offline cache
- [ ] Roles: Anonymous · Free · Kumpel+ Pro — upcoming (Pro status must be set server-side once Stripe exists)
- [ ] Google sign-in — not implemented; Apple sign-in reserved for native iOS (Phase 11), no web placeholder.

## Phase 3 – Core App: Dashboard & Logging
- [x] Dashboard: remaining / eaten kcal, rings for kcal, Eiweiß, Kohlenhydrate, Fett
- [x] Daily log grouped by Frühstück, Mittagessen, Abendessen, Snacks
- [x] Manual entry
- [x] Delete entries
- [ ] Weekly calendar strip with coloured day rings (Grün / Gelb / Rot / Grau rules)
- [ ] Meal detail & edit screen (`meal/[id]`)
- [ ] Quick calorie correction

## Phase 4 – AI Photo Scanner
- [x] Photo upload UI + "analysing" state (photo shrunk to max 1024 px before sending)
- [x] Real AI meal analysis via Lovable AI (structured JSON: items, grams, kcal, macros, confidence)
  - [x] **Current configured model: OpenAI `openai/gpt-6-luna`** via Lovable AI Gateway. This records the code checkpoint, not verified cheapest pricing, model availability or a zero-retention guarantee; provider access/privacy claims need separate verification.
    Model is one constant (`AI_VISION_MODEL`) so switching to Claude etc. later is a one-line change.
- [x] Meal photos saved to the private `meal-photos` storage (signed-in users only) and linked to the entry
- [x] Review screen: edit ingredients, portion slider / grams, add forgotten sides
- [ ] Scan tips screen ("Kamera ruhig halten, viel Licht, alle Zutaten sichtbar")
- [x] Daily quota 3/day free: signed-in users counted server-side (`meal_analysis_usage`), guests counted in browser storage; friendly "aufgebraucht" card links to paywall
- [x] Pro scan quota — unlimited scans/day (confirmed 10 Oct 2026; enforced once Stripe/Pro roles exist — until then everyone gets 3/day)
- [ ] Ground AI results against BLS reference values

## Phase 5 – Barcode & Nutrition Data
- [~] General text product search uses a local sample catalogue; numeric barcode lookup uses live Open Food Facts. Comprehensive online food search remains upcoming.
- [x] Camera barcode scanning in browser
- [x] Open Food Facts lookup (`/api/v2/product/{barcode}.json`)
- [ ] Product sheet: brand, name, Nutri-Score, macros per 100 g, portion multiplier
- [ ] BLS 4.0 staples table/cache (Magerquark, Vollkornbrot, Spätzle …)
- [ ] USDA fallback
- [ ] "Open Data & Lizenzen" page (Max Rubner-Institut CC BY 4.0, Open Food Facts ODbL, AI disclaimer)

## Phase 6 – Progress, Streaks & Gamification
- [x] Streak counter
- [x] Last-7-days calorie bars
- [x] Weight logging + start / current / goal + chart
- [ ] Streak 24 h grace window
- [ ] Trend periods 3 / 7 / 14 / 30 / 90 days / total
- [ ] Energy balance chart (burned vs. eaten)
- [ ] Private progress photo diary (Pro)
- [ ] 36-badge system (Bronze/Silber/Gold) + unlock pop-up

## Phase 7 – Settings & Profile
- [x] Language toggle (Deutsch default / English)
- [x] Edit profile + recalculate targets
- [x] Reset all data
- [ ] Units metric / imperial
- [ ] Meal reminders (08:30, 12:30, 16:00, 19:00, 21:00)
- [ ] AGB, Datenschutz, Konto löschen
- [x] Sync language to profile (`preferred_language`) through existing account sync; signed-in cross-device verification remains upcoming.

## Phase 8 – Subscriptions (Kumpel+)
- [~] Paywall screen (no real payment)
- [ ] Stripe checkout for monthly 9,99 € and yearly 29,00 €, each with a 3-day trial; server-verified entitlement. Premium button currently explains unavailability and never grants local paid status.
- [ ] Implement separate server-verified subscription roles/entitlements and mirror only verified access for display; editable profiles and local plan selection must not grant Pro. Accounts hold is lifted.
- [ ] Restore / manage subscription, terms links
- [ ] Pro features: unlimited scans/day (confirmed 10 Oct 2026), micronutrients (BLS), 30/90-day analytics, PDF/CSV export, macro cycling

## Phase 9 – Community (later)
- [ ] Community rules page (7 Regeln)

## Phase 10 – Polish & Launch
- [ ] Tests for nutrition math and streak logic
- [ ] End-to-end checks: onboarding, scan, barcode, offline
- [ ] Error tracking
- [ ] SEO / share images, publish

## Phase 11 – Native iOS & Apple Health (deferred, not web)
> **Gordon, 10 Oct 2026:** screens 20–21 belong to the Apple HealthKit exercise and are built **only once Kalkumpel runs as a native iOS app**; the native HealthKit access is written there. The web app shows nothing for these two questions — no placeholder, no simulated sync.
- [x] Reference screens parked (10 Oct 2026): `IMG_3256.PNG`, `IMG_3258.PNG`, `IMG_3259.PNG`; German copy already specified in `docs/app-flow-pages-and-roles.md` screens 20–21.
- [ ] HealthKit read access: workouts (type, duration, active energy burned) and daily step count.
- [ ] Screen 20 „Aktivitätskalorien zum Tagesziel dazurechnen?“ — workout list (Morgenlauf 32 min +320 kcal, Yoga 20 min +90 kcal, Schritte 12.430 +80 kcal), badge „Heute zum Budget addiert +490 kcal“, budget line 2.500 → 2.990 kcal, Ja / Nein.
- [ ] Screen 21 „Aktivitäten mit Apple Health synchronisieren?“ — photo card with today's goal (flame 2.500 kcal, Running +250 kcal) and the connection screen „Verbindung mit Apple Health herstellen“ (Apple + Health icons joined by a checkmark, pills Gehen / Laufen / Yoga / Schlaf, CTA „Apple Health verbinden“).
- [ ] Save the answers as `profile.add_burned_calories` and `profile.health_sync_enabled` through the existing profile sync.
- [ ] Add credited activity calories to the daily budget on the dashboard and to the energy-balance chart (Phase 6).

## Onboarding end screens
- [x] IMG_3266 save-progress/email account stage added; account required when continuing into free or paid plan choice. Apple native iOS later.
- [x] Verified unchecked consent defaults, storage-gated email form and existing-account destination in the browser; routing/meal-score regression tests pass and preview builds cleanly.
- [ ] Verify real signup/email confirmation and profile details across devices with Gordon's external Supabase account; provider settings and delivery were not inspected or changed.
- [x] Setup progress screen (IMG_3264): "Wir richten alles für Dich ein" — % counter, mint progress bar, rotating status line, checklist (Kalorien, Kohlenhydrate, Protein, Fett); meal scores are calculated only after a meal is logged.
- [x] Plan result screen (IMG_3265): "Ziel: X kg abnehmen bis <Datum>", estimated progress curve, daily kcal + macros, "Los geht's!". Values come from calcTargets/paceGuide; saved to profile and synced to Supabase when signed in.
- [ ] Edit pencils on the result screen — tracked under "Onboarding placeholders".

## Meal-quality score (Gordon, 11 Oct 2026)
- [x] Define the requested score: per-meal “Mahlzeiten-Score” (1–10 or null), not a personal health score calculated during onboarding. Requirements recorded from Gordon's uploaded brief.
- [x] Document one versioned rubric: ingredient balance/variety, protein, plant foods and reliable fiber; sugar/saturated fat/salt only with evidence. Unknown nutrients remain unknown, calories alone do not lower the score, and confidence is independent. Evaluate snacks in context.
- [x] Reuse the current AI integration for photo, barcode and manual meals; validate score, confidence, short explanation, up to two positives, optional suggestion and rubric version.
- [x] Add compact review and saved-detail cards with German/English copy, estimated label, expandable explanation, optional balance suggestion and non-medical disclaimer. No unrelated redesign.
- [x] Persist score and supporting ingredient/nutrition information through the existing local store and user-owned Supabase entries. Reopening must not request AI again.
- [x] Mark scores outdated after relevant edits and recalculate; scoring failure must never block saving. Preserve server-only credentials and per-user access controls.
- [x] Remove the misleading onboarding health-score completion item: no meal exists to score during profile setup.
- [x] Verify unknown nutrients, independent confidence, reopening without AI, editing/recalculation, and failure-tolerant meal logging.

### Verification notes
- Live manual-entry scoring returned a validated German 8/10 result; ingredient edits produced a new assessment. Reopening made zero AI requests. Simulated connection failure still allowed meal logging.
- Schema and RLS linter: clean. Evidence/score sync mappings are implemented; authenticated cross-device verification remains upcoming (external Supabase sign-in not available to automated checks).
- [ ] Upcoming: signed-in cross-device score persistence check and real photo/barcode end-to-end checks with Gordon’s examples.

## Documentation delivery checkpoint — 11 Oct 2026
- [x] Harmonize `Design-guidelines.md`, `Implementation-plan.md`, `app-flow-pages-and-roles.md` and `Masterplan.md` with current web onboarding/account order, barcode scanning, approved permanent logo, configured OpenAI model, language-aware formatting status and remaining work.
- [x] Reconcile task claims: formatting rollout is partial, profile language sync is implemented, extra onboarding answers are saved, and paid access/native features are not delivered.
- [x] Record standing rule: update and save relevant documentation/task records, upload affected documents to `bowerestates/Kalkumpel` and verify exact remote matches with every agreed coding, behaviour or design delivery, without Gordon having to ask; report blockers and distinguish implementation from unverified checks and placeholders.
- [x] Finish Phase 0 locale rollout and regression checks (11 Oct 2026).
- [ ] Continue the agreed screen-by-screen in-app logic review, starting with Today.
- [x] Check GitHub synchronization (11 Oct 2026, 15:45 UTC): read `bowerestates/Kalkumpel` main using Gordon's GitHub API and compare Git blob fingerprints with saved project files. Verification completed; synchronization is **not complete**.
- [x] Upload latest documentation to GitHub and verify (11 Oct 2026): documentation commit `46ca996cea7eeb011e767f643706fdd1dbb427eb` saved all nine local `docs/*.md` files on `bowerestates/Kalkumpel` main, preserving unrelated repository files. A fresh GitHub read confirmed exact Git blob matches for `Design-guidelines.md`, `Implementation-plan.md`, `Masterplan.md`, `app-flow-pages-and-roles.md`, `Onboarding-progress.md`, `Meal-score-rubric.md`, `Provider-Recommendations.md`, `prompt.md` and `tasks.md`. This completion record is included in a follow-up documentation commit and checked again before reporting completion. Historical native reference files remain subordinate to the web contract; no app code changed or automatic Git sync claimed.

### Check this documentation update
Read the four documents' matching web-feature checkpoints and compare them with this task list. Confirm the same logo, 23 screens plus account stage, current model constant, 3/day Free quota, monthly/yearly prices with trial, locale rollout gaps and native/payment/legal deferrals. This documentation-only task does not change screens or deploy the app.

### Phase 0 locale completion delivery — 11 Oct 2026
- [x] Fix calendar-date TypeScript narrowing, add locale-aware EUR formatting and reusable DecimalInput, and wire remaining web displays/inputs; no account, AI, quota or payment logic changed.
- [x] Full suite: 11 tests passing; preview build clean; guest DE/EN browser display and weight-saving checks passed without page errors. Capture/review decimal behaviour has automated coverage; real photo/barcode and authenticated sync checks remain open above.
- [x] Upload these documentation updates to Kalkumpel main and verify all nine docs plus AGENTS.md and roadmap.md against remote Git blob fingerprints (Phase 0 completion delivery, 11 Oct 2026).
