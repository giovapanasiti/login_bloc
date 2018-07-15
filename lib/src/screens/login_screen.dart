import 'package:flutter/material.dart';
import 'package:login_bloc/src/blocs/bloc.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.00),
      child: Column(
        children: <Widget>[
          _emailField(),
          _passwordField(),
          Container(
            margin: EdgeInsets.only(top: 35.00),
          ),
          _submitButton(),
        ],
      ),
    );
  }

  Widget _emailField() {
    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.changeEmail,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: 'your@email.com',
            labelText: 'Email Address',
            errorText: snapshot.error
          ),
        );
      },
    );
  }

  Widget _passwordField() {
    return StreamBuilder(
      stream: bloc.passwordStream,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.changePassword,
          obscureText: true,
          decoration: InputDecoration(
            hintText: 'password',
            labelText: 'Password',
            errorText: snapshot.error
          ),
        );
      },
    );
  }

  Widget _submitButton() {
    return RaisedButton(
      child: Text('Login'),
      color: Colors.blue,
      onPressed: () {},
    );
  }
}
