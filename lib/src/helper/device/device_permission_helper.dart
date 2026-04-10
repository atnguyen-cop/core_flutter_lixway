import 'dart:io';
import 'package:permission_handler/permission_handler.dart';
class DevicePermissionHelper {
  static List<Permission> permissionsInitial() {
    if (Platform.isIOS) {
      return [
        Permission.photos,
        Permission.camera,
        Permission.contacts,
        Permission.notification,
        Permission.calendarFullAccess,
      ];
    }
    return [
      Permission.photos,
      Permission.videos,
      Permission.camera,
      Permission.contacts,
      Permission.notification,
      Permission.calendarFullAccess,
      Permission.manageExternalStorage,
    ];
  }
}