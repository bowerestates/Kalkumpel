# Kalkumpel - Masterplan

> **Product:** Kalkumpel (AI-Powered Calorie & Macro Tracking)  
> **Target Audience:** German-speaking fitness, health, and weight-loss enthusiasts (DACH region: Germany, Austria, Switzerland)  
> **Status:** Active Foundation & Discovery  
> **Repository:** bowerestates/Kalkumpel  

---

## 1. Executive Summary & Vision
Traditional calorie tracking apps (MyFitnessPal, YAZIO, Lifesum) suffer from high user friction: weighing ingredients, searching ambiguous barcode databases, and manually guessing restaurant portions. This friction leads to abandoned tracking within the first 14 days.

**Kalkumpel** eliminates tracking friction through visual AI:
1. **Snap a photo:** The user photographs a plate or meal.
2. **Instant recognition:** An AI edge function identifies individual food items, estimates portion weights, and computes macronutrients (calories, protein, carbs, fat).
3. **Confirm & learn:** The user makes quick visual adjustments and logs the meal in seconds.
4. **Actionable habits:** Streaks, Mifflin-St Jeor target pacing, and daily summaries reinforce consistent nutrition.

---

## 2. Product Principles & Architecture Decisions
- **German UI, English Codebase:** The user interface is strictly in modern, natural German. Schemas, migrations, edge functions, API routes, and source code are strictly English.
- **Offline-First Resilience:** TanStack React Query v5 caches user records locally. Intermittent connectivity must never block viewing logs, streaks, or historical progress.
- **Data Privacy & Security:** German/EU users expect strict data privacy (GDPR compliance). All Supabase tables use strict Row Level Security (`auth.uid() = user_id`). Images in `meal-photos` storage are isolated to user folders.
- **Modularity:** Edge functions decouple the AI vision provider from the client app.

---

## 3. Monetization Strategy (Freemium -> Kumpel+)

### Free Tier ("Kalkumpel Basis")
- Up to 5 AI photo meal scans per day.
- Core calorie, macro, and weight tracking.
- Daily streak tracker with 24h grace window.
- Mifflin-St Jeor automatic target calculation.

### Paid Tier ("Kalkumpel Pro" / "Kumpel+")
- Unlimited AI photo scans.
- Historical trend analytics (30-day, 90-day macro distribution).
- Export logs & nutritional reports (PDF / CSV for trainers & dietitians).
- Flexible macro cycling (workout vs. rest days).
- Pricing Model: Monthly (€4.99 - €6.99/mo) or Annual (€39.99 - €49.99/yr) via Apple App Store / Google Play / Stripe.

---

## 4. Key Open Decisions
- **AI Vision Edge Function Selection:** Evaluating Claude 3.5 Sonnet vs. GPT-4o vs. Gemini 1.5 Pro for best balance of cost per request, latency (<3 seconds), and German food recognition accuracy (e.g., distinguishing *Döner*, *Spätzle*, *Quark*, *Vollkornbrot*).
- **Onboarding Funnel:** Translating design screenshots into a high-converting, multi-step profile builder that calculates starting macros before sign-up.
