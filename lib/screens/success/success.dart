import 'package:tfe_deviceid_app/commons/commons.dart';
import 'package:tfe_deviceid_app/screens/home/components/redirect_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class SuccessLogin extends StatelessWidget {
  const SuccessLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: showLogo(),
          ),
          const SizedBox(
            height: 50,
          ),
          const Text(
            "Connexion avec succès ",
            style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 5,
          ),
          const Icon(
            Icons.check_circle,
            color: Colors.green,
            size: 50,
          ),
          const SizedBox(
            height: 30,
          ),
          TextButton(
            onPressed: () => Get.toNamed('/login'),
            child: const Text(
              'Reconnexion',
              style: TextStyle(
                color: dGreen,
              ),
            ),
          ),
        ],
      )),
    );
  }
}
