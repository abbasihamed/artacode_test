class RegisterFailModel {
  final String msg;

  const RegisterFailModel({required this.msg});

  factory RegisterFailModel.fromJson(Map<String, dynamic> json) {
    return RegisterFailModel(msg: json['error']);
  }
}
