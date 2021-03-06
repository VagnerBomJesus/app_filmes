import 'package:app_filmes/aplication/ui/filmes_app_icons_icons.dart';
import 'package:app_filmes/aplication/ui/theme_extencions.dart';
import 'package:app_filmes/models/movies_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:transparent_image/transparent_image.dart';

class MoviesCard extends StatelessWidget {
  final dateformt = DateFormat('y');
  final MovieModel movie;
  final VoidCallback favoriteCallback;

  MoviesCard({Key? key, required this.movie, required this.favoriteCallback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(
          '/movie/detail/',
          arguments: movie.id,
        );
      },
      child: Container(
        padding: EdgeInsets.all(8),
        height: 280,
        width: 158,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Material(
                    shadowColor: Colors.green,
                    elevation: 2,
                    borderRadius: BorderRadius.circular(8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      clipBehavior: Clip.antiAlias,
                      child: FadeInImage.memoryNetwork(
                        height: 184,
                        width: 148,
                        placeholder: kTransparentImage,
                        image:
                            'https://image.tmdb.org/t/p/w200${movie.posterPath}',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    movie.title,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  Text(
                    // movie.releaseDate,
                    dateformt.format(
                      DateTime.parse(movie.releaseDate),
                    ),
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w300,
                      fontSize: 11,
                    ),
                    //overflow: TextOverflow.ellipsis,
                    //maxLines: 2,
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 75,
              right: -10,
              child: Material(
                elevation: 5,
                shape: CircleBorder(),
                clipBehavior: Clip.antiAlias,
                child: SizedBox(
                  height: 30,
                  child: IconButton(
                    alignment: Alignment.center,
                    iconSize: 13,
                    onPressed: favoriteCallback,
                    icon: Icon(
                      movie.favorite
                          ? FilmesAppIcons.heart
                          : FilmesAppIcons.heart_empty,
                      color: movie.favorite ? context.themeRed : Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
