import 'package:flutter/material.dart';
import 'package:be_project/home.dart';
import 'package:be_project/addproduct.dart';
import 'constants.dart';
import 'API.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:be_project/profile.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:be_project/login.dart';



class Register extends StatefulWidget {
  static String route = 'register';

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  APIservice apIservice = APIservice();

  sendRegister() async {
    await apIservice.registerFarmer();
  }

  final phonenoController = new TextEditingController();
  final nameController = new TextEditingController();
  final emailController = new TextEditingController();
  final passwordController = new TextEditingController();
  final locationController = new TextEditingController();



  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  Future<void> GetAddressFromLatLong(Position position)async {
    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placemarks[0];
    Address = '${place.street}, ${place.locality}, ${place.country}, ${place.postalCode}';
    //Address = '${place.postalCode}, ${place.country}';
    print(Address);
    return Address;

  }

  bool validateMobile(String value) {
    // Indian Mobile number are of 10 digit only
    if (value.length != 10)
      return false;
    else
      return true;
  }

  _onBasicAlertPressed(context, String title) {
    Alert(
      style: AlertStyle(
        isButtonVisible: false,
        isCloseButton: true,
        backgroundColor: Colors.white,
      ),
      context: context,
      title: title,
      desc: "Try Again",
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.orange[700],
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Center(
                      child: Text(
                        "REGISTER",
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                    Center(
                      child: Container(
                        width: 380,
                        padding: EdgeInsets.fromLTRB(20.0, 0.0, 5.0, 3.0),
                        child: TextFormField(
                          controller: nameController,
                          // validator: (value) {
                          //   if (value.isEmpty) {
                          //     return 'Please enter your Name';
                          //   }
                          //   return null;
                          // },
                          decoration: InputDecoration(
                              hintText: "Enter Your Name",
                              icon: Icon(Icons.person)),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        width: 380,
                        padding: EdgeInsets.fromLTRB(20.0, 0.0, 5.0, 3.0),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: phonenoController,
                          // validator: (value) {
                          //   if (value.length!=10) {
                          //     return 'Please enter valid Mobile Number';
                          //   }
                          //   return null;
                          // },
                          decoration: InputDecoration(
                              hintText: "Enter Mobile Number",
                              icon: Icon(Icons.mobile_friendly)),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        width: 380,
                        padding: EdgeInsets.fromLTRB(20.0, 0.0, 5.0, 3.0),
                        child: TextFormField(
                          controller: emailController,
                          // validator: (value) {
                          //   if (value.isEmpty) {
                          //     return 'Please enter your E-mail id';
                          //   }
                          //   return null;
                          // },
                          decoration: InputDecoration(
                              hintText: "Enter Your E-mail id",
                              icon: Icon(Icons.email_outlined)),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        padding: EdgeInsets.fromLTRB(20.0, 0.0, 5.0, 3.0),
                        width: 380,
                        child: TextFormField(
                          controller: passwordController,
                          obscureText: true,
                          // validator: (value) {
                          //   if (value.isEmpty) {
                          //     return 'Please enter your password';
                          //   }
                          //   return null;
                          // },
                          decoration: InputDecoration(
                              hintText: "Enter Password",
                              icon: Icon(Icons.lock_outlined)),
                        ),
                      ),
                    ),
                    Center(
                      child: Row(
                        children: [
                          Container(
                                  padding: EdgeInsets.fromLTRB(20.0, 0.0, 5.0, 5.0),
                                  width: 225,
                                  child: TextFormField(
                                    controller: locationController,
                                    decoration: InputDecoration(
                                        hintText: "Location",
                                        icon: Icon(Icons.location_on_outlined)),
                                  ),
                                ),

                          Container(

                            child: ButtonTheme(
                              minWidth: 100.0,
                              height: 50.0,
                              child: RaisedButton(
                                color: Colors.orange[700],
                                child: Text(
                                  'Current location',
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () async{
                                 setState(() async{
                                   Position position = await _determinePosition();
                                   //print(position.latitude);
                                   //print(position.longitude);
                                   GetAddressFromLatLong(position);
                                   locationController.text = Address;
                                 });



                                },
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    side: BorderSide(
                                      color: Colors.orange[700],
                                      width: 5.0,
                                    )),
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                    Center(
                      child: Container(
                        child: ButtonTheme(
                          minWidth: 100.0,
                          height: 50.0,
                          child: RaisedButton(
                            color: Colors.orange[700],
                            child: Text(
                              'REGISTER',
                              style: TextStyle(color: Colors.white),
                            ),

                            onPressed: () {
                              bool mobileValid =
                              validateMobile(phonenoController.text);
                              if (mobileValid == false) {
                                print(mobileValid);
                                _onBasicAlertPressed(context,
                                    'Please Enter a valid Mobile Number');
                              }
                              bool emailValid = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(emailController.text);
                              if (emailValid == false) {
                                _onBasicAlertPressed(
                                    context, 'Please Enter a valid Email');
                              }
                              else if (nameController.text == ""){
                                _onBasicAlertPressed(
                                    context, 'Please Enter Username');
                              }
                              else if (passwordController.text == ""){
                                _onBasicAlertPressed(
                                    context, 'Please Enter Password');
                              }
                              else if (locationController.text == ""){
                                _onBasicAlertPressed(
                                    context, 'Please Enter Location');
                              }
                              else {
                                Phone_no = phonenoController.text;
                                Name = nameController.text;
                                Email = emailController.text;
                                Password = passwordController.text;

                                sendRegister();
                                Navigator.pushNamed(context, MyHomePage.route);
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(builder: (context) => MyHomePage()),
                                // );
                              }},
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                side: BorderSide(
                                  color: Colors.orange[700],
                                  width: 5.0,
                                )),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50)),
                ),
                height: MediaQuery.of(context).size.height * 0.68,
              ),
            ),
          ),
        ],
      ),
    );
  }
}