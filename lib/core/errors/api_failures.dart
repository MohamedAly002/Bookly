import 'package:dio/dio.dart';

abstract class ApiFailures {
  final String errormessage;

  const ApiFailures(this.errormessage);
}

class ServerFailures extends ApiFailures {
  ServerFailures(super.errormessage);

  factory ServerFailures.fromDioError(DioException dioErorr) {
    switch (dioErorr.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailures('Connection timeout with API server');
      case DioExceptionType.sendTimeout:
        return ServerFailures('Send timeout with API server');
      case DioExceptionType.receiveTimeout:
        return ServerFailures('Receive timeout with API server');
      case DioExceptionType.badCertificate:
        return ServerFailures('Bad certificate with API server');
      case DioExceptionType.badResponse:
        return ServerFailures.fromResponse(
            dioErorr.response!.statusCode!, dioErorr.response!.data);
      case DioExceptionType.cancel:
        return ServerFailures('Request to API server was canceled');
      case DioExceptionType.connectionError:
        return ServerFailures('Connection error with API server');
      case DioExceptionType.unknown:
      if (dioErorr.message!.contains('SocketException')) {
        return ServerFailures('No internet connection');
      }
        return ServerFailures('Unexpected error occurred, Please try again!');
    }
  }
  factory ServerFailures.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailures(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailures('Your request not found, Please try again!');
    } else {
      return ServerFailures('Something went wrong, Please try again!');
    }
  }
}
