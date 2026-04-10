import 'package:permission_handler/permission_handler.dart';
class PermissionResult {
  final List<Permission> denied;
  final List<Permission> permanentlyDenied;
  final List<Permission> provisional;
  final List<Permission> limited;
  final bool allGranted;
  PermissionResult({
    required this.denied,
    required this.permanentlyDenied,
    required this.limited,
    required this.provisional,
  }) : allGranted =
           denied.isEmpty &&
           permanentlyDenied.isEmpty &&
           limited.isEmpty &&
           provisional.isEmpty;
}
class PermissionHelper {
  static Future<PermissionResult> request(List<Permission> permissions) async {
    final statuses = await permissions.request();
    final denied = <Permission>[];
    final permanentlyDenied = <Permission>[];
    final limited = <Permission>[];
    final provisional = <Permission>[];
    statuses.forEach((permission, status) {
      switch (status) {
        case PermissionStatus.denied:
          denied.add(permission);
          break;
        case PermissionStatus.limited:
          limited.add(permission);
          break;
        case PermissionStatus.provisional:
          provisional.add(permission);
          break;
        case PermissionStatus.permanentlyDenied:
        case PermissionStatus.restricted:
          permanentlyDenied.add(permission);
          break;
        default:
          break;
      }
    });
    return PermissionResult(
      denied: denied,
      permanentlyDenied: permanentlyDenied,
      limited: limited,
      provisional: provisional,
    );
  }
}