import 'package:flutter/material.dart';
import 'package:sushiapp/splash_screen.dart';
import 'package:sushiapp/textstyle.dart';
import 'package:provider/provider.dart';
import 'package:sushiapp/widgets/itemes.dart';
import 'cart.dart';
import 'itemsfromcategory.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //
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
        home: const SplashScreen());
  }
}
