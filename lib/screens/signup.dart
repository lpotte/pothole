import 'package:flutter/material.dart';
import 'package:karma_flutterversion/providers/authProvider.dart';
import 'package:provider/provider.dart';

class SingUp extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Consumer<AuthProvider>(builder: (context, model, child) {
          return Form(
              key: _formKey,
              child: Container(
                color: Colors.orangeAccent,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Spacer(),
                    Image.asset(
                      'imgs/logo.png',
                      height: 200,
                      fit: BoxFit.contain,
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 32),
                      child:
                          //Text("Digite su nombre Real"),
                          TextFormField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.person),
                          hintText: 'Nombre',
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter some text';
                          }
                        },
                      ),
                    ),
                    Spacer(flex: 2),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 32),
                      //Text("Digite su correo electronico"),
                      child: TextFormField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.email),
                          hintText: 'Email',
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter some text';
                          }
                        },
                      ),
                    ),
                    Spacer(flex: 2),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 32),
                      //Text("Digite su contraseña"),
                      child: TextFormField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.lock),
                          hintText: 'Contraseña',
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter some text';
                          }
                        },
                      ),
                    ),
                    Spacer(),
                    Container(
                      width: 300,
                      height: 50,
                      child: MaterialButton(
                          child: Text('Crear Cuenta',
                              style: TextStyle(color: Colors.black)),
                          color: Colors.white,
                          onPressed: () {
                            model.setLogged(0);
                            if (_formKey.currentState.validate()) {
                              // Si el formulario es válido, queremos mostrar un Snackbar
                              Scaffold.of(context).showSnackBar(
                                  SnackBar(content: Text('Processing Data')));
                            }
                          }),
                    ),
                    Spacer(),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 32),
                      child: Center(
                        child: Text(
                            'Al crear una cuenta estas de acuerdo con nuestros términos y ' +
                                'servicios y nuestra politica de privacidad'),
                      ),
                    ),
                  ],
                ),
              ));
        }));
  }
}
