import 'package:flutter_screenutil/flutter_screenutil.dart';

/// ScreenUtil-backed spacing scale, matching the Oasis Design System's 4px
/// base scale (4/8/12/16/20/24/32/40/48/64/80).
///
/// Uses `static get` (not `static const`) because `.w`/`.h` read
/// [ScreenUtil]'s initialized instance — evaluating them before
/// `ScreenUtilInit` builds would crash. Only call these from inside a
/// `build()` method or another lazy getter.
///
/// `s*` = horizontal spacing (`.w`), `v*` = vertical spacing (`.h`).
/// No mixed-axis getter — pick the axis at the call site.
class AppSpacing {
  const AppSpacing._();

  static double get s4 => 4.w;
  static double get s8 => 8.w;
  static double get s12 => 12.w;
  static double get s16 => 16.w;
  static double get s20 => 20.w;
  static double get s24 => 24.w;
  static double get s32 => 32.w;
  static double get s40 => 40.w;
  static double get s48 => 48.w;
  static double get s64 => 64.w;
  static double get s80 => 80.w;

  static double get v4 => 4.h;
  static double get v8 => 8.h;
  static double get v12 => 12.h;
  static double get v16 => 16.h;
  static double get v20 => 20.h;
  static double get v24 => 24.h;
  static double get v32 => 32.h;
  static double get v40 => 40.h;
  static double get v48 => 48.h;
  static double get v64 => 64.h;
  static double get v80 => 80.h;
}
