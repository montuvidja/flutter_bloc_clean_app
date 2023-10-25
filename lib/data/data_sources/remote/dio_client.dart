import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter_bloc_clean_app/data/data_sources/remote/api_constant.dart';
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


  Future<Response> getRequest({required String path}) async {
    try {

     _dio.interceptors.add(PrettyDioLogger());
      Response response = await _dio.get(path);

      return response;
    } on DioException catch (e) {
      var error = DioExceptions.fromDioError(e.type).toString();
      print("Dio Error...$error");
      throw error;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> postRequest(String uri, data) async {

    try {
      final Response response = await _dio.post(uri,data: FormData.fromMap(data));

      return response.data;
    } on DioException catch (e) {
      var error =  DioExceptions.fromDioError(e.type).toString();
      throw error;

    }
  }

}
