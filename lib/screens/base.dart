import 'package:flutter/material.dart';
import 'package:karma_flutterversion/providers/authProvider.dart';
import 'package:karma_flutterversion/providers/businessLogicProvider.dart';
import 'package:provider/provider.dart';

import 'home.dart';
import 'login.dart';
import 'signup.dart';

class BaseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AuthProvider>(
        create: (context) => AuthProvider(),
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Pothole',
            home: Consumer<AuthProvider>(
              builder: (context, model, child) {
                if (model.getLogged == 0) {
                  return BaseHomeApp();
                } else {
                  if (model.getLogged == 1) {
                    return LoginView();
                  } else {
                    if (model.getLogged == 2) {
                      return SingUp();
                    } else {
                      return HomeView();
                    }
                  }
                }
              },
            )));
  }
}

class BaseHomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(
      child: Consumer<AuthProvider>(builder: (context, model, child) {
        return Container(
            color: Colors.orangeAccent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Spacer(),
                Image.asset(
                  'imgs/logo.png',
                  height: 300,
                  fit: BoxFit.contain,
                ),
                Center(
                  child: MaterialButton(
                    onPressed: () {
                      model.setLogged(1);
                    },
                    child:
                        Text('Sign In', style: TextStyle(color: Colors.black)),
                    color: Colors.white,
                  ),
                ),
                Spacer(flex: 2),
                Expanded(
                    flex: 1,
                    child: Container(
                      //padding: const EdgeInsets.all(5),
                      child: MaterialButton(
                          onPressed: () {
                            model.setLogged(2);
                          },
                          child: Text('Sing Up',
                              style: TextStyle(color: Colors.black)),
                          color: Colors.white),
                    )),
              ],
            ));
      }),
    ));
  }
}
