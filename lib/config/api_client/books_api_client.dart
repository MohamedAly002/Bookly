import 'package:bookly/core/values/endpoints/api_endpoints.dart';
import 'package:bookly/keys/api_key.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
@injectable
class BooksApiClient {
  final Dio _dio;

  BooksApiClient(this._dio);
  Future<Map<String, dynamic>> get(
      {required String endPoint, String apiKey = apiKey}) async {
    var response =
        await _dio.get('${ApiEndpoints.baseUrl}$endPoint&key=$apiKey');
    return response.data;
  }
}
