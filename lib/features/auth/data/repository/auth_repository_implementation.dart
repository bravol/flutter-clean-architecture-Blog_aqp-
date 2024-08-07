import 'package:fca_blog_app/core/error/exceptions.dart';
import 'package:fca_blog_app/core/error/failure.dart';
import 'package:fca_blog_app/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:fca_blog_app/features/auth/domain/repository/auth_repository.dart';
import 'package:fca_blog_app/core/common/entities/user.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  const AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, User>> currentUser() async {
    try {
      final user = await remoteDataSource.getCurrentUserData();
      if (user == null) {
        return left(Failure("User not found"));
      } else {
        return right(user);
      }
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, User>> loginWithEmailPassword(
      {required String email, required String password}) async {
    try {
      final user = await remoteDataSource.loginWithEmailPassword(
          email: email, password: password);
      return right(user);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, User>> signUpWithEmailPassword(
      {required String email,
      required String password,
      required String name}) async {
    try {
      final user = await remoteDataSource.signUpWithEmailPassword(
          email: email, password: password, name: name);
      return right(user);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
