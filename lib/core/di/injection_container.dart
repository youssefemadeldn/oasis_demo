import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection_container.config.dart';

final GetIt getIt = GetIt.instance;

/// No manual registrations — every dependency, including
/// `FlutterSecureStorage` and `GlobalKey<NavigatorState>`, is provided by
/// [RegisterModule]. The generated `init()` handles all
/// `@injectable`/`@lazySingleton`/`@singleton` classes and `@module`
/// providers automatically.
@InjectableInit()
Future<void> configureDependencies() => getIt.init();
