import 'package:flutter/material.dart';
import 'package:login_bloc/src/screens/login_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Log Me In',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Login with Bloc'),
        ),
        body: LoginScreen(),
      ),
    );
  }
}
