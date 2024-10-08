part of 'register_bloc.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();
}

final class RegisterInitial extends RegisterState {
  @override
  List<Object> get props => [];
}

final class RegisterLoading extends RegisterState {
  @override
  List<Object> get props => [];
}

final class RegisterError extends RegisterState {
  final String? errorType;

  const RegisterError({this.errorType});
  @override
  List<Object> get props => [];
}

final class RegisterSuccess extends RegisterState {
  final String? returnValue;
  final User? user;

  const RegisterSuccess({this.returnValue, this.user});
  @override
  List<Object> get props => [returnValue ?? 'N/A'];
}
