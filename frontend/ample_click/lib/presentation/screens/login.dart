import 'package:ample_click/application/auth/login/login_provider.dart';
import 'package:ample_click/presentation/widgets/google-login.dart';
import 'package:ample_click/presentation/widgets/auth-textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class Login extends ConsumerWidget {
  Login({super.key});
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  void userLoginHandler(WidgetRef ref) {
    ref
        .read(userLoginProvider.notifier)
        .loginUser(_emailController.text, _passwordController.text);
  }

  void pharmaLoginHandler(WidgetRef ref) {
    ref
        .read(pharmaLoginProvider.notifier)
        .loginPharma(_emailController.text, _passwordController.text);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(userLoginProvider, (prev, nxt) {
      if (nxt.errors.isEmpty && nxt.token.isNotEmpty) {
        context.go("/user/home");
      }

      if (nxt.errors.isNotEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(nxt.errors[0]),
            backgroundColor: const Color.fromARGB(255, 212, 47, 47),
          ),
        );

        ref.read(userLoginProvider.notifier).clearErrors();
      }
    });

    ref.listen(pharmaLoginProvider, (prev, nxt) {
      if (nxt.errors.isEmpty && nxt.token.isNotEmpty) {
        context.go("/pharma/home");
      }

      if (nxt.errors.isNotEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(nxt.errors[0]),
            backgroundColor: const Color.fromARGB(255, 212, 47, 47),
          ),
        );

        ref.read(pharmaLoginProvider.notifier).clearErrors();
      }
    });

    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              const SizedBox(height: 50),
              const Text("Sign in", style: TextStyle(fontSize: 30)),
              const SizedBox(height: 30),
              const GoogleLogin(),
              const SizedBox(height: 65),
              AuthTextField(
                controller: _emailController,
                fieldText: "Email",
                icon: Icons.mail,
              ),
              const SizedBox(height: 30),
              AuthTextField(
                controller: _passwordController,
                fieldText: "Password",
                icon: Icons.lock,
                obscureText: true,
              ),
              const SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      // context.go("/user/forgot-password");
                    },
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                    child: const Text("Forgot password?"),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("    Sign-in as", style: TextStyle(fontSize: 16)),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      SizedBox(
                        height: 40,
                        width: MediaQuery.of(context).size.width / 2.5,
                        child: ElevatedButton(
                          onPressed: () {
                            pharmaLoginHandler(ref);
                          },
                          style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all<Color>(
                              const Color.fromARGB(255, 149, 117, 205),
                            ),
                            shape:
                                WidgetStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                          child: const Text(
                            'Pharmacy',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      SizedBox(
                        height: 40,
                        width: MediaQuery.of(context).size.width / 2.5,
                        child: ElevatedButton(
                          onPressed: () {
                            userLoginHandler(ref);
                          },
                          style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all<Color>(
                              const Color.fromARGB(255, 149, 117, 205),
                            ),
                            shape:
                                WidgetStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                          child: const Text(
                            'User',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?",
                      style: TextStyle(fontSize: 15)),
                  TextButton(
                    onPressed: () {
                      context.go("/signup");
                    },
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                    child: const Text("Sign up"),
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
