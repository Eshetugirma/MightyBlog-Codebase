import 'package:blog_application_aastu_grp3/features/authentication/domain/entity/Token.dart';
import 'package:blog_application_aastu_grp3/features/authentication/domain/entity/User.dart';
import 'package:blog_application_aastu_grp3/features/authentication/domain/entity/UserData.dart';
import 'package:equatable/equatable.dart';

abstract class UseCaseRegister{
  Future<bool> call(User user);
}

// class NoParams extends Equatable{
//   List<Object> get props => [];

// }