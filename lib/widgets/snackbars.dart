import 'package:flutter/material.dart';

Widget snackbar(BuildContext context,String text){
  return Scaffold(
    body: SnackBar(content: 
    Text(text),
    duration: Duration(seconds: 2),),
  );
}