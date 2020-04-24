import 'dart:async';
import 'dart:io';

import 'package:connectivity/connectivity.dart';

enum ConnectionStatus { CONNECTED, DISCONNECTED }

StreamController<ConnectionStatus> connectivityStatus =
    StreamController<ConnectionStatus>();
Stream onInternetStatusChanged = connectivityStatus.stream;
ConnectionStatus _lastConnectionType;

void startInternetChecker() {
  Connectivity().onConnectivityChanged.listen((connectionType) => {
        print("cccccccc" + connectionType.toString()),
        if (connectionType == ConnectivityResult.mobile ||
            connectionType == ConnectivityResult.wifi)
          {_checkInternetConnectivity()}
        else if (connectionType == ConnectivityResult.none)
          {
            _lastConnectionType = ConnectionStatus.DISCONNECTED,
            {connectivityStatus.add(ConnectionStatus.DISCONNECTED)},
          }
      });
}

_checkInternetConnectivity() async {
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      if (_lastConnectionType != ConnectionStatus.CONNECTED)
        connectivityStatus.add(ConnectionStatus.CONNECTED);

      _lastConnectionType = ConnectionStatus.CONNECTED;
    }
  } on SocketException catch (_) {
    connectivityStatus.add(ConnectionStatus.DISCONNECTED);

    _lastConnectionType = ConnectionStatus.DISCONNECTED;
  }
}
