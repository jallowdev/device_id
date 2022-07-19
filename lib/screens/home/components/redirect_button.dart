import 'package:tfe_deviceid_app/commons/commons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RedirectButton extends StatelessWidget {
  const RedirectButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.zero,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: getButtonSizeByType(),
            child: FloatingActionButton.extended(
              onPressed: () => Get.toNamed('/signup'),
              label: const Text(
                "Activation",
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.w900),
                textAlign: TextAlign.center,
              ),
              icon: const Icon(
                Icons.app_registration,
                color: Colors.white,
              ),
              backgroundColor: dGreen,
              heroTag: "SIGNUP",
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          SizedBox(
            width: getButtonSizeByType(),
            child: FloatingActionButton.extended(
              onPressed: () => Get.toNamed('/login'),
              label: const Text(
                "Connexion",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900),
                textAlign: TextAlign.center,
              ),
              icon: const Icon(
                Icons.login_sharp,
              ),
              backgroundColor: dOrange,
              heroTag: "LOGIN",
            ),
          ),
        ],
      ),
    );
  }
}
