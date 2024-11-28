import 'package:artacode_test/config/pref/app_pref.dart';
import 'package:artacode_test/feauters/auth/data/datasourse/remote/api_service.dart';
import 'package:artacode_test/feauters/auth/data/datasourse/repositories/auth_repository_impl.dart';
import 'package:artacode_test/feauters/auth/domain/repositories/auth_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final locator = GetIt.I;

Future setup() async {
  final sharedPref = await SharedPreferences.getInstance();

  locator.registerLazySingleton<SharedPreferences>(() => sharedPref);
  locator.registerLazySingleton<AppPref>(() => AppPref(locator()));
  locator.registerLazySingleton<ApiService>(() => ApiService());
  locator.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(locator()));
}
