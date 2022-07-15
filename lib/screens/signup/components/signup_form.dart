import 'package:diotali_deviceid_app/commons/commons.dart';
import 'package:diotali_deviceid_app/services/device_service.dart';
import 'package:diotali_deviceid_app/services/models/user_login.dart';
import 'package:diotali_deviceid_app/services/models/user_signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    Key? key,
    required GlobalKey<FormState> formKey,
    required this.userSignUp,
    required this.context,
    required this.diviseId,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final UserSignUp userSignUp;
  final BuildContext context;
  final String diviseId;

  @override
  Widget build(BuildContext context) {
    final DeviceService service = DeviceService();
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Container(
            width: inputSize,
            child: TextFormField(
              decoration: textInputDecoration(
                  'Login agent', 'son login', Icon(Icons.account_circle)),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Veuillez saisir le login de l'agent";
                }
                userSignUp.ownerLogin = value;
                return null;
              },
            ),
            decoration: inputBoxDecorationShaddow(),
          ),
          const SizedBox(height: 10.0),
          Container(
            width: inputSize,
            child: TextFormField(
              decoration: textInputDecoration(
                  'Login', 'votre login', Icon(Icons.account_circle)),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez saisir votre login';
                }
                userSignUp.login = value;
                return null;
              },
            ),
            decoration: inputBoxDecorationShaddow(),
          ),
          const SizedBox(height: 10.0),
          Container(
            width: inputSize,
            child: TextFormField(
                obscureText: true,
                decoration: textInputDecoration(
                    'Password', 'votre mot de passe', Icon(Icons.lock)),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez saisir votre mot de passe';
                  }
                  userSignUp.password = value;
                  return null;
                }),
            decoration: inputBoxDecorationShaddow(),
          ),
          const SizedBox(height: 50.0),
          SizedBox(
            width: getButtonSizeByType() + 30,
            child: FloatingActionButton.extended(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  userSignUp.deviceId = diviseId;
                  if (GetPlatform.isDesktop) {
                    userSignUp.deviceType = 'PC';
                  } else {
                    userSignUp.deviceType = 'MOBILE';
                  }
                  service.signUp(userSignUp);
                  print('#### SIGNUP :${userSignUp}');
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Validation en cours'),
                      backgroundColor: dGreen,
                    ),
                  );
                }
              },
              label: const Text(
                "S'inscrire",
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
          TextButton(
            onPressed: () => Get.toNamed('/login'),
            child: const Text(
              'Login',
              style: TextStyle(
                color: dGreen,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
