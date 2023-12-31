import 'package:flutter_bloc_clean_app/data/models/message_model.dart';

import '../../presentation/screens/dashboard/tags/tags_imports.dart';
import '../data_sources/remote/api_end_points.dart';
import '../data_sources/remote/dio_client.dart';

class TagsRepo extends DioClient {
  TagsRepo();

  Future<TagsModel> getAllTags() async {
    try {
      var response = await getRequest(path: ApiEndPointUrls.tags);

      if(response.statusCode == 200){
        final finalResponseData = TagsModel.fromJson(response.data);
        return finalResponseData;
      } else {
        TagsModel();
      }
    } on Exception {
      TagsModel();
    }

    return TagsModel();
  }

  Future<MessageModel> addNewTag(String title, String slug) async {
    try {
      Map<String, String> body = {
        "title" : title,
        "slug" : slug
      };
      var response = await postRequest(uri: ApiEndPointUrls.addTags, data:body, isTokenRequired: true);

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

  Future<MessageModel> updateTag(String id,String title, String slug) async {
    try {
      Map<String, String> body = {
        "id" : id,
        "title" : title,
        "slug" : slug
      };
      var response = await postRequest(uri: ApiEndPointUrls.updateTags, data:body, isTokenRequired: true);

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

      var response = await postRequest(uri: "${ApiEndPointUrls.deleteTags}/$id", isTokenRequired: true);

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