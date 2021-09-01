import 'package:flutter/material.dart';
import 'package:ntt_flutter_test/viewmodel/currency_viewmodel.dart';
import 'package:ntt_flutter_test/widget/currency_list_widget.dart';
import 'package:provider/provider.dart';

class CurrencyPage extends StatefulWidget {
  final String _currencyCode;

  CurrencyPage(this._currencyCode);

  @override
  _CurrencyPageState createState() => _CurrencyPageState(_currencyCode);
}

class _CurrencyPageState extends State<CurrencyPage> {
  final String _currencyCode;

  _CurrencyPageState(this._currencyCode);

  @override
  void initState() {
    super.initState();

    Provider.of<CurrencyViewModel>(context, listen: false).fetchCurrenciesByCode(_currencyCode);
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<CurrencyViewModel>(context);

    return Scaffold(appBar: AppBar(backgroundColor: Colors.black, title: Text(_currencyCode.toUpperCase())), backgroundColor: Colors.white, body: Column(children: [Expanded(child: CurrencyList(currencies: viewModel.currencyList, clickable: false))]));
  }
}
