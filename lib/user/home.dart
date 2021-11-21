import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:collection';
import 'dart:async';

class Homeuser extends StatefulWidget {
  Homeuser({Key? key, m_username}) : super(key: key);

  @override
  _HomeuserState createState() => _HomeuserState();
}

class _HomeuserState extends State<Homeuser> {
  LatLng currentLocation = LatLng(17.56777611860041, 99.95414081379923);
  Set<Polygon> _polygons = HashSet<Polygon>();
  Set<Polyline> _polylines = HashSet<Polyline>();
  Set<Circle> _circles = HashSet<Circle>();
  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> _createMarker() {
    var marker = Set<Marker>();
    marker.add(Marker(
      markerId: MarkerId("Jackie"),
      position: currentLocation,
      infoWindow: InfoWindow(
        snippet:
            "Lat ${currentLocation.latitude} - Lng ${currentLocation.longitude} ",
      ),
      draggable: true,
      onDragEnd: onDragEnd,
    ));

    return marker;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: currentLocation,
                zoom: 14.0,
              ),
              mapType: MapType.normal,
              // onMapCreated: (GoogleMapController googleMapController) {},
              polygons: _polygons,
              polylines: _polylines,
              circles: _circles,
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              minMaxZoomPreference: MinMaxZoomPreference(12, 18.6),
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              markers: _createMarker(),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 50, left: 30),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.menu, color: Colors.black,)
                  ],
                )
              ],
            )
          )
        ],
      ),
    );
  }

  onDragEnd(LatLng position) {
    print("nueva posicion $position");
  }
}
