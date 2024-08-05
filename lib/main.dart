import 'package:fca_blog_app/core/theme/theme.dart';
import 'package:fca_blog_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:fca_blog_app/features/auth/presentation/pages/login_page.dart';
import 'package:fca_blog_app/init_dependecies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (_) => serviceLocator<AuthBloc>()),
    ],
    child: const MyApp(),
  ));
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
      home: const LoginUpPage(),
    );
  }
}
