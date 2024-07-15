import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Welcome to Emple Click"),
            SizedBox(
              height: 300,
            ),
            Text("select Role"),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                context.push("/user/login");
              },
              child: Text("User"),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                context.push("/pharma/login");
              },
              child: Text("Pharmacy"),
            ),
          ],
        ),
      ),
    );
  }
}
