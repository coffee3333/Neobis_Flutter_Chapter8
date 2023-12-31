import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:neobis_flutter_chapter8/data/data_sources/authentication/service/service_api.dart';
import 'package:neobis_flutter_chapter8/data/data_sources/registration/service/service_api.dart';
import 'package:neobis_flutter_chapter8/data/repositories/authentication/authentication_data_repository.dart';
import 'package:neobis_flutter_chapter8/data/repositories/registration/registration_data_repository.dart';
import 'package:neobis_flutter_chapter8/domain/use_cases/authentication/authentication_use_case.dart';
import 'package:neobis_flutter_chapter8/domain/use_cases/registration/registration_use_case.dart';

final getIt = GetIt.instance;
const String _base_url = "http://161.35.210.154:8080/";

void setupDi() {
  getIt.registerSingleton<Dio>(Dio(BaseOptions(baseUrl: _base_url)));

  getIt.registerSingleton<AuthenticationDataRepository>(
      AuthenticationDataRepository(AuthenticationServiceMobiMarketApi()));
  getIt.registerSingleton<AuthenticationUseCase>(AuthenticationUseCase(
      repository: getIt.get<AuthenticationDataRepository>()));

  getIt.registerSingleton<RegistrationDataRepository>(
      RegistrationDataRepository(RegistrationServiceMobiMarketApi()));
  getIt.registerSingleton<RegistrationUseCase>(
      RegistrationUseCase(repository: getIt.get<RegistrationDataRepository>()));
}
