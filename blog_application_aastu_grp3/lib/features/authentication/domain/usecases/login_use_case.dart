import 'package:blog_application_aastu_grp3/features/authentication/core/usecases/user_login_usecase.dart';
import 'package:blog_application_aastu_grp3/features/authentication/domain/repository/auth_repository.dart';

class LogginUserImpl implements UseCaseLogin{

  final AuthRepository repository;

  LogginUserImpl({required this.repository});

  @override
  Future<bool> call(String email, String password) async {
    print("usecase");
    
    await repository.login(email, password);

    return true;
  }
}