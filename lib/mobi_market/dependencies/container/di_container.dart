import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:neobis_flutter_chapter8/mobi_market/data/data_sources/authentication/service/service_api.dart';
import 'package:neobis_flutter_chapter8/mobi_market/data/repositories/authentication/authentication_data_repository.dart';
import 'package:neobis_flutter_chapter8/mobi_market/domain/use_cases/authentication/authentication_use_case.dart';

final getIt = GetIt.instance;
const String _base_url = "http://134.209.246.246:8080/api";

void setupDi() {
  getIt.registerSingleton<Dio>(Dio(BaseOptions(baseUrl: _base_url)));

  getIt.registerSingleton<AuthenticationDataRepository>(
      AuthenticationDataRepository(AuthenticationServiceMobiMarketApi()));
  getIt.registerSingleton<AuthenticationUseCase>(AuthenticationUseCase(
      repository: getIt.get<AuthenticationDataRepository>()));
}
