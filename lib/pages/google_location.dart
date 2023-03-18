import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> openMap(double latitude, double longitude) async {
  final url =
      'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
  if (await canLaunch(url)) {
    _openInMaps(url);
  } else {
    throw 'Could not launch $url';
  }
}

Future<void> _openInMaps(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;
  Location location = Location();
  late LatLng currentLatLng;
  LocationData? savedLocationData;

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }

  void getCurrentLocation() async {
    LocationData locationData = await location.getLocation();
    if (locationData.latitude != null && locationData.longitude != null) {
      setState(() {
        currentLatLng = LatLng(locationData.latitude!, locationData.longitude!);
        savedLocationData = locationData; // Save location data
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map Screen'),
        actions: [
          ElevatedButton(
            onPressed: () {
              openMap(currentLatLng.latitude, currentLatLng.longitude);
            },
            child: Text('Open in Maps'),
          ),
        ],
      ),
      body: currentLatLng != null
          ? GoogleMap(
              onMapCreated: (controller) {
                mapController = controller;
              },
              initialCameraPosition: CameraPosition(
                target: currentLatLng,
                zoom: 16.0,
              ),
              markers: Set<Marker>.of([
                Marker(
                  markerId: MarkerId('marker_id'),
                  position: currentLatLng,
                  infoWindow: InfoWindow(title: 'Current Location'),
                ),
              ]),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
