import 'dart:convert';

ResponseEntity responseEntityFromJson(String str) =>
    ResponseEntity.fromJson(json.decode(str));

String responseEntityToJson(ResponseEntity data) => json.encode(data.toJson());

class ResponseEntity {
  int statusCode;
  String message;

  ResponseEntity({
    required this.statusCode,
    required this.message,
  });

  factory ResponseEntity.fromJson(Map<String, dynamic> json) => ResponseEntity(
        statusCode: json["statusCode"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "message": message,
      };
}
