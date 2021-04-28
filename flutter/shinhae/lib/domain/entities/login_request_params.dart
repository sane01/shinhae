import 'package:flutter/foundation.dart';

class LoginRequestParams {
  final String username;
  final String password;

  LoginRequestParams({
    @required this.username,
    @required this.password,
  });

  Map<String, dynamic> toJson() => {
        'userId': username,
        'password': password,
      };
}
