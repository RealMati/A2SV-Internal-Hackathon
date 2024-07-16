import 'package:ample_click/presentation/widgets/google-login.dart';
import 'package:ample_click/presentation/widgets/auth-textfield.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PharmaSignUp extends StatelessWidget {
  PharmaSignUp({super.key});
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _tinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              const SizedBox(height: 35),
              const Text("Sign up", style: TextStyle(fontSize: 30)),
              const SizedBox(height: 25),
              const GoogleLogin(),
              const SizedBox(height: 40),
              AuthTextField(
                controller: _nameController,
                fieldText: "Pharmacy Name",
                icon: Icons.person,
              ),
              const SizedBox(height: 10),
              AuthTextField(
                controller: _locationController,
                fieldText: "location",
                icon: Icons.location_on,
              ),
              const SizedBox(height: 10),
              AuthTextField(
                controller: _tinController,
                fieldText: "TIN",
                icon: Icons.confirmation_number,
              ),
              const SizedBox(height: 10),
              AuthTextField(
                controller: _phoneController,
                fieldText: "Phone",
                icon: Icons.phone,
              ),
              const SizedBox(height: 10),
              AuthTextField(
                controller: _emailController,
                fieldText: "Email",
                icon: Icons.mail,
              ),
              const SizedBox(height: 10),
              AuthTextField(
                controller: _passwordController,
                fieldText: "Password",
                icon: Icons.lock,
                obscureText: true,
              ),
              const SizedBox(height: 40),
              SizedBox(
                height: 40,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color>(
                      const Color.fromARGB(255, 149, 117, 205),
                    ),
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                  child: const Text(
                    'Sign up',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account?",
                      style: TextStyle(fontSize: 15)),
                  TextButton(
                    onPressed: () {
                      context.go("/pharma/login");
                    },
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                    child: const Text("Sign in"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
