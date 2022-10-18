part of 'sign_in_out_bloc.dart';

abstract class SignInOutState extends Equatable {
  const SignInOutState();

  @override
  List<Object> get props => [];
}

class SignInOutInitial extends SignInOutState {}

class SignInSuccess extends SignInOutState {}

class SignInloading extends SignInOutState {}

class SignInFailure extends SignInOutState {
  final String erorrMessage;

  SignInFailure({required this.erorrMessage});
}

class SignOutSuccess extends SignInOutState {}

class SignOutloading extends SignInOutState {}

class SignOutFailure extends SignInOutState {
  final String erorrMessage;

  SignOutFailure({required this.erorrMessage});
}
