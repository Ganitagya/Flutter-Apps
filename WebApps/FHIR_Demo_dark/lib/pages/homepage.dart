import 'package:flutter/material.dart';
import 'package:FHIR_Demo/bloc/navigation_bloc/navigation_bloc.dart';
import '../bloc/navigation_bloc/navigation_bloc.dart';
import 'package:FHIR_Demo/data/memberData.dart';

class HomePage extends StatelessWidget with NavigationStates {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FHIR_Demo',
      home: MyHomePage(title: 'FHIR_Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[500],
      // Color(getColorHexFromStr('#008D7B')), //initial color : #FDD148
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    height: 250.0,
                    width: double.infinity,
                    //initial color : #FDD148
                    // color: Color(getColorHexFromStr('#008D7B')), //initial color : #FDD148
                  ),
                  Positioned(
                    child: Center(
                      child: Container(
                        height: 400.0,
                        width: 400.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(200.0),
                            color: Colors.grey[850]),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        SizedBox(
                          height: 15.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              width: 15.0,
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(
                                    height: 100,
                                  ),
                                  CircleAvatar(
                                    backgroundImage:
                                        AssetImage('assets/profile_pic.png'),
                                    radius: 40.0,
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 15.0),
                          ],
                        ),
                        SizedBox(height: 30.0),
                        Center(
                          child: Text(
                            'Hello, ' + firstName,
                            style: TextStyle(
                                fontFamily: 'Quicksand',
                                color: Colors.white,
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(height: 15.0),
                        Center(
                          child: Text(
                            'Welcome to FHIR Demo',
                            style: TextStyle(
                                fontFamily: 'Quicksand',
                                color: Colors.white,
                                fontSize: 23.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(height: 35.0),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[700],
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.0),
                                  topRight: Radius.circular(20.0))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 45.0,
                              ),
                              Center(
                                child: Text(
                                  'Member Details',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Quicksand',
                                      fontSize: 25.0,
                                      decoration: TextDecoration.underline,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(height: 35.0),
                              Center(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Member Name         : ' + fullName,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Quicksand',
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 10.0),
                                    Text(
                                      'Date of Birth            : ' +
                                          dateOfBirth,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Quicksand',
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 10.0),
                                    Text(
                                      'Gender                     : ' + gender,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Quicksand',
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 10.0),
                                    Text(
                                      'Address First Line  : ' + addFirstLine,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Quicksand',
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 10.0),
                                    Text(
                                      'City                           : ' +
                                          city,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Quicksand',
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 10.0),
                                    Text(
                                      'State                         : ' +
                                          state,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Quicksand',
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 10.0),
                                    Text(
                                      'PostalCode              : ' + postalCode,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Quicksand',
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 10.0),
                                    Text(
                                      'Country                    : ' + country,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Quicksand',
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 300,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
