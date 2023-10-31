part of 'tags_cubit.dart';

@immutable
abstract class TagsState extends Equatable {
  const TagsState();

  @override
  List<Object> get props => [];
}

class TagsInitial extends TagsState {}

class TagsLoadingState extends TagsState {}

class TagsLoadedState extends TagsState {
  final TagsModel tagsModel;

  const TagsLoadedState(this.tagsModel);

  @override
  List<Object> get props => [tagsModel];
}

class TagsErrorState extends TagsState {
  final String errorMessage;

  const TagsErrorState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

/* -------------   Tag Add State ---------------*/

class TagsAddLoadingState extends TagsState {}

class TagsAddedState extends TagsState {
  final MessageModel messageModel;

  const TagsAddedState(this.messageModel);

  @override
  List<Object> get props => [messageModel];
}

/* -------------   Tag update State ---------------*/

class TagsUpdateLoadingState extends TagsState {}

class TagsUpdateState extends TagsState {
  final MessageModel messageModel;

  const TagsUpdateState(this.messageModel);

  @override
  List<Object> get props => [messageModel];
}

class TagsUpdateErrorState extends TagsState {
  final String errorMessage;

  const TagsUpdateErrorState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

/*------------ delete tag ------------------*/

class TagsDeleteLoadingState extends TagsState {}

class TagsDeletedState extends TagsState {
  final MessageModel messageModel;

  const TagsDeletedState(this.messageModel);

  @override
  List<Object> get props => [messageModel];
}

class TagsDeleteErrorState extends TagsState {
  final String errorMessage;

  const TagsDeleteErrorState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}