import 'package:flutter/material.dart';
import 'package:ntt_flutter_test/model/currency_model.dart';
import 'package:ntt_flutter_test/viewmodel/currency_viewmodel.dart';
import 'package:ntt_flutter_test/widget/currency_list_widget.dart';
import 'package:provider/provider.dart';

class CurrencyPage extends StatelessWidget {
  final String _currencyCode;

  CurrencyPage(this._currencyCode);

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<CurrencyViewModel>(context);
    viewModel.fetchCurrenciesByCode(_currencyCode);

    return Scaffold(appBar: AppBar(backgroundColor: Colors.black, title: Text(_currencyCode.toUpperCase())), backgroundColor: Colors.white, body: Column(children: [Expanded(child: CurrencyList(currencies: viewModel.currencyList, clickable: false))]));
  }
}
