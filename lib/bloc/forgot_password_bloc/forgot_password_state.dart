part of 'forgot_password_bloc.dart';

abstract class ForgotPasswordState extends Equatable {
  const ForgotPasswordState();
}

class ForgotPasswordInitial extends ForgotPasswordState {
  @override
  List<Object> get props => [];
}

class ForgotPasswordLoading extends ForgotPasswordState {
  const ForgotPasswordLoading();
  @override
  List<Object> get props => [];
}

class ForgotPasswordError extends ForgotPasswordState {
  final String? errorType;

  const ForgotPasswordError({this.errorType});
  @override
  List<Object> get props => [];
}

class ForgotPasswordSucceed extends ForgotPasswordState {
  final String? authMessage;

  const ForgotPasswordSucceed({this.authMessage});
  @override
  List<Object> get props => [authMessage ?? 'N/A'];
}
