import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'sign_in_out_event.dart';
part 'sign_in_out_state.dart';

class SignInOutBloc extends Bloc<SignInOutEvent, SignInOutState> {
  SignInOutBloc() : super(SignInSuccess()) {
    on<SignInOutEvent>((event, emit) async {
      if (event is SignInEvent) {
        emit(SignInloading());
        try {
          await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: event.email,
            password: event.password,
          );
          emit(SignInSuccess());
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            emit(SignInFailure(erorrMessage: "User Not Found"));
          } else if (e.code == 'wrong-password') {
            emit(SignInFailure(erorrMessage: " Wrong Password"));
          }
        } catch (e) {
          emit(SignOutFailure(erorrMessage: " Samething Is Wrong"));
        }
      }
    });
    // on<SignInOutEvent>((event, emit) async {
    //   if (event is SignOutEvent) {
    //     emit(SignOutloading());
    //     try {
    //       await FirebaseAuth.instance.createUserWithEmailAndPassword(
    //           email: event.email, password: event.password);

    //       emit(SignOutSuccess());
    //     } on FirebaseAuthException catch (e) {
    //       if (e.code == 'user-not-found') {
    //         emit(SignOutFailure(erorrMessage: "User Not Found"));
    //       } else if (e.code == 'wrong-password') {
    //         emit(SignOutFailure(erorrMessage: " Wrong Password"));
    //       }
    //     } catch (e) {
    //       emit(SignOutFailure(erorrMessage: " Samething Is Wrong"));
    //     }
    //   }
    // });
  }
}
