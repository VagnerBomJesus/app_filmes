import 'package:app_filmes/models/movie_detail_model.dart';
import 'package:app_filmes/modules/movie_detail/widgt/movie_datail_contast/movies_cast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app_filmes/aplication/ui/theme_extencions.dart';

class MovieDetailConteatMainCast extends StatelessWidget {
  final MovieDetailModel? movie;

  final showPanel = false.obs;

  MovieDetailConteatMainCast({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 8.0,
            right: 8.0,
          ),
          child: Divider(
            color: context.themeGray,
          ),
        ),
        Obx(
          () {
            return ExpansionPanelList(
              elevation: 0,
              expandedHeaderPadding: EdgeInsets.zero,
              expansionCallback: (panelIndex, isExpanded) {
                showPanel.toggle();
              },
              children: [
                ExpansionPanel(
                  canTapOnHeader: false,
                  backgroundColor: Colors.white,
                  isExpanded: showPanel.value,
                  headerBuilder: (context, isExpanded) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'Elenco',
                          style: TextStyle(
                            fontSize: 16.5,
                          ),
                        ),
                      ),
                    );
                  },
                  body: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      /**
                       * children: movie?.cast
                          .map((c) => MoviesCast(
                                cast: c,
                              ))
                          .toList(),
                       */
                      children:
                          movie?.cast.map((c) => MovieCast(cast: c)).toList() ??
                              [],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
