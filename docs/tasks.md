# Kalkumpel – Tasks (Web App)

> Source of truth: `docs/Masterplan.md`, `docs/prompt.md` (Master Architecture Prompt), `docs/app-flow-pages-and-roles.md`, `docs/Design-guidelines.md`, `docs/Implementation-plan.md` – copied from `bowerestates/Kalkumpel`.
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
- [x] Prices: **29,00 € / year** subscription (yearly only; no monthly plan for now).
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
- [ ] Replace logo with official repo assets (`assets/logo.png`, `assets/logo-scanner-plate.png`)
- [x] Apply the approved black-Welcome / white-and-mint app theme; preserve existing macro colours (Design-guidelines §0).
- [x] Keep the approved original Plus Jakarta Sans font on Welcome; no replacement rounded wordmark.
- [ ] German number & date formatting everywhere (`dd.mm.yyyy`, comma decimals, `2.150 kcal`)

## Phase 1 – Onboarding (app-flow screens 00–29)
- [x] Welcome screen (00)
- [x] Prepare and visually inspect welcome-page logo preview: plate and green flame inside camera scan corners, white brand lettering, existing near-black palette.
- [x] Revise welcome preview with matching mint-to-emerald gradient flame and plate rings, black background, white lettering, and clearer spacing inside white camera scan corners (10 Oct 2026).
- [x] Refine preview with original Plus Jakarta Sans typography and original copy colour roles; remove two innermost plate rings. Await approval before applying or sending to GitHub.
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
- [ ] Mirror the remaining onboarding screens from Gordon's next screenshots; target-weight screen is functional but its reference-specific redesign remains upcoming.
- [ ] Replace remaining emoji icons (diet, pace) with mint line icons when those screens are mirrored.
- [x] Gender, age, height, weight, target weight, activity, diet, pace
- [x] Renumber current flow to 13 question/interstitial pages; goal is restored after weight, not at the start. See `docs/Onboarding-progress.md` for the exact sequence and limitations.
- [x] Calculation loader (26) + plan reveal with kcal & macro split (27)
- [x] Feature highlights + review cards (06/14/23 condensed)
- [x] Paywall preview: yearly plan 29,00 € + 3-day trial (29)
- [ ] Expand to full 33-step flow:
  - [x] Birth date picker instead of age (03); full-date profile persistence remains upcoming below.
  - [x] Workouts per week (02) feeding activity factor
  - [x] Referral channel (04) and tracked-before question (05) UI
  - [ ] Persist referral answer, tracking-experience answer and full birth date; currently temporary onboarding state (profile retains age only).
  - [ ] Trainer question (09), if Gordon includes it in the revised flow; current goal follows weight directly.
  - [x] Stay-on-track graph (06), titled "Gemacht, damit Du dranbleibst" in the current UI; illustrative, not a personal prediction.
  - [ ] Remaining interstitials: milestone (12), "Du hast das Zeug dazu", "Danke für dein Vertrauen" (19)
  - [ ] Pace slider 0,2–1,0 kg/Woche with live target date (13)
  - [ ] Obstacles multi-select (15), secondary goals (17), Keto & Intervallfasten diets (16)
  - [ ] Add burned calories toggle (20), health sync card (21 – web: "später"), rollover up to 200 kcal (22)
  - [ ] Notifications opt-in (24), referral code (25)
  - [x] Onboarding unit toggles kg/lbs, cm/ft-in (07/08); stored measurements remain metric.
  - [~] Helper subtitles on the mirrored biometric/goal screens; review remaining screens with the next batch.
- [ ] Dedicated onboarding account creation wall (28) with legal consent; email/password auth already exists, Google/Apple remain upcoming.
- [x] Save completed profile/targets and starting weight locally; account sync uploads guest profile/data on first sign-in.
- [ ] Extend profile sync to newly added onboarding answers once those fields are persisted.

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
- [x] Photo upload UI + "analysing" state (photo shrunk to max 1024 px before sending)
- [x] Real AI meal analysis via Lovable AI (structured JSON: items, grams, kcal, macros, confidence)
  - [x] **Model chosen (Gordon, 10 Oct 2026): OpenAI `openai/gpt-6-luna`** — cheapest non-deprecated vision model, zero data retention.
    Model is one constant (`AI_VISION_MODEL`) so switching to Claude etc. later is a one-line change.
- [x] Meal photos saved to the private `meal-photos` storage (signed-in users only) and linked to the entry
- [x] Review screen: edit ingredients, portion slider / grams, add forgotten sides
- [ ] Scan tips screen ("Kamera ruhig halten, viel Licht, alle Zutaten sichtbar")
- [x] Daily quota 3/day free: signed-in users counted server-side (`meal_analysis_usage`), guests counted in browser storage; friendly "aufgebraucht" card links to paywall
- [x] Pro scan quota — unlimited scans/day (confirmed 10 Oct 2026; enforced once Stripe/Pro roles exist — until then everyone gets 3/day)
- [ ] Ground AI results against BLS reference values

## Phase 5 – Barcode & Nutrition Data
- [~] Barcode / product search (currently 12 sample foods)
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
- [ ] Sync language to profile (`preferred_language`)

## Phase 8 – Subscriptions (Kumpel+)
- [~] Paywall screen (no real payment)
- [ ] Stripe checkout for monthly & yearly with free trial
- [ ] Save subscription status to the local profile (browser storage while Phase 2 is on hold); gate Pro features
- [ ] Restore / manage subscription, terms links
- [ ] Pro features: unlimited scans/day (confirmed 10 Oct 2026), micronutrients (BLS), 30/90-day analytics, PDF/CSV export, macro cycling

## Phase 9 – Community (later)
- [ ] Community rules page (7 Regeln)

## Phase 10 – Polish & Launch
- [ ] Tests for nutrition math and streak logic
- [ ] End-to-end checks: onboarding, scan, barcode, offline
- [ ] Error tracking
- [ ] SEO / share images, publish
