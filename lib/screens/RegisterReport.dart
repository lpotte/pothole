import 'package:flutter/material.dart';
import 'package:karma_flutterversion/providers/authProvider.dart';
import 'package:provider/provider.dart';

class NewReport extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Consumer<AuthProvider>(builder: (context, model, child) {
      return Scaffold(
        appBar: AppBar(
              backgroundColor: Colors.orangeAccent,
              title: Row(
                children: [
                  Text("Realizar Reporte"),
                  Spacer(),
                  Image.asset(
                    'imgs/logo.png',
                    height: 50,
                    fit: BoxFit.contain,
                  ),
                ],
              )),
        body: Form(
          key: _formKey,
          child: Container(
            //padding: const EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Spacer(flex: 3),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  //Text("Digite su correo electronico"),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.power_input),
                      hintText: 'Descripción',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                    },
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  //Text("Digite su correo electronico"),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.gps_fixed),
                      hintText: 'Ubición',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                    },
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  //Text("Digite su contraseña"),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.list),
                      hintText: ' Cargar imagnen',
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
                  height: 50,
                  width: 300,
                  child: MaterialButton(
                    child:
                        Text('Registrar reporte', style: TextStyle(color: Colors.white)),
                    color: Colors.orangeAccent,
                    onPressed: () {
                      model.setLogged(3);
                    },
                  ),
                ),
                Spacer(flex: 2),
              ],
            ),
          )),
      );
    }));
  }
}
