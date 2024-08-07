import 'package:fca_blog_app/core/cubits/cubit/app_user_cubit.dart';
import 'package:fca_blog_app/core/theme/theme.dart';
import 'package:fca_blog_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:fca_blog_app/features/auth/presentation/pages/login_page.dart';
import 'package:fca_blog_app/features/blog/presentation/pages/blog_page.dart';
import 'package:fca_blog_app/init_dependecies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (_) => serviceLocator<AuthBloc>()),
      BlocProvider(create: (_) => serviceLocator<AppUserCubit>()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  void initState() {
    super.initState();
    context.read<AuthBloc>().add(AuthIsUserLoggedIn());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: Apptheme.darkThemeMode,
      home: BlocSelector<AppUserCubit, AppUserState, bool>(
        selector: (state) {
          return state is AppUserLoggedIn;
        },
        builder: (context, state) {
          if (state) {
            return const BlogPage();
          }
          return const LoginUpPage();
        },
      ),
    );
  }
}
