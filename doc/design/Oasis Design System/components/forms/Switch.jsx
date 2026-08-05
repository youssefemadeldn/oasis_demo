import React from 'react';

export function Switch({ checked, onChange, label }) {
  return (
    <label style={{ display: 'inline-flex', alignItems: 'center', gap: 10, cursor: 'pointer', fontFamily: 'var(--font-body)' }}>
      {label && <span style={{ fontSize: 'var(--fs-body-md)', color: 'var(--text-primary)' }}>{label}</span>}
      <span onClick={onChange} style={{
        width: 42, height: 24, borderRadius: 'var(--radius-pill)', padding: 3, display: 'flex',
        background: checked ? 'var(--color-brand)' : 'var(--gray-300)', transition: 'background var(--dur-normal) var(--ease-standard)',
      }}>
        <span style={{
          width: 18, height: 18, borderRadius: '50%', background: '#fff', boxShadow: 'var(--shadow-sm)',
          transform: checked ? 'translateX(18px)' : 'translateX(0)', transition: 'transform var(--dur-normal) var(--ease-standard)',
        }} />
      </span>
    </label>
  );
}
