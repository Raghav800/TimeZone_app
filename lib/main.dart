import 'package:flutter/material.dart';
import 'package:timezone/pages/home.dart';
import 'package:timezone/pages/loading.dart';
import 'package:timezone/pages/choose_location.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
     '/' : (context)=> Loading(),
     '/home' : (context) => Home(),
     '/location' : (context) => ChooseLocation() ,
    },
  ));
}
//changess


