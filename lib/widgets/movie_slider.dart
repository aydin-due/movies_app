import 'package:flutter/material.dart';

class MovieSlider extends StatelessWidget {
  const MovieSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      color: Colors.indigo,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Populares',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )),
        Expanded( // soluciona error d tamaño, widget p/ abarcar todo el espacio disponible
          child: ListView.builder( // error en tamaño, xq widget padre es flexible
              scrollDirection: Axis.horizontal,
              itemCount: 20,
              itemBuilder: (_, int index) {
                return Container(
                  width: 130,
                  height: 190,
                  color: Colors.green,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                );
              }),
        )
      ]),
    );
  }
}

