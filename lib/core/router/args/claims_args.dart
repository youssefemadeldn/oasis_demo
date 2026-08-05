/// Optional navigation args for [AppRoutes.claims]. Absent (or default)
/// when reached via bottom-nav; [justSubmitted] is set when arriving
/// straight from a successful Submit Claim confirmation, to show a one-off
/// success banner.
class ClaimsArgs {
  final bool justSubmitted;

  const ClaimsArgs({this.justSubmitted = false});
}
