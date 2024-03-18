import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tokenbooking/splash_screen.dart';
import 'register_page.dart';
import 'login_page.dart';
import 'home_page.dart';
import 'package:firebase_core/firebase_core.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: {
        'register' : (context)=> Register(),
        'login' : (context)=> Login(),
        'homepage' : (context)=> Homepage(),
      },
    );
  }
}
