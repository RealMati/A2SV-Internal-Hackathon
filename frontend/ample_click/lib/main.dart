import 'package:ample_click/presentation/screens/customer-profile.dart';
import 'package:ample_click/presentation/screens/pharmacy_profile.dart';
import 'package:ample_click/presentation/screens/signup.dart';
import 'package:ample_click/presentation/screens/pharma_store.dart';
import 'package:ample_click/presentation/screens/pharmacy_home.dart';
import 'package:ample_click/presentation/screens/user_home.dart';
import 'package:ample_click/presentation/screens/user_searched_med_detail.dart';
import 'package:ample_click/presentation/screens/onboarding.dart';
import 'package:ample_click/presentation/screens/pharma-login.dart';
import 'package:ample_click/presentation/screens/pharma-signup.dart';
import 'package:ample_click/presentation/screens/login.dart';
import 'package:ample_click/presentation/screens/location-to-pharmacy.dart';

import 'package:ample_click/presentation/screens/nearby-pharmacy.dart';
import 'package:ample_click/presentation/screens/pharmacy-detail.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

final _router = GoRouter(
  initialLocation: '/pharma/home',
  routes: [
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const Onboarding(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => Login(),
    ),
    GoRoute(
      path: '/signup',
      builder: (context, state) => SignUp(),
    ),
    GoRoute(
      path: '/user/home',
      builder: (context, state) => UserHome(),
    ),
    GoRoute(
      path: '/user/searched_med_detail',
      builder: (context, state) => const UserSearchedMedDetail(),
    ),
    GoRoute(
      path: '/user/profile',
      builder: (context, state) => CustomerProfile(),
    ),
    GoRoute(
      path: '/pharma/profile',
      builder: (context, state) => PharmacyProfile(),
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
      path: '/pharma/home',
      builder: (context, state) => PharmacyHome(),
    ),
    GoRoute(
      path: '/pharma/store',
      builder: (context, state) => const PharmacyStore(),
    ),
    GoRoute(
      path: '/nearbyPharmacy',
      builder: (context, state) => const NearbyPharmacy(),
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
        textTheme: const TextTheme(
            titleLarge: TextStyle(fontFamily: 'Roboto', fontSize: 22),
            titleMedium: TextStyle(fontFamily: 'Roboto', fontSize: 18),
            bodyMedium: TextStyle(fontFamily: 'alice', fontSize: 16),
            bodySmall: TextStyle(
              fontFamily: 'alice',
            )),
        useMaterial3: true,
      ),
      routerConfig: _router,
    );
  }
}
