import 'package:flutter/material.dart';
// import 'package:sushiapp/secondroute.dart';
import 'splash_screen.dart';
// import 'test.dart';
// import 'detail.dart';
// import 'Models/menuitem_model.dart';
// import 'Models/ingredients.dart';
// import 'widgets/animationbuilder.dart';

void main() {
  runApp(MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.white,
          secondary: const Color(0xFFFFC107),
        ),
      ),
      home: const SplashScreen()
      // home: Animationbuilder(
      //   chiild: Container(
      //     height: 200,
      //     width: 100,
      //     color: Colors.red,
      //   ),
      // ),
      // home: detail(
      //   m: menuitem(
      //     name: 'Kamikazi Salmon',
      //     id: 1,
      //     description: 'jkdfiejlkjsdfj',
      //     price: 1.55,
      //     image: 'Assets/piecesushi.png',
      //     l: [
      //       Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
      //       Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
      //       Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
      //       Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
      //       Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png'),
      //       Ingredient(nam: 'youssef', img: 'Assets/piecesushi.png')
      //     ],
      //   ),
      // ),
      ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Container(),
    );
  }
}
