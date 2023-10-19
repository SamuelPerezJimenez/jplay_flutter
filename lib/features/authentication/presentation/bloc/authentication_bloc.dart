import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jplay_flutter/core/widgets/snackbar_widget.dart';

import '../../../../core/constants/global_keys.dart';
import '../../domain/repositories/authentication_repository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepository authenticationRepository;
  AuthenticationBloc(this.authenticationRepository)
      : super(AuthenticationInitial()) {
    on<LoginEvent>((event, emit) async {
      emit(Authenticating());

      final loginResult =
          await authenticationRepository.login(event.email, event.password);

      loginResult.fold((failure) {
        final snackBar = SnackBarWidget(scaffoldMessengerKey);
        snackBar.show(failure.message, SnackBarType.failure);
      }, (user) {
        final snackBar = SnackBarWidget(scaffoldMessengerKey);
        snackBar.show("Welcome", SnackBarType.success);

        emit(Authenticated());
      });
    });

    on<LogoutEvent>((event, emit) async {
      emit(Unauthenticated());
    });
  }
}
