import 'package:mvvm/data/network/BaseApiService.dart';
import 'package:mvvm/data/network/NetworkApiService.dart';
import 'package:mvvm/res/app_url.dart';

class AuthRepository {
  BaseApiService _apiService = NetworkApiService();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await _apiService.getPostApiResponse(AppUrl.loginEndpoint, data);
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> registerApi(dynamic data) async {
    try {
      dynamic response =
          await _apiService.getPostApiResponse(AppUrl.registerEndpoint, data);
      return response;
    } catch (e) {
      throw e;
    }
  }
}
