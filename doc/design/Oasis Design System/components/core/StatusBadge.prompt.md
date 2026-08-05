Color-coded pill for claim/lead status, mirroring the desktop products' table badges (New Request/yellow, Closed/green, Rejected/red…).

```jsx
<StatusBadge status="pending" />
<StatusBadge status="closed" label="Approved" />
```

Six statuses ship built in: pending, closed, rejected, processing, invoiced, cancelled. Each pairs a soft background, dark-tinted text, and a solid dot in the same hue.
