enum EDeviceStatus { ACTIVE, INACTIVE, BLOCKED, DELETE }
extension EDeviceStatusExtension on EDeviceStatus {
  String get value {
    switch (this) {
      case EDeviceStatus.ACTIVE:
        return "ACTIVE";
      case EDeviceStatus.INACTIVE:
        return "INACTIVE";
      case EDeviceStatus.BLOCKED:
        return "BLOCKED";
      case EDeviceStatus.DELETE:
        return "DELETE";
    }
  }
  static EDeviceStatus fromString(String status) {
    switch (status) {
      case "ACTIVE":
        return EDeviceStatus.ACTIVE;
      case "INACTIVE":
        return EDeviceStatus.INACTIVE;
      case "BLOCKED":
        return EDeviceStatus.BLOCKED;
      case "DELETE":
        return EDeviceStatus.DELETE;
      default:
        throw Exception("Unknown device status: $status");
    }
  }
}