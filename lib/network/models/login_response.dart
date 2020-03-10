import 'package:example_project/models/app_user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable(nullable: false)
class LoginResponse {
  @JsonKey(name: "user")
  final AppUser user;

  LoginResponse({this.user});
  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
