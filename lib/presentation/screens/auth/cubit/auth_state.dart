part of 'auth_cubit.dart';

@immutable
abstract class AuthState extends Equatable {

  @override
  List<Object> get props => [];

}

class AuthInitial extends AuthState {}

class LoginLoadingState extends AuthState {}

class LoginSuccessState extends AuthState {
  final LoginModel loginModel;

  LoginSuccessState(this.loginModel);

  @override
  List<Object> get props => [loginModel];
}

class LoginErrorState extends AuthState {
  final String errorMessage;

  LoginErrorState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];

}






