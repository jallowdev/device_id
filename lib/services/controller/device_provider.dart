import 'dart:async';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:tfe_deviceid_app/services/device_service.dart';
import 'package:tfe_deviceid_app/services/models/user_signup.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dio/dio.dart' as dio;

class DeviceProvider extends GetConnect {
  var baseUrl = "https://jsonplaceholder.typicode.com/posts";
  var baseUrl1 = "http://localhost:8082/devices/create";
  Future<Response> saveUser(UserSignUp user) {
    var response = post(baseUrl1, user.toMap());
    response.then((value) {
      if (value.statusCode == 200) {
        print('#### Values ${value.body} ');
      } else {
        print('#### Error ${value.statusCode} ');
      }
    });
    return response;
  }

  @override
  void onInit() {
    httpClient.baseUrl = baseUrl;
    //save(baseUrl!);
    //getDio();
    super.onInit();
  }

  final corsHeaders = {
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Methods': 'GET, POST, DELETE, OPTIONS',
    'Access-Control-Allow-Headers': 'Origin, Content-Type, Authorization',
  };
}
