import 'package:fca_blog_app/core/theme/app_pallete.dart';
import 'package:fca_blog_app/features/auth/presentation/pages/signup_page.dart';
import 'package:fca_blog_app/features/auth/presentation/widgets/auth-field.dart';
import 'package:fca_blog_app/features/auth/presentation/widgets/auth_gradient_button.dart';
import 'package:flutter/material.dart';

class LoginUpPage extends StatefulWidget {
  const LoginUpPage({super.key});

  @override
  State<LoginUpPage> createState() => _LoginUpPageState();
}

class _LoginUpPageState extends State<LoginUpPage> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  void submit() {
    if (_formKey.currentState!.validate()) {}
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Sign in. ',
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 15),
              AuthFeild(
                hintText: 'Email',
                controller: emailController,
              ),
              const SizedBox(height: 15),
              AuthFeild(
                hintText: 'Password',
                controller: passwordController,
                isObsecure: true,
              ),
              const SizedBox(height: 20),

              //button
              const AuthGradientButton(text: 'Sign in'),
              const SizedBox(height: 20),
              //dont have account
              GestureDetector(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const SignUpPage())),
                child: RichText(
                  text: TextSpan(
                    text: 'Don\'t have an account? ',
                    style: Theme.of(context).textTheme.titleMedium,
                    children: [
                      TextSpan(
                        text: 'Sign up',
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: AppPallete.gradient2,
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
