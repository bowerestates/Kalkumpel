# Kalkumpel - Implementation Plan

> **Strategy:** Phased delivery with automated regression testing and living documentation.  
> **Base Version:** Expo SDK 54 / React Native / Supabase / Claude 3.5 Sonnet Vision  

---

## Phase 1: Security Hardening & Rebranding (Completed)
- [x] Security audit of base repository.
- [x] Drop vulnerable `public.account_exists(text)` function to prevent email enumeration.
- [x] Update `app/auth/forgot-password.tsx` to handle password resets without revealing account existence.
- [x] Rebrand application from MacroLens to Kalkumpel across bundle identifiers, configs, and assets.
- [x] Upgrade edge function model to `claude-3-5-sonnet-latest`.
- [x] Initialize clean repository at `bowerestates/Kalkumpel`.
- [x] Commit `prompt.md` master specification.

---

## Phase 2: Knowledge Base & AI Edge Function Benchmark (Current)
- [x] Establish `docs/` repository knowledge base (`Masterplan.md`, `Implementation-plan.md`, `Design-guidelines.md`, `app-flow-pages-and-roles.md`).
- [ ] **AI Edge Function Evaluation:**
  - Benchmark Claude 3.5 Sonnet vs. GPT-4o vs. Gemini 1.5 Flash/Pro on a test set of 15 European/German meal images.
  - Evaluate accuracy, portion estimation error, latency, and cost per scan.
  - Finalize prompt formatting and JSON schema validation.

---

## Phase 3: Interactive Multi-Step Onboarding
- [ ] Ingest user design screenshots into structured UI components.
- [ ] Build multi-step onboarding wizard:
  1. Welcome / Value proposition screen.
  2. Primary goal selection (Fettabbau / Gewicht halten / Muskelaufbau).
  3. Biometrics input (Gender, Birth date, Height, Current weight, Goal weight).
  4. Activity level evaluation (Sedentary to Very Active).
  5. Calorie & macro calculation reveal (animated Mifflin-St Jeor summary).
  6. Account creation / sign-up wall.
- [ ] Seed newly created user profile directly from onboarding inputs.

---

## Phase 4: Full German Localization (UI)
- [ ] Audit all strings in `app/`, `components/`, and `constants/`.
- [ ] Extract UI strings into organized translation dictionaries or direct German copy.
- [ ] Standardize terminology:
  - *Calories* -> *Kalorien (kcal)*
  - *Protein* -> *Eiweiß (g)*
  - *Carbohydrates* -> *Kohlenhydrate (g)*
  - *Fat* -> *Fett (g)*
  - *Streak* -> *Serie / Streak*
  - *Log Meal* -> *Mahlzeit erfassen*
- [ ] Verify German date (`dd.mm.yyyy`) and number formatting (comma decimal separator).

---

## Phase 5: Monetization & Paywall Integration
- [ ] Implement subscription entitlement checking in Supabase (`subscriptions` table or metadata).
- [ ] Add paywall screen when free daily scan limit is reached (`meal_analysis_usage` count >= daily limit).
- [ ] Connect RevenueCat or Stripe checkout for subscriptions.
- [ ] Add receipt validation webhook / edge function.

---

## Phase 6: Production Polish & App Store Readiness
- [ ] Add crash logging and performance tracing (Sentry / PostHog).
- [ ] End-to-end testing of camera upload flow on real iOS and Android devices.
- [ ] Prepare App Store and Google Play assets, screenshots, and privacy manifests.
