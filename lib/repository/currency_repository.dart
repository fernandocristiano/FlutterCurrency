import 'package:ntt_flutter_test/net/api/base_api.dart';
import 'package:ntt_flutter_test/net/api/currency_api.dart';

class CurrencyRepository {
  BaseApi _currencyApi = CurrencyApi();

  Future<Map<String, dynamic>> fetchAllCurrency() async {
    dynamic response = await _currencyApi.getResponse("currencies.json");

    return response;
  }

  Future<Map<String, dynamic>> fetchLatestRate(String code) async {
    dynamic response = await _currencyApi.getResponse("currencies/$code.json");

    return response[code];
  }
}
