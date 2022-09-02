import 'package:firebase_auth/firebase_auth.dart';
import 'package:location/location.dart' as l;
import 'package:provider/provider.dart';
import 'package:sushiapp/config/provider_models/map.dart';
import 'package:sushiapp/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Mapwidget extends StatefulWidget {
  const Mapwidget({super.key});

  @override
  State<Mapwidget> createState() => _MapwidgetState();
}

class _MapwidgetState extends State<Mapwidget> {
  String usId = FirebaseAuth.instance.currentUser!.uid;
  // final Completer<GoogleMapController> _controller = Completer();
  // static const LatLng _initialcameraposition =
  //     LatLng(37.33500926, -122.03272188);
  // static const LatLng destinition = LatLng(37.34500926, -122.02072188);
  List<LatLng> polylineCoordinates = [];
  Map<PolylineId, Polyline> polylines = {};
  Future<l.LocationData>? curruntlocation;

  Set<Marker> markers = {};
  // _addPolyLine() {
  //   PolylineId id = const PolylineId("poly");
  //   Polyline polyline = Polyline(
  //       polylineId: id, color: Colors.red, points: polylineCoordinates);
  //   polylines[id] = polyline;
  //   setState(() {});
  // }

  Future<l.LocationData?> getcurruntLocation() async {
    l.Location location = l.Location();

    bool serviceEnabled;
    l.PermissionStatus permissionGranted;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return null;
      }
    }
    permissionGranted = await location.hasPermission();
    if (permissionGranted == l.PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != l.PermissionStatus.granted) {
        return null;
      }
    }

    curruntlocation = location.getLocation();

    return curruntlocation;
  }

  void getPolyPoints(
    double latf,
    double longf,
  ) async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleApiKey,
      PointLatLng(latf, longf),
      PointLatLng(latf - 0.01, longf),
    );

    if (result.points.isNotEmpty) {
      for (var point in result.points) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      }
    }
    // setState(() {});
  }

  @override
  void initState() {
    getcurruntLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double widthSize = MediaQuery.of(context).size.width;
    final double hightSize = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<l.LocationData?>(
        future: getcurruntLocation(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Stack(
              children: [
                GoogleMap(
                  initialCameraPosition: CameraPosition(
                      target: LatLng(
                          snapshot.data!.latitude!, snapshot.data!.longitude!),
                      zoom: 50.5),
                  markers: {
                    Marker(
                      markerId: const MarkerId('current location'),
                      position: LatLng(
                          snapshot.data!.latitude!, snapshot.data!.longitude!),
                    ),
                  },
                  mapType: MapType.normal,
                  // onMapCreated: _onMapCreated,
                  myLocationEnabled: true,
                  polylines: {
                    Polyline(
                      polylineId: const PolylineId('route'),
                      points: polylineCoordinates,
                      color: Colors.blueAccent,
                      width: 6,
                    ),
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: hightSize * 0.02),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(widthSize * 0.5, hightSize * 0.08),
                          backgroundColor: Colors.lightBlue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        onPressed: () {
                          Provider.of<Mapp>(context, listen: false).getadress(
                              snapshot.data!.latitude!,
                              snapshot.data!.longitude!,
                              usId,
                              context);
                        },
                        child: const Text('Get Your Adress')),
                  ),
                )
              ],
            );
          }
          if (snapshot.hasError) {
            return const Center(
              child: Text('there is an error'),
            );
          }
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.green,
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.black,
            ),
          );
        },
      ),
    );
  }

  // Future<Position> _determineposition() async {
  //   bool serviceEnabled;
  //   LocationPermission permission;
  //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //   if (!serviceEnabled) Future.error('location services are dsable');
  //   permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //     if (permission == LocationPermission.denied) {
  //       Future.error('location permission is dneid');
  //     }
  //   }
  //   if (permission == LocationPermission.deniedForever) {
  //     Future.error('location permission permanently denid');
  //   }
  //   Position position = await Geolocator.getCurrentPosition();
  //   return position;
  // }
}
