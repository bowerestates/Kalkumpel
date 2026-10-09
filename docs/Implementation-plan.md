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

## Phase 2: Architecture Knowledge & Provider Contracts (Completed)
- [x] Establish `docs/` repository knowledge base (`Masterplan.md`, `Implementation-plan.md`, `Design-guidelines.md`, `app-flow-pages-and-roles.md`).
- [x] Define hybrid data architecture: Claude Vision + BLS (Germany) + Open Food Facts (Barcodes) + USDA.
- [x] Define billing stack: RevenueCat (iOS/Android IAP) + optional Stripe Checkout.
- [x] Specify open data legal compliance (CC BY 4.0 for BLS, ODbL for Open Food Facts).

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

## Phase 4: Barcode Scanning & Hybrid Nutrition Data
- [ ] Integrate camera barcode scanning via `expo-camera` or `expo-barcode-scanner`.
- [ ] Connect Open Food Facts REST API (`https://world.openfoodfacts.org/api/v2/product/{barcode}.json`).
- [ ] Build packaged product preview sheet (Brand, Product Name, Nutriscore, Macros per 100g, Portion Multiplier).
- [ ] Add BLS (Bundeslebensmittelschlüssel) ingredient grounding table/cache for common German staples.
- [ ] Add "Lizenzen & Datenquellen" attribution page in Profile/Settings (CC BY 4.0 & ODbL requirements).

---

## Phase 5: Full German Localization (UI)
- [ ] Audit all strings in `app/`, `components/`, and `constants/`.
- [ ] Standardize terminology:
  - *Calories* -> *Kalorien (kcal)*
  - *Protein* -> *Eiweiß (g)*
  - *Carbohydrates* -> *Kohlenhydrate (g)*
  - *Fat* -> *Fett (g)*
  - *Streak* -> *Serie / Streak*
  - *Scan Barcode* -> *Barcode scannen*
  - *Log Meal* -> *Mahlzeit erfassen*
- [ ] Verify German date (`dd.mm.yyyy`) and number formatting (comma decimal separator).

---

## Phase 6: Subscriptions & Paywall (RevenueCat)
- [ ] Install and configure `react-native-purchases` (RevenueCat SDK).
- [ ] Define offerings: Monthly & Annual Kumpel+ subscriptions.
- [ ] Implement paywall modal triggered when daily free scans exceed quota (`meal_analysis_usage` count >= 5).
- [ ] Sync RevenueCat customer entitlement status with Supabase profile metadata / database table.
- [ ] Add restore purchases button and terms of service / privacy links.

---

## Phase 7: Production Polish & Store Submission
- [ ] End-to-end testing of camera snap, barcode lookup, and offline sync.
- [ ] Add crash logging and performance tracing.
- [ ] Prepare App Store and Google Play assets, screenshots, and privacy manifests.
