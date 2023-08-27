import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField(
      {super.key,
      required TextEditingController controller,
      required String hintText,
      List<TextInputFormatter>? inputFormatters,
      String? Function(String?)? validator})
      : _controller = controller,
        _hintText = hintText,
        _inputFormatters = inputFormatters,
        _validator = validator;

  final TextEditingController _controller;
  final String _hintText;
  final List<TextInputFormatter>? _inputFormatters;
  final String? Function(String?)? _validator;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: _controller,
        inputFormatters: _inputFormatters,
        validator: _validator,
        decoration: InputDecoration(hintText: _hintText),
      ),
    );
  }
}
