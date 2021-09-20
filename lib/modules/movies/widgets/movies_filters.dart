import 'package:app_filmes/modules/movies/widgets/filter_tag.dart';
import 'package:flutter/material.dart';

class MoviesFilters extends StatelessWidget {
  const MoviesFilters({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(top: 20, left: 8),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (int i = 0; i < 15; i++) FilterTag(),
        ],
      ),
    );
  }
}
