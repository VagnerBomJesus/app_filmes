import 'package:app_filmes/aplication/modules/module.dart';
import 'package:app_filmes/modules/movies/movies_bingings.dart';
import 'package:app_filmes/modules/movies/movies_pages.dart';
import 'package:get/get.dart';

class MoviesModule implements Module {
  @override
  List<GetPage> routes = [
    GetPage(
      name: '/movies',
      page: () => MoviesPage(),
      binding: MoviesBingings(),
    )
  ];
}
