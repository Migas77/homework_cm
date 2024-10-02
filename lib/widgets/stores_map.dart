import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';


class StoresMap extends StatefulWidget{
  const StoresMap({
    super.key,
  });

  @override
  State<StoresMap> createState() => _StoresMapState();
}

class _StoresMapState extends State<StoresMap> {
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();
  late GoogleMapController _googleMapController;

  static const CameraPosition _kEurope = CameraPosition(
    target: LatLng(49.647714, 4.180428),
    zoom: 4.2,
  );

  /// Determine the current position of the device.
  /// ( From Geolocator example: https://pub.dev/packages/geolocator )
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
  Future<Position> _determinePosition() async {
    print("DETERMINING POSITION");
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    print("Service enabled");
    print(serviceEnabled);
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    print("i'm gonna get it");

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: _determinePosition(),
      builder: (BuildContext context, AsyncSnapshot<Position> snapshot) {
        CameraPosition kCurrentPosition;
        if (snapshot.hasData){
          Position? position = snapshot.data;
           kCurrentPosition = CameraPosition(
            target: LatLng(position!.latitude, position.longitude),
            zoom: 14.4746,
          );
        }
        return Stack(
          children: [
            GoogleMap(
              zoomControlsEnabled: false,
              mapType: MapType.normal,
              initialCameraPosition: _kEurope,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
                _googleMapController = controller;
              },
              myLocationEnabled: true,
            ),
            Positioned(
              right: 10,
              bottom: 10,
              child: IconButton.filled(
                onPressed: () {
                  if (snapshot.hasData){
                    Position? currentLocation = snapshot.data;
                   _googleMapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
                     bearing: 0,
                     target: LatLng(currentLocation!.latitude, currentLocation.longitude),
                     zoom: 17.0,
                   )));
                  }
                },
                icon: const Icon(Icons.near_me_outlined,
                  color: Colors.green,
                  size: 20,
                ),
                style: IconButton.styleFrom(
                  backgroundColor: Colors.white,
                ),
              )
            )
          ]
        );
      }
    );
  }
}