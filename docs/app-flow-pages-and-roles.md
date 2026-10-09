# Kalkumpel - App Flow, Pages & Roles

> **Status:** Living Document (Iterative until Onboarding Design Lock)  
> **Navigation:** Expo Router v4 (file-based routing)  
> **Auth State:** Managed by Supabase Auth session with secure storage token cache  

---

## 1. User Roles & Access Matrix

| Role | Description | Access Level |
|---|---|---|
| **Anonymous (Unauthenticated)** | Guest visitor opening the app for the first time | Welcome screen, Onboarding flow, Login/Registration, Password reset |
| **Authenticated (Free User)** | Standard registered user with email/password or OAuth | Dashboard, Camera (up to 5 scans/day), Barcode scanner (unlimited), Manual log, Profile, 7d trends |
| **Subscriber (Kumpel+ Pro)** | Paid user with active subscription (via RevenueCat or Stripe) | Unlimited AI scans, BLS micronutrient detail, 90d analytics, PDF export, priority AI queue |

---

## 2. Route Hierarchy (`app/`)

```
app/
├── _layout.tsx                     # Global Root: Providers (QueryClient, Auth, Theme, RevenueCat)
│
├── auth/                           # Unauthenticated Routes
│   ├── _layout.tsx
│   ├── sign-in.tsx                 # Login with email/password or Google/Apple
│   ├── sign-up.tsx                 # Account registration
│   └── forgot-password.tsx         # Password recovery (rate-limited, no enumeration)
│
├── onboarding/                     # First-Time User Experience (Living Draft)
│   ├── _layout.tsx
│   ├── welcome.tsx                 # Value proposition intro
│   ├── goal.tsx                    # Select: Cut, Maintain, Bulk
│   ├── metrics.tsx                 # Gender, Age, Height, Weight
│   ├── activity.tsx                # Activity level selection
│   └── summary.tsx                 # Calculated targets reveal + registration prompt
│
├── (tabs)/                         # Main App Navigation (Authenticated)
│   ├── _layout.tsx                 # Tab Bar (Today, Camera/Barcode, Trends, Profile)
│   ├── index.tsx                   # Today / Dashboard
│   │                               #   - Calorie remaining ring
│   │                               #   - Macro progress bars (P / C / F)
│   │                               #   - Date jumper (yesterday, tomorrow)
│   │                               #   - Meal list grouped by type
│   │                               #   - Active streak banner
│   ├── camera.tsx                  # Capture Hub: Toggle between [Foto-Scan] and [Barcode]
│   ├── analytics.tsx               # Weight progression graph & macro distributions
│   └── profile.tsx                 # Personal settings, target overrides, app version, legal/licenses
│
├── meal/                           # Meal Sub-routes (Modals & Details)
│   ├── [id].tsx                    # Single meal detail, edit ingredients, delete
│   ├── review.tsx                  # AI result review: detected items, grams slider, confirm
│   └── barcode-preview.tsx         # Open Food Facts product confirmation sheet
│
└── paywall/                        # Subscription Screen
    └── index.tsx                   # Kumpel+ offerings (Monthly/Annual), Restore purchases
```

---

## 3. Meal Capture State Machines

### Flow A: AI Photo Recognition Flow
```
[Camera Snap] 
       │
       ▼
[Compress Image] (JPEG, ~800-1200px max side, ~200-400KB)
       │
       ▼
[Edge Function: analyze-meal] ◄─── Checks daily quota in meal_analysis_usage
       │
       ├─► [Quota Exceeded] ──► [Show Paywall: paywall/index.tsx]
       │
       ▼
[Claude Vision + BLS Grounding]
       │
       ▼
[Review Screen: meal/review.tsx]
       │
       ├─► User adjusts portion slider (+/- grams)
       ├─► User adds/removes ingredients
       ├─► User selects meal type (Frühstück, Mittagessen, Abendessen, Snack)
       │
       ▼
[Commit to Supabase]
       ├── Uploads photo to `meal-photos` bucket (`auth.uid()/filename.jpg`)
       ├── Inserts row into `entries` table
       └── Updates local React Query cache (instant UI update)
       │
       ▼
[Return to Dashboard] (Animated update of calorie ring & streak)
```

### Flow B: Barcode Scanning Flow (Open Food Facts)
```
[Barcode Viewfinder]
       │
       ▼
[Read EAN/UPC Code]
       │
       ▼
[Fetch Open Food Facts API] (https://world.openfoodfacts.org/api/v2/product/{barcode}.json)
       │
       ├─► [Product Not Found] ──► [Fallback to Manual Entry or Photo Scan]
       │
       ▼
[Barcode Preview Sheet: meal/barcode-preview.tsx]
       │
       ├── Display Brand, Product Title, Nutriscore
       ├── Display Per 100g Values (Kcal, Protein, Carbs, Fat)
       └── Input Serving Size (e.g. 1 Becher = 250g, or custom slider)
       │
       ▼
[Commit to Supabase]
       ├── Inserts row into `entries` table (with OFF product ID metadata)
       └── Updates local React Query cache
       │
       ▼
[Return to Dashboard]
```

---

## 4. Legal & Open Data Attribution Matrix
- Accessible via `app/(tabs)/profile.tsx` -> **Lizenzen & Datenquellen**:
  - **BLS (Bundeslebensmittelschlüssel 4.0):** CC BY 4.0 attribution to Max Rubner-Institut (MRI).
  - **Open Food Facts:** Open Database License (ODbL) attribution to Open Food Facts contributors.
  - **USDA FoodData Central:** Public domain attribution.
