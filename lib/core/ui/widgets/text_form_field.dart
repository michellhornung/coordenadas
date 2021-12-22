import 'package:flutter/material.dart';

class CoordTextFormField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final bool obscureText;
  final IconButton? suffixIcon;
  final ValueNotifier<bool> _obscureTextVN;

  CoordTextFormField({
    Key? key,
    required this.label,
    this.controller,
    this.validator,
    this.obscureText = false,
    this.suffixIcon,
  })  : _obscureTextVN = ValueNotifier<bool>(obscureText),
        assert(obscureText == true ? suffixIcon == null : true, 'obscureText nao pode ser adicionado junto com o suffixIcon'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable: _obscureTextVN,
        builder: (_, obscureTextValue, child) {
          return TextFormField(
            key: key,
            controller: controller,
            validator: validator,
            obscureText: obscureTextValue,
            decoration: InputDecoration(
                labelText: label,
                labelStyle: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  gapPadding: 0,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  gapPadding: 0,
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                suffixIcon: obscureText
                    ? IconButton(
                        onPressed: () {
                          _obscureTextVN.value = !obscureTextValue;
                        },
                        icon: Icon(obscureTextValue ? Icons.lock : Icons.lock_open),
                      )
                    : suffixIcon),
          );
        });
  }
}
