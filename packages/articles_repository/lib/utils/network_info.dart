import 'package:connectivity_plus/connectivity_plus.dart';

/// Abstract class of NetworkInfo
abstract class NetworkInfo {
  /// Getter with value of connection
  bool get isConnected;
}

/// Implementation of NetworkInfo
class NetworkInfoImpl implements NetworkInfo {
  /// Constructor of NetworkInfo
  const NetworkInfoImpl(this.connectivityResult);

  /// Declaration of connection Checker
  final ConnectivityResult connectivityResult;

  @override
  bool get isConnected =>
      connectivityResult == ConnectivityResult.mobile ||
      connectivityResult == ConnectivityResult.wifi;
}
