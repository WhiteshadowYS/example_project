import 'dart:convert';
import 'package:flutter/material.dart';

import './storage_service.dart';
import 'package:example_project/models/app_user.dart';
import 'package:example_project/repositories/shared/base_response.dart';
import 'package:example_project/network/shared/api_error.dart';
import 'package:example_project/utils/consts.dart';

class AuthService {
  AuthService._privateConstructor();

  static final AuthService _instance = AuthService._privateConstructor();

  static AuthService get instance => _instance;

  Future<void> saveUserToStorage(AppUser user) async {
    if (user == null) return;

    String encodedUser;

    try {
      encodedUser = jsonEncode(user.toJson());
    } catch (e) {
      return;
    }

    if (encodedUser == null || encodedUser == '') {
      return;
    }

    LocalStorageService.instance.saveValueByKey(StorageKeys.user, encodedUser);
    return;
  }

  Future<AppUser> getUserFromStorage() async {
    String jsonUser;
    Map decodedUser;

    try {
      print('decodedUser: $decodedUser');
      jsonUser = await LocalStorageService.instance.getValueByKey(StorageKeys.user);

      if (jsonUser != null && jsonUser != '') {
        decodedUser = jsonDecode(jsonUser);
      }

    } catch(e) {
      print('catch error');
      return null;
    }

    if (decodedUser != null && decodedUser.isNotEmpty) {
      print('decodedUser: $decodedUser');
      return AppUser.fromJson(decodedUser);
    }

    return null;
  }

  Future<void> deleteUserFromStorage() async {
    await LocalStorageService.instance.saveValueByKey(StorageKeys.user, '');
    return;
  }


  Future<BaseResponse<AppUser>> login({@required String email, @required String password}) async {
    bool isEmailCorrect     = email     == SUCCESS_EMAIL;
    bool isPasswordCorrect  = password  == SUCCESS_PASSWORD;

    if (isEmailCorrect && isPasswordCorrect) {
      return BaseResponse<AppUser>(response: AppUser(
        email:    email,
        password: password,
      ));
    } else if (isEmailCorrect && !isPasswordCorrect) {
      return BaseResponse<AppUser>(
        error: APIError.getParsingError('User password is not correct'),
      );
    } else if (!isEmailCorrect && isPasswordCorrect) {
      return BaseResponse<AppUser>(
        error: APIError.getParsingError('User email is not correct'),
      );
    } else {
      return BaseResponse<AppUser>(
        error: APIError.getParsingError('User email and password is not correct'),
      );
    }
  }

  Future<BaseResponse<String>> logout() async {
    await deleteUserFromStorage();
    return BaseResponse(response: 'success');
  }
}