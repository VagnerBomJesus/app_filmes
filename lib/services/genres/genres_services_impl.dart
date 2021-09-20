import 'package:app_filmes/models/genere_model.dart';
import 'package:app_filmes/repositories/generes/generes_repository.dart';

import './genres_services.dart';

class GenresServicesImpl implements GenresServices {
  final GeneresRepository _generesRepository;

  GenresServicesImpl({
    required GeneresRepository generesRepository,
  }) : _generesRepository = generesRepository;

  @override
  Future<List<GenereModel>> getGenres() => _generesRepository.getGenres();
}
