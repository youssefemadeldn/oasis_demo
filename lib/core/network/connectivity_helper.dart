import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';

/// Wraps `connectivity_plus` behind a simple bool/stream API.
@lazySingleton
class ConnectivityHelper {
  final Connectivity _connectivity;

  ConnectivityHelper(this._connectivity);

  Future<bool> isConnected() async {
    final result = await _connectivity.checkConnectivity();
    return _hasConnection(result);
  }

  Stream<bool> get connectivityStream =>
      _connectivity.onConnectivityChanged.map(_hasConnection);

  bool _hasConnection(List<ConnectivityResult> results) =>
      results.any((r) => r != ConnectivityResult.none);
}
