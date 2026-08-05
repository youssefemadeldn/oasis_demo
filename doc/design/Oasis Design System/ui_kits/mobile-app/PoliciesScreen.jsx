function PoliciesScreen({ nav }) {
  const { TopBar, Card, StatusBadge, Tag, BottomNav } = window.OasisDesignSystem_6d12e0;
  const { MOCK } = window;
  return (
    <div style={{ height: '100%', display: 'flex', flexDirection: 'column', background: 'var(--surface-page)', fontFamily: 'var(--font-body)' }}>
      <TopBar title="My Policies" />
      <div style={{ flex: 1, overflowY: 'auto', padding: 16, display: 'flex', flexDirection: 'column', gap: 12 }}>
        {MOCK.policies.map((p) => (
          <Card key={p.id} onClick={() => nav('policyDetail', p)}>
            <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'flex-start', marginBottom: 8 }}>
              <div style={{ fontWeight: 'var(--fw-semibold)', fontSize: 14, color: 'var(--text-primary)' }}>{p.line}</div>
              <StatusBadge status={p.status} />
            </div>
            <div style={{ fontSize: 12, color: 'var(--text-muted)', marginBottom: 8 }}>{p.id}</div>
            <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
              <Tag tone="brand">Expires {p.expiry}</Tag>
            </div>
          </Card>
        ))}
      </div>
      <BottomNav active="policies" onChange={(k) => nav(k)} />
    </div>
  );
}
window.PoliciesScreen = PoliciesScreen;
