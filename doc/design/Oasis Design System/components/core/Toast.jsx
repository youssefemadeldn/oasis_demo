import React from 'react';

const tones = {
  success: { bg: 'var(--status-closed-bg)', fg: 'var(--status-closed-fg)' },
  error: { bg: 'var(--status-rejected-bg)', fg: 'var(--status-rejected-fg)' },
  info: { bg: 'var(--color-brand-soft)', fg: 'var(--blue-600)' },
};

export function Toast({ tone = 'info', children }) {
  const t = tones[tone] || tones.info;
  return (
    <div style={{
      display: 'flex', alignItems: 'center', gap: 10, background: t.bg, color: t.fg,
      fontFamily: 'var(--font-body)', fontSize: 'var(--fs-body-sm)', fontWeight: 'var(--fw-medium)',
      padding: '12px 16px', borderRadius: 'var(--radius-md)', boxShadow: 'var(--shadow-md)',
    }}>
      {children}
    </div>
  );
}
