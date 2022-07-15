import 'package:diotali_deviceid_app/commons/commons.dart';
import 'package:diotali_deviceid_app/services/models/user_login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
    required GlobalKey<FormState> formKey,
    required this.userLogin,
    required this.context,
    required this.diviseId,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final UserLogin userLogin;
  final BuildContext context;
  final String diviseId;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Container(
            width: inputSize,
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
            width: inputSize,
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
            width: getButtonSizeByType() + 30,
            child: FloatingActionButton.extended(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  userLogin.deviceId = diviseId;
                  if (GetPlatform.isDesktop) {
                    userLogin.deviceType = 'PC';
                  } else {
                    userLogin.deviceType = 'MOBILE';
                  }
                  print('#### :${userLogin}');
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Connexion en cours'),
                      backgroundColor: dGreen,
                    ),
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
          TextButton(
            onPressed: () => Get.toNamed('/signup'),
            child: const Text(
              "Inscription",
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
