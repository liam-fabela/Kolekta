import 'package:flutter/material.dart';

TextStyle logoFont() {
  return const TextStyle(
    color: Color.fromRGBO(62, 135, 148, 1),
    fontSize: 75,
    fontFamily: 'Bebas Neue',
    fontWeight: FontWeight.bold,
  );
}

TextStyle buttonText1() {
  return const TextStyle(
    color: Colors.white,
    fontSize: 20,
    fontFamily: 'Bebas Neue',
  );
}

TextStyle buttonText2() {
  return const TextStyle(
    color: Color.fromRGBO(62, 135, 148, 1),
    fontSize: 20,
    fontFamily: 'Bebas Neue',
  );
}

TextStyle secondaryHeader() {
  return const TextStyle(
    color: Color.fromRGBO(42, 173, 151,1),
    fontSize: 20,
    fontFamily: 'Bebas Neue',
  );
}

InputDecoration textFieldInputDecoration(String hintText) {
  return InputDecoration(
    hintText: hintText,
    hintStyle: const TextStyle(
      color: Colors.black54,
    ),
    
  );
}