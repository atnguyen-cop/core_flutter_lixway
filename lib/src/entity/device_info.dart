import 'package:gun_core_flutter/gun_core_flutter.dart';
class DeviceInfo {
  DeviceInfo({
    required this.deviceId,
    required this.deviceName,
    this.deviceModel = "Unknown",
    required this.deviceVersion,
    required this.operatingSystem,
    required this.operatingSystemVersion,
    this.sdkVersion,
    this.physicalRamSize,
    this.availableRamSize,
    required this.deviceModelName,
    required this.deviceMachine,
    required this.versionRelease,
  });
  final String deviceId;
  final String deviceName;
  final String deviceModel;
  final String deviceVersion;
  final EDeviceOperatingSystem operatingSystem;
  final String operatingSystemVersion;
  final String? sdkVersion;
  final int? physicalRamSize;
  final int? availableRamSize;
  final String deviceModelName;
  final String deviceMachine;
  final String versionRelease;
}