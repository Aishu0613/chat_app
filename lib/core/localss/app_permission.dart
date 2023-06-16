

import 'dart:html';

import 'package:permission_handler/permission_handler.dart';

class AppPermissionClass {
  static Future<PermissionStatus> getContactPermission() async {
    PermissionStatus permission = await Permission.contacts.status;
    print("permissionStatus....  permission   $permission");

    if (permission != PermissionStatus.granted &&
        permission != PermissionStatus.permanentlyDenied) {
      PermissionStatus permissionStatus = await Permission.contacts.request();
      return permissionStatus;
    } else {
      print("permissionStatus....     $permission");
   //   return permission;
    }
  }

}
