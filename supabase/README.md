# Kalkumpel Supabase source checkpoint — 2 November 2026

This folder contains the current web project's `config.toml` and ten saved October 2026 migrations, copied unchanged from the Lovable project. The configuration identifies Gordon's connected Supabase project; it is not an export of the project's hosted settings.

## Migration histories

The GitHub repository also contains historical June/July migrations and an older October migration from the native proposal. Those files are preserved for history, not validated as a single executable chain with the current web migrations. **Do not run the combined folder against a new or existing database without first reconciling the histories.** The two histories may create overlapping tables, functions and policies.

Read-only reconciliation now confirms that production's migration ledger contains only the ten current October web migrations. Use only that candidate chain in a separate empty development target, with explicit bucket/Auth provisioning and validation. See [the reconciliation and rebuild runbook](../docs/Supabase-rebuild.md) for conflicts, live grant differences and untested acceptance checks; no production rebuild has been performed.

Uploading these files does not apply migrations or alter the live database. These source files are not a complete database backup: they do not include user records, photo objects, hosted authentication settings, secrets, or all storage-bucket provisioning. A clean restore has not been tested.

## Function locations

The current web application uses TanStack Start server functions under `src/lib/`, including `meal-ai.functions.ts`, `food-data.functions.ts`, `invite.functions.ts` and `account.functions.ts`, with server-only helpers such as `meal-ai.server.ts`.

The GitHub repository's `supabase/functions/analyze-meal/index.ts` belongs to the historical native/Edge Function implementation. It is preserved unchanged and is not the current web meal-analysis implementation. This checkpoint does not upload the web application's source or deploy any function.

## Security

Only configuration, SQL source and this explanation are included. No `.env` files, API keys, service-role credentials, access tokens, user-data dumps or private photos belong in this upload.