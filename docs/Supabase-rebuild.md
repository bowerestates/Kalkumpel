# Supabase reconciliation and isolated rebuild — 3 November 2026

## Decision and safety boundary

Use a **new, separate development Supabase project**, with new credentials and synthetic test users/data. Do not rebuild the connected production project (`ujsnkoklseseposwfibz`). Do not change this application's connection while testing. No production data, schema, migration ledger, buckets or functions were changed during this investigation; only metadata was read.

This is a reconciled source assessment and rebuild runbook, not an executed or validated restore. Existing migration files remain unchanged. A separate development target has not been supplied or provisioned.

## Authoritative history

The production migration ledger was read directly on 3 November 2026. It contains **exactly the ten current October migrations**, and none of the eight historical June/July/early-October files that also exist on GitHub:

`20261009220653`, `20261009220730`, `20261011011907`, `20261011011937`, `20261011015632`, `20261011163436`, `20261017034637`, `20261017034803`, `20261026135734`, `20261026144308`.

Use that ten-file chain as the candidate current-web rebuild history, in chronological order, **in a clean isolated workspace containing only those migrations**. Do not run the repository's combined folder. Do not mark historical files as applied or use migration repair on production to hide the mismatch. Preserve historical source for reference; exclusion from the rebuild is not deletion from repository history.

## Reconciliation findings

| Area | Historical definition | Current production / October chain | Rebuild decision |
|---|---|---|---|
| Profiles | `sex`, `height_cm`, `weight_kg`, `goal_calories`, `goal_protein`, `goal_carbs`, `goal_fat`, `units` | `gender`, `height`, `weight`, `target_weight`, `kcal_target`, three macro targets, `name`, `diet`, `pace`, language, onboarding/consent JSON and invite code | Use current names/types/defaults; do not replay the old create-table statement. |
| Meals | Text `id`, `date_key`, `ts`, integer `calories`, `photo_uri`, `items` | UUID `id`, SQL `date`, `meal`, numeric `kcal`/macros, `photo_path`, barcode, evidence/score JSON, correction flag, update timestamp | No direct schema compatibility; this task does not transform old user records. |
| Weights | `(user_id,date_key)` primary key; text ID and timestamp | UUID primary key and unique `(user_id,date)`, SQL date and audit timestamps | Use current chain; old key/index definitions are not interchangeable. |
| Scan usage | `date_key`, auth-user foreign key and `bump_meal_analysis(uuid,int)` RPC | SQL `date`, read-only owner policy, server writes, audit trigger; no bump RPC exists | Do not deploy the old Edge Function, which calls the missing RPC. |
| Account deletion | `delete_user()` deletes auth row and relies on cascades | Most current child tables have plain user UUIDs, not auth foreign keys; server account function handles explicit cleanup | Do not restore the old RPC; it would not provide current complete data/photo cleanup. |
| Email lookup | `account_auth_status` / `account_exists`, later dropped | Neither function exists; anonymous-only identity | Keep both absent; restoring intermediate history recreates unwanted email-enumeration functionality. |
| New features | No current water/badges/referrals/entitlements/progress-photo tables | All present in current chain | Preserve October additions and server-only referral/entitlement writes. |
| Numeric checks | Old CHECK constraints use `calories`, `height_cm`, `weight_kg`, `goal_*` and old ranges | Those checks are not present in live production; current water and JSON validation are triggers; 18+ editing rule is application-side | Do not silently import old rules; any added database validations are a separate reviewed change using current fields and triggers, including signed calorie corrections. |
| Storage | Old SQL creates bucket and later limits meals to JPEG | Both live buckets private, 10,485,760-byte limits, no MIME allowlist | Provision current settings separately through Storage configuration/API; do not replay old bucket SQL or silently narrow accepted uploads. |
| Configuration | Old local project name, seed settings and anonymous sign-ins disabled | Current config contains only the connected project ID | Old config is not authoritative. A new hosted project needs separate Auth/Storage/server configuration. |

Shared `CREATE TABLE` statements, the `on_auth_user_created` trigger and overlapping policies make the combined history unsuitable for replay. `IF NOT EXISTS` alone would not fix incompatible columns, keys or semantics.

## Live metadata findings beyond migration text

- **10 public tables, 6 public functions.** The catalog inspection covered columns, defaults, primary/unique/foreign keys, indexes, user-defined triggers, policies, function definitions and effective permissions.
- **RLS is enabled on all ten tables.** There are 17 public policies and 6 Storage policies. These reflect owner isolation, read-only usage/entitlements, server-written referrals and Pro-gated photo uploads. Tables without owner-delete policies must not gain them during reconstruction.
- **Table grants differ:** production currently reports SELECT/INSERT/UPDATE/DELETE privileges for `anon`, `authenticated` and `service_role` on all ten tables. RLS still limits ordinary access; these grants alone do not establish a data leak. The October migrations explicitly grant narrower privileges. A replay can preserve intended policy behaviour without being an exact ACL clone. Record and test this difference; do not widen grants automatically just to match production.
- Function execution restrictions match the current intended chain: `redeem_invite(text,uuid)` and `handle_new_user()` are not callable by `anon`/`authenticated`; `has_pro(uuid)` is callable by `authenticated` and `service_role`, not `anon`. Other public functions are trigger functions. Preserve security-definer search paths and execution restrictions.
- `profiles.id` is the only public foreign key into `auth.users`, with cascade deletion. Current plain UUID child ownership means explicit server cleanup remains necessary.
- Both buckets are private, have a **10 MiB** file-size limit, and have **no MIME allowlist**. Their provisioning is missing from the ten-file migration chain.
- Hosted anonymous-auth settings, redirect/domain/CAPTCHA settings, project extensions/global default privileges, schedules/webhooks and environment-secret configuration were **not fully exported or verified** by these metadata reads. Do not call this a complete production backup.

## Safest rebuild sequence

### Separate hardening issues found during source review

`src/lib/meal-ai.functions.ts` accepts a nullable analysis token; a missing token skips the server quota checks. Its count read and later upsert are separate operations, so concurrent analyses can pass the same quota check; database errors at these calls are not checked. `scoreMeal` also invokes paid scoring without session verification in that handler. These are source-confirmed risks, not tested exploits or live traffic findings. Rebuilding the schema alone will not fix them. Keep external AI disabled in the isolated environment until verified-caller handling and atomic quota accounting are reviewed and tested as a separate implementation task. No server code or production security rules were changed in this assessment.

1. **Create the isolated target.** Name it clearly as development. Keep its project reference and all credentials separate. A new hosted project may incur Supabase charges; check the plan first. Do not relink the running Kalkumpel project or deploy a production switch.
2. **Prepare a clean test workspace.** Include only the ten ledger-matching migrations and required application source. Do not use the legacy Expo app or legacy `analyze-meal` Edge Function. Use a target-specific configuration; do not reuse production connection strings, service credentials, device sessions, user records or photos.
3. **Establish the target boundary before any write.** Verify the connection host/project reference belongs to the new project and explicitly reject the production reference. Apply only to the new target. Avoid commands that repair a ledger, reset a linked database or push to a remembered default target. A local reset is appropriate only in a confirmed disposable local Supabase stack.
4. **Apply the ten migrations chronologically through the approved migration workflow for the new target.** Let Supabase supply its managed `auth` and `storage` schemas. Recreate only application-owned public objects, the application signup trigger on `auth.users`, and required `storage.objects` policies. Never replace managed schemas wholesale. Existing migration files must not be edited to accommodate production.
5. **Provision service settings separately.** Create private `meal-photos` and `progress-photos` buckets, each with the measured 10 MiB limit and no MIME allowlist. Enable anonymous sign-ins in the development Auth settings. Record target API/domain and relevant settings; use test-only secrets for server features. Schema-only rebuilding does not clone Auth users, Storage objects, keys or external AI/payment setup.
6. **Compare structure before using the app.** Confirm ten tables, six functions, the expected keys/indexes/triggers, all RLS flags, all 23 policies and function execution restrictions. Document the intentional narrower table-grant result of the replay. Review global privileges/extensions separately rather than assuming the local environment matches hosted production.
7. **Run isolated acceptance tests with synthetic accounts and records.** Only the development app may create/update/delete test data. Test both successful and denied operations through normal caller sessions, not just service-role access. No production users/data are required.
8. **Repeat from another empty disposable target.** A clean replay and hosted flow checks are needed before marking this reproducible. Keep evidence of the target reference, schema comparisons and outcomes. Production stays connected and unchanged throughout.

If an exact-current schema baseline is preferred instead of the migration chain, capture and review application-owned schema plus explicit grants, functions and policies as a **separate alternative baseline**, and apply it only to a new target. Never apply both that baseline and the ten historical creation migrations. A baseline also needs separate bucket/Auth provisioning and acceptance tests. No baseline SQL or schema dump was generated in this task.

## Acceptance checklist — not yet run

- Anonymous sign-in creates exactly one owner profile through the auth trigger; no email/password UI required.
- Synthetic device A saves/reads/edits its profile, meals, weights, water and badges; device B cannot access A's rows or private files.
- Ordinary caller attempts to write scan usage, entitlements or referrals fail. Referral redeem goes through the caller-verified server function; self-invites do not count.
- Without server-granted Pro, progress-photo insertion/upload fails; with development-only Pro it succeeds; expiration still allows owner view/delete. Weigh-in deletion unlinks photos without deleting them, and meal/weight targets stay unchanged.
- Anonymous callers cannot execute referral/Pro/helper operations beyond intended permissions; table grants and RLS are tested separately.
- Development account deletion removes owned rows/files and the auth identity through current server cleanup; no old deletion RPC is used.
- The birthday flow rejects under-18 dates and requires the 18+ confirmation. Current database metadata alone does not prove age enforcement.
- Scan quota, current AI server functions and offline/sync behaviour are checked against development configuration, including failure handling. Do not assume the old atomic quota RPC is part of the current implementation.
- Repeat clean replay succeeds; no production writes or production credential reuse occurred.

## What remains

Reconciliation is complete as an evidence-based assessment. Provisioning and applying/testing an isolated rebuild are upcoming: a separate development project and its test-only configuration are required. No production migration, ledger repair, data copy or connection switch is authorized by this runbook.

## Official references

- Supabase local workflow: https://supabase.com/docs/guides/local-development/cli-workflows
- Backup/restore boundaries: https://supabase.com/docs/guides/platform/migrating-within-supabase/backup-restore
- New-project restore and service-setting caveats: https://supabase.com/docs/guides/platform/clone-project
- Migration repair changes history, not schema: https://supabase.com/docs/reference/cli/supabase-migration-repair
- Diff limitations: https://supabase.com/docs/guides/local-development/diff-engines

These references are guidance, not instructions to execute a production dump, reset, migration repair or restore in this environment.