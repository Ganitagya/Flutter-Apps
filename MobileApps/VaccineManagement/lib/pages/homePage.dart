import 'package:FHIR_Demo/pages/scheduleAppointmentPage.dart';
import 'package:FHIR_Demo/services/vaccineService.dart';
import 'package:flutter/material.dart';
import 'package:FHIR_Demo/bloc/navigation_bloc/navigation_bloc.dart';
import '../bloc/navigation_bloc/navigation_bloc.dart';
import 'package:FHIR_Demo/services/memberService.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:FHIR_Demo/services/scheduleAppointmentService.dart';
import 'package:FHIR_Demo/services/appointmentStatusService.dart';

String status='\nAppointment Confirmation Pending';
String Date;
String VaccinationCenterName;

class HomePage extends StatelessWidget with NavigationStates {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vaccine Management App',
      home: MyHomePage(title: 'Vaccine Management Home Page'),
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
          backgroundColor: Colors.blue[700],
          centerTitle: true, // this is all you need
          title: Text(
            "Vaccine Management"
          ),
        ),
      ),
      backgroundColor: Colors.white,
      // Color(getColorHexFromStr('#008D7B')), //initial color : #FDD148
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 1,
            ),

            // First Row stack Begins
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
                  // padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Container(
                    height: 165.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.white,
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
                          color: Colors.blue[600],
                          border: Border.all(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 40,
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
                      height: 10,
                    ),
                    FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        'Hello, ' + firstName,
                        // 'Hello, ' + 'Akash',
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
                    padding: EdgeInsets.fromLTRB(2, 0, 2, 0),
                    child: Container(
                      child: Stack(
                        children: [
                          Container(
                            width: (MediaQuery.of(context).size.width - 40) / 3,
                            height: 165.0,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.blue[600],
                                  border: Border.all(
                                    color: Colors.white,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15),
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
                                              // "Male",
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
                                                // "March 2020",
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
                    padding: EdgeInsets.fromLTRB(2, 0, 2, 0),
                    child: Container(
                      child: Stack(
                        children: [
                          Container(
                            height: 165.0,
                            width: 2 *
                                (MediaQuery.of(context).size.width - 40) /
                                3,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.blue[600],
                                  border: Border.all(
                                    color: Colors.white,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15),
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
                                                      // 'Pune 411006',
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
                                                // "email@email.com",
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
            SizedBox(height: 20,),
            // Third row begins -> Medical Summary
            Padding(
              padding: EdgeInsets.fromLTRB(18, 0, 13, 0),
              child: Stack(
                children: [
                  Container(
                    height: 220,
                    // width: 10 * MediaQuery.of(context).size.width / 11,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        // height: 160.0,
                        decoration: BoxDecoration(
                          color: Colors.blue[600],
                          border: Border.all(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
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
                          Text(
                            '\nVaccine Appointment Status',
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
                      SizedBox(height: 15.0),
                      // (() {
                      //   getAppointmentStatus().then((value) => status);
                      // }()),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            status,
                            style: TextStyle(
                              fontFamily: 'Quicksand',
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              // decoration: TextDecoration.underline,
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 25.0),
                      // (() {
                      //   getAppointmentStatus().then((value) => status);
                      // }()),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RaisedButton(
                            color: Colors.blue[700],
                            child: Text(
                              "Click to know appointment details",
                              style: TextStyle(
                                fontFamily: 'Quicksand',
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.normal,
                                // decoration: TextDecoration.underline,
                              ),
                            ),
                            onPressed: (){

                              showDialog(context: context,
                              builder: (context){
                                return Dialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),

                                  ),
                                  child: Container(
                                    height: 300,
                                    child: Padding(
                                      padding: EdgeInsets.all(12.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text("Appointment Schedule",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontFamily: 'Quicksand',
                                            fontWeight: FontWeight.bold
                                          ),),
                                          SizedBox(height: 20,),
                                          Row(
                                            children: [
                                              Text(scheduleListForBookingAppointment[0]["healtcareCenterName"],
                                                style: TextStyle(
                                                    fontFamily: 'Quicksand',
                                                    //     color: Colors.white,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold
                                                ),),
                                            ],
                                          ),

                                          SizedBox(height: 20,),
                                          Row(
                                            children: [
                                              Text('Date of Appointment: ', // $scheduleListForBookingAppointment[0]["date"]',
                                                style: TextStyle(
                                                    fontFamily: 'Quicksand',
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold
                                                ),),
                                              Text(scheduleListForBookingAppointment[0]["date"],
                                                style: TextStyle(
                                                    fontFamily: 'Quicksand',
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.normal
                                                ),)
                                            ],
                                          ),
                                          SizedBox(height: 20.0,),
                                          Row(
                                            children: [
                                              Text('Start Time: ',
                                                style: TextStyle(
                                                    fontFamily: 'Quicksand',
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold
                                                ),),
                                              Text(scheduleListForBookingAppointment[0]['startTime'].toString().substring(12, 19),
                                                style: TextStyle(
                                                  fontFamily: 'Quicksand',
                                                  fontSize: 16,

                                                ),)
                                            ],
                                          ),
                                          SizedBox(height: 20.0,),
                                          Row(
                                            children: [
                                              Text('End Time: ',
                                                style: TextStyle(
                                                    fontFamily: 'Quicksand',
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold
                                                ),),
                                              Text(scheduleListForBookingAppointment[0]['endTime'].toString().substring(12, 19),
                                                style: TextStyle(
                                                  fontFamily: 'Quicksand',
                                                  fontSize: 16,

                                                ),)
                                            ],
                                          ),
                                          SizedBox(height: 20.0,),
                                          SizedBox(
                                            width: 220,
                                              child: RaisedButton(
                                                color: Colors.blue[600],
                                                onPressed: (){

                                                  setState(() {
                                                    status=' \nYour Appointment has been confirmed';
                                                    vaccineDone = 1;
                                                  });
                                                  Navigator.pop(context);
                                                },
                                                child: Text("Confirm Appointment",
                                                style: TextStyle(
                                                  fontFamily: 'Quicksand',
                                                  color: Colors.white
                                                ),),
                                              ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              });
                            },
                          )
                        ],
                      ),
                      SizedBox(height: 15.0),
                      // (() {
                      //   setupSchedule();
                      //   setState(() {
                      //     // status = appointmentStatus;
                      //   });
                      // }()),

                      // Padding(
                      //   padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //     children: [
                      //       Container(
                      //         width:
                      //             (MediaQuery.of(context).size.width - 64) / 2,
                      //         child: Text(
                      //           'Plan Type:',
                      //           style: TextStyle(
                      //             fontFamily: 'Quicksand',
                      //             color: Colors.white,
                      //             fontSize: 15.0,
                      //             fontWeight: FontWeight.bold,
                      //           ),
                      //         ),
                      //       ),
                      //       Container(
                      //         width:
                      //             (MediaQuery.of(context).size.width - 64) / 2,
                      //         child: Text(
                      //           'Group Number:',
                      //           style: TextStyle(
                      //             fontFamily: 'Quicksand',
                      //             color: Colors.white,
                      //             fontSize: 15.0,
                      //             fontWeight: FontWeight.bold,
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       Container(
                      //         width:
                      //             (MediaQuery.of(context).size.width - 64) / 2,
                      //         child: Text(
                      //           'BlueChoice Optout \nOpen Access',
                      //           style: TextStyle(
                      //             fontFamily: 'Quicksand',
                      //             color: Colors.white,
                      //             fontSize: 15.0,
                      //             fontWeight: FontWeight.normal,
                      //           ),
                      //         ),
                      //       ),
                      //       Container(
                      //         width:
                      //             (MediaQuery.of(context).size.width - 64) / 2,
                      //         child: Text(
                      //           '8342945617',
                      //           style: TextStyle(
                      //             fontFamily: 'Quicksand',
                      //             color: Colors.white,
                      //             fontSize: 15.0,
                      //             fontWeight: FontWeight.normal,
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 10.0,
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       Container(
                      //         width:
                      //             (MediaQuery.of(context).size.width - 64) / 2,
                      //         child: Text(
                      //           'Start Date:',
                      //           style: TextStyle(
                      //             fontFamily: 'Quicksand',
                      //             color: Colors.white,
                      //             fontSize: 15.0,
                      //             fontWeight: FontWeight.bold,
                      //           ),
                      //         ),
                      //       ),
                      //       Container(
                      //         width:
                      //             (MediaQuery.of(context).size.width - 64) / 2,
                      //         child: Text(
                      //           'Member Id:',
                      //           style: TextStyle(
                      //             fontFamily: 'Quicksand',
                      //             color: Colors.white,
                      //             fontSize: 15.0,
                      //             fontWeight: FontWeight.bold,
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       Container(
                      //         width:
                      //             (MediaQuery.of(context).size.width - 64) / 2,
                      //         child: Text(
                      //           'January 1, 2015',
                      //           style: TextStyle(
                      //             fontFamily: 'Quicksand',
                      //             color: Colors.white,
                      //             fontSize: 15.0,
                      //             fontWeight: FontWeight.normal,
                      //           ),
                      //         ),
                      //       ),
                      //       Container(
                      //         width:
                      //             (MediaQuery.of(context).size.width - 64) / 2,
                      //         child: Text(
                      //           // '89',
                      //           '$memberId',
                      //           style: TextStyle(
                      //             fontFamily: 'Quicksand',
                      //             color: Colors.white,
                      //             fontSize: 15.0,
                      //             fontWeight: FontWeight.normal,
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 10.0,
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       Container(
                      //         width:
                      //             (MediaQuery.of(context).size.width - 64) / 2,
                      //         child: Text(
                      //           'PCP:',
                      //           style: TextStyle(
                      //             fontFamily: 'Quicksand',
                      //             color: Colors.white,
                      //             fontSize: 15.0,
                      //             fontWeight: FontWeight.bold,
                      //           ),
                      //         ),
                      //       ),
                      //       Container(
                      //         width:
                      //             (MediaQuery.of(context).size.width - 64) / 2,
                      //         child: Text(
                      //           'Subscriber Name:',
                      //           style: TextStyle(
                      //             fontFamily: 'Quicksand',
                      //             color: Colors.white,
                      //             fontSize: 15.0,
                      //             fontWeight: FontWeight.bold,
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       Container(
                      //         width:
                      //             (MediaQuery.of(context).size.width - 64) / 2,
                      //         child: Text(
                      //           'Jane Smith',
                      //           style: TextStyle(
                      //             fontFamily: 'Quicksand',
                      //             color: Colors.white,
                      //             fontSize: 15.0,
                      //             fontWeight: FontWeight.normal,
                      //           ),
                      //         ),
                      //       ),
                      //       Container(
                      //         width:
                      //             (MediaQuery.of(context).size.width - 64) / 2,
                      //         child: Text(
                      //           // 'Akash',
                      //           '$firstName',
                      //           style: TextStyle(
                      //             fontFamily: 'Quicksand',
                      //             color: Colors.white,
                      //             fontSize: 15.0,
                      //             fontWeight: FontWeight.normal,
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    ],
                  )
                ],
              ),
            ),

            // Third row ends -> Medical Summary

            // forth row begins
            // Padding(
            //   padding: EdgeInsets.fromLTRB(18, 0, 13, 0),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     children: [
            //       Stack(
            //         children: [
            //           Container(
            //             width: (MediaQuery.of(context).size.width - 64) / 3,
            //
            //             height: 55,
            //             // width: 10 * MediaQuery.of(context).size.width / 11,
            //             decoration: BoxDecoration(
            //               color: Colors.white,
            //               borderRadius: BorderRadius.all(
            //                 Radius.circular(10),
            //               ),
            //             ),
            //             child: Padding(
            //               padding: const EdgeInsets.all(5.0),
            //               child: Container(
            //                 // height: 160.0,
            //                 decoration: BoxDecoration(
            //                   color: Colors.blue[600],
            //                   border: Border.all(
            //                     color: Colors.white,
            //                   ),
            //                   borderRadius: BorderRadius.all(
            //                     Radius.circular(10),
            //                   ),
            //                 ),
            //                 child: FlatButton(
            //                   child: Text(
            //                     "Allergies",
            //                     style: TextStyle(
            //                       color: Colors.white,
            //                       fontFamily: 'Quicksand',
            //                     ),
            //                   ),
            //                   onPressed: () {
            //                     BlocProvider.of<NavigationBloc>(context)
            //                         .add(NavigationEvents.MyAllergiesClickedEvent);
            //                   },
            //                 ),
            //               ),
            //             ),
            //           ),
            //         ],
            //       ),
            //       Stack(
            //         children: [
            //           Container(
            //             width: 2*(MediaQuery.of(context).size.width - 64) / 3,
            //
            //             height: 55,
            //             // width: 10 * MediaQuery.of(context).size.width / 11,
            //             decoration: BoxDecoration(
            //               color: Colors.white,
            //               borderRadius: BorderRadius.all(
            //                 Radius.circular(10),
            //               ),
            //             ),
            //             child: Padding(
            //               padding: const EdgeInsets.all(5.0),
            //               child: Container(
            //                 // height: 160.0,
            //                 decoration: BoxDecoration(
            //                   color: Colors.blue[600],
            //                   border: Border.all(
            //                     color: Colors.white,
            //                   ),
            //                   borderRadius: BorderRadius.all(
            //                     Radius.circular(10),
            //                   ),
            //                 ),
            //                 child: FlatButton(
            //                   child: Text(
            //                     "Schedule Appointment",
            //                     style: TextStyle(
            //                       color: Colors.white,
            //                       fontFamily: 'Quicksand',
            //                     ),
            //                   ),
            //                   onPressed: () {
            //                     // BlocProvider.of<NavigationBloc>(context).add(
            //                     //     NavigationEvents.MyScheduleAppointmentClickedEvent);
            //                     Navigator.push(context, MaterialPageRoute(builder: (context) {
            //                       // setupSchedule();
            //                       return SchedulePage();
            //                     }));
            //                   },
            //                 ),
            //               ),
            //             ),
            //           ),
            //         ],
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
