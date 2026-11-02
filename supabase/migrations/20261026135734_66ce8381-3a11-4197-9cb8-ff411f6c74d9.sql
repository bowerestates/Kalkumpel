CREATE TABLE public.user_entitlements (
  user_id uuid PRIMARY KEY,
  pro_until timestamptz,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now()
);
GRANT SELECT ON public.user_entitlements TO authenticated;
GRANT ALL ON public.user_entitlements TO service_role;
ALTER TABLE public.user_entitlements ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Own entitlement read" ON public.user_entitlements FOR SELECT TO authenticated USING (auth.uid() = user_id);
CREATE TRIGGER user_entitlements_updated BEFORE UPDATE ON public.user_entitlements FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();

CREATE OR REPLACE FUNCTION public.has_pro(_user_id uuid)
RETURNS boolean LANGUAGE sql STABLE SECURITY DEFINER SET search_path = public AS $$
  SELECT EXISTS (SELECT 1 FROM public.user_entitlements WHERE user_id = _user_id AND pro_until > now())
$$;

CREATE TABLE public.progress_photos (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid NOT NULL,
  path text NOT NULL,
  photo_date date NOT NULL,
  weight_date date,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now()
);
CREATE INDEX progress_photos_user_idx ON public.progress_photos(user_id, photo_date DESC);
GRANT SELECT, INSERT, UPDATE, DELETE ON public.progress_photos TO authenticated;
GRANT ALL ON public.progress_photos TO service_role;
ALTER TABLE public.progress_photos ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Own progress photos read" ON public.progress_photos FOR SELECT TO authenticated USING (auth.uid() = user_id);
CREATE POLICY "Own progress photos delete" ON public.progress_photos FOR DELETE TO authenticated USING (auth.uid() = user_id);
CREATE POLICY "Own progress photos update" ON public.progress_photos FOR UPDATE TO authenticated USING (auth.uid() = user_id) WITH CHECK (auth.uid() = user_id);
CREATE POLICY "Pro adds progress photos" ON public.progress_photos FOR INSERT TO authenticated
  WITH CHECK (auth.uid() = user_id AND public.has_pro(auth.uid()) AND path LIKE auth.uid()::text || '/%');
CREATE TRIGGER progress_photos_updated BEFORE UPDATE ON public.progress_photos FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();

CREATE POLICY "Own progress photo files read" ON storage.objects FOR SELECT TO authenticated
  USING (bucket_id = 'progress-photos' AND (storage.foldername(name))[1] = auth.uid()::text);
CREATE POLICY "Own progress photo files delete" ON storage.objects FOR DELETE TO authenticated
  USING (bucket_id = 'progress-photos' AND (storage.foldername(name))[1] = auth.uid()::text);
CREATE POLICY "Pro progress photo files upload" ON storage.objects FOR INSERT TO authenticated
  WITH CHECK (bucket_id = 'progress-photos' AND (storage.foldername(name))[1] = auth.uid()::text AND public.has_pro(auth.uid()));