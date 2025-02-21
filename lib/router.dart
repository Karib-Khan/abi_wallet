import 'package:flutter/material.dart';
import 'splash_screen.dart';
import 'login.dart';
import 'register.dart';
import 'forgot_password_screen.dart';
import 'reset_password.dart';
import 'home_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case '/register':
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case '/forgot-password':
        return MaterialPageRoute(builder: (_) => ForgotPasswordScreen());
      case '/reset-password':
        return MaterialPageRoute(builder: (_) => ResetPasswordScreen());
      case '/home-screen':
        return MaterialPageRoute(builder: (_) => HomeScreen());
    // Add more cases for other screens like Home, Projects, etc.
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route found')),
          ),
        );
    }
  }
}
