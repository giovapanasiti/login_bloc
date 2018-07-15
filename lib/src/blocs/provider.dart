import 'package:flutter/material.dart';
import 'package:login_bloc/src/blocs/bloc.dart';

class Provider extends InheritedWidget {
  final bloc = new Bloc();

  Provider({Key key, Widget child}) : super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static Bloc of(BuildContext context) {
//    we use "as" to force Dart to believe this is an instance of provider. Otherwise
//    the .bloc wouldn't be available.
    return (context.inheritFromWidgetOfExactType(Provider) as Provider).bloc;
  }
}
