// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:dio/dio.dart' as _i361;
import 'package:flutter/material.dart' as _i409;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:go_router/go_router.dart' as _i583;
import 'package:injectable/injectable.dart' as _i526;
import 'package:oasis_demo/core/di/register_module.dart' as _i860;
import 'package:oasis_demo/core/helpers/dialog_helper.dart' as _i150;
import 'package:oasis_demo/core/network/api_manager.dart' as _i345;
import 'package:oasis_demo/core/network/connectivity_helper.dart' as _i104;
import 'package:oasis_demo/core/network/dio_factory.dart' as _i989;
import 'package:oasis_demo/core/storage/secure_storage_helper.dart' as _i16;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.singleton<_i409.GlobalKey<_i409.NavigatorState>>(
      () => registerModule.navigatorKey,
    );
    await gh.singletonAsync<_i460.SharedPreferences>(
      () => registerModule.sharedPreferences,
      preResolve: true,
    );
    gh.lazySingleton<_i558.FlutterSecureStorage>(
      () => registerModule.secureStorage,
    );
    gh.lazySingleton<_i895.Connectivity>(() => registerModule.connectivity);
    gh.lazySingleton<_i16.SecureStorageHelper>(
      () => _i16.SecureStorageHelper(gh<_i558.FlutterSecureStorage>()),
    );
    gh.singleton<_i583.GoRouter>(
      () => registerModule.router(gh<_i409.GlobalKey<_i409.NavigatorState>>()),
    );
    gh.lazySingleton<_i104.ConnectivityHelper>(
      () => _i104.ConnectivityHelper(gh<_i895.Connectivity>()),
    );
    gh.lazySingleton<_i989.DioFactory>(
      () => _i989.DioFactory(
        gh<_i16.SecureStorageHelper>(),
        gh<_i583.GoRouter>(),
      ),
    );
    gh.lazySingleton<_i150.DialogHelper>(
      () => _i150.DialogHelper(gh<_i409.GlobalKey<_i409.NavigatorState>>()),
    );
    gh.singleton<_i361.Dio>(() => registerModule.dio(gh<_i989.DioFactory>()));
    gh.lazySingleton<_i345.ApiManager>(() => _i345.ApiManager(gh<_i361.Dio>()));
    return this;
  }
}

class _$RegisterModule extends _i860.RegisterModule {}
