import 'package:be_project/constants.dart';
import 'package:be_project/login.dart';
import 'package:be_project/ngos.dart';
import 'package:be_project/profile.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:be_project/register.dart';
import 'package:be_project/home.dart';
import 'package:be_project/addproduct.dart';
import 'package:be_project/API.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'dart:async';
import 'package:be_project/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        home: Splashscreen(),
        routes: {
          MyHomePage.route: (context) => MyHomePage(),
          Register.route: (context) => Register(),
          Home.route: (context) => Home(),
          Addproduct.route: (context) => Addproduct(),
          Ngos.route: (context) => Ngos(),
          Profile.route: (context) => Profile(),
        }
    );
  }
}
