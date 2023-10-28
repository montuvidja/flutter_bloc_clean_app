part of 'profile_cubit.dart';

@immutable
abstract class ProfileState extends Equatable{
  @override
  List<Object?> get props => [];
}

class ProfileInitial extends ProfileState {}

class ProfileLogoutLoadingState extends ProfileState {}
class ProfileLogoutErrorState extends ProfileState {
  final String errorMessage;

  ProfileLogoutErrorState(this.errorMessage);
  @override
  List<Object?> get props => [errorMessage];
}

class ProfileLogoutSuccessState extends ProfileState {
  final MessageModel messageModel;

  ProfileLogoutSuccessState(this.messageModel);

  @override
  List<Object?> get props => [messageModel];
}
