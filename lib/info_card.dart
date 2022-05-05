import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class InfoCard extends StatelessWidget {
  final String text;
  final IconData icon;

  InfoCard({
    @required this.text,
    @required this.icon
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        color: Colors.white,
        margin: EdgeInsets.symmetric(vertical: 5.0, horizontal:20.0),
        child: ListTile(
          leading: Icon(
            icon,
          ),
          title: Text(
            text,
            style: TextStyle(
                fontFamily: 'OldStandard',
                fontSize: 20.0,
                color: Colors.black
            ),
          ),
        ),

      ),


    );
  }
}

