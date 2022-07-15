import 'dart:async';
import 'dart:convert';
import 'dart:developer' as developer;
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:diotali_deviceid_app/services/models/response_dto.dart';
import 'package:diotali_deviceid_app/services/models/user_login.dart';
import 'package:diotali_deviceid_app/services/models/user_signup.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class DeviceService {
  var baseUrl = "http://localhost:8082/devices/create";
  var dio = Dio();

  void login(UserLogin userLogin) async {
    final response = await dio.post(baseUrl, data: userLogin.toMap());

    if (response.statusCode == 200) {
      print('#### DATA ${response.data} ');
      ResponseDto dto = ResponseDto.fromJson(response.data);
      print('#### DATA ${response.data} ');
    } else {
      print('#### Error ${response.statusCode} ');
    }
  }

  void signUp(UserSignUp userSignUp) async {
    try {
      final response = await dio.post(baseUrl, data: userSignUp.toMap());
      if (response.statusCode == 200) {
        print('#### DATA ${response.data} ');
        var jsonResponse = jsonDecode(response.data) as Map<String, dynamic>;
        ResponseDto dto = ResponseDto.fromMap(jsonResponse);
        print('#### DTO ${dto} ');
      }
    } catch (error) {
      if (error is DioError) {
        print('#### Error ${error} ');
      }
    }
  }
}
