import 'dart:async';
import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';

class ConnectionStatus {
  final Connectivity _connectivity = Connectivity();
  static final ConnectionStatus _connectionStatus =
      ConnectionStatus._internal();
  ConnectionStatus._internal();

  static ConnectionStatus getInstance() => _connectionStatus;
  bool hasConnection = false;

  StreamController connectionChangeController = StreamController.broadcast();

  void initialize() {
    _connectivity.onConnectivityChanged.listen(updateConnectionStatus);
    getConnection();
  }

  Future<void> getConnection() async {
    late ConnectivityResult result;
    try {
      result = await _connectivity.checkConnectivity();
      log('$result');
    } on PlatformException catch (e) {
      log('$e');
    }
    return updateConnectionStatus(result);
  }

  Future<void> updateConnectionStatus(ConnectivityResult result) async {
    if (result == ConnectivityResult.none) {
      hasConnection = false;
    } else {
      hasConnection = true;
    }
  }

  Stream get connectionChange => connectionChangeController.stream;

  void dispose() {
    connectionChangeController.close();
  }
}
