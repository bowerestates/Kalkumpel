# Kalkumpel - App Flow, Pages & Roles

> **Status:** Living Master Specification (Synchronized with CALai Screenshot Audit & Kalkumpel Brand System)  
> **Primary UI Language:** German (Deutsch - "Du"-Form)  
> **Secondary UI Language (i18n):** English (US) — user-switchable anytime in Profile / Settings  
> **Brand Visuals:** Mint Flame on Dark Teal Scanner Plate (`assets/logo.png` & `assets/logo-scanner-plate.png`), Emerald Action Buttons (`#10B981`)  
> **Navigation Framework:** Expo Router v4 (file-based routing)  
> **Auth & Data Layer:** Supabase Auth + Postgres + Row Level Security (RLS)  

---

## 1. User Roles & Access Matrix

| Role | Description | Access Level |
|---|---|---|
| **Anonymous (Unauthenticated)** | Guest opening the app for the first time | Welcome screen, 33-step onboarding questionnaire, localized results projection, paywall / auth creation |
| **Authenticated (Free User)** | Standard registered user with email/password, Apple, or Google | Daily dashboard, food scanner (up to 5 AI scans/day), barcode scanning (unlimited), manual entry, streaks, 7-day progress |
| **Kumpel+ Pro Subscriber** | Paid subscriber via RevenueCat (Apple/Google Pay) or Stripe Web | Unlimited AI scans, BLS 4.0 micronutrient details, 90d analytics, progress photos, PDF export, priority AI queue |

---

## 2. Global i18n (Internationalization) Architecture

The app is built German-first with clean internationalization:
- **Default Locale:** `de` (German, casual friendly "Du" form: *„Wie viele Workouts machst du pro Woche?“, „Dein Ziel“*).
- **Secondary Locale:** `en` (English: *„How many workouts do you do per week?“, „Your Goal“*).
- **Storage:**
  - Local device cache: `AsyncStorage.getItem('kalkumpel_locale')` for instant cold-start rendering.
  - Server profile sync: `profiles.preferred_language` (`de` | `en`) for cross-device consistency.
- **Implementation:** React Native i18n provider (`i18next` or lightweight context provider) wrapping `app/_layout.tsx`.

---

## 3. Comprehensive Onboarding Journey (Screens 1 to 33)

Derived from the full audit of screenshots (`IMG_3236.PNG` – `IMG_3268.PNG`):

| Step | Screen / Source | Purpose & UI Components | German UI Copy ("Du"-Form) | English Reference | Captured State / Data |
|---|---|---|---|---|---|
| **00** | **Welcome Screen**<br>*(Brand Intro)* | Features `assets/logo-scanner-plate.png` (or `assets/logo.png`), tagline, emerald CTA button (`#10B981`) | **KalKumpel**<br>Dein smarter KI-Kalorientracker.<br>Einfach fotografieren, Kalorien verstehen, Ziele erreichen.<br>CTA: **Jetzt starten** / **Ich habe bereits ein Konto** | Your AI calorie companion. Scan food in seconds.<br>CTA: *Get Started / I have an account* | Initial visitor session |
| **01** | `IMG_3236.PNG` | **Biologisches Geschlecht**<br>Card selector (Männlich, Weiblich, Divers) | **Wähle dein biologisches Geschlecht**<br>Hilft uns, deinen täglichen Grundumsatz präzise zu berechnen.<br>Optionen: *Männlich, Weiblich, Divers* | Choose your sex. Helps personalize your experience. | `profile.sex: 'male' \| 'female' \| 'other'` |
| **02** | `IMG_3237.PNG`<br>`IMG_3238.PNG` | **Trainingseinheiten / Woche**<br>Segmented card selector (0-2, 3-5, 6+) | **Wie viele Workouts machst du pro Woche?**<br>Damit stimmen wir deinen individuellen Energiebedarf ab.<br>Optionen: *0–2 (Gelegentlich), 3–5 (Regelmäßig), 6+ (Sehr aktiv)* | How many workouts do you do per week? | `profile.workouts_per_week: number` |
| **03** | `IMG_3239.PNG` | **Geburtsdatum**<br>Date picker / wheel selector | **Wann bist du geboren?**<br>Das Alter fließt direkt in die Berechnung deines Grundumsatzes (Harris-Benedict / Mifflin-St Jeor) ein.<br>Input: *Tag / Monat / Jahr* | When were you born? Taken into account for daily goals. | `profile.birth_date: string (YYYY-MM-DD)` |
| **04** | `IMG_3240.PNG` | **Empfehlungskanal**<br>Grid selector (TikTok, Instagram, Freunde, App Store, YouTube) | **Woher kennst du Kalkumpel?**<br>Optionen: *Freunde & Familie, Instagram, TikTok, App Store, YouTube, Sonstiges* | Where did you hear about us? | `analytics.referral_channel: string` |
| **05** | `IMG_3241.PNG` | **Bisherige Tracking-Erfahrung**<br>Binary choice (Ja / Nein) | **Hast du schon einmal Kalorien-Apps genutzt?**<br>Optionen: *Ja, habe ich / Nein, das ist mein erstes Mal* | Have you tried other calorie tracking apps? | `onboarding.has_tracked_before: boolean` |
| **06** | `IMG_3242.PNG` | **Wertversprechen / Social Proof 1**<br>Graph comparison: Mit Plan vs. Ohne Plan | **Entwickelt, damit du dranbleibst**<br>Gewichtsverlauf: Mit Kalkumpel erreichst du kontinuierlichen Fortschritt statt Jo-Jo-Effekt.<br>CTA: **Weiter** (`#10B981`) | Designed to help you stay on track. Weight trend. | Interstitial / education |
| **07** | `IMG_3243.PNG` | **Körpergröße**<br>Unit toggle (cm / ft, in) + number picker | **Wie groß bist du?**<br>Einheit: *cm (Standard) / ft, in*<br>Wird für Grundumsatz und BMI-Orientierung benötigt. | What is your height? cm / ft, in | `profile.height_cm: number` |
| **08** | `IMG_3244.PNG` | **Aktuelles Gewicht**<br>Unit toggle (kg / lbs) + scroll wheel / input | **Was ist dein aktuelles Gewicht?**<br>Einheit: *kg (Standard) / lbs*<br>Deine Ausgangsbasis für die Fortschrittsberechnung. | What is your weight? kg / lbs | `profile.weight_kg: number` |
| **09** | `IMG_3245.PNG` | **Professionelle Betreuung**<br>Binary choice | **Arbeitest du aktuell mit einem Trainer oder Ernährungsberater zusammen?**<br>Optionen: *Ja / Nein* | Do you currently work with a personal trainer or dietitian? | `onboarding.has_trainer: boolean` |
| **10** | `IMG_3246.PNG` | **Hauptziel**<br>Large visual cards | **Was ist dein primäres Ziel?**<br>Optionen: *Gewicht verlieren (Abnehmen), Gewicht halten, Muskeln aufbauen (Zunehmen)* | What is your goal? Lose weight, Maintain, Gain weight | `profile.goal_type: 'lose' \| 'maintain' \| 'gain'` |
| **11** | `IMG_3247.PNG` | **Wunschgewicht (Zielgewicht)**<br>Unit picker + target delta indicator | **Was ist dein Wunschgewicht?**<br>Anzeige: *z. B. 10 kg Differenz zum Ausgangsgewicht* | What is your desired weight? | `profile.target_weight_kg: number` |
| **12** | `IMG_3248.PNG` | **Motivations-Zwischenseite**<br>Target milestone card | **10 kg abnehmen beginnt mit dem richtigen Plan!**<br>Wir erstellen deinen persönlichen Fahrplan basierend auf deinen Zielen und deinem Tempo.<br>CTA: **Meinen Plan anpassen** | Losing X lbs starts with a plan! | Interstitial / encouragement |
| **13** | `IMG_3249.PNG` | **Tempo / Geschwindigkeit**<br>Slider (0,2 kg bis 1,0 kg / Woche) | **Wie schnell möchtest du dein Ziel erreichen?**<br>Slider: *Gemächlich (0,25 kg/Woche), Ausgewogen & Empfohlen (0,5 kg/Woche), Schnell (0,8 kg/Woche)*<br>Dynamische Anzeige: *„Ziel voraussichtlich im März 2027 erreicht“* | How fast do you want to reach your goal? | `profile.weekly_pace_kg: number` |
| **14** | `IMG_3250.PNG` | **Nutzen-Vergleich**<br>Split card: Mit Kalkumpel vs. Ohne Kalkumpel | **Einfacher ans Ziel kommen**<br>Mahlzeit in Sekunden per Foto erfassen, Plan verfolgen und täglichen Erfolg sehen.<br>CTA: **Weiter** | A simpler way to stay on track. Log meals in seconds. | Interstitial / value prop |
| **15** | `IMG_3251.PNG` | **Herausforderungen & Hürden**<br>Multi-select chips | **Was hat dich bisher aufgehalten?**<br>Optionen: *Fehlende Beständigkeit, Ungesunde Essgewohnheiten, Zeitmangel beim Kochen, Heißhunger, Mangelnde Motivation* | What's stopping you from reaching your goals? | `onboarding.obstacles: string[]` |
| **16** | `IMG_3252.PNG` | **Ernährungsform**<br>Single / multi-select with emoji | **Ernährst du dich nach einem bestimmten Prinzip?**<br>Optionen: *Ausgewogen (Klassisch), Low Carb, Vegetarisch, Vegan, Pescetarisch, Keto, Intervallfasten* | Do you follow a specific diet? Balanced, Keto, Vegan... | `profile.dietary_preference: string` |
| **17** | `IMG_3253.PNG` | **Sekundäre Ziele**<br>Multi-select checkboxes | **Was möchtest du noch erreichen?**<br>Optionen: *Gesünder essen & leben, Mehr Energie im Alltag, Mehr Muskelmasse & Kraft, Besseres Körpergefühl* | What would you like to accomplish? | `onboarding.secondary_goals: string[]` |
| **18** | `IMG_3254.PNG` | **Fortschrittskurve & Ermutigung**<br>Trend tabs: 3 Tage, 7 Tage, 30 Tage | **Du hast das Zeug dazu, dein Ziel zu knacken**<br>Echte Veränderung braucht Beständigkeit in den ersten 4 Wochen.<br>CTA: **Weiter** | You have great potential to crush your goal. | Interstitial / education |
| **19** | `IMG_3255.PNG` | **Personalisierungs-Bestätigung**<br>Badge & lock animation | **Danke für dein Vertrauen!**<br>Jetzt schneiden wir Kalkumpel exakt auf dich zu... | Thank you for trusting us! Personalizing... | Loader / transition |
| **20** | `IMG_3256.PNG`<br>`IMG_3257.PNG` | **Verbrannte Kalorien anrechnen?**<br>Toggle card with workout preview | **Aktivitätskalorien zum Tagesziel dazurechnen?**<br>Kalkumpel erkennt deine Trainingseinheiten und kann verbrannte Kalorien deinem Tagesbudget gutschreiben.<br>Optionen: *Ja, anrechnen / Nein, Budget fix lassen* | Add calories burned back to your daily goal? | `profile.add_burned_calories: boolean` |
| **21** | `IMG_3258.PNG`<br>`IMG_3259.PNG` | **Apple Health / Google Fit Sync**<br>Health sync permission card | **Aktivitäten mit Apple Health / Google Fit synchronisieren?**<br>Damit Schritte, Läufe und Workouts automatisch in deine Energiebilanz einfließen.<br>CTA: **Health verbinden** / **Später einrichten** | Sync workouts from Apple Health / Google Fit? | `profile.health_sync_enabled: boolean` |
| **22** | `IMG_3260.PNG` | **Kalorien-Übertrag (Rollover)**<br>Feature explanation toggle | **Überschüssige Kalorien auf den nächsten Tag übertragen?**<br>Übertrage bis zu 200 kcal in den Folgetag für mehr Flexibilität am Wochenende.<br>Optionen: *Aktivieren / Deaktiviert lassen* | Rollover extra calories to the next day? (Up to 200 kcal) | `profile.rollover_calories_enabled: boolean` |
| **23** | `IMG_3261.PNG` | **Social Proof / Community Vertrauen**<br>Rating badges (4.8 Sterne, DACH Community) | **Werde Teil der Kalkumpel-Community**<br>Tausende Menschen erreichen ihre Ziele mit smarter KI-Unterstützung.<br>CTA: **Weiter** | Join over 10 million people like you. | Social proof |
| **24** | `IMG_3262.PNG` | **Push-Benachrichtigungen**<br>Permission prompt card | **Bleibe mit sanften Erinnerungen am Ball**<br>Kalkumpel erinnert dich dezent an Mahlzeiten und hilft dir, deine Serie (Streak) zu halten.<br>CTA: **Erinnerungen erlauben** / **Nicht jetzt** | Stay on track with notifications. | `profile.notifications_enabled: boolean` |
| **25** | `IMG_3263.PNG` | **Gutschein- / Empfehlungscode**<br>Optional input field | **Hast du einen Empfehlungscode? (Optional)**<br>Gib hier den Code von deinem Kumpel oder Coach ein.<br>Input: *Code eingeben* / CTA: **Überspringen / Weiter** | Enter referral code (optional). | `onboarding.referral_code: string \| null` |
| **26** | `IMG_3264.PNG` | **Berechnungs-Animation (Loader)**<br>Progress circle (0% -> 100%) | **Wir berechnen deinen optimalen Ernährungsplan...**<br>Tagesbudget für Kalorien, Eiweiß, Kohlenhydrate und Fette wird kalibriert. | We're setting everything up for you (77%...). | Dynamic calculation |
| **27** | `IMG_3265.PNG` | **Dein persönlicher Fahrplan (Ergebnis)**<br>Interactive projection chart | **Dein Ziel: 10 kg weniger bis 12. März 2027**<br>Dein empfohlenes Tagesbudget: **2.150 kcal**<br>Eiweiß: 160g • Kohlenhydrate: 215g • Fett: 70g<br>CTA: **Plan sichern & fortfahren** | Goal: lose 22.4 lbs by date. Estimated progress graph. | Calculated nutrition plan |
| **28** | `IMG_3266.PNG` | **Konto anlegen (Fortschritt sichern)**<br>Apple, Google, E-Mail Sign-Up + AGB/Datenschutz | **Sichere deinen Fortschritt**<br>Damit deine Daten und dein Plan nicht verloren gehen.<br>Buttons: **Mit Apple fortfahren**, **Mit Google fortfahren**, **Mit E-Mail registrieren**<br>Checkboxes: *Ich stimme den AGB und den Datenschutzbestimmungen zu.* | Save your progress. Sign in with Apple, Google, Email. | Supabase Auth Registration |
| **29** | `IMG_3267.PNG`<br>`IMG_3268.PNG` | **Kumpel+ Paywall (Trial Offer)**<br>3 Tage kostenlos testen, Jahres- vs. Monatsabo | **Teste Kalkumpel Pro 3 Tage kostenlos**<br>Keine Zahlung heute fällig. Jederzeit kündbar.<br>Optionen: *Jahresabo (29,99 €/Jahr - spare 75%) / Monatsabo (9,99 €/Monat)*<br>CTA: **Kostenlos testen & starten** (`#10B981`) / **Eingeschränkt kostenlos fortfahren** | We want you to try for free. 3 DAYS FREE. $29.99/yr. | RevenueCat checkout trigger |

---

## 4. Post-Onboarding Experience (Screens 30 to 72)

### A. Erstes Foto-Tracking & Kamera-Freigabe
- **`IMG_3270.PNG` — Kamera-Berechtigung:**
  - *German:* „Kalkumpel benötigt Zugriff auf die Kamera, um deine Mahlzeiten in Sekunden per KI zu analysieren.“
- **`IMG_3272.PNG` — Anleitung für optimale Scans:**
  - 1. Kamera ruhig halten (Hold still)
  - 2. Ausreichend Licht nutzen (Use lots of light)
  - 3. Alle Zutaten sichtbar machen (Ensure all ingredients are visible)
  - CTA: *„Verstanden & Scannen“*
- **`IMG_3275.PNG` — Barcode-Modus (Umschaltbar):**
  - Schnellumschaltung zwischen KI-Teller-Foto und Barcode-Scanner für verpackte DACH-Produkte via Open Food Facts.

### B. KI-Mahlzeiten-Analyse & Zutaten-Editor
- **`IMG_3273.PNG` & `IMG_3276.PNG` — Ergebnis-Vorschau:**
  - Gericht-Titel (z. B. *„Lachs-Avocado-Salat“*), Kalorienzahl, Makronährstoff-Balken (Eiweiß, Kohlenhydrate, Fett).
- **`IMG_3274.PNG` — Zutaten prüfen & anpassen:**
  - *German:* „Ergebnis prüfen & anpassen: Tippe auf Zutaten, um Portionsgrößen zu verändern oder vergessene Beilagen hinzuzufügen.“
- **`IMG_3277.PNG` & `IMG_3278.PNG` — Schnelle Kalorienkorrektur:**
  - Numerische Schnelleingabe zur manuellen Feinkorrektur bei Bedarf.

### C. Dashboard, Tagesübersicht & Kalorienringe
- **`IMG_3269.PNG` & `IMG_3285.PNG` — Haupt-Dashboard:**
  - Kalorienbudget Rest (z. B. *„Noch 1.527 kcal heute“*).
  - Makro-Restanzeigen (Eiweiß, Kohlenhydrate, Fett).
  - Wöchentlicher Kalenderstreifen mit farbigen Ringen.
- **`IMG_3307.PNG` — Bedeutung der Ringfarben:**
  - **Grün:** Ziel eingehalten oder bis zu 100 kcal im Defizitbereich.
  - **Gelb:** 101–250 kcal über dem Tagesziel.
  - **Rot:** Mehr als 250 kcal über dem Tagesziel.
  - **Grau:** Noch nicht erfasst.

### D. Fortschritt, Gewicht & Energiebilanz
- **`IMG_3279.PNG` & `IMG_3306.PNG` — Gewichtsverlauf:**
  - Startgewicht, aktuelles Gewicht, Zielgewicht und errechnetes Zieldatum.
  - Taste: *„Gewicht wiegen & eintragen“*.
- **`IMG_3280.PNG` — Trend-Perioden:**
  - Delta-Anzeige für 3 Tage, 7 Tage, 14 Tage, 30 Tage, 90 Tage und Gesamtzeitraum.
- **`IMG_3281.PNG` & `IMG_3282.PNG` — Energiebilanz & Fotos:**
  - Balkendiagramm: Verbrauchte Energie vs. Zugeführte Kalorien (Burned vs. Consumed).
  - Privates Fortschrittsfoto-Tagebuch (verschlüsselt in Supabase Storage).

### E. Gamification & 36-Abzeichen-System (Badges)
- **`IMG_3288.PNG` — Freischalt-Pop-up:**
  - *„Neues Abzeichen freigeschaltet: Eintagsfliege (Tagesziel zum ersten Mal erreicht)!“*
  - Tasten: *Abzeichen teilen* / *Alle Abzeichen ansehen*.
- **`IMG_3289.PNG`, `IMG_3290.PNG`, `IMG_3291.PNG` — Meilenstein-Galerie:**
  - Tage-Serie (Streak-Zähler mit Flammen-Icon).
  - 36 Sammel-Abzeichen in Bronze, Silber, Gold (z. B. *Grüne Maschine: 5 Tage Blattgemüse*, *Nuss-Knacker: 4 Tage gesunde Nüsse*, *Beeren-Hunger*, *Kilo-Killer: 5 kg abgenommen*).

### F. Community & Richtlinien
- **`IMG_3293.PNG` – `IMG_3302.PNG` — 7 Kalkumpel-Community-Regeln:**
  1. **Seid respektvoll zueinander:** Hinter jedem Profil steckt ein echter Mensch.
  2. **Null-Toleranz für Hass & Diskriminierung:** Kein Platz für Anfeindungen.
  3. **Auf die Wortwahl achten:** Ein freundlicher, ermutigender Umgangston.
  4. **Keine gesundheitsgefährdenden Crash-Diäten:** Förderung nachhaltiger gesunder Gewohnheiten; Kalkumpel ersetzt keine medizinische Beratung.
  5. **Keine Falschinformationen:** Nur wissenschaftlich haltbare Ernährungstipps teilen.
  6. **Beim Thema bleiben:** Rund um Ernährung, Fitness und Gewohnheiten.
  7. **Keine politischen oder spaltenden Debatten.**

### G. Erinnerungen & Einstellungen
- **`IMG_3305.PNG` — Mahlzeiten-Erinnerungen:**
  - Frühstück (08:30 Uhr), Mittagessen (12:30 Uhr), Snack (16:00 Uhr), Abendessen (19:00 Uhr), Tagesabschluss (21:00 Uhr).
- **`IMG_3303.PNG` & `IMG_3304.PNG` — Einstellungen:**
  - Sprachauswahl: *Deutsch (Standard) / English*.
  - Einheiten: *Metrisch (kg, cm, kcal) / Imperial (lbs, ft, in)*.
  - Daten synchronisieren, AGB, Datenschutz, Konto löschen.

---

## 5. Next Implementation Milestones

1. **Phase 1: i18n & Core Onboarding Screen Flow**
   - Implement `locales/de.json` and `locales/en.json`.
   - Build Onboarding router (`app/onboarding/`) featuring `assets/logo-scanner-plate.png` on Welcome and emerald `#10B981` action buttons across all steps.
2. **Phase 2: Nutrition Math & Dynamic Projection Engine**
   - Harris-Benedict / Mifflin-St Jeor BMR calculator calibrated with workout frequency and target pace slider.
3. **Phase 3: RevenueCat Paywall & Supabase Auth Bridge**
   - Trial subscription screen with anonymous-to-authenticated account saving.
