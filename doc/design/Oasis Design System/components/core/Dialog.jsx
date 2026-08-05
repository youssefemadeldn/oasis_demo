import React from 'react';

export function Dialog({ open, title, children, onClose, actions }) {
  if (!open) return null;
  return (
    <div style={{
      position: 'absolute', inset: 0, background: 'rgba(10,20,32,0.5)',
      display: 'flex', alignItems: 'flex-end', justifyContent: 'center', zIndex: 50,
    }} onClick={onClose}>
      <div onClick={(e) => e.stopPropagation()} style={{
        background: 'var(--surface-card)', borderRadius: '20px 20px 0 0', padding: 'var(--space-6)',
        width: '100%', maxWidth: 420, boxShadow: 'var(--shadow-lg)', fontFamily: 'var(--font-body)',
      }}>
        <div style={{ width: 36, height: 4, borderRadius: 2, background: 'var(--gray-200)', margin: '0 auto 16px' }} />
        {title && <h3 style={{ margin: '0 0 8px', fontSize: 'var(--fs-title-md)', fontWeight: 'var(--fw-bold)', color: 'var(--text-primary)' }}>{title}</h3>}
        <div style={{ color: 'var(--text-secondary)', fontSize: 'var(--fs-body-md)', lineHeight: 'var(--lh-normal)' }}>{children}</div>
        {actions && <div style={{ display: 'flex', gap: 10, marginTop: 20 }}>{actions}</div>}
      </div>
    </div>
  );
}
