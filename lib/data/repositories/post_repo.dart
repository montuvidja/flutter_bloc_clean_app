import 'package:flutter_bloc_clean_app/data/data_sources/remote/api_end_points.dart';
import 'package:flutter_bloc_clean_app/data/data_sources/remote/dio_client.dart';
import 'package:flutter_bloc_clean_app/presentation/screens/dashboard/home/home_model.dart';
import 'package:flutter_bloc_clean_app/presentation/screens/dashboard/profile/profile_model.dart';

class PostRepo extends DioClient{
  PostRepo();
  
  Future<HomeModel> getLatestPost() async {
    try {
      var response = await getRequest(path: ApiEndPointUrls.posts);
      if(response.statusCode == 200){
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
      var response = await getRequest(path: ApiEndPointUrls.userPosts,isTokenRequired: true);
      if(response.statusCode == 200){
        final finalResponse = ProfileModel.fromJson(response.data);
        return finalResponse;
      } else {
        return ProfileModel();
      }
    } on Exception catch (e) {
      return ProfileModel();
    }
  }
}