import 'dart:convert';

class UserSignUp {
  String ownerLogin;
  String login;
  String password;
  String deviceId;
  String deviceType;

  UserSignUp(this.ownerLogin, this.login, this.password, this.deviceId,
      this.deviceType);

  factory UserSignUp.fromJson(String str) =>
      UserSignUp.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserSignUp.fromMap(Map<String, dynamic> json) => UserSignUp(
        json["ownerLogin"] == null ? null : json["ownerLogin"],
        json["login"] == null ? null : json["login"],
        json["password"] == null ? null : json["password"],
        json["deviceId"] == null ? null : json["deviceId"],
        json["deviceType"] == null ? null : json["deviceType"],
      );

  factory UserSignUp.fromMapResponse(Map<String, dynamic> json) => UserSignUp(
        json["ownerLogin"] == null ? null : json["ownerLogin"],
        json["login"] == null ? null : json["login"],
        json["password"] == null ? null : json["password"],
        json["deviceId"] == null ? null : json["deviceId"],
        json["deviceType"] == null ? null : json["deviceType"],
      );

  Map<String, dynamic> toMap() => {
        "usernameOwner": ownerLogin == null ? null : ownerLogin,
        "usernameActivation": login == null ? null : login,
        "password": password == null ? null : password,
        "deviceId": deviceId == null ? null : deviceId,
        "type": deviceType == null ? null : deviceType,
      };
}
