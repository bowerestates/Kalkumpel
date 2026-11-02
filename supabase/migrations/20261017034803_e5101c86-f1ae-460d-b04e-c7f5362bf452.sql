DROP FUNCTION public.redeem_invite(text);
CREATE OR REPLACE FUNCTION public.redeem_invite(_code text, _invitee uuid) RETURNS boolean
LANGUAGE plpgsql SECURITY DEFINER SET search_path = public AS $$
DECLARE _inviter uuid;
BEGIN
  SELECT id INTO _inviter FROM public.profiles WHERE invite_code = lower(trim(_code));
  IF _inviter IS NULL OR _inviter = _invitee THEN RETURN false; END IF;
  INSERT INTO public.referrals (invitee_id, inviter_id) VALUES (_invitee, _inviter) ON CONFLICT DO NOTHING;
  RETURN FOUND;
END; $$;
REVOKE ALL ON FUNCTION public.redeem_invite(text, uuid) FROM public, anon, authenticated;
GRANT EXECUTE ON FUNCTION public.redeem_invite(text, uuid) TO service_role;