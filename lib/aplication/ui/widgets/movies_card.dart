import 'package:app_filmes/aplication/ui/filmes_app_icons_icons.dart';
import 'package:flutter/material.dart';

class MoviesCard extends StatelessWidget {
  const MoviesCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  borderRadius: BorderRadius.circular(20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    clipBehavior: Clip.antiAlias,
                    child: Image.network(
                      "https://upload.wikimedia.org/wikipedia/pt/6/63/Joker_%282019%29.jpg",
                      height: 184,
                      width: 148,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Homem Aranha ",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Text(
                  "2020",
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
                  onPressed: () {},
                  icon: Icon(
                    FilmesAppIcons.heart,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
