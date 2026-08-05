function LoginScreen({ onLogin }) {
  const { Button, Input } = window.OasisDesignSystem_6d12e0;
  const [id, setId] = React.useState('');
  const [pass, setPass] = React.useState('');
  return (
    <div style={{ height: '100%', display: 'flex', flexDirection: 'column', background: 'var(--surface-dark)', fontFamily: 'var(--font-body)' }}>
      <div style={{ flex: 1, display: 'flex', flexDirection: 'column', alignItems: 'center', justifyContent: 'center', gap: 20, padding: '0 28px' }}>
        <img src="../../assets/logo-full.png" style={{ height: 44 }} />
        <div style={{ color: 'var(--text-on-dark-muted)', fontSize: 14, textAlign: 'center' }}>Policy management & claims, in your pocket.</div>
      </div>
      <div style={{ background: 'var(--surface-card)', borderRadius: '24px 24px 0 0', padding: '28px 24px 32px', display: 'flex', flexDirection: 'column', gap: 16 }}>
        <div style={{ fontSize: 'var(--fs-title-lg)', fontWeight: 'var(--fw-bold)', color: 'var(--text-primary)' }}>Welcome back</div>
        <Input label="National ID / Iqama" placeholder="1xxxxxxxxx" value={id} onChange={(e) => setId(e.target.value)} />
        <Input label="Password" type="password" placeholder="••••••••" value={pass} onChange={(e) => setPass(e.target.value)} />
        <Button full onClick={onLogin}>Sign In</Button>
        <div style={{ textAlign: 'center', fontSize: 13, color: 'var(--text-muted)' }}>Forgot password?</div>
      </div>
    </div>
  );
}
window.LoginScreen = LoginScreen;
