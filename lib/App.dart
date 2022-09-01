import 'package:flutter/material.dart';
import 'Auth/loginandsignuppage.dart';
import 'Auth/utils_class.dart';
import 'Globalwidgets/textstyle.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        scaffoldMessengerKey: Utils.messengerKey,
        theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: Colors.black,
              secondary: const Color(0xFFFFC107),
            ),
            textTheme: const TextTheme(
              headline1: TitleTextStyle,
              headline2: TitleTextStyle,
              bodyText1: bodyTextStyle,
              bodyText2: bodyTextStyle,
            )),
        home: const Loginandsigninpage());
  }
}
