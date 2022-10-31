import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:week2_state_manager/data/api.dart';
import 'package:week2_state_manager/models/status.dart';
import 'package:week2_state_manager/models/user.dart';
import 'package:week2_state_manager/ui/profile/profile_screen.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final Api api;

  AuthCubit(this.api) : super(AuthInitial());

  void login(String email, String password) async {
    emit(const UserAuthState(status: Status.loading));
    try {
      final response = await api.login(email, password);
      emit(UserAuthState(status: Status.success, data: response));
    } catch (e) {
      emit(UserAuthState(status: Status.error, message: e.toString()));
    }
  }

  void logout() async {
    await Future.delayed(const Duration(seconds: 1));
    emit(UserLogoutState());
  }
}
