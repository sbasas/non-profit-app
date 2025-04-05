import 'package:dio/dio.dart';

class ApiException implements Exception {
  final String message;
  final int? statusCode;
  final dynamic data;

  ApiException({
    required this.message,
    this.statusCode,
    this.data,
  });

  factory ApiException.fromDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return ApiException(
          message: 'Request timed out. Please check your internet connection.',
          statusCode: error.response?.statusCode,
          data: error.response?.data,
        );
      case DioExceptionType.badResponse:
        return ApiException(
          message: _handleResponse(error.response),
          statusCode: error.response?.statusCode,
          data: error.response?.data,
        );
      case DioExceptionType.cancel:
        return ApiException(
          message: 'Request was cancelled',
          statusCode: error.response?.statusCode,
          data: error.response?.data,
        );
      case DioExceptionType.unknown:
        return ApiException(
          message: 'An unexpected error occurred',
          statusCode: error.response?.statusCode,
          data: error.response?.data,
        );
      case DioExceptionType.badCertificate:
        return ApiException(
          message: 'Invalid SSL certificate',
          statusCode: error.response?.statusCode,
          data: error.response?.data,
        );
      case DioExceptionType.connectionError:
        return ApiException(
          message: 'Connection error. Please check your internet connection.',
          statusCode: error.response?.statusCode,
          data: error.response?.data,
        );
    }
  }

  static String _handleResponse(Response? response) {
    if (response == null) return 'No response from server';

    switch (response.statusCode) {
      case 400:
        return 'Bad request';
      case 401:
        return 'Unauthorized';
      case 403:
        return 'Forbidden';
      case 404:
        return 'Resource not found';
      case 500:
        return 'Internal server error';
      case 502:
        return 'Bad gateway';
      case 503:
        return 'Service unavailable';
      case 504:
        return 'Gateway timeout';
      default:
        return 'Error occurred with status code: ${response.statusCode}';
    }
  }

  factory ApiException.fromJson(Map<String, dynamic> json) {
    return ApiException(
      message: json['message'] ?? 'Unknown error',
      statusCode: json['statusCode'],
      data: json['data'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'statusCode': statusCode,
      'data': data,
    };
  }

  @override
  String toString() => 'ApiException: $message${statusCode != null ? ' (Status: $statusCode)' : ''}';
} 