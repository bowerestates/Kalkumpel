-- Remove the anonymous email-existence RPC that enabled account enumeration.
drop function if exists public.account_exists(text);
