import 'package:app_filmes/models/movie_detail_model.dart';
import 'package:flutter/material.dart';

class MovieDetailContentProdutionCreditis extends StatelessWidget {
  final MovieDetailModel? movie;
  const MovieDetailContentProdutionCreditis({Key? key, required this.movie})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      padding: EdgeInsets.all(8.0),
      child: RichText(
        text: TextSpan(
            text: 'Companhia(s) Produtora(s): ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xff222222),
            ),
            children: [
              TextSpan(
                text: movie?.productionCompanies.join(', ') ?? '',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Color(0xff222222),
                ),
              )
            ]),
      ),
    );
  }
}
