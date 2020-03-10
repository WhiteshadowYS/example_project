import 'package:example_project/network/shared/api_error.dart';

class BaseResponse<T> {
  APIError error;

  T response;

  BaseResponse({this.error, this.response});
}