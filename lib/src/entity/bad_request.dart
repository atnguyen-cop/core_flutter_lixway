import 'dart:convert';
BadRequest badRequestFromJson(String str) => BadRequest.fromJson(json.decode(str));
String badRequestToJson(BadRequest data) => json.encode(data.toJson());
class BadRequest {
  List<String> message;
  int statusCode;
  String status;
  BadRequest({
    required this.message,
    required this.statusCode,
    required this.status,
  });
  factory BadRequest.fromJson(Map<String, dynamic> json) => BadRequest(
    message: List<String>.from(json["message"].map((x) => x)),
    statusCode: json["statusCode"],
    status: json["status"],
  );
  Map<String, dynamic> toJson() => {
    "message": List<dynamic>.from(message.map((x) => x)),
    "statusCode": statusCode,
    "status": status,
  };
}