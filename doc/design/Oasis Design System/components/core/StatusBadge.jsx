import React from 'react';

const MAP = {
  pending: { bg: 'var(--status-pending-bg)', fg: 'var(--status-pending-fg)', dot: 'var(--status-pending-dot)', label: 'Pending' },
  closed: { bg: 'var(--status-closed-bg)', fg: 'var(--status-closed-fg)', dot: 'var(--status-closed-dot)', label: 'Closed' },
  rejected: { bg: 'var(--status-rejected-bg)', fg: 'var(--status-rejected-fg)', dot: 'var(--status-rejected-dot)', label: 'Rejected' },
  processing: { bg: 'var(--status-processing-bg)', fg: 'var(--status-processing-fg)', dot: 'var(--status-processing-dot)', label: 'Under Process' },
  invoiced: { bg: 'var(--status-invoiced-bg)', fg: 'var(--status-invoiced-fg)', dot: 'var(--status-invoiced-dot)', label: 'Invoiced' },
  cancelled: { bg: 'var(--status-cancelled-bg)', fg: 'var(--status-cancelled-fg)', dot: 'var(--status-cancelled-dot)', label: 'Cancelled' },
};

export function StatusBadge({ status = 'pending', label }) {
  const m = MAP[status] || MAP.pending;
  return (
    <span style={{
      display: 'inline-flex', alignItems: 'center', gap: 6,
      background: m.bg, color: m.fg, fontFamily: 'var(--font-body)',
      fontSize: 'var(--fs-caption)', fontWeight: 'var(--fw-semibold)',
      padding: '4px 10px', borderRadius: 'var(--radius-pill)', lineHeight: 1.4,
    }}>
      <span style={{ width: 6, height: 6, borderRadius: '50%', background: m.dot, flexShrink: 0 }} />
      {label || m.label}
    </span>
  );
}
