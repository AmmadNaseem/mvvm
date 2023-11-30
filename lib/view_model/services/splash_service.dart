import 'package:flutter/material.dart';
import 'package:mvvm/model/user_model.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/utils/utils.dart';
import 'package:mvvm/view_model/user_view_model.dart';

class SplashService {
  Future<UserModel> getUserData() => UserViewModel().getUser();
  void checkAuthentication(BuildContext context) async {
    getUserData().then((value) async {
      if (value.token == 'null' || value.token.toString() == '') {
        Future.delayed(const Duration(seconds: 3));
        Navigator.pushNamed(context, RoutesName.login);
      } else {
        Future.delayed(const Duration(seconds: 3));
        Navigator.pushNamed(context, RoutesName.home);
      }
    }).onError((error, stackTrace) {
      Utils.flushBarErrorMessage(error.toString(), context);
    });
  }
}
