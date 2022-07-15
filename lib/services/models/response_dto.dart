import 'dart:convert';

class ResponseDto {
  final String operationStatus;
  final String operationMessage;

  ResponseDto(this.operationStatus, this.operationMessage);

  factory ResponseDto.fromJson(String str) =>
      ResponseDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ResponseDto.fromMap(Map<String, dynamic> json) => ResponseDto(
        json["operationMessage"] == null ? null : json["operationMessage"],
        json["operationMessage"] == null ? null : json["operationMessage"],
      );
  Map<String, dynamic> toMap() => {
        "operationMessage": operationMessage == null ? null : operationMessage,
        "operationMessage": operationMessage == null ? null : operationMessage,
      };
}
