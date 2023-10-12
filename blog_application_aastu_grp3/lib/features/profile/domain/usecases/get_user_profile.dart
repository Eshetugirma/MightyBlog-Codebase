import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/user_usecase.dart';
import '../../data/model/profile_model.dart';
import '../repositories/user_repositories.dart';

class GetUserProfile implements UseCase<ProfileModel, NoParams> {
  final UserRepository repository;

  GetUserProfile(this.repository);
  @override
  Future<Either<Failure, ProfileModel>> call(NoParams noParams) async {
    return await repository.getUserProfile();
  }
}
