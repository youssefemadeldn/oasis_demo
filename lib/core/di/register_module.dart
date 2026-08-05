import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../network/dio_factory.dart';
import '../router/app_router.dart';

/// Provides every dependency that has no `@injectable`/`@lazySingleton`
/// annotation of its own — third-party types and factory-built instances.
///
/// Construction order (see `flutter_scaffold_prompt.md` edge case #3):
/// FlutterSecureStorage → SecureStorageHelper → `GlobalKey<NavigatorState>` →
/// AppRouter.router (GoRouter) → DioFactory → Dio.
@module
abstract class RegisterModule {
  @lazySingleton
  FlutterSecureStorage get secureStorage => const FlutterSecureStorage();

  @lazySingleton
  Connectivity get connectivity => Connectivity();

  @singleton
  GlobalKey<NavigatorState> get navigatorKey => GlobalKey<NavigatorState>();

  @singleton
  GoRouter router(GlobalKey<NavigatorState> navigatorKey) =>
      AppRouter.router(navigatorKey);

  @singleton
  Dio dio(DioFactory dioFactory) => dioFactory.create();

  @preResolve
  @singleton
  Future<SharedPreferences> get sharedPreferences =>
      SharedPreferences.getInstance();
}
