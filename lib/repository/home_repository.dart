import 'package:mvvm/data/network/BaseApiService.dart';
import 'package:mvvm/data/network/NetworkApiService.dart';
import 'package:mvvm/model/movies_model.dart';
import 'package:mvvm/res/app_url.dart';

class HomeRepository {
  BaseApiService _apiService = NetworkApiService();

  Future<MovieListModel> fetchMoviesList() async {
    try {
      dynamic response =
          await _apiService.getGetApiResponse(AppUrl.moviesListEndpoint);
      return response = MovieListModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}
