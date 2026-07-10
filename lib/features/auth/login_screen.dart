import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/theme/app_colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _rememberMe = false;
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    // Temporary login
    context.go('/dashboard');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),

          child: Column(
            children: [

              const SizedBox(height: 30),

              Image.asset(
                "assets/images/logo.png",
                width: 110,
              ),

              const SizedBox(height: 20),

              const Text(
                "Welcome Back",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              Text(
                "Sign in to continue",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade600,
                ),
              ),

              const SizedBox(height: 35),

              Card(
                elevation: 4,

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22),
                ),

                child: Padding(
                  padding: const EdgeInsets.all(24),

                  child: Column(
                    children: [

                      TextField(
                        controller: _emailController,

                        keyboardType: TextInputType.emailAddress,

                        decoration: const InputDecoration(
                          labelText: "Email",
                          prefixIcon: Icon(Icons.email_outlined),
                        ),
                      ),

                      const SizedBox(height: 18),

                      TextField(
                        controller: _passwordController,

                        obscureText: _obscurePassword,

                        decoration: InputDecoration(
                          labelText: "Password",

                          prefixIcon: const Icon(Icons.lock_outline),

                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },

                            icon: Icon(
                              _obscurePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 10),

                      Row(
                        children: [

                          Checkbox(
                            value: _rememberMe,

                            onChanged: (value) {
                              setState(() {
                                _rememberMe = value!;
                              });
                            },
                          ),

                          const Text("Remember Me"),

                          const Spacer(),

                          TextButton(
                            onPressed: () {},

                            child: const Text("Forgot Password?"),
                          ),
                        ],
                      ),

                      const SizedBox(height: 15),

                      SizedBox(
                        width: double.infinity,

                        height: 56,

                        child: ElevatedButton.icon(
                          onPressed: _login,

                          icon: const Icon(Icons.login),

                          label: const Text(
                            "Sign In",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 30),

              Text(
                "NephroGuard BD",
                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              Text(
                "AI-powered diabetic nephropathy risk prediction",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey.shade600,
                ),
              ),

              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}