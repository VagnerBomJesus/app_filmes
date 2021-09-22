import 'package:app_filmes/aplication/auth/auth_service.dart';
import 'package:app_filmes/models/movies_model.dart';
import 'package:app_filmes/services/movies/movies_services.dart';
import 'package:get/get.dart';

class FavoritesController extends GetxController {
  final MoviesServices _moviesService;
  final AuthService _authService;

  final movies = <MovieModel>[].obs;

  FavoritesController({
    required MoviesServices moviesService,
    required AuthService authService,
  })  : _moviesService = moviesService,
        _authService = authService;

  Future<void> getFavorites() async {
    var user = _authService.user;
    if (user != null) {
      var favorites = await _moviesService.getFavoritiesMovies(user.uid);
      movies.assignAll(favorites);
    }
  }

  Future<void> removeFavorites(MovieModel movie) async {
    var user = _authService.user;
    if (user != null) {
      await _moviesService.addOrRemoveFavorite(
          user.uid, movie.copyWith(favorite: false));
      movies.remove(
          movie); //posso fazer dessa forma removendo da minha lista, deixando GetX se encarregar disso, ou fazer novamente uma busca de getFavorites
    }
  }

  @override
  void onReady() {
    super.onReady();
    getFavorites();
  }
}
