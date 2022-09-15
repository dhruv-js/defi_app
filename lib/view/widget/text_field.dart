import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class Textfield extends StatelessWidget {
  final String hint;
  final String formControlName;
  final Icon? icon;

  const Textfield(
      {super.key,
      required this.formControlName,
      required this.hint,
      this.icon});

  @override
  Widget build(BuildContext context) {
    return ReactiveTextField(
      style: const TextStyle(color: Colors.white, fontSize: 18),
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 12.0),
          hintText: hint,
          filled: true,
          fillColor: const Color(0xff282A2F),
          hintStyle: const TextStyle(color: Colors.white70),
          prefixIcon: icon,
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10))),
      formControlName: formControlName,
    );
  }
}
