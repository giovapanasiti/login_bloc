import 'dart:async';
import 'package:login_bloc/src/blocs/vaidators.dart';

class Bloc extends Validators {
  final _emailController = StreamController<String>();
  final _passwordController = StreamController<String>();

//  add data to stream
  Function(String) get changeEmail => _emailController.sink.add;

  Function(String) get changePassword => _passwordController.sink.add;

//  retrieve data from the stream
  Stream<String> get emailStream =>
      _emailController.stream.transform(validateEmail);

  Stream<String> get passwordStream =>
      _passwordController.stream.transform(validatePassword);


  dispose() { // we can clean up our controller. Dispose is just a name convention
    _emailController.close();
    _passwordController.close();
  }
}

final bloc = Bloc(); // this is useful for global bloc