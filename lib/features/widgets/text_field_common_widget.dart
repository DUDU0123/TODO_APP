import 'package:flutter/material.dart';

class TextFieldCommonWidget extends StatelessWidget {
  const TextFieldCommonWidget({
    Key? key,
    required this.nameController,
    required this.hintText,
    this.labelText,
    this.validator, this.keyboardType, this.errorText,
  }) : super(key: key);

  final TextEditingController nameController;
  final String hintText;
  final TextInputType? keyboardType;
  final String? labelText;
  final String? Function(String?)? validator;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
      keyboardType: keyboardType,
      validator: validator,
      controller: nameController,
      cursorColor: Colors.black,
      style: const TextStyle(
        fontSize: 20,
      ),
      decoration: InputDecoration(
        errorText: errorText,
        hintText: hintText,
        labelText: labelText,
        labelStyle: const TextStyle(
          color: Colors.black,
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
