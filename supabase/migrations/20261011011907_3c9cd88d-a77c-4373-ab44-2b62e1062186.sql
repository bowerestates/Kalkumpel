ALTER TABLE public.entries ADD COLUMN IF NOT EXISTS meal_evidence jsonb, ADD COLUMN IF NOT EXISTS meal_score jsonb;
CREATE TABLE public.meal_ai_access_state (model text PRIMARY KEY, status integer NOT NULL, message text NOT NULL, created_at timestamptz NOT NULL DEFAULT now(), updated_at timestamptz NOT NULL DEFAULT now());
GRANT ALL ON public.meal_ai_access_state TO service_role;
ALTER TABLE public.meal_ai_access_state ENABLE ROW LEVEL SECURITY;
CREATE TRIGGER meal_ai_access_state_updated BEFORE UPDATE ON public.meal_ai_access_state FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();