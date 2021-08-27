import 'package:flutter/material.dart';
import 'package:ntt_flutter_test/ui/currency_list_page.dart';
import 'package:ntt_flutter_test/viewmodel/currency_list_viewmodel.dart';
import 'package:ntt_flutter_test/viewmodel/currency_viewmodel.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: CurrencyViewModel()),
        ChangeNotifierProvider.value(value: CurrencyListViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'NTTData',
        theme: ThemeData(
          appBarTheme: AppBarTheme(),
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
        ),
        home: CurrencyListPage(),
      ),
    );
  }
}
