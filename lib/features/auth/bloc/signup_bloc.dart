import 'package:flutter_bloc/flutter_bloc.dart';

import '../services/auth_service.dart';
import 'signup_event.dart';
import 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final AuthService authService;

  SignupBloc(this.authService) : super(SignupInitial()) {
    on<SignupSubmitted>(_onSubmitted);
  }

  Future<void> _onSubmitted(
    SignupSubmitted event,
    Emitter<SignupState> emit,
  ) async {
    emit(SignupLoading());
    try {
      final response = await authService.signup(
        name: event.name,
        email: event.email,
        password: event.password,
      );
      emit(SignupSuccess(response));
    } catch (e) {
      emit(SignupFailure(e.toString()));
    }
  }
}
