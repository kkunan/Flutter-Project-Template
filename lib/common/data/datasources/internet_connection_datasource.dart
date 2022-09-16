

import 'package:connectivity_plus/connectivity_plus.dart';

abstract class InternetConnectionDatasource {
  Future<bool> isConnected();
}

class ConnectivityPlusInternetConnectionDatasource implements InternetConnectionDatasource {
  static final connectedTypes = [
    ConnectivityResult.ethernet, ConnectivityResult.mobile, ConnectivityResult.wifi
  ];

  final Connectivity _connectivity;
  ConnectivityPlusInternetConnectionDatasource(this._connectivity);

  @override
  Future<bool> isConnected() async{
    final connectivity = await _connectivity.checkConnectivity();
    return connectedTypes.contains(connectivity);
  }
}