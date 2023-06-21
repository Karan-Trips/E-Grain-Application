import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:loginuicolors/Grain_type.dart';
import 'package:loginuicolors/Homepage.dart';
import 'package:loginuicolors/oldlogin.dart';
import 'package:loginuicolors/register.dart';

import 'dashboard.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyLoginState(),
    routes: {
      'register': (context) => MyRegister(),
      'login': (context) => MyLoginState(),
      'Dashboard': (context) => Dashboard(),
      'Grain': (context) => Grain_type(),
      'Rice': (context) => RicePage(),
      "Homepage": (context) => Homepage(),
    },
  ));
}
