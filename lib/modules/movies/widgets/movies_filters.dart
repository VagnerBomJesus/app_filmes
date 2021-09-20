import 'package:app_filmes/modules/movies/movies_controller.dart';
import 'package:app_filmes/modules/movies/widgets/filter_tag.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoviesFilters extends GetView<MoviesController> {
  const MoviesFilters({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        padding: EdgeInsets.only(top: 20, left: 8),
        scrollDirection: Axis.horizontal,
        child: Obx(() {
          return Row(
            children: controller.genres
                .map(
                  (g) => FilterTag(
                    model: g,
                    selected: controller.genreSelected.value?.id == g.id,
                    onPressed: () => controller.filterMoviesByGenre(g),
                  ),
                )
                .toList(),
          );
        }));
  }
}
