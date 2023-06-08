import 'package:flutter/material.dart';

class InputDecorations {
  static InputDecoration authInputDecoration({
    required String hintText,
    required String labelText,
    IconData? prefixIcon,
  }) {
    return InputDecoration(
                  icon: prefixIcon != null ? Icon( prefixIcon, color: Colors.indigo) : null,
                  labelText: labelText,
                  labelStyle: TextStyle(color: Colors.indigo),
                  hintText: hintText,
                  iconColor: Colors.indigo,
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.indigo,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.indigo,
                      width: 2,
                    ),
                  )
                );
  }
}