// import 'dart:html';

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

class MyRegister extends StatefulWidget {
  const MyRegister({Key? key}) : super(key: key);

  @override
  _MyRegisterState createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {
  final email = TextEditingController();
  final password = TextEditingController();
  final fullname = TextEditingController();
  final _confirmPass = TextEditingController();
  // final _confirmPass = TextEditingController();
  // Future<void> insertrecord() async {
  //   if (email.text != "" || password.text != "" || fullname.text != "") {
  //     try {
  //       String uri = "https://grain-e.000webhostapp.com/insert_record.php";
  //       var res = await http.post(Uri.parse(uri), body: {
  //         "fullname": fullname.text,
  //         "email": email.text,
  //         "password": password.text,
  //       });

  //       var response = jsonDecode(res.body);

  //       if (response["success"] == true) {
  //         print("Record inserted");
  //         Navigator.pushNamed(context, 'login');
  //       } else {
  //         print("Code check kar be ");
  //       }
  //     } catch (e) {
  //       print(e);
  //     }
  //   } else {
  //     print("pura bhar na");
  //   }
  // }
  Future<void> insertRecord() async {
    if (fullname.text.isNotEmpty &&
        email.text.isNotEmpty &&
        password.text.isNotEmpty) {
      try {
        final uri = "http://192.168.18.90/dope_api/insert_record.php";
        final res = await http.post(Uri.parse(uri), body: {
          "fullname": fullname.text,
          "email": email.text,
          "password": password.text,
        });

        final response = jsonDecode(res.body);
        if (response["success"] ?? false) {
          print("Record inserted");
          Navigator.pushNamed(context, 'login');
        } else {
          displayErrorMessage(context, "Error inserting record");
        }
      } catch (e) {
        displayErrorMessage(context, "Error inserting record");
      }
    } else {
      displayErrorMessage(context, "Please fill in all fields.");
    }
  }

  void displayErrorMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: Duration(seconds: 3),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => true,
        child: Container(
          // height: 250,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/reg.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),

            // INSERT INTO `user_data` (fullname, email, password) VALUES ('$fullname', '$email', '$password')
            body: Stack(children: [
              SingleChildScrollView(
                padding: EdgeInsets.only(left: 80),
                child: Text(
                  'Create\tAccount',
                  style: TextStyle(
                    color: Colors.red[700],
                    fontSize: 33,
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Center(
                  child: Container(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        Container(
                          margin: EdgeInsets.only(left: 35, right: 35),
                          child: Column(
                            children: [
                              TextFormField(
                                controller: fullname,
                                style: TextStyle(color: Colors.black87),
                                decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide(
                                        color: Colors.white,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide(
                                        color: Colors.red,
                                      ),
                                    ),
                                    hintText: "Name",
                                    hintStyle: TextStyle(color: Colors.black),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    )),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                  autovalidateMode: AutovalidateMode.always,
                                  controller: email,
                                  style: TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: BorderSide(
                                          color: Colors.red,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: BorderSide(
                                          color: Colors.red,
                                        ),
                                      ),
                                      hintText: "Email",
                                      hintStyle: TextStyle(color: Colors.black),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      )),
                                  validator: (value) {
                                    if (!GetUtils.isEmail(value!)) {
                                      return "Invalid -Email";
                                    } else {
                                      return null;
                                    }
                                  }),
                              SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                  autovalidateMode: AutovalidateMode.always,
                                  obscureText: true,
                                  controller: password,
                                  decoration: InputDecoration(
                                      fillColor: Colors.grey.shade100,
                                      filled: true,
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: BorderSide(
                                          color: Colors.red,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: BorderSide(
                                          color: Colors.white,
                                        ),
                                      ),
                                      hintText: "Password",
                                      hintStyle: TextStyle(color: Colors.black),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      )),
                                  validator: (value) {
                                    if (!GetUtils.isLengthGreaterOrEqual(
                                        value, 6)) {
                                      return "Min 6- Chars";
                                    } else {
                                      return null;
                                    }
                                  }),
                              SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                controller: _confirmPass,
                                validator: (val) {
                                  if (val!.isEmpty) return 'Empty';
                                  if (val != password.text) return 'Not Match';
                                  return null;
                                },
                                obscureText: true,
                                decoration: InputDecoration(
                                    fillColor: Colors.grey.shade100,
                                    filled: true,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide(
                                        color: Colors.red,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide(
                                        color: Colors.white,
                                      ),
                                    ),
                                    hintText: "Confirm-Password",
                                    hintStyle: TextStyle(color: Colors.black),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    )),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Sign Up',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.redAccent,
                                        fontSize: 29,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.red,
                                    child: IconButton(
                                        color: Colors.white,
                                        onPressed: insertRecord,
                                        icon: Icon(
                                          Icons.arrow_forward_outlined,
                                        )),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 28,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pushNamed(context, 'login');
                                    },
                                    child: Text(
                                      'Sign In',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          color: Colors.red,
                                          fontSize: 21),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ));
  }
}
