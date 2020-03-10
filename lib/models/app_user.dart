import 'package:flutter/material.dart';

import 'package:json_annotation/json_annotation.dart';

part 'app_user.g.dart';

@JsonSerializable(nullable: false)
class AppUser {
  @JsonKey(name: "email", required: true, nullable: true)
  final String email;

  @JsonKey(name: "password", required: true, nullable: true)
  final String password;

  AppUser({
    @required this.email,
    @required this.password,
  });

  factory AppUser.fromJson(dynamic json) => _$AppUserFromJson(json);

  dynamic toJson() => _$AppUserToJson(this);
}