import 'dart:convert';

class UserLogin {
  String login;
  String password;
  String deviceId;
  String deviceType;

  UserLogin(this.login, this.password, this.deviceId, this.deviceType);

  factory UserLogin.fromJson(String str) => UserLogin.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserLogin.fromMap(Map<String, dynamic> json) => UserLogin(
        json["login"] == null ? null : json["login"],
        json["password"] == null ? null : json["password"],
        json["deviceId"] == null ? null : json["deviceId"],
        json["deviceType"] == null ? null : json["deviceType"],
      );

  Map<String, dynamic> toMap() => {
        "login": login == null ? null : login,
        "password": password == null ? null : password,
        "deviceId": deviceId == null ? null : deviceId,
        "deviceType": deviceType == null ? null : deviceType,
      };

  String toString() {
    return "UserLogin( login: ${this.login},password: ${this.password}, ID : ${this.deviceId}, type: ${this.deviceType})";
  }
}
