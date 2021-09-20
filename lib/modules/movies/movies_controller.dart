import 'package:app_filmes/aplication/ui/messages/messages_mixin.dart';
import 'package:app_filmes/models/genere_model.dart';
import 'package:app_filmes/services/genres/genres_services.dart';
import 'package:get/get.dart';

class MoviesController extends GetxController with MessagesMixin {
  final GenresServices _genresServices;
  final _message = Rxn<MessageModel>();
  final genres = <GenereModel>[].obs;
  MoviesController({
    required GenresServices genresServices,
  }) : _genresServices = genresServices;

  @override
  void onInit() {
    super.onInit();
    messagesListener(_message);
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    try {
      final genres = await _genresServices.getGenres();
      this.genres.assignAll(genres);
    } catch (e) {
      _message(MessageModel.error(
          title: "Erro", message: "Erro ao buscar Categorias"));
    }
  }
}
