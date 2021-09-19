import 'package:app_filmes/aplication/ui/filmes_app_icons_icons.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'Filmes'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favoritos'),
          BottomNavigationBarItem(
              icon: Icon(Icons.logout_outlined), label: 'Sair'),
        ],
      ),
      body: Container(),
    );
  }
}
