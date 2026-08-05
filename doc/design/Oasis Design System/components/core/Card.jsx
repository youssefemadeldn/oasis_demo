import React from 'react';

export function Card({ children, padded = true, style, onClick }) {
  return (
    <div onClick={onClick} style={{
      background: 'var(--surface-card)', borderRadius: 'var(--radius-lg)',
      border: '1px solid var(--border-default)', boxShadow: 'var(--shadow-sm)',
      padding: padded ? 'var(--space-5)' : 0, cursor: onClick ? 'pointer' : 'default', ...style,
    }}>
      {children}
    </div>
  );
}
