// ignore_for_file: file_names, avoid_print

import 'dart:io';

class Connection {
  static Future<bool> isConnected() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
    } on SocketException catch (_) {
      print("Internet not Connected !!!!");
      return false;
    }
    print('last statement of connection');
    return true;
  }
}
