import 'package:flutter/material.dart';
import 'package:email_auth/email_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'dart:async';

import '../styles/style.dart';
import '../services/service.dart';

class AuthenticationScreen extends StatefulWidget {
  static const routeName = '/authentication_screen';
  const AuthenticationScreen({Key? key}) : super(key: key);

  @override
  _AuthenticationScreenState createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  String? fname;
  String? lname;
  String? address;
  String? email;
  String? mobile;
  String? password;
  String? usertype;
  final TextEditingController _code = TextEditingController();
  EmailAuth? emailAuth;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    // Initialize the package
    // ignore: unnecessary_new
    emailAuth = new EmailAuth(
      sessionName: "KOLEKTA Mobile Application",
    );
  }

  @override
  void didChangeDependencies() {
    final val =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    fname = val['fname'];
    lname = val['lname'];
    address = val['address'];
    email = val['email'];
    mobile = val['mobile'];
    password = val['password'];
    usertype = val['usertype'];
    super.didChangeDependencies();
  }

  bool verifyOtp() {
    bool result = emailAuth!.validateOtp(
      recipientMail: email.toString(),
      userOtp: _code.text,
    );
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Email Authentication",
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Raleway',
            fontSize: 17,
          ),
        ),
        backgroundColor: const Color.fromRGBO(62, 135, 148, 1),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.2,
              horizontal: 30),
          child: Form(
              child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Please Enter Code",
                    hintStyle: TextStyle(
                      color: Colors.black54,
                    ),
                  ),
                  keyboardType: TextInputType.phone,
                  controller: _code,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'A code was sent to your email, please enter the code sent.',
                style: TextStyle(
                  color: Color.fromRGBO(62, 135, 148, 1),
                  fontSize: 14,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Did not get code?',
                    style: TextStyle(
                      color: Color.fromRGBO(62, 135, 148, 1),
                      fontSize: 14,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () async {
                       _timer?.cancel();
                      await EasyLoading.show(
                        status: 'Sending...',
                        maskType: EasyLoadingMaskType.black,
                      );
                      bool result = await emailAuth!.sendOtp(
                          recipientMail: email.toString(), otpLength: 5);
                      if (result) {
                         EasyLoading.dismiss();
                        Fluttertoast.showToast(
                            msg: "Code sent",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.grey,
                            textColor: Colors.white,
                            fontSize: 14);
                      } else {
                        Fluttertoast.showToast(
                            msg: "Something went wrong, please try again",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.grey,
                            textColor: Colors.white,
                            fontSize: 14);
                      }
                    },
                    child: Container(
                      child: const Text(
                        'Resend Code',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Color.fromRGBO(62, 135, 148, 1),
                          fontSize: 14,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              GestureDetector(
                onTap: () async {
                  try {
                    print("gisulod dani sa TRY");
                     _timer?.cancel();
                      await EasyLoading.show(
                        status: 'Signing up...',
                        maskType: EasyLoadingMaskType.black,
                      );
                    bool res = verifyOtp();
                    if (res) {
                      if (usertype == '1') {
                        print("gisulod dani sa usertype");
                        await Services.addResident(
                                lname.toString(),
                                fname.toString(),
                                address.toString(),
                                email.toString(),
                                mobile.toString(),
                                password.toString())
                            .then((value) {
                              print("gisulod dne sa value");
                              EasyLoading.dismiss();
                               Navigator.pushNamedAndRemoveUntil(
                               context, '/resident_home', (_) => false);
                            });
                      }
                    } else {
                      Fluttertoast.showToast(
                          msg: "Wrong code, please try again!",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.grey,
                          textColor: Colors.white,
                          fontSize: 14);
                    }
                  } catch (e) {
                    Fluttertoast.showToast(
                          msg: "Connection error, please try again!",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.grey,
                          textColor: Colors.white,
                          fontSize: 14);
                  }
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.width * 0.87,
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
                      'Submit',
                      style: buttonText1(),
                    ),
                  ),
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
