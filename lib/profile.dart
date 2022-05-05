import 'dart:io';
import 'package:be_project/login.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:be_project/info_card.dart';
import 'package:be_project/register.dart';
import 'package:be_project/home.dart';
import 'package:be_project/addproduct.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:be_project/constants.dart';
import 'package:be_project/ngos.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './utility/shared_prefs.dart';
import 'package:be_project/update_profile.dart';




class Profile extends StatefulWidget {
  static String route = 'profile';
  @override
  _ProfileState createState() => _ProfileState();

}

class _ProfileState extends State<Profile> {
  int selectedIndex = 3;
  Image image;


  // _imgFromCamera() async {
  //   File image = await ImagePicker.pickImage(
  //       source: ImageSource.camera, imageQuality: 50
  //   );
  //
  //   setState(() {
  //     _image = image;
  //   });
  //
  //
  // }


  _imgFromGallery() async {
    File _image = await  ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50
    );

    if (_image != null) {
      setState(() {
        image = Image.file(_image);
      });
      ImageSharedPrefs.saveImageToPrefs(
          ImageSharedPrefs.base64String(_image.readAsBytesSync()));
    } else {
      print('Error picking image!');
    }

  }
  loadImageFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final imageKeyValue = prefs.getString(IMAGE_KEY);
    if (imageKeyValue != null) {
      final imageString = await ImageSharedPrefs.loadImageFromPrefs();
      setState(() {
        image = ImageSharedPrefs.imageFrom64BaseString(imageString);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    loadImageFromPrefs();
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Expanded(
              flex: 1,
              child: Container(
                child: new Wrap(
                  children: <Widget>[
                    new ListTile(
                        leading: new Icon(Icons.photo_library),
                        title: new Text('Photo Library'),
                        onTap: () {
                          _imgFromGallery();
                          Navigator.of(context).pop();
                        }),
                    new ListTile(
                      leading: new Icon(Icons.photo_camera),
                      title: new Text('Camera'),
                      onTap: () {
                        // _imgFromCamera();
                        // Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        }
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange[700],
          title: Text("AVSHESH"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 22,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    _showPicker(context);
                  },
                  child: CircleAvatar(
                    radius: 55,
                    backgroundColor: Colors.orange,
                    child: image != null
                        ? ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child:
                      image,

                    )
                        : Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(50)),
                      width: 100,
                      height: 100,
                      child: Icon(
                        Icons.camera_alt,
                        color: Colors.grey[800],
                      ),
                    ),
                  ),
                ),
              ),
              InfoCard(
                text: Name,
                icon: Icons.perm_identity,
              ),
              InfoCard(
                text: Phone_no,
                icon: Icons.phone,
              ),
              InfoCard(
                text: Email,
                icon: Icons.email,
              ),
              InfoCard(
                text: Address,
                icon: Icons.location_city,
              ),
              Center(
                child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 50.0),
                        child: ButtonTheme(
                          minWidth: 120.0,
                          height: 40.0,
                          child: RaisedButton(
                            color: Colors.orange[700],
                            child: Text(
                              'Edit Profile',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () async {
                              final result = await showDialog<bool>(
                                context: context,
                                builder: (_) {
                                  return UpdateProfile();
                                },
                              );
                              if (result) {
                                setState(() {});
                              }
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
                      Container(
                        margin: EdgeInsets.only(left: 50.0),
                        child: ButtonTheme(
                          minWidth: 120.0,
                          height: 40.0,
                          child: RaisedButton(
                            color: Colors.orange[700],
                            child: Text(
                              'Logout',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () async {
                              Name = "" ;
                              Email = "" ;
                              Phone_no = "" ;
                              Password = "" ;
                              Location =  "" ;
                              Navigator.pushNamed(context, MyHomePage.route);
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(builder: (context) => MyHomePage()),
                              // );

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

            ],
          ),
        ),

        bottomNavigationBar: FFNavigationBar(
          theme: FFNavigationBarTheme(
            barBackgroundColor: Colors.white,
            selectedItemBorderColor: Colors.transparent,
            selectedItemBackgroundColor: Colors.green,
            selectedItemIconColor: Colors.white,
            selectedItemLabelColor: Colors.black,
            showSelectedItemShadow: false,
            barHeight: 70,
          ),

          selectedIndex: selectedIndex,

          onSelectTab: (index){
            setState(() {
              selectedIndex = index;
              if (selectedIndex == 0) {
                Navigator.pushNamed(context, Home.route);
              } else if (selectedIndex == 1) {
                Navigator.pushNamed(context, Addproduct.route);
              } else if (selectedIndex == 2) {
                Navigator.pushNamed(context, Ngos.route);
              } else if (selectedIndex == 3) {
                Navigator.pushNamed(context, Profile.route);
              }
            });
          },

          items: items,
        )
    );
  }
}