import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import '../models/models.dart';

class CardSwiper extends StatelessWidget {
  const CardSwiper({Key? key, required this.movies}) : super(key: key);

  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; // widget q da info sobre el dispositivo en que corre

    if (this.movies.isEmpty) {
      return Container(
        width: double.infinity,
        height: size.height*0.5,
        child: const Center(child: CircularProgressIndicator()),
      );
    }

    return Container(
      width: double.infinity,
      height: size.height * 0.5,
      child: Swiper(
          itemCount: movies.length,
          layout: SwiperLayout.STACK,
          itemWidth: size.width * 0.6,
          itemHeight: size.height * 0.4,
          itemBuilder: (_, int index) {
            final movie = movies[index];
            print(movie.posterImage);

            // builder dispara una funcion dinamicamente
            return GestureDetector(
              onTap: () => Navigator.pushNamed(context, 'details',
                  arguments: movie), //navega cuando se da click en card
              child: ClipRRect(
                // card builder
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage(
                  placeholder: const AssetImage('assets/no-image.jpg'),
                  image: NetworkImage(movie.posterImage),
                  fit: BoxFit.cover,
                ),
              ),
            );
          }),
    );
  }
}
