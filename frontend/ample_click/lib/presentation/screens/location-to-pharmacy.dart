import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationToPharmacyScreen extends StatelessWidget {
  const LocationToPharmacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Downtown Pharmacy',
          style: TextStyle(color: Colors.black),
        ),
        leading: const Icon(Icons.arrow_back, color: Colors.black),
        actions: const [
          Icon(Icons.notifications, color: Colors.black),
          SizedBox(width: 16),
        ],
      ),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: const CameraPosition(
              target: LatLng(28.7041, 77.1025),
              zoom: 14,
            ),
            polylines: {
              const Polyline(
                polylineId: PolylineId('route'),
                points: [
                  LatLng(28.7041, 77.1025),
                  LatLng(28.7041, 77.2025),
                ],
                color: Colors.blue,
                width: 5,
              ),
            },
            markers: {
              const Marker(
                markerId: MarkerId('start'),
                position: LatLng(28.7041, 77.1025),
                infoWindow: InfoWindow(title: '7958 Swift Village'),
              ),
              const Marker(
                markerId: MarkerId('end'),
                position: LatLng(28.7041, 77.2025),
                infoWindow: InfoWindow(title: 'Downtown Pharmacy'),
              ),
            },
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ibuprofen',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'AVAILABLE AMOUNT: 51-100',
                    style: TextStyle(color: Colors.blue, fontSize: 14),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Icon(Icons.location_pin, color: Colors.blue),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          '7958 Swift Village',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Divider(),
                  Row(
                    children: [
                      Icon(Icons.location_pin, color: Colors.red),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'Downtown Pharmacy',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            'DISTANCE',
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '12 km',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            'ESTIMATED TIME',
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '50 min',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 16,
            right: 16,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 6,
                  ),
                ],
              ),
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.black),
                onPressed: () {
                  // Close action
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
