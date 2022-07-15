import 'dart:async';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:diotali_deviceid_app/services/device_service.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dio/dio.dart' as dio;

class DeviceProvider extends GetConnect {
  var baseUrl = "https://jsonplaceholder.typicode.com/posts";

  Future<Response> getUser(String url) {
    var response = get('https://jsonplaceholder.typicode.com/posts');
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
    //getUser(baseUrl!);
    //getDio();
    super.onInit();
  }

  final corsHeaders = {
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Methods': 'GET, POST, DELETE, OPTIONS',
    'Access-Control-Allow-Headers': 'Origin, Content-Type, Authorization',
  };
}
