# Kalkumpel – Tasks (Web App)

> Source of truth: `docs/Masterplan.md`, `docs/prompt.md` (Master Architecture Prompt), `docs/app-flow-pages-and-roles.md`, `docs/Design-guidelines.md`, `docs/Implementation-plan.md` – copied from `bowerestates/Kalkumpel`.
>
> **Stack translation:** The GitHub repo specifies Expo / React Native. This Lovable project is the **web version** (TanStack Start + Tailwind). Mapping used here:
> Expo Router → TanStack file routes · Supabase → Lovable Cloud · `analyze-meal` Edge Function → server function via Lovable AI · RevenueCat → Stripe (web) · AsyncStorage → localStorage + profile sync.
>
> **Accounts on hold (Gordon, 09 Oct 2026):** Lovable Cloud is not to be enabled and no sign-up/sign-in is built for now. All data stays in browser storage (`src/lib/store.ts`).
>
> Legend: `[x]` done · `[~]` partly done / placeholder · `[ ]` upcoming

---

## Decisions (confirmed by Gordon, 09 Oct 2026)
- [x] Trial length: **3 days** free trial.
- [x] Prices: **29,00 € / year** subscription (yearly only; no monthly plan for now).
- [x] Goal labels: **"Abnehmen / Muskeln aufbauen"** (keep current build).
- [x] Macro colours: **keep the current build colours** (do not switch to Design-guidelines palette).
- [x] Free AI scan quota: **3 scans/day** on the free tier.
- [ ] Paid tier (Kumpel+ Pro) scan quota: PLACEHOLDER – amount to be decided by Gordon.
- [ ] AI scan model: PLACEHOLDER – Gordon is comparing per-scan cost before we pick (see Phase 4).
- [ ] Background tone: current build uses dark teal, guidelines say slate `#0F172A` – **placeholder, revisit later** (see Phase 0 task).
- [x] Accounts: hold lifted – use **Gordon's own Supabase project** (not Lovable Cloud) for sign-in, data and photos (see Phase 2).

---

## Phase 0 – Foundation (web)
- [x] App shell, mobile-first layout, bottom tab bar (Heute, Erfassen, Fortschritt, Profil)
- [x] Brand logo (mint flame) + favicon
- [x] German UI ("Du"), English code
- [x] DE/EN dictionary + language toggle in Profil
- [ ] Replace logo with official repo assets (`assets/logo.png`, `assets/logo-scanner-plate.png`)
- [ ] Align colour tokens to Design-guidelines (slate surfaces, macro colour coding, emerald pressed `#059669`) — **PLACEHOLDER: macro colours stay as-is per decision; revisit background tone (dark teal vs. slate `#0F172A`) later.**
- [ ] Rounded "Kumpel" wordmark font on Welcome / Paywall
- [ ] German number & date formatting everywhere (`dd.mm.yyyy`, comma decimals, `2.150 kcal`)

## Phase 1 – Onboarding (app-flow screens 00–29)
- [x] Welcome screen (00)
- [x] Goal, gender, age, height, weight, target weight, activity, diet, pace
- [x] Calculation loader (26) + plan reveal with kcal & macro split (27)
- [x] Feature highlights + review cards (06/14/23 condensed)
- [x] Paywall preview: yearly plan 29,00 € + 3-day trial (29)
- [ ] Expand to full 33-step flow:
  - [ ] Birth date picker instead of age (03)
  - [ ] Workouts per week (02) feeding activity factor
  - [ ] Referral channel (04), tracked before (05), has trainer (09)
  - [ ] Motivational interstitials: "Entwickelt, damit du dranbleibst" graph (06), milestone (12), "Du hast das Zeug dazu" (18), "Danke für dein Vertrauen" (19)
  - [ ] Pace slider 0,2–1,0 kg/Woche with live target date (13)
  - [ ] Obstacles multi-select (15), secondary goals (17), Keto & Intervallfasten diets (16)
  - [ ] Add burned calories toggle (20), health sync card (21 – web: "später"), rollover up to 200 kcal (22)
  - [ ] Notifications opt-in (24), referral code (25)
  - [ ] Unit toggles kg/lbs, cm/ft-in (07/08)
  - [ ] Helper subtitles explaining *why* each answer matters
- [ ] ⏸ ON HOLD (accounts paused): Account creation wall (28) – Google, Apple, E-Mail + AGB/Datenschutz checkbox
- [ ] ⏸ ON HOLD (accounts paused): Seed profile from onboarding answers after sign-up

## Phase 2 – Backend & Accounts (Gordon's own Supabase) — ACTIVE
> **Gordon, 09 Oct 2026 (later):** hold lifted. Use Gordon's own Supabase project (not Lovable Cloud) for authentication, database and meal photos. See `docs/Provider-Recommendations.md`.
- [x] Save provider recommendations to `docs/Provider-Recommendations.md`
- [x] Gordon connects his Supabase project to Lovable (project `kalkumpel`, connected 09 Oct 2026)
- [x] Tables per prompt.md: `profiles`, `entries`, `weights`, `meal_analysis_usage` (+ `preferred_language`, onboarding fields)
- [x] Row-level security: users see only their own data (scan counts read-only for users)
- [~] Private `meal-photos` storage, per-user folders — storage ready; photo upload wiring comes with the real AI scanner (Phase 4)
- [x] Sign-in / sign-up / password reset (E-Mail + Passwort) without revealing whether an email exists
- [x] Move app data from browser storage to the database on first sign-in; browser storage stays as the offline cache
- [ ] Roles: Anonymous · Free · Kumpel+ Pro — upcoming (Pro status must be set server-side once Stripe exists)
- [ ] Google / Apple sign-in — upcoming

## Phase 3 – Core App: Dashboard & Logging
- [x] Dashboard: remaining / eaten kcal, rings for kcal, Eiweiß, Kohlenhydrate, Fett
- [x] Daily log grouped by Frühstück, Mittagessen, Abendessen, Snacks
- [x] Manual entry
- [x] Delete entries
- [ ] Weekly calendar strip with coloured day rings (Grün / Gelb / Rot / Grau rules)
- [ ] Meal detail & edit screen (`meal/[id]`)
- [ ] Quick calorie correction

## Phase 4 – AI Photo Scanner
- [~] Photo upload UI + "analysing" state (currently simulated result)
- [ ] Real AI meal analysis via Lovable AI (structured JSON: items, portions, kcal, macros)
  - [ ] **Model choice pending (Gordon, 09 Oct 2026):** comparing per-scan cost. Cheapest
    image-capable options on the Lovable AI Gateway per scan (≈1,400 tokens in / 250 out):
    `openai/gpt-6-luna` ~0,00027 €, `google/gemini-3.1-flash-lite-image` ~0,00073 €,
    `google/gemini-3.8-flash` ~0,00199 €, `anthropic/claude-haiku-4-5` ~0,00265 €,
    `anthropic/claude-sonnet-5` ~0,00530 €. Masterplan §3 currently names Claude Vision.
    Blocked: do not wire the scanner until Gordon picks the model.
- [ ] Review screen: edit ingredients, portion slider / grams, add forgotten sides
- [ ] Scan tips screen ("Kamera ruhig halten, viel Licht, alle Zutaten sichtbar")
- [ ] Daily quota check counted in browser storage (free: 3/day; Pro: TBD); paywall when exceeded — server-side counter (`meal_analysis_usage`) waits for Phase 2
- [ ] Ground AI results against BLS reference values

## Phase 5 – Barcode & Nutrition Data
- [~] Barcode / product search (currently 12 sample foods)
- [ ] Camera barcode scanning in browser
- [ ] Open Food Facts lookup (`/api/v2/product/{barcode}.json`)
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
- [ ] Sync language to profile (`preferred_language`)

## Phase 8 – Subscriptions (Kumpel+)
- [~] Paywall screen (no real payment)
- [ ] Stripe checkout for monthly & yearly with free trial
- [ ] Save subscription status to the local profile (browser storage while Phase 2 is on hold); gate Pro features
- [ ] Restore / manage subscription, terms links
- [ ] Pro features: scan quota (PLACEHOLDER – amount TBD), micronutrients (BLS), 30/90-day analytics, PDF/CSV export, macro cycling

## Phase 9 – Community (later)
- [ ] Community rules page (7 Regeln)

## Phase 10 – Polish & Launch
- [ ] Tests for nutrition math and streak logic
- [ ] End-to-end checks: onboarding, scan, barcode, offline
- [ ] Error tracking
- [ ] SEO / share images, publish
