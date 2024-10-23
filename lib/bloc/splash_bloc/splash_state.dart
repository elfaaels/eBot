part of 'splash_bloc.dart';

abstract class SplashState extends Equatable {
  const SplashState();
}

class SplashInitial extends SplashState {
  @override
  List<Object> get props => [];
}

class SplashLoading extends SplashState {
  const SplashLoading();
  @override
  List<Object> get props => [];
}

class SplashError extends SplashState {
  final String? errorType;

  const SplashError({this.errorType});
  @override
  List<Object> get props => [];
}

class SplashAuthenticated extends SplashState {
  const SplashAuthenticated();

  @override
  List<Object> get props => [];
}

class SplashUnAuthenticated extends SplashState {
  const SplashUnAuthenticated();

  @override
  List<Object> get props => [];
}
