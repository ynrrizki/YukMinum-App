// ! unifinished feature

// ? problem because can't access polyline on maps
// ? problem because api is not free okei, AOWKOWKOWKE

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class StoreLocation extends StatefulWidget {
  const StoreLocation({Key? key}) : super(key: key);

  @override
  State<StoreLocation> createState() => _StoreLocationState();
}

class _StoreLocationState extends State<StoreLocation> {
  late GoogleMapController mapController;

  static const LatLng _userLoc = LatLng(-6.295279805074747, 106.90023285524578);
  static const LatLng _outletLoc =
      LatLng(-6.332849118201021, 106.89807705524606);
  final Set<Marker> _markers = {
    const Marker(
      markerId: MarkerId("user_location"),
      position: _userLoc,
      infoWindow: InfoWindow(
        title: 'Yanuar Rizki Sanjaya',
      ),
    ),
    const Marker(
      markerId: MarkerId("outlet1"),
      position: _outletLoc,
      infoWindow: InfoWindow(
        title: 'YukMinum',
      ),
    ),
  };

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Completer<GoogleMapController> _controller = Completer();

  // static final CameraPosition _kGooglePlex = CameraPosition(
  //   target: LatLng(37.42796133580664, -122.085749655962),
  //   zoom: 14.4746,
  // );

  // static final CameraPosition _kLake = CameraPosition(
  //     bearing: 192.8334901395799,
  //     target: LatLng(37.43296265331129, -122.08832357078792),
  //     tilt: 59.440717697143555,
  //     zoom: 19.151926040649414);

  List<LatLng> polylineCoordinates = [];

  void getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      "AIzaSyAcO8Ub-YqCWUEpMLXgKM-6XzekjDATcrE",
      PointLatLng(_userLoc.latitude, _userLoc.longitude),
      PointLatLng(_outletLoc.latitude, _outletLoc.longitude),
    );

    if (result.points.isNotEmpty) {
      result.points.forEach(
        (PointLatLng point) => polylineCoordinates.add(
          LatLng(point.latitude, point.longitude),
        ),
      );
      setState(() {});
    }
  }

  @override
  void initState() {
    getPolyPoints();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        LayoutBuilder(builder: (context, BoxConstraints constraints) {
          return SizedBox(
            height: constraints.maxHeight / 1,
            child: GoogleMap(
              polylines: {
                Polyline(
                  polylineId: PolylineId("route"),
                  points: polylineCoordinates,
                  // color: Colors.blue,
                ),
              },
              initialCameraPosition: const CameraPosition(
                target: _userLoc,
                zoom: 13,
              ),
              markers: _markers,
            ),
          );
        }),
        // DraggableScrollableSheet(
        //   initialChildSize: 0.5,
        //   minChildSize: 0.1,
        //   maxChildSize: 1,
        //   snapSizes: [0.5, 1],
        //   builder: ((context, scrollController) {
        //     return Container(
        //       decoration: const BoxDecoration(
        //         color: Colors.white,
        //         borderRadius: BorderRadius.only(
        //           topLeft: Radius.circular(40),
        //           topRight: Radius.circular(40),
        //         ),
        //         boxShadow: [
        //           BoxShadow(
        //             blurRadius: 4,
        //             color: Color.fromARGB(68, 0, 0, 0),
        //           ),
        //         ],
        //       ),
        //       child: ListView.builder(
        //           itemCount: 10,
        //           controller: scrollController,
        //           itemBuilder: ((context, index) {
        //             if (index == 0) {
        //               return Column(
        //                 children: const [
        //                   SizedBox(
        //                     width: 50,
        //                     child: Divider(
        //                       thickness: 5,
        //                     ),
        //                   )
        //                 ],
        //               );
        //             }
        //             return const Card();
        //           })),
        //     );
        //   }),
        // ),
      ],
    );
  }
}

// Scaffold(
//       body: GoogleMap(
//         mapType: MapType.hybrid,
//         initialCameraPosition: _kGooglePlex,
//         onMapCreated: (GoogleMapController controller) {
//           _controller.complete(controller);
//         },
//       ),
//       floatingActionButton: FloatingActionButton.extended(
//         onPressed: _goToTheLake,
//         label: Text('To the lake!'),
//         icon: Icon(Icons.directions_boat),
//       ),
//     );

// Future<void> _goToTheLake() async {
//     final GoogleMapController controller = await _controller.future;
//     controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
//   }
