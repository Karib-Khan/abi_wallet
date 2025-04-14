import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'router.dart';
import 'splash_screen.dart';
import 'login.dart'; // Make sure to import the login screen
import 'register.dart'; // Import other screens like register, etc.

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Investment Platform',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
