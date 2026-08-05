import React from 'react';

export function Select({ label, options = [], value, onChange }) {
  return (
    <label style={{ display: 'flex', flexDirection: 'column', gap: 6, fontFamily: 'var(--font-body)', width: '100%' }}>
      {label && <span style={{ fontSize: 'var(--fs-body-sm)', fontWeight: 'var(--fw-medium)', color: 'var(--text-secondary)' }}>{label}</span>}
      <div style={{ position: 'relative' }}>
        <select
          value={value} onChange={onChange}
          style={{
            width: '100%', appearance: 'none', border: '1.5px solid var(--border-default)', borderRadius: 'var(--radius-md)',
            padding: '10px 34px 10px 14px', fontSize: 'var(--fs-body-md)', color: 'var(--text-primary)', background: 'var(--surface-card)',
            fontFamily: 'inherit', cursor: 'pointer',
          }}
        >
          {options.map((o) => <option key={o} value={o}>{o}</option>)}
        </select>
        <span style={{ position: 'absolute', right: 14, top: '50%', transform: 'translateY(-50%)', pointerEvents: 'none', color: 'var(--text-muted)' }}>▾</span>
      </div>
    </label>
  );
}
