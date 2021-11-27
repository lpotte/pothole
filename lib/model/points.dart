import 'package:google_maps_flutter/google_maps_flutter.dart';

const LatLng center = const LatLng(11.000025, -74.800360);
LatLng lastMapPosition = center;

final Set<Marker> markersList = {
  new Marker(
    // This marker id can be anything that uniquely identifies each marker.
    markerId: MarkerId('Mark'),
    position: const LatLng(11.000025, -74.800360),
    infoWindow: InfoWindow(
      title: 'Bache en la 72',
      snippet: 'La calle está un poco picada, puede dañar los carros bajos',
    ),
    icon: BitmapDescriptor.defaultMarker,
  )
};

Marker new_marker(String report, String description) {
  new Marker(
    // This marker id can be anything that uniquely identifies each marker.
    markerId: MarkerId('Mark'),
    position: lastMapPosition,
    infoWindow: InfoWindow(
      title: report,
      snippet: description,
    ),
    icon: BitmapDescriptor.defaultMarker,
  );
}
void onAddMarkerButtonPress(String report, String description) {
  markersList.add(Marker(
    // This marker id can be anything that uniquely identifies each marker.
    markerId: MarkerId(lastMapPosition.toString()),
    position: lastMapPosition,
    infoWindow: InfoWindow(
      title: report.toString(),
      snippet: description.toString(),
    ),
    icon: BitmapDescriptor.defaultMarker,
  ));
}

void onAddMarkerButtonPressed() {
  markersList.add(Marker(
    // This marker id can be anything that uniquely identifies each marker.
    markerId: MarkerId(lastMapPosition.toString()),
    position: lastMapPosition,
    infoWindow: InfoWindow(
      title: 'Bache en la 72',
      snippet: 'La calle está un poco picada, puede dañar los carros bajos',
    ),
    icon: BitmapDescriptor.defaultMarker,
  ));
}
