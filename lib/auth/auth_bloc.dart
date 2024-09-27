
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_multibloc/auth/auth_event.dart';
import 'package:flutter_multibloc/auth/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent,AuthState>{
  AuthBloc():super(AuthInitial()){
    on<LoginEvent>((event, emit) {
     emit(Authenticated());
    },);
    on<LogoutEvent>((event, emit) {
      emit(Unauthenticated());
    },);

  }

}