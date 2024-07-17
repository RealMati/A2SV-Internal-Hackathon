import 'package:ample_click/presentation/screens/customer-profile.dart';
import 'package:ample_click/presentation/screens/nearby-pharmacy.dart';
import 'package:ample_click/presentation/screens/user_home_inner.dart';
import 'package:flutter/material.dart';

class UserHome extends StatefulWidget {
  UserHome({super.key});

  int _selected = 0;

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  @override
  Widget build(BuildContext context) {
    final pages = [
      const UserHomeInner(),
      const NearbyPharmacy(),
      CustomerProfile()
    ];

    return SafeArea(
      child: Scaffold(
          body: pages[widget._selected],
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.location_pin),
                label: 'Nearby',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
            currentIndex: widget._selected,
            onTap: (index) {
              setState(() {
                widget._selected = index;
              });
            },
          )),
    );
  }
}
