import React from 'react';

export function TopBar({ title, dark = false, onBack, right }) {
  return (
    <div style={{
      display: 'flex', alignItems: 'center', justifyContent: 'space-between', gap: 12,
      background: dark ? 'var(--surface-dark)' : 'var(--surface-card)',
      padding: '16px 20px', fontFamily: 'var(--font-body)',
      borderBottom: dark ? 'none' : '1px solid var(--border-default)',
    }}>
      <div style={{ display: 'flex', alignItems: 'center', gap: 10 }}>
        {onBack && (
          <button onClick={onBack} style={{ background: 'none', border: 'none', cursor: 'pointer', padding: 0, color: dark ? '#fff' : 'var(--text-primary)' }}>
            <svg width="20" height="20" viewBox="0 0 24 24" fill="none"><path d="M15 5l-7 7 7 7" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"/></svg>
          </button>
        )}
        <span style={{ fontSize: 'var(--fs-title-sm)', fontWeight: 'var(--fw-bold)', color: dark ? '#fff' : 'var(--text-primary)' }}>{title}</span>
      </div>
      {right}
    </div>
  );
}
