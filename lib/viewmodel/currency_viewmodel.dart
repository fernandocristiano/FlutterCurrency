import 'package:flutter/cupertino.dart';
import 'package:ntt_flutter_test/model/currency_model.dart';
import 'package:ntt_flutter_test/repository/currency_repository.dart';

class CurrencyViewModel with ChangeNotifier {
  List<Currency> _currencyList = [];
  List<String> _currenciesMapKeys = [];

  List<Currency> get currencyList {
    return _currencyList;
  }

  Future<void> fetchCurrenciesByCode(String code) async {
    try {
      Map<String, dynamic> currencies = await CurrencyRepository().fetchAllCurrency();
      Map<String, dynamic> currenciesValue = await CurrencyRepository().fetchLatestRate(code);

      _currenciesMapKeys = currencies.keys.toList();

      _currencyList.clear();
      _currenciesMapKeys.forEach((key) {
        _currencyList.add(Currency(code: key, name: currencies[key], value: double.tryParse(currenciesValue[key].toString()), imageUrl: "https://www.countryflags.io/${key.substring(0, 2)}/flat/64.png"));
      });

    } catch (e) {
      print(e);
    }
    notifyListeners();
  }
}
