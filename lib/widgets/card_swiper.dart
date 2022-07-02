import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class CardSwiper extends StatelessWidget {
  const CardSwiper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context)
        .size; // widget q da info sobre el dispositivo en que corre

    return Container(
      width: double.infinity,
      height: size.height * 0.5,
      child: Swiper(
          itemCount: 10,
          layout: SwiperLayout.STACK,
          itemWidth: size.width * 0.6,
          itemHeight: size.height * 0.4,
          itemBuilder: (_, int index) { // builder dispara una funcion dinamicamente
            return GestureDetector(
              onTap: () => Navigator.pushNamed(context, 'details', arguments: 'movie-instance'), //navega cuando se da click en card
              child: ClipRRect( // card builder
                borderRadius: BorderRadius.circular(20),
                child: const FadeInImage(
                    placeholder: AssetImage('assets/no-image.jpg'),
                    image: NetworkImage('https://via.placeholder.com/300x400'),
                    fit: BoxFit.cover,),
              ),
            );
          }),
    );
  }
}
