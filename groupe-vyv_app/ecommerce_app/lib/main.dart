import 'dart:ffi';

import 'package:flutter/material.dart';
import 'sidebar/sidebar_layout.dart';
import 'package:ecommerceapp/pages/homepage.dart';
import 'pages/form_screen.dart';


void main() {

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
//      home: MyHomePage(title: 'Flutter Demo Home Page'),
      home: SideBarLayout(),
    );
  }
}
