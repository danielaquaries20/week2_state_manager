part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthInitial extends AuthState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class UserAuthState extends AuthState {
  final Status status;
  final String? message;
  final User? data;

  const UserAuthState({required this.status, this.message, this.data});

  @override
  List<Object?> get props => [status, message, data];
}

class UserLogoutState extends AuthState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
