import 'package:json_annotation/json_annotation.dart';

part 'api_error_response.g.dart';

/// For Update use:
/// flutter packages pub run build_runner build

@JsonSerializable(nullable: false)
class APIErrorResponse {
  @JsonKey(name: "data")
  final int data;

  APIErrorResponse({this.data});

  factory APIErrorResponse.fromJson(Map<String, dynamic> json) => _$APIErrorResponseFromJson(json);

  Map<String, dynamic> toJson() => _$APIErrorResponseToJson(this);
}