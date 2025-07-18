import 'package:chnan/views/add_invoice_details_view.dart';
import 'package:chnan/widgets/card.dart';
import 'package:chnan/widgets/custom_button_save.dart';
import 'package:chnan/widgets/text_field_barcode.dart';
import 'package:flutter/material.dart';

class CreateASalesInvoiceView extends StatelessWidget {
  const CreateASalesInvoiceView({super.key});
  static String id = 'CreateASalesInvoice';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('فاتورة جديدة')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFieldBaracode(controller: TextEditingController()),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(10),
                  children: [
                    Center(
                      child: QuantityInput(
                        onDelete: () {},
                        itemName: "مذيب قطارة صغير",
                        initialQuantity: 1,
                        onQuantityChanged: (value) {
                          print("الكمية الجديدة: $value");
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomButtonSave(
                      label: 'إلغاء',
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    CustomButtonSave(
                      label: 'التالي',
                      onTap: () {
                        Navigator.pushNamed(context, AddInvoiceDetailsView.id);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
