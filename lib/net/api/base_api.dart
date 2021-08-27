
abstract class BaseApi {
  final String baseUrl = "https://cdn.jsdelivr.net/gh/fawazahmed0/currency-api@1/latest/";

  Future<dynamic> getResponse(String url);

}