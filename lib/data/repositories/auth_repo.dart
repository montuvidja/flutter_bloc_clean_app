import 'package:flutter_bloc_clean_app/data/data_sources/remote/api_end_points.dart';
import 'package:flutter_bloc_clean_app/data/models/message_model.dart';

import '../../presentation/screens/auth/login/login_model.dart';
import '../data_sources/remote/dio_client.dart';

class AuthRepo extends DioClient {
  AuthRepo();

  Future<LoginModel> userLogin(String email, String password) async {
    Map<String, dynamic> body = {
      "email": email,
      "password": password,
    };
    try {
      var response = await postRequest(uri: ApiEndPointUrls.login, data: body);
      if (response.statusCode == 200) {
        final finalResponseData = LoginModel.fromJson(response.data);
        return finalResponseData;
      } else {
        LoginModel();
      }
    } on Exception catch (e) {
      LoginModel();
    }
    return LoginModel();
  }

  Future<LoginModel> userRegister(String name,String email, String password) async {
    Map<String, dynamic> body = {
      "name": name,
      "email": email,
      "password": password,
    };
    try {
      var response = await postRequest(uri: ApiEndPointUrls.register, data: body);
      if (response.statusCode == 200) {
        final finalResponseData = LoginModel.fromJson(response.data);
        return finalResponseData;
      } else {
        LoginModel();
      }
    } on Exception catch (e) {
      LoginModel();
    }
    return LoginModel();
  }


  Future<MessageModel> userLogout() async {

    try {
      var response = await postRequest(uri: ApiEndPointUrls.logout);
      if (response.statusCode == 200) {
        final finalResponseData = MessageModel.fromJson(response.data);
        return finalResponseData;
      } else {
        MessageModel();
      }
    } on Exception catch (e) {
      MessageModel();
    }
    return MessageModel();
  }
}
