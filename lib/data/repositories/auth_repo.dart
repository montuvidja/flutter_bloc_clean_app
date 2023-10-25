import 'package:flutter_bloc_clean_app/data/data_sources/remote/api_end_points.dart';

import '../../presentation/screens/auth/login/login_model.dart';
import '../data_sources/remote/dio_client.dart';

class AuthRepo extends DioClient {
  AuthRepo();

  Future<LoginModel> userLogin(String email, String password) async {
    Map body = {
      "email": email,
      "password": password,
    };
    try {
      var response = await postRequest(ApiEndPointUrls.login, body);
      if (response.statusCode == 200) {
        final finalResponseData = LoginModel.fromJson(response.data);
        return finalResponseData;
      } else {
        LoginModel();
      }
    } on Exception catch (e) {
      LoginModel();
    } catch (e) {
      LoginModel();
    }
    return LoginModel();
  }
}
