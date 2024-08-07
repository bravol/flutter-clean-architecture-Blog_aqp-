import 'package:fca_blog_app/core/cubits/cubit/app_user_cubit.dart';
import 'package:fca_blog_app/core/secrets/app_secrets.dart';
import 'package:fca_blog_app/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:fca_blog_app/features/auth/data/repository/auth_repository_implementation.dart';
import 'package:fca_blog_app/features/auth/domain/repository/auth_repository.dart';
import 'package:fca_blog_app/features/auth/domain/usecases/curent_user.dart';
import 'package:fca_blog_app/features/auth/domain/usecases/user_login.dart';
import 'package:fca_blog_app/features/auth/domain/usecases/user_sign_up.dart';
import 'package:fca_blog_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final serviceLocator = GetIt.asNewInstance();
Future<void> initDependencies() async {
  _initAuth();
  final supabase = await Supabase.initialize(
    url: AppSecrets.supabaseUrl,
    anonKey: AppSecrets.anonKey,
  );
  serviceLocator.registerLazySingleton(() => supabase.client);
  //core
  serviceLocator.registerLazySingleton(() => AppUserCubit());
}
// await Firebase.initializeApp();

void _initAuth() {
  //DATA SOURCE
  serviceLocator
    ..registerFactory<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(serviceLocator<SupabaseClient>()),
    )
    //REPOSITORY
    ..registerFactory<AuthRepository>(
      () => AuthRepositoryImpl(
        serviceLocator(),
      ),
    )
    //USECASES
    ..registerFactory(
      () => UserSignUp(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => UserLogin(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => CurrentUser(
        serviceLocator(),
      ),
    )
    //auth bloc
    ..registerLazySingleton(
      () => AuthBloc(
        currentUser: serviceLocator(),
        userLogin: serviceLocator(),
        userSignUp: serviceLocator(),
        appUserCubit: serviceLocator(),
      ),
    );
}
