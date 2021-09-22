import 'package:app_filmes/aplication/rest_client/rest_client.dart';
import 'package:app_filmes/models/movie_detail_model.dart';
import 'package:app_filmes/models/movies_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
  Future<MovieDetailModel?> getDetail(int id) async {
    final result = await _restClient.get<MovieDetailModel?>(
      '/movie/$id',
      query: {
        'api_key': RemoteConfig.instance.getString('api_token'),
        'language': 'pt-PT',
        'append_to_response': 'images,credits',
        'include_image_language': 'en,pt-PT,es,fr',
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

  @override
  Future<void> addOrRemoveFavorite(String userId, MovieModel movie) async {
    try {
      var favoriteColletction = FirebaseFirestore.instance
          .collection('favorities')
          .doc(userId)
          .collection('movies');

      if (movie.favorite) {
        favoriteColletction.add(movie.toMap());
      } else {
        var favoriteData = await favoriteColletction
            .where('id', isEqualTo: movie.id)
            .limit(1)
            .get();

        favoriteData.docs.first.reference
            .delete(); //como só tem 1, posso fazer assim e vez de percorrer com um for in
        // var docs = favoriteData.docs;
        // for (var doc in docs) {
        //   doc.reference.delete();
        // }
      }
    } catch (e) {
      print('Erro ao favoritar um filme');
      rethrow;
    }
  }

  @override
  Future<List<MovieModel>> getFavoritiesMovies(String userId) async {
    var favoritesMovies = await FirebaseFirestore.instance
        .collection('favorities')
        .doc(userId)
        .collection('movies')
        .get();

    //converter a query snapshot em um MovieModel
    final listFavorites = <MovieModel>[];
    for (var movie in favoritesMovies.docs) {
      listFavorites.add(MovieModel.fromMap(movie.data()));
    }
    return listFavorites;
  }
}
