import 'package:app_filmes/aplication/auth/auth_service.dart';
import 'package:app_filmes/aplication/rest_client/rest_client.dart';
import 'package:app_filmes/repositories/login/login_repository.dart';
import 'package:app_filmes/repositories/login/login_repository_impl.dart';
import 'package:app_filmes/repositories/movies/movies_repository.dart';
import 'package:app_filmes/repositories/movies/movies_repository_impl.dart';
import 'package:app_filmes/services/login/login_service.dart';
import 'package:app_filmes/services/login/login_service_impl.dart';
import 'package:app_filmes/services/movies/movies_services.dart';
import 'package:app_filmes/services/movies/movies_services_impl.dart';
import 'package:get/get.dart';

class AplicationBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => RestClient(),
      fenix: true,
    );
    Get.lazyPut<LoginRepository>(
      () => LoginRepositoryImpl(),
      fenix: true,
    );
    Get.lazyPut<LoginService>(
      () => LoginServiceImpl(loginRepository: Get.find()),
      fenix: true,
    );
    Get.put(
      AuthService(),
    ).init();

    Get.lazyPut<MoviesRepository>(
      () => MoviesRepositoryImpl(restClient: Get.find()),
      fenix: true,
    );
    Get.lazyPut<MoviesServices>(
      () => MoviesServicesImpl(moviesRepository: Get.find()),
      fenix: true,
    );
  }
}
