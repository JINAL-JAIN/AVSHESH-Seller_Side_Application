import 'package:be_project/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:be_project/profile.dart';
import 'package:be_project/API.dart';

class UpdateProfile extends StatefulWidget {

  @override
  _UpdateProfileState createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {

  APIservice apIservice = APIservice();

  sendEditProfile() async {
    await apIservice.editProfile();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Center(
          child: Text(
            'DETAILS',
            style: TextStyle(
              fontWeight: FontWeight.w500, color: Colors.orange[700],),
          ),
        ),
        content: setupAlertDialoadContainer());
  }
  Widget setupAlertDialoadContainer() {
    return Container(
        height: 240.0, // Change as per your requirement
        width: 300.0, // Change as per your requirement
        child: ListView(
            children: [
        TextFormField(
        controller: TextEditingController(text:Name),
    onChanged: (text) => {Name = text},
    decoration: InputDecoration(
    labelText: 'NAME',
    labelStyle: TextStyle(
    fontWeight: FontWeight.w500, color: Colors.orange[700],)
    ),
    keyboardType:TextInputType.number,
    ),

              TextFormField(
                controller: TextEditingController(text:Phone_no),
                onChanged: (text) => {Phone_no = text},
                decoration: InputDecoration(
                    labelText: 'PHONE NUMBER',
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w500, color: Colors.orange[700],)
                ),
                keyboardType:TextInputType.number,
              ),

              TextFormField(
                controller: TextEditingController(text:Email),
                onChanged: (text) => {Email = text},
                decoration: InputDecoration(
                    labelText: 'EMAIL ID',
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w500, color: Colors.orange[700],)
                ),
                keyboardType:TextInputType.number,
              ),



    SizedBox(
    height: 10,
    ),
    Center(
    child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    ButtonTheme(
    minWidth: 100.0,
    height: 50.0,
    child: RaisedButton(
    color: Colors.orange[700],
    child: Text(
    'SAVE',
    style: TextStyle(color: Colors.white),
    ),

    onPressed: () {

    sendEditProfile();
    Navigator.pushNamed(context, Profile.route);

    },
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(30.0),
    side: BorderSide(
    color: Colors.orange[700],
    width: 5.0,
    )),
    ),
    ),

    ButtonTheme(
    minWidth: 100.0,
    height: 50.0,
    child: RaisedButton(
    color: Colors.orange[700],
    child: Text(
    'BACK',
    style: TextStyle(color: Colors.white),
    ),
    onPressed: () {
    Navigator.pushNamed(context, Profile.route);
    },
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(30.0),
    side: BorderSide(
    color: Colors.orange[700],
    width: 5.0,
    )),
    ),
    ),




    ],
    ),
    ),
  ],
    ),
        );


}}
