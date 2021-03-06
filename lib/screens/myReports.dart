import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:karma_flutterversion/model/points.dart';
import 'package:karma_flutterversion/providers/authProvider.dart';
import 'package:karma_flutterversion/screens/Reports.dart';
import 'package:provider/provider.dart';

import '../model/favor.dart';
import 'chat.dart';
import 'details.dart';

class MyReports extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => Report();
}
bool _page = true;
favor f;
class Report extends State<MyReports> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
              backgroundColor: Colors.orangeAccent,
              title: Row(
                children: [
                  Text("Mis Reportes"),
                  Spacer(),
                  Image.asset(
                    'imgs/logo.png',
                    height: 50,
                    fit: BoxFit.contain,
                  ),
                ],
              )),
      body: Container(
          color: Colors.white,
          child: Center(
            child: Consumer<AuthProvider>(builder: (context, model, child) {
              if (_page) {
                llenarfavs();
                return ListView(children: 
                  markersList.map(_buildItem).toList(),
                );
              } else {
                return FavorDetails(f);
              }
            }),
          ),
        ),
    );
  }

  Widget _buildItem(Marker mark) {
  return Card (
    child: ListTile(
      title: new Text(mark.infoWindow.title),
      subtitle: new Text('Ubicación: ${mark.position} \n Description: ${mark.infoWindow.snippet}'),
      leading: new Icon(Icons.map),
      onTap: (){
        setState(() {
          _page = !_page;
        });
      },
    )
  );
}
}



