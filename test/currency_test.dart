import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:ntt_flutter_test/repository/currency_repository.dart';
import 'package:ntt_flutter_test/ui/currency_list_page.dart';
import 'package:ntt_flutter_test/viewmodel/currency_list_viewmodel.dart';
import 'package:ntt_flutter_test/viewmodel/currency_viewmodel.dart';
import 'package:provider/provider.dart';

import 'widget_test.mocks.dart';

Widget makeTestableWidget() => MaterialApp(home: Image.network(''));

@GenerateMocks([CurrencyRepository])
void main() {
  //region Config
  CurrencyRepository repository = MockCurrencyRepository();
  when(repository.fetchAllCurrency()).thenAnswer((_) async => jsonDecode('{ "aed": "United Arab Emirates Dirham",'
      ' "afn": "Afghan afghani",'
      ' "all": "Albanian lek",'
      ' "amd": "Armenian dram",'
      ' "aud": "Australian dollar"}'));

  when(repository.fetchLatestRate("afn")).thenAnswer((_) async => jsonDecode('{ "aed": 118.5201,'
      ' "afn": 5.054318,'
      ' "all": 118.5201,'
      ' "amd": 118.5201,'
      ' "aud": 118.5201}'));

  CurrencyListViewModel viewModel = CurrencyListViewModel();
  CurrencyViewModel currencyViewModel = CurrencyViewModel();
  viewModel.repository = repository;
  currencyViewModel.repository = repository;
  //endregion

  //region Test 1
  testWidgets('Should display list with 5 elements', (tester) async {
    mockNetworkImagesFor(() async {
      await tester.pumpWidget(MultiProvider(
        providers: [ChangeNotifierProvider.value(value: viewModel)],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'NTTData',
          home: CurrencyListPage(),
        ),
      ));

      // Check elements on page
      expect(find.text("NTTData"), findsOneWidget);
      expect(find.byIcon(Icons.apps), findsOneWidget);
      expect(find.byType(ListView), findsOneWidget);

      // Fetch data and check if displayed 5 elements
      await repository.fetchAllCurrency();
      await tester.pumpAndSettle();
      expect(find.byType(FadeInImage), findsNWidgets(5));

      debugDefaultTargetPlatformOverride = null;
    });
  });
  //endregion

  //region Test 2
  testWidgets('Search a currency in the List & after remove search text', (tester) async {
    mockNetworkImagesFor(() async {
      await tester.pumpWidget(MultiProvider(
        providers: [ChangeNotifierProvider.value(value: viewModel)],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'NTTData',
          home: CurrencyListPage(),
        ),
      ));

      expect(find.text("NTTData"), findsOneWidget);
      await tester.pumpAndSettle();

      // Fetch all currencies and display in a list
      expect(find.byType(FadeInImage), findsNWidgets(5));

      // Search for specific currency and display one
      await tester.enterText(find.byType(TextField), 'aud');
      await tester.tap(find.byType(IconButton));
      await tester.pumpAndSettle();
      expect(find.byType(FadeInImage), findsNWidgets(1));

      // Clean search and should display all
      await tester.enterText(find.byType(TextField), '');
      await tester.tap(find.byType(IconButton));
      await tester.pumpAndSettle();
      expect(find.byType(FadeInImage), findsNWidgets(5));

      debugDefaultTargetPlatformOverride = null;
    });
  });
  //endregion

  //region Test 3
  testWidgets('Tap on a currency, go to next screen, show results and return to previous screen', (tester) async {
    mockNetworkImagesFor(() async {
      await tester.pumpWidget(MultiProvider(
        providers: [ChangeNotifierProvider.value(value: viewModel), ChangeNotifierProvider.value(value: currencyViewModel)],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'NTTData',
          home: CurrencyListPage(),
        ),
      ));

      // Fetch all currencies and display in a list
      await tester.pumpAndSettle();
      expect(find.byType(FadeInImage), findsNWidgets(5));

      // Tap on a currency
      await tester.tapAt(const Offset(50.0, 250.0));
      await tester.pumpAndSettle();

      // Check if next screen has all 5
      expect(find.byType(FadeInImage), findsNWidgets(5));

      // Tap on back button
      await tester.tap(find.byIcon(Icons.arrow_back));
      await tester.pumpAndSettle();

      expect(find.text("NTTData"), findsOneWidget);

      debugDefaultTargetPlatformOverride = null;
    });
  });
  //endregion

}
