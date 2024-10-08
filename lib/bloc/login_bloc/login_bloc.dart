import 'package:bloc/bloc.dart';
import 'package:ebot/services/auth_service.dart';
import 'package:ebot/utils/get_it_utils.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    final authService =
        getIt<AuthService>(); // Retrieve the AuthService instance
    on<LoginEvent>((event, emit) {});
    on<LoginButtonPressed>((event, emit) async {
      emit(LoginLoading());
      try {
        final message = await authService.login(
          email: event.email,
          password: event.password,
        );
        emit(LoginAuthenticated(authMessage: message ?? 'N/A'));
      } catch (e) {
        emit(LoginError(errorType: e.toString()));
      }
      // emit(LoginError(errorType: "ERROR"));
    });
  }
}
