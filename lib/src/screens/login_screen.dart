import 'package:flutter/material.dart';
import 'package:login_bloc/src/blocs/bloc.dart';
import 'package:login_bloc/src/blocs/provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Container(
        margin: EdgeInsets.all(20.00),
        child: Column(
          children: <Widget>[
            _textField(bloc),
            _emailField(bloc),
            _passwordField(bloc),
            Container(
              margin: EdgeInsets.only(top: 35.00),
            ),
            _submitButton(bloc),
          ],
        ),
      ),
    );
  }

  Widget _textField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.isAuthenticated,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Text('');
        } else {
          return Text(snapshot.data.toString());
        }
      },
    );
  }

  Widget _emailField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.changeEmail,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              hintText: 'your@email.com',
              labelText: 'Email Address',
              errorText: snapshot.error),
        );
      },
    );
  }

  Widget _passwordField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.passwordStream,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.changePassword,
          obscureText: true,
          decoration: InputDecoration(
              hintText: 'password',
              labelText: 'Password',
              errorText: snapshot.error),
        );
      },
    );
  }

  Widget _submitButton(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.submitValid,
      builder: (context, snapshot) {
        return RaisedButton(
            child: Text('Login'),
            color: Colors.blue,
//          if one of the two streams has an error, or has no data, the button onPressed gives null to stay unclickable
            onPressed: snapshot.hasData ? bloc.submit : null);
      },
    );
  }
}
