function ClaimsScreen({ nav }) {
  const { TopBar, Card, StatusBadge, Button, BottomNav } = window.OasisDesignSystem_6d12e0;
  const { MOCK } = window;
  return (
    <div style={{ height: '100%', display: 'flex', flexDirection: 'column', background: 'var(--surface-page)', fontFamily: 'var(--font-body)' }}>
      <TopBar title="Claims" right={<Button size="sm" onClick={() => nav('submitClaim')}>+ New</Button>} />
      <div style={{ flex: 1, overflowY: 'auto', padding: 16, display: 'flex', flexDirection: 'column', gap: 12 }}>
        {MOCK.claims.map((c) => (
          <Card key={c.id} onClick={() => nav('claimDetail', c)}>
            <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'flex-start' }}>
              <div>
                <div style={{ fontWeight: 'var(--fw-semibold)', fontSize: 14, color: 'var(--text-primary)' }}>{c.line}</div>
                <div style={{ fontSize: 12, color: 'var(--text-muted)', marginTop: 2 }}>{c.id}</div>
              </div>
              <StatusBadge status={c.status} />
            </div>
            <div style={{ marginTop: 8, fontSize: 13, fontWeight: 'var(--fw-medium)', color: 'var(--text-primary)' }}>{c.amount}</div>
          </Card>
        ))}
      </div>
      <BottomNav active="claims" onChange={(k) => nav(k)} />
    </div>
  );
}
window.ClaimsScreen = ClaimsScreen;
