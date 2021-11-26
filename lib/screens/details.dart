import 'package:flutter/material.dart';
import 'package:karma_flutterversion/model/favor.dart';
import 'package:karma_flutterversion/providers/authProvider.dart';
import 'package:provider/provider.dart';
import 'myReports.dart';

favor fav;

class FavorDetails extends StatefulWidget {
  FavorDetails(favor f) {
    fav = f;
  }
  @override
  State<StatefulWidget> createState() => _FavorDetails();
}

bool _page2 = true;

class _FavorDetails extends State<FavorDetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Consumer<AuthProvider>(builder: (context, model, child) {
          if (_page2) {
            return Details(fav);
          } else {
            return MyReports();
          }
        }),
      ),
    );
  }
  Widget Details(favor fav) {
  return Container(
      //padding: const EdgeInsets.all(32),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
        Text(fav.tipo),
        Text('Quien pidió: ${fav.who} \nQuien realiza: ${fav.towho}'),
        RaisedButton(
            child: Text('Login', style: TextStyle(color: Colors.white)),
            color: Colors.purple,
            onPressed: () {
              _page2 = !_page2;
            }),
      ]));
}
}

