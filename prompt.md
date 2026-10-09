# Kalkumpel - Master Architecture Prompt & Specification

> **Status:** Living Master Specification  
> **Repository:** bowerestates/Kalkumpel  
> **Last Synchronized:** October 2026  
> **Stack:** Expo SDK 54, React Native, TypeScript, Expo Router v4, Supabase (PostgreSQL + Edge Functions + Storage), Anthropic Claude 3.5 Sonnet Vision

---

## 1. Project Overview & Product Vision
Kalkumpel is a modern, mobile-first nutrition and fitness tracking application designed for German-speaking users (DACH market) with an English code and backend convention. It replaces manual macro math with camera-based visual AI logging, Mifflin-St Jeor metabolic target calculations, weight tracking, and daily streak gamification.

### Key Tenets
1. **German UI, English Codebase:** All customer-facing screens, buttons, labels, error notices, and push copy are in idiomatic German. All database tables, columns, API routes, Edge Functions, tests, and comments remain in English.
2. **Offline-First Resilience:** TanStack React Query v5 caches user data locally so that day reviews, streak checks, and previous entries work seamlessly without active connectivity.
3. **Verified AI Pipeline:** Meal photo uploads go through a secure, quota-checked Supabase Edge Function running Anthropic Claude 3.5 Sonnet (`claude-3-5-sonnet-latest`) returning structured, deterministic JSON.
4. **Zero-Trust Security & Privacy:** Strict PostgreSQL Row Level Security (RLS) guarantees users can access only their own records. Storage buckets isolate user photos to `auth.uid()/*`. No email enumeration endpoints are exposed.

---

## 2. Technical Stack & Dependencies

| Layer | Technology | Key Details |
|---|---|---|
| **Runtime & Framework** | Expo SDK 54 / React Native | Expo Router v4 (file-based navigation) |
| **Language** | TypeScript (strict mode) | Strict typing across app, lib, and Edge Functions |
| **State & Data Fetching** | TanStack React Query v5 | Client cache, mutation rollbacks, offline persistence |
| **Icons & Styling** | Lucide React Native, React Native StyleSheet | Design tokens in `constants/theme.ts` |
| **Backend & Database** | Supabase (PostgreSQL 15+) | RLS policies on all tables; custom migrations in `supabase/migrations/` |
| **Storage** | Supabase Storage | Private bucket `meal-photos` with user folder isolation |
| **Edge Compute** | Deno / TypeScript (Supabase Functions) | `supabase/functions/analyze-meal/index.ts` |
| **AI Model** | Anthropic Claude 3.5 Sonnet | Structured JSON output for meal and macro estimation |
| **Testing** | Jest | Unit tests in `lib/*.test.ts` (streaks, nutrition plans) |

---

## 3. Directory Layout & Routing Map

```
bowerestates/Kalkumpel/
├── app/
│   ├── _layout.tsx                     # Root provider tree (QueryClient, Auth, Theme)
│   ├── auth/
│   │   ├── _layout.tsx
│   │   ├── sign-in.tsx                 # Login with email/password + OAuth hooks
│   │   ├── sign-up.tsx                 # Registration with automatic profile creation
│   │   └── forgot-password.tsx         # Secure password reset (no email enumeration)
│   ├── (tabs)/
│   │   ├── _layout.tsx                 # Bottom tab bar navigation
│   │   ├── index.tsx                   # Dashboard (Today: ring charts, meal list, streak)
│   │   ├── camera.tsx                  # Camera & meal snap modal / trigger
│   │   ├── analytics.tsx               # Weight history, charts, macro averages
│   │   └── profile.tsx                 # Profile details, targets, preferences, logout
│   └── meal/
│       ├── [id].tsx                    # Meal entry detail & edit screen
│       └── review.tsx                  # AI result review, portion adjuster, confirmation
├── components/
│   ├── ui/                             # Buttons, inputs, modals, cards, badges
│   ├── dashboard/                      # CalorieRing, MacroBar, MealGroupCard, StreakBadge
│   └── camera/                         # CameraViewfinder, PortionSlider, AIResultCard
├── constants/
│   ├── theme.ts                        # Colors, typography, spacing, border radiuses
│   └── nutrition.ts                    # Default multipliers, formula constants
├── hooks/
│   ├── useAuth.ts                      # Supabase session lifecycle
│   ├── useMealEntries.ts               # React Query hooks for entries
│   ├── useNutritionPlan.ts             # Mifflin-St Jeor calculators
│   └── useStreak.ts                    # Streak evaluation and local cache
├── lib/
│   ├── supabase.ts                     # Supabase client singleton with SecureStore
│   ├── nutrition-plan.ts               # BMR / TDEE calculation utilities
│   ├── nutrition-plan.test.ts          # Unit tests for nutrition formulas
│   ├── streak.ts                       # Consecutive log and grace-period logic
│   └── streak.test.ts                  # Unit tests for streak calculations
├── supabase/
│   ├── functions/
│   │   └── analyze-meal/index.ts       # Claude 3.5 Sonnet vision proxy & rate limiter
│   └── migrations/
│       ├── 20261009120000_initial_schema.sql
│       └── 20261009130000_drop_account_exists_enumeration.sql
└── prompt.md                           # This living master prompt
```

---

## 4. Database Schema & RLS Policies

All user-scoped tables enforce `auth.uid() = user_id` (or `auth.uid() = id` on `profiles`).

### Table: `profiles`
- `id`: `UUID PRIMARY KEY REFERENCES auth.users ON DELETE CASCADE`
- `display_name`: `TEXT`
- `avatar_url`: `TEXT`
- `birth_date`: `DATE`
- `gender`: `TEXT CHECK (gender IN ('male', 'female', 'other'))`
- `height_cm`: `NUMERIC(5,2)`
- `activity_level`: `TEXT CHECK (activity_level IN ('sedentary', 'light', 'moderate', 'very_active'))`
- `goal`: `TEXT CHECK (goal IN ('cut', 'maintain', 'bulk'))`
- `target_calories`: `INTEGER NOT NULL DEFAULT 2000`
- `target_protein_g`: `INTEGER NOT NULL DEFAULT 150`
- `target_carbs_g`: `INTEGER NOT NULL DEFAULT 200`
- `target_fat_g`: `INTEGER NOT NULL DEFAULT 65`
- `auto_calc_targets`: `BOOLEAN NOT NULL DEFAULT true`
- `created_at`: `TIMESTAMPTZ DEFAULT now()`
- `updated_at`: `TIMESTAMPTZ DEFAULT now()`

### Table: `entries` (Logged Meals)
- `id`: `UUID PRIMARY KEY DEFAULT gen_random_uuid()`
- `user_id`: `UUID NOT NULL REFERENCES auth.users ON DELETE CASCADE`
- `meal_type`: `TEXT NOT NULL CHECK (meal_type IN ('breakfast', 'lunch', 'dinner', 'snack'))`
- `title`: `TEXT NOT NULL`
- `calories`: `INTEGER NOT NULL`
- `protein_g`: `NUMERIC(6,1) DEFAULT 0`
- `carbs_g`: `NUMERIC(6,1) DEFAULT 0`
- `fat_g`: `NUMERIC(6,1) DEFAULT 0`
- `photo_path`: `TEXT` (Key in `meal-photos` storage bucket)
- `logged_at`: `TIMESTAMPTZ NOT NULL DEFAULT now()`
- `raw_ai_response`: `JSONB`

### Table: `weights`
- `id`: `UUID PRIMARY KEY DEFAULT gen_random_uuid()`
- `user_id`: `UUID NOT NULL REFERENCES auth.users ON DELETE CASCADE`
- `weight_kg`: `NUMERIC(5,2) NOT NULL`
- `recorded_at`: `DATE NOT NULL DEFAULT CURRENT_DATE`
- `created_at`: `TIMESTAMPTZ DEFAULT now()`

### Table: `meal_analysis_usage`
- `id`: `UUID PRIMARY KEY DEFAULT gen_random_uuid()`
- `user_id`: `UUID NOT NULL REFERENCES auth.users ON DELETE CASCADE`
- `requested_at`: `TIMESTAMPTZ DEFAULT now()`
- Used by Edge Functions to enforce user daily quotas (e.g. 10 AI scans/day for Free users).

---

## 5. AI Vision Pipeline (`analyze-meal`)

- **Trigger:** App uploads photo or passes signed URL/base64 payload to Edge Function endpoint.
- **Auth:** Client sends `Authorization: Bearer <supabase_session_jwt>`.
- **Validation:** Function verifies user identity via Supabase Auth and checks daily count in `meal_analysis_usage`.
- **Model:** `claude-3-5-sonnet-latest` via Anthropic Messages API.
- **System Prompt Specification:**
  ```
  You are an expert sports dietitian and visual meal analysis specialist.
  Analyze the uploaded food image, extract all visible items, approximate portions,
  and calculate estimated macronutrients and calories.
  Return valid, clean JSON strictly adhering to the schema without conversational markdown.
  ```
- **Output Schema:**
  ```json
  {
    "meal_name": "string",
    "items": [
      {
        "name": "string",
        "portion": "string",
        "calories": 100,
        "protein_g": 10.0,
        "carbs_g": 5.0,
        "fat_g": 2.0
      }
    ],
    "totals": {
      "calories": 520,
      "protein_g": 38.0,
      "carbs_g": 45.0,
      "fat_g": 18.0
    },
    "confidence_score": 0.85,
    "health_notes": "string"
  }
  ```

---

## 6. Business Logic Formulas

### Mifflin-St Jeor Formula
- **Men:** `BMR = (10 * weight_kg) + (6.25 * height_cm) - (5 * age) + 5`
- **Women:** `BMR = (10 * weight_kg) + (6.25 * height_cm) - (5 * age) - 161`
- **TDEE Multipliers:**
  - Sedentary: `1.2`
  - Lightly Active: `1.375`
  - Moderately Active: `1.55`
  - Very Active: `1.725`
- **Goal Adjustments:**
  - Cut (Fettabbau): `-500 kcal`
  - Maintain (Halten): `0 kcal`
  - Bulk (Muskelaufbau): `+300 to +500 kcal`

---

## 7. Upcoming Milestones & Planned Additions
1. **Interactive Multi-Step Onboarding:** Visual questionnaire tailored from design screenshots (dietary goal, metric collection, habit building).
2. **German UI Pass:** Complete i18n translation of client screens into natural German.
3. **Monetization & Paywall:** Subscriptions tier gating unlimited AI scans, deep analytics, and PDF export.
