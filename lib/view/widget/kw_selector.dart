import 'package:flutter/material.dart';
import 'package:flutter_custom_selector/flutter_custom_selector.dart';
import 'package:kawereeze/theme/theme.dart';


class KwSelector extends StatefulWidget {
  const KwSelector({super.key, required this.title, required this.dataString});
  final String title;
  final List<String> dataString;

  @override
  State<KwSelector> createState() => _KwSelectorState();
}

class _KwSelectorState extends State<KwSelector> {

  String? selectedString = '100000';
  List<String>? selectedDataString;

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery
        .of(context)
        .size
        .width;
    return SizedBox(
      width: deviceWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(
            height: size15,
          ),

           CustomSingleSelectField<String>(
             items: widget.dataString,
             title: "${widget.title}",

             onSelectionDone: (value) {
               setState(() {
                 selectedString = value;
               });
             },
             itemAsString: (item) => item,
           ),
          const SizedBox(
            height: size20,
          ),

        ],
      ),
    );
  }

}

