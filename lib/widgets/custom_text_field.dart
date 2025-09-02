import 'package:flutter/material.dart';
import 'package:notes_app/widgets/bottom_sheet_widget.dart';

class CustomTextField extends StatefulWidget {
  final String hint;
  final int maxLines;
  final Function(String?)? onSaved;
  final String initialText;
  final bool expands;

  const CustomTextField({
    Key? key,
    required this.hint,
     this.maxLines=1,
    this.onSaved,
    this.initialText = '',
    this.expands = false,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: widget.initialText,
      onSaved: widget.onSaved,
      expands: widget.expands,
      maxLines: widget.maxLines, 
      validator: (value) {
        if (value?.trim().isEmpty ?? true) {
          return 'Field is Empty';
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: widget.hint,
        focusedBorder: myBorder(),
        enabledBorder: myBorder(),
        border: myBorder(),
      ),
    );
  }
}
OutlineInputBorder myBorder({Color color = Colors.white}) {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: color));
}
