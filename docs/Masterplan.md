# Kalkumpel - Masterplan

> **Product:** Kalkumpel (AI & Reference-Grounded Calorie and Macro Tracking)  
> **Target Audience:** German-speaking fitness, health, and weight-loss enthusiasts (DACH region: Germany, Austria, Switzerland)  
> **Status:** Active Architecture & Discovery  
> **Repository:** bowerestates/Kalkumpel  

---

## 1. Executive Summary & Vision
Traditional calorie tracking apps (MyFitnessPal, YAZIO, Lifesum) suffer from high user friction: weighing ingredients, searching ambiguous barcode databases, and manually guessing restaurant portions. This friction leads to abandoned tracking within the first 14 days.

**Kalkumpel** eliminates tracking friction through visual AI coupled with verified European and German reference databases:
1. **Snap a photo or scan a barcode:** The user photographs a plate or scans a packaged grocery barcode.
2. **Instant recognition & grounding:** An AI edge function identifies food items and cross-references them against official German and international food composition databases.
3. **Confirm & adjust:** The user makes quick portion adjustments (slider or grams) and logs the meal in seconds.
4. **Actionable habits:** Streaks, Mifflin-St Jeor target pacing, and daily summaries reinforce consistent nutrition.

---

## 2. Product Principles & Architecture Decisions
- **German UI, English Codebase:** The user interface is strictly in modern, natural German. Schemas, migrations, edge functions, API routes, and source code are strictly English.
- **Offline-First Resilience:** TanStack React Query v5 caches user records locally. Intermittent connectivity must never block viewing logs, streaks, or historical progress.
- **Data Privacy & Security (GDPR):** All Supabase tables use strict Row Level Security (`auth.uid() = user_id`). Images in `meal-photos` storage are isolated to user folders. No email enumeration endpoints are exposed.
- **Hybrid Grounding:** Combine AI vision estimates with authoritative databases (BLS, Open Food Facts, USDA) rather than relying exclusively on probabilistic AI outputs.

---

## 3. Nutrition Data Sources & Hybrid Architecture

| Source | Role in Kalkumpel | Licensing & Attribution Requirements |
|---|---|---|
| **Anthropic Claude (Vision)** | Primary visual detection of cooked meals and restaurant plates | Proprietary API via Supabase Edge Function |
| **Bundeslebensmittelschlüssel (BLS 4.0)** | Official German reference database for raw ingredients and traditional prepared dishes (*Magerquark*, *Vollkornbrot*, *Spätzle*) | **CC BY 4.0** (Attribution required: Max Rubner-Institut / BMEL in app settings & legal info) |
| **Open Food Facts (OFF)** | Barcode lookups for packaged European/DACH grocery products (Aldi, Lidl, Rewe, Edeka) | **ODbL** (Open Database License; attribution and share-alike terms for database enhancements) |
| **USDA FoodData Central** | Secondary fallback for generic international ingredients | Public Domain / US Gov (Attribution recommended) |

### Attribution & Compliance Policy
To strictly honor CC BY 4.0 and ODbL requirements, Kalkumpel includes an **"Open Data & Lizenzen"** view in `app/(tabs)/profile.tsx` displaying:
- Max Rubner-Institut (BLS 4.0) attribution link.
- Open Food Facts contributor acknowledgement and database link.
- Clear disclaimer: *Photo-based nutrition estimates are AI-assisted calculations; users retain final control over portion sizes and ingredients.*

---

## 4. Monetization Strategy & Payment Providers

### Provider Architecture
- **In-App Mobile Subscriptions:** [RevenueCat](https://www.revenuecat.com/) via `react-native-purchases`. Manages Apple App Store (In-App Purchases) and Google Play Billing, handles grace periods, family sharing, and syncs entitlements with Supabase user metadata.
- **Web Subscriptions (Optional/Parallel):** [Stripe Checkout & Billing](https://stripe.com/payments/checkout) for web onboarding or direct-to-consumer lower-fee transactions (3% vs. 15-30%), granting app access via webhook.

### Tiers

#### Free Tier ("Kalkumpel Basis")
- Up to 5 AI photo meal scans per day.
- Unlimited barcode lookups via Open Food Facts.
- Core calorie, macro, and weight tracking.
- Daily streak tracker with 24h grace window.
- Mifflin-St Jeor automatic target calculation.

#### Paid Tier ("Kalkumpel Pro" / "Kumpel+")
- Unlimited AI photo scans.
- Detailed micronutrient breakdowns powered by BLS.
- Historical trend analytics (30-day, 90-day macro distribution).
- Export logs & nutritional reports (PDF / CSV for trainers & dietitians).
- Flexible macro cycling (workout vs. rest days).
- Pricing Model: Monthly (€4.99 - €6.99/mo) or Annual (€39.99 - €49.99/yr).

---

## 5. UI Layer & Component Standards
- Existing custom React Native components (`components/ui/`, `components/dashboard/`) with dark mode tokens (`constants/theme.ts`).
- [React Native Paper](https://oss.callstack.com/react-native-paper/) pulled in selectively for complex standard controls (segmented buttons, bottom sheets, snackbars, and accessible dialogs).
