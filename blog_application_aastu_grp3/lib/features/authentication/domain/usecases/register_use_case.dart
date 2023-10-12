

import 'package:blog_application_aastu_grp3/features/authentication/core/usecases/user_register_usecase.dart';
import 'package:blog_application_aastu_grp3/features/authentication/domain/entity/User.dart';
import 'package:blog_application_aastu_grp3/features/authentication/domain/repository/auth_repository.dart';

class RegisterUseCaseImpl implements UseCaseRegister{

  final AuthRepository repository;

  RegisterUseCaseImpl({required this.repository});

  @override
  Future<bool> call(User user) async {
     return await repository.register(user);  
  }

}
  