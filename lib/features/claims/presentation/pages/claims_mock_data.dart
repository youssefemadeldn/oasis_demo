import '../../../../core/widgets/ds_status_badge.dart';

/// Local mock claim data. Mirrors the prototype's `claims` array verbatim.
class Claim {
  final String id;
  final String line;
  final ClaimStatus status;
  final String amount;
  final String policyId;
  final String date;

  const Claim({
    required this.id,
    required this.line,
    required this.status,
    required this.amount,
    required this.policyId,
    required this.date,
  });
}

const List<Claim> kClaims = [
  Claim(
    id: 'CLM-2026-3450',
    line: 'Motor Windscreen',
    status: ClaimStatus.processing,
    amount: 'SAR 350',
    policyId: 'SL-RUH-MOT-2026-0044',
    date: '31-Jul-2026',
  ),
  Claim(
    id: 'CLM-2026-3402',
    line: 'Medical — Outpatient',
    status: ClaimStatus.pending,
    amount: 'SAR 890',
    policyId: 'SL-JED-MED-2026-0231',
    date: '28-Jul-2026',
  ),
  Claim(
    id: 'CLM-2026-3381',
    line: 'Motor Third Party Liability',
    status: ClaimStatus.invoiced,
    amount: 'SAR 4,250',
    policyId: 'SL-RUH-MOT-2026-0044',
    date: '02-Jul-2026',
  ),
  Claim(
    id: 'CLM-2026-3160',
    line: 'Motor Comprehensive',
    status: ClaimStatus.closed,
    amount: 'SAR 6,700',
    policyId: 'SL-RUH-MOT-2026-0044',
    date: '30-May-2026',
  ),
  Claim(
    id: 'CLM-2026-3299',
    line: 'Property Fire',
    status: ClaimStatus.rejected,
    amount: 'SAR 12,000',
    policyId: 'SL-RUH-GEN-2026-1090',
    date: '14-Jun-2026',
  ),
  Claim(
    id: 'CLM-2026-3120',
    line: 'Property Theft',
    status: ClaimStatus.cancelled,
    amount: 'SAR 2,100',
    policyId: 'SL-RUH-GEN-2026-1090',
    date: '10-Apr-2026',
  ),
];
