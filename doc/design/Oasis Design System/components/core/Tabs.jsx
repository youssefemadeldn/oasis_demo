import React, { useState } from 'react';

export function Tabs({ tabs = [], defaultIndex = 0 }) {
  const [active, setActive] = useState(defaultIndex);
  return (
    <div style={{ fontFamily: 'var(--font-body)' }}>
      <div style={{ display: 'flex', gap: 4, borderBottom: '1px solid var(--border-default)' }}>
        {tabs.map((t, i) => (
          <button key={t.label} onClick={() => setActive(i)} style={{
            border: 'none', background: 'none', cursor: 'pointer', padding: '10px 16px',
            fontSize: 'var(--fs-body-md)', fontWeight: 'var(--fw-semibold)',
            color: active === i ? 'var(--blue-500)' : 'var(--text-muted)',
            borderBottom: active === i ? '2px solid var(--color-brand)' : '2px solid transparent',
            marginBottom: -1,
          }}>{t.label}</button>
        ))}
      </div>
      <div style={{ paddingTop: 'var(--space-4)' }}>{tabs[active] && tabs[active].content}</div>
    </div>
  );
}
