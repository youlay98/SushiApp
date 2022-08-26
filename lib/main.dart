import 'package:flutter/material.dart';
import 'package:sushiapp/config/provider_models/userprovider.dart';
import 'package:provider/provider.dart';
import 'config/provider_models/cart.dart';
import 'config/provider_models/itemsfromcategory.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'App.dart';

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
    ),
    ChangeNotifierProvider(create: (_) => UserP())
  ], child: const MyApp()));
}
