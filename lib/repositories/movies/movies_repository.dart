import 'package:app_filmes/models/movie_detail_model.dart';
import 'package:app_filmes/models/movies_model.dart';

abstract class MoviesRepository {
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRated();

  Future<MovieDetailModel?> getDetail(
      int id); //retornar como opcional caso não tenha.

  Future<void> addOrRemoveFavorite(String userId, MovieModel movie);
  Future<List<MovieModel>> getFavoritiesMovies(String userId);
}
