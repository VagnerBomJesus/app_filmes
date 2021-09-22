import 'package:app_filmes/modules/movies/movies_controller.dart';
import 'package:app_filmes/repositories/generes/generes_repository.dart';
import 'package:app_filmes/repositories/generes/generes_repository_impl.dart';
import 'package:app_filmes/services/genres/genres_services.dart';
import 'package:app_filmes/services/genres/genres_services_impl.dart';
import 'package:get/get.dart';

class MoviesBingings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GeneresRepository>(
      () => GeneresRepositoryImpl(
        restClient: Get.find(),
      ),
    );

    Get.lazyPut<GenresServices>(
      () => GenresServicesImpl(
        generesRepository: Get.find(),
      ),
    );
    Get.lazyPut(
      () => MoviesController(
        genresService: Get.find(),
        moviesService: Get.find(),
        authService: Get.find(),
      ),
    );
  }
}
