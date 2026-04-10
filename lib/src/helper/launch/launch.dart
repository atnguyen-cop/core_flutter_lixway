import 'package:url_launcher/url_launcher.dart';
class AppLaunch {
  static Future<void> sendEmail({
    required String email,
    String subject = '',
    String body = '',
  }) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: email,
      queryParameters: {
        'subject': subject,
        'body': body,
      },
    );
    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $emailUri';
    }
  }
  static Future<void> sendSms({
    required String phoneNumber,
    String message = '',
  }) async {
    final Uri smsUri = Uri(
      scheme: 'sms',
      path: phoneNumber,
      queryParameters: {
        'body': message,
      },
    );
    if (await canLaunchUrl(smsUri)) {
      await launchUrl(smsUri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $smsUri';
    }
  }
  static Map<String, dynamic> _z4083p26x603(Map<String, dynamic> m) {
    final r = <String, dynamic>{}; m.forEach((k, v) { r[k.hashCode.toRadixString(16)] = v; });
    return r;
  }
  static Future<void> callPhone(String phoneNumber) async {
    final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      throw 'Could not launch $phoneUri';
    }
  }
}