CREATE TABLE public.water_logs (
  user_id uuid NOT NULL,
  date date NOT NULL,
  ml integer NOT NULL DEFAULT 0,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now(),
  PRIMARY KEY (user_id, date)
);
GRANT SELECT, INSERT, UPDATE, DELETE ON public.water_logs TO authenticated;
GRANT ALL ON public.water_logs TO service_role;
ALTER TABLE public.water_logs ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Own water" ON public.water_logs FOR ALL TO authenticated USING (auth.uid() = user_id) WITH CHECK (auth.uid() = user_id);
CREATE TRIGGER water_logs_updated BEFORE UPDATE ON public.water_logs FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();

CREATE OR REPLACE FUNCTION public.validate_water_log() RETURNS trigger LANGUAGE plpgsql SET search_path = public AS $$
BEGIN IF NEW.ml < 0 OR NEW.ml > 10000 THEN RAISE EXCEPTION 'Invalid water amount'; END IF; RETURN NEW; END; $$;
CREATE TRIGGER water_logs_validate BEFORE INSERT OR UPDATE ON public.water_logs FOR EACH ROW EXECUTE FUNCTION public.validate_water_log();

CREATE TABLE public.user_badges (
  user_id uuid NOT NULL,
  badge_id text NOT NULL,
  earned_at timestamptz NOT NULL DEFAULT now(),
  created_at timestamptz NOT NULL DEFAULT now(),
  PRIMARY KEY (user_id, badge_id)
);
GRANT SELECT, INSERT ON public.user_badges TO authenticated;
GRANT ALL ON public.user_badges TO service_role;
ALTER TABLE public.user_badges ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Own badges read" ON public.user_badges FOR SELECT TO authenticated USING (auth.uid() = user_id);
CREATE POLICY "Own badges add" ON public.user_badges FOR INSERT TO authenticated WITH CHECK (auth.uid() = user_id AND length(badge_id) <= 40);

ALTER TABLE public.profiles ADD COLUMN invite_code text UNIQUE DEFAULT substr(replace(gen_random_uuid()::text, '-', ''), 1, 8);
UPDATE public.profiles SET invite_code = substr(replace(gen_random_uuid()::text, '-', ''), 1, 8) WHERE invite_code IS NULL;

CREATE TABLE public.referrals (
  invitee_id uuid PRIMARY KEY,
  inviter_id uuid NOT NULL,
  created_at timestamptz NOT NULL DEFAULT now()
);
CREATE INDEX referrals_inviter_idx ON public.referrals (inviter_id);
GRANT SELECT ON public.referrals TO authenticated;
GRANT ALL ON public.referrals TO service_role;
ALTER TABLE public.referrals ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Inviter reads own referrals" ON public.referrals FOR SELECT TO authenticated USING (auth.uid() = inviter_id);

CREATE OR REPLACE FUNCTION public.redeem_invite(_code text) RETURNS boolean
LANGUAGE plpgsql SECURITY DEFINER SET search_path = public AS $$
DECLARE _inviter uuid; _me uuid := auth.uid();
BEGIN
  IF _me IS NULL THEN RETURN false; END IF;
  SELECT id INTO _inviter FROM public.profiles WHERE invite_code = lower(trim(_code));
  IF _inviter IS NULL OR _inviter = _me THEN RETURN false; END IF;
  INSERT INTO public.referrals (invitee_id, inviter_id) VALUES (_me, _inviter) ON CONFLICT DO NOTHING;
  RETURN FOUND;
END; $$;
REVOKE ALL ON FUNCTION public.redeem_invite(text) FROM public, anon;
GRANT EXECUTE ON FUNCTION public.redeem_invite(text) TO authenticated;