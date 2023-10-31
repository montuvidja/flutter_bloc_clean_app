import 'package:flutter_bloc_clean_app/data/data_sources/remote/dio_client.dart';
import '../../presentation/screens/dashboard/category/category_model.dart';
import '../data_sources/remote/api_end_points.dart';
import '../models/message_model.dart';

class CategoryRepo extends DioClient{
  CategoryRepo();

  Future<CategoryModel> getAllCategories() async {
    try {
      var response = await getRequest(path: ApiEndPointUrls.categories);

      if(response.statusCode == 200){
        final finalResponseData = CategoryModel.fromJson(response.data);
        return finalResponseData;
      } else {
        CategoryModel();
      }
    } on Exception {
      CategoryModel();
    }

    return CategoryModel();
  }

  Future<MessageModel> addNewCategory(String title, String slug) async {
    try {
      Map<String, String> body = {
        "title" : title,
        "slug" : slug
      };
      var response = await postRequest(uri: ApiEndPointUrls.addCategory, data:body, isTokenRequired: true);

      if(response.statusCode == 200){
        final finalResponseData = MessageModel.fromJson(response.data);
        return finalResponseData;
      } else {
        MessageModel();
      }
    } on Exception {
      MessageModel();
    }

    return MessageModel();
  }

  Future<MessageModel> updateCategory(String id,String title, String slug) async {
    try {
      Map<String, String> body = {
        "id" : id,
        "title" : title,
        "slug" : slug
      };
      var response = await postRequest(uri: ApiEndPointUrls.updateCategory, data:body, isTokenRequired: true);

      if(response.statusCode == 200){
        final finalResponseData = MessageModel.fromJson(response.data);
        return finalResponseData;
      } else {
        MessageModel();
      }
    } on Exception {
      MessageModel();
    }

    return MessageModel();
  }


  Future<MessageModel> deleteTag(String id) async {
    try {

      var response = await postRequest(uri: "${ApiEndPointUrls.deleteCategory}/$id", isTokenRequired: true);

      if(response.statusCode == 200){
        final finalResponseData = MessageModel.fromJson(response.data);
        return finalResponseData;
      } else {
        MessageModel();
      }
    } on Exception {
      MessageModel();
    }

    return MessageModel();
  }

}