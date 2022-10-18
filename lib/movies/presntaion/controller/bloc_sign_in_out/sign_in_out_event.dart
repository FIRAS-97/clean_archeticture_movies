part of 'sign_in_out_bloc.dart';

abstract class SignInOutEvent extends Equatable {
  const SignInOutEvent();

  @override
  List<Object> get props => [];
}

class SignInEvent extends SignInOutEvent {
  final String email;
  final String password;

  SignInEvent({required this.email, required this.password});
}

class SignOutEvent extends SignInOutEvent {
  final String email;
  final String password;

  SignOutEvent({required this.email, required this.password});
}
