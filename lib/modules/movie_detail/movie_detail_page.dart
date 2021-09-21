import 'package:app_filmes/modules/movie_detail/widgt/movie_detail_cotent.dart';
import 'package:app_filmes/modules/movie_detail/widgt/movie_detail_header.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './movie_detail_controller.dart';

class MovieDetailPage extends GetView<MovieDetailController> {
  const MovieDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhe'),
      ),
      body: SingleChildScrollView(
        child: Obx(() {
          paddingAll(10);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MovieDetailHeader(
                movie: controller.movie.value,
              ),
              MovieDetailCotent(movie: controller.movie.value),
            ],
          );
        }),
      ),
    );
  }
}
