import 'package:artacode_test/feauters/auth/domain/entities/register.dart';

class RegisterModel extends RegisterEntity {
  RegisterModel({required super.id, required super.token});

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      id: json['id'],
      token: json['token'],
    );
  }
}
