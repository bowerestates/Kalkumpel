REVOKE EXECUTE ON FUNCTION public.has_pro(uuid) FROM PUBLIC, anon;
GRANT EXECUTE ON FUNCTION public.has_pro(uuid) TO authenticated, service_role;