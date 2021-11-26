import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:karma_flutterversion/providers/authProvider.dart';
import 'package:provider/provider.dart';

class Reports extends StatelessWidget {
  CameraPosition _initialPosition =
      CameraPosition(target: LatLng(26.8206, 30.8025));
  Completer<GoogleMapController> _controller = Completer();

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
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
          body: Container(
            //padding: const EdgeInsets.on,
            child: Stack(
              children: <Widget>[
                GoogleMap(
                  onMapCreated: _onMapCreated,
                  initialCameraPosition: _initialPosition,
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
