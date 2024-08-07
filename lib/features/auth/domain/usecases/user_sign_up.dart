import 'package:fca_blog_app/core/error/failure.dart';
import 'package:fca_blog_app/core/usecase/usecase.dart';
import 'package:fca_blog_app/features/auth/domain/repository/auth_repository.dart';
import 'package:fca_blog_app/core/common/entities/user.dart';
import 'package:fpdart/fpdart.dart';

class UserSignUp implements UseCase<User, UserSignUpParams> {
  final AuthRepository authRepository;

  UserSignUp(this.authRepository);
  @override
  Future<Either<Failure, User>> call(UserSignUpParams params) async {
    return await authRepository.signUpWithEmailPassword(
        email: params.email, password: params.password, name: params.name);
  }
}

class UserSignUpParams {
  final String email;
  final String password;
  final String name;

  UserSignUpParams({
    required this.email,
    required this.password,
    required this.name,
  });
}
