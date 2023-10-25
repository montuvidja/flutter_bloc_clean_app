import 'package:dio/dio.dart';

class DioExceptions implements Exception {
  late String message;

  DioExceptions.fromDioError(DioExceptionType dioException) {
    switch (dioException) {
      case DioExceptionType.cancel:
        message = "Request to API server was cancelled";
        break;
      case DioExceptionType.connectionTimeout:
        message = "Connection timeout with API server";
        break;
      case DioExceptionType.sendTimeout:
        message = "Send timeout in connection with API server";
        break;
      case DioExceptionType.receiveTimeout:
        message = "Receive timeout in connection with API server";
        break;
      case DioExceptionType.badCertificate:
        message = "Bad Certificate";
        break;
      case DioExceptionType.badResponse:
        message = "Bad Response";
        break;
      case DioExceptionType.connectionError:
        message = "Connection Error occur";
        break;
      case DioExceptionType.unknown:
        message = "Something went wrong";
        break;
    }

  }
  @override
  String toString() => message;
}
