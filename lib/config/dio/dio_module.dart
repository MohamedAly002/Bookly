import 'package:bookly/core/values/endpoints/api_endpoints.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';


@module
abstract class DioModule {
  @singleton
  Dio get dio => Dio(
    BaseOptions(
      baseUrl: ApiEndpoints.baseUrl, //AppEndPoints.baseUrl
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );
}