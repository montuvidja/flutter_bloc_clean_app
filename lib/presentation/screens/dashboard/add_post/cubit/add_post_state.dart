part of 'add_post_cubit.dart';

@immutable
abstract class AddPostState extends Equatable{
  const AddPostState();
  @override
  List<Object?> get props => [];
}

class AddPostInitial extends AddPostState {}
class AddPostLoadingState extends AddPostState {}
class AddPostAddedState extends AddPostState {}
class AddPostErrorState extends AddPostState {}

class ImageSelectedState extends AddPostState {
  final XFile xFile;

  const ImageSelectedState(this.xFile);
  @override
  List<Object?> get props => [xFile];
}

class TagSelectedState extends AddPostState {
  final Tag tag;

  const TagSelectedState(this.tag);
  @override
  List<Object?> get props => [tag];
}

class CategorySelectedState extends AddPostState {
  final Category category;

  const CategorySelectedState(this.category);
  @override
  List<Object?> get props => [category];
}

class AllSelectedState extends AddPostState {
  final Tag? tag;
  final Category? category;
  final XFile? xFile;
  final bool isLoading;

  const AllSelectedState({
    required this.tag,
    required this.category,
    required this.xFile,
    this.isLoading = false,
  });

  @override
  List<Object?> get props => [tag, category, xFile];
}
