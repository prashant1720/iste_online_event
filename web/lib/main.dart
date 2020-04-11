import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinning_wheel/flutter_spinning_wheel.dart';
import 'package:iste_online_event/DepartmentPage.dart';
import 'package:iste_online_event/DptQuestion.dart';

import 'MyHomePage.dart';

void main() {
  SystemChrome.setEnabledSystemUIOverlays([]);

  runApp(MaterialApp(

    home: MyApp(),

  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),

        initialRoute:MyHomePage.id ,
        routes: {
          MyHomePage.id: (context) => MyHomePage(),
          DptQuestion.id: (context) => DptQuestion(),
          DepartmentPage.id: (context) => DepartmentPage(context),

        });
  }
}


