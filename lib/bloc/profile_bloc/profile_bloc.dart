import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:ebot/model/user.dart';
import 'package:ebot/services/firestore_config.dart';
import 'package:equatable/equatable.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final DatabaseService? databaseService;

  ProfileBloc({this.databaseService}) : super(ProfileInitial()) {
    on<ProfileEvent>((event, emit) {});
    on<ProfileLoaded>((event, emit) async {
      try {
        emit(ProfileLoading());
        log("Profile loading");
        final result = await databaseService!.getUserData();
        log("Profile success");
        emit(ProfileSucceed(user: result));
      } catch (e) {}
    });
  }
}
