import 'package:app_filmes/models/genere_model.dart';

abstract class GeneresRepository {
  Future<List<GenereModel>> getGenres();
}
