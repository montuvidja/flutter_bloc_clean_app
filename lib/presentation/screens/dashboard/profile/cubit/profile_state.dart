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

class UserPostLoadingState extends ProfileState {}

class UserPostErrorState extends ProfileState {
  final String errorMessage;

  UserPostErrorState(this.errorMessage);
  @override
  List<Object?> get props => [errorMessage];
}

class UserPostSuccessState extends ProfileState {
  final ProfileModel profileModel;

  UserPostSuccessState(this.profileModel);

  @override
  List<Object?> get props => [profileModel];
}
