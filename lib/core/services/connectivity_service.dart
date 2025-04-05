import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';

class ConnectivityService {
  final Connectivity _connectivity = Connectivity();
  bool _isConnected = false;
  ConnectivityResult _connectionType = ConnectivityResult.none;

  bool get isConnected => _isConnected;
  ConnectivityResult get connectionType => _connectionType;

  Future<void> checkConnection() async {
    try {
      final result = await _connectivity.checkConnectivity();
      _updateConnectionStatus(result);
    } catch (e) {
      debugPrint('Error checking connectivity: $e');
    }
  }

  void _updateConnectionStatus(ConnectivityResult result) {
    _connectionType = result;
    _isConnected = result != ConnectivityResult.none;
  }

  Future<bool> waitForConnection({Duration timeout = const Duration(seconds: 30)}) async {
    final startTime = DateTime.now();
    
    while (DateTime.now().difference(startTime) < timeout) {
      final result = await _connectivity.checkConnectivity();
      if (result != ConnectivityResult.none) {
        _updateConnectionStatus(result);
        return true;
      }
      await Future.delayed(const Duration(seconds: 1));
    }
    
    return false;
  }

  Stream<ConnectivityResult> get onConnectivityChanged {
    return _connectivity.onConnectivityChanged;
  }

  Future<ConnectivityResult> getConnectivityResult() async {
    return await _connectivity.checkConnectivity();
  }

  bool isWifiConnected() {
    return _connectionType == ConnectivityResult.wifi;
  }

  bool isMobileConnected() {
    return _connectionType == ConnectivityResult.mobile;
  }

  bool isEthernetConnected() {
    return _connectionType == ConnectivityResult.ethernet;
  }

  bool isBluetoothConnected() {
    return _connectionType == ConnectivityResult.bluetooth;
  }

  bool isVpnConnected() {
    return _connectionType == ConnectivityResult.vpn;
  }

  bool isOtherConnected() {
    return _connectionType == ConnectivityResult.other;
  }
} 