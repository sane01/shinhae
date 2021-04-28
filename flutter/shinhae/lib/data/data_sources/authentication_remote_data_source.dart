import 'package:shinhae/data/core/api_client.dart';
import 'package:shinhae/data/models/login_result_model.dart';

abstract class AuthenticationRemoteDataSource {
  Future<LoginResultModel> login(Map<String, dynamic> body);
}

class AuthenticationRemoteDataSourceImpl extends AuthenticationRemoteDataSource {
  final ApiClient _client;

  AuthenticationRemoteDataSourceImpl(this._client);

  @override
  Future<LoginResultModel> login(Map<String, dynamic> body) async {
    final response = await _client.post('signin', params: body);
    print(response);
    final loginResultModel = LoginResultModel.fromJson(response);
    return loginResultModel;
  }
}
