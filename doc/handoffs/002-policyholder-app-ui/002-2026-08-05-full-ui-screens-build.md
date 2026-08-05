# Session Handoff — 2026-08-05

> **OUT OF PREVIOUS SESSION — NEW SESSION START**
>
> Read this file first. It contains everything from the prior session.

## What Was Done

Built the **entire UI-only layer** of the Oasis Policyholder App on top of the already-complete `lib/core/` foundation (see `doc/handoffs/001-foundation-scaffold/001-2026-08-05-core-infra-scaffold.md`). Source of truth was the fully interactive prototype at `doc/design/Oasis policyholder mobile app/Oasis Policyholder App.dc.html` (not the lighter `ui_kits/mobile-app/*.jsx` files — that prototype is the real spec, with exact mock data, styling, and component behavior).

Scope was explicitly **UI only**: no cubits, no repositories, no network calls. Every screen uses local hardcoded mock data and plain `StatefulWidget`/`setState` for ephemeral UI state (wizard steps, dialog open, switches, FAQ accordion, splash timer). Wiring real cubits/repositories is a distinct future phase.

The full approved plan (design-system widget spec, routing spec, per-screen file list, cross-feature mock-data tradeoff writeup) is preserved at `/Users/youssefemadeldin.ai/.claude/plans/we-need-plan-for-iridescent-hamming.md` — **read that file for full rationale**, this handoff only summarizes outcomes.

- Built a 10-file Oasis Design System widget layer in `lib/core/widgets/` (`DsButton`, `DsCard`, `DsInput`, `DsSelect`, `DsSwitch`, `DsStatusBadge`, `DsTag`, `DsToast`, `DsTopBar`, `DsBottomNav`) plus a hand-painted `DsIcon` set (`icons/ds_icons.dart`) using `CustomPainter`s that replicate the prototype's literal SVG path data pixel-for-pixel (motor/property/medical/document/camera/gallery/bell/checkCircle/home/claims-star/profile).
- Added missing color tokens to `AppColors` that the real dark-header/splash/login/tag screens needed but weren't in the original scaffold pass: `surfaceDark`, `surfaceDarkElevated`, `textOnDark`, `textOnDarkMuted`, `brandSoft`, `brandStrong` — all sourced from `doc/design/Oasis Design System/tokens/colors.css` (`--navy-900`, `--navy-700`, `--text-on-dark`, `--text-on-dark-muted`, `--blue-50`, `--blue-600`).
- Rewrote `app_routes.dart` (added `onboarding`, `notifications`, `policyDetail`, `claims`, `claimDetail`, `submitClaim`, `profile`, `support`) and `app_router.dart` (every route now builds a real screen, no more `_PlaceholderScreen`; kept the null-guard→`_unknown` pattern for *required*-arg routes only — optional-arg routes default gracefully instead, see Clarifications table).
- Added 4 new args classes in `lib/core/router/args/`: `PolicyDetailArgs`, `ClaimDetailArgs` (required), `SubmitClaimArgs`, `ClaimsArgs` (optional, nullable-safe).
- Built all 7 features end-to-end and wired full tap-through navigation between all 12 screens (splash → onboarding → login → home → notifications/policies/claims/profile, policy detail → submit-claim wizard → claims with a success toast, profile → support).
- Populated `assets/translations/en.json` and `assets/translations/ar.json` **fully** (every visible string across all 12 screens) — Profile's "Arabic interface" switch is functionally wired via `context.setLocale(...)`, not decorative. Updated `lib/main.dart`'s `EasyLocalization.supportedLocales` to `[Locale('en'), Locale('ar')]`.
- `flutter analyze` → **0 issues** (fixed two `unnecessary_underscores` lints along the way).
- Confirmed via `grep` that no feature imports another feature directly — all cross-screen navigation goes through `core/router/args/` + route names, as required.
- Attempted to launch the app on **macOS desktop** for a live sanity check (`fvm flutter run -d macos`) — the user immediately flagged this as wrong (app targets iOS/Android per CLAUDE.md, not desktop). Killed the process before it finished building; **no live run was completed this session**. User opted to run it themselves rather than have Claude pick another target.

## Bugs Found

None — this was a build-from-spec session, not a debugging session. No runtime verification has happened yet (see Pending Tasks).

## Files Changed

| File | Change | Why |
|---|---|---|
| `lib/core/theme/app_colors.dart` | Added `surfaceDark`, `surfaceDarkElevated`, `textOnDark`, `textOnDarkMuted`, `brandSoft`, `brandStrong` | Real dark-header/tag/badge tokens missing from the original scaffold pass |
| `lib/core/router/app_routes.dart` | Added 8 new route name constants | New screens |
| `lib/core/router/app_router.dart` | Replaced all `_PlaceholderScreen` entries with real screens; added `UnknownScreen` | Full routing wiring |
| `lib/core/router/args/*.dart` (4 new files) | `PolicyDetailArgs`, `ClaimDetailArgs`, `SubmitClaimArgs`, `ClaimsArgs` | Typed nav args per routing pattern |
| `lib/core/widgets/ds_*.dart` (10 new files) + `icons/ds_icons.dart` | Full DS component layer | Shared across 5-7 features per user decision |
| `lib/main.dart` | `supportedLocales` now includes `Locale('ar')` | Required for Profile's Arabic switch to work |
| `assets/translations/en.json`, `ar.json` | Fully populated, both languages | Every screen string, per CLAUDE.md's no-hardcoded-strings rule |
| `lib/features/auth/presentation/pages/{splash,onboarding,login}_screen.dart` | New | Auth flow |
| `lib/features/home/presentation/pages/home_screen/*.dart` (6 files) | New | Dashboard, folder-structured per screen-complexity rule |
| `lib/features/notifications/presentation/pages/notifications_screen.dart` | New | Notifications inbox |
| `lib/features/policies/presentation/pages/{policies_screen,policy_detail_screen,policies_mock_data}.dart` | New | Policies list + detail |
| `lib/features/claims/presentation/pages/{claims_screen,claim_detail_screen,claims_mock_data}.dart` + `submit_claim_screen/*.dart` (7 files) | New | Claims list, detail, 4-step submit wizard |
| `lib/features/profile/presentation/pages/profile_screen.dart` | New | Settings, Arabic toggle, sign out |
| `lib/features/support/presentation/pages/support_screen.dart` | New | Broker contact + FAQ accordion |

## Files Audited (no changes)

| File | Checked For | Result |
|---|---|---|
| `doc/design/Oasis policyholder mobile app/Oasis Policyholder App.dc.html` | Full screen spec, exact mock data, component behavior | Used as the single source of truth for all 12 screens (629 lines, fully read) |
| `doc/design/Oasis Design System/components/**/*.jsx` | Exact prop shapes/styling for Button, Card, Dialog, StatusBadge, Tag, Toast, Input, Select, Switch, BottomNav, TopBar | Replicated 1:1 in the new `Ds*` widgets |
| `doc/design/Oasis Design System/tokens/{colors,effects}.css` | Radii, shadows, dark-surface/text tokens | Cross-checked against `AppColors`/`AppTheme`, gaps added |
| `lib/core/helpers/bottom_sheet_helper.dart` | Reusable bottom-sheet chrome | Reused as-is for the Submit Claim confirm sheet — no new `DsDialog` widget created |

## Pending Tasks

- [ ] **Run the app on a real target (iOS simulator or Android emulator) and tap through the full flow.** Not done this session — user explicitly deferred to running it themselves. Verification checklist is in the approved plan file's §6: Splash (auto-advances after `kSplashDuration`) → Onboarding → Login → Home → bell → Notifications → back → Policies → Policy Detail → "Submit a Claim on this Policy" (should skip straight to wizard step 2 with the policy preselected) → complete all 4 wizard steps → Confirm → lands on Claims with the green "submitted" toast → tap a claim → Claim Detail (verify the 4-step timeline matches that claim's status exactly) → back → Profile → toggle Arabic switch (verify RTL flips and every string translates, no leftover English) → "Contact your broker" → Support (FAQ accordion expands/collapses, Call/Message buttons fire `tel:`/`mailto:` intents) → Sign Out → back at Login.
- [ ] If anything looks visually off (spacing, a wrong color, an icon mismatch) compared to the `.dc.html` prototype, fix directly against that file as the reference — it's pixel-exact.
- [ ] `test/widget_test.dart` is still the stock Flutter counter smoke test from the original `flutter create` — **pre-existing, not touched this session**, flagged as broken in the prior handoff (pumps `MyApp()` directly with no `configureDependencies()`/`EasyLocalization` ancestor). Still unresolved — needs a decision with the user on whether to fix or replace it.
- [ ] `flutter_launcher_icons` is still installed but unconfigured (also carried over from the prior handoff, not this session's scope).
- [ ] Once UI is confirmed correct, the natural next phase is wiring real cubits/repositories per `flutter_feature_prompt.md` — starting with whichever feature the user prioritizes (auth/login is the natural first candidate since it gates everything else).

## What's Next (ordered)

1. User runs the app on their own device/simulator and reports back anything broken or visually wrong.
2. Fix any reported visual/behavioral bugs against the `.dc.html` prototype.
3. Decide on `test/widget_test.dart` (fix vs. replace) with the user.
4. Start wiring real state management (cubits/repositories) for the first prioritized feature — this UI-only pass's mock data (`*_mock_data.dart` files in each feature) becomes the shape reference for the real API response models.

## Key References

- **Approved build plan (full rationale, DS widget spec, routing spec, per-screen file plan, cross-feature mock-data tradeoff):** `/Users/youssefemadeldin.ai/.claude/plans/we-need-plan-for-iridescent-hamming.md`
- **Design source of truth:** `doc/design/Oasis policyholder mobile app/Oasis Policyholder App.dc.html`
- **Design system components/tokens:** `doc/design/Oasis Design System/`
- **Prior handoff (foundation layer):** `doc/handoffs/001-foundation-scaffold/001-2026-08-05-core-infra-scaffold.md`
- **Architecture rules:** `CLAUDE.md`, `.claude/rules/flutter_feature_prompt.md`, `.claude/rules/flutter_scaffold_prompt.md`

## Clarifications & Decisions

| Question | Answer |
|---|---|
| How should the 12 screens split into `lib/features/`? | 6 named features (auth, home, policies, claims, notifications, profile) — support ended up as its own 7th feature per the next answer |
| Where do shared DS components (Button/Card/Input/etc.) live? | `lib/core/widgets/` as a shared design-system layer |
| How much interactivity should the UI-only screens have? | Fully interactive clone using local widget state only — no cross-screen persistence (a submitted claim will NOT appear in the Claims list after navigating away; that needs a cubit) |
| Add `ar.json` now, or keep EN-only? | Add `ar.json` now, fully translated — Arabic switch in Profile is functional |
| Where does the Support screen live? | Its own full 7th feature folder (`lib/features/support/`), not nested inside profile |
| How to structure the two-screen splash/onboarding flow? | Two separate routes/screens (`AppRoutes.splash`, `AppRoutes.onboarding`). Splash auto-navigates via a `Timer` after 2-3s with zero tap interaction (no "tap to continue"), timer cancelled in `dispose` |

## Notes

- **Cross-feature mock-data duplication is deliberate, not an oversight.** `claims/submit_claim`'s policy picker, `policies`' full list, and `home`'s recent-activity subset each keep their own local mock data because features may never import each other and there's no shared domain/data layer yet in this UI-only pass. Full rationale is in the plan file's "Cross-feature mock-data tradeoff" section — this duplication naturally disappears once a real `PoliciesRepository`/`ClaimsRepository` replaces the mocks.
- `oasis_demo` uses **fvm-pinned Flutter 3.44.8** — always run `fvm flutter ...`, not the bare `flutter`/`dart` on PATH. Confirmed the bare `dart`/`flutter` resolves to a different SDK version (3.11.5) that fails `pub get` against this project's `^3.12.2` constraint.
- Do **not** default to `-d macos` (or any desktop target) for sanity-checking this app — it's an iOS/Android mobile app per CLAUDE.md's Platform & UI Strategy section (Material-everywhere, no Cupertino, but still phone-form-factor only). Ask the user which target they want, or let them run it themselves.
- The `Ds*` widget layer intentionally does not include a `DsDialog` — the existing `BottomSheetHelper.showAppBottomSheet` (from the foundation phase) was reused as-is for the Submit Claim confirmation, avoiding a duplicate component.
