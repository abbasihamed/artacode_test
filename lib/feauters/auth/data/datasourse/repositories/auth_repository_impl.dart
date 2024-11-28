import 'dart:convert';

import 'package:artacode_test/core/network_error/failures.dart';
import 'package:artacode_test/feauters/auth/data/datasourse/remote/api_service.dart';
import 'package:artacode_test/feauters/auth/data/models/login_model.dart';
import 'package:artacode_test/feauters/auth/domain/entities/register.dart';
import 'package:artacode_test/feauters/auth/domain/repositories/auth_repository.dart';
import 'package:artacode_test/feauters/auth/data/models/register_fail_model.dart';
import 'package:artacode_test/feauters/auth/data/models/register_model.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl implements AuthRepository {
  final ApiService _apiService;
  const AuthRepositoryImpl(this._apiService);
  @override
  Future<Either<Failure, RegisterEntity>> register(
      Map<String, dynamic> body) async {
    try {
      final response = await _apiService.register(body);
      if (response.statusCode == 200) {
        final result = RegisterModel.fromJson(jsonDecode(response.body));
        return Right(result);
      } else {
        final result = RegisterFailModel.fromJson(jsonDecode(response.body));
        return Left(NetworkFailure(msg: result.msg));
      }
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> login(Map<String, dynamic> body) async {
    try {
      final response = await _apiService.login(body);
      if (response.statusCode == 200) {
        final result = LoginModel.fromJson(jsonDecode(response.body));
        return Right(result.token);
      } else {
        final result = RegisterFailModel.fromJson(jsonDecode(response.body));
        return Left(NetworkFailure(msg: result.msg));
      }
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
