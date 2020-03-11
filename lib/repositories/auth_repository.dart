import 'package:example_project/models/app_user.dart';
import 'package:example_project/network/shared/api_error.dart';
import 'package:example_project/repositories/shared/base_response.dart';
import 'package:example_project/services/auth_service.dart';
import 'package:flutter/cupertino.dart';

class AuthRepository {
  AuthRepository._privateConstructor();

  static final AuthRepository _instance = AuthRepository._privateConstructor();

  static AuthRepository get instance => _instance;

  Future<BaseResponse<AppUser>> login({@required String email, @required String password}) async {
    if (email == null || email == '') {
      return BaseResponse<AppUser>(error: APIError.getParsingError('Email is empty'));
    } else if (password == null || password == '') {
      return BaseResponse<AppUser>(error: APIError.getParsingError('Password is empty'));
    }

    return await AuthService.instance.login(email: email, password: password);
  }

  Future<BaseResponse<String>> logout() async {

    return await AuthService.instance.logout();
  }

  Future<void> saveUserToStorage(AppUser user) async {
    return await AuthService.instance.saveUserToStorage(user);
  }

  Future<void> deleteUserFromStorage() async {
    return await AuthService.instance.deleteUserFromStorage();
  }

  Future<AppUser> getUserFromStorage() async {
    return await AuthService.instance.getUserFromStorage();
  }

}