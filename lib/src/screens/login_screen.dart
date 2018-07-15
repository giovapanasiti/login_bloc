import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.00),
      child: Column(
        children: <Widget>[
          _emailField(),
          _passwordField(),
        ],
      ),
    );
  }

  Widget _emailField() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'your@email.com',
        labelText: 'Email Address'
      ),
    );
  }

  Widget _passwordField() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
          hintText: 'password',
          labelText: 'Password'
      ),
    );
  }
}