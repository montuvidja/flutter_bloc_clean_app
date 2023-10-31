import 'package:auto_route/auto_route.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_clean_app/data/models/message_model.dart';
import 'package:flutter_bloc_clean_app/presentation/routes/routes_import.gr.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../../data/repositories/repository.dart';
import '../tags_imports.dart';

part 'tags_state.dart';

// not used any where
class TagsCubit extends Cubit<TagsState> {
  final Repository repository;
  TagsCubit({required this.repository}) : super(TagsLoadingState());

  TextEditingController tagEditorController = TextEditingController();
  final fromKey = GlobalKey<FormState>();

  TagsModel tagsModel = TagsModel();
  getAllTags() async {

     try {
       emit(TagsLoadingState());
       tagsModel = await repository.tagsRepo.getAllTags();
       emit(TagsLoadedState(tagsModel));
     } catch (e) {
        emit(TagsErrorState(e.toString()));
     }
  }

  addNewTag(context) async {
     try {
       emit(TagsAddLoadingState());
       var data = await repository.tagsRepo.addNewTag(tagEditorController.text, tagEditorController.text.toLowerCase().replaceAll(" ", "-"));
       if(data.status == 1){
         VxToast.show(context, msg: data.message.toString());
         tagsModel = await repository.tagsRepo.getAllTags();
         AutoRouter.of(context).pop<TagsModel>(tagsModel);
       } else {
         emit(TagsErrorState(data.message.toString()));
       }

     } catch (e) {
        emit(TagsErrorState(e.toString()));
     }
  }

  updateTag(context,String id) async {
     try {
       emit(TagsUpdateLoadingState());
       var data = await repository.tagsRepo.updateTag(id,tagEditorController.text, tagEditorController.text.toLowerCase().replaceAll(" ", "-"));
       if(data.status == 1){
         VxToast.show(context, msg: data.message.toString());
         tagsModel = await repository.tagsRepo.getAllTags();
         AutoRouter.of(context).pop<TagsModel>(tagsModel);

       } else {
         emit(TagsErrorState(data.message.toString()));
       }

     } catch (e) {
        emit(TagsErrorState(e.toString()));
     }
  }

  deleteTags(String id,int index,context) async {

    try {
      var data = await repository.tagsRepo.deleteTag(id);
      if(data.status == 1) {
        emit(TagsLoadingState());
        tagsModel.tags!.removeAt(index);
        emit(TagsLoadedState(tagsModel));
      }
      VxToast.show(context, msg: data.message.toString());
    } catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }

  gotoAddTags(context) async {
   var data = await AutoRouter.of(context).push<TagsModel>(const AddTagRoute());
   emit(TagsLoadedState(data!));
  }

  gotoUpdateTags(context,Tag tag) async {
   var data = await AutoRouter.of(context).push<TagsModel>(UpdateTagRoute(tag: tag));
   emit(TagsLoadedState(data!));
  }

}
