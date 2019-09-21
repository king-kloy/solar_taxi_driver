import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();

  LatLng _center;
  Position currentLocation;

  @override
  initState() {
    // implement initState
    super.initState();
    _getCurrentLocation();
  }

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(6.6806013, -1.5738029),
    zoom: 17.0,
    // tilt: 59.440717697143555,
  );

  Widget button(Function function, IconData icon) {
    return FloatingActionButton(
      elevation: 0.0,
      onPressed: function,
      materialTapTargetSize: MaterialTapTargetSize.padded,
      backgroundColor: Colors.transparent,
      child: Icon(
        icon,
        size: 50.0,
        color: (Colors.blue),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Stack(
        children: <Widget>[
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 2,
                  ),
                  button(_getCurrentLocation, Icons.my_location),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<Position> locateUser() async {
    GeolocationStatus geolocationStatus =
        await Geolocator().checkGeolocationPermissionStatus();
    print('Geolocation Status $geolocationStatus');

    return Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }

  Future<void> _getCurrentLocation() async {
    currentLocation = await locateUser();
    setState(() {
      _center = LatLng(currentLocation.latitude, currentLocation.longitude);
    });

    print('Center $_center');

    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        // bearing: 192.8334901395799,
        target: _center,
        // tilt: 59.440717697143555,
        zoom: 17.0)));
  }
}
