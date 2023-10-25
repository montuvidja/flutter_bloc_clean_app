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
