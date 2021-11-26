import 'package:flutter/material.dart';
import 'package:karma_flutterversion/providers/authProvider.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Consumer<AuthProvider>(builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.orangeAccent,
            title: Row(
              children: [
                Text("Perfil de usuario"),
                Spacer(),
                Image.asset(
              'imgs/logo.png',
              height: 50,
              fit: BoxFit.contain,
            ),
              ],
            ) 
          ),
          body: Container(
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Spacer(),
                  Row(
                    children: [
                      Center(
                        child: Text('Bienvenido Diego',
                            style:
                                TextStyle(fontSize: 20, color: Colors.black)),
                      ),
                      Spacer(),
                      Center(
                        child: Image.asset(
                          'imgs/campana.png',
                          height: 30,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Center(
                        child: Image.asset(
                          'imgs/fotousuario.png',
                          height: 50,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Container(
                        height: 150,
                        width: 300,
                        decoration: new BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.orangeAccent,
                        ),
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text('Nombre:',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white)),
                                Spacer(),
                                Text('Diego Albor',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white)),
                              ],
                            ),
                            Row(
                              children: [
                                Text('Ocupación: ',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.white)),
                                Spacer(),
                                Text('Estudiante',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.white)),
                              ],
                            ),
                            Spacer(),
                            Row(
                              children: [
                                Text('Nivel',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white)),
                                Spacer(),
                                Text('Novato',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white))
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Spacer(flex: 2),
                  MaterialButton(
                      onPressed: () {
                        model.setLogged(0);
                      },
                      child:
                          Text('Logout', style: TextStyle(color: Colors.white)),
                      color: Colors.orangeAccent),
                ],
              )),
        );
      }),
    );
  }
}
