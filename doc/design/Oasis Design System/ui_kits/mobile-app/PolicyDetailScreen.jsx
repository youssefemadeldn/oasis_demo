function PolicyDetailScreen({ nav, data }) {
  const { TopBar, Card, StatusBadge, Tag, Button } = window.OasisDesignSystem_6d12e0;
  const p = data || {};
  const rows = [
    ['Policy Number', p.id], ['Class of Business', p.line], ['Branch', 'Jeddah'],
    ['Effective Date', '25-Dec-2025'], ['Expiry Date', p.expiry], ['Premium', 'SAR 18,400'],
  ];
  return (
    <div style={{ height: '100%', display: 'flex', flexDirection: 'column', background: 'var(--surface-page)', fontFamily: 'var(--font-body)' }}>
      <TopBar title="Policy Details" onBack={() => nav('policies')} />
      <div style={{ flex: 1, overflowY: 'auto', padding: 16, display: 'flex', flexDirection: 'column', gap: 14 }}>
        <Card>
          <div style={{ display: 'flex', justifyContent: 'space-between', marginBottom: 6 }}>
            <div style={{ fontWeight: 'var(--fw-bold)', fontSize: 16, color: 'var(--text-primary)' }}>{p.line}</div>
            <StatusBadge status={p.status} />
          </div>
          <div style={{ display: 'flex', flexDirection: 'column', gap: 8, marginTop: 10 }}>
            {rows.map(([k, v]) => (
              <div key={k} style={{ display: 'flex', justifyContent: 'space-between', fontSize: 13 }}>
                <span style={{ color: 'var(--text-muted)' }}>{k}</span>
                <span style={{ color: 'var(--text-primary)', fontWeight: 'var(--fw-medium)' }}>{v}</span>
              </div>
            ))}
          </div>
        </Card>
        <div style={{ display: 'flex', gap: 8 }}><Tag>Motor</Tag><Tag tone="brand">Fleet</Tag></div>
        <Button full onClick={() => nav('claims')}>File a Claim on this Policy</Button>
      </div>
    </div>
  );
}
window.PolicyDetailScreen = PolicyDetailScreen;
