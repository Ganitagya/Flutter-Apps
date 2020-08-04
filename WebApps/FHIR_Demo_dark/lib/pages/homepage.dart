import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:FHIR_Demo/bloc/navigation_bloc/navigation_bloc.dart';
import 'package:http/http.dart' as http;
import 'dialog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/navigation_bloc/navigation_bloc.dart';

class HomePage extends StatelessWidget with NavigationStates {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FHIR_Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
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
  int getColorHexFromStr(String colorStr) {
    colorStr = "FF" + colorStr;
    colorStr = colorStr.replaceAll("#", "");

    int val = 0;
    int len = colorStr.length;

    for (int i = 0; i < len; i++) {
      int hexDigit = colorStr.codeUnitAt(i);
      if (hexDigit >= 48 && hexDigit <= 57) {
        val += (hexDigit - 48) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 65 && hexDigit <= 70) {
        //A..F
        val += (hexDigit - 55) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 97 && hexDigit <= 102) {
        //A..F
        val += (hexDigit - 87) * (1 << (4 * (len - 1 - i)));
      } else {
        throw new FormatException("An error occurred while converting a color");
      }
    }
    return val;
  }

  String dob = '';
  String memberFname = '';
  String memberLname = '';
  String memberMname = '';
  String memberFullName = '';

  void getMemberDetails() async {
    var url =
        'https://integration.cloud.tibcoapps.com:443/4hzvlzzwbj2p5mmfdo6z7i646rovcmqa/members/123456';

    final response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    var details = json.decode(response.body);
    dob = details["dob"];
    memberFname = details["first_name"];
    memberLname = details["last_name"];
    memberMname = details["middle_name"];
  }

  String getDateofBirth() {
    return dob;
  }

  String getfName() {
    return memberFname;
  }

  String getName() {
    // getname();
    return memberFname + ' ' + memberMname + ' ' + memberLname;
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      getMemberDetails();
      dob = getDateofBirth();
      memberFname = getfName();
      memberFullName = getName();
    });

    return Scaffold(
      backgroundColor: Colors.grey[800],
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
                    color: Colors.grey[800], //initial color : #FDD148
                    // color: Color(getColorHexFromStr('#008D7B')), //initial color : #FDD148
                  ),
                  Positioned(
                    bottom: 50.0,
                    right: 100.0,
                    child: Container(
                      height: 400.0,
                      width: 400.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(200.0),
                          color: Color(getColorHexFromStr('#24354E'))
                              .withOpacity(0.4)),
                    ),
                  ),
                  Positioned(
                    bottom: 100.0,
                    left: 150.0,
                    child: Container(
                      height: 300.0,
                      width: 300.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(200.0),
                          color: Color(getColorHexFromStr('#24354E'))
                              .withOpacity(0.4)),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                      Padding(
                        padding: EdgeInsets.only(left: 15.0),
                        child: Text(
                          'Hello, ' + getfName(),
                          style: TextStyle(
                              fontFamily: 'Quicksand',
                              color: Colors.white,
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 15.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text(
                          'Welcome to Groupe VyV...',
                          style: TextStyle(
                              fontFamily: 'Quicksand',
                              color: Colors.white,
                              fontSize: 23.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 35.0),
                      Card(
                        color: Color(getColorHexFromStr('#c6afd6')),
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 100),
                        child: Column(
                          children: [
                            FlatButton(
                              child: Text(
                                'Member Details',
                                style: TextStyle(
                                    fontFamily: 'Quicksand',
                                    fontSize: 15.0,
                                    decoration: TextDecoration.underline,
                                    fontWeight: FontWeight.bold),
                              ),
                              onPressed: () {
                                setState(() {
                                  // getMemberDetails();
                                  dob = getDateofBirth();
                                  memberFname = getfName();
                                  memberFullName = getName();
                                });
                              },
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 10.0),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Text(
                                    'Member Name : ' + memberFullName,
                                    style: TextStyle(
                                        fontFamily: 'Quicksand',
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(height: 5.0),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Text(
                                    'Date of Birth    : ' + getDateofBirth(),
                                    style: TextStyle(
                                        fontFamily: 'Quicksand',
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(height: 20.0),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 25.0),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 150.0,
              ),
              Stack(
                children: <Widget>[
                  Material(
                    elevation: 5.0,
                    child: Container(
                      height: 70.0,
                      color: Color(getColorHexFromStr('#A3C373')),
                      // color: Colors.indigo[400],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        height: 75.0,
                        width: MediaQuery.of(context).size.width / 4,
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 10.0,
                            ),
                            RaisedButton(
                              child: Text(
                                'ALLERGIES',
                                style: TextStyle(
                                  fontFamily: 'Quicksand',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              color: Colors.blueGrey,
                              onPressed: () {
                                // onIconPressed();
                                BlocProvider.of<NavigationBloc>(context).add(
                                    NavigationEvents.MyAllergiesClickedEvent);
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 75.0,
                        width: MediaQuery.of(context).size.width / 4,
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 10.0,
                            ),
                            RaisedButton(
                              onPressed: () {
                                String body = 'VISITS : ';
                                final action = Dialogs.yesAbortDialog(
                                    context, "Following are your visits", body);
                              },
                              child: Text(
                                'VISITS',
                                style: TextStyle(
                                    fontFamily: 'Quicksand',
                                    fontWeight: FontWeight.bold),
                              ),
                              color: Colors.blueGrey,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 75.0,
                        width: MediaQuery.of(context).size.width / 4,
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 10.0,
                            ),
                            RaisedButton(
                              onPressed: () {
                                String body = 'CLAIMS : ';
                                final action = Dialogs.yesAbortDialog(
                                    context, "Following are your claims", body);
                              },
                              child: Text(
                                'CLAIMS',
                                style: TextStyle(
                                    fontFamily: 'Quicksand',
                                    fontWeight: FontWeight.bold),
                              ),
                              color: Colors.blueGrey,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget itemCard(String title, String imgPath) {
    return Padding(
      padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
      child: Container(
        height: 150.0,
        width: double.infinity,
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Container(
              width: 140.0,
              height: 150.0,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(imgPath), fit: BoxFit.cover)),
            ),
            SizedBox(
              width: 20.0,
            ),
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      title,
                      style: TextStyle(
                          fontFamily: 'Quicksand',
                          color: Colors.indigo,
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  width: 200.0,
                  child: Text(
                    'Entrepreneur du mieux-vivre, nous voulons garantir à chacun le droit à une vraie protection sociale et contribuer ainsi à l’intérêt général.',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontFamily: 'Quicksand',
                        color: Colors.grey[800],
                        fontSize: 15.0),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
