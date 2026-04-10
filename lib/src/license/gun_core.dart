import 'gun_license_data.dart';
import 'gun_license_validator.dart';
class GunCore {
  static bool _t73 = false;
  static LicenseValidationResult? _u68;
  GunCore._();
  static const String _v69 = '''
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
    final validator = GunLicenseValidator(publicKeyPem: _v69);
    _u68 = validator.validate(licenseKey, appId: appId);
    if (!_u68!.isValid) {
      _t73 = false;
      _w77(_u68!);
    }
    _t73 = true;
  }
  static bool get isInitialized => _t73;
  static GunLicenseData? get currentLicense => _u68?.license;
  static void ensureLicensed() {
    if (!_t73) {
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
    if (!_t73 || _u68?.license == null) return false;
    final features = _u68!.license!.features;
    return features.contains('*') || features.contains(feature);
  }
  static Never _w77(LicenseValidationResult result) {
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