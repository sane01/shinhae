import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:shinhae/data/core/unauthorized_exception.dart';

import '../data_sources/authentication_local_data_source.dart';
import '../data_sources/authentication_remote_data_source.dart';

import 'package:shinhae/domain/entities/app_error.dart';
import 'package:shinhae/domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  final AuthenticationRemoteDataSource _authenticationRemoteDataSource;
  final AuthenticationLocalDataSource _authenticationLocalDataSource;

  AuthenticationRepositoryImpl(
    this._authenticationRemoteDataSource,
    this._authenticationLocalDataSource,
  );

  @override
  Future<Either<AppError, bool>> loginUser(Map<String, dynamic> params) async {
    try {
      final response = _authenticationRemoteDataSource.login(params);
      print(response);
      return Right(true);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on UnauthorizedException {
      return Left(AppError(AppErrorType.unauthorised));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, void>> logoutUser() async {}
}
