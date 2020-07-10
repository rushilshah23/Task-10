import 'package:flutter/material.dart';

Widget widgetDescription({String title, String description}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      child: Column(
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
                fontSize: 32, fontWeight: FontWeight.bold, color: Colors.blue),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            description,
            style: TextStyle(fontSize: 15),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Example",
            style: TextStyle(
              color: Colors.black,
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 16,
          ),
        ],
      ),
    ),
  );
}
