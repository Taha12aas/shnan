import 'package:chnan/utils/const.dart';
import 'package:chnan/views/accounts_view.dart';
import 'package:chnan/views/add_invoice_details_view.dart';
import 'package:chnan/views/bills_view.dart';
import 'package:chnan/views/create_a_sales_invoice_view.dart';
import 'package:chnan/views/home_view.dart';
import 'package:chnan/views/material_statement_result_view.dart';
import 'package:chnan/views/material_statement_view.dart';
import 'package:chnan/views/material_view.dart';
import 'package:chnan/views/new_account_view.dart';
import 'package:chnan/views/new_material_view.dart';
import 'package:chnan/views/modify_invoice_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main(List<String> args) async {
  runApp(ChananApp());
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  await Supabase.initialize(
    url: 'https://iijuwfvyakftpkndyqzn.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImlpanV3ZnZ5YWtmdHBrbmR5cXpuIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTI3MDA4ODcsImV4cCI6MjA2ODI3Njg4N30.ou02o28wsUV71B0B8FM4m4CsHgSlJ_ce3nhHFfi9_Zg',
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
        ModifyInvoiceView.id: (context) => ModifyInvoiceView(),
        NewMedicineView.id: (context) => NewMedicineView(),
        NewAccountView.id: (context) => NewAccountView(),
        MaterialStatementView.id: (context) => MaterialStatementView(),
        MaterialStatementResultView.id:
            (context) => const MaterialStatementResultView(),
        AddInvoiceDetailsView.id: (context) => AddInvoiceDetailsView(),
      },
    );
  }
}
