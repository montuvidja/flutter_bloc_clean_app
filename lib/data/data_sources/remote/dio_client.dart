import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter_bloc_clean_app/data/data_sources/remote/api_constant.dart';
import 'package:flutter_bloc_clean_app/data/utils/utils.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'dio_exception.dart';

class DioClient {
  static BaseOptions baseOptions = BaseOptions(
    baseUrl: ApiConstant.mainUrl,
    contentType: 'application/json',
    connectTimeout: const Duration(milliseconds: ApiConstant.connectionTimeout),
    receiveTimeout: const Duration(milliseconds: ApiConstant.receiveTimeout),
  );

  final Dio _dio = Dio(baseOptions);

  Options options = Options();

  Future<Response> getRequest({required String path, bool isTokenRequired = false}) async {

    if(isTokenRequired == true){
      var token = await Utils.getToken();
      options.headers = baseOptions.headers..addAll({"Authorization" : "Bearer $token"});
    }

    try {
     _dio.interceptors.add(PrettyDioLogger());
      Response response = await _dio.get(path,options: options);

      return response;
    } on DioException catch (e) {
      var error = DioExceptions.fromDioError(e).toString();
      print("Dio Error...$error");
      throw error;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> postRequest({required String uri, dynamic data, bool isTokenRequired = false}) async {

    _dio.interceptors.add(PrettyDioLogger());
    if(isTokenRequired == true){
      var token = await Utils.getToken();
      options.headers = baseOptions.headers..addAll({"Authorization" : "Bearer $token"});
    }
  //  print("options... ${options.headers}");
    try {
      final Response response = await _dio.post(uri,data: data,options: options);

      return response;
    } on DioException catch (e) {
      var error =  DioExceptions.fromDioError(e).toString();
      throw error;

    }
  }

}
