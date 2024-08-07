import 'package:fca_blog_app/core/error/failure.dart';
import 'package:fca_blog_app/core/usecase/usecase.dart';
import 'package:fca_blog_app/features/auth/domain/repository/auth_repository.dart';
import 'package:fca_blog_app/core/common/entities/user.dart';
import 'package:fpdart/fpdart.dart';

class CurrentUser implements UseCase<User, NoParams> {
  final AuthRepository authRepository;
  CurrentUser(this.authRepository);
  @override
  Future<Either<Failure, User>> call(NoParams params) async {
    return await authRepository.currentUser();
  }
}
