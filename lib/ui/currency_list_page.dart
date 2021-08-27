import 'package:flutter/material.dart';
import 'package:ntt_flutter_test/viewmodel/currency_list_viewmodel.dart';
import 'package:ntt_flutter_test/widget/currency_list_widget.dart';
import 'package:provider/provider.dart';

class CurrencyListPage extends StatefulWidget {
  const CurrencyListPage({Key? key}) : super(key: key);

  @override
  _CurrencyListPageState createState() => _CurrencyListPageState();
}

class _CurrencyListPageState extends State<CurrencyListPage> {
  final TextEditingController _filterController = TextEditingController();

  Future<Null> _refresh() async {
    await Future.delayed(Duration(seconds: 1));

    _filterController.text = "";
    Provider.of<CurrencyListViewModel>(context, listen: false).fetchCurrencies();
  }

  @override
  void initState() {
    super.initState();

    Provider.of<CurrencyListViewModel>(context, listen: false).fetchCurrencies();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<CurrencyListViewModel>(context);

    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black, title: Text("NTTData"), leading: Icon(Icons.apps)),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
              color: Colors.grey.withOpacity(0.25),
              child: Padding(
                padding: EdgeInsets.fromLTRB(50.0, 0.0, 10.0, 0.0),
                child: Row(children: [
                  Expanded(
                      child: TextField(
                          controller: _filterController,
                          decoration: InputDecoration(labelText: "Search", labelStyle: TextStyle(color: Colors.grey), border: InputBorder.none),
                          style: TextStyle(color: Colors.black, fontSize: 18.0),
                          onSubmitted: (text) {
                            viewModel.filterCurrency(text);
                          })),
                  IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {
                        viewModel.filterCurrency(_filterController.text);
                      })
                ]),
              )),
          Expanded(child: RefreshIndicator(onRefresh: _refresh, child: CurrencyList(currencies: viewModel.currencyList, clickable: true)))
        ],
      ),
    );
  }
}
