import 'package:flutter/foundation.dart';

class LoginUserModel {
  bool result;
  String uniqId;
  String userName;
  String userId;
  String token;

  LoginUserModel({
    @required this.result,
    @required this.uniqId,
    @required this.userName,
    @required this.userId,
    @required this.token,
  });

  LoginUserModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    uniqId = json['uniqId'];
    userName = json['userName'];
    userId = json['userId'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['result'] = this.result;
    data['uniqId'] = this.uniqId;
    data['userName'] = this.userName;
    data['userId'] = this.userId;
    data['token'] = this.token;
    return data;
  }
}
