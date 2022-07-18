import 'dart:convert';

import 'package:flutter/material.dart';

class ResponseDto {
  String operationStatus;
  String operationMessage;

  ResponseDto(this.operationStatus, this.operationMessage);

  factory ResponseDto.fromJson(String str) =>
      ResponseDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ResponseDto.covertJsonToObject(dynamic json) => ResponseDto(
        json["operationStatus"] == null ? null : json["operationStatus"],
        json["operationMessage"] == null ? null : json["operationMessage"],
      );

  factory ResponseDto.fromMap(Map<String, dynamic> json) => ResponseDto(
        json["operationStatus"] == null ? null : json["operationStatus"],
        json["operationMessage"] == null ? null : json["operationMessage"],
      );
  Map<String, dynamic> toMap() => {
        "operationStatus": operationStatus == null ? null : operationStatus,
        "operationMessage": operationMessage == null ? null : operationMessage,
      };

  @override
  String toString() {
    return "ResponseDto( $operationStatus, $operationMessage )";
  }
}
