import 'package:flutter/material.dart';
import 'package:login_bloc/src/blocs/bloc.dart';
import 'package:login_bloc/src/blocs/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Protected'),
      ),
      body: Container(
        margin: EdgeInsets.all(20.00),
        child: Column(
          children: <Widget>[
            _textField(bloc),
            Container(
              margin: EdgeInsets.only(top: 35.00),
            ),
            _logoutButton(bloc),
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
          return Text('You are not Authenticated');
        } else {
          return Container(
            child: Column(
              children: <Widget>[
                Text('You are auth'),
                StreamBuilder(
                  stream: bloc.storedToken,
                  initialData: '',
                  builder: (context, snapshot) {
                    return Text(
                      '${snapshot.data}'
                    );
                  },
                ),
              ],
            ),
          );
        }
      },
    );
  }

  Widget _logoutButton(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.isAuthenticated,
      builder: (context, snapshot) {
        return RaisedButton(
            child: Text('Logout'),
            color: Colors.blue,
//          if one of the two streams has an error, or has no data, the button onPressed gives null to stay unclickable
            onPressed: bloc.logout
        );
      },
    );
  }


}
