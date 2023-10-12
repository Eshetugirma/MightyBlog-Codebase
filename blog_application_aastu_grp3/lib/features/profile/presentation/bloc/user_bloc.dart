import 'package:bloc/bloc.dart';
import 'package:blog_application_aastu_grp3/features/profile/data/data_sources/remote_data_source.dart';
import 'package:blog_application_aastu_grp3/features/profile/data/model/profile_model.dart';
import 'package:blog_application_aastu_grp3/features/profile/data/repositories/user_repositories_imp.dart';
import 'package:http/http.dart ' as http;
// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/user_usecase.dart';
import '../../domain/repositories/user_repositories.dart';
import '../../domain/usecases/get_user_profile.dart';

part 'user_event.dart';
part 'user_state.dart';

const SERVERMESSAGE = "SERVER FAILURE";
const CACHEMESSAGE = "CACHE FAILURE";

final RemoteDataSourceImpl remoteDataSource =
    RemoteDataSourceImpl(client: http.Client());
final UserRepository userRepository =
    UserRepositoriesImp(remoteDataSource: remoteDataSource);
final GetUserProfile getUserProfile = GetUserProfile(userRepository);

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<GetUser>((event, emit) async {
      emit(UserLoading());

      final result = await getUserProfile(NoParams());
      result.fold((failure) => emit(const Error(message: "server failure")),
          (user) => emit(UserLoaded(profileModel: user)));
    });
  }
}

String _mapfailureToError(Failure failures) {
  switch (failures.runtimeType) {
    case ServerFailure:
      return SERVERMESSAGE;
    default:
      return "UNEXPECTED ERROR";
  }
}
