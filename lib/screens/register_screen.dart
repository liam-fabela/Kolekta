import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import '../styles/style.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = '/resident_home';
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  int? selectedRadio = 0;
  

  setSelectedRadio(int? val) {
    setState(() {
      selectedRadio = val;
    });
    
  }

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
              Positioned(
                top: MediaQuery.of(context).size.height * 0.3,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    child: Text(
                      "KOLEKTA | Register",
                      style: mediumText(),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.38,
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
                              Row(
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.07,
                                    width: MediaQuery.of(context).size.width *
                                        0.43,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: const Color.fromRGBO(
                                            163, 210, 217, 0.4),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          borderSide: BorderSide.none,
                                        ),
                                        hintText: "First Name",
                                        hintStyle: const TextStyle(
                                          color: Colors.black54,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.07,
                                    width: MediaQuery.of(context).size.width *
                                        0.43,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: const Color.fromRGBO(
                                            163, 210, 217, 0.4),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          borderSide: BorderSide.none,
                                        ),
                                        hintText: "Last Name",
                                        hintStyle: const TextStyle(
                                          color: Colors.black54,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.07,
                                width: MediaQuery.of(context).size.width * 0.87,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: const Color.fromRGBO(
                                        163, 210, 217, 0.4),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: BorderSide.none,
                                    ),
                                    hintText: "Address",
                                    hintStyle: const TextStyle(
                                      color: Colors.black54,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.07,
                                    width: MediaQuery.of(context).size.width *
                                        0.43,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: const Color.fromRGBO(
                                            163, 210, 217, 0.4),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
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
                                  const SizedBox(width: 5),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.07,
                                    width: MediaQuery.of(context).size.width *
                                        0.43,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: const Color.fromRGBO(
                                            163, 210, 217, 0.4),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          borderSide: BorderSide.none,
                                        ),
                                        hintText: "Mobile Number",
                                        hintStyle: const TextStyle(
                                          color: Colors.black54,
                                        ),
                                      ),
                                      keyboardType: TextInputType.phone,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.07,
                                    width: MediaQuery.of(context).size.width *
                                        0.43,
                                    decoration: BoxDecoration(
                                      color: const Color.fromRGBO(
                                          163, 210, 217, 0.4),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: SizedBox(
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
                                        obscureText: true,
                                        keyboardType:
                                            TextInputType.visiblePassword,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.07,
                                    width: MediaQuery.of(context).size.width *
                                        0.43,
                                    decoration: BoxDecoration(
                                      color: const Color.fromRGBO(
                                          163, 210, 217, 0.4),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: SizedBox(
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
                                          hintText: "Confirm Password",
                                          hintStyle: TextStyle(
                                            color: Colors.black54,
                                          ),
                                        ),
                                        obscureText: true,
                                        keyboardType:
                                            TextInputType.visiblePassword,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("I am a :", style: normalText()),
                                  const SizedBox(width: 5,),
                                  Row(
                                    children: [
                                      Text("Resident", style: normalText()),
                                      Radio(
                                        value: 1,
                                        groupValue: selectedRadio,
                                        activeColor: const Color.fromRGBO(62, 135, 148, 1), 
                                        onChanged: (int? value) {  
                                          // ignore: avoid_print
                                          print("Radio val");
                                          setSelectedRadio(value);
                                        },
                                      ),
                                    ],
                                  ),
                                   Row(
                                     children: [
                                       Text("Garbage Collector", style: normalText()),
                                       Radio(
                                        value: 2,
                                        groupValue: selectedRadio,
                                        activeColor: const Color.fromRGBO(62, 135, 148, 1), 
                                        onChanged: (int? value) {  
                                          // ignore: avoid_print
                                          print("Radio val");
                                          setSelectedRadio(value);
                                        },
                                  ),
                                     ],
                                   ),
                              ],),
                              const SizedBox(height: 20),
                              GestureDetector(
                                onTap: () {},
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
                                      'REGISTER',
                                      style: buttonText1(),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
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
                right: 20,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: MediaQuery.of(context).size.width * 0.099,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/trash-bin-shadow.png"),
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
