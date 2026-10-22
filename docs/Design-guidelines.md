# Kalkumpel — Design Guidelines (Web)

## Profile reference enhancement design — 22 Oct 2026 (Batch A built, remainder planned)

The approved 15-screenshot review keeps its original 1–41 IDs, fully listed in [tasks.md](tasks.md). Personal Details (3/18/19) is built; other entries below remain the upcoming design brief. Retain Plus Jakarta Sans, existing semantic tokens, white/mint default, nutrient colours and DE/EN formatting. Reuse familiar edit, back, share and delete icons, accessible labels and stable controls; all detail views return to their parent.

- **Personal Details (3, 18, 19a–19e):** Profile drill-down with prominent real goal-weight summary/„Zielgewicht ändern“, pencil-edit rows for current weight, height, birth date/derived age, gender and daily step target. Step goal is a preference, not tracked steps; 10.000 is an illustrative screenshot value. Weight edits preserve the rule that weighing never recalculates calorie goals.

  Implemented `/profil/daten`: round mint back arrow to Profil, unframed goal summary with large weight, five divided icon/pencil rows and individual save/cancel dialogs. Birthday is a real date picker with derived age, not an age-only field or invented birthday. Missing birthday/step target shows „Noch nicht angegeben“. Numeric fields accept comma/dot and keep DE/EN display; current-weight history updates without changing targets. Existing Profile keeps name/goal/activity/diet and explicit recalculation, while these personal fields move to the new page. Desktop and English 390 px layouts/browser saving are checked; signed-in cross-device readback is not verified.
- **Preferences (4, 7, 20, 21, 23–26):** dedicated page; three appearance previews (System/Hell/Dunkel), switches for badge celebrations, future burned-calorie credit, future rollover and opt-in macro rebalance. Health row opens preparation wishes only, never fake connected status. Theme variants must keep text/control contrast and Welcome branding; disabling celebrations must not disable badge earning. Marketing opt-in/withdrawal must be visibly independent of existing recipe/workout personalisation and default unchecked. No marketing delivery is implied.
- **Nutrition Goals (8, 27, reuse 28):** vertical four-item calorie/protein/carbohydrate/fat editor with real target rings, validated decimal drafts and current nutrient colours (calorie dark/flame, protein red, carbohydrate amber, fat blue). Reuse explicit „Ziele neu berechnen“; do not make weigh-ins auto-recalculate targets. Auto-adjust macros (25) applies only after intentional calorie-target edits with opt-in.
- **Weight History (11, 29–31):** „Letztes Wiegen“, large real weight, real ± change since baseline month, date/weight rows and sticky „Gewicht eintragen“. Retain add/edit/delete and no target recalculation. Show photo markers only for actual associated pictures from 38.
- **Follow Us (15):** icon links to Gordon's Instagram `https://www.instagram.com/kalkumpel/` and TikTok `https://www.tiktok.com/@kalkumpel_ki`. Omit X: no address supplied.
- **Account deletion (17):** clearly destructive action, confirmation/cancel and pending/error/success states; distinguish permanent account/data/photo removal from local reset. Legal review, verified owner deletion and hosted readback are required, not presumed compliance.
- **Heute (35):** relevant salad/food illustration and friendly German „Tippe auf +, um Deine erste Mahlzeit einzutragen“, with English equivalent and working add action. Existing macro presentation (34) stays. **Rollover pill (33):** small history-clock amount by remaining calories only after verified carryover; use actual amount up to 200 kcal, never fixed +200. Execution remains native/deferred with 24; no current web budget change.
- **Progress date (36):** estimate below weight progress, based on saved goal and selected pace; localised real date, no guaranteed outcome, no fabricated forecast for maintenance/missing pace/reached goal.
- **Progress photos (38, association 30):** relevant photo/mirror icon and „+ Foto hinzufügen“, real private images with view/delete and meaningful empty/loading/error states. No stock selfie as user evidence. Photo consent, retention, guest/offline handling and existing proposed Pro restriction must be resolved before build.
- **Weekly calories (39):** segmented choices „Diese Woche“, „Letzte Woche“, „Vor 2 Wochen“, „Vor 3 Wochen“ controlling real bars/average. Missing-day denominator, corrections and local week boundaries need a documented rule before implementation; no invented averages.
- **BMI (41):** real BMI/status, four-segment spectrum and accurately placed indicator, informational tooltip/dialog. Adult bands blue <18.5, green 18.5–<25, amber 25–<30, red ≥30 (include exactly 30.0). Locale-aware values, non-diagnostic explanation, adult applicability and appropriate limitations; no personal health score or judgement.

**Keep unchanged:** 1 header (no new avatar/username functionality implied), 2 invites (no cash reward), 5 language, 10 reminders (native notifications still deferred), 28 explicit recalculation and 34 Today macros. Item 19's local editing is now complete; account readback remains separate.

**Ignore:** 6 family plan, 9 duplicate goals row, 12 extra Profile ring guide row (keep guide via Fortschritt), 13 native widget carousel on web, 16 logout redesign (keep working logout).

**Park:** 14a–14h support/legal section content/presentation, 22 Live Activities, 32 PDF explainer/generator, 37 weight interval comparisons and 40 expenditure comparisons. Parking AGB/privacy rows does not waive launch legal obligations. Burned-calorie/carryover switches are web preparation only; real OS access and budget changes remain native work.

**Acceptance:** Batch A detail/back, all field saves/reload, invalid weight and phone/desktop layouts pass with no page errors and 54 passing tests. Remaining batches require their own checks; owner-only photo/account actions and Batch A account readback are not certified here.

> Updated: 11 Oct 2026. Approved design, not the older native dark-theme proposal.  
> Clean, approachable, high-contrast nutrition tracking. Detailed screen checkpoint: [Onboarding-progress.md](Onboarding-progress.md).

## 1. Brand and typography — approved

- **Keep the existing scanner-plate/flame logo permanently** (Gordon, 11 Oct 2026). Welcome uses `src/assets/welcome-logo.png`; favicon uses `public/favicon.png`. Older native `assets/logo.png` and `assets/logo-scanner-plate.png` are not replacements to import.
- Welcome alone is near-black with white **Kalkumpel** lettering and green branding. Plate/flame sit inside scan corners; the approved ring simplification and spacing remain.
- Keep original **Plus Jakarta Sans** typography and approved copy colour roles; do not substitute a rounded wordmark or new font.
- Every screen after Welcome uses white surfaces, readable deep mint/emerald text, muted mint helpers and emerald active states. Retain existing nutrient colours as the exception to monochrome mint.
- Use mint line icons rather than emoji/full-colour icons. Do not copy unverified user counts, stars, reviews or named testimonials from references.

## 2. Tokens and controls

Use semantic tokens in `src/styles.css` and existing UI components, not a second native theme or hardcoded colour palette. Emerald/mint brand references remain `#10B981`, pressed/active `#059669`, deep text around `#064E3B`, soft selection tints around `#ECFDF5`. These describe roles; the CSS tokens are the implementation authority. Do not replace current protein/carbohydrate/fat colours with the historical palette proposal.

- Standard unselected choice: white, thin mint border, mint icon badge, label and radio.
- Selected choice: soft mint tint, emerald border and filled radio.
- Chart/comparison sections: white with thin mint border, **not filled green panels**. Chart-area shading can remain where approved.
- Round soft-mint back arrow; thin progress line; large bold heading, muted subtitle and full-width pill CTA. Required answers keep Continue disabled until chosen.
- Support touch, mouse and keyboard controls without unstable sizing or clipped German/English labels.
- Gentle transitions, respecting reduced motion. Native haptics are future iOS work, not a web implementation requirement.

## 3. Completed onboarding design

There are **23 base in-route screens plus up to four optional health-preparation pages and the separate account stage**, not the old 13- or 33-screen sequence. Question/interstitial progress covers the first 20; setup, result and features follow. See the numbered list in Onboarding-progress.md.

- Screenshot layouts are adapted screen by screen into friendly German “Du” copy; explanations to Gordon remain English.
- Birthday: month/day/year wheels with mint centre band. Height: cm/ft-in wheels. Current/target weight: kg/lbs switch and scrolling horizontal scale with fixed centre marker; swipe, drag, wheel and arrow keys adjust the value.
- Goal immediately follows current weight: **Abnehmen / Gewicht halten / Muskeln aufbauen**.
- Plan statement uses actual weight difference. Pace comes immediately after it with **Entspannt / Empfohlen / Ehrgeizig**, live timeline and daily calories. Values are estimates, not guaranteed outcomes.
- Diet uses the matching mint choice-card pattern.
- “Ohne / Mit Kalkumpel” figures are the same abstract solid person; the latter has a medal around the neck, not a trophy or a different person.
- Potential/comparison charts are illustrative, not real user history. Community uses 21 mint avatars in three overlapping depth rows without counts, rating badges or “viele mehr”.
- Setup: percentage, mint progress line, changing status and calorie/carbohydrate/protein/fat checklist. No personal health-score completion item.
- Result: calculated goal/date, estimated curve, calories/macros in existing nutrient colours. Edit pencils remain upcoming; targets can currently be edited in Profile.

## 4. Account and plan screens

“Sichere Deinen Fortschritt” follows plan/features and precedes Free/Premium choice. Use matching Plus Jakarta Sans heading, round back arrow, completed thin progress line, white surface and emerald pill CTA.

Web offers Apple (disabled, labelled as future iOS), Google and email in that order on both account pages. Google and Apple use monochrome icons in the existing mint design. Storage consent and optional future recipe/workout personalisation both start unchecked; only storage consent gates Google/email continuation on `/konto`. Returning users on `/auth` are not asked to consent again. Do not imply marketing email permission, blanket legal approval or paid access. Profile permits optional personalisation withdrawal; approved legal notices, sensitive-data lawful basis, retention, full consent history and deletion/export remain launch prerequisites.

Plan preview: **5,99 €/week**, **11,99 €/month** or **34,99 €/year**, **3-day trial on all plans**, Free **3 AI photos/day**, future Pro **unlimited photos/day**. There is no implemented payment or active trial; Premium explains unavailability rather than granting local paid status.

## 5. Capture, barcode and meal-score design

- Photo and barcode capture include German/English camera-access messages, loading/error states and usable fallbacks.
- Photo results allow ingredient/portion edits before saving. Browser camera barcode scanning and typed-code Open Food Facts lookup are implemented, with gram-scaled nutrition review.
- Fuller product/Nutri-Score layout and scan-tips screen remain future work; do not depict them as already delivered.
- OpenAI is the current server provider via Lovable AI Gateway (`AI_VISION_MODEL = "openai/gpt-6-luna"`); this is not a visible provider badge or a claim of model availability/privacy certification.
- Meal score: compact **Mahlzeiten-Score**, 1–10 or insufficient information, “Geschätzt”, expandable reasons, optional practical balance idea, confidence and non-medical disclaimer. Supportive mint styling; no shame, red failure indicator or calorie-based good/bad label.
- Saved scores reopen without AI. Reassessment failure must still leave saving available. See Meal-score-rubric.md.

## 6. Language-aware presentation (complete web rollout)

All text uses DE/EN dictionaries. Numbers/dates use the selected language through shared `Intl` helpers: German **2.150 kcal / 75,5 kg / 11.10.2026**; English (`en-GB`) **2,150 kcal / 75.5 kg / 11/10/2026**. Unit preferences are separate from language and stored measurements remain metric.

All existing web number/date displays now share the selected-language helpers: Today calorie/macro totals, Progress weights/streaks/day labels, photo/barcode/manual capture and saved meal review, onboarding pace/result/month and height/weight controls, Settings values/targets and the plan prices. Shared decimal drafts accept comma or dot, preserve valid numeric values after invalid edits, and format on blur. German price: **34,99 €**; English: **€34.99**. Stored data remains numeric, CSS percentages remain unlocalized, and date-only keys stay calendar days. Birth years are identifiers displayed without thousands grouping. Regression suite: 11 passing tests; live guest DE/EN checks passed on Today, Progress, Settings, Paywall and weight saving, with no page errors. Authenticated cross-device verification remains separate.

## 7. Deferred reference designs

Meal reminders (IMG_3305, 17 Oct 2026): separate screen from Profil with a round mint back arrow, large heading, four meal rows with thin separators, stable time inputs and emerald switches, followed by a separate end-of-day section. White/mint styling adapts the reference without importing its black controls. All switches start off, each time remains editable independently, and a clear note states device-only saving and native-only notification delivery. No web permission prompt or fake success notification.

Weekly green/yellow/red/grey day rings are live on Heute and Fortschritt (Mon–Sun strip, seven-day bars). Ring reference thresholds: green within target or at most 100 kcal over; yellow 101–250 over; red more than 250 over; grey unlogged. The "Ringfarben erklärt" guide (`/ringfarben`, linked from Fortschritt only — the Heute strip shows the coloured rings without a link, per Gordon 18 Oct 2026) shows the current Mon–Sun week with real dates in the rings — the person's own days once anything is logged, otherwise a target-relative sample week that always shows all four colours — plus a matching sample date and kcal example on every colour row, so it is clear where the rings are seen.

Native iOS will add Apple sign-in, HealthKit and haptics; Android will use Health Connect. Optional web health-preparation holders are approved (17 Oct 2026), but must not report a connected service or credit any activity calories. Remaining visual/reference polish and optional questions are tracked in tasks.md rather than claimed complete.

## Current web feature checkpoint

| Feature | Implemented now | Remaining / limitations |
|---|---|---|
| Branding | Approved scanner-plate/flame Welcome logo and favicon; Gordon confirmed keeping the existing logo permanently | No replacement with older `assets/` logos |
| Onboarding | 23 base in-route screens plus up to four optional health-preparation pages after Thanks, followed by the separate account stage | Full order in `Onboarding-progress.md`; remaining reference polish/options in `tasks.md` |
| Targets | Mifflin-St Jeor-based calories/macros, goal-weight difference, guided pace and estimated target date | Estimates, not guaranteed outcomes; result-screen editing remains upcoming |
| Accounts | Email/password signup/sign-in/reset plus Google OAuth wiring and a disabled native Apple placeholder, local plan draft, owner-scoped Supabase sync, unchecked storage and optional personalisation consent | Real confirmation delivery and cross-device checks still unverified; legal review, retention, export/deletion and complete consent history required |
| Photo analysis | Server-side OpenAI via Lovable AI Gateway; configured `AI_VISION_MODEL = "openai/gpt-6-luna"`; ingredient/portion review before saving; signed-in private photos | Model availability/access depends on provider; BLS grounding and scan-tips screen upcoming; no independently verified zero-retention guarantee |
| Barcode | Browser camera scanning with ZXing, permission messaging, typed-code fallback, Open Food Facts lookup, gram-based nutrient scaling and review | Product coverage varies; fuller product/Nutri-Score sheet, BLS/USDA and attribution page upcoming |
| Meal score | Photo/barcode/manual evidence, versioned estimated 1–10 score or null, independent confidence, saved explanation and failure-tolerant logging | No personal health score; real photo/barcode examples and signed-in cross-device verification remain upcoming |
| Daily app | Remaining/eaten calories, nutrient rings, grouped meals, manual logging, delete, saved meal-score review/edit on the meal detail page (`/mahlzeit/$id`: meal type · date caption, editor, score card, save, back, red text "Mahlzeit löschen"), weight chart, seven-day bars and streak counter, weekly day-ring strip (Mon–Sun, green ≤ target+100 / yellow ≤ +250 / red beyond / grey empty) and "Schnell korrigieren" correction card (+/− kcal, one correction per day, synced) | Screen-by-screen logic review still upcoming; streak grace rules and remaining screenshot features not built |
| Language/formatting | Complete Phase 0 web rollout: selected-language `Intl` numbers, dates and EUR prices across Today, Progress, Capture/review, onboarding and Settings; comma/dot weight, nutrition and portion input; profile language sync implemented | 11 regression tests pass; guest browser checks pass in DE/EN for Today, Progress, Settings, annual price and weight saving; authenticated cross-device checks remain separate |
| Plans | Account precedes Free/Premium choice; preview shows 5,99 €/week, 11,99 €/month and 34,99 €/year (annual marked “Spare 76 %”), 3-day trial on all plans | No checkout or paid entitlement; everyone currently gets 3 photo scans/day; future verified Pro permits unlimited scans |
| Native iOS | HealthKit, workout-calorie credit and Apple sign-in explicitly deferred | Optional iOS/Android onboarding holders built; no live health sync or budget changes |

## Documentation checkpoint — 11 Oct 2026

These documents describe the current **web app**, not an already-built native app. `Masterplan.md` defines product decisions, `tasks.md` tracks delivery and verification, `Implementation-plan.md` uses the same phase numbers, `app-flow-pages-and-roles.md` describes actual navigation, and `Design-guidelines.md` records approved visuals. `Onboarding-progress.md` preserves the detailed screen sequence; `Meal-score-rubric.md` defines scoring.

For every agreed coding, behaviour or design change, save the corresponding documentation and task updates in the same delivery. Mark implemented, partial, upcoming and unverified work separately. Do not overwrite approved decisions, silently promote placeholders to completed features, or claim remote GitHub synchronization without checking it. Historical native specifications in `prompt.md` and `Provider-Recommendations.md` do not override this web checkpoint.


## Water card (17 Oct 2026)
Updated 22 Oct 2026: Heute shows a compact „Wasserkonsum“ tab (same card style as the rest of the page): blue droplet icon, title, slim progress bar and today's amount against the goal (e.g. „1,0 L / 2,65 L“) with a chevron. Tapping it opens the dedicated `/wasser` page with the detailed widget: a large blue ring, one drop per 250 ml glass, the goal explanation (35 ml pro kg, mind. 2 L), „Ziel erreicht – stark!“ once reached, remove/„+250 ml“/„+500 ml“/„+1.000 ml“ buttons and a „Letzte 7 Tage“ card with per-day bars, real local dates and „Heute“ highlighted. A round back arrow returns to Heute. The Wasser badge blue (not mint) keeps signalling water.

## Badges (16 Oct 2026)
The „Tage in Folge“ summary uses the original Kalkumpel flame silhouette tinted with the existing red/protein token (22 Oct 2026), replacing the generic line flame. This is page-scoped: Welcome branding and badge colours remain unchanged.

Updated 22 Oct 2026: Fortschritt starts with two equal-width compact summaries: smaller „Tage in Folge“ and a single flame-shield icon with the actual earned count. The icon opens `/erfolge`, immediately showing all 28 achievable badges, earned or locked, without filtering. Earned badges retain their category colours and locked badges remain grey with locks. Hover/keyboard explanations above each badge and tap details remain unchanged. A round back arrow returns directly to Fortschritt. Seven-day bars and dated coloured rings remain below the summaries; no badge rules or account sync changes.

Badges are the one exception to mint-only icons: each group has a soft accent token in src/styles.css — Serien amber, Mahlzeiten emerald, Kalorienziel sky, Wasser blue, Gewicht gold, Gewohnheiten & Spaß violet, Freunde rose. Every badge uses Gordon's flame-shield emblem (metal shield, concentric rings, flame; approved 17 Oct 2026). Earned badges tint the rings and flame to the group colour with a soft glow and stars for higher tiers; locked badges show the same shield in faded grey with a small lock. The unlock pop-up uses the group colour for the label and the "Weiter so!" button (dark text for contrast). Hovering a badge in the „Erfolge" grid shows a small popover-style tooltip with the badge name and its explanation (same bilingual text as the tap-details dialog); it also appears on keyboard focus.

## Optional health onboarding — 17 Oct 2026

After „Danke für Dein Vertrauen!“ and before calculation setup, up to four optional pages appear: (1) burned-calorie preference, (2) sync workouts with Apple Health / Health Connect, (3) connection preparation, (4) rollover preference (future maximum 200 kcal). The original 20-step progress remains unchanged; the optional stage has its own four-segment progress. iPhone/iPad and Android are detected after hydration; desktop offers an explicit platform choice. Platform detection is presentation only, never proof that a native service exists.

Every page has „Überspringen“, which resets all optional wishes and goes directly to setup. „Nein“ declines the current preference; declining workout sync bypasses the connection page and opens rollover. Back returns through the optional pages or to Thanks. Preparing a connection saves only a request and shows that permissions/connection come later in the native app; no connected checkmark, OS permissions or fake success. Example workout/budget numbers and rollover visuals are labelled examples and never become meal/activity data.

The workout-sync photo is anchored to its top edge (`object-cover object-top`) so the runner's head and ponytail stay fully visible at every card width; only the lower legs are cropped, and they sit behind the example banner.

On feature completion, `onboardingDetails.healthSetup` saves version, platform, addBurnedCalories, syncWorkouts, connectionRequested, connectedPlatform (always null), and rolloverCalories locally. Existing owner-only profile JSON sync carries these validated wishes when signed in; no migration is required. Native apps must request real consent separately. Targets and all current calorie calculations are unchanged. Real account cross-device readback remains unverified.

Testing: complete onboarding through Thanks, exercise Yes/No, switch Apple Health/Health Connect, prepare then continue, or skip any page; verify setup/result/account continue normally and saved wishes survive reload. Native integration is the next step, not delivered by these holders.


## Google account layout — 19 Oct 2026

Implemented: `/konto` and `/auth` show Apple (disabled, future iOS label), Google and email, preserving the white/mint design. On `/konto`, required storage consent gates Google/email and optional personalisation stays separate; choices are saved before leaving for Google. Google uses Gordon’s existing Supabase Auth, not a workspace Google connector. The callback is the same-origin public `/auth?oauth=google`, with `&next=paywall` for onboarding. The SDK establishes its session and `getUser()` validates it; onboarding returns to `/konto` to confirm consent before plan choice, while other accounts continue to Today or onboarding. No paid entitlement is granted and no second auth listener was added.

Upcoming setup: create a Web application OAuth client in Google Cloud; register the callback URL shown in Supabase’s Google provider panel, configure the email/profile/openid scopes and enable Google in Supabase with the client ID/secret. Allow the exact app return URLs for each origin in Supabase Authentication → URL Configuration. Test Google in the published app or preview opened in a new tab, not the editor frame. Real Google login/account sync requires that provider setup; Apple is not a working web sign-in method.


## Scan guide placement — 22 Oct 2026

The „So funktioniert's“ trigger is an inline card-style button on Heute, not a floating badge. It sits directly above the „Schnell korrigieren“ card and uses the same `rounded-3xl` border/card treatment, so both share one width and one left edge — the pair reads as two stacked cards in the same column. Mint is used for the icon and label only; no filled background, so the button stays quiet next to the correction card it introduces.

The 4-step guide itself is unchanged: it still opens automatically on the first Heute visit after onboarding, and the step-1 photo still follows the onboarding gender (sporty woman, fit gym man, or both for divers). Removing the fixed position also clears the overlap the floating badge had with the meal „+“ buttons on narrow phones.
