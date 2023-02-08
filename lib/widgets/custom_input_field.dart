import 'dart:ui';

import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final IconData? icon;
  final IconData? suffixIcon;
  final TextInputType? keyboardType;
  final bool obscureText;
  final String formProperty;
  final Map<String, String> formValues;
  
  const CustomInputField({
    Key? key, 
    this.hintText, 
    this.labelText, 
    this.helperText, 
    this.icon,
    this.suffixIcon, 
    this.keyboardType,
    this.obscureText = false, 
    required this.formProperty, 
    required this.formValues
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: false,
      initialValue: '',
      textCapitalization: TextCapitalization.words,
      keyboardType: keyboardType,
      obscureText: obscureText,
      onChanged: (value) => formValues[formProperty] = value,
      validator: (value) {
        if (value == null) return 'Valor nulo';
         return value.length < 3 ? '3 letras minimo': null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        helperText: helperText,
        counterText: '3 caracteres min',
        suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
        icon: icon != null ? Icon(icon) : null,
        //Bordes y estilo en el Apptheme
      ),
    );
  }
}