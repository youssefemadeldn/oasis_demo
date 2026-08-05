import '../../../../../core/widgets/ds_status_badge.dart';

/// Local mock data for the Home dashboard. Mirrors the prototype's
/// `recentClaims` (first 3 of the full claims list) and summary counts.
///
/// Duplicated (not imported) from the `claims`/`policies` features — see
/// "Cross-feature mock-data tradeoff" in the build plan.
class HomeRecentClaim {
  final String id;
  final String line;
  final ClaimStatus status;
  final String date;

  const HomeRecentClaim({
    required this.id,
    required this.line,
    required this.status,
    required this.date,
  });
}

const List<HomeRecentClaim> kHomeRecentClaims = [
  HomeRecentClaim(
    id: 'CLM-2026-3450',
    line: 'Motor Windscreen',
    status: ClaimStatus.processing,
    date: '31-Jul-2026',
  ),
  HomeRecentClaim(
    id: 'CLM-2026-3402',
    line: 'Medical — Outpatient',
    status: ClaimStatus.pending,
    date: '28-Jul-2026',
  ),
  HomeRecentClaim(
    id: 'CLM-2026-3381',
    line: 'Motor Third Party Liability',
    status: ClaimStatus.invoiced,
    date: '02-Jul-2026',
  ),
];

const int kHomeActivePoliciesCount = 3;
const int kHomeOpenClaimsCount = 2;
const String kHomePolicyholderName = 'Ahmed Al-Otaibi';
const bool kHomeHasUnreadNotifications = true;
