import 'package:app_filmes/models/movie_detail_model.dart';
import 'package:app_filmes/models/movies_model.dart';

abstract class MoviesServices {
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRated();

  Future<MovieDetailModel?> getDetail(int id);
}
