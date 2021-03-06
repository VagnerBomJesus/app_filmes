import 'package:app_filmes/models/cast_model.dart';
import 'package:flutter/material.dart';
import 'package:app_filmes/aplication/ui/theme_extencions.dart';
import 'package:transparent_image/transparent_image.dart';

class MovieCast extends StatelessWidget {
  final CastModel? cast;
  const MovieCast({Key? key, this.cast}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 95,
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: cast?.image ?? '',
              width: 85,
              height: 85,
              fit: BoxFit.cover,
            ),
            /*- Image.network(
              cast?.image ?? '',
              width: 85,
              height: 85,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return SizedBox.shrink();
              },
            ),*/

            /* Image.network(
              cast?.image ?? '',
              width: 85,
              height: 85,
              fit: BoxFit.cover,
            ),*/
          ),
          Text(
            cast?.name ?? '',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            cast?.character ?? '',
            style: TextStyle(
              fontSize: 12,
              color: context.themeGray,
            ),
          )
        ],
      ),
    );
  }
}
