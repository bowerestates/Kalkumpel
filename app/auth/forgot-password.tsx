import { router } from 'expo-router';
import { useState } from 'react';

import { AuthScreen, ErrorText, Field, LinkButton, PrimaryButton } from '@/components/auth-ui';
import { supabase } from '@/lib/supabase';
import { isValidEmail } from '@/lib/validation';

export default function ForgotPasswordScreen() {
  const [email, setEmail] = useState('');
  const [error, setError] = useState<string | null>(null);
  const [busy, setBusy] = useState(false);

  async function submit() {
    if (!isValidEmail(email)) return setError('Enter a valid email address.');
    setError(null);
    setBusy(true);
    const addr = email.trim();
    // Keep the response identical for registered and unregistered email addresses.
    const { error: resetErr } = await supabase.auth.resetPasswordForEmail(addr);
    setBusy(false);
    if (resetErr) {
      return setError('Couldn’t send the reset code — try again.');
    }
    router.push({ pathname: '/reset-password', params: { email: addr } });
  }

  return (
    <AuthScreen
      title="Reset password"
      subtitle="Enter your account email and we’ll send a 6-digit reset code. Signed up with Google? Log in with Google instead.">
      <Field
        value={email}
        onChangeText={setEmail}
        placeholder="Email"
        icon="envelope"
        keyboardType="email-address"
        textContentType="emailAddress"
        returnKeyType="go"
        onSubmitEditing={submit}
      />
      <ErrorText>{error}</ErrorText>
      <PrimaryButton label="Send reset code" onPress={submit} loading={busy} />
      <LinkButton label="Back to login" onPress={() => router.back()} />
    </AuthScreen>
  );
}
