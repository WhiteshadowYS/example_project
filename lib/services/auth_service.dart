import 'package:example_project/models/app_user.dart';
import 'package:example_project/repositories/shared/base_response.dart';
import 'package:flutter/material.dart';

class AuthService {
  AuthService._privateConstructor();

  static final AuthService _instance = AuthService._privateConstructor();

  static AuthService get instance => _instance;

  Future<BaseResponse<AppUser>> login({@required String email, @required String password}) async {
    return BaseResponse<AppUser>(response: AppUser(
      email: '',
      password: '',
    ));
  }

  Future<BaseResponse<String>> logout() async {

    return BaseResponse(response: 'success');
  }
}