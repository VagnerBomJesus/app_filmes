import 'package:app_filmes/models/genere_model.dart';
import 'package:flutter/material.dart';
import 'package:app_filmes/aplication/ui/theme_extencions.dart';

class FilterTag extends StatelessWidget {
  final GenereModel model;
  final bool selected;
  final VoidCallback onPressed;

  const FilterTag({
    Key? key,
    required this.model,
    this.selected = false,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        constraints: BoxConstraints(
          minHeight: 30,
          minWidth: 100,
        ),
        decoration: BoxDecoration(
          color: selected ? context.themeRed : Colors.black,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            model.name,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
