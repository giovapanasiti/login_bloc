import 'dart:async';
import 'package:login_bloc/src/blocs/vaidators.dart';
import 'package:rxdart/rxdart.dart';

class Bloc extends Validators {
//  the .broadcast constructor allows the stream to be listened from multiple listeners
  final _emailController = StreamController.broadcast<String>();
  final _passwordController = StreamController.broadcast<String>();

//  add data to stream
  Function(String) get changeEmail => _emailController.sink.add;

  Function(String) get changePassword => _passwordController.sink.add;

//  retrieve data from the stream
  Stream<String> get emailStream =>
      _emailController.stream.transform(validateEmail);

  Stream<String> get passwordStream =>
      _passwordController.stream.transform(validatePassword);

//  rx dart getter
  // we return true because we just care there are no errors in the 2 stream
  Stream<bool> get submitValid =>
      Observable.combineLatest2(emailStream, passwordStream, (a, b) => true);

  dispose() {
    // we can clean up our controller. Dispose is just a name convention
    _emailController.close();
    _passwordController.close();
  }
}

//final bloc = Bloc(); // this is useful for global bloc
