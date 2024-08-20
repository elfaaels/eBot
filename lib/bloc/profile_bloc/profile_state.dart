part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();
}

class ProfileInitial extends ProfileState {
  @override
  List<Object> get props => [];
}

class ProfileLoading extends ProfileState {
  const ProfileLoading();
  @override
  List<Object> get props => [];
}

class ProfileError extends ProfileState {
  final String? errorType;

  const ProfileError({this.errorType});
  @override
  List<Object> get props => [];
}

class ProfileSucceed extends ProfileState {
  final UserModel? user;

  const ProfileSucceed({this.user});
  @override
  List<Object> get props => [];
}
