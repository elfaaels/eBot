part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class LoginInitial extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginLoading extends LoginState {
  const LoginLoading();
  @override
  List<Object> get props => [];
}

class LoginError extends LoginState {
  final String? errorType;

  const LoginError({this.errorType});
  @override
  List<Object> get props => [];
}

class LoginAuthenticated extends LoginState {
  final String authMessage;

  const LoginAuthenticated({required this.authMessage});
  @override
  List<Object> get props => [this.authMessage];
}
