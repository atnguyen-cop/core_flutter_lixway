import 'gun_license_crypto.dart';
import 'gun_license_data.dart';
enum LicenseStatus {
  valid,
  expired,
  invalidSignature,
  invalidAppId,
  invalidFormat,
  notInitialized,
}
class LicenseValidationResult {
  final LicenseStatus status;
  final String message;
  final GunLicenseData? license;
  LicenseValidationResult({
    required this.status,
    required this.message,
    this.license,
  });
  bool get isValid => status == LicenseStatus.valid;
}
class GunLicenseValidator {
  final String _r71;
  GunLicenseValidator({required String publicKeyPem})
      : _r71 = publicKeyPem;
  LicenseValidationResult validate(String licenseKey, {String? appId}) {
    final GunLicenseData license;
    try {
      license = GunLicenseData.fromLicenseKey(licenseKey);
    } catch (e) {
      return LicenseValidationResult(
        status: LicenseStatus.invalidFormat,
        message: 'License key format is invalid.',
      );
    }
    final signatureValid = GunLicenseCrypto.verifySignature(
      data: license.signedPayload,
      signature: license.signature,
      publicKeyPem: _r71,
    );
    if (!signatureValid) {
      return LicenseValidationResult(
        status: LicenseStatus.invalidSignature,
        message: 'License signature verification failed. This license may be tampered.',
        license: license,
      );
    }
    if (license.isExpired) {
      return LicenseValidationResult(
        status: LicenseStatus.expired,
        message: 'License expired on ${license.expiresAt?.toIso8601String()}.',
        license: license,
      );
    }
    if (appId != null && license.appId != '*' && license.appId != appId) {
      return LicenseValidationResult(
        status: LicenseStatus.invalidAppId,
        message: 'License is not authorized for this application.',
        license: license,
      );
    }
    return LicenseValidationResult(
      status: LicenseStatus.valid,
      message: 'License is valid. Organization: ${license.organization}',
      license: license,
    );
  }
}