import 'dart:ffi';

import 'package:flutter/material.dart';
import '../sidebar/sidebar_layout.dart';
import 'package:flutter/material.dart';
import 'package:ecommerceapp/bloc/navigation_bloc/navigation_bloc.dart';




class HomePage extends StatelessWidget with NavigationStates {
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
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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

    for(int i = 0; i < len; i++) {
      int hexDigit = colorStr.codeUnitAt(i);
      if (hexDigit >= 48 && hexDigit <= 57) {
        val += (hexDigit - 48) * (1 << (4 * (len - 1- i)));
      } else if(hexDigit >= 65 && hexDigit <= 70) {
        //A..F
        val += (hexDigit - 55) * (1 << (4 * (len - 1- i)));
      } else if(hexDigit >= 97 && hexDigit <= 102) {
        //A..F
        val += (hexDigit - 87) * (1 << (4 * (len - 1- i)));
      } else {
        throw new FormatException("An error occurred while converting a color");
      }
    }
    return val;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    height: 250.0,
                    width: double.infinity,
                    color: Color(getColorHexFromStr('#FDD148')),
                  ),
                  Positioned(
                    bottom: 50.0,
                    right: 100.0,
                    child: Container(
                      height: 400.0,
                      width: 400.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(200.0),
                          color: Color(getColorHexFromStr('FEE16D'))
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
                          color: Color(getColorHexFromStr('FEE16D'))
                              .withOpacity(0.4)),
                    ),
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 15.0,),
                      Row(
                        children: <Widget>[
                          SizedBox(width: 15.0,),
                          SizedBox(
                              width: MediaQuery.of(context)
                                  .size.width - 250.0),

                          Container(
                            alignment: Alignment.center,

                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                CircleAvatar(
                                  backgroundImage: AssetImage('assets/download.png'),
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
                          'Bonjour, Bob',
                          style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),

                      SizedBox(height: 15.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text(
                          'Bienvenue au Groupe VyV...',
                          style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontSize: 23.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 25.0),
                      Padding(
                        padding: EdgeInsets.only(left: 15.0, right: 15.0),
                        child: Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(5.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: Icon(Icons.search,
                                  color: Color(getColorHexFromStr('#FEDF62')),
                                  size: 30.0,),

                                contentPadding: EdgeInsets.only(left: 15.0, top: 15.0),

                                hintText: 'chercher ...',
                                hintStyle: TextStyle(
                                    color: Colors.grey[700],
                                    fontFamily: 'Quicksand')
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 10.0)

                    ],
                  )

                ],
              ),


              Stack(
                children: <Widget>[
                  SizedBox(height: 10.0,),
                  Material(
                    elevation: 1.0,
                    child: Container(
                      height: 75.0,
                      color: Colors.indigo[400],
                    ),
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
                              height: 20.0,
                            ),
                            Text(
                              'NOTRE PROJET',
                              style: TextStyle(
                                fontFamily: 'Quicksand',
                                fontWeight: FontWeight.bold,
                              ),
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
                              height: 20.0,
                            ),
                            Text(
                              'NOS RÉPONSES',
                              style: TextStyle(fontFamily: 'Quicksand',
                                  fontWeight: FontWeight.bold),
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
                              height: 20.0,
                            ),
                            Text(
                              'MOMENTS DE VIE',
                              style: TextStyle(fontFamily: 'Quicksand',
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),


                    ],
                  )
                ],
              ),

              itemCard('Notre groupe', 'assets/firstcard.jpg')
            ],
          )
        ],
      ),
    );
  }

  Widget itemCard(String title, String imgPath){
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
                      image: AssetImage(imgPath),
                      fit: BoxFit.cover
                  )
              ),
            ),

            SizedBox(width: 20.0,),
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
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0,),
                Container(
                  width: 175.0,
                  child: Text(
                    'Entrepreneur du mieux-vivre, nous voulons garantir à chacun le droit à une vraie protection sociale et contribuer ainsi à l’intérêt général.',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontFamily: 'Quicksand',
                        color: Colors.grey[800],
                        fontSize: 15.0
                    ),
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
