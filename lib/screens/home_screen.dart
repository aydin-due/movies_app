import 'package:flutter/material.dart';
import 'package:movies_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Peliculas en cine'),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {}, 
            icon: Icon(Icons.search))
        ],
      ),
      body: SingleChildScrollView( // para hacer scroll y ver los widgets q no entran en pantalla
        child: Column(
          children: const [
            //main cards
            CardSwiper(),
            //movie cards
            MovieSlider(),
          ],),
      )
    );
  }
}