import '../../../../core/widgets/ds_tag.dart';

/// Local mock policy data. Mirrors the prototype's `POLICIES` array
/// verbatim. Also duplicated (subset) in `claims/submit_claim` — see
/// "Cross-feature mock-data tradeoff" in the build plan.
enum PolicyType { motor, property, medical }

class Policy {
  final String id;
  final String line;
  final PolicyType type;
  final String expiry;
  final String start;
  final String premium;
  final String branch;
  final String tagKey;
  final DsTagTone tagTone;
  final List<String> docs;

  const Policy({
    required this.id,
    required this.line,
    required this.type,
    required this.expiry,
    required this.start,
    required this.premium,
    required this.branch,
    required this.tagKey,
    required this.tagTone,
    required this.docs,
  });
}

const List<Policy> kPolicies = [
  Policy(
    id: 'SL-RUH-MOT-2026-0044',
    line: 'Motor Comprehensive Fleet',
    type: PolicyType.motor,
    expiry: '24-Dec-2026',
    start: '25-Dec-2025',
    premium: 'SAR 18,400',
    branch: 'Riyadh',
    tagKey: 'policies.tag.active',
    tagTone: DsTagTone.brand,
    docs: ['Policy Schedule.pdf', 'Policy Wording.pdf', 'Vehicle Schedule.pdf'],
  ),
  Policy(
    id: 'SL-RUH-GEN-2026-1090',
    line: 'Property All Risks',
    type: PolicyType.property,
    expiry: '16-Aug-2026',
    start: '17-Aug-2025',
    premium: 'SAR 9,650',
    branch: 'Riyadh',
    tagKey: 'policies.tag.renewalDue',
    tagTone: DsTagTone.neutral,
    docs: ['Policy Schedule.pdf', 'Policy Wording.pdf'],
  ),
  Policy(
    id: 'SL-JED-MED-2026-0231',
    line: 'Medical — Group',
    type: PolicyType.medical,
    expiry: '02-Sep-2026',
    start: '03-Sep-2025',
    premium: 'SAR 24,900',
    branch: 'Jeddah',
    tagKey: 'policies.tag.active',
    tagTone: DsTagTone.brand,
    docs: ['Policy Schedule.pdf', 'Members List.pdf', 'Policy Wording.pdf'],
  ),
];
