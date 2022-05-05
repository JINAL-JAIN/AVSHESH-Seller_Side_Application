import 'dart:ffi';

import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:flutter/material.dart';

List<FFNavigationBarItem> items = [
  FFNavigationBarItem(
    iconData: Icons.home,
    label: 'Home',
    selectedBackgroundColor: Colors.orange[700],
  ),
  FFNavigationBarItem(
    iconData: Icons.add,
    label: 'Add Product',
    selectedBackgroundColor: Colors.orange[700],
  ),
  FFNavigationBarItem(
    iconData: Icons.group_sharp,
    label: 'Assistance',
    selectedBackgroundColor: Colors.orange[700],
  ),
  FFNavigationBarItem(
    iconData: Icons.person,
    label: 'Profile',
    selectedBackgroundColor: Colors.orange[700],
  ),
];

List Productlist;
List NGOlist;
List Dealerlist;
String Farmer_id;
String Phone_no;
String Name;
String Email;
String Password;
String New_Phone_no;
String New_Name;
String New_Email;
String Location;
String Address;
String Type;
String Quantity;
String Price;
String Prod_Address;
String Edit_Quantity;
String Edit_Price;
int Edit_Product_id;
int Product_id;
String ValidCredential;
String ngrok="https://9f7d-2409-4040-e8b-d997-c544-42ca-9bbd-9441.ngrok.io";
