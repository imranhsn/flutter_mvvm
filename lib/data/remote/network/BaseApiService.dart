abstract class BaseApiService {
  final String baseUrl = "https://dummy.com/";

  Future<dynamic> getResponse(String url);

}