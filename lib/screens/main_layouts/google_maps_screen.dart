import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapsScreen extends StatefulWidget {
  static const String ROUTE_NAME = '/googleMapsScreen';
  @override
  _GoogleMapsScreenState createState() => _GoogleMapsScreenState();
}

class _GoogleMapsScreenState extends State<GoogleMapsScreen> {
  GoogleMapController mapController;

  void _showErrorDialog(String errorMessage) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('خطأ'),
          content: Text(errorMessage),
          actions: [
            FlatButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('إغلاق'),
            ),
          ],
        );
      },
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    try {
      mapController = controller;
    } catch (error) {
      _showErrorDialog('برجاء التأكد من وجود شبكة إنترنت ثم إعادة المحاولة');
    }
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, double> latlng =
        ModalRoute.of(context).settings.arguments;
    print(latlng.toString());
    return GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: LatLng(latlng['lat'], latlng['lon']),
          zoom: 18,
        ),
        compassEnabled: true,
        mapToolbarEnabled: true,
        markers: Set<Marker>.of(
          [
            Marker(
              markerId: MarkerId('الموقع الحالى'),
              position: LatLng(
                latlng['lat'],
                latlng['lon'],
              ),
              infoWindow: InfoWindow(
                title: 'El Watanya',
              ),
            ),
          ],
        ));
  }
}
