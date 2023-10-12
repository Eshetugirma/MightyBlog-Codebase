part of 'user_bloc.dart';

sealed class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

final class UserInitial extends UserState {}

class UserLoading extends UserState {}

class Error extends UserState {
  final String message;
  const Error({required this.message});
}

class UserLoaded extends UserState {
  final ProfileModel profileModel;
  const UserLoaded({required this.profileModel});
}
