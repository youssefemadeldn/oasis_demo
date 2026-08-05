import React from 'react';

const sizes = {
  sm: { padding: '8px 14px', fontSize: 'var(--fs-body-sm)', gap: 6 },
  md: { padding: '11px 18px', fontSize: 'var(--fs-body-md)', gap: 8 },
  lg: { padding: '14px 22px', fontSize: 'var(--fs-body-lg)', gap: 8 },
};

function variantStyle(variant) {
  switch (variant) {
    case 'secondary':
      return { background: 'var(--gray-0)', color: 'var(--blue-500)', border: '1px solid var(--border-strong)' };
    case 'ghost':
      return { background: 'transparent', color: 'var(--blue-500)', border: '1px solid transparent' };
    case 'danger':
      return { background: 'var(--status-rejected-dot)', color: '#fff', border: '1px solid transparent' };
    case 'dark':
      return { background: 'var(--navy-900)', color: '#fff', border: '1px solid transparent' };
    default:
      return { background: 'var(--color-brand)', color: 'var(--text-on-brand)', border: '1px solid transparent' };
  }
}

export function Button({ children, variant = 'primary', size = 'md', icon, disabled, full, onClick, type = 'button' }) {
  const s = sizes[size] || sizes.md;
  const v = variantStyle(variant);
  return (
    <button
      type={type}
      disabled={disabled}
      onClick={onClick}
      style={{
        display: 'inline-flex', alignItems: 'center', justifyContent: 'center', gap: s.gap,
        padding: s.padding, fontSize: s.fontSize, fontFamily: 'var(--font-body)', fontWeight: 'var(--fw-semibold)',
        borderRadius: 'var(--radius-md)', cursor: disabled ? 'not-allowed' : 'pointer',
        width: full ? '100%' : 'auto', opacity: disabled ? 0.45 : 1,
        transition: 'filter var(--dur-fast) var(--ease-standard), transform var(--dur-fast) var(--ease-standard)',
        boxShadow: variant === 'primary' && !disabled ? 'var(--shadow-brand)' : 'none',
        ...v,
      }}
      onMouseEnter={(e) => { if (!disabled) e.currentTarget.style.filter = 'brightness(0.94)'; }}
      onMouseLeave={(e) => { e.currentTarget.style.filter = 'none'; }}
      onMouseDown={(e) => { if (!disabled) e.currentTarget.style.transform = 'scale(0.97)'; }}
      onMouseUp={(e) => { e.currentTarget.style.transform = 'scale(1)'; }}
    >
      {icon}
      {children}
    </button>
  );
}
