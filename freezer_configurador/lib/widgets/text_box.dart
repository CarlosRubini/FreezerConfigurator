import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextBox extends StatelessWidget {
  final String hintText;
  final bool isPassword;
  final bool autoFocus;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final TextEditingController controller;
  final double paddingLeft;
  final double paddingTop;
  final double paddingRight;
  final double paddingBottom;
  final TextInputType textInputType;
  final Function(String)? onSubmitted;
  final double width;
  final Function? onTap;
  final bool readOnly;
  final Function(String)? onChanged;
  final Function(String?)? validator;
  final int maxLines;
  final List<TextInputFormatter>? inputFormatters;
  final TextAlign textAlign;
  final Function()? onEditingComplete;
  final Iterable<String>? autofillHints;

  const TextBox(
      {Key? key,
      required this.hintText,
      this.isPassword = false,
      this.autoFocus = false,
      this.focusNode,
      this.nextFocusNode,
      required this.controller,
      this.paddingLeft = 32.0,
      this.paddingTop = 0.0,
      this.paddingRight = 32.0,
      this.paddingBottom = 16.0,
      this.textInputType = TextInputType.text,
      this.onSubmitted,
      this.width = double.maxFinite,
      this.onTap,
      this.readOnly = false,
      this.onChanged,
      this.maxLines = 1,
      this.validator,
      this.inputFormatters,
      this.textAlign = TextAlign.start,
      this.onEditingComplete,
      this.autofillHints})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: SizedBox(
        width: width,
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              paddingLeft, paddingTop, paddingRight, paddingBottom),
          child: TextFormField(
            autofillHints: autofillHints,
            inputFormatters: inputFormatters,
            validator: (String? term) {
              if (validator != null) return validator!(term);
              return null;
            },
            readOnly: readOnly,
            onTap: () {
              if (onTap != null) onTap!();
              return;
            },
            decoration: InputDecoration(
              hintText: hintText,
              labelText: hintText,
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue, width: 2.0),
              ),
            ),
            onEditingComplete: () {
              if (onEditingComplete != null) onEditingComplete!();
            },
            textAlign: textAlign,
            keyboardType: textInputType,
            obscureText: isPassword,
            autofocus: autoFocus,
            textInputAction: TextInputAction.next,
            focusNode: focusNode,
            controller: controller,
            onChanged: (String term) {
              if (onChanged != null) onChanged!(term);
            },
            onFieldSubmitted: (String term) {
              if (onSubmitted != null) onSubmitted!(term);
            },
            maxLines: maxLines,
          ),
        ),
      ),
    );
  }
}
