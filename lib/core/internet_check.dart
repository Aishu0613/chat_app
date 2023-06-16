import 'dart:async';
import 'package:data_connection_checker/data_connection_checker.dart';

class InternetChecker {
   static StreamSubscription<DataConnectionStatus> mListener;

  static checkInternet() async {
    mListener = DataConnectionChecker().onStatusChange.listen((status) {
      switch (status) {
        case DataConnectionStatus.connected:
          break;
        case DataConnectionStatus.disconnected:
          break;
      }
    });

    return await DataConnectionChecker().connectionStatus;
  }
}