import 'package:artacode_test/config/pref/app_pref.dart';
import 'package:artacode_test/config/router/app_path.dart';
import 'package:artacode_test/config/router/app_router.dart';
import 'package:artacode_test/di.dart';
import 'package:artacode_test/feauters/auth/domain/repositories/auth_repository.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final AuthRepository _registerRepository;
  String email = '';
  String pasword = '';
  bool hasError = false;
  String erroMsg = '';
  bool isLoading = false;
  RegisterController(this._registerRepository);

  registerUser() async {
    if (validation()) {
      isLoading = true;
      update(['loading']);
      Map<String, dynamic> body = {'email': email, 'password': pasword};
      final result = await _registerRepository.register(body);
      result.fold(
        (l) {
          hasError = true;
          erroMsg = l.msg ?? '';
          update(['error']);
        },
        (r) {
          AppRouter.router.goNamed(AppPathName.i.products);
          locator<AppPref>().setToken(r.token);
        },
      );
      isLoading = false;
      AppRouter.router.pop();
      update(['loading']);
    }
  }

  changeEmail(String value) {
    email = value;
    update(['email']);
  }

  changePassword(String value) {
    pasword = value;
    update(['pass']);
  }

  validation() {
    if (email.isEmpty && pasword.isEmpty) {
      hasError = true;
      erroMsg = 'مقادیر نمی تواند خالی باشد';
      update(['error']);
      return false;
    }
    hasError = false;
    update(['error']);
    return true;
  }
}
