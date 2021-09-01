import 'package:flutter/cupertino.dart';
import 'package:ntt_flutter_test/model/currency_model.dart';
import 'package:ntt_flutter_test/repository/currency_repository.dart';

class CurrencyListViewModel extends ChangeNotifier {
  CurrencyRepository repository = CurrencyRepository();

  List<Currency> _currencyList = [];
  List<Currency> _currencyListBackup = [];
  List<String> _currenciesMapKeys = [];

  List<Currency> get currencyList => _currencyList;

  Future<void> filterCurrency(String value) async {
    _currencyList = _currencyListBackup.where((element) => element.name.toUpperCase().contains(value.toUpperCase()) || element.code.toUpperCase().contains(value.toUpperCase())).toList();
    notifyListeners();
  }

  Future<void> fetchCurrencies() async {
    try {
      Map<String, dynamic> currencies = await repository.fetchAllCurrency();

      _currenciesMapKeys = currencies.keys.toList();

      _currencyListBackup.clear();
      _currenciesMapKeys.forEach((key) {
        _currencyListBackup.add(Currency(code: key, name: currencies[key], value: null, imageUrl: "https://www.countryflags.io/${key.substring(0, 2)}/flat/64.png"));
      });

      _currencyList = _currencyListBackup;
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }
}
