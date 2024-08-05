import 'package:fca_blog_app/core/theme/app_pallete.dart';
import 'package:fca_blog_app/features/auth/presentation/pages/login_page.dart';
import 'package:fca_blog_app/features/auth/presentation/widgets/auth-field.dart';
import 'package:fca_blog_app/features/auth/presentation/widgets/auth_gradient_button.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  void submit() {
    if (_formKey.currentState!.validate()) {}
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Sign Up. ',
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              AuthFeild(
                hintText: 'Name',
                controller: nameController,
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
              const AuthGradientButton(
                text: 'Sign up',
              ),
              const SizedBox(height: 20),
              //dont have account
              GestureDetector(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const LoginUpPage())),
                child: RichText(
                  text: TextSpan(
                    text: 'Already have an Account? ',
                    style: Theme.of(context).textTheme.titleMedium,
                    children: [
                      TextSpan(
                        text: 'Sign in',
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
