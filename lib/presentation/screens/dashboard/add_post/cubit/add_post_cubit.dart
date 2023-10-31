import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../../../data/repositories/repository.dart';
import '../../category/category_model.dart';
import '../../tags/tags_imports.dart';

part 'add_post_state.dart';

class AddPostCubit extends Cubit<AddPostState> {
  final Repository repository;

  AddPostCubit({required this.repository}) : super(AddPostInitial());

  TextEditingController textEditingController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  final QuillController controller = QuillController.basic();
  final ImagePicker picker = ImagePicker();

  pickImage(context, ImageSource imageSource) async {
    var image = await picker.pickImage(source: imageSource);
    if (image != null) {
      if (state is AllSelectedState) {
        final currentState = state as AllSelectedState;
        emit(AllSelectedState(
          tag: currentState.tag,
          category: currentState.category,
          xFile: image,
        ));
      } else {
        emit(AllSelectedState(
          tag: null, // Replace with your default Tag
          category: null, // Replace with your default Category
          xFile: image,
        ));
      }
    } else {
      VxToast.show(context, msg: "Image not selected");
    }
  }

  selectedTag(Tag? tag) {
    if (tag != null) {
      if (state is AllSelectedState) {
        final currentState = state as AllSelectedState;
        emit(AllSelectedState(
          tag: tag,
          category: currentState.category,
          xFile: currentState.xFile,
        ));
      } else {
        emit(AllSelectedState(
          tag: tag, // Replace with your default Tag
          category: null, // Replace with your default Category
          xFile: null,
        ));
      }
    }
  }

  selectedCategory(Category? category) async {
    if (category != null) {
      if (state is AllSelectedState) {
        final currentState = state as AllSelectedState;
        emit(AllSelectedState(
          tag: currentState.tag,
          category: category,
          xFile: currentState.xFile,
        ));
      } else {
        emit(AllSelectedState(
          tag: null, // Replace with your default Tag
          category: category, // Replace with your default Category
          xFile: null,
        ));
      }
    }
  }

  addPost(context) async {
    try {
      if (state is! AllSelectedState) {
        VxToast.show(context, msg: "Please select tags, category, and image");
        return;
      }
     final currentState = state as AllSelectedState;
      emit(AllSelectedState(tag: currentState.tag, category: currentState.category, xFile: currentState.xFile, isLoading: true));
      var data = await repository.postRepo.addPost(
          textEditingController.text,
          textEditingController.text.toLowerCase().replaceAll(" ", "-"),
          (state as AllSelectedState).category!.id.toString(),
          (state as AllSelectedState).tag!.id.toString(),
          controller.document.toPlainText(),
          "1",
          (state as AllSelectedState).xFile!.path,
          (state as AllSelectedState).xFile!.path.split("/").last);

      if (data.status == 1) {
        emit(AddPostAddedState());
        clearAllController();
      }

      VxToast.show(context, msg: data.message.toString());
    } catch (e) {
      VxToast.show(context, msg: e.toString());
      print(e);
    }
  }

  clearAllController() {
    textEditingController.clear();
    controller.clear();
    emit(AddPostInitial());
  }
}
