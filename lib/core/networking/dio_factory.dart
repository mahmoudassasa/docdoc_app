import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';


/// Sengleton class to create and manage a Dio instance 
class DioFactory {
  ///private constructor as I don't want to allow  creating an instance of this class
  DioFactory._();
  static Dio? dio;

  static Dio getDio()  {
    Duration timeout = const Duration(seconds: 30);

    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeout
        ..options.receiveTimeout = timeout;
      addDioHeaders();  
      addDioInterceptors();
      return dio!;
    } else {
      return dio!;
    }
  }
  static void addDioHeaders() {
    dio?.options.headers = {
      'Accept': 'application/json',
      //TODO: change this token
      'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3ZjYXJlLmludGVncmF0aW9uMjUuY29tL2FwaS9hdXRoL2xvZ2luIiwiaWF0IjoxNzUyMDk3MjAyLCJleHAiOjE3NTIxODM2MDIsIm5iZiI6MTc1MjA5NzIwMiwianRpIjoiSFlvWkFNWWZHaTl5aE80ZiIsInN1YiI6IjQxNzEiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.yqIOVb0yB0zJwh5JH8jcnG0wnxoq3dI5BgtMUfuimqo'
    };
  }

  static void addDioInterceptors() {
    dio?.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
      ),
    );
  }
}
