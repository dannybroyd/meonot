import 'package:flutter/material.dart';
import 'package:our_app/pages/home.dart';
import 'package:our_app/pages/maintenance.dart';
import 'package:our_app/pages/profile.dart';
import 'package:our_app/pages/sleep.dart';
import 'package:our_app/pages/visitors.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  //color for theme
  static Color color = const Color.fromARGB(255, 120, 210, 255);
  static MaterialColor mainColor  = MaterialColor(color.value, {
      50: Color.fromRGBO(color.red, color.green, color.blue, 0.1),
      100: Color.fromRGBO(color.red, color.green, color.blue, 0.2),
      200: Color.fromRGBO(color.red, color.green, color.blue, 0.3),
      300: Color.fromRGBO(color.red, color.green, color.blue, 0.4),
      400: Color.fromRGBO(color.red, color.green, color.blue, 0.5),
      500: Color.fromRGBO(color.red, color.green, color.blue, 0.6),
      600: Color.fromRGBO(color.red, color.green, color.blue, 0.7),
      700: Color.fromRGBO(color.red, color.green, color.blue, 0.8),
      800: Color.fromRGBO(color.red, color.green, color.blue, 0.9),
      900: Color.fromRGBO(color.red, color.green, color.blue, 1.0)
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      routes: {
        '/profilepage' :(context) => const ProfilePage(),
        '/sleeppage' :(context) => const SleepPage(),
        '/visitorpage' :(context) => const VisitorsPage(),
        '/maintenancepage' :(context) => const MaintenancePage()
      },
      theme: ThemeData(primarySwatch: mainColor),
    );
  }
}
