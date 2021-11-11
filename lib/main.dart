import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'screens/welcome_screen.dart';
import 'screens/resident_home_screen.dart';


void main() {

   WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
    .then((_) {
      runApp(MyApp());
    });
  //runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  //const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kolekta',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (ctx) =>  const WelcomeScreen(),
        '/resident_home': (ctx) => const ResidentHomeScreen(),
      },
    );
  }
}


