import 'package:auto_route/auto_route.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc_clean_app/presentation/routes/routes_import.gr.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../../data/models/message_model.dart';
import '../../../../../data/repositories/repository.dart';
import '../category_model.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final Repository repository;
  CategoryCubit({required this.repository}) : super(CategoryInitial());

  TextEditingController textEditingController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  CategoryModel categoryModel = CategoryModel();

  getAllCategories() async {

    try {
      emit(CategoryLoadingState());
      categoryModel = await repository.categoryRepo.getAllCategories();
      emit(CategoryLoadedState(categoryModel));
    } catch (e) {
      emit(CategoryErrorState(e.toString()));
    }
  }

  addNewCategory(context) async {
    try {
      emit(CategoryAddLoadingState());
      var data = await repository.categoryRepo.addNewCategory(textEditingController.text, textEditingController.text.toLowerCase().replaceAll(" ", "-"));
      if(data.status == 1){
        VxToast.show(context, msg: data.message.toString());
        categoryModel = await repository.categoryRepo.getAllCategories();
        AutoRouter.of(context).pop<CategoryModel>(categoryModel);


      } else {
        emit(CategoryErrorState(data.message.toString()));
      }

    } catch (e) {
      emit(CategoryErrorState(e.toString()));
    }
  }

  updateCategory(context,String id) async {
    try {
      emit(CategoryUpdateLoadingState());
      var data = await repository.categoryRepo.updateCategory(id,textEditingController.text, textEditingController.text.toLowerCase().replaceAll(" ", "-"));
      if(data.status == 1){
        VxToast.show(context, msg: data.message.toString());
        categoryModel = await repository.categoryRepo.getAllCategories();
        AutoRouter.of(context).pop<CategoryModel>(categoryModel);

      } else {
        emit(CategoryErrorState(data.message.toString()));
      }

    } catch (e) {
      emit(CategoryErrorState(e.toString()));
    }
  }

  deleteCategory(String id,int index,context) async {

    try {
      var data = await repository.categoryRepo.deleteTag(id);
      if(data.status == 1) {
        emit(CategoryLoadingState());
        categoryModel.categories!.removeAt(index);
        emit(CategoryLoadedState(categoryModel));
      }
      VxToast.show(context, msg: data.message.toString());
    } catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }

  gotoAddCategory(context) async {
    var data = await AutoRouter.of(context).push<CategoryModel>(const AddCategoryRoute());
    emit(CategoryLoadedState(data!));
  }

  gotoUpdateCategory(context,Category category) async {
    var data = await AutoRouter.of(context).push<CategoryModel>(UpdateCategoryRoute(category: category));
    Vx.log(data!.categories!);
    emit(CategoryLoadedState(data!));
  }


}
