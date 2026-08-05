/// Local mock data for the Submit Claim wizard. Only `id`/`line` are needed
/// to render the policy picker — a deliberate small duplicate of the
/// `policies` feature's mock list (features may not import each other; see
/// "Cross-feature mock-data tradeoff" in the build plan).
class SubmitClaimPolicyOption {
  final String id;
  final String line;

  const SubmitClaimPolicyOption({required this.id, required this.line});
}

const List<SubmitClaimPolicyOption> kSubmitClaimPolicyOptions = [
  SubmitClaimPolicyOption(
    id: 'SL-RUH-MOT-2026-0044',
    line: 'Motor Comprehensive Fleet',
  ),
  SubmitClaimPolicyOption(
    id: 'SL-RUH-GEN-2026-1090',
    line: 'Property All Risks',
  ),
  SubmitClaimPolicyOption(
    id: 'SL-JED-MED-2026-0231',
    line: 'Medical — Group',
  ),
];

const List<String> kClaimTypes = [
  'Motor — Accident',
  'Motor — Theft',
  'Motor — Windscreen',
  'Property — Fire',
  'Property — Water Damage',
  'Property — Theft',
  'Medical — Outpatient',
  'Medical — Inpatient',
];
