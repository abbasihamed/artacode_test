import 'package:artacode_test/core/network_error/failures.dart';
import 'package:artacode_test/feauters/auth/domain/entities/register.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, RegisterEntity>> register(Map<String, dynamic> body);
  Future<Either<Failure, String>> login(Map<String, dynamic> body);
}
