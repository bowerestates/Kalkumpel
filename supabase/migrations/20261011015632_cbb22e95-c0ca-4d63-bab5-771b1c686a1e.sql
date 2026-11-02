ALTER TABLE public.profiles ADD COLUMN onboarding_details jsonb NOT NULL DEFAULT '{}'::jsonb, ADD COLUMN data_consent jsonb NOT NULL DEFAULT '{}'::jsonb;
CREATE OR REPLACE FUNCTION public.validate_profile_details() RETURNS trigger LANGUAGE plpgsql SET search_path = public AS $$
BEGIN
 IF jsonb_typeof(NEW.onboarding_details) <> 'object' OR octet_length(NEW.onboarding_details::text) > 4096 THEN RAISE EXCEPTION 'Invalid onboarding details'; END IF;
 IF jsonb_typeof(NEW.data_consent) <> 'object' OR octet_length(NEW.data_consent::text) > 2048 THEN RAISE EXCEPTION 'Invalid consent details'; END IF;
 RETURN NEW;
END; $$;
CREATE TRIGGER profiles_validate_details BEFORE INSERT OR UPDATE ON public.profiles FOR EACH ROW EXECUTE FUNCTION public.validate_profile_details();