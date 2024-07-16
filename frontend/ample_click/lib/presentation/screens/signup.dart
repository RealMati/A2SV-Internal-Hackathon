import 'package:ample_click/application/auth/signup/signup_provider.dart';
import 'package:ample_click/application/auth/signup/signup_state.dart';
import 'package:ample_click/infrastructure/auth/pharma/pharma_signup_dto.dart';
import 'package:ample_click/infrastructure/auth/user/user_signup_dto.dart';
import 'package:ample_click/presentation/widgets/google-login.dart';
import 'package:ample_click/presentation/widgets/auth-textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SignUp extends ConsumerWidget {
  SignUp({super.key});
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  void userSignupHandler(WidgetRef ref) {
    final userDto = UserSignupDTO(
      name: _nameController.text,
      email: _emailController.text,
      password: _passwordController.text,
      confirmPassword: _confirmPasswordController.text,
    );

    ref.read(userSignupProvider.notifier).userSignup(userDto);
  }

  void pharmaSignupHandler(WidgetRef ref) {
    final pharmaDto = PharmaSignupDTO(
      name: _nameController.text,
      email: _emailController.text,
      password: _passwordController.text,
      confirmPassword: _confirmPasswordController.text,
    );
    ref.read(pharmaSignupProvider.notifier).pharmaSignup(pharmaDto);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(pharmaSignupProvider, (prev, nxt) {
      if (nxt is PharmaSignupSuccess) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Account created succesfully!"),
            backgroundColor: Color.fromARGB(255, 73, 158, 27),
          ),
        );
        Future.delayed(const Duration(milliseconds: 1500))
            .then((d) => context.go("/login"));
      } else if (nxt is PharmaSignupFailure) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(nxt.error),
            backgroundColor: const Color.fromARGB(255, 212, 47, 47),
          ),
        );
        ref.read(pharmaSignupProvider.notifier).resetState();
      }
    });

    ref.listen(userSignupProvider, (prev, nxt) {
      if (nxt is UserSignupSuccess) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Account created succesfully!"),
            backgroundColor: Color.fromARGB(255, 73, 158, 27),
          ),
        );
        Future.delayed(const Duration(milliseconds: 1500))
            .then((d) => context.go("/login"));
      } else if (nxt is UserSignupFailure) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(nxt.error),
            backgroundColor: const Color.fromARGB(255, 212, 47, 47),
          ),
        );
        ref.read(userSignupProvider.notifier).resetState();
      }
    });

    return Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              const SizedBox(height: 45),
              const Text("Sign up", style: TextStyle(fontSize: 30)),
              const SizedBox(height: 30),
              const GoogleLogin(),
              const SizedBox(height: 45),
              AuthTextField(
                controller: _nameController,
                fieldText: "Name",
                icon: Icons.person,
              ),
              const SizedBox(height: 14),
              AuthTextField(
                controller: _phoneController,
                fieldText: "Phone",
                icon: Icons.phone,
              ),
              const SizedBox(height: 14),
              AuthTextField(
                controller: _emailController,
                fieldText: "Email",
                icon: Icons.mail,
              ),
              const SizedBox(height: 14),
              AuthTextField(
                controller: _passwordController,
                fieldText: "Password",
                icon: Icons.lock,
                obscureText: true,
              ),
              const SizedBox(height: 14),
              AuthTextField(
                controller: _confirmPasswordController,
                fieldText: "Confirm Password",
                icon: Icons.lock,
                obscureText: true,
              ),
              const SizedBox(height: 35),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("    Sign-up as", style: TextStyle(fontSize: 16)),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      SizedBox(
                        height: 40,
                        width: MediaQuery.of(context).size.width / 2.5,
                        child: ElevatedButton(
                          onPressed: () {
                            pharmaSignupHandler(ref);
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
                            userSignupHandler(ref);
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
              const SizedBox(height: 14),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account?",
                      style: TextStyle(fontSize: 15)),
                  TextButton(
                    onPressed: () {
                      context.go("/login");
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
