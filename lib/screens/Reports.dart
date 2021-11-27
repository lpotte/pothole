import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:karma_flutterversion/providers/authProvider.dart';
import 'package:provider/provider.dart';
import '../model/points.dart';

class Reports extends StatefulWidget {
  @override
  ReportsReports createState() => ReportsReports();
}

class ReportsReports extends State<Reports> {
  CameraPosition _initialPosition =
      CameraPosition(target: LatLng(45.521563, -122.677433));
  Completer<GoogleMapController> _controller = Completer();

  MapType _currentMapType = MapType.normal;

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  void _onCameraMove(CameraPosition position) {
    lastMapPosition = position.target;
  }

  void _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Consumer<AuthProvider>(builder: (context, model, child) {
        return Scaffold(
            appBar: AppBar(
                backgroundColor: Colors.orangeAccent,
                title: Row(
                  children: [
                    Text("Reportes públicos"),
                    Spacer(),
                    Image.asset(
                      'imgs/logo.png',
                      height: 50,
                      fit: BoxFit.contain,
                    ),
                  ],
                )),
            body: Stack(
              children: <Widget>[
                GoogleMap(
                  onMapCreated: _onMapCreated,
                  initialCameraPosition: CameraPosition(
                    target: lastMapPosition,
                    zoom: 17.0,
                  ),
                  mapType: _currentMapType,
                  markers: markersList,
                  onCameraMove: _onCameraMove,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                    //alignment: Alignment.center,
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 10.0),
                        Center(
                            child: FloatingActionButton(
                          onPressed: () {
                            model.setLogged(3);
                          },
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          backgroundColor: Colors.green,
                          child: const Icon(Icons.add_location, size: 30.0),
                        )),
                      ],
                    ),
                  ),
                ),
              ],
            ));
      }),
    );
  }
}
