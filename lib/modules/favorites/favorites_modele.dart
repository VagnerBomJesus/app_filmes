import 'package:app_filmes/aplication/modules/module.dart';
import 'package:app_filmes/modules/favorites/favorites_page.dart';
import 'package:get/get.dart';

class FavoritesModele implements Module {
  @override
  List<GetPage> routes = [
    GetPage(
      name: '/favorites',
      page: () => FavoritesPage(),
    )
  ];
}
