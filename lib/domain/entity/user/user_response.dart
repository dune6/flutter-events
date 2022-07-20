// сущность уровня api
import 'dart:convert';

class UserResponse {
  static toMap(UserResponse userResponse) {}

  static fromMap(String str) {}
}

extension UserResponseParsingJson on UserResponse {
  String userToJson(UserResponse userResponse) =>
      json.encode(UserResponse.toMap(userResponse));

  UserResponse userFromJson(String str) =>
      UserResponse.fromMap(json.decode(str));
}
