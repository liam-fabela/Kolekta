import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

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
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final formKey = GlobalKey<FormState>();
   Timer? _timer;
  static const url = 'http://192.168.43.215/db_php/login.php';


  @override
  void initState() {
    super.initState();
    // Initialize the package
    // ignore: unnecessary_new
    EasyLoading.addStatusCallback((status) {
      print('EasyLoading Status $status');
      if (status == EasyLoadingStatus.dismiss) {
        _timer?.cancel();
      }
    }); 
  }

  Future<void> _loginUser() async {
    try {
      if(formKey.currentState!.validate()) {
         _timer?.cancel();
                      await EasyLoading.show(
                        status: 'loading...',
                        maskType: EasyLoadingMaskType.black,
                      );
       // ignore: prefer_collection_literals
       var map = Map<String, dynamic>();
        map['email'] = _email.text; 
        map['password'] = _password.text;
         http.Response response = await http.post(Uri.parse(url),
            body: jsonEncode(map),
            headers: {'Content-type': 'application/json'});
        print('Login Response: ${response.body}');
        if (200 == response.statusCode) {
          print(response.body);
          var data = json.decode(response.body);
          

        }
      }
    }catch(e) {

    }
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
                        key: formKey,
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
                                   validator: (String? val) {
                                           if (val!.isEmpty) {
                                        return "Please enter email";
                                            }
                                           if(RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                                      .hasMatch(val) ==
                                                  false) {
                                                     return 'Please Enter a Valid Email Address';
                                          }
                                        return null;                
                                         },
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
                                  controller: _email,
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
                                         validator:(String? val) {
                                           if (val!.isEmpty) {
                                        return "Please enter password";
                                            }
      
                                        return null;                
                                         },
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
                                         controller: _password,
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
