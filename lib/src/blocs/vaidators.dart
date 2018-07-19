import 'dart:async';

class Validators {
  final validateEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (email.contains('@')) {
      sink.add(email);
    } else {
      sink.addError('Enter a Valid email');
    }
  });

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length > 3) {
      sink.add(password);
    } else {
      sink.addError('Enter a Valid email');
    }
  });

  final authCheck =
      StreamTransformer<bool, bool>.fromHandlers(handleData: (auth, sink) {
    if (auth == true) {
      sink.add(true);
    } else {
      sink.add(false);
      sink.addError('Must be Authenticated');
    }
  });
}
