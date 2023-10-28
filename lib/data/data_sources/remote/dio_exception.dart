import 'package:dio/dio.dart';

class DioExceptions implements Exception {
  late String message;

  DioExceptions.fromDioError(DioException dioException) {
    switch (dioException.type) {
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
        message = dioException.response!.statusMessage.toString();
        break;
      case DioExceptionType.connectionError:
        message = "Connection Error occur";
        break;
      case DioExceptionType.unknown:
        message = "Something went wrong";
        break;
    }

  }

  String _handleError(int statusCode, dynamic error) {
    switch (statusCode) {
      case 400:
        return 'Bad request';
      case 404:
        return error["message"];
      case 500:
        return 'Internal server error';
      default:
        return 'Oops something went wrong';
    }
  }
  @override
  String toString() => message;
}
