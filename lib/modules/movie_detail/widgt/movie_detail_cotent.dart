import 'package:app_filmes/models/movie_detail_model.dart';
import 'package:app_filmes/modules/movie_detail/widgt/movie_datail_contast/movie_detail_contest_title.dart';
import 'package:flutter/material.dart';

class MovieDetailCotent extends StatelessWidget {
  final MovieDetailModel? movie;
  const MovieDetailCotent({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MovieDetailContestTitle(movie: movie),
      ],
    );
  }
}
