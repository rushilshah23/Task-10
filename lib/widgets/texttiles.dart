  import 'package:flutter/material.dart';
  
  Widget textTile({String text1, String text2}) {
    return Container(
        child: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          FittedBox(
            child: Text(
              text1,
              style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
            ),
            fit: BoxFit.fitWidth,
          ),
          FittedBox(
              child: Text(
                text2,
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
              ),
              fit: BoxFit.fitWidth),
          // logInSnackbar(context),
        ],
      ),
    ));
  }