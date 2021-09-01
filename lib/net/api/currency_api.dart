import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' show Client;
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:ntt_flutter_test/net/helper/api_exception.dart';

import 'base_api.dart';

class CurrencyApi extends BaseApi {
  Client client = Client();

  @override
  Future getResponse(String url) async {
    dynamic responseJson;
    try {
      final response = await client.get(Uri.parse(baseUrl + url));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  @visibleForTesting
  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException('Error occurred while communication with server with status code : ${response.statusCode}');
    }
  }
}
