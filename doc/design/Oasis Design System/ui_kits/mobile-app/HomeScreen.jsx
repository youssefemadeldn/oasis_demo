function HomeScreen({ nav }) {
  const { TopBar, Card, StatusBadge, Button, BottomNav } = window.OasisDesignSystem_6d12e0;
  const { MOCK } = window;
  return (
    <div style={{ height: '100%', display: 'flex', flexDirection: 'column', background: 'var(--surface-page)', fontFamily: 'var(--font-body)' }}>
      <TopBar title="Oasis" dark right={<span style={{ color: '#fff', fontSize: 12, opacity: 0.8 }}>Ahmed Al-Otaibi</span>} />
      <div style={{ flex: 1, overflowY: 'auto', padding: 16, display: 'flex', flexDirection: 'column', gap: 14 }}>
        <div style={{ background: 'linear-gradient(135deg, var(--navy-800), var(--blue-600))', borderRadius: 'var(--radius-lg)', padding: 18, color: '#fff' }}>
          <div style={{ fontSize: 12, color: 'var(--text-on-dark-muted)', marginBottom: 4 }}>Active Policies</div>
          <div style={{ fontSize: 28, fontWeight: 800 }}>3</div>
          <div style={{ fontSize: 12, marginTop: 8, color: 'var(--text-on-dark-muted)' }}>1 renewal due in 11 days</div>
        </div>
        <div style={{ display: 'flex', gap: 10 }}>
          <Button full size="sm" onClick={() => nav('claims')}>Submit a Claim</Button>
          <Button full size="sm" variant="secondary" onClick={() => nav('policies')}>View Policies</Button>
        </div>
        <div style={{ fontSize: 'var(--fs-title-sm)', fontWeight: 'var(--fw-bold)', color: 'var(--text-primary)', marginTop: 4 }}>Recent Claims</div>
        {MOCK.claims.slice(0, 3).map((c) => (
          <Card key={c.id} onClick={() => nav('claimDetail', c)}>
            <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'flex-start' }}>
              <div>
                <div style={{ fontWeight: 'var(--fw-semibold)', fontSize: 14, color: 'var(--text-primary)' }}>{c.line}</div>
                <div style={{ fontSize: 12, color: 'var(--text-muted)', marginTop: 2 }}>{c.id} · {c.amount}</div>
              </div>
              <StatusBadge status={c.status} />
            </div>
          </Card>
        ))}
      </div>
      <BottomNav active="home" onChange={(k) => nav(k)} />
    </div>
  );
}
window.HomeScreen = HomeScreen;
