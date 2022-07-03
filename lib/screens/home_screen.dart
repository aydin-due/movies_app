import 'package:flutter/material.dart';
import 'package:movies_app/providers/movies_provider.dart';
import 'package:movies_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context); //va a movies provider y regresa la primera instancia q encuentre, o crea 1 si no hay
    print(moviesProvider.onDisplayMovies);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Peliculas en cine'),
          elevation: 0,
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search))
          ],
        ),
        body: SingleChildScrollView(
          // para hacer scroll y ver los widgets q no entran en pantalla
          child: Column(
            children: [
              //main cards
              CardSwiper(movies: moviesProvider.onDisplayMovies),
              //movie cards
              MovieSlider(movies: moviesProvider.popularMovies, title: 'Populares', onNextPage: () => moviesProvider.getPopularMovies(),), //mandar pop movies & title opcional 'populares!'
            ],
          ),
        ));
  }
}
