import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:be_project/dropdown_data.dart';
import 'package:be_project/constants.dart';
import 'package:be_project/home.dart';
import 'API.dart';

class MyDialog extends StatefulWidget {
  final int index;
  const MyDialog(this.index);

  @override
  _MyDialogState createState() => _MyDialogState();
}

class _MyDialogState extends State<MyDialog> {
  APIservice apIservice = APIservice();

  sendEditPost() async {
    await apIservice.editPost();
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
  String selectedStubble = 'TYPE OF STUBBLE';
  List<DropdownMenuItem> getDropdownItems() {
    List<DropdownMenuItem<String>> dropdownItems = [];

    for (int i = 0; i < stubbleList.length; i++) {
      String stubble = stubbleList[i];

      var newItem = DropdownMenuItem(
        child: Text(stubble),
        value: stubble,
      );
      dropdownItems.add(newItem);
    }
    return dropdownItems;
  }

  Widget setupAlertDialoadContainer() {
    return Container(
      height: 200.0, // Change as per your requirement
      width: 300.0, // Change as per your requirement
      child: ListView(
          children: [
            // TextFormField(
            //   validator: (value) {
            //     if (value.isEmpty) {
            //       return 'Please enter some text';
            //     }
            //     return null;
            //   },
            //   decoration: InputDecoration(
            //       labelText: 'LOCATION',
            //       labelStyle: TextStyle(
            //         fontWeight: FontWeight.w500, color: Colors.orange[700],)
            //   ),
            // ),

            TextFormField(
              controller: TextEditingController(text:Productlist[widget.index][4].toString()),
              onChanged: (text) => {Edit_Quantity = text},
              decoration: InputDecoration(
                  labelText: 'QUANTITY',
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.w500, color: Colors.orange[700],)
              ),
              keyboardType:TextInputType.number,
            ),

            TextFormField(
              controller: TextEditingController(text:Productlist[widget.index][3].toString()),
              onChanged: (text) => {Edit_Price = text},


              decoration: InputDecoration(
                  labelText: 'PRICE',
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.w500, color: Colors.orange[700],)
              ),
              keyboardType:TextInputType.number,
            ),

            // DropdownButton<String>(
            //   value: selectedStubble,
            //   items: getDropdownItems(),
            //   isExpanded: true,
            //   style: TextStyle(fontWeight: FontWeight.w500, color: Colors.orange[700],),
            //   onChanged: (value) {
            //     setState(() {
            //       selectedStubble = value;
            //     });
            //   },
            //   hint:Text('Type of stubble'),
            // ),
            SizedBox(
              height: 15,
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

                          Edit_Product_id=Productlist[widget.index][0];
                          sendEditPost();
                          Navigator.pushNamed(context, Home.route);

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
                        Navigator.pushNamed(context, Home.route);
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
            )
          ]
      ),
    );
  }

}