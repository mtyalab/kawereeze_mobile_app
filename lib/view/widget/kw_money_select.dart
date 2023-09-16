import 'package:flutter/material.dart';

class KwMoneyDropdownSelect extends StatefulWidget {
  final Function(double) onChanged;
  final double selectedAmount;

  KwMoneyDropdownSelect({
    required this.onChanged,
    required this.selectedAmount,
  });

  @override
  _KwMoneyDropdownSelectState createState() => _KwMoneyDropdownSelectState();
}

class _KwMoneyDropdownSelectState extends State<KwMoneyDropdownSelect> {
  static const double minValue = 100000;
  static const double maxValue = 1000000;
  static const double stepValue = 100000;

  @override
  Widget build(BuildContext context) {
    List<String> moneyOptions = [];

    for (double amount = minValue; amount <= maxValue; amount += stepValue) {
      moneyOptions.add('UGX ${amount.toStringAsFixed(2)}');
    }

    return SizedBox(
      width: double.infinity,
      child: DropdownButton<String>(
        value: 'UGX ${widget.selectedAmount.toStringAsFixed(2)}',
        onChanged: (selectedOption) {
          double selectedAmount = double.parse(selectedOption!.substring(4));
          widget.onChanged(selectedAmount);
        },
        items: moneyOptions.map((String option) {
          return DropdownMenuItem<String>(
            value: option,
            child: Text(option),
          );
        }).toList(),
      ),
    );
  }
}
