import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:karma_flutterversion/providers/authProvider.dart';
import 'package:karma_flutterversion/screens/Reports.dart';
import 'package:provider/provider.dart';

import 'myReports.dart';
import 'RegisterReport.dart';
import 'profile.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeView createState() => _HomeView();
}

class _HomeView extends State<HomeView> {
  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: 0,
          height: 55.0,
          items: <Widget>[
            Icon(Icons.person, size: 30, color: Colors.white),
            Icon(Icons.bar_chart, size: 30, color: Colors.white),
            Icon(Icons.credit_card, size: 30, color: Colors.white),
            Icon(Icons.home, size: 30, color: Colors.white),
          ],
          backgroundColor: Colors.white,
          color: Colors.orangeAccent,
          animationCurve: Curves.easeOutExpo,
          animationDuration: Duration(milliseconds: 600),
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
        ),
        body: Container(
          color: Colors.white,
          child: Center(
            child: Consumer<AuthProvider>(builder: (context, model, child) {
              if (_page == 1) {
                return Reports();
              } else {
                if (_page == 2) {
                  return NewReport();
                } else {
                  if (_page == 3) {
                  return MyReports();
                  } else{
                    return Profile();
                  }
                }
              }
            }),
          ),
        ));
  }
}

