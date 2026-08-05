import React from 'react';

export function Checkbox({ label, checked, onChange }) {
  return (
    <label style={{ display: 'inline-flex', alignItems: 'center', gap: 10, cursor: 'pointer', fontFamily: 'var(--font-body)' }}>
      <span style={{
        width: 20, height: 20, borderRadius: 6, flexShrink: 0,
        border: checked ? 'none' : '1.5px solid var(--border-strong)',
        background: checked ? 'var(--color-brand)' : 'var(--surface-card)',
        display: 'flex', alignItems: 'center', justifyContent: 'center', transition: 'all var(--dur-fast) var(--ease-standard)',
      }}>
        {checked && <svg width="12" height="10" viewBox="0 0 12 10" fill="none"><path d="M1 5L4.5 8.5L11 1" stroke="white" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" /></svg>}
      </span>
      <input type="checkbox" checked={checked} onChange={onChange} style={{ display: 'none' }} />
      {label && <span style={{ fontSize: 'var(--fs-body-md)', color: 'var(--text-primary)' }}>{label}</span>}
    </label>
  );
}
