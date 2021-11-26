import 'package:flutter/material.dart';
import 'package:karma_flutterversion/providers/authProvider.dart';
import 'package:provider/provider.dart';

class ChatView extends StatefulWidget {
  @override
  _ChatView createState() => _ChatView();
}

class _ChatView extends State<ChatView> {
  final _formKey = GlobalKey<FormState>();
  int vista = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Chat"),
          backgroundColor: Colors.purple,
        ),
        body: Center(
            child: Consumer<AuthProvider>(builder: (context, model, child) {
          return Form(
              key: _formKey,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 200,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 32),
                      //Text("Digite su correo electronico"),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.email),
                          hintText: 'Enter your email',
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter some text';
                          }
                        },
                      ),
                    ),
                    Spacer(),
                    RaisedButton(
                      child:
                          Text('Login', style: TextStyle(color: Colors.white)),
                      color: Colors.purple,
                      onPressed: () {
                        model.setLogged(3);
                        if (_formKey.currentState.validate()) {
                          // Si el formulario es válido, queremos mostrar un Snackbar
                          Scaffold.of(context).showSnackBar(
                              SnackBar(content: Text('Processing Data')));
                        }
                      },
                    ),
                    Spacer(flex: 2),
                  ],
                ),
              ));
        })));
  }
}

