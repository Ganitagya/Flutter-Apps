import 'package:flutter/material.dart';
import 'package:FHIR_Demo/bloc/navigation_bloc/navigation_bloc.dart';
import '../bloc/navigation_bloc/navigation_bloc.dart';
import 'package:FHIR_Demo/services/memberService.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0), // here the desired height

        child: AppBar(
          backgroundColor: Colors.blue[900],
          centerTitle: true, // this is all you need
          title: Text(
            "myHealthBuddy",
          ),
        ),
      ),
      backgroundColor: Colors.blue[100],
      // Color(getColorHexFromStr('#008D7B')), //initial color : #FDD148
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),

            // First Row stack Begins
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Container(
                    height: 165.0,
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      border: Border.all(
                        color: Colors.blueAccent,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        // height: 160.0,
                        decoration: BoxDecoration(
                          color: Colors.indigo[900],
                          border: Border.all(
                            color: Colors.blueAccent,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/profile_pic.png'),
                          radius: 40.0,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        'Hello, ' + firstName,
                        style: TextStyle(
                            fontFamily: 'Quicksand',
                            color: Colors.white,
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ],
            ),
            // First Row stack ends

            // Second Row begins
            // Includes 2 containers with member details like Gender, Address, etc.
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 5, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(2, 10, 2, 10),
                    child: Container(
                      child: Stack(
                        children: [
                          Container(
                            width: (MediaQuery.of(context).size.width - 40) / 3,
                            height: 165.0,
                            decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              border: Border.all(
                                color: Colors.blueAccent,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.indigo[900],
                                  border: Border.all(
                                    color: Colors.blueAccent,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Gender:",
                                              style: TextStyle(
                                                  fontFamily: 'Quicksand',
                                                  color: Colors.white,
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              "$gender",
                                              style: TextStyle(
                                                  fontFamily: 'Quicksand',
                                                  color: Colors.white,
                                                  fontSize: 15.0,
                                                  fontWeight:
                                                      FontWeight.normal),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "DOB :",
                                              style: TextStyle(
                                                  fontFamily: 'Quicksand',
                                                  color: Colors.white,
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            FittedBox(
                                              fit: BoxFit.fitWidth,
                                              child: Text(
                                                "$dateOfBirth",
                                                style: TextStyle(
                                                    fontFamily: 'Quicksand',
                                                    color: Colors.white,
                                                    fontSize: 15.0,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(2, 10, 2, 10),
                    child: Container(
                      child: Stack(
                        children: [
                          Container(
                            height: 165.0,
                            width: 2 *
                                (MediaQuery.of(context).size.width - 40) /
                                3,
                            decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              border: Border.all(
                                color: Colors.blueAccent,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.indigo[900],
                                  border: Border.all(
                                    color: Colors.blueAccent,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Icon(
                                            Icons.location_on,
                                            color: Colors.blue[200],
                                          ),
                                          SizedBox(
                                            width: 5.0,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 15, vertical: 10),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  child: FittedBox(
                                                    fit: BoxFit.fitWidth,
                                                    child: Text(
                                                      addFirstLine,
                                                      style: TextStyle(
                                                          fontFamily:
                                                              'Quicksand',
                                                          color: Colors.white,
                                                          fontSize: 15.0,
                                                          fontWeight: FontWeight
                                                              .normal),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 5.0,
                                                ),
                                                Container(
                                                  child: FittedBox(
                                                    fit: BoxFit.fitWidth,
                                                    child: Text(
                                                      '$city $postalCode',
                                                      style: TextStyle(
                                                          fontFamily:
                                                              'Quicksand',
                                                          color: Colors.white,
                                                          fontSize: 15.0,
                                                          fontWeight: FontWeight
                                                              .normal),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Icon(
                                            Icons.phone,
                                            color: Colors.blue[200],
                                          ),
                                          SizedBox(
                                            width: 15.0,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "(410) 674-2341",
                                                style: TextStyle(
                                                    fontFamily: 'Quicksand',
                                                    color: Colors.white,
                                                    fontSize: 15.0,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Icon(
                                            Icons.email,
                                            color: Colors.blue[200],
                                          ),
                                          SizedBox(
                                            width: 15.0,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "$email",
                                                style: TextStyle(
                                                    fontFamily: 'Quicksand',
                                                    color: Colors.white,
                                                    fontSize: 15.0,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
            // Second Row ends
            ,

            // Third row begins -> Medical Summary
            Padding(
              padding: EdgeInsets.fromLTRB(18, 0, 13, 0),
              child: Stack(
                children: [
                  Container(
                    height: 240,
                    // width: 10 * MediaQuery.of(context).size.width / 11,
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        // height: 160.0,
                        decoration: BoxDecoration(
                          color: Colors.indigo[900],
                          border: Border.all(
                            color: Colors.blueAccent,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Medical Plan Summary',
                            style: TextStyle(
                              fontFamily: 'Quicksand',
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 20.0),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(18, 0, 13, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width:
                                  (MediaQuery.of(context).size.width - 64) / 2,
                              child: Text(
                                'Plan Type:',
                                style: TextStyle(
                                  fontFamily: 'Quicksand',
                                  color: Colors.white,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              width:
                                  (MediaQuery.of(context).size.width - 64) / 2,
                              child: Text(
                                'Group Number:',
                                style: TextStyle(
                                  fontFamily: 'Quicksand',
                                  color: Colors.white,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(18, 0, 13, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width:
                                  (MediaQuery.of(context).size.width - 64) / 2,
                              child: Text(
                                'BlueChoice Optout \nOpen Access',
                                style: TextStyle(
                                  fontFamily: 'Quicksand',
                                  color: Colors.white,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                            Container(
                              width:
                                  (MediaQuery.of(context).size.width - 64) / 2,
                              child: Text(
                                '8342945617',
                                style: TextStyle(
                                  fontFamily: 'Quicksand',
                                  color: Colors.white,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(18, 0, 13, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width:
                                  (MediaQuery.of(context).size.width - 64) / 2,
                              child: Text(
                                'Start Date:',
                                style: TextStyle(
                                  fontFamily: 'Quicksand',
                                  color: Colors.white,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              width:
                                  (MediaQuery.of(context).size.width - 64) / 2,
                              child: Text(
                                'Member Id:',
                                style: TextStyle(
                                  fontFamily: 'Quicksand',
                                  color: Colors.white,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(18, 0, 13, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width:
                                  (MediaQuery.of(context).size.width - 64) / 2,
                              child: Text(
                                'January 1, 2015',
                                style: TextStyle(
                                  fontFamily: 'Quicksand',
                                  color: Colors.white,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                            Container(
                              width:
                                  (MediaQuery.of(context).size.width - 64) / 2,
                              child: Text(
                                '$memberId',
                                style: TextStyle(
                                  fontFamily: 'Quicksand',
                                  color: Colors.white,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(18, 0, 13, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width:
                                  (MediaQuery.of(context).size.width - 64) / 2,
                              child: Text(
                                'PCP:',
                                style: TextStyle(
                                  fontFamily: 'Quicksand',
                                  color: Colors.white,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              width:
                                  (MediaQuery.of(context).size.width - 64) / 2,
                              child: Text(
                                'Subscriber Name:',
                                style: TextStyle(
                                  fontFamily: 'Quicksand',
                                  color: Colors.white,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(18, 0, 13, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width:
                                  (MediaQuery.of(context).size.width - 64) / 2,
                              child: Text(
                                'Jane Smith',
                                style: TextStyle(
                                  fontFamily: 'Quicksand',
                                  color: Colors.white,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                            Container(
                              width:
                                  (MediaQuery.of(context).size.width - 64) / 2,
                              child: Text(
                                '$firstName',
                                style: TextStyle(
                                  fontFamily: 'Quicksand',
                                  color: Colors.white,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),

            // Third row ends -> Medical Summary

            // forth row begins
            Padding(
              padding: EdgeInsets.fromLTRB(18, 10, 13, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Stack(
                    children: [
                      Container(
                        width: (MediaQuery.of(context).size.width - 64) / 2,

                        height: 55,
                        // width: 10 * MediaQuery.of(context).size.width / 11,
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            // height: 160.0,
                            decoration: BoxDecoration(
                              color: Colors.indigo[900],
                              border: Border.all(
                                color: Colors.blueAccent,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: FlatButton(
                              child: Text(
                                "Recent Claims",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Quicksand',
                                ),
                              ),
                              onPressed: () {
                                BlocProvider.of<NavigationBloc>(context)
                                    .add(NavigationEvents.MyClaimsClickedEvent);
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Container(
                        width: (MediaQuery.of(context).size.width - 64) / 2,

                        height: 55,
                        // width: 10 * MediaQuery.of(context).size.width / 11,
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            // height: 160.0,
                            decoration: BoxDecoration(
                              color: Colors.indigo[900],
                              border: Border.all(
                                color: Colors.blueAccent,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: FlatButton(
                              child: Text(
                                "Search Doctors",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Quicksand',
                                ),
                              ),
                              onPressed: () {
                                BlocProvider.of<NavigationBloc>(context).add(
                                    NavigationEvents.MyAccountClickedEvent);
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
