import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ntt_flutter_test/model/currency_model.dart';
import 'package:ntt_flutter_test/ui/currency_page.dart';

class CurrencyList extends StatelessWidget {
  final List<Currency> currencies;
  final bool clickable;

  CurrencyList({required this.currencies, required this.clickable});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.only(top: 10.0),
        itemCount: this.currencies.length,
        itemBuilder: (context, index) {
          final currency = this.currencies[index];

          return Container(
              padding: EdgeInsets.all(10.0),
              child: GestureDetector(
                child: Row(children: [
                  FadeInImage(
                      image: NetworkImage(currency.imageUrl!),
                      placeholder: AssetImage("assets/not_found.png"),
                      imageErrorBuilder: (context, error, stackTrace) {
                        return Image.asset('assets/not_found.png');
                      },
                      fit: BoxFit.cover,
                      height: 60.0,
                      width: 110.0),
                  Expanded(
                      child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${currency.code.toUpperCase()} ${currency.value != null ? currency.value : ''}", style: TextStyle(color: Colors.black, fontSize: 18.0)),
                              Text(currency.name, style: TextStyle(color: Colors.grey, fontSize: 15.0)),
                            ],
                          ))),
                  if (clickable) Icon(Icons.navigate_next)
                ]),
                onTap: () {
                  if (clickable) {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CurrencyPage(currency.code)));
                  }
                },
              ));
        });
  }
}
