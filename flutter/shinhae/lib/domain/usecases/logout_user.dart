import 'package:shinhae/domain/entities/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:shinhae/domain/entities/no_params.dart';
import 'package:shinhae/domain/repositories/authentication_repository.dart';
import 'package:shinhae/domain/usecases/usecase.dart';

class LogoutUser extends UseCase<void, NoParams> {
  final AuthenticationRepository _authenticationRepository;

  LogoutUser(this._authenticationRepository);

  @override
  Future<Either<AppError, void>> call(NoParams param) async => _authenticationRepository.logoutUser();
}
