import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:too_good_to_go_clone/data/stores.dart';

import '../animations/slide_animations.dart';
import '../mycolors/colors.dart';
import '../providers/stock_stores_state.dart';
import '../screens/store_screen.dart';


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
  final ClusterManagerId clusterManagerId = const ClusterManagerId("stores");
  late ClusterManager clusterManager;
  final Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  bool isButtonVisible = false;
  VoidCallback? followStoreLink;

  static const CameraPosition _kEurope = CameraPosition(
    target: LatLng(49.647714, 4.180428),
    zoom: 4.2,
  );

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  @override
  void initState() {
    super.initState();
    clusterManager = ClusterManager(
      clusterManagerId: clusterManagerId,
      onClusterTap: (Cluster cluster) async {
        double zoom = await _googleMapController.getZoomLevel();
        double newZoom = zoom < 11 ? 11 : zoom + 2;
        debugPrint('Zoom: $zoom');
        debugPrint('New Zoom: $newZoom');
        _googleMapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
          bearing: 0,
          target: cluster.position,
          zoom: newZoom,
        )));
      },
    );
  }

  void _addStoresToCluster(ClusterManager clusterManager, List<Store> stores) {
    stores.asMap().forEach((int index, Store store) {
      MarkerId markerId = MarkerId(index.toString());
      markers[markerId] = Marker(
          clusterManagerId: clusterManagerId,
          markerId: markerId,
          position: store.location,
          icon: BitmapDescriptor.defaultMarker,
          infoWindow: InfoWindow(
            title: store.name,
            snippet: store.address,
          ),
          onTap: () {
            setState(() {
              isButtonVisible = true;
              followStoreLink = () {
                Navigator.push(context, createRouteSlideIn(StoreScreen(store: store)));
              };
            });
          },
      );
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    StockState stockState = context.watch<StockState>();
    _addStoresToCluster(clusterManager, stockState.stores);

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
              myLocationButtonEnabled: false,
              mapToolbarEnabled: false,
              markers: Set<Marker>.of(markers.values),
              clusterManagers: <ClusterManager>{clusterManager},
              onTap: (LatLng latLng) {
                setState(() {
                  isButtonVisible = false;
                });
              },
            ),
            AnimatedPositioned(
              right: isButtonVisible ? 10 : -100,
              bottom: 56,
              duration: const Duration(milliseconds: 500),
              child: IconButton.filled(
                onPressed: () => followStoreLink!(),
                icon: const Icon(Icons.shopping_bag_outlined,
                  color: MyColorPalette.darkGreen,
                  size: 20,
                ),
                style: IconButton.styleFrom(
                  backgroundColor: Colors.white,
                ),
              ),
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
                  color: MyColorPalette.darkGreen,
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