import 'package:ample_click/screens/pharmacy_home.dart';
import 'package:ample_click/screens/user_home.dart';
import 'package:ample_click/screens/onboarding.dart';
import 'package:ample_click/screens/pharma-login.dart';
import 'package:ample_click/screens/pharma-signup.dart';
import 'package:ample_click/screens/user-login.dart';
import 'package:ample_click/screens/user-signup.dart';
import 'package:ample_click/screens/user_searched_med_detail.dart';
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
      path: '/user/home',
      builder: (context, state) => const UserHome(),
    ),
    GoRoute(
      path: '/user/searched_med_detail',
      builder: (context, state) => const UserSearchedMedDetail(),
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
      builder: (context, state) => const PharmacyHome(),
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
