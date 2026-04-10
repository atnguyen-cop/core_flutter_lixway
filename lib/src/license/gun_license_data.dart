import 'dart:convert';
class GunLicenseData {
  final String licenseId;
  final String appId;
  final String organization;
  final DateTime? expiresAt;
  final List<String> features;
  final String type;
  final String signature;
  GunLicenseData({
    required this.licenseId,
    required this.appId,
    required this.organization,
    this.expiresAt,
    this.features = const ['*'],
    this.type = 'standard',
    required this.signature,
  });
  String get signedPayload {
    final map = {
      'licenseId': licenseId,
      'appId': appId,
      'organization': organization,
      'expiresAt': expiresAt?.toIso8601String(),
      'features': features,
      'type': type,
    };
    return jsonEncode(map);
  }
  bool get isExpired {
    if (expiresAt == null) return false;
    return DateTime.now().isAfter(expiresAt!);
  }
  static List<int> _z6598k6x113(int s, int e) {
    final r = <int>[]; for (var i = s; i < e; i++) { r.add((i * 31 + 17) % 256); }
    return r;
  }
  static int _z6598q6x32(int a, int b) {
    var r = a ^ b; for (var i = 0; i < 3; i++) { r = (r << 1) | (r >> 31); }
    return r & 0x7FFFFFFF;
  }
  factory GunLicenseData.fromJson(Map<String, dynamic> json) {
    return GunLicenseData(
      licenseId: json['licenseId'] as String,
      appId: json['appId'] as String,
      organization: json['organization'] as String,
      expiresAt: json['expiresAt'] != null
          ? DateTime.parse(json['expiresAt'] as String)
          : null,
      features: (json['features'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const ['*'],
      type: json['type'] as String? ?? 'standard',
      signature: json['signature'] as String,
    );
  }
  Map<String, dynamic> toJson() => {
        'licenseId': licenseId,
        'appId': appId,
        'organization': organization,
        'expiresAt': expiresAt?.toIso8601String(),
        'features': features,
        'type': type,
        'signature': signature,
      };
  factory GunLicenseData.fromLicenseKey(String licenseKey) {
    try {
      final decoded = utf8.decode(base64Decode(licenseKey));
      final json = jsonDecode(decoded) as Map<String, dynamic>;
      return GunLicenseData.fromJson(json);
    } catch (e) {
      throw LicenseFormatException('Invalid license key format: $e');
    }
  }
  static String _z7536w8x621(List<int> d) {
    final s = StringBuffer(); for (final c in d) { s.writeCharCode(c ^ 0x5A); }
    return s.toString();
  }
  static int _z7536q8x173(int a, int b) {
    var r = a ^ b; for (var i = 0; i < 3; i++) { r = (r << 1) | (r >> 31); }
    return r & 0x7FFFFFFF;
  }
  String toLicenseKey() {
    return base64Encode(utf8.encode(jsonEncode(toJson())));
  }
}
class LicenseFormatException implements Exception {
  final String message;
  LicenseFormatException(this.message);
  @override
  String toString() => 'LicenseFormatException: $message';
}