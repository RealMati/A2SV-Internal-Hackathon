import 'package:ample_click/presentation/screens/onboarding.dart';
import 'package:ample_click/presentation/screens/pharma-login.dart';
import 'package:ample_click/presentation/screens/pharma-signup.dart';
import 'package:ample_click/presentation/screens/user-login.dart';
import 'package:ample_click/presentation/screens/user-signup.dart';
import 'package:ample_click/presentation/screens/location-to-pharmacy.dart';

import 'package:ample_click/presentation/screens/nearby-pharmacy.dart';
import 'package:ample_click/presentation/screens/pharmacy-detail.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

final _router = GoRouter(
  initialLocation: '/onboarding',
  routes: [
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const Onboarding(),
    ),
    GoRoute(
      path: '/user/login',
      builder: (context, state) => UserLogin(),
    ),
    GoRoute(
      path: '/user/signup',
      builder: (context, state) => UserSignUp(),
    ),
    GoRoute(
      path: '/pharma/login',
      builder: (context, state) => PharmaLogin(),
    ),
    GoRoute(
      path: '/pharma/signup',
      builder: (context, state) => PharmaSignUp(),
    ),
    GoRoute(
      path: '/nearbyPharmacy',
      builder: (context, state) => const PharmacySearchScreen(),
    ),
    GoRoute(
      path: '/pharmacyDetail',
      builder: (context, state) => const PharmacyDetail(),
    ),
    GoRoute(
      path: '/locationToPharmacy',
      builder: (context, state) => const LocationToPharmacyScreen(),
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Emple Clcik',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: _router,
    );
  }
}
