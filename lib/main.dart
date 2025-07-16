import 'package:chnan/utils/const.dart';
import 'package:chnan/views/accounts_view.dart';
import 'package:chnan/views/bills_view.dart';
import 'package:chnan/views/create_a_sales_invoice_view.dart';
import 'package:chnan/views/home_view.dart';
import 'package:chnan/views/material_statement_result_view.dart';
import 'package:chnan/views/material_statement_view.dart';
import 'package:chnan/views/material_view.dart';
import 'package:chnan/views/new_account_view.dart';
import 'package:chnan/views/new_material_view.dart';
import 'package:chnan/views/review_invoices.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main(List<String> args) {
  runApp(ChananApp());
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
}

class ChananApp extends StatelessWidget {
  const ChananApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: kAppColor,
          titleTextStyle: TextStyle(color: Colors.white),
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: HomeView.id,
      routes: {
        HomeView.id: (context) => const HomeView(),
        AccountsView.id: (context) => AccountsView(),
        BillsView.id: (context) => BillsView(),
        CreateASalesInvoiceView.id: (context) => CreateASalesInvoiceView(),
        MaterialView.id: (context) => MaterialView(),
        ReviewInvoices.id: (context) => ReviewInvoices(),
        NewMedicineView.id: (context) => NewMedicineView(),
        NewAccountView.id: (context) => NewAccountView(),
        MaterialStatementView.id: (context) => MaterialStatementView(),
        MaterialStatementResultView.id:
            (context) => const MaterialStatementResultView(),
      },
    );
  }
}
