import 'package:device_info_plus/device_info_plus.dart';
import 'package:tfe_deviceid_app/services/device_service.dart';
import 'package:tfe_deviceid_app/services/models/response_dto.dart';
import 'package:tfe_deviceid_app/services/models/user_login.dart';
import 'package:tfe_deviceid_app/services/models/user_signup.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class DeviceController extends GetxController {
  DeviceService service = DeviceService();
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  RxString deviceId = "".obs;
  late FToast fToast;

  @override
  void onInit() {
    getDeviceId();
    super.onInit();
  }

  ResponseDto signUp(UserSignUp signUp) {
    ResponseDto dto = ResponseDto("", "");
    service.signUp(signUp).then((value) {
      dto = value;
    });
    return dto;
  }

  getDeviceId() async {
    if (GetPlatform.isMacOS) {
      MacOsDeviceInfo macInfo = await deviceInfo.macOsInfo;
      deviceId.value = macInfo.systemGUID!;
      print("#### Mac Device Id ${deviceId.value}");
    } else if (GetPlatform.isWindows) {
      WindowsDeviceInfo windowsDeviceInfo = await deviceInfo.windowsInfo;
      deviceId.value = '${windowsDeviceInfo.numberOfCores}';
      print("#### Windows Device Id ${deviceId.value}");
    } else if (GetPlatform.isLinux) {
      LinuxDeviceInfo linuxDeviceInfo = await deviceInfo.linuxInfo;
      deviceId.value = linuxDeviceInfo.machineId!;
      print("#### Linux Device Id ${deviceId.value}");
    } else if (GetPlatform.isIOS) {
      IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;
      deviceId.value = iosDeviceInfo.identifierForVendor!;
      print("#### Ios Device Id ${deviceId.value}");
    } else if (GetPlatform.isAndroid) {
      AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;
      deviceId.value = androidDeviceInfo.id!;
      print("#### Android Device Id ${deviceId.value}");
    }
  }
}
