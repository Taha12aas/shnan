import 'package:chnan/utils/bill_type.dart';
import 'package:chnan/views/create_a_sales_invoice_view.dart';
import 'package:chnan/views/modify_invoice_view.dart';
import 'package:chnan/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class BillsView extends StatelessWidget {
  const BillsView({super.key});
  static String id = 'BillsView';

  void _navigateToCreateBill(BuildContext context, BillType billType) {
    Navigator.pushNamed(
      context,
      CreateASalesInvoiceView.id,
      arguments: {
        'BillType': billType,
        'bill': null,
        'isNew': true,
        'bDetalis': null,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final buttons = [
      {
        'text': 'مردود مشتريات',
        'icon': 'assets/img/home cards/medical-icon_i-billing.svg',
        'onTap': () => _navigateToCreateBill(context, BillType.undoBuy),
      },
      {
        'text': 'مبيعات',
        'icon': 'assets/img/home cards/hugeicons_payment-01.svg',
        'onTap': () => _navigateToCreateBill(context, BillType.sales),
      },
      {
        'text': 'مشتريات',
        'icon': 'assets/img/home cards/hugeicons_payment-02.svg',
        'onTap': () => _navigateToCreateBill(context, BillType.buy),
      },
      {
        'text': 'طلبات',
        'icon': 'assets/img/home cards/fluent-mdl2_product-variant.svg',
        'onTap': () => _navigateToCreateBill(context, BillType.order),
      },
      {
        'text': 'مردود مبيعات',
        'icon': 'assets/img/home cards/marketeq_bill-dollar.svg',
        'onTap': () => _navigateToCreateBill(context, BillType.undoSell),
      },
      {
        'text': 'أحدث الفواتير',
        'icon': 'assets/img/Home/arrow-up-right-from-square-svgrepo-com.svg',
        'onTap': () => Navigator.pushNamed(context, ModifyInvoiceView.id),
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: SingleChildScrollView(
        child: Wrap(
          spacing: 20,
          runSpacing: 20,
          alignment: WrapAlignment.center,
          children:
              buttons.map((btn) {
                return SizedBox(
                  width: MediaQuery.of(context).size.width / 2.3,
                  child: CustomButton(
                    text: btn['text'] as String,
                    icon: btn['icon'] as String,
                    onTap: btn['onTap'] as void Function(),
                  ),
                );
              }).toList(),
        ),
      ),
    );
  }
}
