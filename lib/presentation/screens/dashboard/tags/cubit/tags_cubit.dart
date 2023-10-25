import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../data/repositories/repository.dart';
import '../tags_imports.dart';

part 'tags_state.dart';

// not used any where
class TagsCubit extends Cubit<TagsState> {
  final Repository repository;
  TagsCubit({required this.repository}) : super(TagsLoadingState());

  getAllTags() async {

     try {
       emit(TagsLoadingState());
       var data = await repository.tagsRepo.getAllTags();
       emit(TagsLoadedState(data));
     } catch (e) {
        emit(TagsErrorState(e.toString()));
     }
  }
}
