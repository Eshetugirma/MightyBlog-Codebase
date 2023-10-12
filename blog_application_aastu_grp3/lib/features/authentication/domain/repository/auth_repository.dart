
import 'package:blog_application_aastu_grp3/features/authentication/domain/entity/User.dart';
import 'package:blog_application_aastu_grp3/features/authentication/domain/entity/UserData.dart';

abstract class AuthRepository{
  Future<void> login(String email, String password);
  Future<bool> register(User user);
}