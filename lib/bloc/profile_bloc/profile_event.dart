part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();
}

class ProfileLoaded extends ProfileEvent {
  const ProfileLoaded();

  @override
  List<Object> get props => [];
}
