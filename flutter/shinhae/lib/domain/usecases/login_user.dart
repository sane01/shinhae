import 'package:shinhae/domain/entities/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:shinhae/domain/entities/login_request_params.dart';
import 'package:shinhae/domain/repositories/authentication_repository.dart';
import 'package:shinhae/domain/usecases/usecase.dart';

class LoginUser extends UseCase<bool, LoginRequestParams> {
  final AuthenticationRepository _authenticationRepository;

  LoginUser(this._authenticationRepository);

  @override
  Future<Either<AppError, bool>> call(LoginRequestParams params) async =>
      _authenticationRepository.loginUser(params.toJson());
}
