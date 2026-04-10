enum EDeviceOperatingSystem {
  ANDROID,
  IOS,
  UNKNOWN,
}
extension EDeviceOperatingSystemExtension on EDeviceOperatingSystem {
  String get value {
    switch (this) {
      case EDeviceOperatingSystem.ANDROID:
        return "ANDROID";
      case EDeviceOperatingSystem.IOS:
        return "IOS";
      case EDeviceOperatingSystem.UNKNOWN:
        return "UNKNOWN";
    }
  }
  static EDeviceOperatingSystem fromString(String os) {
    switch (os) {
      case "ANDROID":
        return EDeviceOperatingSystem.ANDROID;
      case "IOS":
        return EDeviceOperatingSystem.IOS;
      case "UNKNOWN":
        return EDeviceOperatingSystem.UNKNOWN;
      default:
        throw Exception("Unknown device operating system: $os");
    }
  }
}