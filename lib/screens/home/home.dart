import 'dart:io';
import 'package:tfe_deviceid_app/commons/commons.dart';
import 'package:tfe_deviceid_app/screens/home/components/redirect_button.dart';
import 'package:tfe_deviceid_app/services/controller/device_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DeviceController deviceController = Get.find();
    return Scaffold(
      body: body(context, deviceController),
    );
  }

  SafeArea body(BuildContext context, DeviceController controller) {
    return SafeArea(
      child: Obx(
        () => Column(
          children: [
            showLogo(),
            SizedBox(height: 80),
            showTitle(),
            SizedBox(height: 20),
            Text(
              "${controller.deviceId}",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 120),
            RedirectButton(),
          ],
        ),
      ),
    );
  }

  showTitle() {
    return SelectableText(
      GetPlatform.isAndroid
          ? 'Android numéro unique '
          : GetPlatform.isIOS
              ? 'IOS numéro unique '
              : GetPlatform.isLinux
                  ? 'Linux numéro unique '
                  : GetPlatform.isMacOS
                      ? 'MacOS numéro unique '
                      : GetPlatform.isWindows
                          ? 'Windows numéro unique '
                          : '',
      style: const TextStyle(
          color: dGreen, fontSize: 20, fontWeight: FontWeight.bold),
    );
  }
}
