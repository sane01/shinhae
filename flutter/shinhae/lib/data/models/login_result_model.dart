import 'package:shinhae/data/models/user_model.dart';

class LoginResultModel {
  LoginUserModel data;
  int page;
  int limit;
  List<String> errors;
  Null successes;

  LoginResultModel({this.data, this.page, this.limit, this.errors, this.successes});

  LoginResultModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new LoginUserModel.fromJson(json['data']) : null;
    page = json['page'];
    limit = json['limit'];
    if (json['errors'] != null) {
      errors = <Null>[];
      json['errors'].forEach((v) {
        errors.add(v);
      });
    }
    successes = json['successes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['page'] = this.page;
    data['limit'] = this.limit;
    if (this.errors != null) {
      data['errors'] = this.errors.map((v) => v).toList();
    }
    data['successes'] = this.successes;
    return data;
  }
}
