import 'package:tfe_deviceid_app/screens/home/components/not_found_screen.dart';
import 'package:tfe_deviceid_app/screens/home/home.dart';
import 'package:tfe_deviceid_app/screens/login/login.dart';
import 'package:tfe_deviceid_app/screens/signup/signup.dart';
import 'package:tfe_deviceid_app/screens/success/success.dart';
import 'package:tfe_deviceid_app/services/controller/device_provider.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'services/controller/device_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final DeviceController controller = Get.put(DeviceController());
    final DeviceProvider provider = Get.put(DeviceProvider());
    return GetMaterialApp(
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      title: 'Diotali Unique device Id ',
      getPages: AppRoutes.screens,
      unknownRoute: GetPage(
        name: '/not-found',
        page: () => const NoteFoundScreen(),
      ),
      initialRoute: '/',
    );
  }
}

class AppRoutes {
  static final screens = [
    GetPage(name: '/', page: () => Home()),
    GetPage(name: '/login', page: () => Login()),
    GetPage(name: '/signup', page: () => Signup()),
    GetPage(name: '/success', page: () => SuccessLogin()),
  ];
}
