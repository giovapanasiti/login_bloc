import 'package:flutter/material.dart';
import 'package:login_bloc/src/screens/login_screen.dart';
import 'package:login_bloc/src/blocs/provider.dart';
import 'package:login_bloc/src/blocs/bloc.dart';
import 'package:login_bloc/src/screens/home_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        title: 'Log Me In',
        routes: <String, WidgetBuilder>{
          '/': (BuildContext context) {
            final bloc = Provider.of(context);

            return StreamBuilder(
              stream: bloc.isAuthenticated,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return LoginScreen();
                } else {
                  return HomeScreen();
                }
              },
            );
          },
          '/home': (BuildContext context) => new HomeScreen()
        },
      ),
    );
  }
}
