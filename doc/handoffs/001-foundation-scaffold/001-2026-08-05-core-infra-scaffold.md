# Session Handoff — 2026-08-05

> **OUT OF PREVIOUS SESSION — NEW SESSION START**
>
> Read this file first. It contains everything from the prior session.

## What Was Done

- Built the complete `lib/core/` foundation layer for the Oasis Policyholder App per `.claude/rules/flutter_scaffold_prompt.md` — DI, networking, routing, theming, storage, helpers, shared widgets. **No feature code, no screens with real logic, no business logic** — that phase is governed by `.claude/rules/flutter_feature_prompt.md` and hasn't started.
- Read `doc/design/Oasis Design System/` (real design tokens + UI kit) and used the **real brand tokens** instead of the placeholder hex values written inline in the rule file — see mapping table in the approved plan at `/Users/youssefemadeldin.ai/.claude/plans/read-claude-md-file-and-buzzing-newell.md`.
- Added all approved dependencies to `pubspec.yaml` (`dio`, `flutter_bloc`, `get_it`, `injectable`, `dartz`, `flutter_secure_storage`, `go_router`, `flutter_screenutil`, `flutter_svg`, `cached_network_image`, `shimmer`, `connectivity_plus`, `equatable`, `intl`, `easy_localization`, `url_launcher`, `google_fonts`, `shared_preferences`, `flutter_launcher_icons`, `pretty_dio_logger`, plus `build_runner`/`injectable_generator` as dev deps).
- Copied the two official brand logo assets from `doc/design/Oasis Design System/assets/` into `assets/images/` (`logo_full.png`, `logo_mark.jpeg`), declared in `pubspec.yaml`, referenced via `AppConstants.kLogoFull`/`kLogoMark`.
- Ran `dart run build_runner build` successfully — `lib/core/di/injection_container.config.dart` generated clean, construction order verified (SecureStorage → NavigatorKey → GoRouter → DioFactory → Dio → ApiManager).
- `flutter analyze` → **0 issues** (verified repeatedly after each change, most recently after removing `SnackBarHelper`).
- User manually deleted `lib/core/helpers/snack_bar_helper.dart` mid-session (it is **not needed** for this app) — cleaned up the stray doc-comment reference to it in `bottom_sheet_helper.dart` and regenerated the DI config to drop the stale registration.
- User also manually edited `test/widget_test.dart` back to the stock Flutter counter smoke test (reverting the DI-aware smoke test written earlier this session) — **left as-is per system reminder instructing not to revert user changes**. This test currently pumps `const MyApp()` directly with no `configureDependencies()`/`EasyLocalization` ancestor and will almost certainly fail if run, since `MyApp.build()` calls `getIt<GoRouter>()` and expects an `EasyLocalization` provider above it. Not fixed this session — see Pending Tasks.
- `flutter test` was started once, then explicitly interrupted by the user ("ignore test") — never completed, no result to report.

## Files Changed

| File | Change | Why |
|---|---|---|
| `pubspec.yaml` | Added all foundation dependencies + `assets/translations/` + `assets/images/` | Scaffold requirement |
| `lib/core/constants/app_constants.dart` | Design tokens, storage keys, `kLogoFull`/`kLogoMark` paths | Foundation constants |
| `lib/core/constants/api_constants.dart` | Env-aware `baseUrl`, timeouts, endpoint paths | Foundation constants |
| `lib/core/constants/spacing_constants.dart` | `AppSpacing` — real 4px DS scale (`s4`…`s80`, `v4`…`v80`) | Foundation constants |
| `lib/core/theme/app_colors.dart` | Real Oasis brand palette + 6 status-badge color pairs | Real design tokens |
| `lib/core/theme/app_font_weight.dart` | Weight tokens | Foundation theme |
| `lib/core/theme/app_text_styles.dart` | Poppins (display/headline) + Inter (title/body/label) via `google_fonts` | Real design tokens |
| `lib/core/theme/app_theme.dart` | `AppTheme.lightTheme` wiring all component themes | Foundation theme |
| `lib/core/helpers/dialog_helper.dart` | `@lazySingleton`, ctor-injected `GlobalKey<NavigatorState>` | Scaffold requirement |
| `lib/core/helpers/bottom_sheet_helper.dart` | Static utility, `showAppBottomSheet` | Scaffold requirement |
| `lib/core/helpers/date_formatter_helper.dart` | Static `intl`-based formatters | Scaffold requirement |
| `lib/core/helpers/regex_helper.dart` | Validation patterns | Scaffold requirement |
| `lib/core/widgets/app_loading_indicator.dart`, `empty_state_widget.dart`, `error_state_widget.dart` | Shared `BlocBuilder` states | Scaffold requirement |
| `lib/core/network/failure.dart`, `api_result.dart`, `failure_messages.dart`, `api_manager.dart`, `connectivity_helper.dart`, `dio_factory.dart` | Full network layer | Scaffold requirement |
| `lib/core/network/interceptors/auth_interceptor.dart` | Silent refresh, shared in-flight `Completer`, bare Dio, no recursion | Scaffold requirement |
| `lib/core/storage/secure_storage_helper.dart` | Typed `FlutterSecureStorage` wrapper | Scaffold requirement |
| `lib/core/router/app_routes.dart` | `splash`/`login`/`home`/`unknown` (no `register` — no such screen in design) | User decision, see Q&A |
| `lib/core/router/app_router.dart` | `GoRouter` with inline `_PlaceholderScreen` per route until real screens exist | Foundation phase has no screens yet |
| `lib/core/di/register_module.dart` | `@module` providing `FlutterSecureStorage`, `Connectivity`, `GlobalKey<NavigatorState>`, `GoRouter`, `Dio`, `SharedPreferences` | Scaffold requirement |
| `lib/core/di/injection_container.dart` | `getIt` + `@InjectableInit` | Scaffold requirement |
| `assets/translations/en.json` | Empty `{}` | Localization scaffold, `ar.json` deferred |
| `assets/images/logo_full.png`, `logo_mark.jpeg` | Copied from `doc/design` | User request this session |
| `lib/main.dart` | Full init order: bindings → EasyLocalization → intl (en/ar) → DI → `runApp` | Scaffold requirement |

## Files Audited (no changes)

| File | Checked For | Result |
|---|---|---|
| `doc/design/Oasis Design System/tokens/*.css`, `readme.md` | Real brand tokens (colors, type, spacing, effects) | Extracted and mapped into `AppColors`/`AppTextStyles`/`AppSpacing`/`AppTheme` |
| `doc/design/Oasis Design System/ui_kits/mobile-app/README.md` | App screen flow | Confirmed: Login → Home → Policies → Policy Detail → Claims → Claim Detail → Submit Claim → Profile, **no register screen** |
| `pubspec.yaml` (pre-change) | Existing deps | Clean `flutter create` init, nothing to preserve/migrate |

## Pending Tasks

- [ ] **Decide what to do with `test/widget_test.dart`.** User reverted it to the stock counter test, which will fail against the current `MyApp` (no `MyApp()` standalone boot path — needs `configureDependencies()` + `EasyLocalization` ancestor first). Either: (a) confirm with the user whether to fix/replace it, or (b) leave it — but flag that `flutter test` is currently red if run.
- [ ] Run `flutter test` to completion (was interrupted mid-session) once the above is resolved.
- [ ] Configure `flutter_launcher_icons` using `assets/images/logo_mark.jpeg` (or a purpose-cut icon asset) — package is installed but unconfigured.
- [ ] First feature to build should be **auth/login** (per the design flow, it's the entry screen) — this is where `AppRoutes.login`, the first real `LoginCubit`, and the first args class (if any) will replace the `_PlaceholderScreen` in `app_router.dart`.
- [ ] Add `ar.json` translation file only when Arabic is actually being built (per rule — don't create speculatively).

## What's Next (ordered)

1. Resolve the `test/widget_test.dart` question above with the user.
2. Start the auth/login feature per `flutter_feature_prompt.md` — first screen in the UI kit flow, first real `GoRoute` builder replacing a `_PlaceholderScreen`.
3. Configure `flutter_launcher_icons` when app-icon polish is prioritized (not blocking feature work).

## Key References

- Approved plan (full design-token mapping table, dependency list, file-by-file plan): `/Users/youssefemadeldin.ai/.claude/plans/read-claude-md-file-and-buzzing-newell.md`
- Foundation spec: `.claude/rules/flutter_scaffold_prompt.md`
- Feature spec (for all future work in `lib/features/`): `.claude/rules/flutter_feature_prompt.md`
- Architecture/engineering rules: `CLAUDE.md`
- Design system source: `doc/design/Oasis Design System/` (tokens, components, UI kit)
- Generated DI config (verify after any `@injectable` change): `lib/core/di/injection_container.config.dart`

## Clarifications & Decisions

| Question | Answer |
|---|---|
| Use real Oasis Design System tokens or CLAUDE.md's generic placeholder palette? | Real Oasis Design System tokens |
| Add `google_fonts` package for Poppins/Inter, or use system default fonts? | Add `google_fonts` (approved new dependency) |
| Include a `register` route in initial `AppRoutes`, even though no sign-up screen exists in the design? | Skip `register` for now — only `splash`/`login`/`home`/`unknown` |
| (mid-session, stated by user, not asked) Is `SnackBarHelper` needed? | No — user deleted it; removed all references and regenerated DI config |
| (mid-session, stated by user) Should design-doc assets be copied into the app? | Yes — copied the two official logo files into `assets/images/` |

## Notes

- `oasis_demo` uses **fvm-pinned Flutter 3.44.8** (`.fvm/fvm_config.json`) — always run `fvm flutter ...` / `fvm dart ...`, not the bare `flutter`/`dart` on PATH (which resolves to 3.41.9 and may behave differently).
- `AuthInterceptor`'s refresh-response parsing assumes a **flat** `{ accessToken, refreshToken }` JSON body, not a `{ success, data }` envelope — this is a deliberate call because the backend doesn't exist yet and the envelope shape is unconfirmed (see marker comment in `api_manager.dart`). Revisit once a real backend contract is known; do not assume envelope-wrapping without checking first.
- `AppColors.secondary` (`#1E3550`, `--navy-600`) has no direct source in the design tokens — the real DS defines no dedicated "secondary" accent, so this was inferred from the dark gradient ramp as the closest brand-identity color. Worth confirming with design if a screen ever needs a true secondary accent.
- All 6 status-badge colors (pending/closed/rejected/processing/invoiced/cancelled) were added to `AppColors` beyond what the rule file's placeholder spec listed, since claims/policies status is core to this app's UX — flagged as a deliberate scope extension, not scope creep.
