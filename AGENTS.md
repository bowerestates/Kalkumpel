<!-- LOVABLE:BEGIN -->
> [!IMPORTANT]
> This project is connected to [Lovable](https://lovable.dev). Avoid rewriting
> published git history — force pushing, or rebasing/amending/squashing commits
> that are already pushed — as it rewrites history on Lovable's side and the
> user will likely lose their project history.
>
> Commits you push to the connected branch sync back to Lovable and show up in
> the editor, so keep the branch in a working state.
<!-- LOVABLE:END -->

- App state lives in the localStorage store (src/lib/store.ts) and src/lib/sync.ts mirrors it to the user's Supabase tables when signed in (guest data uploaded on first sign-in, local data cleared on sign-out); why: works offline and for guests while accounts keep data across devices.
- Onboarding completion opens the public account stage before plan selection; validated onboarding answers and explicit consent choices sync within the owner-only profile, never as subscription entitlements; why: accounts preserve plans without granting paid access or assuming marketing permission.
- Scan counts (meal_analysis_usage) are read-only to users and must only be written server-side; why: prevents users bypassing the daily quota.
- All UI copy goes through the de/en dictionaries in src/lib/i18n.ts (German default); why: language toggle in settings.
- Render numeric/date/currency values through src/lib/format.ts and use DecimalInput for controlled numeric drafts, leaving stored values numeric and calendar keys unchanged; why: selected-language display stays consistent and comma/dot input never corrupts evidence or calculations.
- Gate anything that reads the device clock, time zone or browser storage behind `useMounted()` (src/lib/utils.ts) so server-rendered markup and hydration agree; why: the server runs UTC and the user's device does not — unguarded dates broke interactivity when the local day differed from the UTC day.
- AI meal analysis runs server-side via src/lib/meal-ai.server.ts (single AI_VISION_MODEL constant) called from analyzeMeal in meal-ai.functions.ts; why: model can be swapped in one place and the API key/quota writes stay on the server.
- Welcome branding uses a dedicated image and page-scoped surface token rather than changing the shared Logo or background; why: approved welcome revisions must not alter the rest of the app.
- Meal scoring uses the existing server-side model and a shared versioned rubric; evidence and validated results are stored with each entry, and saved-meal views never call AI until edits or an explicit reassessment because reopening must be free and offline-safe.
- Treat docs/Masterplan.md as the current web product contract and docs/tasks.md as the delivery/verification ledger; update affected design, flow and implementation documents, upload them to the documented GitHub repository and verify exact remote-file matches in the same delivery as agreed changes without a separate user request; keep historical native proposals subordinate and report blocked delivery, because documentation must accurately track the running app locally and remotely.

- Invite referrals are written only by a server function (service role, caller verified from their token) via redeem_invite; users can read referrals they made but never write them; why: prevents faking friend badges.
- Meal-reminder preferences use a validated local-store record of independent wall-clock times and switches, not timestamps or notification scheduling; why: native scheduling can adopt them later without claiming web delivery or account sync.
- Optional health onboarding uses a validated versioned record within onboarding details and an isolated stage before calculation; connection requests are not permissions or connected status, and no preferences affect web targets, because native OS authorization and energy accounting must be implemented separately.
- Account providers share one UI and Google uses the existing Supabase client with a public same-origin `/auth` return; onboarding returns through `/konto` to confirm consent before plan selection, because OAuth must not bypass explicit consent or grant paid access.
- Progress uses a compact BadgeSummary link to `/erfolge`, which reuses unfiltered BadgeGrid for all badges and explanations; why: keeps the main progress page concise while making every achievable badge visible without changing unlock/sync behavior.
- Personal Details uses `personalDetailsPatch` to validate one field and preserve nutrition targets; birth date and optional step goal live in validated onboarding-details JSON, and current weight upserts the local-day history record; why: one owner-profile sync path avoids duplicate fields, invented birthdays and automatic goal recalculation.
- Preferences use validated onboarding-details JSON and the existing owner-profile sync; appearance is applied after mounting and celebration suppression never changes badge earning, while independent marketing consent uses data-consent JSON, because existing storage paths preserve legacy profiles without granting permissions or entitlements.
- Nutrition Goals uses a pure linked-target validator and existing target sync; all intentional manual edits preview dependent values and save atomically, while full profile recalculation requires confirmation, because target editing must not change profile or weigh-in behavior.
- Progress insights are read-only derivations in progress-insights.ts from the existing meal/profile store, with explicit local-calendar week rules and adult BMI eligibility; why: historical summaries remain offline-safe and never change nutrition targets or create health/entitlement records.
- Weight History uses pure weight-history derivations/patches and existing weight sync; why: latest-weight edits and deletions preserve nutrition targets, with no duplicate records or photo claims.
- Progress Photos preview uses labelled generated samples and component-local state only; why: screen review must not upload personal images, persist consent or grant Pro before verified entitlements exist.
