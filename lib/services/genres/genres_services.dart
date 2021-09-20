import 'package:app_filmes/models/genere_model.dart';

abstract class GenresServices {
  Future<List<GenereModel>> getGenres();
}
