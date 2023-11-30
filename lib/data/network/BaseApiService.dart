abstract class BaseApiService {
  Future<dynamic> getGetApiResponse(String url);
  Future<dynamic> getPostApiResponse(String url, dynamic data);
  // Future<dynamic> getPutApiResponse(String url, dynamic body);
  // Future<dynamic> getDeleteApiResponse(String url);
}
