/// Optional navigation args for [AppRoutes.submitClaim]. Both fields are
/// nullable — when absent, the wizard starts at step 1 with no policy
/// preselected (e.g. "Submit a Claim" from Home). When present (e.g.
/// "Submit a Claim on this Policy" from Policy Detail), the wizard opens
/// directly on step 2 with [policyId] preselected.
class SubmitClaimArgs {
  final String? policyId;
  final String? policyLine;

  const SubmitClaimArgs({this.policyId, this.policyLine});
}
