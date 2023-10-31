part of 'category_cubit.dart';

@immutable
abstract class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object?> get props => [];

}

class CategoryInitial extends CategoryState {}

class CategoryLoadingState extends CategoryState {}

class CategoryLoadedState extends CategoryState {
  final CategoryModel categoryModel;

  const CategoryLoadedState(this.categoryModel);
  @override
  List<Object?> get props => [categoryModel];
}

class CategoryErrorState extends CategoryState {
  final String errorMessage;

  const CategoryErrorState(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

/* -------------   Category Add State ---------------*/

class CategoryAddLoadingState extends CategoryState {}

class CategoryAddedState extends CategoryState {
  final MessageModel messageModel;

  const CategoryAddedState(this.messageModel);

  @override
  List<Object> get props => [messageModel];
}

/* -------------   Tag update State ---------------*/

class CategoryUpdateLoadingState extends CategoryState {}

class CategoryUpdateState extends CategoryState {
  final MessageModel messageModel;

  const CategoryUpdateState(this.messageModel);

  @override
  List<Object> get props => [messageModel];
}

class CategoryUpdateErrorState extends CategoryState {
  final String errorMessage;

  const CategoryUpdateErrorState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

/*------------ delete tag ------------------*/

class CategoryDeleteLoadingState extends CategoryState {}

class CategoryDeletedState extends CategoryState {
  final MessageModel messageModel;

  const CategoryDeletedState(this.messageModel);

  @override
  List<Object> get props => [messageModel];
}

class CategoryDeleteErrorState extends CategoryState {
  final String errorMessage;

  const CategoryDeleteErrorState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

