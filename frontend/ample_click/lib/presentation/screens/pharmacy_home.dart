import 'package:ample_click/presentation/screens/pharma_home_inner.dart';
import 'package:ample_click/presentation/screens/pharma_store.dart';
import 'package:ample_click/presentation/screens/pharmacy_profile.dart';
import 'package:flutter/material.dart';

class PharmacyHome extends StatefulWidget {
  PharmacyHome({super.key});

  int _selected = 0;

  @override
  State<PharmacyHome> createState() => _PharmacyHomeState();
}

class _PharmacyHomeState extends State<PharmacyHome> {
  @override
  Widget build(BuildContext context) {
    final pharmaPages = [
      const PharmaHomeInner(),
      const PharmacyStore(),
      PharmacyProfile()
    ];
    return SafeArea(
        child: Scaffold(
      body: pharmaPages[widget._selected],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.storefront_outlined),
            label: 'On Store',
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
      ),
    ));
  }
}
