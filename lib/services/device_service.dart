import 'dart:async';
import 'dart:convert' as convert;
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
import 'package:http/retry.dart';

class DeviceService {
  var baseUrl = "http://localhost:8082/devices/create";
  var dio = Dio();

  void login(UserLogin userLogin) async {
    final response = await dio.post(baseUrl, data: userLogin.toMap());

    if (response.statusCode == 200) {
      print('#### DATA ${response.data} ');
      ResponseDto dto = ResponseDto.fromMap(response.data);
      print('#### DATA ${response.data} ');
    } else {
      print('#### Error ${response.statusCode} ');
    }
  }

  Future<ResponseDto> signUp(UserSignUp userSignUp) async {
    ResponseDto dto = ResponseDto("", "");
    try {
      final response = await dio.post(baseUrl, data: userSignUp.toMap());
      if (response.statusCode == 200) {
        var map = response.data as Map<String, dynamic>;
        dto = ResponseDto.fromMap(map);
        print('#### DATA  ${dto} ');
      }
    } catch (error) {
      if (error is DioError) {
        print('#### Error ${error} ');
      }
    }
    return dto;
  }
}
