import 'package:tfe_deviceid_app/commons/commons.dart';
import 'package:tfe_deviceid_app/screens/signup/components/signup_form.dart';
import 'package:tfe_deviceid_app/services/controller/device_controller.dart';
import 'package:tfe_deviceid_app/services/models/user_signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class Signup extends StatelessWidget {
  Signup({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  UserSignUp userSignUp = UserSignUp("", "", "", "", "");
  @override
  Widget build(BuildContext context) {
    final DeviceController deviceController = Get.find();
    return Scaffold(
      body: body(context, deviceController),
    );
  }

  body(BuildContext context, DeviceController controller) {
    return SafeArea(
      child: Center(
        child: Obx(
          () => ListView(
            children: [
              showLogo(),
              SizedBox(height: 70),
              showDeviceId(controller.deviceId.value),
              SizedBox(height: 40),
              SignUpForm(
                  formKey: _formKey,
                  userSignUp: userSignUp,
                  context: context,
                  diviseId: controller.deviceId.value),
            ],
          ),
        ),
      ),
    );
  }

  Text showDeviceId(String deviceId) {
    if (deviceId == null || deviceId.isEmpty) {
      return const Text(
        "Pas de numéro. Veuillez redémarrer l'application",
        style: TextStyle(color: dOrange, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      );
    }
    return Text(
      "${deviceId}",
      style: const TextStyle(color: dGreen, fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    );
  }
}
