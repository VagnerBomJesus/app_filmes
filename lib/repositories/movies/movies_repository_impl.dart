import 'package:app_filmes/aplication/rest_client/rest_client.dart';
import 'package:app_filmes/models/movie_detail_model.dart';
import 'package:app_filmes/models/movies_model.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

import './movies_repository.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final RestClient _restClient;

  MoviesRepositoryImpl({required RestClient restClient})
      : _restClient = restClient;

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final result = await _restClient.get<List<MovieModel>>(
      '/movie/popular',
      query: {
        'api_key': RemoteConfig.instance.getString('api_token'),
        'language': 'pt-PT',
        'page': '1',
      },
      decoder: (data) {
        final dataResult = data['results'];

        if (dataResult != null) {
          return dataResult
              .map<MovieModel>((v) => MovieModel.fromMap(v))
              .toList();
        }

        return <MovieModel>[];
      },
    );

    if (result.hasError) {
      print('Erro ao buscar popular movies [${result.statusText}]');
      throw Exception('Erro ao buscar filmes populares');
    }

    return result.body ?? <MovieModel>[];
  }

  @override
  Future<List<MovieModel>> getTopRated() async {
    final result = await _restClient.get<List<MovieModel>>(
      '/movie/top_rated',
      query: {
        'api_key': RemoteConfig.instance.getString(
          'api_token',
        ),
        'language': 'pt-PT',
        'page': '2',
      },
      decoder: (data) {
        final dataResult = data['results'];
        if (dataResult != null) {
          return dataResult
              .map<MovieModel>((v) => MovieModel.fromMap(v))
              .toList();
        }

        return <MovieModel>[];
      },
    );

    if (result.hasError) {
      print('Erro ao buscar popular movies [${result.statusText}]');
      throw Exception('Erro ao buscar filmes populares');
    }

    return result.body ?? <MovieModel>[];
  }

  @override
  Future<MovieDetailModel?> getDetail(int id) async {
    final result = await _restClient.get<MovieDetailModel?>(
      '/movie/$id',
      query: {
        'api_key': RemoteConfig.instance.getString('api_token'),
        'language': 'pt-PT',
        'append_to_response': 'images,credits',
        'include_image_language': 'en,pt-PT',
      },
      decoder: (data) {
        return MovieDetailModel.fromMap(data);
      },
    );
    if (result.hasError) {
      print('Erro ao buscar detalhe do filme [${result.statusText}]');
      throw Exception('Erro ao buscar detalhe do filme');
    }

    return result.body;
  }
}
