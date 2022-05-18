import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FFMInputTheme {
  static InputDecoration ffmInputDecoration(
      String labelText,
      IconData iconData,
      {String? errorText, String? helperText, String? prefix}) {
    return InputDecoration(
      contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      helperText: helperText != null ? helperText.tr : ' ',
      labelText: labelText.tr,
      labelStyle: const TextStyle(color: Colors.grey),
      errorText: errorText != null ? errorText.tr : '',
      fillColor: Colors.grey.shade200,
      filled: true,
      prefixText: prefix != null ? prefix.tr : '',
      prefixIcon: Icon(
        iconData,
        size: 20,
      ),
      prefixIconConstraints: const BoxConstraints(minWidth: 60),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.black)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.black)),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.black)),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.black)),
    );
  }
}
