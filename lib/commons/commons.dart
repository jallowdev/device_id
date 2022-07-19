import 'package:flutter/material.dart';
import 'package:get/get.dart';

const dGreen = Color(0xFF1aaaac);
const dOrange = Color(0xFFf06f2f);
const buttonSize = 220.0;
const inputSize = 400.0;

const BASE_URL = 'http://localhost:8082/devices';

double getButtonSizeByType() {
  if (GetPlatform.isMobile) {
    return buttonSize - 50;
  } else {
    return buttonSize;
  }
}

double getInputSizeByType() {
  if (GetPlatform.isMobile) {
    return inputSize - 50;
  } else {
    return inputSize;
  }
}

SizedBox showLogo() {
  return const SizedBox(
    height: 200,
    child: Image(
      image: AssetImage("assets/images/diotali-icon.png"),
      height: 170,
    ),
  );
}

InputDecoration textInputDecoration(
    String labelText, String hintText, Widget prefixIcon) {
  return InputDecoration(
    labelText: labelText,
    hintText: hintText,
    fillColor: Colors.white,
    filled: true,
    prefixIcon: prefixIcon,
    contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(100.0),
        borderSide: const BorderSide(color: Colors.grey)),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(100.0),
        borderSide: BorderSide(color: Colors.grey.shade400)),
    errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(100.0),
        borderSide: const BorderSide(color: Colors.red, width: 2.0)),
    focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(100.0),
        borderSide: const BorderSide(color: Colors.red, width: 2.0)),
  );
}

BoxDecoration inputBoxDecorationShaddow() {
  return BoxDecoration(boxShadow: [
    BoxShadow(
      color: Colors.black.withOpacity(0.1),
      blurRadius: 20,
      offset: const Offset(0, 5),
    )
  ]);
}
