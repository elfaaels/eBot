import 'package:bloc/bloc.dart';
import 'package:ebot/services/auth_service.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
    on<RegisterEvent>((event, emit) {});
    on<RegisterButtonPressed>((event, emit) async {
      emit(RegisterLoading());
      try {
        final user = await AuthService().register(
          email: event.email,
          password: event.password,
          username: event.userName,
        );
        emit(RegisterSuccess(user: user));
      } catch (e) {
        emit(RegisterError(errorType: e.toString()));
      }
    });
  }
}