import 'package:flutter/material.dart';
import 'package:karma_flutterversion/model/points.dart';
import 'package:karma_flutterversion/providers/authProvider.dart';
import 'package:provider/provider.dart';

class NewReport extends StatefulWidget {
  @override
  NewReports createState() => NewReports();
}

class NewReports extends State<NewReport> {
  final _formKey = GlobalKey<FormState>();
  final tittle = TextEditingController();
  final description = TextEditingController();
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
                    initialValue: lastMapPosition.toString(),
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
                  //Text("Digite su correo electronico"),
                  child: TextFormField(
                    controller: tittle,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.power_input),
                      hintText: 'Nombre Reporte',
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
                    controller: description,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.list),
                      hintText: 'Desciption',
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
                      onAddMarkerButtonPress(tittle.text, description.text);
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
