import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:shinhae/data/core/api_client.dart';
import 'package:shinhae/data/data_sources/authentication_remote_data_source.dart';
//import 'package:hive/hive.dart';
import 'package:shinhae/presentation/shinhae_app.dart';
import 'package:pedantic/pedantic.dart';
//import 'package:path_provider/path_provider.dart' as path_provider;
import 'di/get_it.dart' as getIt;

void main() async {
  AuthenticationRemoteDataSource _authenticationRemoteDataSource =
      AuthenticationRemoteDataSourceImpl(ApiClient(Client()));
  _authenticationRemoteDataSource.login({'userId': 'samin11', 'password': 'ghfn5krl'});

  WidgetsFlutterBinding.ensureInitialized();
  unawaited(SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]));
  //final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  //Hive.init(appDocumentDir.path);
  // Hive.registerAdapter(adapter);
  unawaited(getIt.init());
  runApp(ShinhaeApp());
}
