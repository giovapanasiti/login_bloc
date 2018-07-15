import 'dart:async';

class Bloc {
  final _emailController = StreamController<String>();
  final _passwordController = StreamController<String>();

//  add data to stream
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

//  retrieve data from the stream
  Stream<String> get emailStream => _emailController.stream;
  Stream<String> get passwordStream => _passwordController.stream;
}
