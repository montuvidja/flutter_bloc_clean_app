import 'package:dio/dio.dart';
import 'package:flutter_bloc_clean_app/data/data_sources/remote/api_end_points.dart';
import 'package:flutter_bloc_clean_app/data/data_sources/remote/dio_client.dart';
import 'package:flutter_bloc_clean_app/data/models/message_model.dart';
import 'package:flutter_bloc_clean_app/presentation/screens/dashboard/home/home_model.dart';
import 'package:flutter_bloc_clean_app/presentation/screens/dashboard/profile/profile_model.dart';

class PostRepo extends DioClient {
  PostRepo();

  Future<HomeModel> getLatestPost() async {
    try {
      var response = await getRequest(path: ApiEndPointUrls.posts);
      if (response.statusCode == 200) {
        final finalResponse = HomeModel.fromJson(response.data);
        return finalResponse;
      } else {
        return HomeModel();
      }
    } on Exception catch (e) {
      return HomeModel();
    }
  }

  Future<ProfileModel> getUserPost() async {
    try {
      var response = await getRequest(
          path: ApiEndPointUrls.userPosts, isTokenRequired: true);
      if (response.statusCode == 200) {
        final finalResponse = ProfileModel.fromJson(response.data);
        return finalResponse;
      } else {
        return ProfileModel();
      }
    } on Exception catch (e) {
      return ProfileModel();
    }
  }

  Future<MessageModel> addPost(
      String title,
      String slug,
      String categories,
      String tags,
      String body,
      String userId,
      String filePath,
      String fileName) async {
    final formData = FormData.fromMap(
      {
        'title': title,
        'slug': slug,
        'categories': categories,
        'tags': tags,
        'body': body,
        'status': "1",
        'user_id': userId,
        'featuredimage': await MultipartFile.fromFile(filePath, filename: fileName),
      },
    );

    try {
      var response = await postRequest(
          uri: ApiEndPointUrls.addPosts,
          data: formData,
          isTokenRequired: true);
      if (response.statusCode == 200) {
        final finalResponse = MessageModel.fromJson(response.data);
        return finalResponse;
      } else {
        return MessageModel();
      }
    } on Exception catch (e) {
      return MessageModel();
    }
  }
}
