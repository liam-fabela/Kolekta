import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import '../styles/style.dart';
import 'resident_home_screen.dart';
class LoginScreen extends StatefulWidget {
  

  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var showPass = false;
  var obscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
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
                ),
              ),
              // ignore: avoid_unnecessary_containers
              Positioned(
                top: MediaQuery.of(context).size.height * 0.3,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    child: Text(
                      "KOLEKTA | Login",
                      style: mediumText(),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.45,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Form(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: Column(
                            children: [
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.07,
                                width: MediaQuery.of(context).size.width * 0.86,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: const Color.fromRGBO(
                                        163, 210, 217, 0.4),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: BorderSide.none,
                                    ),
                                    hintText: "Email",
                                    hintStyle: const TextStyle(
                                      color: Colors.black54,
                                    ),
                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                ),
                              ),
                              const SizedBox(height: 20),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.07,
                                width: MediaQuery.of(context).size.width * 0.86,
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromRGBO(163, 210, 217, 0.4),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.07,
                                      width: MediaQuery.of(context).size.width *
                                          0.6,
                                      child: TextFormField(
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                          ),
                                          hintText: "Password",
                                          hintStyle: TextStyle(
                                            color: Colors.black54,
                                          ),
                                        ),
                                        obscureText: obscure,
                                        keyboardType:
                                            TextInputType.visiblePassword,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          showPass = !showPass;
                                          obscure = !obscure;
                                        });
                                      },
                                      child: Container(
                                        height: 40,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.2,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10.0),
                                        child: showPass
                                            ? const Icon(
                                                Icons.remove_red_eye,
                                                color: Color.fromRGBO(
                                                    42, 173, 151, 1),
                                              )
                                            : const Icon(Icons.remove_red_eye),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 30),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamedAndRemoveUntil(context, '/resident_home', (_) => false);
                                },
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.07,
                                  width:
                                      MediaQuery.of(context).size.width * 0.87,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 20,
                                  ),
                                  decoration: BoxDecoration(
                                    color:
                                        const Color.fromRGBO(62, 135, 148, 1),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Login',
                                      style: buttonText1(),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  child: Text(
                                    "Forgot Password?",
                                    style: normalText(),
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
              Positioned(
                top: MediaQuery.of(context).size.height * 0.19,
                left: 20,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width * 0.2,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image:
                          AssetImage("assets/images/garbage-truck-shadow.png"),
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
