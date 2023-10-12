
import 'package:blog_application_aastu_grp3/features/profile/data/data_sources/remote_data_source.dart';
import 'package:blog_application_aastu_grp3/features/profile/data/model/profile_model.dart';
import 'package:blog_application_aastu_grp3/features/profile/domain/repositories/user_repositories.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';


class UserRepositoriesImp implements UserRepository {
  final RemoteDataSource remoteDataSource;
  UserRepositoriesImp({required this.remoteDataSource});

  @override
  Future<Either<Failure, ProfileModel>> getUserProfile() async {
    try {
      final profileModel = await remoteDataSource.getMe();
      return Right(profileModel);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
