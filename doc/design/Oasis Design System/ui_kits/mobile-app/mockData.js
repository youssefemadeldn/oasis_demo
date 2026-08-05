const policies = [
  { id: 'SL-RUH-MOT-2026-0044', line: 'Motor Comprehensive Fleet', status: 'closed', expiry: '24-Dec-2026' },
  { id: 'SL-RUH-GEN-2026-1090', line: 'Property All Risks', status: 'pending', expiry: '16-Aug-2026' },
  { id: 'SL-JED-MED-2026-0231', line: 'Medical — Group', status: 'processing', expiry: '02-Sep-2026' },
];

const claims = [
  { id: 'CLM-2026-3381', line: 'Motor Third Party Liability', status: 'invoiced', amount: 'SAR 4,250' },
  { id: 'CLM-2026-3402', line: 'Medical — Outpatient', status: 'pending', amount: 'SAR 890' },
  { id: 'CLM-2026-3299', line: 'Property Fire', status: 'rejected', amount: 'SAR 12,000' },
  { id: 'CLM-2026-3160', line: 'Motor Comprehensive', status: 'closed', amount: 'SAR 6,700' },
];

window.MOCK = { policies, claims };
