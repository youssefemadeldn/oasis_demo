import React from 'react';

const icons = {
  home: (a) => <svg width="22" height="22" viewBox="0 0 24 24" fill="none"><path d="M4 11.5L12 4l8 7.5V20a1 1 0 01-1 1h-4v-6H9v6H5a1 1 0 01-1-1v-8.5z" stroke={a?'var(--color-brand)':'var(--text-muted)'} strokeWidth="1.8" strokeLinejoin="round"/></svg>,
  policies: (a) => <svg width="22" height="22" viewBox="0 0 24 24" fill="none"><path d="M6 3h9l4 4v13a1 1 0 01-1 1H6a1 1 0 01-1-1V4a1 1 0 011-1z" stroke={a?'var(--color-brand)':'var(--text-muted)'} strokeWidth="1.8"/><path d="M9 12h6M9 16h6" stroke={a?'var(--color-brand)':'var(--text-muted)'} strokeWidth="1.8" strokeLinecap="round"/></svg>,
  claims: (a) => <svg width="22" height="22" viewBox="0 0 24 24" fill="none"><path d="M12 2l2.6 5.3 5.9.9-4.2 4.1 1 5.8-5.3-2.8-5.3 2.8 1-5.8-4.2-4.1 5.9-.9L12 2z" stroke={a?'var(--color-brand)':'var(--text-muted)'} strokeWidth="1.8" strokeLinejoin="round"/></svg>,
  profile: (a) => <svg width="22" height="22" viewBox="0 0 24 24" fill="none"><circle cx="12" cy="8" r="3.5" stroke={a?'var(--color-brand)':'var(--text-muted)'} strokeWidth="1.8"/><path d="M4.5 20c1.2-3.8 4.2-5.5 7.5-5.5s6.3 1.7 7.5 5.5" stroke={a?'var(--color-brand)':'var(--text-muted)'} strokeWidth="1.8" strokeLinecap="round"/></svg>,
};

export function BottomNav({ active = 'home', onChange }) {
  const items = [
    { key: 'home', label: 'Home' },
    { key: 'policies', label: 'Policies' },
    { key: 'claims', label: 'Claims' },
    { key: 'profile', label: 'Profile' },
  ];
  return (
    <div style={{
      display: 'flex', justifyContent: 'space-around', alignItems: 'center',
      background: 'var(--surface-card)', borderTop: '1px solid var(--border-default)',
      padding: '10px 8px calc(10px + env(safe-area-inset-bottom))', fontFamily: 'var(--font-body)',
    }}>
      {items.map((it) => {
        const a = it.key === active;
        return (
          <button key={it.key} onClick={() => onChange && onChange(it.key)} style={{
            display: 'flex', flexDirection: 'column', alignItems: 'center', gap: 3,
            background: 'none', border: 'none', cursor: 'pointer', padding: '2px 10px',
          }}>
            {icons[it.key](a)}
            <span style={{ fontSize: 'var(--fs-micro)', fontWeight: a ? 'var(--fw-semibold)' : 'var(--fw-medium)', color: a ? 'var(--color-brand)' : 'var(--text-muted)' }}>{it.label}</span>
          </button>
        );
      })}
    </div>
  );
}
