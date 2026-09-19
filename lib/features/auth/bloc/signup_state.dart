import 'package:equatable/equatable.dart';

import '../models/auth_response.dart';

abstract class SignupState extends Equatable {
   const SignupState();

   @override
   List<Object?> get props => [];
}

class SignupInitial extends SignupState {}

class SignupLoading extends SignupState {}

class SignupSuccess extends SignupState {
  final AuthResponse response;

  const SignupSuccess(this.response);

  @override
  List<Object?> get props => [response];

}

class SignupFailure extends SignupState{
  final String message;
  
  const SignupFailure(this.message);

  @override
  List<Object?> get props => [message];

}
