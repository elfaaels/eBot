import 'package:bloc/bloc.dart';
import 'package:ebot/services/auth_service.dart';
import 'package:equatable/equatable.dart';

part 'forgot_password_event.dart';
part 'forgot_password_state.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  ForgotPasswordBloc() : super(ForgotPasswordInitial()) {
    on<ResetButtonPressed>((event, emit) async {
      emit(ForgotPasswordLoading());
      try {
        final message = await AuthService().resetPassword(email: event.email);
        emit(ForgotPasswordSucceed(authMessage: message ?? 'N/A'));
      } catch (e) {
        emit(ForgotPasswordError(errorType: e.toString()));
      }
    });
  }
}
