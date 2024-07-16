import 'package:ample_click/presentation/widgets/google-login.dart';
import 'package:ample_click/presentation/widgets/auth-textfield.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UserSignUp extends StatelessWidget {
  UserSignUp({super.key});
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              const SizedBox(height: 50),
              const Text("Sign up", style: TextStyle(fontSize: 30)),
              const SizedBox(height: 30),
              const GoogleLogin(),
              const SizedBox(height: 45),
              AuthTextField(
                controller: _nameController,
                fieldText: "Name",
                icon: Icons.person,
              ),
              const SizedBox(height: 20),
              AuthTextField(
                controller: _phoneController,
                fieldText: "Phone",
                icon: Icons.phone,
              ),
              const SizedBox(height: 20),
              AuthTextField(
                controller: _emailController,
                fieldText: "Email",
                icon: Icons.mail,
              ),
              const SizedBox(height: 20),
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
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account?",
                      style: TextStyle(fontSize: 15)),
                  TextButton(
                    onPressed: () {
                      context.go("/user/login");
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
