import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:shinhae/data/core/api_client.dart';
import 'package:shinhae/data/repositories/authentication_repository_impl.dart';
import 'package:shinhae/domain/repositories/authentication_repository.dart';
import 'package:shinhae/domain/usecases/login_user.dart';

final getItInstance = GetIt.I;

Future init() async {
  getItInstance.registerLazySingleton<Client>(() => Client());

  getItInstance.registerLazySingleton<ApiClient>(() => ApiClient(getItInstance()));

  getItInstance.registerLazySingleton<AuthenticationRepository>(() => AuthenticationRepositoryImpl(
        getItInstance(),
        getItInstance(),
      ));

  getItInstance.registerLazySingleton<LoginUser>(() => LoginUser(getItInstance()));
}
