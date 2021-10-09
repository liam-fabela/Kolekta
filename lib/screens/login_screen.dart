import 'package:flutter/material.dart';

import '../styles/style.dart';

class LoginScreen extends StatefulWidget {
  final Function toggle;

  const LoginScreen(this.toggle, {Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/header.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              
              Positioned(
                top: MediaQuery.of(context).size.height * 0.25,
                child: Container(
                 height: MediaQuery.of(context).size.height * 0.75,
                 width: MediaQuery.of(context).size.width,
                 decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15.0),
                              topRight: Radius.circular(15.0),
                ),
                          ),
                child: Column(
                  children: [
                    
                ],),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.19,
                left: 20,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width * 0.2,
                  decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/garbage-truck-shadow.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
