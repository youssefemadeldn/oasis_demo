function ClaimDetailScreen({ nav, data }) {
  const { TopBar, Card, StatusBadge, Toast } = window.OasisDesignSystem_6d12e0;
  const c = data || {};
  const steps = ['Submitted', 'Under Review', 'Approved', 'Invoiced'];
  const activeIdx = c.status === 'invoiced' ? 3 : c.status === 'closed' ? 2 : c.status === 'rejected' ? 1 : 1;
  return (
    <div style={{ height: '100%', display: 'flex', flexDirection: 'column', background: 'var(--surface-page)', fontFamily: 'var(--font-body)' }}>
      <TopBar title="Claim Details" onBack={() => nav('claims')} />
      <div style={{ flex: 1, overflowY: 'auto', padding: 16, display: 'flex', flexDirection: 'column', gap: 14 }}>
        <Card>
          <div style={{ display: 'flex', justifyContent: 'space-between', marginBottom: 8 }}>
            <div style={{ fontWeight: 'var(--fw-bold)', fontSize: 16, color: 'var(--text-primary)' }}>{c.line}</div>
            <StatusBadge status={c.status} />
          </div>
          <div style={{ fontSize: 12, color: 'var(--text-muted)' }}>{c.id}</div>
          <div style={{ fontSize: 20, fontWeight: 'var(--fw-bold)', color: 'var(--color-brand)', marginTop: 8 }}>{c.amount}</div>
        </Card>
        <Card>
          <div style={{ fontSize: 13, fontWeight: 'var(--fw-semibold)', color: 'var(--text-secondary)', marginBottom: 12 }}>Progress</div>
          <div style={{ display: 'flex', flexDirection: 'column', gap: 0 }}>
            {steps.map((s, i) => (
              <div key={s} style={{ display: 'flex', alignItems: 'center', gap: 10 }}>
                <div style={{ display: 'flex', flexDirection: 'column', alignItems: 'center' }}>
                  <div style={{ width: 12, height: 12, borderRadius: '50%', background: i <= activeIdx ? 'var(--color-brand)' : 'var(--gray-200)' }} />
                  {i < steps.length - 1 && <div style={{ width: 2, height: 24, background: i < activeIdx ? 'var(--color-brand)' : 'var(--gray-200)' }} />}
                </div>
                <div style={{ fontSize: 13, color: i <= activeIdx ? 'var(--text-primary)' : 'var(--text-muted)', fontWeight: i === activeIdx ? 'var(--fw-semibold)' : 'var(--fw-regular)', paddingBottom: 12 }}>{s}</div>
              </div>
            ))}
          </div>
        </Card>
        {c.status === 'rejected' && <Toast tone="error">This claim was rejected. Contact your broker for details.</Toast>}
        {c.status === 'invoiced' && <Toast tone="success">Claim approved and invoiced.</Toast>}
      </div>
    </div>
  );
}
window.ClaimDetailScreen = ClaimDetailScreen;
