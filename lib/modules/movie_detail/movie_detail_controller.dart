import 'package:app_filmes/aplication/ui/loader/loader_mixin.dart';
import 'package:app_filmes/aplication/ui/messages/messages_mixin.dart';
import 'package:app_filmes/models/movie_detail_model.dart';
import 'package:app_filmes/services/movies/movies_services.dart';
import 'package:get/get.dart';

class MovieDetailController extends GetxController
    with LoaderMixin, MessagesMixin {
  MoviesServices _moviesServices;

  var loading = false.obs;
  var message = Rxn<MessageModel>();

  var movie = Rxn<MovieDetailModel>();

  MovieDetailController({
    required MoviesServices moviesServices,
  }) : _moviesServices = moviesServices;

  @override
  void onInit() {
    super.onInit();
    loaderListener(loading);
    messagesListener(message);
  }

  @override
  void onReady() async {
    try {
      super.onReady();
      final movieId = Get.arguments;
      loading(true);
      final movieDetailData = await _moviesServices.getDetail(movieId);
      movie.value = movieDetailData;
      loading(false);
    } catch (e, s) {
      print(e);
      print(s);
      loading(false);
      message(
        MessageModel.error(
            title: 'Erro', message: 'Erro ao buscar os delahes do filmes'),
      );
    }
  }
}
