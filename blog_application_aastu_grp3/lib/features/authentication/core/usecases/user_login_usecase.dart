import 'package:blog_application_aastu_grp3/features/authentication/domain/entity/UserData.dart';


abstract class UseCaseLogin{
  Future<bool> call(String email, String password);

}
