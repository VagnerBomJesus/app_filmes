import 'package:app_filmes/aplication/rest_client/rest_client.dart';
import 'package:app_filmes/models/genere_model.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

import './generes_repository.dart';

class GeneresRepositoryImpl implements GeneresRepository {
  final RestClient _restClient;

  GeneresRepositoryImpl({required RestClient restClient})
      : _restClient = restClient;
  @override
  Future<List<GenereModel>> getGenres() async {
    final result =
        await _restClient.get<List<GenereModel>>("/genre/movie/list", query: {
      'api_key': RemoteConfig.instance.getString(
        'api_token',
      ), //Token da api movies guardada no faribase RemoteConfig/
      'language': 'pt-PT',
    }, decoder: (data) {
      final resultData = data['genres'];
      if (resultData != null) {
        return resultData
            .map<GenereModel>((g) => GenereModel.fromMap(g))
            .toList();
      }
      return <GenereModel>[];
    });
    if (result.hasError) {
      print("Erro ao Buscar Genres : $result.statusText");
      throw Exception("Erro ao Buscar Genres");
    }

    return result.body ?? <GenereModel>[];
  }
}
