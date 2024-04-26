import 'package:camp_examples/conversor_moedas/models/currency_model.dart';
import 'package:flutter/material.dart';

class CurrencyBox extends StatelessWidget {
  final List<CurrencyModel> items;
  final CurrencyModel selectedItem;
  final TextEditingController controller;
  final void Function(CurrencyModel model) onChanged;

  const CurrencyBox(
      {super.key,
      required this.items,
      required this.controller,
      required this.onChanged,
      required this.selectedItem});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            flex: 1,
            child: SizedBox(
              height: 57,
              child: DropdownButton<CurrencyModel>(
                  iconEnabledColor: Colors.deepOrangeAccent,
                  isExpanded: true,
                  value: selectedItem,
                  underline:
                      Container(height: 1, color: Colors.deepOrangeAccent),
                  items: items
                      .map((e) =>
                          DropdownMenuItem(value: e, child: Text(e.name)))
                      .toList(),
                  onChanged: (onChanged) {}),
            )),
        const SizedBox(width: 10),
        Expanded(
          flex: 2,
          child: TextField(
            controller: controller,
            decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.deepOrangeAccent),
            )),
          ),
        ),
      ],
    );
  }
}
