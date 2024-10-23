import 'package:bloc/bloc.dart';
import 'package:ebot/services/auth_service.dart';
import 'package:ebot/utils/get_it_utils.dart';
import 'package:equatable/equatable.dart';

part 'forgot_password_event.dart';
part 'forgot_password_state.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  ForgotPasswordBloc() : super(ForgotPasswordInitial()) {
    final authService =
        getIt<AuthService>(); // Retrieve the AuthService instance
    on<ResetButtonPressed>((event, emit) async {
      emit(const ForgotPasswordLoading());
      try {
        final message = await authService.resetPassword(email: event.email);
        emit(ForgotPasswordSucceed(authMessage: message ?? 'N/A'));
      } catch (e) {
        emit(ForgotPasswordError(errorType: e.toString()));
      }
    });
  }
}
