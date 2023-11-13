import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({
    super.key,
    required this.labelText,
    required this.controller,
    this.keybordType,
  });

  final String labelText;
  final TextEditingController controller;
  final TextInputType? keybordType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keybordType,
      style: TextStyle(
        color: Theme.of(context).colorScheme.onBackground,
      ),
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
      ),
    );
  }
}
