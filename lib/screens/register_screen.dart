import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:email_auth/email_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


import '../styles/style.dart';
import 'auth_screen.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = '/resident_home';

  const RegisterScreen({Key? key}) : super(key: key);
  

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  int? selectedRadio = 0;
  final TextEditingController _firstname = TextEditingController();
  final TextEditingController _lastname = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _mobile = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final formKey = GlobalKey<FormState>();

  var showPass = false;
  var obscure = true;
  EmailAuth? emailAuth;
  Timer? _timer;
  static const url = 'http://192.168.43.215/db_php/duplicate_email.php';

   @override
  void initState() {
    super.initState();
    // Initialize the package
    // ignore: unnecessary_new
    emailAuth = new EmailAuth(
      sessionName: "KOLEKTA Mobile Application",
    );
    EasyLoading.addStatusCallback((status) {
      print('EasyLoading Status $status');
      if (status == EasyLoadingStatus.dismiss) {
        _timer?.cancel();
      }
    });
    
  }

  

    Future<bool> sendOtp(String mail) async {
    bool result = await emailAuth!.sendOtp(
        recipientMail: mail, otpLength: 5);
   return result;
  }


  setSelectedRadio(int? val) {
    setState(() {
      selectedRadio = val;
    });
    
  }

  residentSignUp(BuildContext context) async{
    try {
      if (selectedRadio!=0){
       if(formKey.currentState!.validate()){
         _timer?.cancel();
                      await EasyLoading.show(
                        status: 'loading...',
                        maskType: EasyLoadingMaskType.black,
                      );
        // ignore: prefer_collection_literals
        var map = Map<String, dynamic>();
        map['email'] = _email.text;
        http.Response response = await http.post(Uri.parse(url), body:jsonEncode(map), headers: {'Content-type': 'application/json'});
        print('Add resident Response: ${response.body}');
       if (200 == response.statusCode) {
        print(response.body);
        var data = json.decode(response.body);
        if(data["error"]) {
          EasyLoading.dismiss();
          if (data["message"] == "Email address already in use.") {
           print("NARA KO");
              Fluttertoast.showToast(
                  msg: data["message"],
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.grey,
                  textColor: Colors.white,
                  fontSize: 14);
         }
        }else{
           sendOtp(_email.text).then((response) {
           if(response) {
             EasyLoading.dismiss();
              Navigator.of(context).pushNamed(
              AuthenticationScreen.routeName,
              arguments: {
              'fname': _firstname.text,
              'lname': _lastname.text,
              'address': _address.text,
              'email' : _email.text,
              'mobile': _mobile.text,
              'password': _password.text,
              'usertype': selectedRadio.toString()
      }
    );
           }else{
             EasyLoading.dismiss();
             print("Something is wrong");
              Fluttertoast.showToast(
                  msg: "Something went wrong. please try again",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.grey,
                  textColor: Colors.white,
                  fontSize: 14);
           }
         });
           
         }
      } else {
       print(Future.error("error"));
    }    
       }
     
    }else{
      Fluttertoast.showToast(
                  msg: "Please select usertype",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.grey,
                  textColor: Colors.white,
                  fontSize: 14);
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
                          key: formKey,
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
                                         validator: (String? val) {
                                           if (val!.isEmpty) {
                                        return "Please enter first name";
                                            }
      
                                        return null;                
                                         },
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
                                           errorStyle: const TextStyle(height: 0),
                                        ),
                                        controller: _firstname,
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                    SizedBox(
                                      height: MediaQuery.of(context).size.height *
                                          0.07,
                                      width: MediaQuery.of(context).size.width *
                                          0.43,
                                      child: TextFormField(
                                        validator: (String? val) {
                                           if (val!.isEmpty) {
                                        return "Please enter last name";
                                            }
      
                                        return null;                
                                         },
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
                                           errorStyle: const TextStyle(height: 0),
                                        ),
                                        controller: _lastname,
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
                                    validator: (String? val) {
                                           if (val!.isEmpty) {
                                        return "Please enter address";
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
                                      hintText: "Address",
                                      hintStyle: const TextStyle(
                                        color: Colors.black54,
                                      ),
                                       errorStyle: const TextStyle(height: 0),
                                    ),
                                     controller: _address,
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
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            borderSide: BorderSide.none,
                                          ),
                                          hintText: "Email",
                                          hintStyle: const TextStyle(
                                            color: Colors.black54,
                                          ),
                                           errorStyle: const TextStyle(height: 0),
                                        ),
                                        keyboardType: TextInputType.emailAddress,
                                         controller: _email,
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                    SizedBox(
                                      height: MediaQuery.of(context).size.height *
                                          0.07,
                                      width: MediaQuery.of(context).size.width *
                                          0.43,
                                      child: TextFormField(
                                        validator: (String? val) {
                                           if (val!.isEmpty) {
                                        return "Please enter number";
                                            }
                                          if(val.length < 11) {
                                            return "Please enter a valid number";
                                          }
      
                                        return null;                
                                         },
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
                                           errorStyle: const TextStyle(height: 0),
                                        ),
                                        keyboardType: TextInputType.phone,
                                         controller: _mobile,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
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
                                          if(val.length < 9) {
                                            return "Minimum of 8 characters!";
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
                                             errorStyle: TextStyle(height: 0),
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
                                            print(value);
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
                                            print(value);
                                            setSelectedRadio(value);
                                          },
                                    ),
                                       ],
                                     ),
                                ],),
                                const SizedBox(height: 20),
                                GestureDetector(
                                  onTap: () {
                                     residentSignUp(context);
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
