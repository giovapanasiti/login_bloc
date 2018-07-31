import 'dart:async';
import 'package:login_bloc/src/blocs/vaidators.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/services.dart';

class Bloc extends Validators {
//  the .broadcast constructor allows the stream to be listened from multiple listeners
//  final _emailController = StreamController.broadcast<String>();
//  final _passwordController = StreamController.broadcast<String>();

// The behaviorSubject is already a controller broadcast but allows me to
//  reach controller values back in time
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

//  final _authenticated = BehaviorSubject<bool>();
  final _tokenController = BehaviorSubject<String>();
  final _authenticated = BehaviorSubject<bool>();

//  add data to stream
  Function(String) get changeEmail => _emailController.sink.add;

  Function(String) get changePassword => _passwordController.sink.add;

//  retrieve data from the stream
  Stream<String> get emailStream =>
      _emailController.stream.transform(validateEmail);

  Stream<String> get passwordStream =>
      _passwordController.stream.transform(validatePassword);

  Stream<bool> get isAuthenticated => _authenticated.stream.transform(authCheck);

  Stream<String> get storedToken => _tokenController.stream;

//  rx dart getter
// we return true because we just care there are no errors in the 2 stream
  Stream<bool> get submitValid =>
      Observable.combineLatest2(emailStream, passwordStream, (a, b) => true);

  submit() {
//    since I can't natively with Dart check back in streams we're
//  going to use RxDart with BehaviorSubject
    final validEmail = _emailController.value;
    final validPassword = _passwordController.value;

//    Here we should post the login credentials to the server

//  We make the user authenticated

    if (validEmail != '' && validPassword != '') {
      _authenticated.sink.add(true);
      _tokenController.sink.add('questa-e-solo-una-prova');
    }

//  token.add(_parsedJwt)

    print('$validEmail and $validPassword. Auth: ${_authenticated.value}');
  }

  logout() {
    _emailController.sink.add('');
//    _passwordController.sink.add('');
    _authenticated.sink.add(false);
    _tokenController.sink.add('');
  }

  dispose() {
    // we can clean up our controller. Dispose is just a name convention
    _emailController.close();
    _passwordController.close();
  }
}

//final bloc = Bloc(); // this is useful for global bloc
