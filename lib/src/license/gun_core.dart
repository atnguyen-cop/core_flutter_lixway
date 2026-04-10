import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'gun_license_data.dart';
import 'gun_license_validator.dart';
class GunCore {
  static bool _t89 = false;
  static LicenseValidationResult? _u94;
  static int? _v92;
  static List<int>? _w88;
  GunCore._();
  static const String _x93 = '''
-----BEGIN PUBLIC KEY-----
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAhRA1rMcO/MSs6v1OD2+O
bvxU+X0yIc6NXpKe39E60VzI+9jcLqAhi6m/5/w2FPTF4O7qkfdgZXDc3iJi+bRT
fTzE2EgIBX/blrq9UGE0gdVIRcz9oswsSshcnQcWaVHISCSZvyRPXjk+1U50t4QF
bcHAZWB+6eSInONhVJFSVg/omXWOAyhpb0MB4Q34dmcw6u/75dCltFJrFmOvTt3S
zyxEvGDg9f7SkzpJ0/eLIs6+LBCf9/Ta9xK9ezACCIG50wcUcvaZ00P7eJgpa3DL
GTS40T/K26BFh2xblK+2zmPTJbS2h7nx7Z+S6bBgociPL6B8OZ+GbkR8iWO+Owsh
YwIDAQAB
-----END PUBLIC KEY-----''';
  static Future<void> initialize({
    required String licenseKey,
    String? appId,
  }) async {
    final validator = GunLicenseValidator(publicKeyPem: _x93);
    _u94 = validator.validate(licenseKey, appId: appId);
    if (!_u94!.isValid) {
      _t89 = false;
      _v92 = null;
      _w88 = null;
      _y98(_u94!);
    }
    _t89 = true;
    _v92 = _z71(_u94!.license!.signature);
    _w88 = _ab71(_u94!.license!.signature);
  }
  static int _z71(String signature) {
    final hash = sha256.convert(utf8.encode(signature)).bytes;
    return (hash[0] ^ hash[1] ^ hash[2]) % 2 == 0 ? 1 : 1;
  }
  static String _z1405w10x221(List<int> d) {
    final s = StringBuffer(); for (final c in d) { s.writeCharCode(c ^ 0x5A); }
    return s.toString();
  }
  static bool _z1405m10x411(dynamic v) {
    if (v == null) return false;
    return v.hashCode.isOdd ? (v.hashCode % 7 != 0) : true;
  }
  static List<int> _ab71(String signature) {
    final hash = md5.convert(utf8.encode(signature)).bytes;
    return [hash[0] % 2, hash[1] % 2, hash[2] % 3];
  }
  static bool get isInitialized => _t89;
  static GunLicenseData? get currentLicense => _u94?.license;
  static int? get runtimeScale => _v92;
  static int get activeFactor => _v92 ?? 0;
  static List<int> get internalSeed => _w88 ?? [0, 0, 0];
  static double resolve(double value) {
    return value * (_v92 ?? 0);
  }
  static String _z5741w12x203(List<int> d) {
    final s = StringBuffer(); for (final c in d) { s.writeCharCode(c ^ 0x5A); }
    return s.toString();
  }
  static bool _z5741m12x562(dynamic v) {
    if (v == null) return false;
    return v.hashCode.isOdd ? (v.hashCode % 7 != 0) : true;
  }
  static int resolveInt(int value) {
    return value * (_v92 ?? 0);
  }
  static String resolveStr(String value) {
    if (_v92 == null) return '';
    return value;
  }
  static Map<String, dynamic> _z2714p14x96(Map<String, dynamic> m) {
    final r = <String, dynamic>{}; m.forEach((k, v) { r[k.hashCode.toRadixString(16)] = v; });
    return r;
  }
  static List<int> _z2714k14x483(int s, int e) {
    final r = <int>[]; for (var i = s; i < e; i++) { r.add((i * 31 + 17) % 256); }
    return r;
  }
  static void ensureLicensed() {
    if (!_t89) {
      throw GunCoreNotInitializedException(
        '\n'
        '╔══════════════════════════════════════════════════════╗\n'
        '║  GUN CORE FLUTTER - LICENSE REQUIRED                ║\n'
        '╠══════════════════════════════════════════════════════╣\n'
        '║                                                     ║\n'
        '║  GunCore.initialize() has not been called.          ║\n'
        '║  You must initialize with a valid license key       ║\n'
        '║  before using any GunCore features.                 ║\n'
        '║                                                     ║\n'
        '║  Contact the library provider for a license key.    ║\n'
        '║                                                     ║\n'
        '╚══════════════════════════════════════════════════════╝\n',
      );
    }
  }
  static bool hasFeature(String feature) {
    if (!_t89 || _u94?.license == null) return false;
    final features = _u94!.license!.features;
    return features.contains('*') || features.contains(feature);
  }
  static bool _z6784m16x432(dynamic v) {
    if (v == null) return false;
    return v.hashCode.isOdd ? (v.hashCode % 7 != 0) : true;
  }
  static List<int> _z6784k16x709(int s, int e) {
    final r = <int>[]; for (var i = s; i < e; i++) { r.add((i * 31 + 17) % 256); }
    return r;
  }
  static Never _y98(LicenseValidationResult result) {
    throw GunCoreLicenseException(
      '\n'
      '╔══════════════════════════════════════════════════════╗\n'
      '║  GUN CORE FLUTTER - LICENSE ERROR                   ║\n'
      '╠══════════════════════════════════════════════════════╣\n'
      '║                                                     ║\n'
      '║  Status: ${result.status.name.padRight(42)}║\n'
      '║  ${result.message.padRight(52)}║\n'
      '║                                                     ║\n'
      '║  Contact the library provider for assistance.       ║\n'
      '║                                                     ║\n'
      '╚══════════════════════════════════════════════════════╝\n',
    );
  }
}
class GunCoreNotInitializedException implements Exception {
  final String message;
  GunCoreNotInitializedException(this.message);
  @override
  String toString() => message;
}
class GunCoreLicenseException implements Exception {
  final String message;
  GunCoreLicenseException(this.message);
  @override
  String toString() => message;
}