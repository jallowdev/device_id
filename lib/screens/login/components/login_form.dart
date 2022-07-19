import 'package:tfe_deviceid_app/commons/commons.dart';
import 'package:tfe_deviceid_app/services/controller/device_controller.dart';
import 'package:tfe_deviceid_app/services/device_service.dart';
import 'package:tfe_deviceid_app/services/models/user_login.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
    required GlobalKey<FormState> formKey,
    required this.userLogin,
    required this.context,
    required this.controller,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final UserLogin userLogin;
  final BuildContext context;
  final DeviceController controller;

  @override
  Widget build(BuildContext context) {
    final DeviceService deviceService = DeviceService();
    FToast fToast = FToast();
    _showToast() {
      Widget toast = Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          color: Colors.greenAccent,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.check),
            SizedBox(
              width: 12.0,
            ),
            Text("This is a Custom Toast"),
          ],
        ),
      );

      fToast.showToast(
        child: toast,
        gravity: ToastGravity.BOTTOM,
        toastDuration: Duration(seconds: 2),
      );

      // Custom Toast Position
      fToast.showToast(
          child: toast,
          toastDuration: Duration(seconds: 2),
          positionedToastBuilder: (context, child) {
            return Positioned(
              child: child,
              top: 16.0,
              left: 16.0,
            );
          });
    }

    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Container(
            width: getInputSizeByType(),
            child: TextFormField(
              decoration: textInputDecoration(
                  'Login', 'votre login', Icon(Icons.account_circle)),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez saisir votre login';
                }
                userLogin.login = value;
                return null;
              },
            ),
            decoration: inputBoxDecorationShaddow(),
          ),
          const SizedBox(height: 10.0),
          Container(
            width: getInputSizeByType(),
            child: TextFormField(
                obscureText: true,
                decoration: textInputDecoration(
                    'Password', 'votre mot de passe', Icon(Icons.lock)),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez saisir votre mot de passe';
                  }
                  userLogin.password = value;
                  return null;
                }),
            decoration: inputBoxDecorationShaddow(),
          ),
          const SizedBox(height: 50.0),
          SizedBox(
            width: getButtonSizeByType(),
            child: FloatingActionButton.extended(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  userLogin.deviceId = controller.deviceId.value;
                  if (GetPlatform.isDesktop) {
                    userLogin.deviceType = 'PC';
                  } else {
                    userLogin.deviceType = 'MOBILE';
                  }
                  print('#### :${userLogin}');
                  deviceService.login(userLogin).then(
                    (value) {
                      if (value.operationMessage.isNotEmpty &&
                          value.operationStatus.isNotEmpty) {
                        print('#### LOGIN DTO :${value}');
                        if (value.operationStatus == 'SUCCESS') {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('${value.operationMessage}'),
                              backgroundColor: dGreen,
                            ),
                          );
                          Get.toNamed('/success');
                        }
                        if (value.operationStatus == 'ERROR') {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('${value.operationMessage}'),
                              backgroundColor: dOrange,
                            ),
                          );
                        }

                        return value;
                      }
                      return value;
                    },
                  );
                }
              },
              label: const Text(
                "Se connecter",
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.w900),
                textAlign: TextAlign.center,
              ),
              icon: const Icon(
                Icons.login,
                color: Colors.white,
              ),
              backgroundColor: dGreen,
            ),
          ),
        ],
      ),
    );
  }
}
