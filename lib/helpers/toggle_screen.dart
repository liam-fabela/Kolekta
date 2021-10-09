import 'package:flutter/material.dart';

import '../screens/welcome_screen.dart';
import '../screens/login_screen.dart';

class ToggleScreen extends StatefulWidget {
  const ToggleScreen({ Key? key }) : super(key: key);

  @override
  _ToggleScreenState createState() => _ToggleScreenState();
}

class _ToggleScreenState extends State<ToggleScreen> {
   bool showRegister = true;

  void toggleView() {
    setState(() {
      showRegister = !showRegister;
    });
  }


  @override
  Widget build(BuildContext context) {
    return showRegister ? WelcomeScreen(toggleView) :  LoginScreen(toggleView);
  }
}