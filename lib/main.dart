import 'package:flutter/material.dart';
import 'package:movies_app/providers/movies_provider.dart';
import 'package:movies_app/screens/screens.dart';
import 'package:provider/provider.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider( //inicializar provider
          create: (_) => MoviesProvider(), //metodo de creacion
          lazy: false,) //inicializa el provider junto con la app, no hasta que se utilice
      ],
    child: MyApp(),);
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Películas',
      initialRoute: 'home',
      routes: {'home': (_) => HomeScreen(), 'details': (_) => DetailsScreen()},
      theme: ThemeData.light()
          .copyWith(appBarTheme: AppBarTheme(color: Colors.red)),
    );
  }
}
