import 'dart:convert';
import 'package:http/http.dart' as http;


class Services {

static const url = 'http://192.168.43.215/db_php/db_actions.php';

static const addResidentAction = 'ADD_RESIDENT';
static const addResidentCollector = "ADD_COLLECTOR";

static Future<void> addResident(String lname, String fname, String address, String email, String number, String password) async {
  try{
     // ignore: prefer_collection_literals
     var map = Map<String, dynamic>();
      map['action'] =  addResidentAction;
      map['lname'] = lname;
      map['fname'] = fname;
      map['address'] = address;
      map['email'] = email;
      map['number'] = number;
      map['password'] = password;

      http.Response response = await http.post(Uri.parse(url), body:jsonEncode(map), headers: {'Content-type': 'application/json'});
      print('Add resident Response: ${response.body}');
       if (200 == response.statusCode) {
        print(response.body);
      } else {
       print(Future.error("error"));
    }
  }catch(e){
    print(e);
    rethrow;

  }
}
 

}