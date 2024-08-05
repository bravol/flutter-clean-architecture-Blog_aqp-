import 'package:fca_blog_app/features/auth/entities/user.dart';
import 'package:fpdart/fpdart.dart';
import 'package:fca_blog_app/core/error/failure.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, User>> signupWithEmailPassword({
    required String email,
    required String password,
    required String name,
  });
  Future<Either<Failure, User>> loginWithEmailPassword({
    required String email,
    required String password,
  });
}
