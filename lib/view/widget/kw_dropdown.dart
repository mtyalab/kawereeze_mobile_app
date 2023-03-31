import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../theme/theme.dart';

class KwDropdownWidget extends StatelessWidget {
  const KwDropdownWidget(
      {Key? key,
      required this.formControlName,
      required this.dropdownItems,
      required this.label,
      required this.onchange})
      : super(key: key);
  final String formControlName;
  final List<String> dropdownItems;
  final String label;
  final ReactiveFormFieldCallback onchange;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ReactiveDropdownField<String>(
            formControlName: formControlName,
            hint: Text(
              label,
              style: const TextStyle(color: Colors.white),
            ),
            dropdownColor: Colors.white,
            borderRadius: BorderRadius.circular(size5),
            onChanged: onchange,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.only(top: size20, left: size10),
              enabled: true,
              labelStyle: TextStyle(color: Colors.black),
              hintStyle: TextStyle(color: Color(0xFF656565)),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: primaryColor, width: 0.4),
              ),
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: primaryColor, width: 0.4)),
              errorStyle: TextStyle(
                height: 0.7,
                color: Colors.red,
              ),
              errorText: null,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: primaryColor, width: 0.4),
              ),
            ),
            items: dropdownItems
                .map((value) => DropdownMenuItem(
                    value: value,
                    child: SizedBox(
                      width: size320,
                      child: Text(
                        value,
                        style: const TextStyle(color: primaryColor),
                      ),
                    )))
                .toList()),
      ],
    );
  }
}
