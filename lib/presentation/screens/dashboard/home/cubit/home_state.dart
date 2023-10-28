part of 'home_cubit.dart';

@immutable
abstract class HomeState extends Equatable{

  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {
}

class HomeLoadingState extends HomeState {}

class HomeLoadedState extends HomeState {
  final HomeModel homeModel;

  HomeLoadedState(this.homeModel);

  @override
  List<Object?> get props => [homeModel];

}
class HomeErrorState extends HomeState {
  final String errorMessage;

  HomeErrorState(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

