import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/helpers/bottom_sheet_helper.dart';
import '../../../../../core/router/app_routes.dart';
import '../../../../../core/router/args/claims_args.dart';
import '../../../../../core/router/args/submit_claim_args.dart';
import '../../../../../core/widgets/ds_button.dart';
import '../../../../../core/widgets/ds_top_bar.dart';
import 'submit_claim_confirm_sheet.dart';
import 'submit_claim_mock_data.dart';
import 'submit_claim_progress_steps.dart';
import 'submit_claim_step1_policy.dart';
import 'submit_claim_step2_details.dart';
import 'submit_claim_step3_documents.dart';
import 'submit_claim_step4_review.dart';

/// Submit a Claim — 4-step wizard, routing target for
/// [AppRoutes.submitClaim]. If [args] carries a preselected policy (entered
/// from Policy Detail), the wizard opens directly on step 2.
class SubmitClaimScreen extends StatefulWidget {
  final SubmitClaimArgs args;

  const SubmitClaimScreen({super.key, this.args = const SubmitClaimArgs()});

  @override
  State<SubmitClaimScreen> createState() => _SubmitClaimScreenState();
}

class _SubmitClaimScreenState extends State<SubmitClaimScreen> {
  late int _step;
  String? _policyId;
  String? _policyLine;
  String? _claimType;
  late final TextEditingController _descriptionController;
  final List<String> _photos = [];
  int _photoCounter = 0;

  @override
  void initState() {
    super.initState();
    _descriptionController = TextEditingController();
    _policyId = widget.args.policyId;
    _policyLine = widget.args.policyLine;
    _step = _policyId != null ? 2 : 1;
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }

  bool get _step1Disabled => _policyId == null;

  bool get _step2Disabled =>
      _claimType == null || _descriptionController.text.trim().isEmpty;

  void _selectPolicy(String id) {
    final policy = kSubmitClaimPolicyOptions.firstWhere((p) => p.id == id);
    setState(() {
      _policyId = policy.id;
      _policyLine = policy.line;
    });
  }

  void _next() {
    if (_step < 4) setState(() => _step++);
  }

  void _back() {
    if (_step > 1) {
      setState(() => _step--);
    } else {
      context.pop();
    }
  }

  void _addPhoto() {
    setState(() {
      _photoCounter++;
      _photos.add('IMG_${1000 + _photoCounter}.jpg');
    });
  }

  void _removePhoto(String name) {
    setState(() => _photos.remove(name));
  }

  Future<void> _openConfirmSheet() async {
    await BottomSheetHelper.showAppBottomSheet(
      context,
      child: SubmitClaimConfirmSheet(
        onCancel: () => Navigator.of(context).pop(),
        onConfirm: () {
          Navigator.of(context).pop();
          context.goNamed(
            AppRoutes.claims,
            extra: const ClaimsArgs(justSubmitted: true),
          );
        },
      ),
    );
  }

  Widget _buildStep() {
    switch (_step) {
      case 1:
        return SubmitClaimStep1Policy(
          selectedPolicyId: _policyId,
          onSelect: _selectPolicy,
        );
      case 2:
        return SubmitClaimStep2Details(
          policyLine: _policyLine ?? '',
          policyId: _policyId ?? '',
          claimType: _claimType,
          onClaimTypeChanged: (v) => setState(() => _claimType = v),
          descriptionController: _descriptionController,
        );
      case 3:
        return SubmitClaimStep3Documents(
          photoNames: _photos,
          onAddPhoto: _addPhoto,
          onRemovePhoto: _removePhoto,
        );
      default:
        return SubmitClaimStep4Review(
          policyId: _policyId ?? '',
          claimType: _claimType ?? '',
          description: _descriptionController.text,
          attachmentCount: _photos.length,
        );
    }
  }

  VoidCallback? get _primaryAction => switch (_step) {
        1 => _step1Disabled ? null : _next,
        2 => _step2Disabled ? null : _next,
        3 => _next,
        _ => _openConfirmSheet,
      };

  String get _primaryLabel =>
      _step == 4 ? 'submitClaim.submitButton'.tr() : 'common.continueLabel'.tr();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            DsTopBar(
              title: 'submitClaim.title'.tr(),
              onBack: _back,
            ),
            SubmitClaimProgressSteps(currentStep: _step),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16.r),
                child: _buildStep(),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.w, 14.h, 16.w, 14.h),
          child: DsButton(
            label: _primaryLabel,
            full: true,
            onPressed: _primaryAction,
          ),
        ),
      ),
    );
  }
}
