import 'dart:async';
import 'dart:convert' as convert;
import 'dart:developer' as developer;
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:tfe_deviceid_app/commons/commons.dart';
import 'package:tfe_deviceid_app/services/models/response_dto.dart';
import 'package:tfe_deviceid_app/services/models/user_login.dart';
import 'package:tfe_deviceid_app/services/models/user_signup.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class DeviceService {
  var dio = Dio();

  Future<ResponseDto> login(UserLogin userLogin) async {
    ResponseDto dto = ResponseDto("", "");
    try {
      final response =
          await dio.post(BASE_URL + "/session", data: userLogin.toMap());
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

  Future<ResponseDto> signUp(UserSignUp userSignUp) async {
    ResponseDto dto = ResponseDto("", "");
    try {
      final response =
          await dio.post(BASE_URL + "/create", data: userSignUp.toMap());
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
