import 'package:dio/dio.dart';
import 'api_error_model.dart';

class ApiErrorHandler {
  static ApiErrorModel handle(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionError:
          return ApiErrorModel(message: "Connection to server failed");
        case DioExceptionType.cancel:
          return ApiErrorModel(message: "Request to the server was cancelled");
        case DioExceptionType.connectionTimeout:
          return ApiErrorModel(message: "Connection to the server timed out");
        case DioExceptionType.unknown:
          return ApiErrorModel(
            message:
                "Connection to the server failed due to internet connection",
          );
        case DioExceptionType.receiveTimeout:
          return ApiErrorModel(message: "Receiving data from server timed out");
        case DioExceptionType.badResponse:
          return _handleError(error.response?.data);
        case DioExceptionType.sendTimeout:
          return ApiErrorModel(message: "Sending data to server timed out");
        default:
          return ApiErrorModel(message: "An unknown error occurred");
      }
    } else {
      // default error
      return ApiErrorModel(message: 'Unknown error occurred');
    }
  }
}

ApiErrorModel _handleError(dynamic data) {
  return ApiErrorModel(
    message: data['message'] ?? 'Unknown error occurred',
    code: data['code'],
    errors: data['data'],
  );
}
