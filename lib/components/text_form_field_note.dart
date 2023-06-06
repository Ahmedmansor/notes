import 'package:flutter/material.dart';

class TextFormFieldNote extends StatelessWidget {
  TextFormFieldNote(
      {super.key, this.controller, this.label, this.maxlines, this.minlines});

  int? maxlines;
  int? minlines;
  String? label;
  TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxlines,
      minLines: minlines,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );
  }
}
