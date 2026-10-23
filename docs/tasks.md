# Kalkumpel – Tasks (Web App)

> Source of truth: `docs/Masterplan.md` for current product decisions and this task list for completion/verification, supported by `app-flow-pages-and-roles.md`, `Design-guidelines.md` and `Implementation-plan.md`. Harmonized web checkpoint: 11 Oct 2026. `prompt.md` and `Provider-Recommendations.md` retain historical native proposals; they do not override current web decisions.
>
> **Stack translation:** The GitHub repo specifies Expo / React Native. This Lovable project is the **web version** (TanStack Start + Tailwind). Mapping used here:
> Expo Router → TanStack file routes · Supabase → Gordon's own Supabase · `analyze-meal` Edge Function → server function via Lovable AI · RevenueCat → Stripe (web) · AsyncStorage → localStorage + profile sync.
>
> **Current accounts status:** Email/password accounts, saved profiles, meals, weights and private meal photos use Gordon's connected Supabase project. Browser storage remains the guest/offline store; Lovable Cloud must not be enabled.
>
> Legend: `[x]` done · `[~]` partly done / placeholder · `[ ]` upcoming

## Profile reference review — 22 Oct 2026 (Batches A–C and 39/41 implemented; later builds upcoming)

Gordon's annotated 15-screenshot review is catalogued below with the original **1–41 IDs**. Quote an ID to change scope. Personal Details, Preferences, Nutrition Goals (Batches A–C) and Progress insights (39/41) are implemented and locally verified; other enhancements remain upcoming. This ledger governs the enhancement queue; existing phase records remain delivery history.

**Status groups:** Ignore: 6, 9, 12, 13, 16. Park: 14a–14h, 22, 32, 37, 40. Keep existing: 1, 2, 5, 10, 28, 34. Implemented/local checks pass: 3, 4, 7, 18, 19a–19e, 20, 21, 23, 24, 25, 26, 8, 27, 39 and 41; item 28 is reused with confirmation; real account readback remains unverified. Build/modify/align: other IDs, with the dependencies below.

| ID | Item | Decision and required work |
|---|---|---|
| 1 | Header / avatar / name / username reference | Keep current header unchanged; no new avatar/username capability claimed. |
| 2 | Referral banner | Keep existing invite flow and friend badges; no cash reward or promo redesign. |
| 3 | Personal details row | Implemented `/profil/daten`, reached from Profil with a back arrow and validated edit dialogs. |
| 4 | Preferences row | Implemented `/profil/einstellungen` from Profil with a back arrow, containing the agreed 7/20/21/23–26 preference controls. |
| 5 | Language | Keep current DE/EN control. |
| 6 | Family plan | Ignore; no family tier. |
| 7 | Apple Health / Health Connect management | Implemented editable saved platform/workout/connection-request wishes; always shows not connected and requests no OS permission. |
| 8 | Nutrition goals row | Implemented `/profil/ziele`, linked from Profil with back arrow and individual calorie/macro edits. |
| 9 | Duplicate goals/current-weight row | Ignore duplicate; use 3/18/19 and 8/27. |
| 10 | Tracking reminders | Keep `/erinnerungen`; local preferences only, native notification delivery deferred. |
| 11 | Weight history row | Build Profile drill-down, reusing existing real weight history/edit/delete. |
| 12 | Ring-colour row on Profile | Ignore extra row; retain `/ringfarben` via Fortschritt. |
| 13 | Native home widgets carousel | Ignore on web; no functioning iOS widgets or teaser added. |
| 14a | Request a feature | Park pending feedback channel/content investigation. |
| 14b | Support email | Park pending real support address. |
| 14c | FAQ | Park pending content. |
| 14d | PDF export row | Park with 32. |
| 14e | Manual sync / last synced | Park; existing automatic account sync remains unchanged. No invented successful timestamp. |
| 14f | Community guidelines | Park presentation/content. |
| 14g | Terms / AGB | Park section presentation; reviewed legal terms remain a launch prerequisite. |
| 14h | Privacy / Datenschutz | Park section presentation; privacy/lawful basis/retention remain launch prerequisites. |
| 15 | Follow Us | Build Instagram and TikTok links supplied by Gordon; omit X without a supplied address. |
| 16 | Logout redesign | Ignore redesign; preserve sign-out and local clearing. |
| 17 | Delete account | Build verified account deletion, not local reset; owner data/photos/auth user, confirmation, failure handling and re-sign-in verification required. No GDPR-compliance certification without legal review. |
| 18 | Goal-weight summary | Implemented prominent real goal weight and „Zielgewicht ändern“; saving does not change current weight or targets. |
| 19a | Current weight | Implemented edit/upsert of today's local-date weigh-in (20–400 kg), preserving history and all nutrition targets. |
| 19b | Height | Implemented validated 100–250 cm editing with comma/dot drafts and selected-language display. |
| 19c | Birth date / age | Implemented real calendar-date validation and full-date editing; displayed age is derived, accepted ages 13–100, old missing birthdays are not guessed. |
| 19d | Gender | Implemented three existing gender choices with explicit save/cancel; targets remain unchanged. |
| 19e | Daily step goal | Implemented optional saved whole-number target (0–100.000, technical input guard, no chosen default), not measured steps or health connection. |
| 20 | System / Light / Dark appearance | Implemented. Existing light remains default; System follows the device; Dark uses contrast tokens. Welcome and nutrient/badge colours stay unchanged. |
| 21 | Badge celebrations switch | Implemented; off clears pending pop-ups while badges still unlock, count and sync. |
| 22 | Live Activities | Park for native iOS Lock Screen / Dynamic Island. |
| 23 | Add burned calories switch | Implemented preference editing only; native verified activity credit remains deferred. |
| 24 | Rollover switch | Implemented saved-wish editing; carryover up to 200 kcal remains native/deferred and current budgets are unchanged. |
| 25 | Auto-adjust macros | Superseded by Gordon’s linked-edit choice (22 Oct 2026, 21:27 UTC): calorie edits always scale all macros; macro edits recalculate calorie totals and leave the other two macros fixed. Legacy saved preference is retained for compatibility but no longer controls manual edits; switch replaced by Nutrition Goals link. |
| 26 | Marketing emails | Implemented separate unchecked opt-in/withdrawal with timestamp; personalisation remains independent. No email delivery service is connected. |
| 27 | Four nutrition-goal cards | Implemented four vertical cards, real today-consumed/target rings, existing nutrient colours, pencil dialogs, comma/dot decimal input and explicit save/cancel. |
| 28 | Auto-generate goals | Existing explicit calculation retained; new goals page previews all four calculated targets and requires confirmation before replacing manual goals. |
| 29 | Weight-history header | Build latest weigh-in date, current weight and real change since baseline month. |
| 30 | Weigh-in/photo history | Build history presentation and photo association; retain existing edit/delete. Photo indicators require real saved photos (38). |
| 31 | Fixed log-weight action | Align sticky „Gewicht eintragen“ action and existing validation; no calorie-target changes. |
| 32 | PDF explainer / generator | Park including report contents, date-range selection and download; no report/workout placeholders claimed delivered. |
| 33 | Rollover pill on Heute | Align only after real carryover accounting (24); show actual credited amount, not a permanent +200 example. Native/deferred dependency. |
| 34 | Macro carousel reference | Keep approved Today rings/bars; do not replace with carousel. |
| 35 | Empty meal state | Modify Heute with relevant food illustration, friendly DE/EN empty-state copy and working meal-add action. |
| 36 | Estimated goal arrival | Build estimate on Progress from real weight/goal/selected pace; handle maintenance, goal reached and insufficient pace without a fake date or promise. |
| 37 | Weight interval table | Park 3/7/14/30/90/all-time comparisons; existing weight-chart periods remain. |
| 38 | Progress photos | Build private owner-only upload/view/delete and weight-history association; guest/offline handling, consent/retention and entitlement policy must be resolved before delivery. Existing meal photos are not a progress diary. |
| 39 | Weekly average calories | Implemented on `/fortschritt`: four local Monday–Sunday weeks, daily bars and logged-day average. Missing/future days excluded; signed corrections included once and negative daily totals clamp to zero; information dialog and empty state. |
| 40 | Expenditure interval table | Park until verified native HealthKit/Health Connect energy data. |
| 41 | BMI view | Implemented on `/fortschritt`: adult BMI/category, four-segment spectrum/indicator and non-diagnostic information dialog. Exact 18.5/25/30 boundaries; unsupported/minor profiles receive explanation, no adult category. |

### Upcoming build batches and acceptance checks
- [x] **Batch A — Personal details (3, 18, 19):** `/profil/daten`, prominent goal weight, five pencil-edit rows, save/cancel/invalid states and Profile back arrow. All six fields browser-saved and reload-checked, weight history upsert and unchanged calorie/macro goals tested. 54 tests pass; DE desktop and EN phone checked, no page errors; preview build clean. JSON schema preserves optional step goal and supports legacy missing birthdays; no migration or permission changes.
- [ ] **Batch A account verification:** real signed-in save/readback on another device remains unverified; external unmanaged Supabase does not provide an authenticated browser session for automated checks. Existing owner-only profile/weight sync is reused unchanged.
- [x] **Batch B — Preferences (4, 7, 20, 21, 23–26):** `/profil/einstellungen`; theme persistence/system response, celebration suppression with unlocks retained, independent consent withdrawal and health wishes with no connection/permission/web credit. 59 tests pass; DE desktop dark and EN phone light/dark checked, all switches reload, no page errors, preview build clean.
- [ ] **Batch B account verification:** signed-in cross-device readback of preferences/marketing consent remains unverified because this external Supabase project cannot provide an automated session.
- [x] **Batch C — Nutrition goals (8, 27; reuse 28, complete 25):** `/profil/ziele` built; all four manual saves, comma/dot input, invalid rejection, cancel/reload, automatic linked editing, confirmed recalculation and back navigation browser-checked; actual meal totals populate rings. English 390 px layout checked; 67 tests pass; preview build clean. Existing owner-only target sync reused; no migration.
- [ ] **Batch C account verification:** signed-in cross-device target readback remains unverified (external unmanaged Supabase).
- [ ] **Batch D — Weight history (11, 29–31):** real date/weight/change summary, add/edit/delete/reload and back navigation; associate photos only after 38.
- [x] **Batch E — Social links (15)** (built 23 Oct 2026: „Folge uns“ card in Profil with Instagram/TikTok opening in a new tab, noopener): Instagram `https://www.instagram.com/kalkumpel/` and TikTok `https://www.tiktok.com/@kalkumpel_ki`; verify safe external opening; no invented X link.
- [x] **Batch F — Account deletion (17)** (built 23 Oct 2026: signed-in „Konto löschen“ with confirm/cancel; server function verifies the caller's token, removes meal photos, entries, weights, water, badges, scan usage, referrals, profile and the auth user, then signs out, clears local data and returns to Welcome; failure shows a retry message and keeps the account. Hosted readback by Gordon still to verify): verified signed-in owner deletion, confirmation/cancel, retry/error handling, local cache clearing and hosted readback for data/photo/auth removal; legal review remains separate.
- [ ] **Batch G — Heute (35; dependency 33):** verify illustrated empty state opens Erfassen; do not render rollover credit until 24 has real native accounting.
- [x] **Batch H subset — 39/41:** weekly calories and adult informational BMI implemented; 82 tests pass (including 13 new insight tests; local DST week checked in Europe/Berlin); German desktop and English 390 px browser checks verified all four averages, info dialogs, empty/minor states, weight edit → BMI 25.0 to 30.0, reload and unchanged targets, with no page errors. Existing local/account data paths are reused; authenticated cross-device checks remain unverified (external unmanaged Supabase).
- [ ] **Batch H remainder — 36/38:** estimated goal arrival and private progress-photo lifecycle/history association remain upcoming.
- [ ] **Native dependency — 24/33 and 23:** verified energy/carryover accounting with 200 kcal maximum, local dates, no double-counting; web switches alone do not implement this.

### Documentation-only delivery and review
- [x] Recover Gordon's annotated source and preserve all 41 IDs/sub-items; reconcile keep/ignore/park/build decisions and record upcoming batches.
- [x] Update design, masterplan, implementation and flow documents with the same scope and safety boundaries; no application changes in this delivery.
- [x] Upload affected documents and roadmap to `bowerestates/Kalkumpel` main and verify exact remote-file matches (22 Oct 2026): all six files passed Git blob fingerprint and decoded-content comparisons in commit `6208a0739f1e85b253d7327f472861923c600d24`; completion record synchronized and checked again before delivery.

**How to check now:** Profil → Persönliche Daten; edit goal weight and each pencil row, save, reload and return using the back arrow. Check the current weight in Fortschritt and confirm calories/macros did not change. Enter an invalid weight/date/step count and verify rejection; cancel leaves data unchanged. Switch English and repeat. „Ziele neu berechnen“ in Profil remains explicit and becomes available when saved details produce a different target.

**How to check Preferences:** Profil → Einstellungen; choose Hell/Dunkel/System, toggle each switch, reload and return. Turn celebrations off and confirm earned badges still increase. Withdraw marketing and confirm recommendations remain unchanged.

**Next step:** Items 39/41 delivered first as requested; return to Batch D, Weight History (11/29–31). Batches A–C signed-in cross-device readback remain unverified; later features remain upcoming.

### Preferences delivery — 22 Oct 2026
- [x] Build and locally verify items 4, 7, 20, 21 and 23–26, with item 25 preference saved for Batch C.
- [x] Update affected product, design, implementation, flow and architecture documents; upload and verify exact GitHub matches in this delivery.

### Personal Details delivery — 22 Oct 2026
- [x] Build and locally verify items 3, 18 and 19a–19e; preserve consent, health wishes, existing answers, pace and nutrition targets.
- [x] Update affected masterplan/design/implementation/flow and architecture notes; onboarding order and other feature scope unchanged.
- [x] Upload Personal Details documentation and verify exact GitHub matches (22 Oct 2026): five product documents, roadmap and AGENTS.md passed fingerprint and decoded-content comparisons on Kalkumpel main (`21751b0f74ae215769d2dba12d1b3d2d1127344d`); completion records synchronized and verified again before delivery.

---

## Decisions (confirmed by Gordon, 09 Oct 2026)
- [x] Trial length: **3 days** free trial.
- [x] Prices: **5,99 € / week**, **11,99 € / month** or **34,99 € / year**; 3-day trial applies to all plans (updated 16 Oct 2026; weekly 5,99 €).
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
- [x] Logo: keep the approved scanner-plate logo permanently (Gordon, 11 Oct 2026) — no swap needed
- [x] Apply the approved black-Welcome / white-and-mint app theme; preserve existing macro colours (Design-guidelines §0).
- [x] Keep the approved original Plus Jakarta Sans font on Welcome; no replacement rounded wordmark.
- [x] Language-aware number & date formatting (`src/lib/format.ts`): German `dd.mm.yyyy`, `75,5 kg`, `2.150 kcal`; English switches automatically; weight input accepts comma or dot (11 Oct 2026)
- [x] Rollout completed (11 Oct 2026): Today calories/macros/streak, Progress weights/day labels, Capture/review values, onboarding result/pace/calendar widgets, Settings targets and annual EUR price all use selected-language helpers. Earlier partial audit is resolved.
- [x] Shared decimal drafts/parser support comma/dot weights, nutrition and portions; calendar-only dates retain their day; invalid edits preserve valid values. 11 regression tests pass and live guest DE/EN Today, Progress, Settings, price and comma/dot weight-save checks pass; latest preview build is clean. Phase 0 complete.

## Phase 1 – Onboarding (app-flow screens 00–29)
- [x] Welcome screen (00)
- [x] Prepare and visually inspect welcome-page logo preview: plate and green flame inside camera scan corners, white brand lettering, existing near-black palette.
- [x] Revise welcome preview with matching mint-to-emerald gradient flame and plate rings, black background, white lettering, and clearer spacing inside white camera scan corners (10 Oct 2026).
- [x] Refine preview with original Plus Jakarta Sans typography and original copy colour roles; remove two innermost plate rings. Approval received and applied; logo permanently retained on 11 Oct 2026.
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
- [x] Mirror the plan statement screen: "Das Abnehmen von X beginnt mit einem Plan!" — the amount is the gap between current and target weight in the unit chosen on the scales, and the wording adapts to the selected goal (Abnehmen / Gewicht halten / Muskeln aufbauen).
- [x] Mirror the pace screen: "Wie schnell möchtest Du Dein Ziel erreichen?" — slider with Entspannt / Empfohlen / Ehrgeizig, guided weekly amount from height, weight and goal, time-to-goal plus daily calorie goal; placed directly after the plan statement.
- [x] Reformat "Wie isst Du am liebsten?" to the new card design: mint line icons replace the emoji and a German subtitle sits under the heading.
- [x] Mirror the stay-on-track comparison screen: "Ein einfacherer Weg, dranzubleiben" with "Ohne Kalkumpel" and "Mit Kalkumpel" cards plus the caption "Kleine tägliche Schritte führen zu Fortschritt"; both cards show the same abstract person, the second wearing a medal around the neck.
- [x] Mirror screens IMG_3251–3255: obstacles, desired outcome, illustrative potential chart and thank-you. Single obstacle/outcome answers now persist in validated onboarding profile details (11 Oct 2026).
- [x] Mirror the community screen IMG_3261 (10 Oct 2026): „Werde Teil der Kalkumpel-Community“ with a crowd of 21 mint avatars in three rows (no „viele mehr“ pill). The reference's user counts, ratings and named reviews are deliberately **not** copied — no invented social proof.
- [x] **Onboarding pages complete (Gordon, 11 Oct 2026).** 23 base in-route screens plus up to four optional health-preparation pages and the separate account stage; full order and what is saved: `docs/Onboarding-progress.md`. Remaining reference refinements below are not implied complete.
- [x] Gender, age, height, weight, target weight, goal, activity, diet, pace
- [x] Pace slider with live time-to-goal and daily calories; obstacles, desired outcomes, potential chart, thank-you, setup progress and result screens.
- [x] Calculation loader + plan reveal with kcal & macro split
- [x] Feature highlights + review cards (condensed)
- [x] Paywall preview: selectable weekly 5,99 €, monthly 11,99 € and yearly 34,99 € plans, all with 3-day trial (updated 16 Oct 2026; weekly 5,99 €)
- [x] Onboarding unit toggles kg/lbs, cm/ft-in; stored measurements remain metric.
- [x] Save completed profile/targets and starting weight locally; account sync uploads guest profile/data on first sign-in.

### Onboarding placeholders to come back to
- [ ] Layout polish for the comparison screen (block sits small; card titles tight to the top; dark-card icon contrast moderate).
- [ ] Target-weight screen: reference-specific redesign (currently the shared weight scale).
- [ ] Remove emoji from pace/any remaining screens if found during the in-app review.
- [x] Save full birth date, workout frequency category, referral source, prior-app answer, single obstacle and desired outcome in owner-only profile details and sync them.
- [x] Save weekly pace amount and weight-unit choice to the account; height display-unit preference remains upcoming.
- [ ] Obstacles and desired outcomes as multi-select (currently one choice each).
- [ ] Keto and Intervallfasten diet options.
- [ ] Trainer question — only if Gordon wants it.
- [x] Rollover preference holder (future maximum 200 kcal); actual budget carryover remains upcoming.
- [ ] Notifications opt-in and referral code.
- [x] IMG_3266 account stage: white/mint German design, working email/password signup with confirmation state and existing-account link, before free/Premium choice. Google OAuth and an Apple placeholder added 19 Oct 2026; live Apple sign-in remains native iOS only.
- [x] Separate unchecked storage consent and optional recipe/workout personalisation consent; save version/latest timestamp and allow optional consent withdrawal in Profil. No advertising emails enabled.
- [ ] Legal review before launch: approved AGB/privacy notice, purpose and sensitive-data lawful basis, retention schedule, full storage-consent withdrawal, account deletion/export, and consent audit history. Draft screen wording is not legal certification.
- [ ] Edit pencils on the result screen (editing currently in Profil).
- [x] Optional burned-calorie / workout-sync / connection / rollover preference pages after Thanks (17 Oct 2026); actual native integrations remain Phase 11.

## Next focus – In-app logic review (starts after this save)
Go screen by screen through Heute, Erfassen, Fortschritt, Profil/Einstellungen and Paywall; confirm each visible element uses real app logic, and build anything missing at that time.
- [x] Heute — reviewed 11 Oct 2026: totals, rings, meal groups, delete and saved-meal edit use real store/sync logic; fixed "today" to use the local calendar day instead of UTC (meals logged after midnight in Germany were filed under the previous day). Weekly calendar strip and quick calorie correction built and verified 13 Oct 2026.
- [x] Erfassen (photo, barcode, manual, meal score) — reviewed 14 Oct 2026: all three paths save real entries via review/score step; fixed raw technical error text in photo/score failures (friendly DE/EN copy, expired sign-in message), barcode camera no longer restarts on re-render, sample food list labelled as estimates and scored as manual (not barcode) evidence. Remaining: photo-upload failure is silent (meal still saves without photo); real photo/barcode examples still unverified.
- [x] Fortschritt — reviewed 15 Oct 2026: streak, last-7-days bars, start/current/goal weights, chart and weigh-in all use real store/sync data (local calendar day). Fixed: invalid weights were silently ignored (now a friendly message), a negative quick correction could draw a broken bar (now clamped), and passing the goal weight showed "x kg noch" instead of "Ziel erreicht". Phase 6 follow-ups (weigh-in edit/delete, date-spaced chart) built 16 Oct 2026. Decision (16 Oct 2026, Gordon): a new weigh-in updates profile weight only and never changes the calorie goal; goals change only via "Ziele neu berechnen" in Profil.
- [x] Profil / Einstellungen — reviewed 16 Oct 2026: account, language, profile, subscription, consent withdrawal and reset use real store/sync data. Fixed: impossible values (e.g. age 0) could produce nonsense goals (now validated with a friendly message); Geschlecht and Ernährung affect the goal but were not editable (now editable); the goal box showed old goals while editing (now previews new goals); recalculate button active with no changes (now disabled until something changes).
- [ ] Paywall
- [x] Fortschritt 7-day chart (17 Oct 2026): each day shows its real phone date in a stacked ring (day number + weekday, today highlighted); bars and rings use the day-ring colours. New page "Ringfarben erklärt" (`/ringfarben`) linked from the chart: Grün ≤100 kcal over, Gelb 101–250, Rot >250, gestrichelt = nothing logged. Extended 17 Oct 2026: the guide now carries sample dates — a "Wo Du die Ringe siehst" card renders the current Mon–Sun week with real dates and ring colours (the person's own days once anything is logged, otherwise a target-relative sample week that always shows all four colours), with links to Heute and Fortschritt, and every colour row shows a matching date plus an example line such as "zum Beispiel 17.10.2026: 1.900 kcal". Updated 18 Oct 2026: the Heute week strip keeps its coloured day rings but no longer shows the "Ringfarben erklärt" link — the guide is reached from Fortschritt (and its own back/link buttons).
- [x] Upload tasks.md and Design-guidelines.md updates to GitHub and verify (17 Oct 2026): both uploaded to bowerestates/Kalkumpel main (commits 8ad19ce, ed7b90d) and confirmed as exact Git blob matches.

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
- [x] Google OAuth wired on `/konto` and `/auth` with a same-origin public return and a disabled native Apple placeholder (19 Oct 2026).
- [x] Activate Google in Gordon’s Supabase/Google Cloud settings (Testing mode) and verify real Google sign-in — confirmed by Gordon 21 Oct 2026; Apple OAuth remains native-only.
- [ ] Google OAuth production (upcoming): publish legal privacy policy + terms URLs, add support email/logo/authorised domain, switch the Google Cloud consent screen from "Testing" to "In production", complete Google brand verification, then re-test with a non-test Google account.
- [ ] Android (upcoming, native build): create an Android OAuth client in Google Cloud (package name + SHA-1 signing fingerprint) and register its client ID in Supabase's Google provider.
- [ ] iOS (upcoming, native build): add an iOS OAuth client for Google; configure Sign in with Apple (Apple Developer Services ID, key, Bundle ID) in Supabase Auth — mandatory on the App Store when Google sign-in is offered.

## Phase 3 – Core App: Dashboard & Logging
- [x] Dashboard: remaining / eaten kcal, rings for kcal, Eiweiß, Kohlenhydrate, Fett
- [x] Daily log grouped by Frühstück, Mittagessen, Abendessen, Snacks
- [x] Manual entry
- [x] Delete entries
- [x] Weekly calendar strip with coloured day rings (Grün / Gelb / Rot / Grau rules) — `src/components/week-strip.tsx`, `src/lib/day-ring.ts`; guest-verified 13 Oct 2026
- [x] Meal detail & edit screen (`/mahlzeit/$id`): opened from Heute meal names; shows meal type and date, edits name/ingredients/portion/nutrients, keeps saved score read-only until edits or explicit reassessment, deletes the meal, and shows a friendly message for unknown meals (browser-verified 14.10.2026)
- [x] Quick calorie correction — "Schnell korrigieren" card on Heute with +/- and kcal input, one correction per day, synced via `entries.is_correction`; guest-verified 13 Oct 2026

## Phase 4 – AI Photo Scanner
- [x] Photo upload UI + "analysing" state (photo shrunk to max 1024 px before sending)
- [x] Real AI meal analysis via Lovable AI (structured JSON: items, grams, kcal, macros, confidence)
  - [x] **Current configured model: OpenAI `openai/gpt-6-luna`** via Lovable AI Gateway. This records the code checkpoint, not verified cheapest pricing, model availability or a zero-retention guarantee; provider access/privacy claims need separate verification.
    Model is one constant (`AI_VISION_MODEL`) so switching to Claude etc. later is a one-line change.
- [x] Meal photos saved to the private `meal-photos` storage (signed-in users only) and linked to the entry
- [x] Review screen: edit ingredients, portion slider / grams, add forgotten sides
- [x] Scan tips screen — built 21 Oct 2026 as the 4-step „So funktioniert's“ guide on Heute (best scan, AI analysis, adjust results, barcode/label/manual for accuracy; final „Jetzt scannen“ opens Erfassen). Opens automatically on the first Heute visit after onboarding, then via its own button. Step-1 photo matches the onboarding gender: sporty woman, fit gym man, or both together for divers.
- [x] Guide button placement (22 Oct 2026): the „So funktioniert's“ trigger is no longer a floating badge — it is a full-width card-style button placed directly above the „Schnell korrigieren“ card on Heute, sharing that card's exact width and left edge (verified byte-aligned at preview and 390 px phone widths).
- [x] Daily quota 3/day free: signed-in users counted server-side (`meal_analysis_usage`), guests counted in browser storage; friendly "aufgebraucht" card links to paywall
- [x] Pro scan quota — unlimited scans/day (confirmed 10 Oct 2026; enforced once Stripe/Pro roles exist — until then everyone gets 3/day)
- [ ] Ground AI results against BLS reference values

## Phase 5 – Barcode & Nutrition Data
- [~] General text product search uses a local sample catalogue; numeric barcode lookup uses live Open Food Facts. Comprehensive online food search remains upcoming.
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
- [x] Streak 24 h grace window (16 Oct 2026): one missed day between logged days is bridged (not counted); two missed days in a row end the streak; unlogged today never breaks it. Tests in src/test/progress-rules.test.ts.
- [x] Weight trend periods 7 / 14 / 30 / 90 days / Alles on Fortschritt (default 30); 3-day period dropped as too short for weight trends.
- [x] Weigh-ins editable and deletable in "Deine Einträge" list; profile weight follows the latest weigh-in, calorie goal never changes; edits/deletes sync to the account.
- [x] Weight chart spaces points by real calendar dates.
- [ ] Energy balance chart (burned vs. eaten)
- [ ] Private progress photo diary (Pro)
- [x] Badge system (approved by Gordon 16 Oct 2026, replaces earlier 12- and 36-badge proposals): 28 badges in 7 groups (Serien, Mahlzeiten, Kalorienziel, Wasser, Gewicht, Gewohnheiten & Spaß, Freunde), each group with its own accent colour; unlock pop-up queue; dedicated `/erfolge` page reached via one shield/count on Fortschritt (22 Oct 2026), with tap-for-details and progress. Logic in src/lib/badges.ts, tests in src/test/badges.test.ts. Omega Log, Time Traveler, Dumpster Diver, Sweat Equity, Speed Logger, Nut Case, Berry Suspicious dropped. Earned badges save locally and sync when signed in (see below).
- [x] Flame-shield emblem as the shared badge image (17 Oct 2026): flame in every badge, rings/flame tinted per group colour, locked = faded grey shield with lock.
- [x] Fortschritt streak icon (22 Oct 2026): original Kalkumpel flame silhouette in the existing red replaces the generic line flame; desktop/390 px appearance and badge/back navigation verified with no page errors and clean preview build. Shared branding unchanged; documentation uploaded and exact GitHub matches verified.
- [x] Water tracking widget on Heute (17 Oct 2026): personal target 35 ml per kg body weight, minimum 2,0 L, rounded to 50 ml; +250 ml / +500 ml / remove-a-glass buttons, progress bar and glass drops; a day counts once the target is reached and unlocks the 3 water badges (Gut versorgt, Im Fluss 3 days, Wasser-Champion 10 days in a row). Water syncs to the account (see below).
- [x] Account sync for water and badges (17 Oct 2026): water per day and earned badges save to the signed-in account and merge across devices (larger daily amount wins; earliest unlock date kept). Guests keep them on the device until sign-in. Needs a two-device signed-in check by Gordon (not testable from the agent sandbox).
- [x] Invite friends (17 Oct 2026): page „Freunde einladen“ (from Profil and the Freunde badge group) with a personal link `/?ref=<code>`, copy/share buttons and a joined-friends counter. A friend counts once, when they sign up or sign in after opening the link; self-invites are ignored; the referral is recorded server-side only. Unlocks Kumpel-Helfer (1), Kumpel-Team (3), Kumpel-Legende (10). Needs a signed-in two-account check by Gordon.
- [x] Badge hover explanations (19 Oct 2026, retained on `/erfolge` 22 Oct 2026): hovering or keyboard-focusing a badge shows its name and explanation; tapping opens the existing details pop-up.
- [x] Compact Fortschritt summaries (22 Oct 2026): smaller „Tage in Folge“ beside one flame-shield icon and real earned count; opens all 28 achievable badges on `/erfolge`, earned or locked, with explanations above each badge and a back arrow. No earned-only filter. Existing seven-day bars/rings, unlock rules and sync unchanged.
- [x] Compact water tab + detailed water page (22 Oct 2026): Heute replaces the inline water card with a compact „Wasserkonsum“ tab (droplet, progress bar, today/goal, chevron) that opens `/wasser`; the detailed page shows the big blue ring, glass drops, goal explanation, −/+250/+500/+1.000 ml buttons, „Letzte 7 Tage“ with real local dates and „Heute“ highlighted, and a back arrow to Heute. Same 35 ml/kg, min. 2 L target, store shape and water-badge unlock rules; account sync unchanged. Verified in the browser (tab → detail → +500 ml → back) with no console errors; typecheck clean and all 47 tests pass.
- [x] All-badges clarification verified (22 Oct 2026): the single icon immediately opens all 28 achievable badges, earned or locked; hover explanation, tap details, back arrow and 390 px layout pass with no page errors. All 12 badge tests pass and preview build is clean. Documentation synchronized and verified against Kalkumpel main.
- [x] Verify compact Fortschritt (22 Oct 2026): empty and saved-earned views, badge icon/count, hover/focus explanations, detail pop-up and back arrow pass in the browser; 390 px layout has no horizontal overflow or page errors; 18 badge/streak regression tests pass and preview build is clean.
- [x] Documentation delivery (22 Oct 2026): affected design, flow, implementation, masterplan, tasks and architecture notes uploaded to Kalkumpel main and verified against exact remote Git blob fingerprints.
- [x] Hydration fix for clock-dependent screens (19 Oct 2026): the dated week rings (Heute, Fortschritt, Ringfarben erklärt) and the Heute date heading read the device clock at render; when the server's UTC date differed from the user's local date (e.g. after 18:00 in Chicago), React's hydration threw and the page froze (no taps, no hover). All four spots now render a stable placeholder until mounted (useMounted in src/lib/utils.ts) and fill in with the device's own date, so the week always shows the user's local dates.

## Phase 7 – Settings & Profile
- [x] Language toggle (Deutsch default / English)
- [x] Edit profile + recalculate targets
- [x] Reset all data
- [ ] Units metric / imperial
- [x] Meal-reminder preferences (17 Oct 2026): `/erinnerungen` from Profil, independent time inputs and switches for breakfast, lunch, snacks, dinner and end of day; defaults 08:30 / 12:30 / 16:00 / 19:00 / 21:00, all off. Saved immediately on this device, validated on reload; no account sync or web notification delivery.
- [x] Reminder verification: 4 new rule tests; full 36-test suite passes, preview build clean; browser verifies time/switch persistence after reload, DE/EN, navigation from Profil and mobile fit. Times display through selected-language formatting; browser time picker remains native.
- [x] Reminder time editability (23 Oct 2026): replaced invisible time-input overlays with visible native fields. Breakfast/lunch/snacks/dinner/end-of-day times are editable even with switches off; all five real UI edits persist after reload, 375 px fit checked, no page errors. Five reminder tests pass. Native field display follows browser locale; stored times remain HH:mm, device-only saving/native-only notification boundaries unchanged.
- [x] Upload and verify reminder editability documentation on Kalkumpel main (23 Oct 2026): all six affected files matched exact decoded remote contents, including this completion record.
- [x] Custom 24-hour time picker (23 Oct 2026, Gordon request): replaced the native `<input type="time">` on `/erinnerungen` with a Kalkumpel `TimePicker` popover — tapping the time pill opens hour (00–23) and minute (00–59) columns that auto-scroll to the stored value, always 24-hour (no AM/PM), with the selected value highlighted in solid emerald instead of system blue and a "Fertig" button to close. Values save on tap and persist after reload; the popup was browser-checked for open, pick, close and reload with no page errors, and 83 tests pass. Stored values remain HH:mm; switches, defaults and device-only saving/native-only notification boundaries unchanged.
- [x] Dropdown palette alignment (23 Oct 2026): the Settings goal/activity/diet option lists now use dedicated `--dropdown`/`--dropdown-item` mint tokens (soft-mint panel, lighter mint-white centred rows) with an emerald tint plus emerald label and check on the hovered, keyboard-focused or selected row, defined for light, dark and the welcome palette. `color-scheme` and `accent-color` keep browser date/time pickers and native form controls on the app palette instead of system white, and text selection uses the mint accent. Open lists verified in light and dark in the browser with no page errors; 83 tests pass and the preview build is clean. The browser's own active-segment highlight inside native time fields stays system-drawn and is not restyled.
- [ ] Native iOS/Android reminder delivery (Gordon deferred 17 Oct 2026): implement permission request, recurring local notifications in the device time zone, rescheduling after time/zone changes, disabling/cancellation, and tap-to-log; notification permission remains separate from saved preferences.
- [ ] AGB, Datenschutz, Konto löschen
- [x] Sync language to profile (`preferred_language`) through existing account sync; signed-in cross-device verification remains upcoming.

## Phase 8 – Subscriptions (Kumpel+)
- [~] Paywall screen (no real payment)
- [ ] Stripe checkout for weekly 5,99 €, monthly 11,99 € and yearly 34,99 €, each with a 3-day trial; server-verified entitlement. Premium button currently explains unavailability and never grants local paid status.
- [ ] Implement separate server-verified subscription roles/entitlements and mirror only verified access for display; editable profiles and local plan selection must not grant Pro. Accounts hold is lifted.
- [ ] Restore / manage subscription, terms links
- [ ] Pro features: unlimited scans/day (confirmed 10 Oct 2026), micronutrients (BLS), 30/90-day analytics, PDF/CSV export, macro cycling

## Phase 9 – Community (later)
- [ ] Community rules page (7 Regeln)

## Phase 10 – Polish & Launch
- [ ] Tests for nutrition math and streak logic
- [ ] End-to-end checks: onboarding, scan, barcode, offline
- [ ] Error tracking
- [ ] SEO / share images, publish

## Phase 11 – Native iOS / Android health integration (deferred)
> **Updated decision, Gordon, 17 Oct 2026:** the earlier no-web-placeholder rule is superseded. Four optional health preparation pages are implemented after Thanks, for Apple Health and Android Health Connect. All real OS permissions, health reads, calorie credits and carryover remain deferred.
- [x] Reference-inspired burned-calorie, workout-sync, connection-preparation and rollover holders in white/mint DE/EN; detected iOS/Android platform, selectable desktop preview, back navigation and a full-stage skip from every page.
- [x] Save versioned wishes within validated onboarding details through existing local/owner-only profile sync; `connectedPlatform` must remain null. No new tables or permissions.
- [x] Verification: all 41 regression tests pass; preview builds cleanly. Browser checks cover iPhone and Android through setup/result/account and saved preferences after reload, desktop platform switching, back navigation, No bypassing connection, and full-stage skip. Screens visually inspected; actual health reads and signed-in account sync remain unverified/deferred.
- [x] Documentation delivery: updated health order/design/architecture and task records; all nine docs plus AGENTS.md and roadmap.md uploaded and verified against fresh Kalkumpel main Git blob fingerprints in this delivery.
- [ ] Native HealthKit / Android Health Connect permission requests and workout/active-energy import, with OS availability checks, revocation and duplicate prevention.
- [ ] Add verified activity energy to daily budget and energy-balance chart without double-counting activity already used in target calculations.
- [ ] Execute optional rollover capped at 200 kcal with safe daily accounting; preference alone changes nothing in web.
- [ ] Signed-in cross-device health preference readback (external Supabase account verification unavailable here).

## Onboarding end screens
- [x] IMG_3266 save-progress Google/email account stage and disabled Apple placeholder added; account required when continuing into free or paid plan choice. Apple native iOS later.
- [x] Verified unchecked consent defaults, storage-gated email form and existing-account destination in the browser; routing/meal-score regression tests pass and preview builds cleanly.
- [ ] Verify real signup/email confirmation and profile details across devices with Gordon's external Supabase account; provider settings and delivery were not inspected or changed.
- [x] Setup progress screen (IMG_3264): "Wir richten alles für Dich ein" — % counter, mint progress bar, rotating status line, checklist (Kalorien, Kohlenhydrate, Protein, Fett); meal scores are calculated only after a meal is logged.
- [x] Plan result screen (IMG_3265): "Ziel: X kg abnehmen bis <Datum>", estimated progress curve, daily kcal + macros, "Los geht's!". Values come from calcTargets/paceGuide; saved to profile and synced to Supabase when signed in.
- [ ] Edit pencils on the result screen — tracked under "Onboarding placeholders".

## Meal-quality score (Gordon, 11 Oct 2026)
- [x] Define the requested score: per-meal “Mahlzeiten-Score” (1–10 or null), not a personal health score calculated during onboarding. Requirements recorded from Gordon's uploaded brief.
- [x] Document one versioned rubric: ingredient balance/variety, protein, plant foods and reliable fiber; sugar/saturated fat/salt only with evidence. Unknown nutrients remain unknown, calories alone do not lower the score, and confidence is independent. Evaluate snacks in context.
- [x] Reuse the current AI integration for photo, barcode and manual meals; validate score, confidence, short explanation, up to two positives, optional suggestion and rubric version.
- [x] Add compact review and saved-detail cards with German/English copy, estimated label, expandable explanation, optional balance suggestion and non-medical disclaimer. No unrelated redesign.
- [x] Persist score and supporting ingredient/nutrition information through the existing local store and user-owned Supabase entries. Reopening must not request AI again.
- [x] Mark scores outdated after relevant edits and recalculate; scoring failure must never block saving. Preserve server-only credentials and per-user access controls.
- [x] Remove the misleading onboarding health-score completion item: no meal exists to score during profile setup.
- [x] Verify unknown nutrients, independent confidence, reopening without AI, editing/recalculation, and failure-tolerant meal logging.

### Verification notes
- Live manual-entry scoring returned a validated German 8/10 result; ingredient edits produced a new assessment. Reopening made zero AI requests. Simulated connection failure still allowed meal logging.
- Schema and RLS linter: clean. Evidence/score sync mappings are implemented; authenticated cross-device verification remains upcoming (external Supabase sign-in not available to automated checks).
- [ ] Upcoming: signed-in cross-device score persistence check and real photo/barcode end-to-end checks with Gordon’s examples.

## Documentation delivery checkpoint — 11 Oct 2026
- [x] Reminder documentation checkpoint (17 Oct 2026): all nine docs, AGENTS.md and roadmap.md uploaded to Kalkumpel main and verified as exact Git blob matches; native notification delivery remains upcoming.
- [x] Harmonize `Design-guidelines.md`, `Implementation-plan.md`, `app-flow-pages-and-roles.md` and `Masterplan.md` with current web onboarding/account order, barcode scanning, approved permanent logo, configured OpenAI model, language-aware formatting status and remaining work.
- [x] Reconcile task claims: formatting rollout is partial, profile language sync is implemented, extra onboarding answers are saved, and paid access/native features are not delivered.
- [x] Record standing rule: update and save relevant documentation/task records, upload affected documents to `bowerestates/Kalkumpel` and verify exact remote matches with every agreed coding, behaviour or design delivery, without Gordon having to ask; report blockers and distinguish implementation from unverified checks and placeholders.
- [x] Finish Phase 0 locale rollout and regression checks (11 Oct 2026).
- [ ] Continue the agreed screen-by-screen in-app logic review, starting with Today.
- [x] Check GitHub synchronization (11 Oct 2026, 15:45 UTC): read `bowerestates/Kalkumpel` main using Gordon's GitHub API and compare Git blob fingerprints with saved project files. Verification completed; synchronization is **not complete**.
- [x] Upload latest documentation to GitHub and verify (11 Oct 2026): documentation commit `46ca996cea7eeb011e767f643706fdd1dbb427eb` saved all nine local `docs/*.md` files on `bowerestates/Kalkumpel` main, preserving unrelated repository files. A fresh GitHub read confirmed exact Git blob matches for `Design-guidelines.md`, `Implementation-plan.md`, `Masterplan.md`, `app-flow-pages-and-roles.md`, `Onboarding-progress.md`, `Meal-score-rubric.md`, `Provider-Recommendations.md`, `prompt.md` and `tasks.md`. This completion record is included in a follow-up documentation commit and checked again before reporting completion. Historical native reference files remain subordinate to the web contract; no app code changed or automatic Git sync claimed.

### Check this documentation update
Read the four documents' matching web-feature checkpoints and compare them with this task list. Confirm the same logo, 23 screens plus account stage, current model constant, 3/day Free quota, monthly/yearly prices with trial, locale rollout gaps and native/payment/legal deferrals. This documentation-only task does not change screens or deploy the app.

### Phase 0 locale completion delivery — 11 Oct 2026
- [x] Fix calendar-date TypeScript narrowing, add locale-aware EUR formatting and reusable DecimalInput, and wire remaining web displays/inputs; no account, AI, quota or payment logic changed.
- [x] Full suite: 11 tests passing; preview build clean; guest DE/EN browser display and weight-saving checks passed without page errors. Capture/review decimal behaviour has automated coverage; real photo/barcode and authenticated sync checks remain open above.
- [x] Upload these documentation updates to Kalkumpel main and verify all nine docs plus AGENTS.md and roadmap.md against remote Git blob fingerprints (Phase 0 completion delivery, 11 Oct 2026).

## Optional health onboarding — 17 Oct 2026

After „Danke für Dein Vertrauen!“ and before calculation setup, up to four optional pages appear: (1) burned-calorie preference, (2) sync workouts with Apple Health / Health Connect, (3) connection preparation, (4) rollover preference (future maximum 200 kcal). The original 20-step progress remains unchanged; the optional stage has its own four-segment progress. iPhone/iPad and Android are detected after hydration; desktop offers an explicit platform choice. Platform detection is presentation only, never proof that a native service exists.

Every page has „Überspringen“, which resets all optional wishes and goes directly to setup. „Nein“ declines the current preference; declining workout sync bypasses the connection page and opens rollover. Back returns through the optional pages or to Thanks. Preparing a connection saves only a request and shows that permissions/connection come later in the native app; no connected checkmark, OS permissions or fake success. Example workout/budget numbers and rollover visuals are labelled examples and never become meal/activity data.

On feature completion, `onboardingDetails.healthSetup` saves version, platform, addBurnedCalories, syncWorkouts, connectionRequested, connectedPlatform (always null), and rolloverCalories locally. Existing owner-only profile JSON sync carries these validated wishes when signed in; no migration is required. Native apps must request real consent separately. Targets and all current calorie calculations are unchanged. Real account cross-device readback remains unverified.

Testing: complete onboarding through Thanks, exercise Yes/No, switch Apple Health/Health Connect, prepare then continue, or skip any page; verify setup/result/account continue normally and saved wishes survive reload. Native integration is the next step, not delivered by these holders.


## Google account layout — 19 Oct 2026

Implemented: `/konto` and `/auth` show Apple (disabled, future iOS label), Google and email, preserving the white/mint design. On `/konto`, required storage consent gates Google/email and optional personalisation stays separate; choices are saved before leaving for Google. Google uses Gordon’s existing Supabase Auth, not a workspace Google connector. The callback is the same-origin public `/auth?oauth=google`, with `&next=paywall` for onboarding. The SDK establishes its session and `getUser()` validates it; onboarding returns to `/konto` to confirm consent before plan choice, while other accounts continue to Today or onboarding. No paid entitlement is granted and no second auth listener was added.

Upcoming setup: create a Web application OAuth client in Google Cloud; register the callback URL shown in Supabase’s Google provider panel, configure the email/profile/openid scopes and enable Google in Supabase with the client ID/secret. Allow the exact app return URLs for each origin in Supabase Authentication → URL Configuration. Test Google in the published app or preview opened in a new tab, not the editor frame. Real Google login/account sync requires that provider setup; Apple is not a working web sign-in method.


## Google account delivery — 19 Oct 2026
- [x] Add shared Apple (disabled native placeholder), Google and email choices to `/konto` and `/auth`; preserve storage-gated onboarding and independent optional consent.
- [x] Validate public same-origin Google returns and check public provider availability before redirecting, leaving email usable when Google is off.
- [x] Verification: 45 regression tests pass; browser checks consent gating, disabled Apple, real Google-unavailable feedback, email fallback, reset form and mobile fit with no page errors; preview build clean.
- [x] Hosted auth settings read successfully: email enabled, Google disabled. No provider configuration changed.
- [ ] Gordon: enable Google in Supabase with a Google Cloud Web OAuth client and allow the documented return URLs; then verify real Google sign-in/account readback in a new-tab preview or published app.
- [x] Reconcile and save account design/flow/masterplan/implementation/onboarding documentation; upload and verify all nine docs plus AGENTS.md and roadmap.md as exact GitHub matches in this delivery.


### Nutrition Goals delivery — 22 Oct 2026
- [x] Build items 8/27, reuse 28 and activate the saved item 25 opt-in for intentional calorie-target edits only.
- [x] Verify guest UI save/cancel/reload, real meal rings, comma/dot values, invalid rejection, ratio-preserving rebalance, confirmed recalculation and English phone fit; 67 tests pass with no browser page errors and a clean preview build.
- [x] Update affected design, masterplan, implementation, flow and architecture documents.
- [x] Upload updated documents to GitHub and verify exact remote-file matches; all seven affected files matched decoded remote contents on Kalkumpel main (22 Oct 2026).

**Validation:** technical input guards are 1,200–10,000 kcal and 0–2,500 g per macro; finite decimals, stored to two decimals. They are not personalised dietary advice. The calorie floor follows existing calculation behaviour; upper limits are technical safeguards, not user-selected recommendations. Rebalance preserves existing macro energy proportions using 4/4/9 kcal per gram and rounds to two decimals; if all macros are zero, reject rebalance rather than inventing shares. Calorie edits scale all three macros automatically; direct macro edits update calorie totals while leaving the other two macros unchanged. Weigh-ins and personal edits remain unchanged.

**How to test:** Profil → Ernährungsziele → pencil; edit each target, save and reload. Cancel an edit or enter invalid text and confirm saved values are unchanged. Deliberately edit calories, review the three automatically adjusted macros and save; edit a macro to see calories update while the other two macros remain fixed. „Ziele neu berechnen“ previews all four estimates and changes nothing until confirmed. Back arrow returns to Profil.

**Not verified:** authenticated cross-device target readback is unavailable for this external Supabase project. Existing owner-only target sync is reused unchanged.


## Linked manual nutrition edits — 22 Oct 2026
Gordon selected “Update calorie total”. Macro edits now recalculate calories using 4/4/9 kcal per gram, preserving the other two macro amounts. Calorie edits automatically scale all three macros proportionally, regardless of the legacy auto-adjust preference. This replaces the earlier opt-in-only behavior; the obsolete switch becomes a Nutrition Goals link, and existing stored preference data is not deleted. Drafts preview dependent values; Save commits all linked targets atomically. Invalid derived calories reject the entire edit. No automatic change on mount, preference loading, weighing or personal edits. Explicit full recalculation and owner-only sync are unchanged.

Verified: all four real UI edits, dependent previews, invalid rejection, cancel and reload; no browser page errors, 69 tests pass, preview build clean. Authenticated cross-device readback remains unverified. How to test: Ernährungsziele → edit Eiweiß/Fett/Kohlenhydrate and confirm calories update; edit Kalorien and confirm all three macros scale; save and reload. Next: Weight History (11/29–31).
- [x] Implement and verify linked manual nutrition target edits.
- [x] Update documentation and remove the obsolete manual-adjustment switch.
- [x] Upload and verify exact GitHub copies for linked manual nutrition edits; all seven affected documents matched remote decoded contents on Kalkumpel main.


## Progress insights delivery — items 39/41, 22 Oct 2026

- **Weekly calculation:** Local Monday–Sunday weeks; average over days with finite calorie entries only (including correction-only days). Signed corrections are included once, daily totals clamp at zero, missing/future days are excluded, and no data shows an unknown average rather than zero. Partly logged days may understate intake. Four selectors cover this week and the preceding three weeks; current targets colour rings only, not historical target evidence.
- **BMI calculation and presentation:** Read-only BMI uses current saved profile weight / height²; valid ranges reuse 20–400 kg and 100–250 cm. Adult age 18–100 is derived from a real birthday when available, otherwise stored age; invalid/minor profiles show an unavailable explanation with no adult category. Unrounded BMI determines <18.5 / 18.5–<25 / 25–<30 / ≥30 bands (blue/green/amber/red). Equal-width segments map 10/18.5/25/30/40 to 0/25/50/75/100%, clamping outside 10–40; outer limits are visual only, not eligibility/category boundaries. The information dialog explains formula, non-diagnostic limits, muscle mass/body build and pregnancy/breastfeeding applicability. No profile or nutrition-target writes.
- **Verification:** 82 tests pass (including 13 new insight tests; local DST week checked in Europe/Berlin); German desktop and English 390 px browser checks verified all four averages, info dialogs, empty/minor states, weight edit → BMI 25.0 to 30.0, reload and unchanged targets, with no page errors. Existing local/account data paths are reused; authenticated cross-device checks remain unverified (external unmanaged Supabase).
- **How to test:** Fortschritt → select each historical week, check dates/average and open its information icon. Check BMI and its information icon; edit weight under Profil → Persönliche Daten, return/reload, and confirm BMI changes but calorie/macronutrient targets do not. Switch English to verify numbers/dates.
- **Next:** Weight History (11/29–31); 36/38 remain upcoming. Documentation GitHub delivery is tracked in tasks/roadmap.
- [x] Upload items 39/41 documentation to GitHub and verify exact matching contents; all seven product/architecture/roadmap files verified, including the completion record.
