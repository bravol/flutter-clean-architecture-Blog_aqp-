import 'package:fca_blog_app/core/theme/theme.dart';
import 'package:fca_blog_app/features/auth/presentation/pages/signup_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: Apptheme.darkThemeMode,
      home: const SignUpPage(),
    );
  }
}
