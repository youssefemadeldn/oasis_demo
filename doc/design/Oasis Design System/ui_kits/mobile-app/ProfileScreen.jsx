function ProfileScreen({ nav }) {
  const { TopBar, Card, Switch, Button, BottomNav } = window.OasisDesignSystem_6d12e0;
  const [notifs, setNotifs] = React.useState(true);
  const [arabic, setArabic] = React.useState(false);
  return (
    <div style={{ height: '100%', display: 'flex', flexDirection: 'column', background: 'var(--surface-page)', fontFamily: 'var(--font-body)' }}>
      <TopBar title="Profile" />
      <div style={{ flex: 1, overflowY: 'auto', padding: 16, display: 'flex', flexDirection: 'column', gap: 14 }}>
        <Card>
          <div style={{ display: 'flex', alignItems: 'center', gap: 12 }}>
            <div style={{ width: 48, height: 48, borderRadius: '50%', background: 'var(--color-brand)', color: '#fff', display: 'flex', alignItems: 'center', justifyContent: 'center', fontWeight: 700, fontSize: 18 }}>AO</div>
            <div>
              <div style={{ fontWeight: 'var(--fw-bold)', fontSize: 15, color: 'var(--text-primary)' }}>Ahmed Al-Otaibi</div>
              <div style={{ fontSize: 12, color: 'var(--text-muted)' }}>ID •••• 4821</div>
            </div>
          </div>
        </Card>
        <Card>
          <div style={{ display: 'flex', flexDirection: 'column', gap: 16 }}>
            <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
              <span style={{ fontSize: 14, color: 'var(--text-primary)' }}>Push notifications</span>
              <Switch checked={notifs} onChange={() => setNotifs((v) => !v)} />
            </div>
            <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
              <span style={{ fontSize: 14, color: 'var(--text-primary)' }}>Arabic interface</span>
              <Switch checked={arabic} onChange={() => setArabic((v) => !v)} />
            </div>
          </div>
        </Card>
        <Button variant="secondary" full>Sign Out</Button>
      </div>
      <BottomNav active="profile" onChange={(k) => nav(k)} />
    </div>
  );
}
window.ProfileScreen = ProfileScreen;
