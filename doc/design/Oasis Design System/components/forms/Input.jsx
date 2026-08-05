import React, { useState } from 'react';

export function Input({ label, placeholder, type = 'text', icon, error, value, onChange, disabled }) {
  const [focused, setFocused] = useState(false);
  return (
    <label style={{ display: 'flex', flexDirection: 'column', gap: 6, fontFamily: 'var(--font-body)', width: '100%' }}>
      {label && <span style={{ fontSize: 'var(--fs-body-sm)', fontWeight: 'var(--fw-medium)', color: 'var(--text-secondary)' }}>{label}</span>}
      <div style={{
        display: 'flex', alignItems: 'center', gap: 8,
        border: `1.5px solid ${error ? 'var(--status-rejected-dot)' : focused ? 'var(--focus-ring)' : 'var(--border-default)'}`,
        borderRadius: 'var(--radius-md)', padding: '10px 14px', background: disabled ? 'var(--gray-50)' : 'var(--surface-card)',
        boxShadow: focused ? '0 0 0 3px rgba(41,171,226,0.15)' : 'none', transition: 'all var(--dur-fast) var(--ease-standard)',
      }}>
        {icon}
        <input
          type={type} placeholder={placeholder} value={value} disabled={disabled}
          onChange={onChange} onFocus={() => setFocused(true)} onBlur={() => setFocused(false)}
          style={{ border: 'none', outline: 'none', flex: 1, fontSize: 'var(--fs-body-md)', color: 'var(--text-primary)', background: 'transparent', fontFamily: 'inherit' }}
        />
      </div>
      {error && <span style={{ fontSize: 'var(--fs-caption)', color: 'var(--status-rejected-fg)' }}>{error}</span>}
    </label>
  );
}
