import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:crossroad/common/widgets/loaders/app_loaders.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class NetworkManager extends GetxController {
  static NetworkManager get instance => Get.find();

  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;
  final Rx<ConnectivityResult> _connectionStatus = ConnectivityResult.none.obs;

  @override
  void onInit() {
    super.onInit();

    // Listen to the stream of List<ConnectivityResult>
    _connectivitySubscription = _connectivity.onConnectivityChanged
        .listen((List<ConnectivityResult> results) {
      _updateConnectivityStatus(results);
    });
  }

  Future<void> _updateConnectivityStatus(
      List<ConnectivityResult> results) async {
    // If there are any results, take the first one (or handle multiple)
    if (results.isNotEmpty) {
      _connectionStatus.value =
          results.first; // Choose the first result for simplicity
    } else {
      _connectionStatus.value = ConnectivityResult.none;
    }

    // Optional: Print or handle connectivity changes
    if (_connectionStatus.value == ConnectivityResult.none) {
      AppLoaders.warringSnackbar(title: 'No Internet connection');
    }
  }

  Future<bool> isConnectedFunction() async {
    try {
      final result = await _connectivity.checkConnectivity();
      return result != ConnectivityResult.none;
    } on PlatformException catch (_) {
      return false;
    }
  }
}
