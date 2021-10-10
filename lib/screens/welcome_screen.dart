// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/login_screen.dart';
import '../screens/register_screen.dart';
import '../styles/style.dart';

class WelcomeScreen extends StatefulWidget {
 

  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/kolekta.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 100, horizontal: 30),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'KOLEKTA',
                            style: logoFont(),
                          ),
                        ),
                        const SizedBox(height: 5,),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'GARBAGE COLLECTION MONITORING SYSTEM',
                            style: secondaryHeader(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(flex: 1,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  //alignment: Alignment.bottomCenter,
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> const LoginScreen()),);
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.07,
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 20,
                          ),
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(62, 135, 148, 1),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child: Text(
                              'LOGIN',
                              style: buttonText1(),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> const RegisterScreen()),);
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.07,
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 20,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child: Text(
                              'Register',
                              style: buttonText2(),
                            ),
                          ),
                        ),
                      ),
                    ],
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
