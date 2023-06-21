import 'dart:convert';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:http/http.dart' as http;

class MyLoginState extends StatefulWidget {
  MyLoginState({Key? key}) : super(key: key);

  @override
  State<MyLoginState> createState() => _MyLoginStateState();
}

class _MyLoginStateState extends State<MyLoginState> {
  String? _id;
  final _email = TextEditingController();
  final _pass = TextEditingController();
  Future login() async {
    showDialog(
        context: context,
        builder: (context) {
          return Center(
              child: CircularProgressIndicator(
            backgroundColor: Colors.grey,
            color: Colors.red,
          ));
        });

    const String uri = "http://192.168.18.90/dope_api/login_data.php";
    var res = await http.post(Uri.parse(uri), body: {
      "email": _email.text,
      "password": _pass.text,
    });
    var data = jsonDecode((res.body));
    print(data);

    Navigator.of(context).pop();

    try {
      if (data["success"]) {
        _id = data["id"];
        print(_id);
        Fluttertoast.showToast(
            toastLength: Toast.LENGTH_LONG,
            fontSize: 15,
            backgroundColor: Color.fromARGB(255, 86, 236, 91),
            gravity: ToastGravity.BOTTOM,
            textColor: Colors.red,
            msg: "Login Successfully",
            timeInSecForIosWeb: 5);

        Navigator.pushNamed(context, 'Dashboard', arguments: {"id": _id});
      } else {
        Fluttertoast.showToast(
            msg: "!!KUch error hia check kar !!",
            toastLength: Toast.LENGTH_LONG,
            fontSize: 20,
            backgroundColor: Colors.green,
            textColor: Colors.red,
            timeInSecForIosWeb: 10);
      }
    } catch (e) {
      print(e);
    }
  }

  googleLogin() async {
    print("googleLogin method Called");
    GoogleSignIn _googleSignIn = GoogleSignIn();
    try {
      var reslut = await _googleSignIn.signIn();
      if (reslut == null) {
        return;
      }

      final userData = await reslut.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: userData.accessToken, idToken: userData.idToken);

      await FirebaseAuth.instance.signInWithCredential(credential);
      print("Result $reslut");
      print(reslut.displayName);
      print(reslut.email);
      print(reslut.photoUrl);
      // Navigator.pushNamed(context, 'Dashboard', arguments: {"id": _id});
    } catch (error) {
      print(error);
    }
  }

  Future<void> logout() async {
    await GoogleSignIn().disconnect();
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    var stack = Stack(
      children: [
        SingleChildScrollView(
          padding: EdgeInsets.only(left: 75, top: 80),
          child: Text(
            'Welcome\tBack ',
            style: TextStyle(color: Colors.red, fontSize: 35),
          ),
        ),
        SingleChildScrollView(
          child: Container(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 25, right: 35),
                  child: Column(
                    children: [
                      TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: _email,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                              fillColor: Colors.grey.shade100,
                              filled: true,
                              hintText: "Email",
                              prefixIcon: Icon(Icons.mail),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                          validator: (value) {
                            if (!GetUtils.isEmail(value!)) {
                              return "Invalid -Email";
                            } else {
                              return null;
                            }
                          }),
                      SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          style: TextStyle(),
                          obscureText: true,
                          controller: _pass,
                          decoration: InputDecoration(
                              fillColor: Colors.grey.shade100,
                              filled: true,
                              hintText: "Password",
                              prefixIcon: Icon(Icons.lock),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                          validator: (value) {
                            if (!GetUtils.isLengthGreaterOrEqual(value, 6)) {
                              return "Min 6 - Chars";
                            } else {
                              return null;
                            }
                          }),
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Sign in',
                            style: TextStyle(
                                color: Colors.cyan,
                                fontSize: 27,
                                fontWeight: FontWeight.w700),
                          ),
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Color.fromARGB(255, 14, 246, 72),
                            child: IconButton(
                                color: Colors.white,
                                onPressed: () {
                                  login();
                                },
                                icon: Icon(
                                  Icons.arrow_forward_rounded,
                                )),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, 'register');
                            },
                            child: Text(
                              'Sign Up',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Colors.cyan,
                                  fontSize: 22),
                            ),
                            style: ButtonStyle(),
                          ),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                'Forgot Password',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Colors.cyan,
                                  fontSize: 22,
                                ),
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 100,
                  alignment: Alignment.bottomCenter,
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 32,
                        backgroundColor: Colors.blue[700],
                        child: IconButton(
                            alignment: Alignment.center,
                            // color: Colors.white,
                            onPressed: () {
                              print("ok");
                            },
                            icon: Icon(
                              Icons.facebook,
                            )),
                      ),
                      InkWell(
                          onTap: () {
                            googleLogin();
                          },
                          child: CircleAvatar(
                              radius: 32,
                              backgroundColor: Colors.white,
                              child: Image.network(
                                  'http://pngimg.com/uploads/google/google_PNG19635.png',
                                  fit: BoxFit.cover))),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  alignment: Alignment.center,
                  child: TextButton.icon(
                    onPressed: (() {
                      //  Website ADmin login
                    }),
                    icon: const Icon(Icons.login),
                    label: Container(
                      alignment: Alignment.center,
                      width: 150,
                      height: 35,
                      child: const Text(
                        'Broker-Login',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );

    return WillPopScope(
        onWillPop: () async => false,
        child: Container(
          // color: Gradient.radial(Colors.white, 100, Colors.orange),
          decoration: BoxDecoration(
            gradient: RadialGradient(
                radius: 1.15, colors: [Colors.white, Colors.deepOrangeAccent]),
            // image: DecorationImage(
            //     image: AssetImage('assets/back.jpg'), fit: BoxFit.cover),
          ),
          child: Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: Colors.transparent,
            body: stack,
          ),
        ));
  }
}
