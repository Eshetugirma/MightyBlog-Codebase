import 'package:blog_application_aastu_grp3/core/errors/failures.dart';
import 'package:blog_application_aastu_grp3/features/profile/data/model/profile_model.dart';
import 'package:dartz/dartz.dart';


abstract class UserRepository {
  Future<Either<Failure, ProfileModel>> getUserProfile();
}
