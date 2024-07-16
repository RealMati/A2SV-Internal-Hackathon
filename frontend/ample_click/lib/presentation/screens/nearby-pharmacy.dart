import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PharmacySearchScreen extends StatelessWidget {
  const PharmacySearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          '1124 Jupiter, Blackhole, Delhi',
          style: TextStyle(color: Colors.black),
        ),
        leading: const Icon(Icons.location_on, color: Colors.black),
        actions: const [
          Icon(Icons.notifications, color: Colors.black),
          SizedBox(width: 16),
        ],
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search for Pharmacy...',
                prefixIcon: Icon(Icons.search, color: Colors.black),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                GoogleMap(
                  initialCameraPosition: const CameraPosition(
                    target: LatLng(28.7041, 77.1025),
                    zoom: 14,
                  ),
                  markers: {
                    const Marker(
                      markerId: MarkerId('pharmacy1'),
                      position: LatLng(28.7041, 77.1025),
                      infoWindow: InfoWindow(title: 'Mart Drug Store'),
                    ),
                    const Marker(
                      markerId: MarkerId('pharmacy2'),
                      position: LatLng(28.7045, 77.1030),
                      infoWindow: InfoWindow(title: 'Boost Pharmacy'),
                    ),
                  },
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: SizedBox(
                    height: 265,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: const [
                        PharmacyCard(
                          name: 'Mart Drug Store',
                          imageUrl:
                              'https://d27jswm5an3efw.cloudfront.net/app/uploads/2019/08/image-url-3.jpg',
                          address: 'Ground Floor, Mall Groove, Sec-18, Noida',
                          isOpen: true,
                        ),
                        PharmacyCard(
                          name: 'Boost Pharmacy',
                          imageUrl:
                              'https://d27jswm5an3efw.cloudfront.net/app/uploads/2019/08/image-url-3.jpg',
                          address: 'First Floor, Mall Groove, Sec-18, Noida',
                          isOpen: true,
                        ),
                        PharmacyCard(
                          name: 'Star Pharmacy',
                          imageUrl:
                              'https://d27jswm5an3efw.cloudfront.net/app/uploads/2019/08/image-url-3.jpg',
                          address: 'Second Floor, Mall Groove, Sec-18, Noida',
                          isOpen: false,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1, // Set the current index to "Nearby" tab
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: 'Nearby',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class PharmacyCard extends StatelessWidget {
  final String name;
  final String imageUrl;
  final String address;
  final bool isOpen;

  const PharmacyCard({
    super.key,
    required this.name,
    required this.imageUrl,
    required this.address,
    required this.isOpen,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              imageUrl,
              height: 100,
              width: 150,
              fit: BoxFit.cover,
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                } else {
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              (loadingProgress.expectedTotalBytes ?? 1)
                          : null,
                    ),
                  );
                }
              },
              errorBuilder: (BuildContext context, Object exception,
                  StackTrace? stackTrace) {
                return const Text('Failed to load image');
              },
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Text(address, style: const TextStyle(fontSize: 12)),
                    const SizedBox(height: 4),
                    Text(
                      isOpen ? 'Open' : 'Closed',
                      style: TextStyle(
                        color: isOpen ? Colors.green : Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // const Spacer(), // This will push the button to the bottom
                    Center(
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all(
                                const Color.fromARGB(255, 68, 97, 185))),
                        onPressed: () {},
                        child: const Text(
                          'Open',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
