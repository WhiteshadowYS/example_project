import 'api_error.dart';

class BaseNetworkResponse {
  APIError error;

  dynamic response;

  BaseNetworkResponse({this.error, this.response});
}
