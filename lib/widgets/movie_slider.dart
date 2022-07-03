import 'package:flutter/material.dart';

import '../models/models.dart';

class MovieSlider extends StatefulWidget {
  const MovieSlider(
      {Key? key, required this.movies, this.title, required this.onNextPage})
      : super(key: key);

  final List<Movie> movies;
  final String? title;
  final Function onNextPage;

  @override
  State<MovieSlider> createState() => _MovieSliderState();
}

class _MovieSliderState extends State<MovieSlider> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent - 500) {
        widget.onNextPage();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 260,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        if (widget.title != null)
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                widget.title!,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )),
        const SizedBox(
          height: 5,
        ),
        Expanded(
          // soluciona error d tamaño, widget p/ abarcar todo el espacio disponible
          child: ListView.builder(
              // error en tamaño, xq widget padre es flexible
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: widget.movies.length,
              itemBuilder: (_, int index) =>
                  _MoviePoster(movie: widget.movies[index])),
        )
      ]),
    );
  }
}

class _MoviePoster extends StatelessWidget {
  const _MoviePoster({
    Key? key,
    required this.movie,
  }) : super(key: key);
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 190,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(children: [
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, 'details',
              arguments: 'movie-slider'),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: const AssetImage('assets/no-image.jpg'),
              image: NetworkImage(movie.posterImage),
              width: 130,
              height: 190,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          movie.title,
          overflow: TextOverflow.ellipsis, // muestra 3 puntitos p/ indicar q hay + texto
          maxLines: 2, // num d lineas q hay
          textAlign: TextAlign.center,
        )
      ]),
    );
  }
}
