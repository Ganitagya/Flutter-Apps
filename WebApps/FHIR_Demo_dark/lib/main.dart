import 'package:FHIR_Demo/pages/loading.dart';
import 'package:flutter/material.dart';
import 'sidebar/sidebar_layout.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/loading': (context) => Loading(),
        '/memberhome': (context) => SideBarLayout(),
      },
      debugShowCheckedModeBanner: false,
      title: 'FHIR_Demo',
      theme: ThemeData(),
//      home: MyHomePage(title: 'FHIR_Demo Home Page'),
      home: SideBarLayout(),
      initialRoute: '/loading',
    );
  }
}
