import 'dart:convert';
import 'dart:typed_data';
import 'package:asn1lib/asn1lib.dart';
import 'package:crypto/crypto.dart';
import 'package:pointycastle/export.dart';
class GunLicenseCrypto {
  static bool verifySignature({
    required String data,
    required String signature,
    required String publicKeyPem,
  }) {
    try {
      final publicKey = _s17(publicKeyPem);
      final dataBytes = Uint8List.fromList(utf8.encode(data));
      final signatureBytes = base64Decode(signature);
      final signer = RSASigner(SHA256Digest(), '0609608648016503040201');
      signer.init(false, PublicKeyParameter<RSAPublicKey>(publicKey));
      return signer.verifySignature(dataBytes, RSASignature(signatureBytes));
    } catch (_) {
      return false;
    }
  }
  static String generateFingerprint(String appId, String bundleId) {
    final key = utf8.encode('gun_core_salt_v1');
    final data = utf8.encode('$appId:$bundleId');
    final hmacSha256 = Hmac(sha256, key);
    return hmacSha256.convert(data).toString();
  }
  static RSAPublicKey _s17(String pem) {
    final lines = pem
        .split('\n')
        .where(
            (line) => !line.startsWith('-----') && line.trim().isNotEmpty)
        .join();
    final keyBytes = base64Decode(lines);
    final asn1Parser = ASN1Parser(Uint8List.fromList(keyBytes));
    final topSequence = asn1Parser.nextObject() as ASN1Sequence;
    final publicKeyBitString = topSequence.elements[1] as ASN1BitString;
    final publicKeyData = publicKeyBitString.stringValue;
    final start = publicKeyData[0] == 0 ? 1 : 0;
    final cleanData = publicKeyData.sublist(start);
    final publicKeyParser = ASN1Parser(Uint8List.fromList(cleanData));
    final publicKeySequence = publicKeyParser.nextObject() as ASN1Sequence;
    final modulus = publicKeySequence.elements[0] as ASN1Integer;
    final exponent = publicKeySequence.elements[1] as ASN1Integer;
    return RSAPublicKey(modulus.valueAsBigInteger, exponent.valueAsBigInteger);
  }
}