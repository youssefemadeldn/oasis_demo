import React from 'react';

export function Tag({ children, tone = 'neutral' }) {
  const tones = {
    neutral: { bg: 'var(--gray-100)', fg: 'var(--text-secondary)' },
    brand: { bg: 'var(--color-brand-soft)', fg: 'var(--blue-600)' },
    dark: { bg: 'var(--navy-700)', fg: 'var(--text-on-dark)' },
  };
  const t = tones[tone] || tones.neutral;
  return (
    <span style={{
      display: 'inline-flex', alignItems: 'center', background: t.bg, color: t.fg,
      fontFamily: 'var(--font-body)', fontSize: 'var(--fs-micro)', fontWeight: 'var(--fw-semibold)',
      textTransform: 'uppercase', letterSpacing: '0.03em',
      padding: '3px 8px', borderRadius: 'var(--radius-sm)',
    }}>
      {children}
    </span>
  );
}
