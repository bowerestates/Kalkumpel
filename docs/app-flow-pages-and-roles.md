# Kalkumpel - App Flow, Pages & Roles

> **Navigation:** Expo Router v4 (file-based routing)  
> **Auth State:** Managed by Supabase Auth session with secure storage token cache  

---

## 1. User Roles & Access Matrix

| Role | Description | Access Level |
|---|---|---|
| **Anonymous (Unauthenticated)** | Guest visitor opening the app for the first time | Welcome screen, Onboarding flow, Login/Registration, Password reset |
| **Authenticated (Free User)** | Standard registered user with email/password or OAuth | Dashboard, Camera (up to 5 scans/day), Manual log, Profile, 7d trends |
| **Subscriber (Kumpel+ Pro)** | Paid user with active subscription | Unlimited scans, 90d analytics, PDF export, priority AI queue |

---

## 2. Route Hierarchy (`app/`)

```
app/
├── _layout.tsx                     # Global Root: Providers (QueryClient, Auth, Theme, Splash)
│
├── auth/                           # Unauthenticated Routes
│   ├── _layout.tsx
│   ├── sign-in.tsx                 # Login with email/password or Google/Apple
│   ├── sign-up.tsx                 # Account registration
│   └── forgot-password.tsx         # Password recovery (rate-limited, no enumeration)
│
├── onboarding/                     # First-Time User Experience (Planned)
│   ├── _layout.tsx
│   ├── welcome.tsx                 # Value proposition intro
│   ├── goal.tsx                    # Select: Cut, Maintain, Bulk
│   ├── metrics.tsx                 # Gender, Age, Height, Weight
│   ├── activity.tsx                # Activity level selection
│   └── summary.tsx                 # Calculated targets reveal + registration prompt
│
├── (tabs)/                         # Main App Navigation (Authenticated)
│   ├── _layout.tsx                 # Tab Bar (Today, Camera, Trends, Profile)
│   ├── index.tsx                   # Today / Dashboard
│   │                               #   - Calorie remaining ring
│   │                               #   - Macro progress bars (P / C / F)
│   │                               #   - Date jumper (yesterday, tomorrow)
│   │                               #   - Meal list grouped by type
│   │                               #   - Active streak banner
│   ├── camera.tsx                  # Camera trigger / Viewfinder
│   ├── analytics.tsx               # Weight progression graph & macro distributions
│   └── profile.tsx                 # Personal settings, target overrides, app version
│
└── meal/                           # Meal Sub-routes (Modals & Details)
    ├── [id].tsx                    # Single meal detail, edit ingredients, delete
    └── review.tsx                  # AI result review: detected items, grams slider, confirm
```

---

## 3. Core State Machine: Photo-to-Log Meal Flow

```
[Camera Snap] 
       │
       ▼
[Compress Image] (JPEG, ~800-1200px max side, ~200-400KB)
       │
       ▼
[Edge Function: analyze-meal] ◄─── Checks daily quota in meal_analysis_usage
       │
       ├─► [Quota Exceeded] ──► [Show Paywall / Upgrade Screen]
       │
       ▼
[Return JSON Breakdown] (Food items, portions, macros, confidence score)
       │
       ▼
[Review Screen: meal/review.tsx]
       │
       ├─► User can adjust portion slider (+/- grams)
       ├─► User can add/remove detected ingredient items
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
