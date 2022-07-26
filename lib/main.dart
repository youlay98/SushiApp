import 'package:flutter/material.dart';
import 'package:sushiapp/splash_screen.dart';
import 'package:sushiapp/textstyle.dart';
import 'package:sushiapp/secondroute.dart';
// import 'splash_screen.dart';
// import 'widgets/cartItem.dart';
import 'package:provider/provider.dart';
import 'cart.dart';
import 'itemsfromcategory.dart';
// import 'cartscreen.dart';
// import 'test.dart';
// import 'detail.dart';
// import 'Models/menuitem_model.dart';
// import 'Models/ingredients.dart';
// import 'widgets/animationbuilder.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (_) => Cart(),
    ),
    ChangeNotifierProvider(
      create: (_) => Itemfromcategory(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: Colors.white,
            secondary: const Color(0xFFFFC107),
          ),
          textTheme: const TextTheme(
            headline1: TitleTextStyle,
            headline2: TitleTextStyle,
            bodyText1: bodyTextStyle,
            bodyText2: bodyTextStyle,
          )),
      home: const SplashScreen(),
    );
  }
}
